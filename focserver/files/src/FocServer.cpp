/// \file  FocServer.cpp
/// \brief Implementation of the class FocServer.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <limits>		// std::numeric_limits
#include <stdexcept>	// std::runtime_error

#include <string>		// std::string
#include <stdio.h>		// sprintf
#include <string.h>
#include <errno.h>		// errno
#include <sys/stat.h>	// struct stat.
#include <sys/types.h>
#if !defined(DOXYGEN_SHOULD_SKIP_THIS)
#if !defined(__STDC_FORMAT_MACROS)
#define __STDC_FORMAT_MACROS
#endif /* !defined(__STDC_FORMAT_MACROS) */
#endif /* !defined(DOXYGEN_SHOULD_SKIP_THIS) */
#include <inttypes.h>		// PRId64, requires __STD_FORMAT_MACROS when using GCC.

#include <libwebsockets.h>

#include <smart/string.h>
#include <smart/time.h>

#include <json/writer.h>
#include <json/value.h>

#include "FocServer.h"			// ourselves.
#include "DeviceTreeDevice.h"	// Device Tree name resolving.
#include "Version.h"


using namespace smart;


static constexpr unsigned int	MAX_DECIMATION = 100u;

/// Default document root directory for the web server.
#define	DEFAULT_WWW_DIRECTORY	"/usr/share/focserver"

/// Name of the led status register.
#define	NAME_LEDS_STATUS_REG		"LEDs"

/// name of the fictive spread spectrum register.
#define	NAME_SPREAD_SPECTRUM_REG	"SpreadSpectrum"


/// Name of the capture command.
#define	COMMAND_CAPTURE		"Capture"

/// Name of the reset error command.
#define	COMMAND_RESET_ERROR	"ResetError"

/// Name of the error limit parameter register.
#define	COMMAND_ERROR_LIMIT	"ErrorLimit"

/// Command to query/set configuration.
#define	COMMAND_CONFIGURATION	"Configuration"


static const std::string	UNKNOWN_COMMAND("Error: Unknown command");
static const std::string	NOT_ENOUGH_ARGUMENTS("Error: Not enough arguments");
static const std::string	NOT_IMPLEMENTED_COMMAND("Error: Not implemented yet");
static const std::string	INTERNAL_ERROR("Error: Internal error");
static const std::string	NO_CAPTURE_DEVICE("Error: No capture device");
static const std::string	INVALID_ARGUMENT("Error: Invalid argument");
static const std::string	CAPTURE_IN_PROGRESS("Error: Capture already in progress");

static const char* const	adc_source_names[] = {
		"ADC",			// 0: DATASOURCE_ADC
		"IALPHABETA",	// 1: DATASOURCE_I_ALPHA_BETA
		"IDIQ",			// 2: DATASOURCE_I_D_Q
		"VDVQ",			// 3: DATASOURCE_V_D_Q
		"VALPHABETA",	// 4: DATASOURCE_V_ALPHA_BETA
		"VABC",			// 5: DATASOURCE_V_A_B_C
		"PWM",			// 6: DATASOURCE_PWM
		// "SPEED_VS"	not implemented
		nullptr
};

/// List of the protocols supported.
enum server_protocols {
	/* always first */
	PROTOCOL_HTTP = 0,

	/* FOC control protocol. */
	PROTOCOL_FOC,

	/* always last */
	PROTOCOL_COUNT
};


#if !defined(DOXYGEN_SHOULD_SKIP_THIS)
const struct lws_protocols	FocServer::_protocols[] = {
		/* first protocol must always be HTTP handler */
		{
			"http-only",		/* name */
			FocServer::callback_http,		/* callback */
			sizeof(FocServer::per_session_data__http),	/* per_session_data_size */
			0,			/* max frame size / rx buffer */
		},
		{
			"field-oriented-control",
			FocServer::callback_foc,
			sizeof(WebsocketBuffer),
			1024 * 1024,
		},
		{ NULL, NULL, 0, 0 } /* terminator */
};
#endif


// --------------------------------------------------------------------------------------------------------------------
FocServer::FocServer(std::shared_ptr<FocConfiguration> config)
:
 _device(config),
 _device_capture(hw::AxiDataCapture::openByName(hw::AxiDataCapture::DEFAULT_UIO_NAME)),
 _context(nullptr),
 _tick_counter(0),
 _capture_completed_us(0),
 _capture_sample_rate(0),
 _capture_nsamples(0),
 _test_mode(false),
 _www_directory(DEFAULT_WWW_DIRECTORY)
{
	_device.defaultInit();

	if (_device_capture) {
		lwsl_notice("Data capture: opened UIO device %s\n", hw::AxiDataCapture::DEFAULT_UIO_NAME);
	}
	else {
		lwsl_notice("Data capture: UIO device %s not found\n", hw::AxiDataCapture::DEFAULT_UIO_NAME);
	}

	struct lws_context_creation_info info = {};
	info.port = 80;
	info.protocols = _protocols;
	info.gid = -1;
	info.uid = -1;
	info.max_http_header_pool = 1;
	info.timeout_secs = 5;
	info.options = LWS_SERVER_OPTION_LIBUV;
	info.user = this;

	_context = lws_create_context(&info);
	if (_context == nullptr) {
		throw std::runtime_error("libwebsocket init failed");
	}

	if (lws_uv_initloop(_context, NULL, 0)) {
		throw std::runtime_error("lws_uv_initloop failed");
	}

	uv_timer_init(lws_uv_getloop(_context, 0), &_timeout_watcher);
	_timeout_watcher.data = this;
	uv_timer_start(&_timeout_watcher, timer_foc, 50, 50);
}

// --------------------------------------------------------------------------------------------------------------------
FocServer::~FocServer()
{
	if (_context != nullptr) {
		lws_context_destroy(_context);
	}
}

// --------------------------------------------------------------------------------------------------------------------
void FocServer::run()
{
	lws_libuv_run(_context, 0);
}

// --------------------------------------------------------------------------------------------------------------------
void FocServer::setTestMode(const bool pTestMode)
{
	_test_mode = pTestMode;
	_configuration_reply.clear();
}

// --------------------------------------------------------------------------------------------------------------------
void FocServer::setWwwDirectory(const std::string& newWwwDirectory)
{
	_www_directory = newWwwDirectory;
}

// --------------------------------------------------------------------------------------------------------------------
const std::string& FocServer::getWwwDirectory() const
{
	return _www_directory;
}

// --------------------------------------------------------------------------------------------------------------------
FocDevice*	FocServer::device()
{
	return &_device;
}

// --------------------------------------------------------------------------------------------------------------------
smart::hw::AxiDataCapture* FocServer::deviceCapture()
{
	return _device_capture.get();
}

// --------------------------------------------------------------------------------------------------------------------
void FocServer::processFocQuery(WebsocketBuffer* buffer, char* s, const size_t len)
{
	char* s2;
	char* s2_end = nullptr;
	char* s_state = nullptr;
	uint32_t val;

	_command_buffer = s;
	_response_buffer = s;

	s2 = strtok_r(s," ", &s_state);

	for (unsigned int i=0; _device.parameterRegisters[i].name!=nullptr; ++i) {
		const FocDevice::RegisterAccess*	ra = &_device.parameterRegisters[i];
		const int							name_length = strlen(ra->name);
		if (strcmp(ra->name, s) == 0) {
			s2 = strtok_r(nullptr, " ", &s_state);
			if (s2) {
		        uint32_t	val = strtol(s2, &s2_end, 10);
		        _device.writeParameter(ra->index, val);
		        buffer->writeMessage(_response_buffer);
			}
			else {
				buffer->writeMessage(NOT_ENOUGH_ARGUMENTS);
			}
	        return;
		}
		else if (strncmp(ra->name, s, name_length) == 0 && s[name_length]=='?' && s[name_length+1]==0) {
			_device.readParameterString(_response_buffer, i);
	        buffer->writeMessage(_response_buffer);
	        return;
		}
	}

	for (unsigned int i=0; _device.statusRegisters[i].name!=nullptr; ++i) {
		const FocDevice::RegisterAccess*	ra = &_device.statusRegisters[i];
		const int							name_length = strlen(ra->name);
		if (strncmp(ra->name, s, name_length) == 0 && s[name_length]=='?' && s[name_length+1]==0) {
			_device.readStatusString(_response_buffer, i);
	        buffer->writeMessage(_response_buffer);
	        return;
		}
	}

	if (strcmp(COMMAND_ERROR_LIMIT "?", s) == 0) {
		ssprintf(_response_buffer, COMMAND_ERROR_LIMIT " %u", _device.readErrorLimit());
        buffer->writeMessage(_response_buffer);
        return;
	}

	if (strcmp(COMMAND_ERROR_LIMIT, s) == 0) {
		s2 = strtok_r(nullptr, " ", &s_state);
		if (s2) {
	        uint32_t	val = strtol(s2, &s2_end, 10);
	        _device.writeErrorLimit(val);
	        buffer->writeMessage(_response_buffer);
		}
		else {
			buffer->writeMessage(NOT_ENOUGH_ARGUMENTS);
		}
		return;
	}

	if (strcmp(COMMAND_CAPTURE, s) == 0) {
		// Capture device?
		if (!_device_capture) {
	        buffer->writeMessage(NO_CAPTURE_DEVICE);
	        return;
		}

		if (_capture_completed_us != 0u) {
			buffer->writeMessage(CAPTURE_IN_PROGRESS);
			return;
		}

		// 1. arg: source
		s2 = strtok_r(nullptr, " ", &s_state);
		if (s2 == nullptr) {
			buffer->writeMessage(NOT_ENOUGH_ARGUMENTS);
			return;
		}
		constexpr unsigned int	UNKNOWN_SOURCE_INDEX = std::numeric_limits<unsigned int>::max();
		unsigned int			source_index = UNKNOWN_SOURCE_INDEX;
		for (unsigned int i=0; adc_source_names[i]!=nullptr; ++i) {
			if (strcasecmp(adc_source_names[i], s2) == 0) {
				_capture_name = adc_source_names[i];
				source_index = i;
				break;
			}
		}
		if (source_index == UNKNOWN_SOURCE_INDEX) {
			buffer->writeMessage(INVALID_ARGUMENT);
			return;
		}

		// 2. arg: number of samples
		const char*	s3 = strtok_r(nullptr, " ", &s_state);
		if (s3 == nullptr) {
			buffer->writeMessage(NOT_ENOUGH_ARGUMENTS);
			return;
		}
		unsigned int	nsamples = 0;
		if (!uint_of(s3, nsamples)) {
			buffer->writeMessage(INVALID_ARGUMENT);
			return;
		}
		const unsigned int	transfer_size = nsamples * ((_device_capture->nchannels * _device_capture->sample_width) / 8u);
		smart::MappedFile*	buffer_capture = _device_capture->buffer;
		if (nsamples > buffer_capture->size() || transfer_size > buffer_capture->size()) {
			buffer->writeMessage(INVALID_ARGUMENT);
			return;
		}

		// 3. arg: decimation, optional.
		unsigned int	decimation_factor = 0;
		const char* s4 = strtok_r(nullptr, " ", &s_state);
		if (s4 != nullptr) {
			if (!uint_of(s4, decimation_factor) || decimation_factor>MAX_DECIMATION) {
				buffer->writeMessage(INVALID_ARGUMENT);
				return;
			}
		}

		_device.writeDecimate(decimation_factor);
		_device.writeCaptureSource(source_index);
		const uint64_t	capture_us = _device_capture->startCapture(transfer_size);
		buffer->writeMessage(NOT_IMPLEMENTED_COMMAND);
		_capture_completed_us = time_us() + capture_us;
		_capture_sample_rate = _device_capture->sample_rate / (decimation_factor + 1u);
		_capture_nsamples = nsamples;
        return;
	}

	if (strcmp(COMMAND_CONFIGURATION "?", s) == 0) {
		if (_configuration_reply.size() == 0u) {
			Json::FastWriter			json_writer;
			json_writer.dropNullPlaceholders();

			Json::Value	root;
			root["design"] = _device.designName;
			root["focserver"] = Version::FOCSERVER_DATE;
			if (_device_capture) {
				root["samplerate"] = _device_capture->sample_rate;
			}
			root["testmode"] = _test_mode;
			const std::shared_ptr<FocConfiguration>&		config = _device.config;
			if (config) {
				root["ppr"] = config->ppr;
				root["adc2A"] = config->adc2A;
				root["pwm2V"] = config->pwm2V;
			}

			_configuration_reply = COMMAND_CONFIGURATION;
			_configuration_reply += ' ';
			_configuration_reply += json_writer.write(root);
		}
		buffer->writeMessage(_configuration_reply);
		return;
	}

	if (strcmp(NAME_LEDS_STATUS_REG, s) == 0) {
		// FIXME: do what?
        buffer->writeMessage(NOT_IMPLEMENTED_COMMAND);
		return;
	}

	if (strcmp(NAME_LEDS_STATUS_REG "?", s) == 0) {
		unsigned int	led_state = _device.readLeds();
		ssprintf(_response_buffer, NAME_LEDS_STATUS_REG " %u", led_state);
        buffer->writeMessage(_response_buffer);
        return;
	}

	if (strcmp(NAME_SPREAD_SPECTRUM_REG, s) == 0) {
        s2 = strtok_r(NULL, " ", &s_state);
        if (s2) {
        	unsigned int	spread_spectrum = 0;
        	if (uint_of(s2, spread_spectrum)) {
        		_device.writeSpreadSpectrum(spread_spectrum != 0u);
    			buffer->writeMessage(_response_buffer);
        	}
        	else {
    			buffer->writeMessage(INVALID_ARGUMENT);
        	}
        }
        else {
			buffer->writeMessage(NOT_ENOUGH_ARGUMENTS);
        }
        return;
	}

	if (strcmp(NAME_SPREAD_SPECTRUM_REG "?", s) == 0) {
		unsigned int	spread_spectrum = _device.readSpreadSpectrum();
		ssprintf(_response_buffer, NAME_SPREAD_SPECTRUM_REG " %u", spread_spectrum);
		buffer->writeMessage(_response_buffer);
		return;
	}

    if (strcmp("Motor", s) == 0) {
        s2 = strtok_r(NULL, " ", &s_state);
        if (s2) {
			val = strtol(s2, &s2_end, 10);
			if (val) {
				_device.startMotor(val, _device_capture.get());
			}
			else {
				_device.stopMotor();
			}

			buffer->writeMessage(_response_buffer);
        }
        else {
			buffer->writeMessage(NOT_ENOUGH_ARGUMENTS);
        }
        return;
    }

    if (strcmp(COMMAND_RESET_ERROR, s) == 0) {
    	_device.resetError();
    	buffer->writeMessage(_response_buffer);
    	return;
    }

    // We only get here when there is an error.
	lwsl_notice("Unknown command: %s\n", _command_buffer.c_str());
	buffer->writeMessage(UNKNOWN_COMMAND);
}

// --------------------------------------------------------------------------------------------------------------------
static const char*	mimetypes[]
{
	"bin",		"application/octet-stream",
	"css",		"text/css",
	"html",		"text/html",
	"ico",		"image/x-icon",
	"js",		"text/javascript",
	"png",		"image/png",
	"ttf",		"application/x-font-truetype",
	"wav",		"audio/wav",
	"woff",		"application/font-woff",
	nullptr,	nullptr
};

// --------------------------------------------------------------------------------------------------------------------
/// Find the correct MIME-type.
static const char*
get_mimetype(const std::string&	file)
{
	const std::string::size_type	dotpos = file.rfind('.');
	if (dotpos != std::string::npos) {
		const std::string	ext(file.substr(dotpos + 1));
		for (const char** ptr = mimetypes; *ptr != nullptr; ptr += 2) {
			if (ext == ptr[0]) {
				return ptr[1];
			}
		}
	}
	return nullptr;
}

// --------------------------------------------------------------------------------------------------------------------
/* this protocol server (always the first one) just knows how to do HTTP */
int FocServer::callback_http(
	struct lws *wsi,
	enum lws_callback_reasons reason,
	void *user,
	void *in,
	size_t len)
{
	struct lws_context *context = lws_get_context(wsi);
	auto server = reinterpret_cast<FocServer*>(lws_context_user(context));
	int n, m;
	char *other_headers;
	struct per_session_data__http *pss = (struct per_session_data__http *)user;
	const char *mimetype;
	const char*	s_in = (const char*)in;

	switch (reason) {
	case LWS_CALLBACK_HTTP:
		{
			if (len < 1) {
				lws_return_http_status(wsi, HTTP_STATUS_BAD_REQUEST, NULL);
				return -1;
			}

			/* if a legal POST URL, let it continue and accept data */
			if (lws_hdr_total_length(wsi, WSI_TOKEN_POST_URI)) {
				return 0;
			}

			/* send a file the easy way */
			const char*	dotdotpos = strstr(s_in + 1, "..");
			std::string full_path;
			if (dotdotpos == nullptr) {
				full_path += server->_www_directory;
				if (len>0 && s_in[0] != '/') {
					full_path += '/';
				}
				full_path += std::string(s_in, s_in + len);
				if (full_path.size() > 0 && full_path[full_path.size() - 1] == '/') {
					full_path += "index.html";
				}
			} else {
				lwsl_err("Denying possible directory traversal request: %s\n", s_in);
				lws_return_http_status(wsi, HTTP_STATUS_NOT_FOUND, NULL);
				return 0;
			}

			/* refuse to serve files we don't understand */
			mimetype = get_mimetype(full_path);
			if (!mimetype) {
				lwsl_err("Unknown mimetype for %s\n", full_path.c_str());
				lws_return_http_status(wsi, HTTP_STATUS_UNSUPPORTED_MEDIA_TYPE, NULL);
				return -1;
			}

			other_headers = NULL;
			int other_headers_length = 0;

			const int r_serve = lws_serve_http_file(wsi, full_path.c_str(), mimetype, other_headers, other_headers_length);
			if (r_serve<0 || ((r_serve>0) && lws_http_transaction_completed(wsi))) {
				/* through completion or error, close the socket */
				return -1;
			}

			// Set the timeout depending on the file size.
			int content_timeout_sec = 30; // minimum 60 seconds.
			struct stat file_stats;
			if (stat(full_path.c_str(), &file_stats)==0) {
				content_timeout_sec += file_stats.st_size / (32 *  1024);
			}
			lws_set_timeout(wsi, PENDING_TIMEOUT_HTTP_CONTENT, content_timeout_sec);

			/*
			* notice that the sending of the file completes asynchronously,
			* we'll get a LWS_CALLBACK_HTTP_FILE_COMPLETION callback when
			* it's done
			*/
		}
		break;
	case LWS_CALLBACK_HTTP_BODY:
		lwsl_notice("LWS_CALLBACK_HTTP_BODY: len %d\n", (int)len);
		break;

	case LWS_CALLBACK_HTTP_BODY_COMPLETION:
		lwsl_notice("LWS_CALLBACK_HTTP_BODY_COMPLETION\n");
		/* the whole of the sent body arried, close the connection */
		lws_return_http_status(wsi, HTTP_STATUS_OK, NULL);

		goto try_to_reuse;

	case LWS_CALLBACK_HTTP_FILE_COMPLETION:
		//		lwsl_info("LWS_CALLBACK_HTTP_FILE_COMPLETION seen\n");
		/* kill the connection after we sent one file */
		goto try_to_reuse;

	case LWS_CALLBACK_HTTP_WRITEABLE:
		/*
		 * we can send more of whatever it is we were sending
		 */
		do {
			/* we'd like the send this much */
			n = sizeof(pss->buffer) - LWS_SEND_BUFFER_PRE_PADDING;

			/* but if the peer told us he wants less, we can adapt */
			m = lws_get_peer_write_allowance(wsi);

			/* -1 means not using a protocol that has this info */
			if (m == 0) {
				/* right now, peer can't handle anything */
				goto later;
			}

			if (m != -1 && m < n)
				/* he couldn't handle that much */
				n = m;

			n = read(pss->fd, pss->buffer + LWS_SEND_BUFFER_PRE_PADDING,
									n);
			/* problem reading, close conn */
			if (n < 0) {
				goto bail;
			}

			/* sent it all, close conn */
			if (n == 0) {
				goto flush_bail;
			}

			/*
			 * To support HTTP2, must take care about preamble space
			 *
			 * identification of when we send the last payload frame
			 * is handled by the library itself if you sent a
			 * content-length header
			 */
			m = lws_write(wsi, pss->buffer + LWS_SEND_BUFFER_PRE_PADDING,
					       n, LWS_WRITE_HTTP);
			if (m < 0) {
				/* write failed, close conn */
				goto bail;
			}

			// clear any timeouts.
			lws_set_timeout(wsi, PENDING_TIMEOUT_HTTP_CONTENT, 360);

			/*
			 * http2 won't do this
			 */
			if (m != n)
				/* partial write, adjust */
				if (lseek(pss->fd, m - n, SEEK_CUR) < 0) {
					goto bail;
				}

			if (m) {
				/* while still active, extend timeout */
				lws_set_timeout(wsi, PENDING_TIMEOUT_HTTP_CONTENT, 5);
			}

			/* if we have indigestion, let him clear it before eating more */
			if (lws_partial_buffered(wsi))
				break;

		} while (!lws_send_pipe_choked(wsi));

later:
		lws_callback_on_writable(wsi);
		break;
flush_bail:
		/* true if still partial pending */
		if (lws_partial_buffered(wsi)) {
			lws_callback_on_writable(wsi);
			break;
		}
		close(pss->fd);
		goto try_to_reuse;

bail:
		close(pss->fd);
		return -1;

	default:
		// Default to returning 0 when the message was not handled.
		return 0;
	}

	return 0;

try_to_reuse:
	if (lws_http_transaction_completed(wsi)) {
		return -1;
	}
	return 0;

}

// --------------------------------------------------------------------------------------------------------------------
int FocServer::callback_foc(
	struct lws*					wsi,
	enum lws_callback_reasons	reason,
	void*						user,
	void*						in,
	size_t						len)
{
	auto	context = lws_get_context(wsi);
	auto	server = reinterpret_cast<FocServer*>(lws_context_user(context));
	auto	wb = reinterpret_cast<WebsocketBuffer*>(user);

	switch (reason) {

	case LWS_CALLBACK_ESTABLISHED:
		lwsl_notice("Client: connected.\n");
		server->_connections.push_front(new (wb)WebsocketBuffer(wsi));
		break;

	case LWS_CALLBACK_CLOSED:
		//
		lwsl_notice("Client: disconnected.\n");
		server->_connections.remove(wb);
		wb->~WebsocketBuffer();
		break;

	case LWS_CALLBACK_SERVER_WRITEABLE:
		wb->onWriteable();
		break;

	case LWS_CALLBACK_RECEIVE:
		try {
			server->processFocQuery(wb, (char*)in, len);
		}
		catch (const std::exception& ex) {
			lwsl_notice("Exception: %s\n", ex.what());
			wb->writeMessage(INTERNAL_ERROR);
		}
		break;

	default:
		break;
	}

	return 0;
}

// --------------------------------------------------------------------------------------------------------------------
void FocServer::timer_foc(uv_timer_t *w)
{
	auto self = reinterpret_cast<FocServer*>(w->data);

	const uint32_t	cnt = self->_tick_counter;
	if ((cnt & 0x7) == 0) {
		self->_device.writeLeds((cnt & 0x10)==0 ? std::numeric_limits<uint32_t>::max() : 0);
	}
	self->_tick_counter = cnt + 1;

	// Capture completed?
	auto&	dev_cap = self->_device_capture;
	if (dev_cap && self->_capture_completed_us!=0 && !dev_cap->isCaptureInProgress()) {
		struct BinaryHeader	bh = {
				static_cast<uint16_t>(dev_cap->nchannels),
				static_cast<uint16_t>(self->_capture_nsamples),
				static_cast<uint32_t>(self->_capture_sample_rate),
				{ 0 } };
		strcpy(reinterpret_cast<char*>(bh.name), self->_capture_name.c_str());

		smart::MappedFile*	buf_cap = dev_cap->buffer;
		const unsigned int	transfer_size = self->_capture_nsamples * ((dev_cap->nchannels * dev_cap->sample_width)/8u);

		// Broadcast the captured data to everybody.
		for (WebsocketBuffer* wb : self->_connections) {
			wb->writeBinary(&bh, sizeof(bh), buf_cap->data(), transfer_size, nullptr);
		}

		self->_capture_completed_us = 0u;
	}
}

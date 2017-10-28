/*
The 3-Clause BSD License

SPDX short identifier: BSD-3-Clause

Copyright 2016-2017 Trenz Electronic GmbH

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/// \file	FocServer.h
/// \brief	Interface of the class FocServer.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <list>			// std::list
#include <memory>		// std::shared_ptr
#include <string>		// std::string

#include <stdint.h>		// uint64_t, uint32_t, etc.

#include <libwebsockets.h>
#include <uv.h>

#include <smart/hw/AxiDataCapture.h>

#include "FocConfiguration.h"
#include "FocDevice.h"
#include "WebsocketBuffer.h"

/// FOC server implementing the <em>Network API</em> and a web server,
/// which permits control and monitor of the FOC system from the Web UI.
///
/// Example code:
/// @code
///	FocServer	server;
///
///	server.run();
/// @endcode
class FocServer {
public:
	/// Create new FOC server object.
	FocServer(std::shared_ptr<FocConfiguration> config);
	/// Destruct server object.
	~FocServer();

	/// Run the server until either stopped by a signal or by closing the underlying event loop.
	void run();

	/// Set or reset the test mode flag.
	/// \param pTestMode	New test mode flag.
	void setTestMode(const bool pTestMode);

	/// Set the new document root directory for the web server.
	/// \param newWebDirectory	New document root directory to serve files from.
	void setWwwDirectory(const std::string& newWebDirectory);

	/// Get the docuemnt root directory of the web server.
	const std::string& getWwwDirectory() const;

	/// Access to the underlying FOC device.
	/// \return
	FocDevice*	device();

	/// Access to the underlying data capture device.
	smart::hw::AxiDataCapture* deviceCapture();

	/// Size of the header, in bytes.
	static constexpr unsigned int	BINARY_HEADER_SIZE = 32u;

#pragma pack(push, 1)
	/// Layout of the binary header.
	struct BinaryHeader {
		/// Bytes 0..1: Number of channels.
		uint16_t	nchannels;
		/// Bytes 2..3: Number of samples.
		uint16_t	nsamples;
		/// Bytes 4..7: Sample rate.
		uint32_t	sample_rate;
		/// Name of the data.
		uint8_t		name[BINARY_HEADER_SIZE - 2u - 2u - 4u];
	};
#pragma pack(pop)

private:
#if !defined(DOXYGEN_SHOULD_SKIP_THIS)
	// This will make doxygen think that _protocols is a parent class for FocServer.
	// That's why it is disabled.
	static const struct lws_protocols	_protocols[];
#endif
	FocDevice								_device;
	std::shared_ptr<smart::hw::AxiDataCapture>	_device_capture;
	struct lws_context*						_context;
	std::list<WebsocketBuffer*>				_connections;
	uv_timer_t								_timeout_watcher;
	std::string								_command_buffer;
	std::string								_response_buffer;
	unsigned int							_tick_counter;
	/// Time when capture was started. Null when no capture in progress.
	uint64_t								_capture_completed_us;
	unsigned int							_capture_sample_rate;
	unsigned int							_capture_nsamples;
	std::string								_capture_name;
	std::string								_configuration_reply;
	bool									_test_mode;
	std::string								_www_directory;

	struct per_session_data__http {
		unsigned char buffer[4096];
		int fd;
	};

	/// Process the query sent by Web UI.
	void processFocQuery(WebsocketBuffer* buffer, char* s, const size_t len);

	/// Process the HTTP request sent by Web UI.
	static int callback_http(
		struct lws*					wsi,
		enum lws_callback_reasons	reason,
		void*						user,
		void*						in,
		size_t						len);

	/// Low-level processing of Websocket requests.
	static int callback_foc(
		struct lws*					wsi,
		enum lws_callback_reasons	reason,
		void*						user,
		void*						in,
		size_t						len);

	/// Timer callback running every 50 milliseconds.
	static void timer_foc(uv_timer_t *w);
};

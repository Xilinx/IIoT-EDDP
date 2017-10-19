/// \file  focserver_main.cpp
/// \brief Implementation of the function focserver_main.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include "focserver_main.h"

#include <memory>		// std::shared_ptr
#include <stdexcept>	// std::exception
#include <string>		// std::string

#include <getopt.h>
#include <inttypes.h>	// PRIuPTR
#include <stdlib.h>
#include <string.h>		// strchr, stricmp
#include <syslog.h>
#include <sys/time.h>
#include <unistd.h>

#include <uv.h>
#include <libwebsockets.h>

#include <smart/File.h>
#include <smart/string.h>
#include <smart/time.h>
#include <smart/WavFormat.h>
#include <smart/hw/AxiDataCapture.h>

#include "FocConfiguration.h"
#include "DeviceTreeDevice.h"
#include "FocDevice.h"
#include "FocServer.h"
#include "Version.h"

#include "foc.h"


using namespace smart;

/// List of the command line options.
static struct option options[] = {
    { "capture",	required_argument,	nullptr, 'c' },
	{ "config",		required_argument,	nullptr, 'f' },
	{ "daemonize", 	no_argument,		nullptr, 'D' },
	{ "debug",		required_argument,	nullptr, 'd' },
	{ "help",		no_argument,		nullptr, 'h' },
	{ "print",		no_argument,		nullptr, 'p' },
	{ "start",		optional_argument,	nullptr, 's' },
	{ "test",		no_argument,		nullptr, 't' },
	{ "version",	no_argument,		nullptr, 'v' },
	{ "write",		required_argument,	nullptr, 'w' },
	{ "www",		required_argument,	nullptr, 'W' },
	{ NULL, 0, 0, 0 }
};

// --------------------------------------------------------------------------------------------------------------------
/// Insert spaces into the parameter "s" such that the second and third column will start at the specified position.
static void tabulate2(std::string& s, const unsigned int c1pos, const unsigned int c2pos)
{
	std::string		r;
	unsigned int	space_count = 0;

	for (unsigned int i=0; i<s.size(); ++i) {
		const char	c = s[i];
		if (c == ' ') {
			switch (space_count) {
			case 0u:
				++space_count;
				while (r.size() < c1pos) {
					r += ' ';
				}
				break;
			case 1u:
				++space_count;
				while (r.size() < c2pos) {
					r += ' ';
				}
				break;
			default:
				r += ' ';
			}
		}
		else {
			r += c;
		}
	}

	s = r;
}

// --------------------------------------------------------------------------------------------------------------------
/// Print all FOC registers.
static void print_registers()
{
	std::string			tmp;
	const unsigned int	TAB_1_POS = 15;
	const unsigned int	TAB_2_POS = 25;

	FocDevice	dev;
	printf("FOC design: %s\n", dev.designName);
	printf("\n");

	printf("Status       | Value   | Raw\n");
	printf("-------------+---------+---------\n");
	for (unsigned int i=0; i<dev.statusCount; ++i) {
		dev.readStatusString(tmp, i);
		tabulate2(tmp, TAB_1_POS, TAB_2_POS);
		printf("%s\n", tmp.c_str());
	}
	printf("\n");

	printf("Parameter    | Value   | Raw\n");
	printf("-------------+---------+---------\n");
	for (unsigned int i=0; i<dev.parameterCount && i<FocDevice::PSEUDO_PARAMETER_OFFSET; ++i) {
		dev.readParameterString(tmp, i);
		tabulate2(tmp, TAB_1_POS, TAB_2_POS);
		printf("%s\n", tmp.c_str());
	}

	printf("\n");
	printf("PseudoParam  | Value   | Raw\n");
	printf("-------------+---------+---------\n");
	for (unsigned int i=FocDevice::PSEUDO_PARAMETER_OFFSET; i<dev.parameterCount; ++i) {
		dev.readParameterString(tmp, i);
		tabulate2(tmp, TAB_1_POS, TAB_2_POS);
		printf("%s\n", tmp.c_str());
	}
	printf("\n");
}

// --------------------------------------------------------------------------------------------------------------------
/// Write one FOC register.
static int write_register(std::unique_ptr<FocDevice>& dev, char* arg)
{
	printf("FOC SET REGISTER: %s\n", arg);

	char*	eq_pos = strchr(arg, '=');
	if (eq_pos == nullptr) {
		fprintf(stderr, "Error: Missing the '=' separating the register name and the argument.\n");
		return 1;
	}
	*eq_pos = 0;

	if (!dev) {
		dev = std::unique_ptr<FocDevice>(new FocDevice());
		printf("FOC design: %s\n", dev->designName);
	}
	for (unsigned int i=0; i<dev->parameterCount; ++i) {
		const FocDevice::RegisterAccess*	ra = &dev->parameterRegisters[i];
		if (strcasecmp(ra->name, arg) == 0) {
			const char*		s_val = eq_pos + 1;
			int				i_val = 0;

			if (int_of(s_val, i_val)) {
				dev->writeParameter(i, i_val);
			}
			else {
				fprintf(stderr, "Write register: '%s' is not an integer.\n", s_val);
				return 1;
			}
			return 0;
		}
	}
	fprintf(stderr, "Error: Unknown register '%s'\n", arg);
	return 1;
}

// --------------------------------------------------------------------------------------------------------------------
static int capture(std::unique_ptr<hw::AxiDataCapture>& dev, char* filename)
{
	printf("Capture: %s\n", filename);
	if (!dev) {
		dev = std::unique_ptr<hw::AxiDataCapture>(new hw::AxiDataCapture(hw::AxiDataCapture::DEFAULT_UIO_NAME));
	}

	MappedFile*	buffer = dev->buffer;
	dev->startCapture(buffer->size());

	const uint64_t	t0 = time_us();
	do {
		msleep(10);
	} while (dev->isCaptureInProgress());
	const uint64_t		dt_us = time_us() - t0;
	const unsigned int	nsamples = buffer->size() / ((dev->sample_width * dev->nchannels) / 8);
	const unsigned int	sample_rate = (1000000ULL * nsamples) / dt_us;
	printf("Capture time: %u ms\n", static_cast<unsigned int>(dt_us / 1000u));
	printf("Sample count: %u\n", nsamples);
	printf("Sample rate:  %u samples/sec\n", sample_rate);

	smart::WavFormat::writeFile(filename, dev->nchannels, dev->sample_width, dev->sample_rate, buffer->data(), buffer->size());
	return 0;
}

// --------------------------------------------------------------------------------------------------------------------
/// Print short usage instructions.
static void print_usage()
{
	fprintf(stderr, "Usage: focserver [-c filename] [-D] [-d <log bitfield>] [-f filepath] [-h]\n");
	fprintf(stderr, "                  [-p] [-s[speed]] [-t] [-v] [-w reg=val] [-W www-directory]\n");
	fprintf(stderr, "where\n");
	fprintf(stderr, "  -c filename   Capture ADC data and write it to a file.\n");
	fprintf(stderr, "  -D            Daemonize.\n");
	fprintf(stderr, "  -d bitfield   Set Libwebsocket debug log bitfield.\n");
	fprintf(stderr, "  -f filepath   Read configuration file from the given filepath.\n");
	fprintf(stderr, "  -h            Show this text.\n");
	fprintf(stderr, "  -p            Print register dump, don't start the server.\n");
	fprintf(stderr, "  -s[speed]     Start the motor at the given speed.\n");
	fprintf(stderr, "  -t            Flag to indicate that we are running in TEST mode.\n");
	fprintf(stderr, "  -v            Print version information and exit.\n");
	fprintf(stderr, "  -w reg=val    Write the value to the register, don't start the server.\n");
	fprintf(stderr, "  -W directory  Specify the document root directory for the web server to use.\n");
}

// --------------------------------------------------------------------------------------------------------------------
int focserver_main(int argc, char *argv[])
{
	int debug_level = 7;
	int n = 0;
	int syslog_options = LOG_PID | LOG_PERROR;
	bool daemonize = false;
	bool start_motor = false;
	std::unique_ptr<int>					start_motor_speed;
	std::unique_ptr<FocDevice>				write_device;
	std::unique_ptr<hw::AxiDataCapture>		capture_device;
	std::shared_ptr<FocConfiguration>		configuration;
	/// Result of the write or capture operation.
	int										op_result = 0;
	bool									test_mode = false;
	const char*								www_directory = nullptr;

	try {
		while (n >= 0) {
			n = getopt_long(argc, argv, "c:d:f:Dhps::tvw:W:", options, NULL);
			if (n < 0)
				continue;
			switch (n) {
			case 'c':
				op_result = capture(capture_device, optarg);
				if (op_result != 0) {
					return op_result;
				}
				break;
			case 'D':
				daemonize = true;
				syslog_options &= ~LOG_PERROR;
				break;
			case 'd':
				debug_level = atoi(optarg);
				break;
			case 'f':
				configuration = FocConfiguration::fromFile(optarg);
				if (configuration) {
					configuration->dump();
				}
				else {
					lwsl_notice("Error: configuration file %s not found\n", optarg);
					return 1;
				}
				break;
			case 'h':
				print_usage();
				exit(1);
			case 'p':
				print_registers();
				return 0;
			case 's':
				if (optarg != nullptr) {
					int	x = 0;
					if (int_of(optarg, x)) {
						start_motor_speed = std::unique_ptr<int>(new int(x));
					}
				}
				start_motor = true;
				break;
			case 't':
				test_mode = true;
				break;
			case 'v':
				printf("Version: %s\n", Version::FOCSERVER_DATE);
				return 0;
			case 'w':
				op_result = write_register(write_device, optarg);
				if (op_result != 0) {
					return op_result;
				}
				break;
			case 'W':
				www_directory = optarg;
				break;
			}
		}

		if (!start_motor && !daemonize && (write_device || capture_device)) {
			return op_result;
		}

		/*
		 * normally lock path would be /var/lock/lwsts or similar, to
		 * simplify getting started without having to take care about
		 * permissions or running as root, set to /tmp/.lwsts-lockc
		 */
		if (daemonize && lws_daemonize("/tmp/.lwsts-lock")) {
			fprintf(stderr, "Failed to daemonize\n");
			return 1;
		}

		/* we will only try to log things according to our debug_level */
		setlogmask(LOG_UPTO (LOG_DEBUG));
		openlog("lwsts", syslog_options, LOG_DAEMON);

		/* tell the library what debug level to emit and to send it to syslog */
		lws_set_log_level(debug_level, lwsl_emit_syslog);

		lwsl_notice("FOC webserver.\n");

		if (!configuration && File::exists(FocConfiguration::FILENAME)) {
			configuration = FocConfiguration::fromFile(FocConfiguration::FILENAME);
		}
		if (!configuration) {
			lwsl_notice("Configuration file %s not found\n", FocConfiguration::FILENAME);
		}
		FocServer					server(configuration);
		FocDevice*					dev = server.device();
		smart::hw::AxiDataCapture*	devcap = server.deviceCapture();

		server.setTestMode(test_mode);
		if (www_directory != nullptr) {
			server.setWwwDirectory(www_directory);
		}
		lwsl_notice("focserver version: %s\n", Version::FOCSERVER_DATE);
		lwsl_notice("FOC design:        %s\n", dev->designName);
		lwsl_notice("FOC IP core base address: 0x%08" PRIxPTR "\n", dev->getBaseAddress());
		lwsl_notice("WWW server directory:     %s\n", server.getWwwDirectory().c_str());
		lwsl_notice("Test mode:  %s\n", test_mode ? "true" : "false");

		if (start_motor) {
			if (start_motor_speed) {
				dev->writeParameter(RPM_SP_REG, (uint32_t)*start_motor_speed);
			}
			lwsl_notice("Starting the motor at speed %d RPM.\n", (int32_t)dev->readParameter(RPM_SP_REG));
			dev->startMotor(MODE_SPEED, devcap);
		}
		server.run();

		lwsl_notice("Exited cleanly\n");
	} catch (const std::exception& ex) {
		printf("Error: %s\n", ex.what());
		return 2;
	}
	return 0;
}


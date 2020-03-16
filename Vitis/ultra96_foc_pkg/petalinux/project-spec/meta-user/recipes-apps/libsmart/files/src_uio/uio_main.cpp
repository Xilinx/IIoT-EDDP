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
/// \file	main.cpp
/// \brief	Main function of the program "uio" providing access to the UIO (Userspace I/O) devices.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <exception>	// std::exception

#include <stdbool.h>	// uio
#include <stdio.h>		// printf
#include <string.h>		// string
#include <unistd.h>		// sysconf


#include <smart/File.h>
#include <smart/hw/AxiDataCapture.h>
#include <smart/string.h>
#include <smart/time.h>
#include <smart/UioDevice.h>
#include <smart/WavFormat.h>


using namespace smart;

// --------------------------------------------------------------------------
static void _print_usage()
{
	printf("Usage: uio COMMAND\n");
	printf("where possible commands are\n");
	printf("    capture uioname filepath         Capture data from the AXI-Data-Capture IP core and write it as a WAV file\n");
	printf("    dump device map filepath         Dump the memory area\n");
	printf("    fill device map 32-bit-value     Fill the memory area with 32-bit value\n");
}

// --------------------------------------------------------------------------
// device map filename
static int uio_dump(const unsigned int device_index, const unsigned int map_index, const char* filename)
{
	UioDevice	uio(device_index);

	if (uio.maps.size() <= map_index) {
		printf("uio dump: Map index %u invalid, there are only %zu maps available.\n", map_index, uio.maps.size());
		return 1;
	}

	MappedFile*		map = uio.maps[map_index].map;

	FILE*	f = fopen(filename, "wb");
	if (f == nullptr) {
		printf("Cannot open file '%s' for writing.\n", filename);
		return 1;
	} else {
		printf("Writing file '%s'.\n", filename);
		const int	r_write = fwrite(map->data(), 1, map->size(), f);
		if (r_write != static_cast<int>(map->size())) {
			printf("Cannot write: fwrite returned %d, errno=%d\n", r_write, errno);
			return 1;
		}
		printf("Wrote %zu bytes.\n", map->size());
	}
	return 0;
}

// --------------------------------------------------------------------------
static int uio_fill(const unsigned int device_index, const unsigned int map_index, const uint32_t value)
{
	UioDevice	uio(device_index);

	if (uio.maps.size() <= map_index) {
		printf("uio dump: Map index %u invalid, there are only %zu maps available.\n", map_index, uio.maps.size());
		return 1;
	}

	MappedFile*		map = uio.maps[map_index].map;
	const unsigned int	size = map->size32();

	for (unsigned int i=0; i<size; ++i) {
		map->write32(i, value);
	}

	return 0;
}

// --------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------
static int capture(const char* uio_name, char* filename)
{
	printf("Capture device:   %s\n", uio_name);
	printf("Capture filename: %s\n", filename);
	hw::AxiDataCapture	dev(uio_name);

	MappedFile*	buffer = dev.buffer;
	dev.startCapture(buffer->size());

	const uint64_t	t0 = time_us();
	do {
		msleep(10);
	} while (dev.isCaptureInProgress());
	const uint64_t		dt_us = time_us() - t0;
	const unsigned int	nsamples = buffer->size() / ((dev.sample_width * dev.nchannels) / 8);
	const unsigned int	sample_rate = (1000000ULL * nsamples) / dt_us;
	printf("Capture time: %u ms\n", static_cast<unsigned int>(dt_us / 1000u));
	printf("Sample count: %u\n", nsamples);
	printf("Measured sample rate:  %u samples/sec\n", sample_rate);

	smart::WavFormat::writeFile(filename, dev.nchannels, dev.sample_width, dev.sample_rate, buffer->data(), buffer->size());
	return 0;
}

// --------------------------------------------------------------------------
int main(int argc, char** argv)
{
	const char*	cmd_name;

	if (argc < 2) {
		printf("Not enough arguments.\n");
		_print_usage();
		return 1;
	}

	try {
		cmd_name =  argv[1];
		if (strcmp(cmd_name, "dump") == 0) {
			if (argc<5) {
				printf("Not enough arguments.");
				_print_usage();
				return 1;
			}
			const unsigned int	device_index = uint_of(argv[2]);
			const unsigned int	map_index = uint_of(argv[3]);
			const char*			filename = argv[4];

			const int r = uio_dump(device_index, map_index, filename);
			if (r) {
				_print_usage();
			}
			return r;
		}
		else if (strcmp(cmd_name, "fill") == 0) {
			if (argc<5) {
				printf("Not enough arguments.");
				_print_usage();
				return 1;
			}
			const unsigned int	device_index = uint_of(argv[2]);
			const unsigned int	map_index = uint_of(argv[3]);
			const uint32_t		value = uint_of(argv[4]);

			const int r = uio_fill(device_index, map_index, value);
			if (r) {
				_print_usage();
			}
			return r;
		}
		else if (strcmp(cmd_name, "capture") == 0) {
			if (argc < 4) {
				printf("Not enough arguments.");
				_print_usage();
				return 1;
			}
			capture(argv[2], argv[3]);
		}
		else {
			printf("Unknown command '%s'.\n", cmd_name);
			_print_usage();
			return 2;
		}
	} catch (const std::exception& ex) {
		printf("Error: %s\n", ex.what());
	}

    return 0;
}

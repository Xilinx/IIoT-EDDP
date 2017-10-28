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
/// \file main.cpp
/// \brief Implementation of the main function.
/// This file contains the Field-Oriented Control system implementation.
///
/// Important: Add library "dl" to the linker flags!
/// In Xilinx SDx: Right click on the project -> C/C++ Build Settings -> SDS++ Linker -> Libraries
///
/// \author 		Oleksandr Kiyenko
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <dlfcn.h>
#include <stdio.h>
#include <unistd.h>

#include "sds_lib.h"
#include "arty_z7_10_foc.h"
#include "foc.h"


/// Open dynamic library.
/// \param so_path Path to the dynamic library to be opened.
/// \return Handle to the library opened. This is to be closed with dlclose.
void* dlopen_or_fail(const char* so_path)
{
	dlerror();    /* Clear any existing error */
	printf("opening %s ...", so_path);
	fflush(stdout);

	void* handle = dlopen(so_path, RTLD_LAZY | RTLD_GLOBAL);
	if (!handle) {
		printf(" failed.\n");
		printf("dlopen: %s\n", dlerror());
		exit(EXIT_FAILURE);
		return nullptr;
	}

	printf(" success.\n");
	return handle;
}

/// \brief The main function of an SDSoC project, that defines the field-oriented control (FOC) application.
int main(int argc, char* argv[])
{
	long long int rbuf[1];	// Variable for input stream data 
	long long int pbuf[1];	// Variable for output stream data 
	long long int cbuf[1];	// Variable for capture stream data
	int args[ARGS_SIZE];		// Function paramethers array
	int status[STATUS_SIZE];	// Function status array

	// Start the Web server.
	void*	lib_websockets = dlopen_or_fail("/usr/lib/libwebsockets.so.10");
	void*	lib_jsoncpp = dlopen_or_fail("/usr/lib/libjsoncpp.so.11");
	void*	lib_smart = dlopen_or_fail("/usr/lib/libsmart.so.1");
	void*	lib_focserver = dlopen_or_fail("/usr/lib/libfocserver.so.1");
	int		(*focserver_main)(int argc, char* argv[]);


	dlerror();    // Clear any existing error.
	printf("Loading FOC server... ");
	fflush(stdout);
	// Note: The following cast is C99-compliant.
	*(void **) (&focserver_main) = dlsym(lib_focserver, "focserver_main");
	const char*	error = dlerror();
	if (error  != nullptr)  {
		printf(" failed.\n");
		printf("dlsym: %s\n", error);
		exit(EXIT_FAILURE);
	}
	printf("Success.\n");
	focserver_main(argc, argv);
	dlclose(lib_focserver);
	dlclose(lib_smart);
	dlclose(lib_jsoncpp);
	dlclose(lib_websockets);

	// The following connects the FOC to the Hardware Platform.

    // Read from platform function
	pf_read_stream(rbuf);
	// FOC data processing
	foc(rbuf, pbuf, cbuf, args, status);
	// Write to platform function
	pf_write_stream(pbuf);
	// Write captured data to debug stream.
	dbg_write_stream(cbuf);

	return 0;
}

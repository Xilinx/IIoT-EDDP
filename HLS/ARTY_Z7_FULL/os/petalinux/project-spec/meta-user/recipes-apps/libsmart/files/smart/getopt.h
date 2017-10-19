/// \file  getopt.h
/// \brief	Declaration of the function getopt(); includes the real getopt.h when building Linux applications.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-4-Clause 1987,1993,1994 The Regents of the University of Californi
#pragma once

/// \file getopt replacement on Win32, wrapper around getopt.h otherwise.

#if defined(_MSC_VER)
// source: https://gist.github.com/superwills/5815344
/*
* Copyright (c) 1987, 1993, 1994
*      The Regents of the University of California.  All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
* 1. Redistributions of source code must retain the above copyright
*    notice, this list of conditions and the following disclaimer.
* 2. Redistributions in binary form must reproduce the above copyright
*    notice, this list of conditions and the following disclaimer in the
*    documentation and/or other materials provided with the distribution.
* 3. All advertising materials mentioning features or use of this software
*    must display the following acknowledgement:
*      This product includes software developed by the University of
*      California, Berkeley and its contributors.
* 4. Neither the name of the University nor the names of its contributors
*    may be used to endorse or promote products derived from this software
*    without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
* ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
* OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
* HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
* LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
* OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
* SUCH DAMAGE.
*/
#if defined(__cplusplus)
extern "C" {
#endif


extern int		opterr, // if error message should be printed.
				optind, // index into parent argv vector.
				optopt, // character checked for validity.
				optreset; // reset getopt.
extern char*	optarg; // argument associated with option.

#define BADCH   (int)'?'
#define BADARG  (int)':'
#define EMSG    ""

extern int getopt(int nargc, char * const nargv[], const char *ostr);


#if defined(__cplusplus)
}
#endif

#else
// must have getopt :)
#include <getopt.h>	// getopt
#endif


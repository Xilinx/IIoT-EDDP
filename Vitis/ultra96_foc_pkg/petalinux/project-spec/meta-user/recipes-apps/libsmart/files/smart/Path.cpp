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
/// \file  Path.cpp
/// \brief	Definitions in the namespace Path.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <string.h>

#include "Path.h"


namespace smart {
namespace Path {

const char*	ALL_SEPARATORS =
#if defined(WIN32)
		"\\/";
#else
		"/";
#endif

// --------------------------------------------------------------------------------------------------------------------
bool isSeparator(const char c)
{
	return strchr(ALL_SEPARATORS, c) != nullptr;
}

// --------------------------------------------------------------------------------------------------------------------
std::string
combine(const std::string& p1, const std::string& p2)
{
	if (p1.size() > 0) {
		std::string	r;
		r += p1;
		r += SEPARATOR;
		r += p2;
		return r;
	} else {
		return p2;
	}
}

// --------------------------------------------------------------------------------------------------------------------
std::string	combine(const std::string& p1, const std::string& p2, const std::string& p3)
{
	std::string	r = p1;

	if (r.size() > 0u && p2.size()>0u) {
		r += SEPARATOR;
		r += p2;
	}

	if (r.size() > 0u && p3.size() > 0u) {
		r += SEPARATOR;
		r += p3;
	}

	return r;
}

// --------------------------------------------------------------------------------------------------------------------
std::string getFilenameWoExt(const std::string& path)
{
	std::string::size_type sep_pos = std::string::npos;
	sep_pos = path.rfind('.');
	return path.substr(0, sep_pos );
}

// --------------------------------------------------------------------------------------------------------------------
std::string getFilename(const std::string& path)
{
	std::string::size_type sep_pos = std::string::npos;
	sep_pos = path.rfind(SEPARATOR);
	if (sep_pos == std::string::npos) {
#if defined(WIN32)
		if (path.size() >= 2 && isalpha(path[0]) && path[1] == ':') {
			return path.substr(2);
		}
#endif
		return path;
	}
	else {
		return path.substr(sep_pos + 1);
	}
}



} // namespace Path
} // namespace smart

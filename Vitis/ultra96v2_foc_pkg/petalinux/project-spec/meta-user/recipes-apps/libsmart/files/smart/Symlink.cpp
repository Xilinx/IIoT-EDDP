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
/// \file  Symlink.cpp
/// \brief	Definitions of symlink handling functions.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <stdexcept>	// std::runtime_error

#include <sys/stat.h>	// stat
#include <unistd.h>		// symlink

#include "string.h"		// ssprintf

#include "Symlink.h"




namespace smart {
namespace Symlink {


// --------------------------------------------------------------------------------------------------------------------
std::string read(const char* path)
{
#if defined(WIN32)
	return std::string();
#else
	// We need the size of the file.
	struct stat	st;
	if (lstat(path, &st) < 0) {
		return std::string();
	}

	// Is it a link?
	if (!(st.st_mode & S_IFLNK)) {
		return std::string();
	}

	// There are no empty symlinks.
	if (st.st_size == 0) {
		return std::string();
	}

	// Read the symlink until we succeed.
	std::string		r;
	ssize_t			r_readlink = st.st_size + 64;
	do {
		r.resize(2 * r_readlink + 64);
		r_readlink = readlink(path, &r[0], r.size());
		if (r_readlink <= 0) {
			return std::string();
		}
	} while (r_readlink >= static_cast<int>(r.size()));
	r.resize(r_readlink);
	return r;
#endif
}

// --------------------------------------------------------------------------------------------------------------------
void create(const char* target, const char* path)
{
#if defined(WIN32)
	throw std::runtime_error("createSymlink: Not implemented on Windows");
#else
	const int	r_symlink = symlink(target, path);
	if (r_symlink < 0) {
		throw std::runtime_error(ssprintf("Cannot create symlink to '%s' from '%s'", target, path));
	}
#endif
}

} // namespace Symlink
} // namespace smart

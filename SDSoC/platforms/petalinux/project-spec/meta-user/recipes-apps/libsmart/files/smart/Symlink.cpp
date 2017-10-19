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

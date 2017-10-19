/// \file  Symlink.h
/// \brief	Declarations of symlink handling functions.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <string>


namespace smart {
namespace Symlink {


/// Read symlink contents.
/// Note that the symlink cannot have empty content; see symlink(3).
/// Error is reported by returning empty string.
/// \param path	Path to the symlink.
/// \return Symlink contents, or empty string when the path doesn't point to symlink.
std::string read(const char* path);

/// Create a symbolic link. Throws exceptions on errors.
/// \param path Path to create symlink at.
/// \param target Target to point to.
void create(const char* target, const char* path);


} // namespace Symlink
} // namespace smart


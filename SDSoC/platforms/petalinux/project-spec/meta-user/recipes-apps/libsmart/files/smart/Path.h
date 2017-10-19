/// \file  Path.h
/// \brief	Declarations in the namespace Path.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <string>	// std::string

namespace smart {
/// Functions and constants for operating file file paths.
namespace Path {
/// Path separator character.
const char SEPARATOR =
#if defined(WIN32)
		'\\';
#else
		'/';
#endif

/// String of all permitted separators.
extern const char*	ALL_SEPARATORS;

/// Is the character a separator?
bool isSeparator(const char c);

/// Combine two paths.
/// @param p1	First part of the path.
/// @param p2	Second part of the paths.
std::string	combine(const std::string& p1, const std::string& p2);

/// Combine three paths.
std::string	combine(const std::string& p1, const std::string& p2, const std::string& p3);


/// Get path withoud last extension
std::string getFilenameWoExt(const std::string& path);

/// Get filename part of the path.
std::string getFilename(const std::string& path);

}
}

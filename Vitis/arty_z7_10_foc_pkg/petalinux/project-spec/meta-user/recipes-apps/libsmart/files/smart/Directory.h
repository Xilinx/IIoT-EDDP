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
/// \file  Directory.h
/// \brief	Interface of the class Directory.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <memory>	// std::shared_ptr
#include <vector>	// std::vector
#include <string>	// std::string

namespace smart {

/// Operations on directories.
class Directory {
public:
	/// Return a list of directory entries. Note: "." and ".." are filtered out.
	/// Throws exceptions when the directory is not found.
	static std::vector<std::string> getFiles(const std::string& path);

	/** list directory contents
	 *
	 * arguments:
	 * folder - path to the folder to open
	 * ext - file extension to match
	 *
	 * returns list of strings containing only file names withoud the folder path
	 */
	static std::shared_ptr<std::vector<std::string>> getFiles( const std::string& folder, const std::string& match);

	/// Create all directories up to "path" as needed.
	/// Throws exceptions on errors.
	static void create(const std::string& path);
	/**
	 * returns:
	 *   true if the entry exists and is plain directory
	 *   false otherwise
	 */
	static bool existsAndIsDirectory( const std::string& path );

	/**
	 * Verifies if the directory root/subdir does exist and creates all parts of subdir
	 * if the subdir does not exist. It also verifies the subdir against disabled characters:
	 *   ;"&%(){}[]#=?*'><,!|
	 * and converts any occurence of character \ into character /
	 *
	 * arguments:
	 *   root- root part of the folder path
	 *   subdir- direcotry path below the root
	 *
	 * returns:
	 *   string of full path of the accepted folder
	 *   empty string in any error
	 */
	static std::string verifyAndCreate( std::string root, std::string subdir );

};

}; // namespace smart

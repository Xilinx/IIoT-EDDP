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

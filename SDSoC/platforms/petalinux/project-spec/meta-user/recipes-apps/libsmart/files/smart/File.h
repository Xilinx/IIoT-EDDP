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
/// \file  File.h
/// \brief	Interface of the class File.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
#pragma once

#include <string>	// std::string
#include <memory>	// std::shared_ptr
#include <vector>	// std::vector
#include <cstdint>	// std::uint32_t

#include <stdio.h>	// FILE

#include "MappedFile.h"

namespace smart {

// Forward declaration, if needed.
class MappedFile;

/// File abstraction.
class File {
public:
		/// File handle.
#if defined(WIN32)
		typedef void*		Handle;
#else
		typedef	int			Handle;
#endif

		/// A wrapper around FILE; closes automatically when going out of scope.
		/// createMapping is not supported.
		File(FILE* f);

		/// Open a file in read-write mode. createMapping supported.
		File(const std::string& filename);

		/// Open a file in read-write mode. createMapping supported.
		File(const char* s);

		/// Close outstanding file handles.
		~File();

		/// Get file handle.
		Handle getHandle();

#if !defined(WIN32)
		MappedFile*	createMapping(const std::uintptr_t offset, const std::size_t size);
#endif

public:
		/// Does the file or directory exist?
		static bool exists(const std::string& filename);

		/// \return true if the file exists and is file; it must not be a link
		static bool existsAndIsFile( const std::string& path );

		/// Read all bytes from a file.
		static void readAllBytes(std::vector<std::uint8_t>& buffer, const std::string& filename);

		/// Write all bytes to the file; throw exceptions on errors.
		static void writeAllBytes(const std::string& filename, FILE* f, const void* data, const unsigned int size);

		/// Write all bytes to a file.
		static void writeAllBytes(const std::string& filename, const std::vector<std::uint8_t>& data);

		/// Write all bytes to a file.
		static void writeAllBytes(const std::string& filename, const void* data, const unsigned int size);

		/// Read file contents as text.
		static std::string readAllText(const std::string& filename);

		/// Write all of the string to a file.
		static void writeAllText(const std::string& filename, const std::string& contents);

		/// Read file contents as text lines. Both CRLF and LF line separators are supported.
		static void readAllLines(std::vector<std::string>& lines, const std::string& filename);

		/// Delete the given file.
		/// @param filename File to be deleted.
		static void deleteFile(const std::string& filename);
private:
		Handle const	_handle;

		// C standard library file handle.
		FILE* const		_cfile;
		std::vector<std::shared_ptr<MappedFile>>	_mappings;
};

} // namespace smart

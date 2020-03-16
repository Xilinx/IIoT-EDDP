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
/// \file  File.cpp
/// \brief	Implementation of the class File.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#ifdef _WIN32
#	define WIN32_LEAN_AND_MEAN
#	include <Windows.h>		// Win32 API
#endif

#include <stdexcept>	// std::runtime_error

#include <fcntl.h>		// file open flags.
#include <stdio.h>		// FILE
#include <string.h>		// memcpy
#include <sys/types.h>
#include <sys/stat.h>	// stat
#if !defined(_WIN32)
#	include <unistd.h>		// open
#endif

#include "File.h"
#include "MappedFile.h"
#include "string.h"



#if defined(WIN32)
#	define	O_SYNC					0
#	define	open(filename, flags)	CreateFile(filename, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_WRITE, NULL, CREATE_NEW, 0, NULL)
#	define	close(h)				CloseHandle(h)
#	define	stat_f					_stat
#	define	lstat					_stat
#	define	stat_st					_stat64i32
#else
#	define	INVALID_HANDLE_VALUE	(-1)
#	define	stat_f					stat
#	define	stat_st					stat
#endif


namespace smart {

class StdioFile {
public:
	StdioFile(FILE* f) : _f(f) { }
	~StdioFile()
	{
		if (_f != nullptr) {
			fclose(_f);
		}
	}
private:
	FILE*	_f;
};

// --------------------------------------------------------------------------
static File::Handle __open(const char* filename, const int flags)
{
	const File::Handle h = open(filename, flags);
	if (h == INVALID_HANDLE_VALUE) {
		throw std::runtime_error(ssprintf("Cannot open file '%s'", filename));
	}
	return h;
}

// --------------------------------------------------------------------------------------------------------------------
File::File(FILE* f)
: _handle(INVALID_HANDLE_VALUE),
  _cfile(f)
{
}

// --------------------------------------------------------------------------
File::File(const std::string& filename)
: _handle(__open(filename.c_str(), O_RDWR|O_SYNC)),
  _cfile(nullptr)
{
}

// --------------------------------------------------------------------------
File::File(const char* filename)
: _handle(__open(filename, O_RDWR|O_SYNC)),
  _cfile(nullptr)
{
}


// --------------------------------------------------------------------------
File::~File()
{
	_mappings.clear();
	if (_handle != INVALID_HANDLE_VALUE) {
		close(_handle);
	}
	if (_cfile != nullptr) {
		fclose(_cfile);
	}
}

// --------------------------------------------------------------------------
File::Handle File::getHandle()
{
	if (_handle == INVALID_HANDLE_VALUE && _cfile != nullptr) {
#if defined(_MSC_VER)
		return reinterpret_cast<Handle>(_fileno(_cfile));
#else
		return fileno(_cfile);
#endif
	}
	return _handle;
}

#if !defined(WIN32)
// --------------------------------------------------------------------------
MappedFile* File::createMapping(const std::uintptr_t offset, const std::size_t size)
{
	auto r = std::make_shared<MappedFile>(getHandle(), offset, size);
	_mappings.push_back(r);
	return r.get();
}
#endif

// --------------------------------------------------------------------------
bool File::exists(const std::string& filename)
{
	struct stat_st	st = { 0 };
	const int	r_stat = stat_f(filename.c_str(), &st);
	return r_stat == 0;
}

// --------------------------------------------------------------------------------------------------------------------
bool File::existsAndIsFile( const std::string& path )
{
	struct stat_st st;

	// the path must have characers
	if (path.length() <= 0) {
		return false;
	}

	// the root directory must exist
	bool exists = false;
	if (lstat(path.c_str(), &st) != -1) {
		//printf( "%s st_mode=%o\n", path.c_str(), st.st_mode );
		exists = (st.st_mode & S_IFREG) != 0;
#if !defined(_MSC_VER)
		exists &= ((st.st_mode & (S_IFLNK ^ S_IFREG) ) == 0);
#endif
	}

	return exists;
}

// --------------------------------------------------------------------------------------------------------------------
void File::readAllBytes(std::vector<std::uint8_t>& buffer, const std::string& filename)
{
	struct stat_st st;
	if (stat_f(filename.c_str(), &st)<0) {
		throw std::runtime_error(ssprintf("File '%s' not found; cannot determine file size.", filename.c_str()));
	} else {
		const int   file_size = st.st_size;
		buffer.resize(file_size);
		FILE*   fin = fopen(filename.c_str(), "rb");
		if (fin == NULL) {
			throw std::runtime_error(ssprintf("Cannot open file '%s' for reading.", filename.c_str()));
		} else {
			StdioFile	fin_auto(fin);
			if (file_size>0) {
				// Read all in one chunk if possible.
				buffer.resize(file_size);
				const int   r = fread(&buffer[0], 1, file_size, fin);
				if (r < 0) {
					throw std::runtime_error(ssprintf("Error when reading file '%s'", filename.c_str()));
				}
				buffer.resize(r);
			} else {
				// Read it bit by bit.
				const unsigned int	CHUNK_SIZE = 16384;
				unsigned int		so_far = 0;
				int			this_round;
				do {
					buffer.resize(so_far + CHUNK_SIZE);
					this_round = fread(&buffer[so_far], 1, CHUNK_SIZE, fin);
					if (this_round > 0) {
						so_far += this_round;
					}
				} while (this_round == CHUNK_SIZE);
				buffer.resize(so_far);
			}
		}
	}
}

// --------------------------------------------------------------------------------------------------------------------
void
File::writeAllBytes(const std::string& filename, FILE* fout, const void* data, const unsigned int size)
{
	const int   r = fwrite(data, size, 1, fout);
	if (r != 1) {
		throw std::runtime_error(ssprintf("writeAllBytes: Cannot write %u bytes to file '%s'", size, filename.c_str()));
	}
}

// --------------------------------------------------------------------------------------------------------------------
void File::writeAllBytes(const std::string& filename, const std::vector<std::uint8_t>& data)
{
	writeAllBytes(filename, data.size()==0 ? nullptr : &data[0], data.size());
}

// --------------------------------------------------------------------------------------------------------------------
/// Write all bytes to a file.
void File::writeAllBytes(const std::string& filename, const void* data, const unsigned int size)
{
	FILE*   fout = fopen(filename.c_str(), "wb");
	if (fout == NULL) {
		throw std::runtime_error(ssprintf("Cannot open file '%s' for writing.", filename.c_str()));
	}
	else if (size == 0) {
		// simplest case.
		fclose(fout);
	}
	else {
		File	fp(fout);
		writeAllBytes(filename, fout, data, size);
	}
}

// --------------------------------------------------------------------------------------------------------------------
std::string File::readAllText(const std::string& filename)
{
	std::vector<std::uint8_t>	buffer;
	readAllBytes(buffer, filename);
	if (buffer.size() == 0) {
		return "";
	} else {
		return std::string((const char*)&buffer[0], (const char*)&buffer[0] + buffer.size());
	}
}

// --------------------------------------------------------------------------------------------------------------------
void File::writeAllText(const std::string& filename, const std::string& contents)
{
	std::vector<std::uint8_t>	buffer;
	if (contents.size() > 0) {
		buffer.resize(contents.size());
		memcpy(&buffer[0], contents.c_str(), contents.size());
	}
	writeAllBytes(filename, buffer);
}

// --------------------------------------------------------------------------------------------------------------------
static void
_append_line(
	std::vector<std::string>&			lines,
	const std::vector<std::uint8_t>&	buffer,
	const unsigned int					last_start_pos,
	const unsigned int					lf_pos
	)
{
	if (last_start_pos >= lf_pos) {
		if (lf_pos < buffer.size()) {
			lines.push_back("");
		}
	} else {
		const char*	start_ptr = (const char*)&buffer[last_start_pos];
		if (buffer[lf_pos - 1] == '\r') {
			lines.push_back(std::string(start_ptr, (const char*)&buffer[lf_pos - 1]));
		} else {
			lines.push_back(std::string(start_ptr, (const char*)&buffer[lf_pos]));
		}
	}
}

// --------------------------------------------------------------------------------------------------------------------
void
File::readAllLines(std::vector<std::string>& lines, const std::string& filename)
{
	std::vector<std::uint8_t>	buffer;
	readAllBytes(buffer, filename);

	unsigned int	last_start = 0;
	for (unsigned int lf_pos = 0; lf_pos < buffer.size(); ++lf_pos) {
		if (buffer[lf_pos] == '\n') {
			_append_line(lines, buffer, last_start, lf_pos);
			last_start = lf_pos + 1;
		}
	}
	_append_line(lines, buffer, last_start, buffer.size());
}

// --------------------------------------------------------------------------------------------------------------------
void
File::deleteFile(const std::string& filename)
{
#if defined(WIN32)
	DeleteFile(filename.c_str());
#else
	::unlink(filename.c_str());
#endif
}

} // namespace smart.

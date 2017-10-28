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
/// \file  MappedFile.cpp
/// \brief	Interface of the class MappedFile.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#ifdef _WIN32
#	define WIN32_LEAN_AND_MEAN
#	include <Windows.h>		// Win32 API
#else
#	include <sys/time.h>
#endif

#include <string>		// std::string
#include <stdexcept>	// std::runtime_error
#include <cstdint>		// std::uintptr_t, etc.

#include <stdio.h>
#if !defined(WIN32)
#include <unistd.h>	// open
#endif
#include <fcntl.h>	// file open flags.
#if !defined(WIN32)
#include <sys/mman.h>	// mmap
#endif

#include <smart/string.h>

#include "MappedFile.h"	// ourselves.

#if defined(WIN32)
#	define	MAP_FAILED				((std::uint32_t*)(-1))
#	define	O_SYNC					0
#	define	PROT_READ				0
#	define	PROT_WRITE				0
#	define	MAP_SHARED				0
#	define	_SC_PAGE_SIZE			0
#	define	mmap(p1,p2,p3,p4,p5,p6)	(-1)
#	define	munmap(p1,p2)			(-1)
#	define	open(fn, mode)			(INVALID_HANDLE_VALUE)
#	define	sysconf(p1)				(-1)
#else
#	define	CloseHandle(fh)		close(fh)
#	define	INVALID_HANDLE_VALUE	(-1)
#	define	HANDLE					MappedFile::Handle
#endif

namespace smart {

unsigned int MappedFile::_pageSize = 0;

// --------------------------------------------------------------------------------------------------------------------
MappedFile::MappedFile(
	const std::string&		filename,
	const std::uintptr_t		offset,
	const std::size_t		length)
:
	_file(INVALID_HANDLE_VALUE),
	_data((std::uint32_t*)MAP_FAILED),
	_size(length),
	_shadow_read_mask(0),
	filename(filename),
	offset(offset)
{
	_file = open(filename.c_str(), O_RDWR|O_SYNC);
	if (_file == INVALID_HANDLE_VALUE) {
		_closeMapping();
		throw std::runtime_error("MappedFile: Unable to open file");
	}
	_data = reinterpret_cast<std::uint32_t*>(mmap(0, _size, PROT_READ|PROT_WRITE, MAP_SHARED, _file, offset));
	if (_data == MAP_FAILED) {
		_closeMapping();
		throw std::runtime_error("MappedFile: Unable to mmap file.");
	}
}

// --------------------------------------------------------------------------------------------------------------------
MappedFile::MappedFile(Handle h,
		const std::uintptr_t		offset,
		const std::size_t		length)
:
	_file(INVALID_HANDLE_VALUE),
	_data((std::uint32_t*)MAP_FAILED),
	_size(length),
	_shadow_read_mask(0),
	filename(ssprintf("filehandle:%d", h)),
	offset(offset)
{
	_data = reinterpret_cast<std::uint32_t*>(mmap(0, _size, PROT_READ|PROT_WRITE, MAP_SHARED, h, offset));
	if (_data == MAP_FAILED) {
		_closeMapping();
		throw std::runtime_error("MappedFile: Unable to mmap file.");
	}
}

// --------------------------------------------------------------------------------------------------------------------
void
MappedFile::_closeMapping()
{
	if (_data != nullptr) {
		munmap(_data, _size);
		_data = nullptr;
	}
	if (_file != INVALID_HANDLE_VALUE) {
		CloseHandle((HANDLE)_file);
		_file = INVALID_HANDLE_VALUE;
	}

}

// --------------------------------------------------------------------------------------------------------------------
std::uint32_t MappedFile::_read32Unchecked(const std::uint32_t index)
{
	if (index < _shadow_data.size() && (index>=8*sizeof(_shadow_read_mask) || (_shadow_read_mask & (1 << index))==0)) {
		return _shadow_data[index];
	}
	else {
		const auto r = reinterpret_cast<volatile std::uint32_t*>(_data)[index];
		if (index < _shadow_data.size()) {
			_shadow_data[index] = r;
		}
		return r;
	}
}

// --------------------------------------------------------------------------------------------------------------------
MappedFile::~MappedFile()
{
	_closeMapping();
}

// --------------------------------------------------------------------------------------------------------------------
std::size_t MappedFile::size() const
{
	return _size;
}

// --------------------------------------------------------------------------------------------------------------------
std::size_t MappedFile::size32() const
{
	return _size / sizeof(std::uint32_t);
}

// --------------------------------------------------------------------------------------------------------------------
void
MappedFile::createShadow(const unsigned int readMask)
{
	_shadow_data.resize(size());
	_shadow_read_mask = readMask;
}

// --------------------------------------------------------------------------------------------------------------------
void MappedFile::write32(const std::uint32_t index, const std::uint32_t value)
{
	if (index>_size || index*sizeof(std::uint32_t)>_size) {
		throw std::runtime_error("MappedFile::write32: index out of bounds");
	} else {
		_data[index] = value;
		if (index < _shadow_data.size()) {
			_shadow_data[index] = value;
		}
	}
}

// --------------------------------------------------------------------------------------------------------------------
void MappedFile::write32Masked(const std::uint32_t index, const std::uint32_t mask, const std::uint32_t value)
{
	if (index>_size || index*sizeof(std::uint32_t)>_size) {
		throw std::runtime_error("MappedFile::write32: index out of bounds");
	} else {
		const std::uint32_t	v_old = _read32Unchecked(index);
		const std::uint32_t	v_new = (v_old & ~mask) | (value & mask);

		_data[index] = v_new;
		if (index < _shadow_data.size()) {
			_shadow_data[index] = v_new;
		}
	}
}

// --------------------------------------------------------------------------------------------------------------------
uint32_t MappedFile::read32(const std::uint32_t index)
{
	if (index>_size || index*sizeof(std::uint32_t)>_size) {
		throw std::runtime_error("MappedFile::read32: index out of bounds");
	} else {
		return _read32Unchecked(index);
	}
}

// --------------------------------------------------------------------------------------------------------------------
MappedFile::Handle MappedFile::getFile()
{
	return _file;
}

// --------------------------------------------------------------------------------------------------------------------
unsigned int
MappedFile::pageSize()
{
	if (_pageSize == 0) {
		_pageSize = sysconf(_SC_PAGE_SIZE);
	}
	return _pageSize;
}

} // namespace smart

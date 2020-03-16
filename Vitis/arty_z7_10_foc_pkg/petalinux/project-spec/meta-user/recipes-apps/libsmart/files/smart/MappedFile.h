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
/// \file  MappedFile.h
/// \brief	Interface of the class MappedFile.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
#pragma once

#include <cstdint>	// std::int32_t, etc.
#include <string>	// std::string
#include <vector>	// std::vector
#include <stdexcept>	// std::runtime_error
#include <cstdint>	// std::uintptr_t, etc.
#include <cstddef>	// std::size_t

#include "File.h"

namespace smart {

/// Memory-mapped file.
/// NB! 32-bit access granularity.
/// Supports shadow copy of the mapped area in order to simplify register access.
class MappedFile {
public:
	/// File handle.
#if defined(WIN32)
	typedef void*		Handle;
#else
	typedef	int			Handle;
#endif

private:
	/// Underlying file handle, if any.
	Handle				_file;
	std::uint32_t*		_data;
	std::size_t			_size;

	/// Shadow copy of the data, if any.
	std::vector<std::uint32_t>		_shadow_data;

	/// Bitmask of registers that support reading.
	unsigned int					_shadow_read_mask;

	/// Size of the memory page.
	static unsigned int		_pageSize;

	/// Close everything.
	void				_closeMapping();

	/// Unchecked read.
	std::uint32_t		_read32Unchecked(const std::uint32_t index);
public:
	/// Create new memory mapping.
	/// NB! Use the pageSize() function to determine granularity.
	/// filename		Name of the operating system file.
	/// offset			Offset to the file, must be aligned to memory page size.
	/// length			Length of the mapped size, must be aligned to memory page size.
	MappedFile(
		const std::string&		filename,
		const std::uintptr_t		offset,
		const std::size_t		length);

	/// Create new memory mapping.
	/// NB! The file handle will not be owned by the file mapping.
	/// h				Operating system file handle.
	/// offset			Offset to the file, must be aligned to memory page size.
	/// length			Length of the mapped size, must be aligned to memory page size.
	MappedFile(Handle h,
			const std::uintptr_t		offset,
			const std::size_t		length);

	/// Close memory mapping.
	~MappedFile();

	const std::string	filename;
	const std::uintptr_t	offset;

	/// Number of bytes mapped.
	std::size_t size() const;

	/// Number of 32-bit words mapped.
	std::size_t size32() const;

	/// Create shadow copy of the data.
	/// Reads will be done from the shadow copy except for those registers that have a corresponding bit set in the readMask.
	void createShadow(const unsigned int readMask);

	/// Write the given word at the given index.
	void write32(const std::uint32_t index, const std::uint32_t value);

	/// Write the given ward at the given index with the given mask.
	/// Only the bits given in the mask will be written.
	void write32Masked(const std::uint32_t index, const std::uint32_t mask, const std::uint32_t value);

	/// Read a word from the given index.
	uint32_t read32(const std::uint32_t index);

	/// Return the data pointer.
	void* data()
	{
		return _data;
	}

	/// Get file handle.
	Handle getFile();

	/// Size of a memory page.
	static unsigned int pageSize();
}; // class MappedFile

} // namespace smart

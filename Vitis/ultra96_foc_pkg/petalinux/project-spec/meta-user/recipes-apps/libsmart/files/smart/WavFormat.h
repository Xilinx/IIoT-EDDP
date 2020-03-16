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
/// \file  WavFormat.h
/// \brief	Declarations of WAV file functions.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <string>	// std::string
#include <stdio.h>	// FILE*

namespace smart {

/// Functions for processing WAV files.
namespace WavFormat {

/// Write a WAV formatted file.
/// @param filename Output filename.
/// @param nchannels Number of channels.
/// @param bits_per_sample Bits per sample.
/// @param sample_rate Sample rate, in Hz.
/// @param nbytes Total number of bytes of the samples.
void writeHeader(
	const std::string&	filename,
	FILE*			fout,
	const unsigned int	nchannels,
	const unsigned int	bits_per_sample,
	const unsigned int	sample_rate,
	const unsigned int	nbytes);

/// Write a WAV formatted file.
/// @param filename Output filename.
/// @param nchannels Number of channels.
/// @param bits_per_sample Bits per sample.
/// @param sample_rate Sample rate, in Hz.
/// @param sample_buffer Pointer to the samples.
/// @param nbytes Total number of bytes of the samples.
void writeFile(
	const std::string&	filename,
	const unsigned int	nchannels,
	const unsigned int	bits_per_sample,
	const unsigned int	sample_rate,
	const void*			sample_buffer,
	const unsigned int	nbytes);

/// Read WAV header and position the file pointer at the beginning of the data.
void readHeader(
	FILE*				fin,
	unsigned int&		nchannels,
	unsigned int&		bits_per_sample,
	unsigned int&		sample_rate,
	unsigned int&		total_bytes);

} // namespace WavFormat
} // namespace smart

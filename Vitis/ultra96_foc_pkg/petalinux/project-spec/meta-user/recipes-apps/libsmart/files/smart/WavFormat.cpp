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
/// \file  WavFormat.cpp
/// \brief	Definitions of WAV file functions.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH


#include "WavFormat.h"	// ourselves.
#include "File.h"		// File operations.
#include "string.h"		// ssprintf

namespace smart {
namespace WavFormat {

/// Construct a 32-bit word out of text, first char is LSB, fourth char is MSB.
#define	UINT32_OF_TEXT(magic_txt)	(			\
	(((std::uint32_t)(magic_txt[0])) << 0) |		\
	(((std::uint32_t)(magic_txt[1])) << 8) |		\
	(((std::uint32_t)(magic_txt[2])) << 16) |	\
	(((std::uint32_t)(magic_txt[3])) << 24) 		\
)

#pragma pack(push, 1)
/// RIFF file header.
typedef struct {
	// 0
	/// The ASCII text string "RIFF".
	std::uint32_t	riffMagic;

	// 4
	/// The file size not including the "RIFF" description (4 bytes) and file size (4 bytes). This is file size - 8.
	std::uint32_t	fileSize;

	// 8
	/// The ASCII text string "WAVE".
	std::uint32_t	waveMagic;

	// 12
	/// The ASCII text string "fmt "(The space is also included).
	std::uint32_t	fmtMagic;

	// 16
	/// The size of the WAVE type format (2 bytes) + mono/stereo flag (2 bytes) + sample rate (4 bytes)
	/// + bytes per sec (4 bytes) + block alignment (2 bytes) + bits per sample (2 bytes).
	/// This is usually 16.
	std::uint32_t	fmtSectionSize;
} RiffHeader;

/// A copy of Windows WAVEFORMATEX
typedef struct {
	// 20
	std::uint16_t	wFormatTag;
	// 22
	std::uint16_t	nChannels;
	// 24
	std::uint32_t	nSamplesPerSec;
	// 28
	std::uint32_t	nAvgBytesPerSec;
	// 32
	std::uint16_t	nBlockAlign;
	// 34
	std::uint16_t	wBitsPerSample;
	// 36
	std::uint16_t	cbSize;
} WaveFormatEx;

/// RIFF data block header.
typedef struct {
	// 38
	/// The ASCII text string "data".
	std::uint32_t	magic;

	// 42
	/// Data block size, in bytes.
	std::uint32_t	size;
} RiffDataHeader;
#pragma pack(pop)

// --------------------------------------------------------------------------------------------------------------------
/// Read the item, fail with exception.
template <class T>
static void _fread_sure(T& t, FILE* f, const char* func_name, const char* element_name)
{
	const int		r_read = fread(&t, 1, sizeof(T), f);
	if (r_read != sizeof(T)) {
		throw std::runtime_error(ssprintf("%s: cannot read %s, read returned %d", func_name, element_name, r_read));
	}
}


// --------------------------------------------------------------------------------------------------------------------
void writeHeader(
		const std::string&	filename,
		FILE*			fout,
		const unsigned int	nchannels,
		const unsigned int	bits_per_sample,
		const unsigned int	sample_rate,
		const unsigned int	nbytes)
{
	RiffHeader	riff_header = { 0 };
	riff_header.riffMagic = UINT32_OF_TEXT("RIFF");
	riff_header.fileSize = sizeof(RiffHeader) + sizeof(WaveFormatEx) + nbytes - 8;
	riff_header.waveMagic = UINT32_OF_TEXT("WAVE");
	riff_header.fmtMagic = UINT32_OF_TEXT("fmt ");
	riff_header.fmtSectionSize = sizeof(WaveFormatEx);
	File::writeAllBytes(filename, fout, &riff_header, sizeof(riff_header));

	WaveFormatEx		fmt = { 0 };
	const unsigned int	bytes_per_sample = nchannels * (bits_per_sample / 8);
	fmt.wFormatTag = 1; // PCM
	fmt.nChannels = nchannels;
	fmt.nSamplesPerSec = sample_rate;
	fmt.nAvgBytesPerSec = sample_rate * bytes_per_sample;
	fmt.nBlockAlign = bytes_per_sample;
	fmt.wBitsPerSample = bits_per_sample;
	fmt.cbSize = 0;
	File::writeAllBytes(filename, fout, &fmt, sizeof(fmt));

	RiffDataHeader		data_header = { 0 };
	data_header.magic = UINT32_OF_TEXT("data");
	data_header.size = nbytes;
	File::writeAllBytes(filename, fout, &data_header, sizeof(data_header));
}

// --------------------------------------------------------------------------------------------------------------------
void writeFile(
	const std::string&	filename,
	const unsigned int	nchannels,
	const unsigned int	bits_per_sample,
	const unsigned int	sample_rate,
	const void*		sample_buffer,
	const unsigned int	nbytes)
{
	FILE*	fout = fopen(filename.c_str(), "wb");
	if (fout == nullptr) {
		throw std::runtime_error(ssprintf("writeWav: cannot write file '%s'", filename.c_str()));
	} else {
		File	fp(fout);
		writeHeader(filename, fout, nchannels, bits_per_sample, sample_rate, nbytes);
		// Without fflush/setvbuf the fwrite will generate an alignment exception on 32-bit ARM.
		// Probably because the header size is not aligned to 4-bytes.
		// This avoid the alignment fixup and hopefully speeds up things.
		fflush(fout);
		setvbuf(fout, nullptr, _IONBF, 0u);
		File::writeAllBytes(filename, fout, sample_buffer, nbytes);
	}
}

// --------------------------------------------------------------------------------------------------------------------
void readHeader(
	FILE*				fin,
	unsigned int&		nchannels,
	unsigned int&		bits_per_sample,
	unsigned int&		sample_rate,
	unsigned int&		total_bytes)
{
	// 1.RIFF header.
	RiffHeader		riff_header = { 0 };
	_fread_sure(riff_header, fin, "readWavHeader", "riff header");
	if (riff_header.riffMagic != UINT32_OF_TEXT("RIFF")) {
		throw std::runtime_error(ssprintf("readWavHeader: RIFF magic incorrect"));
	}
	if (riff_header.waveMagic != UINT32_OF_TEXT("WAVE")) {
		throw std::runtime_error(ssprintf("readWavHeader: WAVE magic incorrect"));
	}
	if (riff_header.fmtMagic != UINT32_OF_TEXT("fmt ")) {
		throw std::runtime_error(ssprintf("readWavHeader: Format magic incorrect"));
	}

	// 2. Wave format.
	WaveFormatEx	fmt = { 0 };
	_fread_sure(fmt, fin, "readWavHeader", "wave format");
	nchannels = fmt.nChannels;
	bits_per_sample = fmt.wBitsPerSample;
	sample_rate = fmt.nSamplesPerSec;

	// 3.Data header.
	RiffDataHeader	data_header = { 0 };
	// Detect the absence of cbSize data member.
	if (fmt.cbSize == 0x6164) {
		fmt.cbSize = 0;
		fseek(fin, -2, SEEK_CUR);
	}
	_fread_sure(data_header, fin, "readWavHeader", "data header");

	if (data_header.magic != UINT32_OF_TEXT("data")) {
		throw std::runtime_error(ssprintf("readWavHeader: DATA magic incorrect."));
	}
	total_bytes = data_header.size;
}

} // namespace WavFormat
} // namesapce smart

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

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
/*!
 * \file 		park_inverse.cpp
 * \brief		Implementation of the inverse Park's transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */



#include "park_inverse.h"
#include "sin_cos_table.h"

// hls namespace has to be included in all HLS C source files.
using namespace hls;

// Park Inverse
// Valpha = Vd*cos(Theta) - Vq*sin(Theta)
// Vbeta = Vq*cos(Theta) + Vd*sin(Theta)

// See the header for the documentation.
void Park_Inverse(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis){

#pragma HLS interface axis port=m_axis
#pragma HLS interface axis port=s_axis
	int64_t in_data, res;
	int32_t Vd, Vq, Theta;
	int32_t Vd_cos, Vq_sin, Vq_cos, Vd_sin;
	int32_t Valpha, Vbeta;
	int32_t cos_theta, sin_theta;

	// Decode Input stream
	in_data = s_axis.read();					// Read one value from AXI4-Stream
	Vd = int16_t(in_data & 0xFFFF);				// Extract Vd - bits[15..0] from input stream
	Vq = int16_t((in_data >> 16) & 0xFFFF);		// Extract Vq - bits[32..16] from input stream
	Theta = int16_t((in_data >> 32) & 0xFFFF);	// Extract Theta - bits[47..32] from input stream

	// Process data
	cos_theta = (int32_t)cos_table[Theta];
	sin_theta = (int32_t)sin_table[Theta];
	Vd_cos = Vd * cos_theta;
	Vq_sin = Vq * sin_theta;
	Vq_cos = Vq * cos_theta;
	Vd_sin = Vd * sin_theta;
	Valpha = (Vd_cos - Vq_sin) >> 15;
	Vbeta  = (Vq_cos + Vd_sin) >> 15;
	Valpha = (Valpha > MAX_LIM) ? MAX_LIM : Valpha;	// Clip max
	Valpha = (Valpha < MIN_LIM) ? MIN_LIM : Valpha;	// Clip min
	Vbeta  = (Vbeta  > MAX_LIM) ? MAX_LIM : Vbeta;	// Clip max
	Vbeta  = (Vbeta  < MIN_LIM) ? MIN_LIM : Vbeta;	// Clip min

	// Write output stream
	res =	(((int64_t)Theta << 32) 	& 0x0000FFFF00000000) | // Put Theta bits[47:32]
			(((int64_t)Vbeta << 16) 	& 0x00000000FFFF0000) | // Put Vbeta bits[31:16]
			( (int64_t)Valpha			& 0x000000000000FFFF);	// Put Valpha bits[15:0]
	m_axis.write(res);								// Write result to the output stream
}

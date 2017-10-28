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
 * \file 		park_direct.cpp
 * \brief		Implementation of the Park's transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */



#include "park_direct.h"
#include "sin_cos_table.h"

// hls namespace has to be included in all HLS C source files.
using namespace hls;

// Park Direct
// Id = Ialpha*cos(Theta) + Ibeta*sin(Theta)
// Iq = Ibeta*cos(Theta) - Ialpha*sin(Theta)


// See the header file for the documentation.
void Park_Direct(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis, int32_t *Id_out, int32_t *Iq_out){

#pragma HLS interface axis port=m_axis
#pragma HLS interface axis port=s_axis
	int64_t in_data, res;
	int16_t Ialpha, Ibeta, Theta, RPM;
	int32_t Id, Iq;
	int32_t cos_theta, sin_theta;
	int32_t Ia_cos, Ib_sin, Ib_cos, Ia_sin;

	// Decode Input stream
	in_data = s_axis.read();					// Read one value from AXI4-Stream
	Ialpha = int16_t(in_data & 0xFFFF);				// Extract Ialpha - bits[15..0] from input stream
	Ibeta = int16_t((in_data >> 16) & 0xFFFF);		// Extract Ibeta - bits[32..16] from input stream
	RPM = int16_t((in_data >> 32) & 0xFFFF);		// Extract RPM - bits[47..32] from input stream
	Theta = int16_t((in_data >> 48) & 0xFFFF);		// Extract Angle - bits[63..48] from input stream

	// Process data
	cos_theta = (int32_t)cos_table[Theta];
	sin_theta = (int32_t)sin_table[Theta];
	Ia_cos = (int32_t)Ialpha * cos_theta;
	Ib_sin = (int32_t)Ibeta * sin_theta;
	Ib_cos = (int32_t)Ibeta * cos_theta;
	Ia_sin = (int32_t)Ialpha * sin_theta;
	Id = (Ia_cos + Ib_sin) >> 15;
	Iq = (Ib_cos - Ia_sin) >> 15;
	Id = (Id > MAX_LIM) ? MAX_LIM : Id;				// Clip max
	Id = (Id < MIN_LIM) ? MIN_LIM : Id;				// Clip min
	Iq = (Iq > MAX_LIM) ? MAX_LIM : Iq;				// Clip max
	Iq = (Iq < MIN_LIM) ? MIN_LIM : Iq;				// Clip min

	*Id_out = Id;
	*Iq_out = Iq;
	// Write output stream
	res = 	(((int64_t)Theta << 48)	& 0xFFFF000000000000) | // Put Angle bits[63:48]
			(((int64_t)RPM << 32)	& 0x0000FFFF00000000) | // Put RPM bits[47:32]
			(((int64_t)Iq << 16) 	& 0x00000000FFFF0000) | // Put Iq bits[31:16]
			( (int64_t)Id			& 0x000000000000FFFF);	// Put Id bits[15:0]
	m_axis.write(res);								// Write result to the output stream
}

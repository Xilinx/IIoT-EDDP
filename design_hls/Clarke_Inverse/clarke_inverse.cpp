/*!
 * \file 		clarke_inverse.cpp
 * \brief		Implementation of the inverse Clarke transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */



#include "clarke_inverse.h"

using namespace hls;

// See the header file for the documentation comments.
void Clarke_Inverse(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis){

#pragma HLS interface axis port=m_axis
#pragma HLS interface axis port=s_axis
	int64_t in_data, res;
	int16_t Valpha, Vbeta, Theta;
	int32_t s3vb;									// Clarke Inverse
	int32_t Va, Vb, Vc;							// Clarke Inverse -> SVPWM

	// Decode Input stream
	in_data = s_axis.read();					// Read one value from AXI4-Stream
	Valpha = int16_t(in_data & 0xFFFF);				// Extract Valpha - bits[15..0] from input stream
	Vbeta = int16_t((in_data >> 16) & 0xFFFF);		// Extract Vbeta - bits[31..16] from input stream
	Theta = int16_t((in_data >> 32) & 0xFFFF);		// Extract Theta - bits[47..32] from input stream

	// Process data
	Va = Valpha;
	s3vb = Vbeta * SQRT3C;						// (sqrt(3)*(2^15))*Vbeta
	Vb = ((s3vb >> 15) - Valpha) >> 1;			// (-Valpha + sqrt(3)*Vbeta)/2
	Vc = (0 - Valpha - (s3vb >> 15)) >> 1;		// (-Valpha - sqrt(3)*Vbeta)/2
	Vb = (Vb > MAX_LIM) ? MAX_LIM : Vb;			// Clip max
	Vb = (Vb < MIN_LIM) ? MIN_LIM : Vb;			// Clip min
	Vc = (Vc > MAX_LIM) ? MAX_LIM : Vc;			// Clip max
	Vc = (Vc < MIN_LIM) ? MIN_LIM : Vc;			// Clip min

	// Write output stream
	res = 	(((int64_t)Theta << 48)	& 0xFFFF000000000000) | // Put Theta bits[63:48]
			(((int64_t)Vc << 32)	& 0x0000FFFF00000000) | // Put Vc bits[47:32]
			(((int64_t)Vb << 16) 	& 0x00000000FFFF0000) | // Put Vb bits[31:16]
			( (int64_t)Va			& 0x000000000000FFFF);	// Put Va bits[15:0]
	m_axis.write(res);								// Write result to the output stream
}

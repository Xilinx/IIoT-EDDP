/*!
 * \file 		clarke_direct.cpp
 * \brief		Implementation of the Clarke transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */



#include "clarke_direct.h"

using namespace hls;

// See the header file for documentation.
void Clarke_Direct(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis){

#pragma HLS interface axis port=m_axis
#pragma HLS interface axis port=s_axis
	int64_t in_data, res;
	int16_t Ia, Ib, Theta, RPM;
	int32_t Ialpha, Ibeta, Ibd;

	// Decode Input stream
	in_data = s_axis.read();					// Read one value from AXI4-Stream
	Ia = int16_t(in_data & 0xFFFF);				// Extract Ia - bits[15..0] from input stream
	Ib = int16_t((in_data >> 16) & 0xFFFF);		// Extract Ib - bits[32..16] from input stream
	RPM = int16_t((in_data >> 32) & 0xFFFF);	// Extract RPM - bits[47..32] from input stream
	Theta = int16_t((in_data >> 48) & 0xFFFF);	// Extract Angle - bits[63..48] from input stream

	// Process data
	Ialpha = (int32_t)Ia;
	Ibd = Ialpha + ((int32_t)Ib << 1);				// calculate Ia+2*Ib
	Ibeta = (Ibd * SQRT3A) >> 16;					// * 1/SQRT(3)
	Ibeta = (Ibeta > MAX_LIM) ? MAX_LIM : Ibeta;	// Clip max
	Ibeta = (Ibeta < MIN_LIM) ? MIN_LIM : Ibeta;	// Clip min

	// Write output stream
	res = 	(((int64_t)Theta << 48)	& 0xFFFF000000000000) | // Put Angle bits[63:48]
			(((int64_t)RPM << 32)	& 0x0000FFFF00000000) | // Put RPM bits[47:32]
			(((int64_t)Ibeta << 16) & 0x00000000FFFF0000) | // Put Ibeta bits[31:16]
			( (int64_t)Ialpha		& 0x000000000000FFFF);	// Put Ialpha bits[15:0]
	m_axis.write(res);								// Write result to the output stream
}

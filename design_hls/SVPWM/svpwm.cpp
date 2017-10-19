/*!
 * \file 		svpwm.cpp
 * \brief		SVPWM
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */



#include "svpwm.h"

// hls namespace has to be included in all HLS C source files.
using namespace hls;

// SVPWM
// Voff= [min(Va, Vb, Vc)+max(Va, Vb, Vc)]/2
// Vanew = Va - Voff
// Vbnew = Vb - Voff
// Vcnew = Vc - Voff

// See the header file for the documentation comment.
void SVPWM(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis){

#pragma HLS interface axis port=m_axis
#pragma HLS interface axis port=s_axis
	int64_t in_data, res;
	int16_t Va, Vb, Vc, Theta;
	int32_t Vmin, Vmax, Voff;						// SVPWM internals
	int32_t Van, Vbn, Vcn;							// Normalized SVPWM data

	// Decode Input stream
	in_data = s_axis.read();					// Read one value from AXI4-Stream
	Va = int16_t(in_data & 0xFFFF);				// Extract Va - bits[15:0] from input stream
	Vb = int16_t((in_data >> 16) & 0xFFFF);		// Extract Vb - bits[32:16] from input stream
	Vc = int16_t((in_data >> 32) & 0xFFFF);		// Extract Vc - bits[47:32] from input stream
	Theta = int16_t((in_data >> 48) & 0xFFFF);		// Extract Theta - bits[63:48] from input stream

	// Process data
	Vmin = (Va < Vb) ? Va : Vb;
	Vmin = (Vc < Vmin) ? Vc : Vmin;
	Vmax = (Va > Vb) ? Va : Vb;
	Vmax = (Vc > Vmax) ? Vc : Vmax;
	Voff = (Vmin + Vmax) >> 1;
	Van = Va - Voff;
	Vbn = Vb - Voff;
	Vcn = Vc - Voff;
	Van = (Van > MAX_LIM) ? MAX_LIM : Van;		// Clip max
	Van = (Van < MIN_LIM) ? MIN_LIM : Van;		// Clip min
	Vbn = (Vbn > MAX_LIM) ? MAX_LIM : Vbn;		// Clip max
	Vbn = (Vbn < MIN_LIM) ? MIN_LIM : Vbn;		// Clip min
	Vcn = (Vcn > MAX_LIM) ? MAX_LIM : Vcn;		// Clip max
	Vcn = (Vcn < MIN_LIM) ? MIN_LIM : Vcn;		// Clip min

	// Write output stream
	res = 	(((int64_t)Theta << 48)	& 0xFFFF000000000000) | // Put Vcn bits[63:48]
			(((int64_t)Vcn << 32)	& 0x0000FFFF00000000) | // Put Vcn bits[47:32]
			(((int64_t)Vbn << 16)	& 0x00000000FFFF0000) | // Put Vbn bits[31:16]
			( (int64_t)Van			& 0x000000000000FFFF);	// Put Van bits[15:0]
	m_axis.write(res);								// Write result to the output stream
}

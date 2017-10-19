/*!
 * \file 		filters.cpp
 * \brief		Implementation of the function Filters().
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */



#include "filters.h"

// hls namespace has to be included in all HLS C source files.
using namespace hls;

// See the header file for the description.
void Filters(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis, int32_t *RPM_out, const int32_t control){
#pragma HLS interface axis port=m_axis
#pragma HLS interface axis port=s_axis
	int64_t in_data, res;
	int16_t Ia, Ib, Theta, RPM;
	int32_t Ia_f, Ib_f, RPM_f;

	// Decode Input stream
	in_data = s_axis.read();					// Read one value from AXI4-Stream
	Ia = int16_t(in_data & 0xFFFF);				// Extract Ia - bits[15..0] from input stream
	Ib = int16_t((in_data >> 16) & 0xFFFF);		// Extract Ib - bits[32..16] from input stream
	RPM = int16_t((in_data >> 32) & 0xFFFF);	// Extract RPM - bits[47..32] from input stream
	Theta = int16_t((in_data >> 48) & 0xFFFF);	// Extract Angle - bits[63..48] from input stream

	// Process data
	// Simple average filter for RPM
	static int filt_acc;
	static int filt_mem[FILTER_ORDER];
	filt_acc -= filt_mem[FILTER_ORDER-1];
	filt_acc += RPM;
	for(int i = (FILTER_ORDER-1); i > 0; i--){
		filt_mem[i] = filt_mem[i - 1];
	}
	filt_mem[0] = RPM;
	RPM_f = filt_acc >> FILTER_SHIFT;

	// IIR lowpass filters for Ia and Ib (2 stages)
	// First filter stage
	int Ia1_filtered, Ib1_filtered;
	int Y1a, Y1b;
	static int Y1a_prev;
	static int Y1b_prev;

	Y1a = Ia*FILT_B + Y1a_prev*FILT_A;
	Y1b = Ib*FILT_B + Y1b_prev*FILT_A;
	Ia1_filtered	= Y1a >> 15;
	Ib1_filtered	= Y1b >> 15;
	Y1a_prev = Ia1_filtered;
	Y1b_prev = Ib1_filtered;

	// Second filter stage
	int Ia2_filtered, Ib2_filtered;
	int Y2a, Y2b;
	static int Y2a_prev;
	static int Y2b_prev;

	Y2a = Ia1_filtered*FILT_B + Y2a_prev*FILT_A;
	Y2b = Ib1_filtered*FILT_B + Y2b_prev*FILT_A;
	Ia2_filtered	= Y2a >> 15;
	Ib2_filtered	= Y2b >> 15;
	Y2a_prev = Ia2_filtered;
	Y2b_prev = Ib2_filtered;

	// Calculate DC in Idle mode
	static int Ia_DC_acc = 0;
	static int Ib_DC_acc = 0;
	static int Ia_DC_val = 0;
	static int Ib_DC_val = 0;
	static int dc_cnt = 0;
	static int Ia_corr, Ib_corr;

	if(dc_cnt >= (DC_ACC_SAMPLES-1)){	// End of accomulation
		Ia_DC_val	= Ia_DC_acc >> DC_ACC_BITS;
		Ib_DC_val	= Ib_DC_acc >> DC_ACC_BITS;
		Ia_DC_acc	= Ia2_filtered;
		Ib_DC_acc	= Ib2_filtered;
		dc_cnt		= 0;
	}
	else{								// Accomulation
		Ia_DC_acc	= Ia_DC_acc + Ia2_filtered;
		Ib_DC_acc	= Ib_DC_acc + Ib2_filtered;
		dc_cnt++;
	}
	if(control == 0){			// Save DC in Idle mode
		Ia_corr = Ia_DC_val;
		Ib_corr = Ib_DC_val;
	}

	// Apply DC correction
	Ia_f = Ia2_filtered - Ia_corr;
	Ib_f = Ib2_filtered - Ib_corr;

	*RPM_out	= -RPM_f;
	// Write output stream
	res = 	(((int64_t)Theta << 48)	& 0xFFFF000000000000) | // Put Angle bits[63:48]
			(((int64_t)RPM_f << 32)	& 0x0000FFFF00000000) | // Put RPM bits[47:32]
			(((int64_t)Ib_f << 16)	& 0x00000000FFFF0000) | // Put Ib bits[31:16]
			( (int64_t)Ia_f			& 0x000000000000FFFF);	// Put Ia bits[15:0]
	m_axis.write(res);								// Write result to the output stream
}

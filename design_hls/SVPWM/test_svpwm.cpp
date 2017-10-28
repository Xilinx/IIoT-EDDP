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
 * \file svpwm.h
 * \brief		Test bench for the SVPWM
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */
#include "SVPWM.h"

using namespace hls;

/** \brief Number of values to test with. */
#define TEST_SIZE		10

/** \brief Values of \f$V_a\f$ to test with. */
const int Va[TEST_SIZE] = {-600, 2000,  100,  555, -255, 3333, -765,  333, 200, -543};

/** \brief Values of \f$V_b\f$ to test with. */
const int Vb[TEST_SIZE] = {-888, 3000, -500, 7000, 1000, -123, -800, 9000, 789, -444};

/** \brief Values of \f$V_c\f$ to test with. */
const int Vc[TEST_SIZE] = { 100, -300, -100, 1000, -100, -500,  800, 1000, 189, -744};


/**
 * \brief Main function of the C testbench.
 *
 * The function SVPWM() will be called with the values of \f$V_a\f$, \f$V_b\f$ and \f$V_c\f$ in #Va, #Vb and #Vc
 * and the results will be printed along with separately calculated values.
 */
int main(){
	int i;
	hls::stream<int64_t> inputStream;
	hls::stream<int64_t> outputStream;
	int64_t tx_data, rx_data;
	int16_t ia, ib, ic, minv, maxv;
	int32_t voff, ea, eb, ec;
	
	// tx_data = (3000 << 16) | 2000;
	// inputStream << tx_data;
	for(i=0; i<TEST_SIZE; i++){
		tx_data = ((int64_t(Vc[i]) << 32) & 0xFFFF00000000) | ((int64_t(Vb[i]) << 16) & 0xFFFF0000) | (int64_t(Va[i]) & 0x0000FFFF);
		inputStream << tx_data;
	
		SVPWM(inputStream, outputStream);
		outputStream.read(rx_data);
		ia = int16_t(rx_data & 0xFFFF);
		ib = int16_t((rx_data >> 16) & 0xFFFF);
		ic = int16_t((rx_data >> 32) & 0xFFFF);
		// Voff= [min(Va, Vb, Vc)+max(Va, Vb, Vc)]/2
		// Vanew = Va – Voff
		// Vbnew = Vb – Voff
		// Vcnew = Vc – Voff
		minv = (Va[i] > Vb[i]) ? Vb[i] : Va[i];
		minv = (minv > Vc[i]) ? Vc[i] : minv;
		maxv = (Va[i] > Vb[i]) ? Va[i] : Vb[i];
		maxv = (Vc[i] > maxv) ? Vc[i] : maxv;
		voff = (minv + maxv) / 2;
		ea = Va[i] - voff;
		eb = Vb[i] - voff;
		ec = Vc[i] - voff;
		printf("Values is Ia=%d Ib=%d Ic=%d (%d, %d, %d)\n",ia ,ib ,ic, ea, eb, ec);
	}
}

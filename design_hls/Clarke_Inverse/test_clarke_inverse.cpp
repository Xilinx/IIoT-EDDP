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
 * \file 		test_clarke_inverse.cpp
 * \brief		Testbench for the inverse Clarke transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */
#include "clarke_inverse.h"

using namespace hls;

/** \brief Number of values to test with. */
#define TEST_SIZE		10

/** \brief Values of \f$V_\alpha\f$ to test Clarke_Inverse() with. */
int Valpha[TEST_SIZE] = {-600, 2000,  100,  555, -255, 3333, -765,  333, 200, -543};

/** \brief Values of \f$V_\beta\f$ to test Clarke_inverse() with. */
int Vbeta[TEST_SIZE]  = {-888, 3000, -500, 7000, 1000, -123, -800, 9000, 789, -444};

/**
 * \brief Main function of the C testbench.
 *
 * The function Clarke_Inverse() will be called with the values of \f$V_\alpha\f$ and \f$V_\beta\f$ in #Valpha and #Vbeta
 * and the results will be printed along with separately calculated values.
 */
int main(){
	int i;
	hls::stream<int32_t> inputStream;
	hls::stream<int64_t> outputStream;
	int32_t tx_data;
	int64_t rx_data;
	int16_t ia, ib, ic;
	float fa, fb, fc;
	
	for(i=0; i<TEST_SIZE; i++){
		tx_data = (int32_t(Vbeta[i]) << 16) | (int32_t(Valpha[i]) & 0x0000FFFF);
		inputStream << tx_data;
	
		Clarke_Inverse(inputStream, outputStream);

		outputStream.read(rx_data);
		ia = int16_t(rx_data & 0xFFFF);
		ib = int16_t((rx_data & 0xFFFF0000) >> 16);
		ic = int16_t((rx_data & 0xFFFF00000000) >> 32);
		
		fa = float(Valpha[i]);
		fb = (- float(Valpha[i]) + sqrt(3.0)*Vbeta[i])/2.0; 
		fc = (- float(Valpha[i]) - sqrt(3.0)*Vbeta[i])/2.0;
		printf("Values is Ia=%d Ib=%d Ic=%d (%f %f %f)\n",ia, ib, ic, fa, fb, fc);
	}
}

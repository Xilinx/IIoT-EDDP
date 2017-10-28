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
 * \file 		test_clarke_direct.cpp
 * \brief		Testbench for the Clarke transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */


#include "clarke_direct.h"
#include <math.h>


/**
 * \def TEST_SIZE
 * Loop count for the testbench.
 */
#define TEST_SIZE 1000

/**
 * \def MAX_VAL
 * Maximum value for 16 bit signed integer.
 */
#define MAX_VAL 32257

/**
 * \def M_PI
 * The value of \f$\pi\f$ as a floating point number.
 */
#define M_PI 3.14159265358979323846

using namespace hls;

/**
 * \brief Main function of the C testbench.
 *
 * The function Clarke_Direct() will be called 1000 times
 * with different values for \f$i_a\f$ and \f$i_b\f$
 * and the results will be printed along with separately calculated values.
 */
int main() {

	hls::stream<int32_t> inputStream;

	hls::stream<int32_t> outputStream;

	int32_t tx_data, rx_data;
	int16_t Ia, Ib, Ialpha, Ibeta;

	int i;
	float Iaf, Ibf, Theta_a, Theta_b;
	float Ialphaf, Ibetaf;
	
	for(i=0;i<TEST_SIZE;i++){
		Theta_a = ((2.0*M_PI)/float(TEST_SIZE))*i;
		Theta_b = ((2.0*M_PI)/float(TEST_SIZE))*i;
		Iaf = MAX_VAL*cos(Theta_a);
		Ibf = MAX_VAL*cos(Theta_b+M_PI/3);

		tx_data = (int32_t(round(Ibf))<<16) | (int32_t(round(Iaf)) & 0x0000FFFF);
		//----------------------------------------------------------------------------
		// Call the RTL function, prepare input values and read the result
		//
		inputStream << tx_data;						// send test data to input stream to be read by the function implemented in RTL
		Clarke_Direct(inputStream, outputStream);	// This function is executed as RTL simulation
		outputStream.read(rx_data);
		// End of function that interact with the function in RTL
		//-----------------------------------------------------------------------------

		Ialphaf = Iaf;
		Ibetaf = (Iaf + 2.0*Ibf)/sqrt(3.0);


		Ialpha = int16_t(rx_data & 0xFFFF);
		Ibeta = int16_t(rx_data >> 16);

		printf("\n%d Ialpha=%d(%.1f) Ib=%d(%.1f) Ibeta=%d(%.1f)\n",i, Ialpha,Ialphaf,int32_t(round(Ibf)),Ibf,Ibeta,Ibetaf);
	}
}

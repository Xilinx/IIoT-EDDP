/*!
 * \file 		test_park_direct.cpp
 * \brief		Testbench for the Park's transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */
#include "park_direct.h"
#include <math.h>

/** \brief Number of values to test with. */
#define TEST_SIZE 10

/** \brief Mathematical constant \f$\pi\f$. */
#define M_PI 3.14159265358979323846

/** \brief Values of \f$I_a\f$ to test Park_Direct() with. */
int Ia[TEST_SIZE] = {-600, 2000,  100,  555, -255, 3333, -765,  333, 200, -543};

/** \brief Values of \f$I_b\f$ to test Park_Direct() with. */
int Ib[TEST_SIZE] = {-888, 3000, -500, 7000, 1000, -123, -800, 9000, 789, -444};

using namespace hls;

/**
 * \brief Main function of the C testbench.
 *
 * The function Park_Direct() will be called with the values of \f$I_a\f$ and \f$I_b\f$ in #Ia and #Ib
 * and the results will be printed along with separately calculated values.
 */
int main(){
	hls::stream<int32_t> inputStream;
	hls::stream<int32_t> outputStream;
	int32_t tx_data, rx_data;
	int16_t Ialpha, Ibeta;
	int16_t Theta;
	float Iaf, Ibf, Thetaf;
	
	
	Theta = 100;
	for(int i=0; i<TEST_SIZE; i++){
		tx_data = (int32_t(Ib[i]) << 16) | (int32_t(Ia[i]) & 0x0000FFFF);
		inputStream << tx_data;
	
		Park_Direct(inputStream, outputStream, Theta);
		
		outputStream.read(rx_data);
		Ialpha = int16_t(rx_data & 0xFFFF);
		Ibeta = int16_t(rx_data >> 16);
		
		Thetaf = ((2*M_PI*2)/1000.0)*Theta;
		Iaf = float(Ia[i])*cos(Thetaf) + float(Ib[i]) * sin(Thetaf);
		Ibf = float(Ib[i])*cos(Thetaf) - float(Ia[i]) * sin(Thetaf);
		
		printf("Values is Ia=%d Ib=%d (%f %f)\n",Ialpha, Ibeta, Iaf, Ibf);
	}
}

/*!
 * \file 		test_park_inverse.cpp
 * \brief		Testbench for the inverse Park's transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */

#include "park_inverse.h"
#include <math.h>


/** \brief Number of values to test with. */
#define TEST_SIZE 10

/** \brief Mathematical constant \f$\pi\f$. */
#define M_PI 3.14159265358979323846

/** \brief Values of \f$V_d\f$ to test Park_Inverse() with. */
int Vd[TEST_SIZE] = {-600, 2000,  100,  555, -255, 3333, -765,  333, 200, -543};

/** \brief Values of \f$V_q\f$ to test Park_Inverse() with. */
int Vq[TEST_SIZE] = {-888, 3000, -500, 7000, 1000, -123, -800, 9000, 789, -444};

using namespace hls;

/**
 * \brief Main function of the C testbench.
 *
 * The function Park_Inverse() will be called with the values of \f$V_d\f$ and \f$V_q\f$ in #Vd and #Vq
 * and the results will be printed along with separately calculated values.
 */
int main(){
	hls::stream<int32_t> inputStream;
	hls::stream<int32_t> outputStream;
	int32_t tx_data, rx_data;
	int16_t Vdlpha, Vqeta;
	int16_t Theta;
	float Vdf, Vqf, Thetaf;
	
	
	Theta = 100;
	for(int i=0; i<TEST_SIZE; i++){
		tx_data = (int32_t(Vq[i]) << 16) | (int32_t(Vd[i]) & 0x0000FFFF);
		inputStream << tx_data;
	
		Park_Inverse(inputStream, outputStream, Theta);
		
		outputStream.read(rx_data);
		Vdlpha = int16_t(rx_data & 0xFFFF);
		Vqeta = int16_t(rx_data >> 16);
		
		Thetaf = ((2*M_PI*2)/1000.0)*Theta;
		Vdf = float(Vd[i])*cos(Thetaf) - float(Vq[i]) * sin(Thetaf);
		Vqf = float(Vq[i])*cos(Thetaf) + float(Vd[i]) * sin(Thetaf);
		
		printf("Values is Vd=%d Vq=%d (%f %f)\n",Vdlpha, Vqeta, Vdf, Vqf);
	}
}

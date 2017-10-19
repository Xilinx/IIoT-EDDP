/*!
 * \file 		pi_control.cpp
 * \brief		PI Controller
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */


#include "pi_control.h"
#include "ap_int.h"


// hls namespace has to be included in all HLS C source files.
using namespace hls;


/// \brief Clip the 32-bit argument in the given range, in the form of an inline HLS function.
/// \param x Value to be clipped.
/// \param x_min Minimum limit for the value.
/// \param x_max Maximum limit for the value.
/// \return Value #x clipped into the range #x_min ... #x_max.
static int32_t Clip32(const int32_t x, const int32_t x_min, const int32_t x_max)
{
#pragma HLS INLINE
	if (x < x_min) {
		return x_min;
	}
	else if (x > x_max) {
		return x_max;
	}
	else {
		return x;
	}
}

/// \brief A 48-bit signed integer type.
typedef ap_int<48>	int48_t;

/// \brief Clip the 48-bit argument in the given range, in the form of an inline HLS function.
/// \param x Value to be clipped.
/// \param x_min Minimum limit for the value.
/// \param x_max Maximum limit for the value.
/// \return Value #x clipped into the range #x_min ... #x_max.
static int48_t Clip48(const int48_t x, const int48_t x_min, const int48_t x_max)
{
#pragma HLS INLINE
	if (x < x_min) {
		return x_min;
	}
	else if (x > x_max) {
		return x_max;
	}
	else {
		return x;
	}
}


// See the header file for the description.
void PI_Control(hls::stream<int16_t> &s_axis, hls::stream<int16_t> &m_axis, int16_t Sp, int16_t Kp, int16_t Ki, int32_t mode, int32_t limit)
{
#pragma HLS interface axis port=m_axis
#pragma HLS interface axis port=s_axis
	int32_t	Err, GpE, GiE;
	int16_t	Res_Out;
	int16_t in_data;

	static int32_t GiE_prev = 0;
	static int32_t Mode_prev = 0;

	in_data = s_axis.read();				// Read one value from AXI4-Stream

	Err = Clip32(Sp - in_data, MIN_LIM, MAX_LIM);	// Calculate Error
	GpE = Err;
	GiE = Clip32(Err + (mode != Mode_prev ? 0 : GiE_prev), -limit, limit);
	Res_Out = Clip48((int48_t(Kp*GpE) + ((int48_t(Ki)*int48_t(GiE)) >> 8)) >> 8, MIN_LIM, MAX_LIM);

	GiE_prev = GiE;
	Mode_prev = mode;
	// Write output stream
	m_axis.write(Res_Out);								// Write result to the output stream
}

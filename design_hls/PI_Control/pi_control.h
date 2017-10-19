/*!
 * \file pi_control.h
 * \brief		PI Controller
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */

#ifndef PI_CONTROL_H
#define PI_CONTROL_H

#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <ap_cint.h>
#include <stdint.h>

/// \brief Maximum positive value for saturated arithmetic.
#define MAX_LIM				32767

/// \brief Minimum negative value for saturated arithmetic.
#define MIN_LIM				-32767

/**
 * \brief PI Controller as AXI4-Stream IP core
 * \param s_axis Input AXI4-Stream Feedback data as 16 bit signed integer values
 * \param m_axis Output AXI4-Stream Control
 * \param Sp Value of the setpoint
 * \param Kp Proportional coefficient
 * \param Ki Integral coefficient
 * \param mode Current operation mode of the FOC
 * \param limit Limit of the integral part of the control variable.
 * \return Functions implementing an IP core do not return a value.
 */
void PI_Control(hls::stream<int16_t> &s_axis, hls::stream<int16_t> &m_axis, int16_t Sp, int16_t Kp, int16_t Ki, int32_t mode, int32_t limit);

#endif	// PI_CONTROL_H

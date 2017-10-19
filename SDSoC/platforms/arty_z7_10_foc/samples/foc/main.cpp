/// \file main.cpp
/// \brief Implementation of the main function.
/// This file contains the Field-Oriented Control system implementation.
///
/// \author 		Oleksandr Kiyenko
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <stdio.h>
#include <unistd.h>

#include "sds_lib.h"
#include "arty_z7_10_foc.h"
#include "foc.h"


/// \brief The main function of an SDSoC project, that defines the field-oriented control (FOC) application.
int main(int argc, char* argv[])
{
	long long int rbuf[1];	// Variable for input stream data 
	long long int pbuf[1];	// Variable for output stream data 
	long long int cbuf[1];	// Variable for capture stream data
	int args[ARGS_SIZE];		// Function paramethers array
	int status[STATUS_SIZE];	// Function status array

	// System init sequence
	args[CONTROL_REG] 	= 0;			// Motor OFF
	args[FLUX_SP_REG]		= 0;			// Flux Sp = 0
	args[FLUX_KP_REG]		= 0xFFFFF000;	// Flux Kp = -176
	args[FLUX_KI_REG]		= 0;			// Flux Ki = 0
	args[TORQUE_SP_REG] 	= 0;			// Torque Sp (used only in debug modes)
	args[TORQUE_KP_REG] 	= 5000;			// Torque Kp = 1.0
	args[TORQUE_KI_REG] 	= 0;			// Torque Ki = 0
	args[RPM_SP_REG]		= 3000;			// Speed Sp = 3000 RPM
	args[RPM_KP_REG]		= -200;			// Speed Kp = 2.88
	args[RPM_KI_REG]		= -5;			// Speed Ki
	args[ANGLE_SH_REG]	= 719;			// Angle between encoder index and Phase A
	args[VD_REG] 			= 0xFFFFE300;	// Vd (used only in debug modes)
	args[VQ_REG] 			= 0xFFFFC100;		// Vq (used only in debug modes)
	args[FA_REG] 			= 18120;		// Filter coefficient A = 0.553
	args[FB_REG] 			= 14647;		// Filter coefficient A = 0.447
	args[CONTROL2_REG] 	= 10;			// Forced rotation speed

	// The following connects the FOC to the Hardware Platform.

    // Read from platform function
	pf_read_stream(rbuf);
	// FOC data processing
	foc(rbuf, pbuf, cbuf, args, status);
	// Write to platform function
	pf_write_stream(pbuf);
	// Write captured data to debug stream.
	dbg_write_stream(cbuf);

	return 0;
}

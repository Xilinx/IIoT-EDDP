/// \file  mylogf.cpp
/// \brief	Definitions of the logging function(s).
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include "mylogf.h"
#include <stdarg.h>
#include <stdio.h>




void mylogf(const char* fmt, ...)
{
	va_list	ap;
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
}

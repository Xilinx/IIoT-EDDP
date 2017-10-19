/// \file  mylogf.h
/// \brief	Declarations of the logging function(s).
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once


#if defined(__cplusplus)
extern "C" {
#endif


/// printf to the log. Every line is prefixed with date and time.
void mylogf(const char* fmt, ...)
#if !defined(_MSC_VER)
__attribute__ ((format (printf, 1, 2)))
#endif
;


#if defined(__cplusplus)
}
#endif

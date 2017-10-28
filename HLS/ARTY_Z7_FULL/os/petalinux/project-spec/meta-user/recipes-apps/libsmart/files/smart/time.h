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
/// \file  time.h
/// \brief	Declarations of time functions.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

/// \file Include it instead of "gettimeofday.h" and "time.h".

/// Only for C++ code.
#include <cstdint>
#include <string>

#ifdef _WIN32
#include <io.h>
#else
#include <syslog.h>
#include <sys/time.h>
#include <unistd.h>
#endif

namespace smart {

/// Number of .NET ticks per 1 second.
const unsigned int TICKS_PER_SECOND = 10*1000*1000;

// ----------------------------------------------------------------------------
/// .NET ticks, at various times.
namespace Ticks {
	/// 1969-01-01 00:00:00
	const std::uint64_t Y1969 = 621040608000000000;
	/// 1970-01-01 00:00:00
	const std::uint64_t Y1970 = 621355968000000000;
	/// 1970-02-01 00:00:00
	const std::uint64_t Y1970_FEBRUARY = 621382752000000000;
	/// 2016-01-01 00:00:00
	const std::uint64_t Y2016 = 635872032000000000;
	/// 2017-01-01 00:00:00
	const std::uint64_t Y2017 = 636188256000000000;
	/// 1999-01-01 00:00:00
	const std::uint64_t Y1999 = 630507456000000000;
	/// 2099-01-01 00:00:00
	const std::uint64_t Y2099 = 662065056000000000;

	/// Year of the build.
	const std::uint64_t YEAR_BUILD = Y2017;
}

/// Seconds, in Unix epoch, at various times.
namespace Seconds {
	/// 1970-01-01 00:00:00
	const unsigned int Y1970 = 0;

	/// 2000-01-01 00:00:00
	const unsigned int Y2000 = 946684800;

	/// 2017-01-01 00:00:00
	const time_t Y2017 = 1483228800u;

	/// Year of the build.
	const time_t	YEAR_BUILD = Y2017;
}

/// Time since system start, in microseconds.
std::uint64_t time_us();

/// Time since system start, in seconds.
/// This is slightly more effective than dividing the output of time_us() by 1000_000.
unsigned int time_seconds();

/// UTC time, in .NET DateTime ticks.
std::uint64_t time_ticks_utc();

/// Seconds since midnight, in local time zone.
unsigned int time_seconds_since_midnight();

/// Convert to Unix timestamp.
time_t unixtime_of_ticks_utc(const std::uint64_t ticks_utc);

/// Convert to .NET DateTime timestamp.
std::uint64_t ticks_utc_of_unixtime(const time_t ticks_utc);

/// Convert to ISO8601 time.
/// Example: "2014-04-07T17:54:27.333+02:00"
/// TODO: Year 2038 bug.
std::string iso8601_of_ticks_utc(const std::uint64_t ticks_utc);

#if !defined(_MSC_VER)
/**
 * Convert from ISO8601 time to UTC time comparable to the result of time_ticks_utc()
 * note: it discards milliseconds
 *
 * input:
 *   if date is missing then take current date
 *   if add part is missing then local time is given, otherwise time in specified zone
 *   if time part is missing then take it as 00:00:00.000
 * "YYYY-MM-DDT" => "YYYY-MM-DDT00:00:00+hh:mm"
 * "HH:MM" => "yyyy-mm-ddTHH:MM+hh:mm"
 * "HH:MM:SS" => "yyyy-mm-ddTHH:MM:SS+hh:mm"
 * "HH:MM+XX:YY" => "yyyy-mm-ddT(HH-XX+hh):(MM-YY+mm)+hh:mm"
 *
 * , where yyyy-mm-dd is system date
 * , where hh:mm is utc offset time of the system
 *
 * return:
 *   UTC time, in .NET DateTime ticks
 */
std::uint64_t utc_of_ticks_iso8601( const std::string& tics_iso8601 );

/**
 * Convert from ISO8601 time to UTC time comparable to the result of time_ticks_utc()
 * note: it discards milliseconds
 *
 * input:
 *   date part is discarded and 2000-01-01 is used instead
 *   add part is discarded and +00:00 is used
 *   if time part is missing then take it as 00:00:00.000
 * "YYYY-MM-DDT" => "2000-01-01T00:00:00+00:00" - "2000-01-01T00:00:00+00:00"
 * "HH:MM" => "2000-01-01THH:MM+00:00" - "2000-01-01T00:00:00+00:00"
 * "HH:MM:SS" => "2000-01-01THH:MM:SS+00:00" - "2000-01-01T00:00:00+00:00"
 * "HH:MM+XX:YY" => "2000-01-01THH:MM+00:00" - "2000-01-01T00:00:00+00:00"
 *
 * , where yyyy-mm-dd is system date
 * , where hh:mm is utc offset time of the system
 *
 * return:
 *   UTC time, in .NET DateTime ticks
 */
std::uint64_t utc_of_ticks_formmidnight_iso8601( const std::string& tics_iso8601 );
#endif

/// Convert to UTC, .NET DateTime ticks.
std::uint64_t ticks_utc_of_ole(const double ole_datetime);

/// Convert to OLE Automation datetime.
/// NB! The timezone offset variable 'timezone' must be valid; call tzset() after changing the timezone.
double ole_of_ticks_utc(const std::uint64_t ticks_utc);

#ifdef _WIN32
/// One-to-one match with ::Sleep
void usleep(const unsigned int time_us);
#endif

/// Sleep, in milliseconds. Performs alertable sleep on Win32.
void msleep(const unsigned int time_ms);

} // namespace smart

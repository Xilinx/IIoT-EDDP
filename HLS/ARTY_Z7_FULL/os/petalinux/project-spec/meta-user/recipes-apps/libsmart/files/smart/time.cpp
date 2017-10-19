/// \file  time.cpp
/// \brief	Definitions of time functions.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH


#ifdef _WIN32
#	define WIN32_LEAN_AND_MEAN
#	include <Windows.h>		// Win32 API
#else
#	include <sys/time.h>
#	include <unistd.h>
#endif
#include <string.h>	// memset
#include <time.h>

#include "string.h"	// ssprintf, etc.
#include "time.h"	// ourselves.

#if defined(_MSC_VER)
#pragma warning(disable: 4244)
#endif

namespace smart {
#if defined(WIN32)
static LARGE_INTEGER _timer_frequency = { 0 };
static LARGE_INTEGER _timer_begin_time = { 0 };
#define	gmtime_r(ptr_to_t, ptr_to_tm)		gmtime_s((ptr_to_tm), (ptr_to_t))
#define	localtime_r(ptr_to_t, ptr_to_tm)	localtime_s((ptr_to_tm), (ptr_to_t))
static LARGE_INTEGER _timer_end_time()
{
	if (_timer_frequency.QuadPart == 0) {
		QueryPerformanceFrequency(&_timer_frequency);
		QueryPerformanceCounter(&_timer_begin_time);
	}

	LARGE_INTEGER	end_time;
	QueryPerformanceCounter(&end_time);
	return end_time;
}
#else
static struct timespec tv0 = { 0, 0 };
static struct timespec _timer_end_time()
{
	if (tv0.tv_sec==0 && tv0.tv_nsec==0) {
		clock_gettime(CLOCK_MONOTONIC, &tv0);
	}
	// 1. Get the time.
	struct timespec	ts;
	clock_gettime(CLOCK_MONOTONIC, &ts);
	return ts;
}
#endif

// --------------------------------------------------------------------------------------------------------------------
std::uint64_t time_us()
{
#ifdef _WIN32
	const LARGE_INTEGER	end_time = _timer_end_time();
	const std::uint64_t	r = (1000*1000*(end_time.QuadPart - _timer_begin_time.QuadPart)) / (_timer_frequency.QuadPart);
	return r;
#else
	// 1. Get the time.
	struct timespec	ts = _timer_end_time();

	// 2. Prepare for subtract.
	while (ts.tv_nsec < tv0.tv_nsec) {
		ts.tv_nsec += 1000u*1000u*1000u;
		ts.tv_sec -= 1;
	}

	// 3. Subtract from 0-time.
	const std::uint64_t	ts_sec_as_us = ((std::uint32_t)(ts.tv_sec - tv0.tv_sec)) * 1000000ULL;
	const std::uint64_t	ts_nsec_as_us = (ts.tv_nsec - tv0.tv_nsec) / 1000ULL;
	const auto r = ts_sec_as_us + ts_nsec_as_us;
	return r;
#endif
}

// --------------------------------------------------------------------------------------------------------------------
unsigned int time_seconds()
{
#ifdef _WIN32
	const LARGE_INTEGER	end_time = _timer_end_time();
	const unsigned int	r = (end_time.QuadPart - _timer_begin_time.QuadPart) / (_timer_frequency.QuadPart);
	return r;
#else
	struct timespec		ts = _timer_end_time();
	const unsigned int	r = ts.tv_sec - tv0.tv_sec;
	return r;
#endif
}

/// .Net DateTime.Ticks at the beginning of Unix epoch.
static const std::uint64_t	ticks_unix_epoch = 621355968000000000ULL;

// --------------------------------------------------------------------------------------------------------------------
std::uint64_t time_ticks_utc()
{
#if defined(WIN32)
	FILETIME	ft;
	GetSystemTimeAsFileTime(&ft);
	ULONGLONG ticks = (ULONGLONG(ft.dwHighDateTime) << 32) | ft.dwLowDateTime;
	return ticks + 0x701ce1722770000ULL;
#else
	struct timespec	ts = { 0, 0 };
	clock_gettime(CLOCK_REALTIME, &ts);
	const std::uint64_t	ts_sec_ticks = ((std::uint64_t)ts.tv_sec) * static_cast<std::uint64_t>(TICKS_PER_SECOND);
	const std::uint64_t	ts_nsec_ticks = ((std::uint64_t)ts.tv_nsec) / 100ULL;
	const auto r = ticks_unix_epoch + ts_sec_ticks + ts_nsec_ticks;
	return r;
#endif
}

// --------------------------------------------------------------------------------------------------------------------
unsigned int time_seconds_since_midnight()
{
	const time_t	t_now = time(nullptr);
	struct tm		tm_now = {};

	localtime_r(&t_now, &tm_now);

	const unsigned int	r = static_cast<unsigned int>(tm_now.tm_hour*3600 + tm_now.tm_min*60 + tm_now.tm_sec);
	return r;
}

// --------------------------------------------------------------------------------------------------------------------
time_t unixtime_of_ticks_utc(const std::uint64_t ticks_utc)
{
	const std::uint64_t	unix_ticks = ticks_utc - ticks_unix_epoch;
	const time_t		unix_seconds = unix_ticks / TICKS_PER_SECOND;
	return unix_seconds;
}

std::uint64_t ticks_utc_of_unixtime(const time_t unix_seconds )
{
	const std::uint64_t	ts_sec_ticks = ((std::uint64_t)unix_seconds) * static_cast<std::uint64_t>(TICKS_PER_SECOND);
	const auto r = ticks_unix_epoch + ts_sec_ticks;
	return 	r;
}

// --------------------------------------------------------------------------------------------------------------------
static int utc_offset_in_seconds(const time_t	utc_time)
{
	struct tm timeinfo;
	gmtime_r(&utc_time, &timeinfo);

	const time_t utc = mktime(&timeinfo);
	localtime_r(&utc_time, &timeinfo);
	const time_t local = mktime(&timeinfo);

	// Get offset in hours from UTC
	const int	offset_from_utc = (utc - local) + (timeinfo.tm_isdst ? (-3600) : 0);

	return -offset_from_utc;
}

// --------------------------------------------------------------------------------------------------------------------
// "2014-04-07T17:54:27.333+02:00"
std::string
iso8601_of_ticks_utc(const std::uint64_t ticks_utc)
{
	/// TODO: Year 2038 bug.
	const std::uint64_t	unix_ticks = ticks_utc - ticks_unix_epoch;
	const time_t		unix_seconds = unix_ticks / TICKS_PER_SECOND;
	const std::uint32_t	unix_milliseconds = (unix_ticks - static_cast<std::uint64_t>(TICKS_PER_SECOND)* ((const std::uint32_t)unix_seconds)) / (10U * 1000U);

	const int		offset_total_seconds = utc_offset_in_seconds(unix_seconds);

	struct tm		ltm = { 0, 0 };

	localtime_r(&unix_seconds, &ltm);

	char	buf1[128];
	strftime(buf1, sizeof(buf1), "%Y-%m-%dT%H:%M:%S", &ltm);

	const int	sgn = offset_total_seconds >= 0 ? 1 : (-1);
	const int	absolute_offset_total_seconds = sgn * offset_total_seconds;
	const int	offset_hours = absolute_offset_total_seconds / 3600;
	const int	offset_minutes = (absolute_offset_total_seconds - offset_hours * 3600) / 60;
	const auto r = ssprintf("%s.%03u%c%02d:%02d",
		buf1, unix_milliseconds, (offset_total_seconds >= 0 ? '+' : '-'), offset_hours, offset_minutes);
	return r;
}

static const std::uint64_t	NET_TICKS_PER_DAY = 86400ULL * 10000000ULL;
static const std::uint64_t	OLE_EPOCH_TICKS = 599264352000000000ULL;

#if !defined(_MSC_VER)
// "2014-04-07T17:54:27.333+02:00"
// adds date part if missing 'T'
std::uint64_t utc_of_ticks_iso8601( const std::string& tics_iso8601 )
{
	std::string rs("");

	// reconstruct the string, if some parts are missinfg
	// if date is missing then take current date
	// if add part is missing then local time is given, otherwise time with different timezone is given
	// if time part is missing then take it as 00:00:00.000
	auto pos_T = tics_iso8601.find_first_of('T');

	// check date part
	if( pos_T == std::string::npos )
	{
		// No date part presented, take current date
		auto now = iso8601_of_ticks_utc(time_ticks_utc());
		rs = now.substr(0, now.find_first_of('T')) + "T";
		pos_T = 0;
	}
	else
	{
		rs = tics_iso8601.substr(0,pos_T) + "T";
		pos_T++;
	}

	auto pos_P = tics_iso8601.find_first_of("+-", pos_T);
	bool _utcoffset = pos_P != std::string::npos;
	if( ! _utcoffset ) pos_P = tics_iso8601.length();
	int provided_offset = 0;
	if( _utcoffset )
	{
		auto offset = tics_iso8601.substr(pos_P+1);
		struct tm _asnumbers;  memset(&_asnumbers, 0, sizeof(struct tm));
		strptime( offset.c_str(), "%H:%M", &_asnumbers );
		provided_offset = _asnumbers.tm_hour * 3600 + _asnumbers.tm_min * 60;
		if( tics_iso8601[pos_P] == '-' )
			provided_offset = -provided_offset;
		//printf( "provided_offset=%d\n",provided_offset);
	}

	// check time part
	if( pos_P-pos_T <= 0 )
	{
		rs += "00:00:00.000";
	}
	else
	{
		rs += tics_iso8601.substr(pos_T, pos_P-pos_T);
	}

	// convert the time representation into numbers

	struct tm _asnumbers;  memset(&_asnumbers, 0, sizeof(struct tm));

	strptime( rs.c_str(), "%Y-%m-%dT%H:%M:%S", &_asnumbers );

	time_t rtmt = mktime( &_asnumbers );

	//printf( "%s  %llu\n", rs.c_str(), (std::uint64_t)rtmt );

	// if no utc offset is provided, means local time is given
	if( _utcoffset )
		rtmt = rtmt - provided_offset + utc_offset_in_seconds(rtmt);

	//printf( "%s  %llu\n", rs.c_str(), (std::uint64_t)rtmt );

	return ticks_utc_of_unixtime( rtmt );
}

// calculates number of ticks starting "00:00" ignoring the Date and timezone part.
std::uint64_t utc_of_ticks_formmidnight_iso8601( const std::string& tics_iso8601 )
{
	std::string rs("2000-01-01T");
	std::string midnight("2000-01-01T00:00");

	// reconstruct the string, if some parts are missinfg
	// if date is missing then take current date
	// if add part is missing then local time is given, otherwise time with different timezone is given
	// if time part is missing then take it as 00:00:00.000
	size_t pos_T = tics_iso8601.find_first_of('T');

	// check date part
	if( pos_T == std::string::npos )
	{
		// No date part presented
		pos_T = 0;
	}
	else
		pos_T++;

	size_t pos_P = tics_iso8601.find_first_of("+-", pos_T);
	if( pos_P == std::string::npos )
	{
			pos_P = tics_iso8601.length();
	}

	// check time part
	if( pos_P-pos_T <= 0 )
	{
		rs += "00:00:00.000";
	}
	else
	{
		rs += tics_iso8601.substr(pos_T, pos_P-pos_T);
	}

	//printf( "rs=%s(%lld) md=%s(%lld)\n", rs.c_str(), utc_of_ticks_iso8601( rs ), midnight.c_str(), utc_of_ticks_iso8601( midnight )  );
	return utc_of_ticks_iso8601( rs ) - utc_of_ticks_iso8601( midnight );
}
#endif

// --------------------------------------------------------------------------------------------------------------------
std::uint64_t ticks_utc_of_ole(const double ole_datetime)
{
	const auto ticks = OLE_EPOCH_TICKS + (std::uint64_t)(ole_datetime * NET_TICKS_PER_DAY);
	return ticks;
}

// --------------------------------------------------------------------------------------------------------------------
double ole_of_ticks_utc(const std::uint64_t ticks_utc)
{
	const std::uint64_t	ole_ticks = ticks_utc - OLE_EPOCH_TICKS;
	const unsigned int	ole_days = ole_ticks / NET_TICKS_PER_DAY;
	const std::uint64_t	ticks_remaining = ole_ticks - ole_days * NET_TICKS_PER_DAY;
	double r = ole_days;
	r = r + (double)ticks_remaining / (double)NET_TICKS_PER_DAY;
	r = r - timezone * (1.0 / 86400.0);
	return r;
}

#ifdef _WIN32
// --------------------------------------------------------------------------------------------------------------------
void usleep(const unsigned int time_us)
{
	::Sleep(time_us / 1000);
}
#endif

// --------------------------------------------------------------------------------------------------------------------
void msleep(const unsigned int time_ms)
{
#if defined(WIN32)
	// TODO: do it in a loop?
	SleepEx(time_ms, TRUE);
#else
	usleep(time_ms * 1000u);
#endif
}

} // namespace smart

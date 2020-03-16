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
/// \file  string.cpp
/// \brief	Definitions of string processing functions.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

//On GNU systems the default is NOT to define vsnprintf...
#ifndef _GNU_SOURCE
#	define	_GNU_SOURCE
#endif
#include <string>		// std::string
#include <exception>	// std::exception
#include <stdexcept>	// std::runtime_error


#if !defined(__STDC_FORMAT_MACROS)
#define __STDC_FORMAT_MACROS
#endif
#include <inttypes.h>	// PRId64, etc.
#include <stdarg.h>		// va_list
#include <string.h>		// strlen

#include "string.h"		// ourselves.

#if defined(_MSC_VER)
#define	strcasecmp	_stricmp
#define	sscanf1(ss_buf, ss_fmt, ss_param1)	sscanf_s((ss_buf), (ss_fmt), (ss_param1))
#else
#define	sscanf1(ss_buf, ss_fmt, ss_param1)	sscanf((ss_buf), (ss_fmt), (ss_param1))
#endif


namespace smart {
// --------------------------------------------------------------------
void vssprintf(std::string&	buf, const char*	fmt, va_list		ap)
{
	// The "va_list" is undefined after use. That's why we make a copy.
	va_list	ap_backup;
	va_copy(ap_backup, ap);
	buf.resize(strlen(fmt) + 20);
	for (;;) {
		// note: \0 at the end is not counted by vsnprintf, it will be counted explicitly.
#if defined(_MSC_VER)
		const int	n = _vsnprintf_s(&buf[0], buf.size(), _TRUNCATE, fmt, ap);
#else
		const int	n = vsnprintf(&buf[0], buf.size(), fmt, ap);
#endif
		if (n >= 0 && n<static_cast<int>(buf.size())) {
			// yes, finished.
			buf.resize(n);
			break;
		}
		else {
			if (n>0) {
				// vsnprintf told us how much to use.
				buf.resize(n + 1);
			}
			else {
				// guesswork.
				buf.resize(2 * buf.size() + 1);
			}
		}
		va_copy(ap, ap_backup);
	}
}

// --------------------------------------------------------------------
std::string vssprintf(const char*	fmt, va_list		ap)
{
	std::string	buf;
	vssprintf(buf, fmt, ap);
	return buf;
}

// --------------------------------------------------------------------
void ssprintf(std::string&	buf, const char*	fmt, ...)
{
	va_list	ap;
	va_start(ap, fmt);
	vssprintf(buf, fmt, ap);
	va_end(ap);
}

// --------------------------------------------------------------------
std::string ssprintf(const char*	fmt, ...)
{
	std::string	buf;
	va_list		ap;

	va_start(ap, fmt);
	vssprintf(buf, fmt, ap);
	va_end(ap);
	return buf;
}

/*****************************************************************************/
std::string string_of_int(int i)
{
	std::string xbuf;
	ssprintf(xbuf, "%d", i);
	return xbuf;
}

/*****************************************************************************/
std::string string_of_double(double	d, const char*	fmt)
{
	std::string xbuf;
	ssprintf(xbuf, fmt, d);
	return xbuf;
}

/*****************************************************************************/
std::string string_of_bool(bool b, const bool as_int)
{
	if (as_int)
		return b ? "1" : "0";
	return b ? "true" : "false";
}

/*****************************************************************************/
bool int_of(const std::string& s, int&	i)
{
	if (s.size()>2 && s[0] == '0' && toupper(s[1]) == 'X') {
		return sscanf1(s.c_str() + 2, "%x", &i)>0;
	}
	return sscanf1(s.c_str(), "%d", &i)>0;
}

/*****************************************************************************/
bool int_of(const char*	s, int&	i)
{
	if (strlen(s)>2 && s[0] == '0' && toupper(s[1]) == 'X') {
		return sscanf1(s + 2, "%x", &i)>0;
	}
	return sscanf1(s, "%d", &i)>0;
}

/*****************************************************************************/
bool double_of(const std::string& s, double& d)
{
	return sscanf1(s.c_str(), "%lf", &d)>0;
}

/*****************************************************************************/
bool double_of(const char* s, double& d)
{
	return sscanf1(s, "%lf", &d)>0;
}

/*****************************************************************************/
double double_of(const std::string&	s)
{
	double  d;
	const int   r = sscanf1(s.c_str(), "%lf", &d);
	if (r != 1) {
		throw std::runtime_error(ssprintf("Not a floating point: %s", s.c_str()));
	}
	return d;
}

/*****************************************************************************/
bool bool_of(const std::string& s, bool& b)
{
	if (strcasecmp(s.c_str(), "true") == 0) {
		b = true;
		return true;
	}
	else if (strcasecmp(s.c_str(), "false") == 0) {
		b = false;
		return true;
	}
	int	foo;
	if (int_of(s, foo)) {
		b = foo != 0;
		return true;
	}
	return false;
}

/*****************************************************************************/
bool bool_of(const std::string& s)
{
	bool r = false;
	if (bool_of(s, r)) {
		return r;
	}
	else {
		throw std::runtime_error(ssprintf("Not a boolean: %s", s.c_str()));
	}
}

/*****************************************************************************/
static bool uint_of(const char* s, const unsigned int s_size, unsigned int& u)
{
	int             r;
	if (s_size>2u && s[0] == '0' && toupper(s[1]) == 'X') {
		// Convert hexadecimal.
		r = sscanf1(s + 2, "%x", &u);
	}
	else {
		// Convert decimal.
		r = sscanf1(s, "%u", &u);
	}
	return r>0;
}

/*****************************************************************************/
unsigned int uint_of(const std::string&	s)
{
	unsigned int	u = 0;
	if (uint_of(s.c_str(), s.size(), u)) {
		return u;
	}
	else {
		throw std::runtime_error(ssprintf("Not an unsigned integer: '%s'.", s.c_str()));
	}
}

/*****************************************************************************/
int int_of(const std::string& s)
{
	int		i;
	const int	r = sscanf1(s.c_str(), "%d", &i);
	if (r <= 0)
		throw std::runtime_error(ssprintf("Not an integer: '%s'.", s.c_str()));
	return i;
}

/*****************************************************************************/
std::uint64_t uint64_of(const std::string&	s)
{
	std::uint64_t	u = 0;
	int             r = -1;
	if (s.size()>2 && s[0] == '0' && toupper(s[1]) == 'X') {
		// Convert hexadecimal.
		r = sscanf1(s.c_str() + 2, "%" PRIx64, &u);
	}
	else {
		// Convert decimal.
		r = sscanf1(s.c_str(), "%" PRIu64, &u);
	}
	if (r <= 0) {
		throw std::runtime_error(ssprintf("Not an unsigned 64-bit integer: '%s'.", s.c_str()));
	}
	return u;
}

/*****************************************************************************/
std::int64_t int64_of(const std::string& s)
{
	std::int64_t	i;
	int				r = -1;
	if (s.size()>2 && s[0] == '0' && toupper(s[1]) == 'X') {
		r = sscanf1(s.c_str() + 2, "%" PRIx64, &i);
	}
	else {
		r = sscanf1(s.c_str(), "%" PRId64, &i);
	}
	if (r <= 0) {
		throw std::runtime_error(ssprintf("Not a 64-bit integer: '%s'.", s.c_str()));
	}
	return i;
}

/*****************************************************************************/
bool bool_of(const char* s, bool& b)
{
	if (strcasecmp(s, "true") == 0) {
		b = true;
		return true;
	}
	else if (strcasecmp(s, "false") == 0) {
		b = false;
		return true;
	}
	int	foo;
	if (int_of(s, foo)) {
		b = foo != 0;
		return true;
	}
	return false;
}

/*****************************************************************************/
bool uint_of(const std::string& s, unsigned int& u)
{
	return uint_of(s.c_str(), s.size(), u);
}

/*****************************************************************************/
bool uint_of(const char* s, unsigned int& u)
{
	return uint_of(s, strlen(s), u);
}

/*****************************************************************************/
bool ushort_of(const std::string& s, unsigned short& i)
{
	unsigned int    u;
	const bool      r = uint_of(s, u);
	if (r) {
		i = u;
	}
	return r;
}

/*****************************************************************************/
int stringcasecmp(const std::string& s1, const std::string& s2)
{
#if defined(_MSC_VER)
	return _stricmp(s1.c_str(), s2.c_str());
#else
	return strcasecmp(s1.c_str(), s2.c_str());
#endif
}

/********************************************************************************/
static inline bool myisspace(const char c)
{
    return c==' ' || c=='\t' || c=='\r' || c=='\n';
}

/********************************************************************************/
std::string trim( const std::string& s)
{
	if (s.size()==0) {
		return s;
	}
	int	start_pos = 0;
	int	i; //loop variable
	for (i = 0; i < static_cast<int>(s.size()); ++i) {
		if (!myisspace(s[i])) {
			start_pos = i;
			break;
		}
	}
	int	n = 0;
	for (i = s.size() - 1; i >= start_pos; --i) {
		if (!myisspace(s[i])) {
			n = i - start_pos + 1;
			break;
		}
	}
	if (start_pos == 0 && n == static_cast<int>(s.size())) {
		return s;
	}
	else {
		return s.substr(start_pos, n);
	}
}

// --------------------------------------------------------------------------------------------------------------------
int split(std::vector<std::string>&	v, const std::string& s, const char* sep)
{
	if (sep == nullptr || *sep == 0) {
		return -1;
	}

	unsigned int	sofar = 0;
	bool			seplast = true;	// separator last?
	for (unsigned int i = 0; i<s.size(); ++i) {
		const char*	sep_pos = strchr(sep, s[i]);
		const bool	is_sep = sep_pos != NULL;
		if (is_sep) {
			if (!seplast) {
				v.push_back(s.substr(sofar, i - sofar));
			}
			sofar = i + 1;
			seplast = true;
		}
		seplast = is_sep;
	}
	v.push_back(s.substr(sofar, s.size() - sofar));
	return v.size();
}

// --------------------------------------------------------------------------------------------------------------------
bool ends_with(const std::string& s, const std::string& sEnd)
{
	if (sEnd.size()>0 && sEnd.size()<s.size()) {
		const unsigned int	ofs = s.size() - sEnd.size();
		for (unsigned int i=0; i<sEnd.size(); ++i) {
			if (s[ofs + i] != sEnd[i]) {
				return false;
			}
		}
		return true;
	}
	else {
		return false;
	}
}

} // namespace smart

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
/// \file  string.h
/// \brief	Declarations of string processing functions.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once


#include <cstdint>	// std::int8_t
#include <string>	// std::string
#include <vector>	// std::vector

#include <stdarg.h>	// va_list


namespace smart {
/// a'la sprintf.
void vssprintf(std::string&	buf, const char*	fmt, va_list		ap);

/// a'la sprintf.
std::string vssprintf(const char*	fmt, va_list		ap);

/// a'la sprintf.
std::string ssprintf( const char*	fmt, ...);

/// a'la sprintf.
void ssprintf(std::string&	buf, const char*	fmt, ...);

/// Convert the integer \c i to string. Default is to use Arabic numbers.
std::string string_of_int(int i);

/// Convert the floating point value \c d to string.
std::string
string_of_double(double d, const char* fmt);

/// Convert the boolean value \c b to string.
std::string string_of_bool(bool b, const bool as_int = false);

/// Try to convert the string in \c s to a integer in \c i and
/// return whether it was successful or not.
/// Hex sentences are recognized if they are prefixed with 0x or 0X.
bool int_of(const std::string& s, int& i);


/// Try to convert the string in \c s to a integer in \c i and
/// return whether it was successful or not.
/// Hex sentences are recognized if they are prefixed with 0x or 0X.
bool int_of(const char* s, int& i);

/// Try to convert the string in \c s to a double in \c d and
/// return whether it was successful or not.
bool double_of(const std::string& s, double& d);

/// Try to convert the string in \c s to a double in \c d and
/// return whether it was successful or not.
bool double_of(const char* s, double& d);

/// Try to convert the string in \c s to a double in \c d.
/// Throws exceptions on failures.
double double_of(const std::string& s);

/// Try to convert the string in \c s to a bool in \c d and
/// return whether it was successful or not.
bool bool_of(const std::string& s, bool& d);

/// Try to convert the string in \c s to a bool in \c d and
/// return whether it was successful or not.
bool bool_of(const char*& s, bool& d);

/// Try to convert the string in \c s to a bool in \c d and
/// return whether it was successful or not.
bool bool_of(const char*& s, bool& d);

/// Try to convert the string in \c s to a bool.
/// Throw exceptions on failure.
bool bool_of(const std::string&	s);

/// Convert string to unsigned int, throw exception when conversion fails.
unsigned int uint_of(const std::string&	s);

/// Convert string to int, throw exception when conversion fails.
int int_of(const std::string& s);

/// Convert string to uint64_t, throw exception when conversion fails.
std::uint64_t uint64_of(const std::string& s);

/// Convert string to int64_t, throw exception when conversion fails.
std::int64_t int64_of(const std::string& s);

/// Convert string to unsigned int, returns false when conversion fails.
bool uint_of(const std::string&	s, unsigned int& i);

/// Convert string to unsigned int, returns false when conversion fails.
bool uint_of(const char* s, unsigned int& i);

/// Convert string to unsigned short, returns false when conversion fails.
bool ushort_of(const std::string& s, unsigned short& i);


/// Case-insensitive string compare.
int stringcasecmp(const std::string&	s1, const std::string&	s2);

/// Remove the whitespaces (spaces, tabs, line feeds, carriage returns) from both ends of the string.
std::string trim(const std::string&	s);

/// Split a string by the characters given. Consequental separators are treated as one.
int split(std::vector<std::string>&	v, const std::string& s, const char* sep);

/// Does the string end with a given string?
bool ends_with(const std::string& s, const std::string& sEnd);

} // namespace smart

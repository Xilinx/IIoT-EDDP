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
/// \file  Process.h
/// \brief	Declarations of functions for process control.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <string>

namespace smart {

/// Process control.
namespace Process {

/// Create new process.
/// This function closes all file descriptors except standard ones before starting the process.
/// Very little command line parsing is done; no apostrophes recognized.
/// Error reporting by return code.
/// \param command Command to be executed.
/// \return Error code on failure when < 0, or PID of the process.
int create(const std::string& command);

/// Wait for the pid.
/// Swallow errors.
/// \return
int wait(const int pid);

/// Important: Use this instead of system() to avoid the problem of sharing file descriptors with the possibly long-running background program!
/// Exactly as 'system', however, close all file descriptors except standard ones after fork().
/// This does very simple parsing of the command line and doesn't recognize apostrophes, etc.
/// Error reporting by return code.
/// \param command Command to be executed.
/// \return Error code on failure when < 0, or PID of the process.
int safeSystem(const std::string& command);


} // namespace Process
} // namespace smart

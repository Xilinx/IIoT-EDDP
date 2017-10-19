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

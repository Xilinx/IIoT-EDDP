/// \file  Process.cpp
/// \brief	Definitions of functions for process control.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <vector>

#include <dirent.h>	// struct DIR, opendir, etc.
#include <pthread.h>	// pthread_create
#include <stdio.h>	// fprintf
#include <stdio.h>	// STDIN_FILENO, etc.
#include <unistd.h>	// open, fork, execlp
#include <sys/wait.h>		// waitpid

#include "Process.h"
#include "string.h"	// int_of

namespace smart {
namespace Process {

// --------------------------------------------------------------------------------------------------------------------
int create(const std::string& cmd)
{
	const int	child_pid = fork();

	// 2. Arguments for the exec.
	// Strictly speaking, only child needs them, however, this way it is easier to debug.
	std::string			s_cmd = cmd;
	std::vector<char*>	argv;
	const bool			is_background = cmd.size()>0u && cmd[cmd.size()-1u]=='&';

	unsigned int		first_nonspace = 0;
	unsigned int		first_space;

	if (is_background) {
		s_cmd.resize(s_cmd.size()-1u);
	}

	while (first_nonspace < s_cmd.size()) {
		argv.push_back(&s_cmd[first_nonspace]);
		first_space = s_cmd.size();
		for (unsigned int i=first_nonspace + 1; i<s_cmd.size(); ++i) {
			if (s_cmd[i]==' ') {
				first_space = i;
				s_cmd[i] = 0;
				break;
			}
		}
		first_nonspace = first_space + 1;
	}
	argv.push_back(nullptr);

	if (child_pid < 0) {
		return child_pid;
	}
	else if (child_pid == 0) {
		// 1. Close off all file descriptors bigger than STDXX_FILENO
		DIR*	dirp = opendir("/proc/self/fd");
		if (dirp != nullptr) {
			struct dirent*	e;
			while ((e = readdir(dirp)) != nullptr) {
				int	fd = STDIN_FILENO;
				if (e->d_name[0]!='.' && int_of(e->d_name, fd)) {
					if (fd > STDERR_FILENO) {
						close(fd);
					}
				}
			}
			closedir(dirp);
		}

		// 2. Invoke the program.
		const int r_exec = execvp(s_cmd.c_str(), &argv[0]);
		_exit(r_exec);
	}
	else {
		return child_pid;
	}
}

// --------------------------------------------------------------------------------------------------------------------
int wait(const int pid)
{
	if (pid < 0) {
		return pid;
	}
	int status = 0;
	const int	r_waitpid = waitpid(pid, &status, 0);
	if (r_waitpid == -1) {
		return r_waitpid;
	}
	return WEXITSTATUS(status);
}

// --------------------------------------------------------------------------------------------------------------------
int safeSystem(const std::string& command)
{
	const int	child_pid = create(command);
	if (child_pid < 0) {
		return child_pid;
	}
	else {
		return wait(child_pid);
	}
}

} // namespace Process
} // namespace smart

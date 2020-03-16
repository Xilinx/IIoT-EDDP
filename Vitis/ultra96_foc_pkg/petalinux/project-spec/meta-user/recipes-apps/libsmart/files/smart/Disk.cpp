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
/// \file  Disk.cpp
/// \brief	Definitions of the namespace Disk.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <stdexcept>	// std::exception
#include <ctype.h>	// isspace

#include "File.h"	// File::readAllLines
#include "string.h"	// uint_of, ssprintf
#include "Disk.h"	// ourselves.

#if !defined(WIN32)
#include <linux/limits.h>	// PATH_MAX
#include <sys/mount.h>		// mount, umount.
#include <unistd.h>		// readlink
#endif

#if defined(WIN32)
#define	PROC_PARTITIONS	"partitions.txt"
#define	PROC_MOUNTS	"mounts.txt"
#else
#define	PROC_PARTITIONS	"/proc/partitions"
#define	PROC_MOUNTS	"/proc/mounts"
#endif


namespace smart {
namespace Disk {

// --------------------------------------------------------------------------------------------------------------------
static std::string get_next_token(const std::string& s, unsigned int& last_start, unsigned int& last_end)
{
	// 1. start_index
	unsigned int	start_index = last_end;
	while (start_index<s.size() && isspace(s[start_index])) {
		++start_index;
	}
	if (start_index >= s.size()) {
		return std::string();
	}

	// 2. end_index
	unsigned int	end_index = start_index + 1u;
	while (end_index<s.size() && !isspace(s[end_index])) {
		++end_index;
	}

	last_start = start_index;
	last_end = end_index;
	return s.substr(start_index, end_index-start_index);
}

// --------------------------------------------------------------------------------------------------------------------
bool Mount::isReadonly() const
{
	return options.size()>=2 && options[0]=='r' && options[1]=='w';
}

// --------------------------------------------------------------------------------------------------------------------
void getPartitions(std::vector<Partition>& partitions)
{
	std::vector<std::string>	lines;
	File::readAllLines(lines, PROC_PARTITIONS);

	Partition		part;
	for (const auto& line : lines) {
		unsigned int	last_start = 0;
		unsigned int	last_end = 0;

		const auto	s_major =	get_next_token(line, last_start, last_end);
		const auto	s_minor =	get_next_token(line, last_start, last_end);
		const auto	s_blocks =	get_next_token(line, last_start, last_end);
		part.name  = get_next_token(line, last_start, last_end);

		if (part.name.size()>0 && uint_of(s_major, part.major) && uint_of(s_minor, part.minor) && uint_of(s_blocks, part.blocks)) {
			partitions.push_back(part);
		}
	}
}

// --------------------------------------------------------------------------------------------------------------------
void getMounts(std::vector<Mount>& mounts)
{
	std::vector<std::string>	lines;
	File::readAllLines(lines, PROC_MOUNTS);

	Mount			mount;
	for (const auto& line : lines) {
		unsigned int	last_start = 0;
		unsigned int	last_end = 0;

		mount.device =		get_next_token(line, last_start, last_end);
		mount.mount_point =	get_next_token(line, last_start, last_end);
		mount.filesystem =	get_next_token(line, last_start, last_end);
		mount.options =		get_next_token(line, last_start, last_end);
		if (mount.options.size()>0) {
			mounts.push_back(mount);
		}
	}
}

// --------------------------------------------------------------------------------------------------------------------
std::string getSystemDevicePath(const std::string& blockDeviceName)
{
#if !defined(WIN32)
	std::string	filename;
	filename += "/sys/block/";
	filename += blockDeviceName;
	char		link_name[PATH_MAX];
	const int	r_readlink = readlink(filename.c_str(), link_name, sizeof(link_name) - 1u);
	if (r_readlink>0) {
		link_name[r_readlink] = 0;
		if (link_name[0]=='.' && link_name[1]=='.' && link_name[2]=='/') {
			std::string	r;
			r += "/sys";
			r += &link_name[2];
			return r;
		} else {
			return link_name;
		}
	}
#endif
	return std::string();
}

// --------------------------------------------------------------------------------------------------------------------
void getPartitions(std::vector<Partition>& partitions, std::function<bool(const Partition& part, const std::string& systemDevice)> filter)
{
	const unsigned int	o_size = partitions.size();
	getPartitions(partitions);
	if (partitions.size() > o_size) {
		const unsigned int	n = partitions.size() - o_size;
		unsigned int		ok_count = 0;

		for (unsigned int i = 0; i<n; ++i) {
			const auto&	part = partitions[i + o_size];
			std::string	system_device;
			const auto&	pn = part.name;
			if (pn.size()==4u && (pn[0]=='s' || pn[1]=='h') && pn[1]=='d' && isdigit(pn[3])) {
				system_device = getSystemDevicePath(pn.substr(0,3));
			} else {
				system_device = getSystemDevicePath(pn);
			}
			const bool	is_ok = filter(part, system_device);
			if (is_ok) {
				if (ok_count != i) {
					partitions[ok_count + o_size] = part;
				}
				++ok_count;
			}
		}

		partitions.resize(ok_count + o_size);
	}
}

} // namespace Disk.
} // namespace smart

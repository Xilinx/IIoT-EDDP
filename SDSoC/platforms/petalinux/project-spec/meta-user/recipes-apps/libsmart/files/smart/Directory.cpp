/// \file  Directory.cpp
/// \brief	Implementation of the class Directory.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <stdexcept>	// std::runtime_error

#if defined(WIN32)
#include <direct.h>
#else
#include <dirent.h>	// scandir
#include <unistd.h>	// getpagesize
#endif
#include <sys/stat.h>	// stat
#include <sys/types.h>

#include <errno.h>	// errno, EEXIST

#include "Directory.h"
#include "Path.h"
#include "string.h"


#if defined(WIN32)
#	define	O_SYNC					0
#	define	open(filename, flags)	CreateFile(filename, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_WRITE, NULL, CREATE_NEW, 0, NULL)
#	define	close(h)				CloseHandle(h)
#	define	stat_f					_stat
#	define	lstat					_stat
/// structure to be used instead of just "struct stat".
#	define	stat_st					_stat64i32
#	define	stat64_st				_stat64
#	define	stat64					_stat64
static int mkdir(const char* path, const int)
{
	return _mkdir(path);
}
static int chmod(const char*, const int)
{
	return 0;
}
typedef int mode_t;
static mode_t umask(const mode_t)
{
	return 0;
}
#	define S_IRWXU 0
#	define S_IRWXG 0
#	define S_IRWXO	0
#else
#	define	INVALID_HANDLE_VALUE	(-1)
#	define	stat_f					stat
#	define	stat_st					stat
#	define	stat64_st				stat64
#endif

#if !defined(S_ISDIR)
#define S_ISDIR(mode)  (((mode) & S_IFMT) == S_IFDIR)
#endif

namespace smart {

// -------------------------------------------------------------------------------------
std::vector<std::string>
Directory::getFiles(
	const std::string&	dirname)
{
#if defined(WIN32)
	// Windows
	std::vector<std::string>	r;
	return r;
#else
	// Linux
	struct dirent** namelist = nullptr;
	const int r_scandir = scandir(dirname.c_str(), &namelist, nullptr, versionsort);
	if (r_scandir<0) {
		throw std::runtime_error(ssprintf("Cannot find directory '%s'", dirname.c_str()));
	} else {
		std::vector<std::string>	r;
		for (int i=0; i<r_scandir; ++i) {
			const std::string	s = namelist[i]->d_name;
			if (s!="." && s!="..") {
				r.push_back(s);
			}
		}
		free(namelist);
		return r;
	}
#endif
}

// --------------------------------------------------------------------------------------------------------------------
std::shared_ptr<std::vector<std::string>> Directory::getFiles( const std::string& folder, const std::string& match )
{
	auto rv = std::make_shared<std::vector<std::string>>();
#if !defined(WIN32)
	DIR *dir;
	struct dirent *ent;
	struct stat st;

	dir = opendir( folder.c_str() );
	if( dir )
	{
		while( (ent = readdir(dir)) != NULL )
		{
			std::string file_name = ent->d_name;
			std::string full_name = folder + "/" + file_name;

			if( file_name[0] == '.' )
			{
				if(file_name.length() == 1)
					continue; // do not take current folder
				if(file_name[1] == '.' )
					continue; // do not take parent folder
			}

			if( stat(full_name.c_str(), &st) == -1)
				continue; // stat was impossible, do not use

			bool is_directory = (st.st_mode & S_IFDIR) != 0;

			if( is_directory )
				continue; // do not take folders

			if( (match.length() > 0) && (file_name.find(match) == std::string::npos) )
				continue; // match was impossible

			rv->push_back( file_name );
		}
	}
#endif
	return rv;
}


// -------------------------------------------------------------------------------------
// Rerad the current umask.
static mode_t read_umask()
{
	const mode_t	mask = umask(0);
	umask(mask);
	return mask;
}

// -------------------------------------------------------------------------------------
static void
make_path (
	const std::string& path,
	int nmode,
	int parent_mode
	)
{
	// stat() files for mount points of huge disks (or NAS for that matter) with errno set to 75 (EOVERFLOW)
	// That's why we use stat64.
	struct stat64_st	sb;

	// Do we have the directory already?
	if (stat64(path.c_str(), &sb) == 0) {
		if (S_ISDIR (sb.st_mode) == 0) {
			throw std::runtime_error(ssprintf("Directory::make: '%s' exists, but it is not a directory", path.c_str()));
		}

		if (chmod(path.c_str(), nmode)) {
			throw std::runtime_error(ssprintf("Directory::make: cannot change mode for '%s'", path.c_str()));
		}
		return;
	}

	auto		original_umask = read_umask();
	std::string	npath = path;

	// Check whether or not we need to do anything with intermediate dirs.

	// Skip leading slashes.
	size_t	p_index = 0;
	while (p_index<npath.size() && Path::isSeparator(npath[p_index])) {
		++p_index;
	}

	while (p_index<npath.size() && (p_index = npath.find_first_of(Path::ALL_SEPARATORS, p_index)) != std::string::npos) {
		npath[p_index] = '\0';
#if defined(WIN32)
		if (p_index == 2u && npath.size() >= 2u && npath[1] == ':') {
			char	npath2[4] = { npath[0], npath[1], '\\', 0 };
			if (stat64(npath2, &sb) != 0) {
				throw std::runtime_error(ssprintf("Directory::make: not a directory: '%s'", npath.c_str()));
			}
		}
		else
#endif
		if (stat64(npath.c_str(), &sb) != 0) {
			if (mkdir(npath.c_str(), parent_mode)) {
				umask(original_umask);
				throw std::runtime_error(ssprintf("Directory::make: cannot create '%s'", npath.c_str()));
			}
		} else if (S_ISDIR (sb.st_mode) == 0) {
			umask(original_umask);
			throw std::runtime_error(ssprintf("Directory::make: '%s' exists, but it is not a directory", path.c_str()));
		}

		npath[p_index] = Path::SEPARATOR;
		++p_index;
		while (p_index<npath.size() && Path::isSeparator(npath[p_index])) {
			++p_index;
		}
	}

	// Create the final directory component.
	if (stat64(npath.c_str(), &sb) != 0) {
		if (mkdir(npath.c_str(), nmode)) {
			umask(original_umask);
			throw std::runtime_error(ssprintf("Directory::make: cannot create '%s'", npath.c_str()));
		}
	}

	umask(original_umask);
}

// -------------------------------------------------------------------------------------
void Directory::create(const std::string& path)
{
#if defined(WIN32)
	// throw std::runtime_error("Directory::make: Not implemented");
	make_path(path, 0, 0);
#else
	const mode_t	m = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
	make_path(path, m, m);
#endif
}

// -------------------------------------------------------------------------------------
bool Directory::existsAndIsDirectory( const std::string& path )
{
	struct stat_st st;

	// the path must have characers
	if( path.length() <= 0 )
		return false;

	// the root directory must exist
	bool exists = false;
	if( lstat(path.c_str(), &st) != -1 )
	{
		//printf( "%s st_mode=%o\n", path.c_str(), st.st_mode );
		exists = (st.st_mode & S_IFDIR) != 0;
#if !defined(WIN32)
		exists &= ((st.st_mode & S_IFLNK ) == 0);
#endif
	}

	return exists;
}

// -------------------------------------------------------------------------------------
std::string Directory::verifyAndCreate( std::string root, std::string subdir )
{
	size_t pos;

	if( ! existsAndIsDirectory( root ) )
	{
		// empty string if the root directory does not exist.
		return std::string();
	}

	// clean up the start of subdir
	while( subdir.find_first_of("/.\\ ") == 0 )
	{
		subdir = subdir.substr(1);
	}
	// verify against disabled characters
	if( subdir.find_first_of(";\"&%(){}[]#=?*',><!|") != std::string::npos )
	{
		// empty string if incorrect string identified
		return std::string();
	}

	if( subdir.length() <= 0 )
		return root;

	pos = root.length()-1;
	root += Path::SEPARATOR;
	root += subdir;
	root += Path::SEPARATOR;

	// remove multiple Path::SEPARATOR character from the path
	{
		size_t p = pos > 0 ? pos-1: 0;
		while ((p = root.find_first_of(Path::ALL_SEPARATORS, p + 1)) != std::string::npos)
			if (((p + 1) < root.length()) && Path::isSeparator(root[p + 1]))
				root = root.substr(0,p) + root.substr(p+1);
	}
	// check if the subfolder does exist and can be created if not
	while ((pos = root.find_first_of(Path::ALL_SEPARATORS, pos + 1)) != std::string::npos)
	{
		std::string part = root.substr(0,pos);
		if( !existsAndIsDirectory( part ) )
		{
			// the folder does not exist, try to create it
			if( mkdir( part.c_str(), S_IRWXU | S_IRWXG | S_IRWXO) != 0 )
			{
				// making of the directory failed, many reasons possible:
				//   such a named file does exist,
				//   is a symbolic link, to another directory,
				//   and so on.
				// return empty string to notify the failure.
				return std::string();
			}
		}
	}

	return root;
}

} // namespace smart

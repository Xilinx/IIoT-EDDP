/// \file  focserver_main.h
/// \brief Declaration of the function focserver_main.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#if defined(__cplusplus)
extern "C" {
#endif

/// \brief Main function of the focserver, which implements the Network API and a web server.
/// See section \ref section_introduction "Introduction" for the description.
int focserver_main(int argc, char *argv[]);


#if defined(__cplusplus)
}
#endif

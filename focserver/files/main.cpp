/// \file	main.cpp
/// \brief	Implementation of the main function of the focserver.
/// Webserver control program for the Field-Oriented Control demo.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include "src/focserver_main.h"

// --------------------------------------------------------------------------------------------------------------------
/// \brief Entry point to the program focserver.
/// This just calls Main function focserver_main.
/// See section \ref section_introduction "Introduction" for the description.
int main(int argc, char *argv[])
{

	const int	r = focserver_main(argc, argv);
	return r;
}

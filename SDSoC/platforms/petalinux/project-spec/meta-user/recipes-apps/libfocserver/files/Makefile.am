lib_LTLIBRARIES = libfocserver.la
libfocserver_la_SOURCES = \
	focserver/DeviceTreeDevice.cpp \
	focserver/FocConfiguration.cpp \
	focserver/FocDevice.cpp \
	focserver/FocServer.cpp \
	focserver/focserver_main.cpp \
	focserver/WebsocketBuffer.cpp
	
#
# Headers will be under /usr/include, complete with relative path.
nobase_include_HEADERS = focserver/focserver_main.h

libfocserver_la_LDFLAGS = -version-info 1:0:0
ACLOCAL_AMFLAGS = -I m4


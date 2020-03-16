#libsmart_la_CXXFLAGS= -std=c++11
lib_LTLIBRARIES = libsmart.la
libsmart_la_SOURCES = \
	smart/Directory.cpp \
	smart/Disk.cpp \
	smart/File.cpp	\
	smart/getopt.cpp \
	smart/hw/AxiDataCapture.cpp \
	smart/MappedFile.cpp \
	smart/mylogf.cpp \
	smart/Path.cpp \
	smart/Process.cpp \
	smart/string.cpp \
	smart/Symlink.cpp \
	smart/time.cpp \
	smart/UioDevice.cpp \
	smart/WavFormat.cpp

# Headers will be under /usr/include, complete with relative path.
nobase_include_HEADERS = \
	smart/CircularBuffer.h \
	smart/Directory.h \
	smart/Disk.h \
	smart/File.h \
	smart/getopt.h \
	smart/hw/AxiDataCapture.h \
	smart/MappedFile.h \
	smart/mylogf.h \
	smart/Path.h \
	smart/Process.h \
	smart/string.h \
	smart/Symlink.h \
	smart/time.h \
	smart/ts/Queue.h \
	smart/UioDevice.h \
	smart/WavFormat.h

libsmart_la_LDFLAGS = -version-info 1:0:0
ACLOCAL_AMFLAGS = -I m4

bin_PROGRAMS = uio
uio_SOURCES = src_uio/uio_main.cpp
uio_LDADD = libsmart.la
#uio_CXXFLAGS= -std=c++11

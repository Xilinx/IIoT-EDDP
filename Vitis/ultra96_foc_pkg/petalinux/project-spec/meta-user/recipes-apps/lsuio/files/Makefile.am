bin_PROGRAMS=lsuio
lsuio_SOURCES=lsuio.c uio_helper.c uio_helper.h lsuio.1 system.h aclocal.m4

#  uncomment the following if lsuio requires the math library
#lsuio_LDADD=-lm

EXTRA_DIST=lsuio.lsm.in lsuio.spec.in lsuio.texinfo

#  if you write a self-test script named `chk', uncomment the
#  following and add `chk' to the EXTRA_DIST list
#TESTS=chk

#  build and install the .info pages
info_TEXINFOS = lsuio.texinfo
lsuio_TEXINFOS = gpl.texinfo

#  install the man pages
man_MANS=lsuio.1

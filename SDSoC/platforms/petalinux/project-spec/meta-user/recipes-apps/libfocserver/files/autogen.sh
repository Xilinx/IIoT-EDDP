#! /bin/sh


# This will copy over the files needed for autoconf/automake.
autoreconf -f -i \
&& aclocal \
&& automake --add-missing \
&& autoconf


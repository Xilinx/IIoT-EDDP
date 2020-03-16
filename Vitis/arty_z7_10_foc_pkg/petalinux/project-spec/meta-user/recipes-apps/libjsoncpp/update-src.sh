#! /bin/sh

SRCDIR=jsoncpp
SRC=git://github.com/open-source-parsers/jsoncpp

rm -rf $SRCDIR
git clone $SRC $SRCDIR
rm -rf $SRCDIR/.git

rm -rf files
mv $SRCDIR files
rm -rf $SRCDIR


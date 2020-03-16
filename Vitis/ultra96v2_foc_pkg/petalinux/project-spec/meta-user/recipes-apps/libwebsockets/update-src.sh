#! /bin/sh

SRCDIR=libwebsockets
BRANCH=v2.2-stable

rm -rf $SRCDIR
git clone -b $BRANCH git://github.com/warmcat/libwebsockets
rm -rf $SRCDIR/.git

rm -rf files
mv $SRCDIR files
rm -rf $SRCDIR


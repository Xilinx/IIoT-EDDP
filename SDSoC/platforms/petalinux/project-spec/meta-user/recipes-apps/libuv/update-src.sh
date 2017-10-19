#! /bin/sh

PN=libuv
PV=1.12.0
DFN=v${PV}.tar.gz

wget https://github.com/libuv/${PN}/archive/$DFN
tar zxvf $DFN
rm -f $DFN

rm -f files
mv libuv-$PV files


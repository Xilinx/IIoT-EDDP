#! /bin/sh

PN=libuv
PV=1.12.0
DFN=v${PV}.tar.gz

wget https://github.com/libuv/${PN}/archive/$DFN
tar zxvf $DFN
rm -f $DFN

rm -rf files
mv libuv-$PV files
# The .gitignore file interferes with the Petalinux app management when stored in the GIT SCCS.
# That's why we delete it.
rm -f files/.gitignore


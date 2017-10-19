# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "lightweight C websockets library"
HOMEPAGE = "https://github.com/mkschreder/libblobpack"
LICENSE = "LGPL-2.1"
SECTION = "libs"

DEPENDS += "zlib openssl libuv"
EXTRA_OECMAKE += "\
    -DLWS_WITH_STATIC=OFF \
    -DLWS_WITH_LIBUV=ON \
    -DLWS_WITHOUT_TESTAPPS=ON \
    -DLWS_WITHOUT_TEST_SERVER=ON \
    -DLWS_WITHOUT_TEST_SERVER_EXTPOLL=ON \
    -DLWS_WITHOUT_TEST_PING=ON \
    -DLWS_WITHOUT_TEST_ECHO=ON \
    -DLWS_WITHOUT_TEST_CLIENT=ON \
    -DLWS_WITHOUT_TEST_FRAGGLE=ON \
    -DLWS_WITHOUT_DAEMONIZE=OFF \
"

SRC_URI = "file://."

S = "${WORKDIR}"

inherit cmake
#PACKAGES += "${PN}-test"
FILES_${PN}-dev += "${libdir}/cmake"
#FILES_${PN}-test += "${datadir}/"


#
# This file is the lsuio recipe.
#

SUMMARY = "Simple lsuio application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://acinclude.m4 \
	file://aclocal.m4 \
	file://AUTHORS \
	file://ChangeLog \
	file://config.guess \
	file://config.h \
	file://config.h.in \
	file://config.sub \
	file://configure \
	file://configure.in \
	file://COPYING \
	file://depcomp \
	file://gpl.texinfo \
	file://INSTALL \
	file://install-sh \
	file://Kconfig \
	file://lsuio.1 \
	file://lsuio.c \
	file://lsuio.info \
	file://lsuio.lsm.in \
	file://lsuio.spec.in \
	file://lsuio.texinfo \
	file://Makefile \
	file://Makefile.am \
	file://Makefile.in \
	file://missing \
	file://NEWS \
	file://README \
	file://system.h \
	file://texinfo.tex \
	file://uio_helper.c \
	file://uio_helper.h \
"

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 lsuio ${D}${bindir}
}

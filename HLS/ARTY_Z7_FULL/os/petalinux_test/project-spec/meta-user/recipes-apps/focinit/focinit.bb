#
# This file is the focinit recipe.
#

SUMMARY = "Simple focinit application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://focinit \
	"

S = "${WORKDIR}"

do_install() {
	     install -d ${D}/${bindir}
	     install -m 0755 ${S}/focinit ${D}/${bindir}
}

inherit update-rc.d
INITSCRIPT_NAME = "focinit"
INITSCRIPT_PARAMS = "start 99 S ."
do_install() {
	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${S}/focinit ${D}${sysconfdir}/init.d/focinit
}
FILES_${PN} += "${sysconfdir}/*"


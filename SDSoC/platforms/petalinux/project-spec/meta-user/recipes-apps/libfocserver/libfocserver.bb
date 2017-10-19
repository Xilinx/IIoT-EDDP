#
# This file is the libfocserver recipe.
#

SUMMARY = "Library wrapper around focserver"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
DEPENDS = "libsmart libuv libwebsockets libjsoncpp"


SRC_URI = "file://."

S = "${WORKDIR}"

inherit autotools

# The autotools configuration I am basing this on seems to have a problem with a race condition when parallel make is enabled
PARALLEL_MAKE = ""


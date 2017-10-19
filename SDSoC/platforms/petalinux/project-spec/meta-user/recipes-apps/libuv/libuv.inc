SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
HOMEPAGE = "https://github.com/libuv/libuv"
BUGTRACKER = "https://github.com/libuv/libuv/issues"
LICENSE = "MIT & BSD-2-Clause & BSD-3-Clause & ISC"
SECTION = "libs"

SRC_URI = "file://."

S = "${WORKDIR}"

inherit autotools

do_configure() {
    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
    oe_runconf
}

# The autotools configuration I am basing this on seems to have a problem with a race condition when parallel make is enabled
PARALLEL_MAKE = ""


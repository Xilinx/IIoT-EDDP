#
# This file is the focserver recipe.
#

SUMMARY = "Simple focserver application"
SECTION = "PETALINUX/apps"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
DEPENDS = "libsmart libuv libwebsockets libjsoncpp"

SRC_URI = "file://."

S = "${WORKDIR}"
FOC_DATADIR = "${D}${datadir}/focserver"

inherit autotools
inherit update-rc.d
INITSCRIPT_NAME = "focinit"
INITSCRIPT_PARAMS = "start 99 S ."

#JM added following to disable elf optimization
TARGET_CFLAGS += "-O0"


do_install() {
	# Autotools install
	oe_runmake 'DESTDIR=${D}' install

	# focstart.sh
	install -m 0755 ${S}/focstart.sh ${D}/${bindir}

	# /etc
	install -d ${D}${sysconfdir}
	install -m 0644 ${S}/etc/focserver.conf ${D}${sysconfdir}

	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${S}/etc/init.d/focinit ${D}${sysconfdir}/init.d/focinit

	# /usr/share/focserver
	install -d ${FOC_DATADIR}/jquery-ui/external/jquery
	install -d ${FOC_DATADIR}/jquery-ui/external
	install -d ${FOC_DATADIR}/jquery-ui/images
	install -d ${FOC_DATADIR}/jquery-ui
	install -d ${FOC_DATADIR}/

	# /ush/share/files
	install -m 0644 ${S}/ui/www/RGraph.common.core.js				${FOC_DATADIR}
	install -m 0644 ${S}/ui/www/index.js						${FOC_DATADIR}
	install -m 0644 ${S}/ui/www/help.html						${FOC_DATADIR}
	install -m 0644 ${S}/ui/www/flotr2.js						${FOC_DATADIR}
	install -m 0644 ${S}/ui/www/index.html						${FOC_DATADIR}
	install -m 0644 ${S}/ui/www/RGraph.gauge.js					${FOC_DATADIR}
	install -m 0644 ${S}/ui/www/jquery-ui/jquery-ui.min.css				${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/jquery-ui.structure.min.css		${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/AUTHORS.txt				${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/package.json				${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/jquery-ui.theme.min.css			${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/jquery-ui.structure.css			${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/jquery-ui.js				${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/index.html				${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/images/ui-icons_777777_256x240.png	${FOC_DATADIR}/jquery-ui/images/
	install -m 0644 ${S}/ui/www/jquery-ui/images/ui-icons_444444_256x240.png	${FOC_DATADIR}/jquery-ui/images/
	install -m 0644 ${S}/ui/www/jquery-ui/images/ui-icons_555555_256x240.png	${FOC_DATADIR}/jquery-ui/images/
	install -m 0644 ${S}/ui/www/jquery-ui/images/ui-icons_777620_256x240.png	${FOC_DATADIR}/jquery-ui/images/
	install -m 0644 ${S}/ui/www/jquery-ui/images/ui-icons_ffffff_256x240.png	${FOC_DATADIR}/jquery-ui/images/
	install -m 0644 ${S}/ui/www/jquery-ui/images/ui-icons_cc0000_256x240.png	${FOC_DATADIR}/jquery-ui/images/
	install -m 0644 ${S}/ui/www/jquery-ui/LICENSE.txt				${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/jquery-ui.min.js				${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/jquery-ui.css				${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/jquery-ui.theme.css			${FOC_DATADIR}/jquery-ui/
	install -m 0644 ${S}/ui/www/jquery-ui/external/jquery/jquery.js			${FOC_DATADIR}/jquery-ui/external/jquery/
	install -m 0644 ${S}/ui/www/index.css						${FOC_DATADIR}/

}

# The autotools configuration I am basing this on seems to have a problem with a race condition when parallel make is enabled
PARALLEL_MAKE = ""

FILES_${PN} += "${sysconfdir}/*"



FILESEXTRAPATHS_prepend := "${THISDIR}/configs:"
SRC_URI += "file://config.cfg file://platform-auto.h"
UBOOT_MAKE_TARGET_append = " EXT_DTB=${DEPLOY_DIR_IMAGE}/${MACHINE}-system.dtb"

do_configure_append () {
	install ${WORKDIR}/platform-auto.h ${S}/include/configs/
	install ${WORKDIR}/platform-top.h ${S}/include/configs/
}

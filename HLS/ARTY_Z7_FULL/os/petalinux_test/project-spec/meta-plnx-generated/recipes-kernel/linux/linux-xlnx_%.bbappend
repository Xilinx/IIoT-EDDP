
RDEPENDS_kernel-base = ""
KERNEL_IMAGETYPE_zynq ?= "zImage"
do_configure[depends] += "kern-tools-native:do_populate_sysroot"
SRC_URI += "file://plnx_kernel.cfg"
FILESEXTRAPATHS_prepend := "${THISDIR}/configs:"

do_deploy_append () {
	install -m 0644 ${D}/boot/System.map-${KERNEL_VERSION} ${DEPLOYDIR}/System.map.linux
	install -m 0644 ${D}/boot/vmlinux-${KERNEL_VERSION} ${DEPLOYDIR}/vmlinux
}
# returns all the elements from the src uri that are .cfg files
def find_cfgs(d):
    sources=src_patches(d, True)
    sources_list=[]
    for s in sources:
        if s.endswith('.cfg'):
            sources_list.append(s)

    return sources_list

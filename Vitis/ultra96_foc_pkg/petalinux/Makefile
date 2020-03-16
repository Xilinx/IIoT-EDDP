
#################################################################################
# Petalinux project makefile
#

# set variables if not exported from parent makefile
OUT_DIR             ?= ${CURDIR}/../output
PLNX_BOOT_BIT_IMAGE ?= ./design_1_wrapper.bit
PLATFORM            ?= ultra96_foc

# local variables
SYNCOUT_DIR      = ${OUT_DIR}/temp/sw_components
VIVADO_IMAGE_DIR = ${OUT_DIR}/temp/xsa

BOOT_FSBL_IMAGE  = ./images/linux/zynqmp_fsbl.elf
BOOT_UBOOT_IMAGE = ./images/linux/u-boot.elf
BOOT_ATF_IMAGE   = ./images/linux/bl31.elf
BOOT_PMUFW_IMAGE = ./images/linux/pmufw.elf
BOOT_IMAGE       = ./images/linux/BOOT.BIN
KERNEL_IMAGE     = ./images/linux/image.ub

##SD_DIR = /media/myuser/BOOT/
##BOARD_IP = 10.0.0.96


all: linux bootimage


refresh-hw: ./project-spec/hw-description/system.xsa

./project-spec/hw-description/system.xsa: ${VIVADO_IMAGE_DIR}/${PLATFORM}.xsa
	@echo "******* Refreshing xsa"
	petalinux-config --get-hw-description=${VIVADO_IMAGE_DIR} --silentconfig

linux: ${KERNEL_IMAGE}

${KERNEL_IMAGE} ./images/linux/rootfs.tar.gz: ./project-spec/hw-description/system.xsa
	@echo "******* Petalinux Build"
	petalinux-build

.PHONY: bootimage
bootimage:
	petalinux-package --boot --force --fsbl ${BOOT_FSBL_IMAGE} --fpga ${PLNX_BOOT_BIT_IMAGE} --u-boot=${BOOT_UBOOT_IMAGE} --atf ${BOOT_ATF_IMAGE} --pmufw ${BOOT_PMUFW_IMAGE} -o ${BOOT_IMAGE}

.PHONY: sync_out
sync_out:
	mkdir -p ${SYNCOUT_DIR}/boot
	cp ${BOOT_FSBL_IMAGE} ${SYNCOUT_DIR}/boot
	#touch ${SDX_ROOT}/boot/generic.readme
	cp ${BOOT_UBOOT_IMAGE} ${SYNCOUT_DIR}/boot
	cp ${BOOT_ATF_IMAGE} ${SYNCOUT_DIR}/boot
	cp ${BOOT_PMUFW_IMAGE} ${SYNCOUT_DIR}/boot
	cp ./petalinux.bif ${SYNCOUT_DIR}/boot
	mkdir -p ${SYNCOUT_DIR}/image
	cp ${KERNEL_IMAGE} ${SYNCOUT_DIR}/image


#################################################################################
# Create sysroot
#

.PHONY: sysroot
sysroot: 
ifneq ("$(wildcard $(OUT_DIR)/repo/sysroot)", "")
	@echo "**** Symbolic link sysroot already exists so deleting it"
	${RM} $(OUT_DIR)/repo/sysroot
endif
ifneq ("$(wildcard $(OUT_DIR)/repo/sysroot_dummy)", "")
	@echo "**** sysroot_dummy already exists so deleting it"
	${RM} $(OUT_DIR)/repo/sysroot
endif
	@echo "**** Creating sysroot_dummy"
	mkdir -p $(OUT_DIR)/repo/sysroot_dummy/lib
	mkdir -p $(OUT_DIR)/repo/sysroot_dummy/usr/include
	mkdir -p $(OUT_DIR)/repo/sysroot_dummy/usr/lib
	ln -s $(OUT_DIR)/repo/sysroot_dummy $(OUT_DIR)/repo/sysroot


.PHONY: sdksysroot
sdksysroot:
ifneq ("$(wildcard $(OUT_DIR)/repo/sysroot)", "")
	@echo "**** Symbolic link sysroot already exists so deleting it"
	${RM} $(OUT_DIR)/repo/sysroot
endif
ifneq ("$(wildcard $(OUT_DIR)/repo/sysroot_dummy)", "")
	@echo "**** sysroot_dummy already exists so deleting it"
	${RM} $(OUT_DIR)/repo/sysroot
endif
	@echo "**** Building SDK sysroot"
	petalinux-build --sdk
	@echo "*************Installing SDK sysroot"
	./images/linux/sdk.sh -y -d $(OUT_DIR)/repo/sysroot_sdk
	ln -s $(OUT_DIR)/repo/sysroot_sdk/sysroots/aarch64-xilinx-linux $(OUT_DIR)/repo/sysroot
	


#################################################################################
# Clean
#


.PHONY: clean
clean:
	petalinux-build -x cleanall
	$(RM) -r ./images

# Remove ./images and ./build
.PHONY: ultraclean
ultraclean:
	petalinux-build -x mrproper
	$(RM) -r ./build
	$(RM) -r ./.Xil


#################################################################################
# Utility targets used to interact with project
#

.PHONY: fsbl
fsbl:
	petalinux-build -c bootloader

.PHONY: build-rootfs
build-rootfs:
	petalinux-build -c rootfs

.PHONY: package
package:
	petalinux-build -x package

.PHONY: build-dts
build-dts:
	petalinux-build -c device-tree

.PHONY: dump-dts
dump-dts:
	dtc -I dtb -O dts -o images/linux/system.dts images/linux/system.dtb

.PHONY: hw-description
hw-description:
	petalinux-config --get-hw-description=${VIVADO_IMAGE_DIR}

.PHONY: dts
dts: build-dts package bootimage

.PHONY: rootfs
rootfs: build-rootfs package bootimage

#sd:
#	cp ${BOOT_IMAGE} ${SD_DIR}
#	cp images/linux/image.ub ${SD_DIR}
#
#ssh:
#	scp -o StrictHostKeyChecking=no -o "UserKnownHostsFile /dev/null" ${KERNEL_IMAGE} ${BOOT_IMAGE} root@${BOARD_IP}:/media/card


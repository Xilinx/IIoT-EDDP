
#################################################################################
# Platform creation makefile
#


# Notes:
#   Switch between pre-built or petalinux-build

#set TRUE or leave blank to switch between pre-built vs local build of petalinux
#USE_PLNX_PREBUILT ?= TRUE
USE_PLNX_PREBUILT ?= 

# set global variables
export PLATFORM            = ultra96v2_foc
export OUT_DIR             = ${CURDIR}/output
#JM export PLNX_BOOT_BIT_IMAGE = ${CURDIR}/../app_build/binary_container_1/link/vivado/vpl/prj/prj.runs/impl_1/design_1_wrapper.bit



all: $(PLATFORM)

#JM sftwr: $(OUT_DIR)/temp/sw_components/image/image.ub


#################################################################################
# Create and build Vivado project
#

vivado: ${OUT_DIR}/temp/xsa/${PLATFORM}.xsa

${OUT_DIR}/temp/xsa/${PLATFORM}.xsa: 
	@echo "Starting Vivado build"
	$(MAKE) -C vivado


#################################################################################
# Petalinux misc targets

# build BOOT.BIN in petalinux image dir using the .bit from the app
.PHONY: plnx_bootimage
plnx_bootimage:
	$(MAKE) -C petalinux bootimage
   


#################################################################################
# Either copy pre-built images to output temp dir or
# build petalinux

.PHONY: plnx_prebuilt_sync
plnx_prebuilt_sync:
	$(MAKE) -C petalinux_pre-built

.PHONY: plnx_sync
plnx_sync:
	$(MAKE) -C petalinux sync_out

linux: vivado $(OUT_DIR)/temp/sw_components/image/image.ub

$(OUT_DIR)/temp/sw_components/image/image.ub:  
ifdef USE_PLNX_PREBUILT
	@echo '************ Using sftwr pre-built ************'
	$(MAKE) -C petalinux_pre-built sync_out
else
	@echo '************ Petalinux Build ************' 
	$(MAKE) -C petalinux refresh-hw
	$(MAKE) -C petalinux linux
	$(MAKE) -C petalinux sync_out
endif


.PHONY: update_plnx_rootfs
update_plnx_rootfs:
	$(MAKE) -C petalinux build-rootfs
	$(MAKE) -C petalinux package
	$(MAKE) -C petalinux bootimage
	@echo "Use petalinux images dir"

#################################################################################
# Build Platform
#
         
$(PLATFORM): linux
ifneq ("$(wildcard ./output/repo/sysroot)", "")
	@echo "**** Sysroot is present"
else
	$(error **** Sysroot is missing. Create using make sysroot|sdksysroot)
endif
	@echo '************ Generating Platform ************'
	xsct -sdx ./scripts/gen_pfm.tcl ${PLATFORM} ${OUT_DIR}
	${RM} -r $(OUT_DIR)/repo/$(PLATFORM)
	mkdir -p $(OUT_DIR)/repo
	mv ${OUT_DIR}/temp/$(PLATFORM)/export/$(PLATFORM) $(OUT_DIR)/repo/$(PLATFORM)
	cp  $(OUT_DIR)/temp/sw_components/boot/* $(OUT_DIR)/repo/$(PLATFORM)/sw/$(PLATFORM)/boot

.PHONY: sysroot
sysroot:
	mkdir -p $(OUT_DIR)/repo
	touch ./output/repo/sysroot

#.PHONY: sysroot
#sysroot:
#	$(MAKE) -C petalinux sysroot

.PHONY: sdksysroot
sdksysroot:
	$(MAKE) -C petalinux sdksysroot

#################################################################################
# Create boot.bin using accel app
#
# Note: result BOOT.BIN is in plnx image/linux dir

.PHONY: bootimage
bootimage:
	@echo "*************** Creating BOOT.BIN in plnx image/linux **************"
	$(MAKE) -C petalinux bootimage

#################################################################################
# Clean
#

.PHONY: clean_vivado
clean_vivado:
	$(MAKE) -C vivado clean

.PHONY: clean_sftwr
clean_sftwr:
	${RM} -r  $(OUT_DIR)/temp/sw_components

.PHONY: clean_plnx
clean_plnx:
	$(MAKE) -C petalinux clean
	${RM} $(OUT_DIR)/temp/sw_components/image/image.ub

.PHONY: ultraclean_plnx
ultraclean_plnx:
	$(MAKE) -C petalinux ultraclean

.PHONY:  clean_pfm
clean_pfm:
	${RM} -r ${OUT_DIR}/temp/$(PLATFORM)
	${RM} -r ${OUT_DIR}/repo/$(PLATFORM)

.PHONY:  clean_sysroot
clean_sysroot:
	${RM} -r ${OUT_DIR}/repo/sysroot

clean: clean_pfm clean_vivado clean_plnx

ultraclean: ultraclean_plnx
	${RM} -r ${OUT_DIR}

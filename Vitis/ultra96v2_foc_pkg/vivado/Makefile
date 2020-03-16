

#################################################################################
# Vivado makefile
#

# set variables if not exported from parent makefile
PLATFORM ?= ultra96v2_foc
OUT_DIR  ?= ./output_test


.PHONY: all

all: vivado

vivado: ${OUT_DIR}/temp/xsa/$(PLATFORM).xsa


#################################################################################
# Create and build Vivado project
#

${OUT_DIR}/temp/xsa/$(PLATFORM).xsa : ./scripts/prj.tcl
	@echo '************ Building Vivado Project ************'
	vivado -nojournal -nolog -mode batch -source ./scripts/prj.tcl -tclargs ${PLATFORM} ${OUT_DIR}/temp

#${OUT_DIR}/temp:
#	mkdir -p $(OUT_DIR)/temp

#################################################################################
# Clean
#

clean:
	${RM} -r ./.Xil
	${RM} -r ${OUT_DIR}/temp/vv
	${RM} -r ${OUT_DIR}/temp/xsa


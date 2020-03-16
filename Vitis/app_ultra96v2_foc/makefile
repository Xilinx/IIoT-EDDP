
PLATFORM = ultra96v2_foc
PLATFORM_PATH = ../ultra96v2_foc_pkg/output/repo
PLATFORM_SYSROOT_PATH = $(PLATFORM_PATH)/$(PLATFORM)/sysroot/sysroots

# <PLATFORM_SYSROOT_PATH> needs to be set based on installation instructions from the lounge
SYSROOT ?= $(PLATFORM_SYSROOT_PATH)/aarch64-xilinx-linux
XILINX_XRT_INCLUDE ?= $(SYSROOT)/usr/include/xrt

RM = rm -f
RMDIR = rm -rf

################################
# Host variables
################################
SDX_CXX ?= $(XILINX_VITIS)/gnu/aarch64/lin/aarch64-linux/bin/aarch64-linux-gnu-g++

# host compiler global settings
CXXFLAGS += -D__USE_XOPEN2K8 -I$(XILINX_XRT_INCLUDE) -I$(XILINX_VIVADO)/include/ -I$(SYSROOT)/usr/include -O2 -Wall -c -fmessage-length=0 -std=c++14 --sysroot=$(SYSROOT) 

LDFLAGS += -lxilinxopencl -lpthread -lrt -lstdc++ -lgmp -lxrt_core -L$(SYSROOT)/usr/lib/ --sysroot=$(SYSROOT)

# host files
HOST_OBJECTS += src/main.o
HOST_EXE = foc.exe

################################
# Kernel variables
################################
VPP ?= $(XILINX_VITIS)/bin/v++

# kernel compiler global settings
# <PLATFORM_PATH> needs to be set based on installation instructions from the lounge
VPP_OPTS = -t hw --platform $(PLATFORM_PATH)/$(PLATFORM)/$(PLATFORM).xpfm --save-temps  

# OpenCL kernel files
BIN_CONT_DIR = binary_container_1
BINARY_CONTAINERS += binary_container_1.xclbin

BINARY_CONTAINER_1_OBJS += $(BIN_CONT_DIR)/foc.xo
ALL_KERNEL_OBJS += $(BIN_CONT_DIR)/foc.xo

ALL_MESSAGE_FILES = $(subst .xo,.mdb,$(ALL_KERNEL_OBJS)) $(subst .xclbin,.mdb,$(BINARY_CONTAINERS))



################################
# primary build targets
################################

.PHONY: all clean

#JM Disable Host build since axis only accel.    all: $(BINARY_CONTAINERS) $(HOST_EXE)

all: $(BINARY_CONTAINERS)

.NOTPARALLEL: clean

clean:
	-$(RM) $(BINARY_CONTAINERS)* $(ALL_KERNEL_OBJS) $(ALL_MESSAGE_FILES)  $(HOST_EXE) $(HOST_OBJECTS)
	-$(RM) *.xclbin.sh
	-$(RMDIR) .Xil
	-$(RMDIR) sd_card
	-$(RMDIR) sd_card_temp
	-$(RMDIR) $(BIN_CONT_DIR)
	-$(RM) *.log
	-$(RM) binary_container_1.xsa
	-$(RM) binary_container_1.ltx


################################
# Kernel targets
#
# binary container: $(BINARY_CONTAINERS)
################################

#$(BIN_CONT_DIR)/foc.xo: ./src/foc.cpp ./src/main.hpp

.PHONY: $(BIN_CONT_DIR)/foc.xo
foc_kernel: $(BIN_CONT_DIR)/foc.xo

$(BIN_CONT_DIR)/foc.xo: ./src/foc.cpp ./src/foc.h ./src/sin_cos_table.h
	@mkdir -p $(@D)
	-@$(RM) $@
	$(VPP) $(VPP_OPTS) -c -k foc -I"$(<D)" --temp_dir $(BIN_CONT_DIR) --report_dir $(BIN_CONT_DIR)/reports --log_dir $(BIN_CONT_DIR)/logs -o"$@" "$<"


$(BINARY_CONTAINERS): $(BINARY_CONTAINER_1_OBJS) ./v++_connectivity.ini
	-@echo $(VPP) $(VPP_OPTS) -l $(MY_LINK_ACCEL_OPTS) --jobs 20 --temp_dir $(BIN_CONT_DIR) --report_dir $(BIN_CONT_DIR)/reports --log_dir $(BIN_CONT_DIR)/logs --remote_ip_cache $(BIN_CONT_DIR)/ip_cache -o"$@" $($(BIN_CONT_DIR)_OBJS) --sys_config $(PLATFORM) > $(BINARY_CONTAINERS).sh
	$(VPP) $(VPP_OPTS) -l --config ./v++_connectivity.ini --jobs 20 --temp_dir $(BIN_CONT_DIR) --report_dir $(BIN_CONT_DIR)/reports --log_dir $(BIN_CONT_DIR)/logs --remote_ip_cache $(BIN_CONT_DIR)/ip_cache -o"$@" $(BINARY_CONTAINER_1_OBJS) --sys_config $(PLATFORM)


################################
# host targets
################################
src/main.o: ./src/main.cpp ./src/main.cpp
	@mkdir -p $(@D)
	$(SDX_CXX) $(CXXFLAGS) -o "$@" "$<"

$(HOST_EXE): $(HOST_OBJECTS)
	$(SDX_CXX) -o "$@" $(+) $(LDFLAGS)
	cp $(HOST_EXE) sd_card



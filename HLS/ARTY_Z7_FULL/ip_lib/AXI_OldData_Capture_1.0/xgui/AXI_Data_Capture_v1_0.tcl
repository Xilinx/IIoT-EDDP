# The 3-Clause BSD License
# 
# SPDX short identifier: BSD-3-Clause
# 
# Copyright 2016-2017 Trenz Electronic GmbH
# 
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
# 
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 1" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set C_S_AXI_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_DATA_WIDTH -widget radioGroup]
	set_property tooltip {Width of S_AXI data bus} $C_S_AXI_DATA_WIDTH
	set C_USE_TRIGGER [ipgui::add_param $IPINST -parent $Page0 -name C_USE_TRIGGER]
	set C_COREID [ipgui::add_param $IPINST -parent $Page0 -name C_COREID]
	set C_CAPTURE_CHANNELS [ipgui::add_param $IPINST -parent $Page0 -name C_CAPTURE_CHANNELS]
	set C_M_AXIS_CMD_TDATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_M_AXIS_CMD_TDATA_WIDTH]
	set C_S_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_ADDR_WIDTH]
	set_property tooltip {Width of S_AXI address bus} $C_S_AXI_ADDR_WIDTH
	set C_S_AXI_BASEADDR [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_BASEADDR]
	set C_S_AXI_HIGHADDR [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_HIGHADDR]
	set C_M_AXIS_S2MM_TDATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_M_AXIS_S2MM_TDATA_WIDTH -widget comboBox]
	set C_CHANNELS [ipgui::add_param $IPINST -parent $Page0 -name C_CHANNELS]
	set C_S_AXIS_S2MM_STS_TDATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXIS_S2MM_STS_TDATA_WIDTH]
	set C_M_AXIS_S2MM_CMD_TDATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_M_AXIS_S2MM_CMD_TDATA_WIDTH]
	set C_CDATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_CDATA_WIDTH]
	set Page1 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set C_CMD_AXIS [ipgui::add_param $IPINST -parent $Page1 -name C_CMD_AXIS]
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_USE_TRIGGER { PARAM_VALUE.C_USE_TRIGGER } {
	# Procedure called to update C_USE_TRIGGER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_TRIGGER { PARAM_VALUE.C_USE_TRIGGER } {
	# Procedure called to validate C_USE_TRIGGER
	return true
}

proc update_PARAM_VALUE.C_COREID { PARAM_VALUE.C_COREID } {
	# Procedure called to update C_COREID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_COREID { PARAM_VALUE.C_COREID } {
	# Procedure called to validate C_COREID
	return true
}

proc update_PARAM_VALUE.C_CAPTURE_CHANNELS { PARAM_VALUE.C_CAPTURE_CHANNELS } {
	# Procedure called to update C_CAPTURE_CHANNELS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CAPTURE_CHANNELS { PARAM_VALUE.C_CAPTURE_CHANNELS } {
	# Procedure called to validate C_CAPTURE_CHANNELS
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_CMD_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_CMD_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_CMD_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_CMD_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_CMD_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_CMD_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_BASEADDR { PARAM_VALUE.C_S_AXI_BASEADDR } {
	# Procedure called to update C_S_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_BASEADDR { PARAM_VALUE.C_S_AXI_BASEADDR } {
	# Procedure called to validate C_S_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_AXI_HIGHADDR { PARAM_VALUE.C_S_AXI_HIGHADDR } {
	# Procedure called to update C_S_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_HIGHADDR { PARAM_VALUE.C_S_AXI_HIGHADDR } {
	# Procedure called to validate C_S_AXI_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_S2MM_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_S2MM_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_CHANNELS { PARAM_VALUE.C_CHANNELS } {
	# Procedure called to update C_CHANNELS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CHANNELS { PARAM_VALUE.C_CHANNELS } {
	# Procedure called to validate C_CHANNELS
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH } {
	# Procedure called to update C_S_AXIS_S2MM_STS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_S2MM_STS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_S2MM_CMD_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_S2MM_CMD_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_CDATA_WIDTH { PARAM_VALUE.C_CDATA_WIDTH } {
	# Procedure called to update C_CDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CDATA_WIDTH { PARAM_VALUE.C_CDATA_WIDTH } {
	# Procedure called to validate C_CDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_CMD_AXIS { PARAM_VALUE.C_CMD_AXIS } {
	# Procedure called to update C_CMD_AXIS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CMD_AXIS { PARAM_VALUE.C_CMD_AXIS } {
	# Procedure called to validate C_CMD_AXIS
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_CHANNELS { MODELPARAM_VALUE.C_CHANNELS PARAM_VALUE.C_CHANNELS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CHANNELS}] ${MODELPARAM_VALUE.C_CHANNELS}
}

proc update_MODELPARAM_VALUE.C_CDATA_WIDTH { MODELPARAM_VALUE.C_CDATA_WIDTH PARAM_VALUE.C_CDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CDATA_WIDTH}] ${MODELPARAM_VALUE.C_CDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_CMD_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_CMD_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_CMD_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_CMD_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_CMD_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_COREID { MODELPARAM_VALUE.C_COREID PARAM_VALUE.C_COREID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_COREID}] ${MODELPARAM_VALUE.C_COREID}
}

proc update_MODELPARAM_VALUE.C_CAPTURE_CHANNELS { MODELPARAM_VALUE.C_CAPTURE_CHANNELS PARAM_VALUE.C_CAPTURE_CHANNELS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CAPTURE_CHANNELS}] ${MODELPARAM_VALUE.C_CAPTURE_CHANNELS}
}

proc update_MODELPARAM_VALUE.C_CMD_AXIS { MODELPARAM_VALUE.C_CMD_AXIS PARAM_VALUE.C_CMD_AXIS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CMD_AXIS}] ${MODELPARAM_VALUE.C_CMD_AXIS}
}

proc update_MODELPARAM_VALUE.C_USE_TRIGGER { MODELPARAM_VALUE.C_USE_TRIGGER PARAM_VALUE.C_USE_TRIGGER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_TRIGGER}] ${MODELPARAM_VALUE.C_USE_TRIGGER}
}


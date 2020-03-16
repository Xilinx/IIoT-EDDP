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
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "C_S_AXIS_TDATA_WIDTH"
  ipgui::add_param $IPINST -name "C_S_AXIS_TDEST_WIDTH"
  ipgui::add_param $IPINST -name "C_DATA_BITS"
  ipgui::add_param $IPINST -name "C_IN_TYPE" -widget comboBox
  ipgui::add_param $IPINST -name "C_CHANNELS"
  ipgui::add_param $IPINST -name "C_CLK_FREQ"
  ipgui::add_param $IPINST -name "C_PWM_FREQ"
  ipgui::add_param $IPINST -name "C_TYPE" -widget comboBox
  ipgui::add_param $IPINST -name "C_DEADTIME_SYCLES"

}

proc update_PARAM_VALUE.C_CHANNELS { PARAM_VALUE.C_CHANNELS } {
	# Procedure called to update C_CHANNELS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CHANNELS { PARAM_VALUE.C_CHANNELS } {
	# Procedure called to validate C_CHANNELS
	return true
}

proc update_PARAM_VALUE.C_CLK_FREQ { PARAM_VALUE.C_CLK_FREQ } {
	# Procedure called to update C_CLK_FREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CLK_FREQ { PARAM_VALUE.C_CLK_FREQ } {
	# Procedure called to validate C_CLK_FREQ
	return true
}

proc update_PARAM_VALUE.C_DATA_BITS { PARAM_VALUE.C_DATA_BITS } {
	# Procedure called to update C_DATA_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DATA_BITS { PARAM_VALUE.C_DATA_BITS } {
	# Procedure called to validate C_DATA_BITS
	return true
}

proc update_PARAM_VALUE.C_DEADTIME_SYCLES { PARAM_VALUE.C_DEADTIME_SYCLES } {
	# Procedure called to update C_DEADTIME_SYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DEADTIME_SYCLES { PARAM_VALUE.C_DEADTIME_SYCLES } {
	# Procedure called to validate C_DEADTIME_SYCLES
	return true
}

proc update_PARAM_VALUE.C_IN_TYPE { PARAM_VALUE.C_IN_TYPE } {
	# Procedure called to update C_IN_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_IN_TYPE { PARAM_VALUE.C_IN_TYPE } {
	# Procedure called to validate C_IN_TYPE
	return true
}

proc update_PARAM_VALUE.C_PWM_FREQ { PARAM_VALUE.C_PWM_FREQ } {
	# Procedure called to update C_PWM_FREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_PWM_FREQ { PARAM_VALUE.C_PWM_FREQ } {
	# Procedure called to validate C_PWM_FREQ
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_TDEST_WIDTH { PARAM_VALUE.C_S_AXIS_TDEST_WIDTH } {
	# Procedure called to update C_S_AXIS_TDEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TDEST_WIDTH { PARAM_VALUE.C_S_AXIS_TDEST_WIDTH } {
	# Procedure called to validate C_S_AXIS_TDEST_WIDTH
	return true
}

proc update_PARAM_VALUE.C_TYPE { PARAM_VALUE.C_TYPE } {
	# Procedure called to update C_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_TYPE { PARAM_VALUE.C_TYPE } {
	# Procedure called to validate C_TYPE
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_TDATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_CHANNELS { MODELPARAM_VALUE.C_CHANNELS PARAM_VALUE.C_CHANNELS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CHANNELS}] ${MODELPARAM_VALUE.C_CHANNELS}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_TDEST_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TDEST_WIDTH PARAM_VALUE.C_S_AXIS_TDEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TDEST_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TDEST_WIDTH}
}

proc update_MODELPARAM_VALUE.C_CLK_FREQ { MODELPARAM_VALUE.C_CLK_FREQ PARAM_VALUE.C_CLK_FREQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CLK_FREQ}] ${MODELPARAM_VALUE.C_CLK_FREQ}
}

proc update_MODELPARAM_VALUE.C_PWM_FREQ { MODELPARAM_VALUE.C_PWM_FREQ PARAM_VALUE.C_PWM_FREQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_PWM_FREQ}] ${MODELPARAM_VALUE.C_PWM_FREQ}
}

proc update_MODELPARAM_VALUE.C_TYPE { MODELPARAM_VALUE.C_TYPE PARAM_VALUE.C_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_TYPE}] ${MODELPARAM_VALUE.C_TYPE}
}

proc update_MODELPARAM_VALUE.C_DEADTIME_SYCLES { MODELPARAM_VALUE.C_DEADTIME_SYCLES PARAM_VALUE.C_DEADTIME_SYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DEADTIME_SYCLES}] ${MODELPARAM_VALUE.C_DEADTIME_SYCLES}
}

proc update_MODELPARAM_VALUE.C_IN_TYPE { MODELPARAM_VALUE.C_IN_TYPE PARAM_VALUE.C_IN_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_IN_TYPE}] ${MODELPARAM_VALUE.C_IN_TYPE}
}

proc update_MODELPARAM_VALUE.C_DATA_BITS { MODELPARAM_VALUE.C_DATA_BITS PARAM_VALUE.C_DATA_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DATA_BITS}] ${MODELPARAM_VALUE.C_DATA_BITS}
}


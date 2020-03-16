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
  ipgui::add_param $IPINST -name "C_M_AXIS_TDATA_WIDTH"
  ipgui::add_param $IPINST -name "C_FILTER_WIDTH"
  ipgui::add_param $IPINST -name "C_CPR"
  ipgui::add_param $IPINST -name "C_OUT_PERIOD"
  ipgui::add_param $IPINST -name "C_ANGLE_AXIS"
  ipgui::add_param $IPINST -name "C_PERIOD_AXIS"
  ipgui::add_param $IPINST -name "C_RPM_AXIS"
  ipgui::add_param $IPINST -name "C_USE_SHIFT"
  ipgui::add_param $IPINST -name "C_INVERS_DIR"

}

proc update_PARAM_VALUE.C_ANGLE_AXIS { PARAM_VALUE.C_ANGLE_AXIS } {
	# Procedure called to update C_ANGLE_AXIS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ANGLE_AXIS { PARAM_VALUE.C_ANGLE_AXIS } {
	# Procedure called to validate C_ANGLE_AXIS
	return true
}

proc update_PARAM_VALUE.C_CLK_FREQ { PARAM_VALUE.C_CLK_FREQ } {
	# Procedure called to update C_CLK_FREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CLK_FREQ { PARAM_VALUE.C_CLK_FREQ } {
	# Procedure called to validate C_CLK_FREQ
	return true
}

proc update_PARAM_VALUE.C_CPR { PARAM_VALUE.C_CPR } {
	# Procedure called to update C_CPR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CPR { PARAM_VALUE.C_CPR } {
	# Procedure called to validate C_CPR
	return true
}

proc update_PARAM_VALUE.C_FILTER_WIDTH { PARAM_VALUE.C_FILTER_WIDTH } {
	# Procedure called to update C_FILTER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_FILTER_WIDTH { PARAM_VALUE.C_FILTER_WIDTH } {
	# Procedure called to validate C_FILTER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_INVERS_DIR { PARAM_VALUE.C_INVERS_DIR } {
	# Procedure called to update C_INVERS_DIR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_INVERS_DIR { PARAM_VALUE.C_INVERS_DIR } {
	# Procedure called to validate C_INVERS_DIR
	return true
}

proc update_PARAM_VALUE.C_OUT_PERIOD { PARAM_VALUE.C_OUT_PERIOD } {
	# Procedure called to update C_OUT_PERIOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_OUT_PERIOD { PARAM_VALUE.C_OUT_PERIOD } {
	# Procedure called to validate C_OUT_PERIOD
	return true
}

proc update_PARAM_VALUE.C_PERIOD_AXIS { PARAM_VALUE.C_PERIOD_AXIS } {
	# Procedure called to update C_PERIOD_AXIS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_PERIOD_AXIS { PARAM_VALUE.C_PERIOD_AXIS } {
	# Procedure called to validate C_PERIOD_AXIS
	return true
}

proc update_PARAM_VALUE.C_RPM_AXIS { PARAM_VALUE.C_RPM_AXIS } {
	# Procedure called to update C_RPM_AXIS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RPM_AXIS { PARAM_VALUE.C_RPM_AXIS } {
	# Procedure called to validate C_RPM_AXIS
	return true
}

proc update_PARAM_VALUE.C_USE_SHIFT { PARAM_VALUE.C_USE_SHIFT } {
	# Procedure called to update C_USE_SHIFT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_SHIFT { PARAM_VALUE.C_USE_SHIFT } {
	# Procedure called to validate C_USE_SHIFT
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_TDATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_FILTER_WIDTH { MODELPARAM_VALUE.C_FILTER_WIDTH PARAM_VALUE.C_FILTER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_FILTER_WIDTH}] ${MODELPARAM_VALUE.C_FILTER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_CPR { MODELPARAM_VALUE.C_CPR PARAM_VALUE.C_CPR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CPR}] ${MODELPARAM_VALUE.C_CPR}
}

proc update_MODELPARAM_VALUE.C_OUT_PERIOD { MODELPARAM_VALUE.C_OUT_PERIOD PARAM_VALUE.C_OUT_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_OUT_PERIOD}] ${MODELPARAM_VALUE.C_OUT_PERIOD}
}

proc update_MODELPARAM_VALUE.C_ANGLE_AXIS { MODELPARAM_VALUE.C_ANGLE_AXIS PARAM_VALUE.C_ANGLE_AXIS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_ANGLE_AXIS}] ${MODELPARAM_VALUE.C_ANGLE_AXIS}
}

proc update_MODELPARAM_VALUE.C_PERIOD_AXIS { MODELPARAM_VALUE.C_PERIOD_AXIS PARAM_VALUE.C_PERIOD_AXIS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_PERIOD_AXIS}] ${MODELPARAM_VALUE.C_PERIOD_AXIS}
}

proc update_MODELPARAM_VALUE.C_RPM_AXIS { MODELPARAM_VALUE.C_RPM_AXIS PARAM_VALUE.C_RPM_AXIS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RPM_AXIS}] ${MODELPARAM_VALUE.C_RPM_AXIS}
}

proc update_MODELPARAM_VALUE.C_USE_SHIFT { MODELPARAM_VALUE.C_USE_SHIFT PARAM_VALUE.C_USE_SHIFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_SHIFT}] ${MODELPARAM_VALUE.C_USE_SHIFT}
}

proc update_MODELPARAM_VALUE.C_INVERS_DIR { MODELPARAM_VALUE.C_INVERS_DIR PARAM_VALUE.C_INVERS_DIR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_INVERS_DIR}] ${MODELPARAM_VALUE.C_INVERS_DIR}
}

proc update_MODELPARAM_VALUE.C_CLK_FREQ { MODELPARAM_VALUE.C_CLK_FREQ PARAM_VALUE.C_CLK_FREQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CLK_FREQ}] ${MODELPARAM_VALUE.C_CLK_FREQ}
}


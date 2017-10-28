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
  ipgui::add_param $IPINST -name "C_START_DELAY"
  ipgui::add_param $IPINST -name "C_REF_RPM"
  ipgui::add_param $IPINST -name "C_TOLERANCE"
  ipgui::add_param $IPINST -name "C_LEDS"
  ipgui::add_param $IPINST -name "C_TDATA_WIDTH"

}

proc update_PARAM_VALUE.C_LEDS { PARAM_VALUE.C_LEDS } {
	# Procedure called to update C_LEDS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LEDS { PARAM_VALUE.C_LEDS } {
	# Procedure called to validate C_LEDS
	return true
}

proc update_PARAM_VALUE.C_REF_RPM { PARAM_VALUE.C_REF_RPM } {
	# Procedure called to update C_REF_RPM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_REF_RPM { PARAM_VALUE.C_REF_RPM } {
	# Procedure called to validate C_REF_RPM
	return true
}

proc update_PARAM_VALUE.C_START_DELAY { PARAM_VALUE.C_START_DELAY } {
	# Procedure called to update C_START_DELAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_START_DELAY { PARAM_VALUE.C_START_DELAY } {
	# Procedure called to validate C_START_DELAY
	return true
}

proc update_PARAM_VALUE.C_TDATA_WIDTH { PARAM_VALUE.C_TDATA_WIDTH } {
	# Procedure called to update C_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_TDATA_WIDTH { PARAM_VALUE.C_TDATA_WIDTH } {
	# Procedure called to validate C_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_TOLERANCE { PARAM_VALUE.C_TOLERANCE } {
	# Procedure called to update C_TOLERANCE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_TOLERANCE { PARAM_VALUE.C_TOLERANCE } {
	# Procedure called to validate C_TOLERANCE
	return true
}


proc update_MODELPARAM_VALUE.C_REF_RPM { MODELPARAM_VALUE.C_REF_RPM PARAM_VALUE.C_REF_RPM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_REF_RPM}] ${MODELPARAM_VALUE.C_REF_RPM}
}

proc update_MODELPARAM_VALUE.C_TOLERANCE { MODELPARAM_VALUE.C_TOLERANCE PARAM_VALUE.C_TOLERANCE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_TOLERANCE}] ${MODELPARAM_VALUE.C_TOLERANCE}
}

proc update_MODELPARAM_VALUE.C_LEDS { MODELPARAM_VALUE.C_LEDS PARAM_VALUE.C_LEDS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LEDS}] ${MODELPARAM_VALUE.C_LEDS}
}

proc update_MODELPARAM_VALUE.C_TDATA_WIDTH { MODELPARAM_VALUE.C_TDATA_WIDTH PARAM_VALUE.C_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_START_DELAY { MODELPARAM_VALUE.C_START_DELAY PARAM_VALUE.C_START_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_START_DELAY}] ${MODELPARAM_VALUE.C_START_DELAY}
}


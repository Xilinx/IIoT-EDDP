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


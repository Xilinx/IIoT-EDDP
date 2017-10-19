# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "C_SLAVE_IF" -widget comboBox
  ipgui::add_param $IPINST -name "C_CONTROL_WIDTH"
  ipgui::add_param $IPINST -name "C_AXIS_TDATA_WIDTH"

}

proc update_PARAM_VALUE.C_AXIS_TDATA_WIDTH { PARAM_VALUE.C_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXIS_TDATA_WIDTH { PARAM_VALUE.C_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_CONTROL_WIDTH { PARAM_VALUE.C_CONTROL_WIDTH } {
	# Procedure called to update C_CONTROL_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CONTROL_WIDTH { PARAM_VALUE.C_CONTROL_WIDTH } {
	# Procedure called to validate C_CONTROL_WIDTH
	return true
}

proc update_PARAM_VALUE.C_SLAVE_IF { PARAM_VALUE.C_SLAVE_IF } {
	# Procedure called to update C_SLAVE_IF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SLAVE_IF { PARAM_VALUE.C_SLAVE_IF } {
	# Procedure called to validate C_SLAVE_IF
	return true
}


proc update_MODELPARAM_VALUE.C_SLAVE_IF { MODELPARAM_VALUE.C_SLAVE_IF PARAM_VALUE.C_SLAVE_IF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SLAVE_IF}] ${MODELPARAM_VALUE.C_SLAVE_IF}
}

proc update_MODELPARAM_VALUE.C_CONTROL_WIDTH { MODELPARAM_VALUE.C_CONTROL_WIDTH PARAM_VALUE.C_CONTROL_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CONTROL_WIDTH}] ${MODELPARAM_VALUE.C_CONTROL_WIDTH}
}

proc update_MODELPARAM_VALUE.C_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_AXIS_TDATA_WIDTH PARAM_VALUE.C_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_AXIS_TDATA_WIDTH}
}


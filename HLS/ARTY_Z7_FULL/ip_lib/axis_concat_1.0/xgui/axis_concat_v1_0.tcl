# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "C_IN_CHANNELS" -widget comboBox
  ipgui::add_param $IPINST -name "C_A_TDATA_WIDTH"
  ipgui::add_param $IPINST -name "C_B_TDATA_WIDTH"
  ipgui::add_param $IPINST -name "C_C_TDATA_WIDTH"
  ipgui::add_param $IPINST -name "M_TDATA_WIDTH"
  ipgui::add_param $IPINST -name "C_TVALID_TYPE" -widget comboBox

}

proc update_PARAM_VALUE.C_A_TDATA_WIDTH { PARAM_VALUE.C_A_TDATA_WIDTH } {
	# Procedure called to update C_A_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_A_TDATA_WIDTH { PARAM_VALUE.C_A_TDATA_WIDTH } {
	# Procedure called to validate C_A_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_B_TDATA_WIDTH { PARAM_VALUE.C_B_TDATA_WIDTH } {
	# Procedure called to update C_B_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_B_TDATA_WIDTH { PARAM_VALUE.C_B_TDATA_WIDTH } {
	# Procedure called to validate C_B_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_C_TDATA_WIDTH { PARAM_VALUE.C_C_TDATA_WIDTH } {
	# Procedure called to update C_C_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_C_TDATA_WIDTH { PARAM_VALUE.C_C_TDATA_WIDTH } {
	# Procedure called to validate C_C_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_IN_CHANNELS { PARAM_VALUE.C_IN_CHANNELS } {
	# Procedure called to update C_IN_CHANNELS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_IN_CHANNELS { PARAM_VALUE.C_IN_CHANNELS } {
	# Procedure called to validate C_IN_CHANNELS
	return true
}

proc update_PARAM_VALUE.C_TVALID_TYPE { PARAM_VALUE.C_TVALID_TYPE } {
	# Procedure called to update C_TVALID_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_TVALID_TYPE { PARAM_VALUE.C_TVALID_TYPE } {
	# Procedure called to validate C_TVALID_TYPE
	return true
}

proc update_PARAM_VALUE.M_TDATA_WIDTH { PARAM_VALUE.M_TDATA_WIDTH } {
	# Procedure called to update M_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_TDATA_WIDTH { PARAM_VALUE.M_TDATA_WIDTH } {
	# Procedure called to validate M_TDATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_A_TDATA_WIDTH { MODELPARAM_VALUE.C_A_TDATA_WIDTH PARAM_VALUE.C_A_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_A_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_A_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_B_TDATA_WIDTH { MODELPARAM_VALUE.C_B_TDATA_WIDTH PARAM_VALUE.C_B_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_B_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_B_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_TVALID_TYPE { MODELPARAM_VALUE.C_TVALID_TYPE PARAM_VALUE.C_TVALID_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_TVALID_TYPE}] ${MODELPARAM_VALUE.C_TVALID_TYPE}
}

proc update_MODELPARAM_VALUE.C_C_TDATA_WIDTH { MODELPARAM_VALUE.C_C_TDATA_WIDTH PARAM_VALUE.C_C_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_C_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_C_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.M_TDATA_WIDTH { MODELPARAM_VALUE.M_TDATA_WIDTH PARAM_VALUE.M_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_TDATA_WIDTH}] ${MODELPARAM_VALUE.M_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_IN_CHANNELS { MODELPARAM_VALUE.C_IN_CHANNELS PARAM_VALUE.C_IN_CHANNELS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_IN_CHANNELS}] ${MODELPARAM_VALUE.C_IN_CHANNELS}
}


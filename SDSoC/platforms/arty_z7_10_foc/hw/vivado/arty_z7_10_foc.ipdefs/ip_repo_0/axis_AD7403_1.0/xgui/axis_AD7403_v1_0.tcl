# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "C_DECIMATION" -widget comboBox
  ipgui::add_param $IPINST -name "C_IMPLEMENTATION" -widget comboBox
  ipgui::add_param $IPINST -name "C_CLOCK_RATIO" -widget comboBox
  ipgui::add_param $IPINST -name "C_CHANNELS"
  ipgui::add_param $IPINST -name "C_M_AXIS_TDEST_WIDTH"
  ipgui::add_param $IPINST -name "C_M_AXIS_TDATA_WIDTH"
  ipgui::add_param $IPINST -name "C_OUT_TYPE" -widget comboBox
  ipgui::add_param $IPINST -name "C_DATA_BITS"
  ipgui::add_param $IPINST -name "C_SIGNED"

}

proc update_PARAM_VALUE.C_CHANNELS { PARAM_VALUE.C_CHANNELS } {
	# Procedure called to update C_CHANNELS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CHANNELS { PARAM_VALUE.C_CHANNELS } {
	# Procedure called to validate C_CHANNELS
	return true
}

proc update_PARAM_VALUE.C_CLOCK_RATIO { PARAM_VALUE.C_CLOCK_RATIO } {
	# Procedure called to update C_CLOCK_RATIO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CLOCK_RATIO { PARAM_VALUE.C_CLOCK_RATIO } {
	# Procedure called to validate C_CLOCK_RATIO
	return true
}

proc update_PARAM_VALUE.C_DATA_BITS { PARAM_VALUE.C_DATA_BITS } {
	# Procedure called to update C_DATA_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DATA_BITS { PARAM_VALUE.C_DATA_BITS } {
	# Procedure called to validate C_DATA_BITS
	return true
}

proc update_PARAM_VALUE.C_DECIMATION { PARAM_VALUE.C_DECIMATION } {
	# Procedure called to update C_DECIMATION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DECIMATION { PARAM_VALUE.C_DECIMATION } {
	# Procedure called to validate C_DECIMATION
	return true
}

proc update_PARAM_VALUE.C_IMPLEMENTATION { PARAM_VALUE.C_IMPLEMENTATION } {
	# Procedure called to update C_IMPLEMENTATION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_IMPLEMENTATION { PARAM_VALUE.C_IMPLEMENTATION } {
	# Procedure called to validate C_IMPLEMENTATION
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TDEST_WIDTH { PARAM_VALUE.C_M_AXIS_TDEST_WIDTH } {
	# Procedure called to update C_M_AXIS_TDEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TDEST_WIDTH { PARAM_VALUE.C_M_AXIS_TDEST_WIDTH } {
	# Procedure called to validate C_M_AXIS_TDEST_WIDTH
	return true
}

proc update_PARAM_VALUE.C_OUT_TYPE { PARAM_VALUE.C_OUT_TYPE } {
	# Procedure called to update C_OUT_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_OUT_TYPE { PARAM_VALUE.C_OUT_TYPE } {
	# Procedure called to validate C_OUT_TYPE
	return true
}

proc update_PARAM_VALUE.C_SIGNED { PARAM_VALUE.C_SIGNED } {
	# Procedure called to update C_SIGNED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SIGNED { PARAM_VALUE.C_SIGNED } {
	# Procedure called to validate C_SIGNED
	return true
}


proc update_MODELPARAM_VALUE.C_DECIMATION { MODELPARAM_VALUE.C_DECIMATION PARAM_VALUE.C_DECIMATION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DECIMATION}] ${MODELPARAM_VALUE.C_DECIMATION}
}

proc update_MODELPARAM_VALUE.C_IMPLEMENTATION { MODELPARAM_VALUE.C_IMPLEMENTATION PARAM_VALUE.C_IMPLEMENTATION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_IMPLEMENTATION}] ${MODELPARAM_VALUE.C_IMPLEMENTATION}
}

proc update_MODELPARAM_VALUE.C_CLOCK_RATIO { MODELPARAM_VALUE.C_CLOCK_RATIO PARAM_VALUE.C_CLOCK_RATIO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CLOCK_RATIO}] ${MODELPARAM_VALUE.C_CLOCK_RATIO}
}

proc update_MODELPARAM_VALUE.C_CHANNELS { MODELPARAM_VALUE.C_CHANNELS PARAM_VALUE.C_CHANNELS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CHANNELS}] ${MODELPARAM_VALUE.C_CHANNELS}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TDEST_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TDEST_WIDTH PARAM_VALUE.C_M_AXIS_TDEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TDEST_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TDEST_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_OUT_TYPE { MODELPARAM_VALUE.C_OUT_TYPE PARAM_VALUE.C_OUT_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_OUT_TYPE}] ${MODELPARAM_VALUE.C_OUT_TYPE}
}

proc update_MODELPARAM_VALUE.C_DATA_BITS { MODELPARAM_VALUE.C_DATA_BITS PARAM_VALUE.C_DATA_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DATA_BITS}] ${MODELPARAM_VALUE.C_DATA_BITS}
}

proc update_MODELPARAM_VALUE.C_SIGNED { MODELPARAM_VALUE.C_SIGNED PARAM_VALUE.C_SIGNED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SIGNED}] ${MODELPARAM_VALUE.C_SIGNED}
}


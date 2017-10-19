# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "C_BLOCK_SIZE"
  ipgui::add_param $IPINST -name "C_USE_TRIG"
  ipgui::add_param $IPINST -name "C_DATA_SYNC_TRIG"
  ipgui::add_param $IPINST -name "C_PRETRIG"

}

proc update_PARAM_VALUE.C_BLOCK_SIZE { PARAM_VALUE.C_BLOCK_SIZE } {
	# Procedure called to update C_BLOCK_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BLOCK_SIZE { PARAM_VALUE.C_BLOCK_SIZE } {
	# Procedure called to validate C_BLOCK_SIZE
	return true
}

proc update_PARAM_VALUE.C_DATA_SYNC_TRIG { PARAM_VALUE.C_DATA_SYNC_TRIG } {
	# Procedure called to update C_DATA_SYNC_TRIG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DATA_SYNC_TRIG { PARAM_VALUE.C_DATA_SYNC_TRIG } {
	# Procedure called to validate C_DATA_SYNC_TRIG
	return true
}

proc update_PARAM_VALUE.C_PRETRIG { PARAM_VALUE.C_PRETRIG } {
	# Procedure called to update C_PRETRIG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_PRETRIG { PARAM_VALUE.C_PRETRIG } {
	# Procedure called to validate C_PRETRIG
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_DATA_WIDTH { PARAM_VALUE.C_S_AXIS_DATA_WIDTH } {
	# Procedure called to update C_S_AXIS_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_DATA_WIDTH { PARAM_VALUE.C_S_AXIS_DATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_USE_TRIG { PARAM_VALUE.C_USE_TRIG } {
	# Procedure called to update C_USE_TRIG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_TRIG { PARAM_VALUE.C_USE_TRIG } {
	# Procedure called to validate C_USE_TRIG
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
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


proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_BLOCK_SIZE { MODELPARAM_VALUE.C_BLOCK_SIZE PARAM_VALUE.C_BLOCK_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BLOCK_SIZE}] ${MODELPARAM_VALUE.C_BLOCK_SIZE}
}

proc update_MODELPARAM_VALUE.C_USE_TRIG { MODELPARAM_VALUE.C_USE_TRIG PARAM_VALUE.C_USE_TRIG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_TRIG}] ${MODELPARAM_VALUE.C_USE_TRIG}
}

proc update_MODELPARAM_VALUE.C_DATA_SYNC_TRIG { MODELPARAM_VALUE.C_DATA_SYNC_TRIG PARAM_VALUE.C_DATA_SYNC_TRIG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DATA_SYNC_TRIG}] ${MODELPARAM_VALUE.C_DATA_SYNC_TRIG}
}

proc update_MODELPARAM_VALUE.C_PRETRIG { MODELPARAM_VALUE.C_PRETRIG PARAM_VALUE.C_PRETRIG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_PRETRIG}] ${MODELPARAM_VALUE.C_PRETRIG}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_DATA_WIDTH PARAM_VALUE.C_S_AXIS_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_DATA_WIDTH}
}


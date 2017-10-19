# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set general [ipgui::add_page $IPINST -name "general"]
  ipgui::add_param $IPINST -name "C_CHANNELS" -parent ${general}
  ipgui::add_param $IPINST -name "C_DATA_WIDTH" -parent ${general}
  ipgui::add_param $IPINST -name "C_MAX_DELAY" -parent ${general}
  ipgui::add_param $IPINST -name "C_USE_EXT_TRIGGER" -parent ${general}
  ipgui::add_param $IPINST -name "C_EXT_TRIGGER_WIDTH" -parent ${general}
  ipgui::add_param $IPINST -name "C_TRIGGER_OUT_LENGTH" -parent ${general}
  ipgui::add_param $IPINST -name "C_COREID" -parent ${general}


}

proc update_PARAM_VALUE.C_CHANNELS { PARAM_VALUE.C_CHANNELS } {
	# Procedure called to update C_CHANNELS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CHANNELS { PARAM_VALUE.C_CHANNELS } {
	# Procedure called to validate C_CHANNELS
	return true
}

proc update_PARAM_VALUE.C_COREID { PARAM_VALUE.C_COREID } {
	# Procedure called to update C_COREID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_COREID { PARAM_VALUE.C_COREID } {
	# Procedure called to validate C_COREID
	return true
}

proc update_PARAM_VALUE.C_DATA_WIDTH { PARAM_VALUE.C_DATA_WIDTH } {
	# Procedure called to update C_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DATA_WIDTH { PARAM_VALUE.C_DATA_WIDTH } {
	# Procedure called to validate C_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_EXT_TRIGGER_WIDTH { PARAM_VALUE.C_EXT_TRIGGER_WIDTH } {
	# Procedure called to update C_EXT_TRIGGER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_EXT_TRIGGER_WIDTH { PARAM_VALUE.C_EXT_TRIGGER_WIDTH } {
	# Procedure called to validate C_EXT_TRIGGER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_MAX_DELAY { PARAM_VALUE.C_MAX_DELAY } {
	# Procedure called to update C_MAX_DELAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_MAX_DELAY { PARAM_VALUE.C_MAX_DELAY } {
	# Procedure called to validate C_MAX_DELAY
	return true
}

proc update_PARAM_VALUE.C_TRIGGER_OUT_LENGTH { PARAM_VALUE.C_TRIGGER_OUT_LENGTH } {
	# Procedure called to update C_TRIGGER_OUT_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_TRIGGER_OUT_LENGTH { PARAM_VALUE.C_TRIGGER_OUT_LENGTH } {
	# Procedure called to validate C_TRIGGER_OUT_LENGTH
	return true
}

proc update_PARAM_VALUE.C_USE_EXT_TRIGGER { PARAM_VALUE.C_USE_EXT_TRIGGER } {
	# Procedure called to update C_USE_EXT_TRIGGER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_EXT_TRIGGER { PARAM_VALUE.C_USE_EXT_TRIGGER } {
	# Procedure called to validate C_USE_EXT_TRIGGER
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

proc update_MODELPARAM_VALUE.C_CHANNELS { MODELPARAM_VALUE.C_CHANNELS PARAM_VALUE.C_CHANNELS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CHANNELS}] ${MODELPARAM_VALUE.C_CHANNELS}
}

proc update_MODELPARAM_VALUE.C_DATA_WIDTH { MODELPARAM_VALUE.C_DATA_WIDTH PARAM_VALUE.C_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DATA_WIDTH}] ${MODELPARAM_VALUE.C_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_MAX_DELAY { MODELPARAM_VALUE.C_MAX_DELAY PARAM_VALUE.C_MAX_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_MAX_DELAY}] ${MODELPARAM_VALUE.C_MAX_DELAY}
}

proc update_MODELPARAM_VALUE.C_COREID { MODELPARAM_VALUE.C_COREID PARAM_VALUE.C_COREID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_COREID}] ${MODELPARAM_VALUE.C_COREID}
}

proc update_MODELPARAM_VALUE.C_USE_EXT_TRIGGER { MODELPARAM_VALUE.C_USE_EXT_TRIGGER PARAM_VALUE.C_USE_EXT_TRIGGER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_EXT_TRIGGER}] ${MODELPARAM_VALUE.C_USE_EXT_TRIGGER}
}

proc update_MODELPARAM_VALUE.C_EXT_TRIGGER_WIDTH { MODELPARAM_VALUE.C_EXT_TRIGGER_WIDTH PARAM_VALUE.C_EXT_TRIGGER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_EXT_TRIGGER_WIDTH}] ${MODELPARAM_VALUE.C_EXT_TRIGGER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_TRIGGER_OUT_LENGTH { MODELPARAM_VALUE.C_TRIGGER_OUT_LENGTH PARAM_VALUE.C_TRIGGER_OUT_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_TRIGGER_OUT_LENGTH}] ${MODELPARAM_VALUE.C_TRIGGER_OUT_LENGTH}
}


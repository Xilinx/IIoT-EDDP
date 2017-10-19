
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI_Data_Capture_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  #Adding Page
  set Page_1 [ipgui::add_page $IPINST -name "Page 1"]
  ipgui::add_param $IPINST -name "Component_Name" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_S_AXI_DATA_WIDTH" -parent ${Page_1} -widget comboBox
  ipgui::add_param $IPINST -name "C_USE_TRIGGER" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_COREID" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_CAPTURE_CHANNELS" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_M_AXIS_CMD_TDATA_WIDTH" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_S_AXI_ADDR_WIDTH" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_S_AXI_BASEADDR" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_S_AXI_HIGHADDR" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_M_AXIS_S2MM_TDATA_WIDTH" -parent ${Page_1} -widget comboBox
  ipgui::add_param $IPINST -name "C_CHANNELS" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_S_AXIS_S2MM_STS_TDATA_WIDTH" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_M_AXIS_S2MM_CMD_TDATA_WIDTH" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_CDATA_WIDTH" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_CMD_AXIS" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_USE_TIMESTAMP" -parent ${Page_1}
  ipgui::add_param $IPINST -name "C_USE_ADC_CLK" -parent ${Page_1}


}

proc update_PARAM_VALUE.C_USE_ADC_CLK { PARAM_VALUE.C_USE_ADC_CLK } {
	# Procedure called to update C_USE_ADC_CLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_ADC_CLK { PARAM_VALUE.C_USE_ADC_CLK } {
	# Procedure called to validate C_USE_ADC_CLK
	return true
}

proc update_PARAM_VALUE.C_USE_TIMESTAMP { PARAM_VALUE.C_USE_TIMESTAMP } {
	# Procedure called to update C_USE_TIMESTAMP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_TIMESTAMP { PARAM_VALUE.C_USE_TIMESTAMP } {
	# Procedure called to validate C_USE_TIMESTAMP
	return true
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

proc update_MODELPARAM_VALUE.C_USE_TIMESTAMP { MODELPARAM_VALUE.C_USE_TIMESTAMP PARAM_VALUE.C_USE_TIMESTAMP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_TIMESTAMP}] ${MODELPARAM_VALUE.C_USE_TIMESTAMP}
}

proc update_MODELPARAM_VALUE.C_USE_ADC_CLK { MODELPARAM_VALUE.C_USE_ADC_CLK PARAM_VALUE.C_USE_ADC_CLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_ADC_CLK}] ${MODELPARAM_VALUE.C_USE_ADC_CLK}
}

proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_S2MM_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_S2MM_STS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_S2MM_CMD_TDATA_WIDTH}
}


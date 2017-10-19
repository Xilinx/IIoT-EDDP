
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/axi_reg32_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set AXI [ipgui::add_page $IPINST -name "AXI"]
  ipgui::add_param $IPINST -name "C_S_AXI_DATA_WIDTH" -parent ${AXI}
  ipgui::add_param $IPINST -name "C_S_AXI_ADDR_WIDTH" -parent ${AXI}
  ipgui::add_param $IPINST -name "C_S_AXI_BASEADDR" -parent ${AXI}
  ipgui::add_param $IPINST -name "C_S_AXI_HIGHADDR" -parent ${AXI}

  #Adding Page
  set Input_Registers [ipgui::add_page $IPINST -name "Input Registers"]
  ipgui::add_param $IPINST -name "C_NUM_RO_REG" -parent ${Input_Registers} -widget comboBox
  #Adding Group
  set Input_Register_Alias [ipgui::add_group $IPINST -name "Input Register Alias" -parent ${Input_Registers}]
  ipgui::add_param $IPINST -name "C_RR0_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR1_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR2_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR3_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR4_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR5_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR6_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR7_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR8_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR9_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR10_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR11_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR12_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR13_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR14_ALIAS" -parent ${Input_Register_Alias}
  ipgui::add_param $IPINST -name "C_RR15_ALIAS" -parent ${Input_Register_Alias}


  #Adding Page
  set Output_Registers [ipgui::add_page $IPINST -name "Output Registers"]
  ipgui::add_param $IPINST -name "C_WR_READABLE" -parent ${Output_Registers}
  ipgui::add_param $IPINST -name "C_NUM_WR_REG" -parent ${Output_Registers} -widget comboBox
  #Adding Group
  set Registers [ipgui::add_group $IPINST -name "Registers" -parent ${Output_Registers} -layout horizontal]
  #Adding Group
  set Aliases [ipgui::add_group $IPINST -name "Aliases" -parent ${Registers}]
  ipgui::add_param $IPINST -name "C_WR0_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR1_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR2_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR3_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR4_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR5_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR6_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR7_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR8_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR9_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR10_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR11_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR12_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR13_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR14_ALIAS" -parent ${Aliases}
  ipgui::add_param $IPINST -name "C_WR15_ALIAS" -parent ${Aliases}

  #Adding Group
  set Default [ipgui::add_group $IPINST -name "Default" -parent ${Registers}]
  ipgui::add_param $IPINST -name "C_WR0_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR1_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR2_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR3_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR4_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR5_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR6_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR7_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR8_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR9_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR10_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR11_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR12_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR13_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR14_DEFAULT" -parent ${Default}
  ipgui::add_param $IPINST -name "C_WR15_DEFAULT" -parent ${Default}




}

proc update_PARAM_VALUE.C_NUM_RO_REG { PARAM_VALUE.C_NUM_RO_REG } {
	# Procedure called to update C_NUM_RO_REG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_NUM_RO_REG { PARAM_VALUE.C_NUM_RO_REG } {
	# Procedure called to validate C_NUM_RO_REG
	return true
}

proc update_PARAM_VALUE.C_NUM_WR_REG { PARAM_VALUE.C_NUM_WR_REG } {
	# Procedure called to update C_NUM_WR_REG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_NUM_WR_REG { PARAM_VALUE.C_NUM_WR_REG } {
	# Procedure called to validate C_NUM_WR_REG
	return true
}

proc update_PARAM_VALUE.C_RR0_ALIAS { PARAM_VALUE.C_RR0_ALIAS } {
	# Procedure called to update C_RR0_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR0_ALIAS { PARAM_VALUE.C_RR0_ALIAS } {
	# Procedure called to validate C_RR0_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR10_ALIAS { PARAM_VALUE.C_RR10_ALIAS } {
	# Procedure called to update C_RR10_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR10_ALIAS { PARAM_VALUE.C_RR10_ALIAS } {
	# Procedure called to validate C_RR10_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR11_ALIAS { PARAM_VALUE.C_RR11_ALIAS } {
	# Procedure called to update C_RR11_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR11_ALIAS { PARAM_VALUE.C_RR11_ALIAS } {
	# Procedure called to validate C_RR11_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR12_ALIAS { PARAM_VALUE.C_RR12_ALIAS } {
	# Procedure called to update C_RR12_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR12_ALIAS { PARAM_VALUE.C_RR12_ALIAS } {
	# Procedure called to validate C_RR12_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR13_ALIAS { PARAM_VALUE.C_RR13_ALIAS } {
	# Procedure called to update C_RR13_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR13_ALIAS { PARAM_VALUE.C_RR13_ALIAS } {
	# Procedure called to validate C_RR13_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR14_ALIAS { PARAM_VALUE.C_RR14_ALIAS } {
	# Procedure called to update C_RR14_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR14_ALIAS { PARAM_VALUE.C_RR14_ALIAS } {
	# Procedure called to validate C_RR14_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR15_ALIAS { PARAM_VALUE.C_RR15_ALIAS } {
	# Procedure called to update C_RR15_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR15_ALIAS { PARAM_VALUE.C_RR15_ALIAS } {
	# Procedure called to validate C_RR15_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR1_ALIAS { PARAM_VALUE.C_RR1_ALIAS } {
	# Procedure called to update C_RR1_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR1_ALIAS { PARAM_VALUE.C_RR1_ALIAS } {
	# Procedure called to validate C_RR1_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR2_ALIAS { PARAM_VALUE.C_RR2_ALIAS } {
	# Procedure called to update C_RR2_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR2_ALIAS { PARAM_VALUE.C_RR2_ALIAS } {
	# Procedure called to validate C_RR2_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR3_ALIAS { PARAM_VALUE.C_RR3_ALIAS } {
	# Procedure called to update C_RR3_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR3_ALIAS { PARAM_VALUE.C_RR3_ALIAS } {
	# Procedure called to validate C_RR3_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR4_ALIAS { PARAM_VALUE.C_RR4_ALIAS } {
	# Procedure called to update C_RR4_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR4_ALIAS { PARAM_VALUE.C_RR4_ALIAS } {
	# Procedure called to validate C_RR4_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR5_ALIAS { PARAM_VALUE.C_RR5_ALIAS } {
	# Procedure called to update C_RR5_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR5_ALIAS { PARAM_VALUE.C_RR5_ALIAS } {
	# Procedure called to validate C_RR5_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR6_ALIAS { PARAM_VALUE.C_RR6_ALIAS } {
	# Procedure called to update C_RR6_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR6_ALIAS { PARAM_VALUE.C_RR6_ALIAS } {
	# Procedure called to validate C_RR6_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR7_ALIAS { PARAM_VALUE.C_RR7_ALIAS } {
	# Procedure called to update C_RR7_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR7_ALIAS { PARAM_VALUE.C_RR7_ALIAS } {
	# Procedure called to validate C_RR7_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR8_ALIAS { PARAM_VALUE.C_RR8_ALIAS } {
	# Procedure called to update C_RR8_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR8_ALIAS { PARAM_VALUE.C_RR8_ALIAS } {
	# Procedure called to validate C_RR8_ALIAS
	return true
}

proc update_PARAM_VALUE.C_RR9_ALIAS { PARAM_VALUE.C_RR9_ALIAS } {
	# Procedure called to update C_RR9_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RR9_ALIAS { PARAM_VALUE.C_RR9_ALIAS } {
	# Procedure called to validate C_RR9_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR0_ALIAS { PARAM_VALUE.C_WR0_ALIAS } {
	# Procedure called to update C_WR0_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR0_ALIAS { PARAM_VALUE.C_WR0_ALIAS } {
	# Procedure called to validate C_WR0_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR0_DEFAULT { PARAM_VALUE.C_WR0_DEFAULT } {
	# Procedure called to update C_WR0_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR0_DEFAULT { PARAM_VALUE.C_WR0_DEFAULT } {
	# Procedure called to validate C_WR0_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR10_ALIAS { PARAM_VALUE.C_WR10_ALIAS } {
	# Procedure called to update C_WR10_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR10_ALIAS { PARAM_VALUE.C_WR10_ALIAS } {
	# Procedure called to validate C_WR10_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR10_DEFAULT { PARAM_VALUE.C_WR10_DEFAULT } {
	# Procedure called to update C_WR10_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR10_DEFAULT { PARAM_VALUE.C_WR10_DEFAULT } {
	# Procedure called to validate C_WR10_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR11_ALIAS { PARAM_VALUE.C_WR11_ALIAS } {
	# Procedure called to update C_WR11_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR11_ALIAS { PARAM_VALUE.C_WR11_ALIAS } {
	# Procedure called to validate C_WR11_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR11_DEFAULT { PARAM_VALUE.C_WR11_DEFAULT } {
	# Procedure called to update C_WR11_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR11_DEFAULT { PARAM_VALUE.C_WR11_DEFAULT } {
	# Procedure called to validate C_WR11_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR12_ALIAS { PARAM_VALUE.C_WR12_ALIAS } {
	# Procedure called to update C_WR12_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR12_ALIAS { PARAM_VALUE.C_WR12_ALIAS } {
	# Procedure called to validate C_WR12_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR12_DEFAULT { PARAM_VALUE.C_WR12_DEFAULT } {
	# Procedure called to update C_WR12_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR12_DEFAULT { PARAM_VALUE.C_WR12_DEFAULT } {
	# Procedure called to validate C_WR12_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR13_ALIAS { PARAM_VALUE.C_WR13_ALIAS } {
	# Procedure called to update C_WR13_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR13_ALIAS { PARAM_VALUE.C_WR13_ALIAS } {
	# Procedure called to validate C_WR13_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR13_DEFAULT { PARAM_VALUE.C_WR13_DEFAULT } {
	# Procedure called to update C_WR13_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR13_DEFAULT { PARAM_VALUE.C_WR13_DEFAULT } {
	# Procedure called to validate C_WR13_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR14_ALIAS { PARAM_VALUE.C_WR14_ALIAS } {
	# Procedure called to update C_WR14_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR14_ALIAS { PARAM_VALUE.C_WR14_ALIAS } {
	# Procedure called to validate C_WR14_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR14_DEFAULT { PARAM_VALUE.C_WR14_DEFAULT } {
	# Procedure called to update C_WR14_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR14_DEFAULT { PARAM_VALUE.C_WR14_DEFAULT } {
	# Procedure called to validate C_WR14_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR15_ALIAS { PARAM_VALUE.C_WR15_ALIAS } {
	# Procedure called to update C_WR15_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR15_ALIAS { PARAM_VALUE.C_WR15_ALIAS } {
	# Procedure called to validate C_WR15_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR15_DEFAULT { PARAM_VALUE.C_WR15_DEFAULT } {
	# Procedure called to update C_WR15_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR15_DEFAULT { PARAM_VALUE.C_WR15_DEFAULT } {
	# Procedure called to validate C_WR15_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR1_ALIAS { PARAM_VALUE.C_WR1_ALIAS } {
	# Procedure called to update C_WR1_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR1_ALIAS { PARAM_VALUE.C_WR1_ALIAS } {
	# Procedure called to validate C_WR1_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR1_DEFAULT { PARAM_VALUE.C_WR1_DEFAULT } {
	# Procedure called to update C_WR1_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR1_DEFAULT { PARAM_VALUE.C_WR1_DEFAULT } {
	# Procedure called to validate C_WR1_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR2_ALIAS { PARAM_VALUE.C_WR2_ALIAS } {
	# Procedure called to update C_WR2_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR2_ALIAS { PARAM_VALUE.C_WR2_ALIAS } {
	# Procedure called to validate C_WR2_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR2_DEFAULT { PARAM_VALUE.C_WR2_DEFAULT } {
	# Procedure called to update C_WR2_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR2_DEFAULT { PARAM_VALUE.C_WR2_DEFAULT } {
	# Procedure called to validate C_WR2_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR3_ALIAS { PARAM_VALUE.C_WR3_ALIAS } {
	# Procedure called to update C_WR3_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR3_ALIAS { PARAM_VALUE.C_WR3_ALIAS } {
	# Procedure called to validate C_WR3_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR3_DEFAULT { PARAM_VALUE.C_WR3_DEFAULT } {
	# Procedure called to update C_WR3_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR3_DEFAULT { PARAM_VALUE.C_WR3_DEFAULT } {
	# Procedure called to validate C_WR3_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR4_ALIAS { PARAM_VALUE.C_WR4_ALIAS } {
	# Procedure called to update C_WR4_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR4_ALIAS { PARAM_VALUE.C_WR4_ALIAS } {
	# Procedure called to validate C_WR4_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR4_DEFAULT { PARAM_VALUE.C_WR4_DEFAULT } {
	# Procedure called to update C_WR4_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR4_DEFAULT { PARAM_VALUE.C_WR4_DEFAULT } {
	# Procedure called to validate C_WR4_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR5_ALIAS { PARAM_VALUE.C_WR5_ALIAS } {
	# Procedure called to update C_WR5_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR5_ALIAS { PARAM_VALUE.C_WR5_ALIAS } {
	# Procedure called to validate C_WR5_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR5_DEFAULT { PARAM_VALUE.C_WR5_DEFAULT } {
	# Procedure called to update C_WR5_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR5_DEFAULT { PARAM_VALUE.C_WR5_DEFAULT } {
	# Procedure called to validate C_WR5_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR6_ALIAS { PARAM_VALUE.C_WR6_ALIAS } {
	# Procedure called to update C_WR6_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR6_ALIAS { PARAM_VALUE.C_WR6_ALIAS } {
	# Procedure called to validate C_WR6_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR6_DEFAULT { PARAM_VALUE.C_WR6_DEFAULT } {
	# Procedure called to update C_WR6_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR6_DEFAULT { PARAM_VALUE.C_WR6_DEFAULT } {
	# Procedure called to validate C_WR6_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR7_ALIAS { PARAM_VALUE.C_WR7_ALIAS } {
	# Procedure called to update C_WR7_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR7_ALIAS { PARAM_VALUE.C_WR7_ALIAS } {
	# Procedure called to validate C_WR7_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR7_DEFAULT { PARAM_VALUE.C_WR7_DEFAULT } {
	# Procedure called to update C_WR7_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR7_DEFAULT { PARAM_VALUE.C_WR7_DEFAULT } {
	# Procedure called to validate C_WR7_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR8_ALIAS { PARAM_VALUE.C_WR8_ALIAS } {
	# Procedure called to update C_WR8_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR8_ALIAS { PARAM_VALUE.C_WR8_ALIAS } {
	# Procedure called to validate C_WR8_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR8_DEFAULT { PARAM_VALUE.C_WR8_DEFAULT } {
	# Procedure called to update C_WR8_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR8_DEFAULT { PARAM_VALUE.C_WR8_DEFAULT } {
	# Procedure called to validate C_WR8_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR9_ALIAS { PARAM_VALUE.C_WR9_ALIAS } {
	# Procedure called to update C_WR9_ALIAS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR9_ALIAS { PARAM_VALUE.C_WR9_ALIAS } {
	# Procedure called to validate C_WR9_ALIAS
	return true
}

proc update_PARAM_VALUE.C_WR9_DEFAULT { PARAM_VALUE.C_WR9_DEFAULT } {
	# Procedure called to update C_WR9_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR9_DEFAULT { PARAM_VALUE.C_WR9_DEFAULT } {
	# Procedure called to validate C_WR9_DEFAULT
	return true
}

proc update_PARAM_VALUE.C_WR_READABLE { PARAM_VALUE.C_WR_READABLE } {
	# Procedure called to update C_WR_READABLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WR_READABLE { PARAM_VALUE.C_WR_READABLE } {
	# Procedure called to validate C_WR_READABLE
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

proc update_MODELPARAM_VALUE.C_REG_WIDTH { MODELPARAM_VALUE.C_REG_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_REG_WIDTH". Setting updated value from the model parameter.
set_property value 32 ${MODELPARAM_VALUE.C_REG_WIDTH}
}

proc update_MODELPARAM_VALUE.C_NUM_RO_REG { MODELPARAM_VALUE.C_NUM_RO_REG PARAM_VALUE.C_NUM_RO_REG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_NUM_RO_REG}] ${MODELPARAM_VALUE.C_NUM_RO_REG}
}

proc update_MODELPARAM_VALUE.C_NUM_WR_REG { MODELPARAM_VALUE.C_NUM_WR_REG PARAM_VALUE.C_NUM_WR_REG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_NUM_WR_REG}] ${MODELPARAM_VALUE.C_NUM_WR_REG}
}

proc update_MODELPARAM_VALUE.C_WR_READABLE { MODELPARAM_VALUE.C_WR_READABLE PARAM_VALUE.C_WR_READABLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR_READABLE}] ${MODELPARAM_VALUE.C_WR_READABLE}
}

proc update_MODELPARAM_VALUE.C_RR0_ALIAS { MODELPARAM_VALUE.C_RR0_ALIAS PARAM_VALUE.C_RR0_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR0_ALIAS}] ${MODELPARAM_VALUE.C_RR0_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR1_ALIAS { MODELPARAM_VALUE.C_RR1_ALIAS PARAM_VALUE.C_RR1_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR1_ALIAS}] ${MODELPARAM_VALUE.C_RR1_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR0_ALIAS { MODELPARAM_VALUE.C_WR0_ALIAS PARAM_VALUE.C_WR0_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR0_ALIAS}] ${MODELPARAM_VALUE.C_WR0_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR1_ALIAS { MODELPARAM_VALUE.C_WR1_ALIAS PARAM_VALUE.C_WR1_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR1_ALIAS}] ${MODELPARAM_VALUE.C_WR1_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR2_ALIAS { MODELPARAM_VALUE.C_RR2_ALIAS PARAM_VALUE.C_RR2_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR2_ALIAS}] ${MODELPARAM_VALUE.C_RR2_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR3_ALIAS { MODELPARAM_VALUE.C_RR3_ALIAS PARAM_VALUE.C_RR3_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR3_ALIAS}] ${MODELPARAM_VALUE.C_RR3_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR4_ALIAS { MODELPARAM_VALUE.C_RR4_ALIAS PARAM_VALUE.C_RR4_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR4_ALIAS}] ${MODELPARAM_VALUE.C_RR4_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR5_ALIAS { MODELPARAM_VALUE.C_RR5_ALIAS PARAM_VALUE.C_RR5_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR5_ALIAS}] ${MODELPARAM_VALUE.C_RR5_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR6_ALIAS { MODELPARAM_VALUE.C_RR6_ALIAS PARAM_VALUE.C_RR6_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR6_ALIAS}] ${MODELPARAM_VALUE.C_RR6_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR7_ALIAS { MODELPARAM_VALUE.C_RR7_ALIAS PARAM_VALUE.C_RR7_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR7_ALIAS}] ${MODELPARAM_VALUE.C_RR7_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR8_ALIAS { MODELPARAM_VALUE.C_RR8_ALIAS PARAM_VALUE.C_RR8_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR8_ALIAS}] ${MODELPARAM_VALUE.C_RR8_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR9_ALIAS { MODELPARAM_VALUE.C_RR9_ALIAS PARAM_VALUE.C_RR9_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR9_ALIAS}] ${MODELPARAM_VALUE.C_RR9_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR10_ALIAS { MODELPARAM_VALUE.C_RR10_ALIAS PARAM_VALUE.C_RR10_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR10_ALIAS}] ${MODELPARAM_VALUE.C_RR10_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR11_ALIAS { MODELPARAM_VALUE.C_RR11_ALIAS PARAM_VALUE.C_RR11_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR11_ALIAS}] ${MODELPARAM_VALUE.C_RR11_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR12_ALIAS { MODELPARAM_VALUE.C_RR12_ALIAS PARAM_VALUE.C_RR12_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR12_ALIAS}] ${MODELPARAM_VALUE.C_RR12_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR13_ALIAS { MODELPARAM_VALUE.C_RR13_ALIAS PARAM_VALUE.C_RR13_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR13_ALIAS}] ${MODELPARAM_VALUE.C_RR13_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR14_ALIAS { MODELPARAM_VALUE.C_RR14_ALIAS PARAM_VALUE.C_RR14_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR14_ALIAS}] ${MODELPARAM_VALUE.C_RR14_ALIAS}
}

proc update_MODELPARAM_VALUE.C_RR15_ALIAS { MODELPARAM_VALUE.C_RR15_ALIAS PARAM_VALUE.C_RR15_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RR15_ALIAS}] ${MODELPARAM_VALUE.C_RR15_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR2_ALIAS { MODELPARAM_VALUE.C_WR2_ALIAS PARAM_VALUE.C_WR2_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR2_ALIAS}] ${MODELPARAM_VALUE.C_WR2_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR3_ALIAS { MODELPARAM_VALUE.C_WR3_ALIAS PARAM_VALUE.C_WR3_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR3_ALIAS}] ${MODELPARAM_VALUE.C_WR3_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR4_ALIAS { MODELPARAM_VALUE.C_WR4_ALIAS PARAM_VALUE.C_WR4_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR4_ALIAS}] ${MODELPARAM_VALUE.C_WR4_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR5_ALIAS { MODELPARAM_VALUE.C_WR5_ALIAS PARAM_VALUE.C_WR5_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR5_ALIAS}] ${MODELPARAM_VALUE.C_WR5_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR6_ALIAS { MODELPARAM_VALUE.C_WR6_ALIAS PARAM_VALUE.C_WR6_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR6_ALIAS}] ${MODELPARAM_VALUE.C_WR6_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR7_ALIAS { MODELPARAM_VALUE.C_WR7_ALIAS PARAM_VALUE.C_WR7_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR7_ALIAS}] ${MODELPARAM_VALUE.C_WR7_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR8_ALIAS { MODELPARAM_VALUE.C_WR8_ALIAS PARAM_VALUE.C_WR8_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR8_ALIAS}] ${MODELPARAM_VALUE.C_WR8_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR9_ALIAS { MODELPARAM_VALUE.C_WR9_ALIAS PARAM_VALUE.C_WR9_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR9_ALIAS}] ${MODELPARAM_VALUE.C_WR9_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR10_ALIAS { MODELPARAM_VALUE.C_WR10_ALIAS PARAM_VALUE.C_WR10_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR10_ALIAS}] ${MODELPARAM_VALUE.C_WR10_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR11_ALIAS { MODELPARAM_VALUE.C_WR11_ALIAS PARAM_VALUE.C_WR11_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR11_ALIAS}] ${MODELPARAM_VALUE.C_WR11_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR12_ALIAS { MODELPARAM_VALUE.C_WR12_ALIAS PARAM_VALUE.C_WR12_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR12_ALIAS}] ${MODELPARAM_VALUE.C_WR12_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR13_ALIAS { MODELPARAM_VALUE.C_WR13_ALIAS PARAM_VALUE.C_WR13_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR13_ALIAS}] ${MODELPARAM_VALUE.C_WR13_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR14_ALIAS { MODELPARAM_VALUE.C_WR14_ALIAS PARAM_VALUE.C_WR14_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR14_ALIAS}] ${MODELPARAM_VALUE.C_WR14_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR15_ALIAS { MODELPARAM_VALUE.C_WR15_ALIAS PARAM_VALUE.C_WR15_ALIAS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR15_ALIAS}] ${MODELPARAM_VALUE.C_WR15_ALIAS}
}

proc update_MODELPARAM_VALUE.C_WR0_DEFAULT { MODELPARAM_VALUE.C_WR0_DEFAULT PARAM_VALUE.C_WR0_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR0_DEFAULT}] ${MODELPARAM_VALUE.C_WR0_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR1_DEFAULT { MODELPARAM_VALUE.C_WR1_DEFAULT PARAM_VALUE.C_WR1_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR1_DEFAULT}] ${MODELPARAM_VALUE.C_WR1_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR2_DEFAULT { MODELPARAM_VALUE.C_WR2_DEFAULT PARAM_VALUE.C_WR2_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR2_DEFAULT}] ${MODELPARAM_VALUE.C_WR2_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR3_DEFAULT { MODELPARAM_VALUE.C_WR3_DEFAULT PARAM_VALUE.C_WR3_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR3_DEFAULT}] ${MODELPARAM_VALUE.C_WR3_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR4_DEFAULT { MODELPARAM_VALUE.C_WR4_DEFAULT PARAM_VALUE.C_WR4_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR4_DEFAULT}] ${MODELPARAM_VALUE.C_WR4_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR5_DEFAULT { MODELPARAM_VALUE.C_WR5_DEFAULT PARAM_VALUE.C_WR5_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR5_DEFAULT}] ${MODELPARAM_VALUE.C_WR5_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR6_DEFAULT { MODELPARAM_VALUE.C_WR6_DEFAULT PARAM_VALUE.C_WR6_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR6_DEFAULT}] ${MODELPARAM_VALUE.C_WR6_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR7_DEFAULT { MODELPARAM_VALUE.C_WR7_DEFAULT PARAM_VALUE.C_WR7_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR7_DEFAULT}] ${MODELPARAM_VALUE.C_WR7_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR8_DEFAULT { MODELPARAM_VALUE.C_WR8_DEFAULT PARAM_VALUE.C_WR8_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR8_DEFAULT}] ${MODELPARAM_VALUE.C_WR8_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR9_DEFAULT { MODELPARAM_VALUE.C_WR9_DEFAULT PARAM_VALUE.C_WR9_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR9_DEFAULT}] ${MODELPARAM_VALUE.C_WR9_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR10_DEFAULT { MODELPARAM_VALUE.C_WR10_DEFAULT PARAM_VALUE.C_WR10_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR10_DEFAULT}] ${MODELPARAM_VALUE.C_WR10_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR11_DEFAULT { MODELPARAM_VALUE.C_WR11_DEFAULT PARAM_VALUE.C_WR11_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR11_DEFAULT}] ${MODELPARAM_VALUE.C_WR11_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR12_DEFAULT { MODELPARAM_VALUE.C_WR12_DEFAULT PARAM_VALUE.C_WR12_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR12_DEFAULT}] ${MODELPARAM_VALUE.C_WR12_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR13_DEFAULT { MODELPARAM_VALUE.C_WR13_DEFAULT PARAM_VALUE.C_WR13_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR13_DEFAULT}] ${MODELPARAM_VALUE.C_WR13_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR14_DEFAULT { MODELPARAM_VALUE.C_WR14_DEFAULT PARAM_VALUE.C_WR14_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR14_DEFAULT}] ${MODELPARAM_VALUE.C_WR14_DEFAULT}
}

proc update_MODELPARAM_VALUE.C_WR15_DEFAULT { MODELPARAM_VALUE.C_WR15_DEFAULT PARAM_VALUE.C_WR15_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WR15_DEFAULT}] ${MODELPARAM_VALUE.C_WR15_DEFAULT}
}


#set_false_path -from [get_pins {AXI_Data_Capture_v1_0_S_AXI_inst/slv_reg1_reg[1]/C}] -to [get_pins {transfer_count_reg[*]/CE}]
#set_false_path -from [get_pins {end_cd_i/src_sr_reg[3]/C}] -to [get_pins {end_cd_i/dst_sr_reg[0]/D}]
#set_false_path -from [get_pins {start_cd_i/src_sr_reg[3]/C}] -to [get_pins {start_cd_i/dst_sr_reg[0]/D}]
#set_false_path -from [get_pins {AXI_Data_Capture_v1_0_S_AXI_inst/slv_reg1_reg[1]/C}] -to [get_pins {FSM_onehot_sm_trigger_state_reg[*]/CE}]
#set_false_path -from [get_pins {AXI_Data_Capture_v1_0_S_AXI_inst/slv_reg8_reg[0]/C}] -to [get_pins {pretrigger_length_i_reg[0]/D}]
#set_false_path -from [get_pins {AXI_Data_Capture_v1_0_S_AXI_inst/slv_reg8_reg[4]/C}] -to [get_pins {pretrigger_length_i_reg[4]/D}]

#set_false_path -from [get_pins {AXI_Data_Capture_v1_0_S_AXI_inst/slv_reg8_reg[*]/C}] -to [get_pins {pretrigger_length_i_reg[*]/D}]
#set_false_path -from [get_pins {AXI_Data_Capture_v1_0_S_AXI_inst/slv_reg7_reg[*]/C}] -to [get_pins {transfer_count_reg[*]/D}]
#set_false_path -from [get_pins {AXI_Data_Capture_v1_0_S_AXI_inst/slv_reg1_reg[1]/C}] -to [get_pins transfer_active_reg/D]
#set_false_path -from [get_pins {AXI_Data_Capture_v1_0_S_AXI_inst/slv_reg1_reg[1]/C}] -to [get_pins transfer_enable_i_reg/D]

#set_false_path -from [get_pins {soft_trig_cd_i/src_sr_reg[3]/C}] -to [get_pins {soft_trig_cd_i/dst_sr_reg[0]/D}]
#set_false_path -from [get_pins {m_fifo_aresetn_i}]

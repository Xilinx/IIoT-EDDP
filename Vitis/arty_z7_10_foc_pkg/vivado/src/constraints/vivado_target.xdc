

set topInstance [get_cells -filter {!IS_PRIMITIVE}]

#create_generated_clock -name clk_fpga_0_ss -source [get_pins $topInstance/clk_wiz_0/inst/mmcm_adv_inst/CLKIN1] -master_clock $topInstance/clk_wiz_0/inst/clk_in1 [get_pins $topInstance/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]
#set_clock_groups -name exclusive_clks -physically_exclusive -group [get_clocks clk_fpga_0] -group [get_clocks clk_fpga_0_ss]

set_case_analysis 0 [get_pins $topInstance/clk_mux_0/U0/BUFGMUX_inst/S]


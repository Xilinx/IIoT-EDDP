#ULTRA96 PORT CONSTRAINT


########################################################################################################
#Arty PMOD Pinouts
#
#SIG  PIN# SCHEM  PMOD JA  SCHEM  PIN# SIG   | SIG               PIN# SCHEM  PMOD JB  SCHEM  PIN# SIG   
#                 +------+                   |                               +------+                   
#SCLK Y18  JA1_P  | 1  X | JA3_P  U18  SDV   | GH[0]             W14  JB1_P  | 1  X | JB3_P  V16  GL[0]  
#SDI1 Y19  JA1_N  | X  X | JA3_N  U19  ENC_A | GH[1]             Y14  JB1_N  | X  X | JB3_N  W16  GL[1]  
#SDI2 Y16  JA2_P  | X  X | JA4_P  W18  ENC_B | GH[2]             T11  JB2_P  | X  X | JB4_P  V12  GL[2]  
#SDI3 Y17  JA2_N  | X  X | JA4_N  W19  ENC_I | GPIO_0_tri_io[1]  T10  JB2_N  | X  X | JB4_N  W13  GPIO_0_tri_io[0]
#          GND    | X  X | GND               |                        GND    | X  X | GND                
#          VCC3.3 | X  X | VCC3.3            |                        VCC3.3 | X  X | VCC3.3             
#                 +------+                   |                               +------+                    

########################################################################################################
# PMOD2 on mezz board (lines up with PMOD JA on Arty)
#
#
#       MEZZ            MEZZ  Ultra                                       Ultra       MEZZ        MEZZ          
#SIG    SCHEM            J3   SCHEM      PIN#    PMOD 2  PIN#  SCHEM        J3        SCHEM       SIG    
#                                              +------+                                                 
#SCLK   PMOD_HD_GPIO8    33   HD_GPIO_8   G6   | 1  X |   D5    HD_GPIO_12   22   PMOD_HD_GPIO12  SDV   
#SDI1   PMOD_HD_GPIO9    16   HD_GPIO_9   E6   | X  X |   C7    HD_GPIO_13   30   PMOD_HD_GPIO13  ENC_A 
#SDI2   PMOD_HD_GPIO10   18   HD_GPIO_10  E5   | X  X |   B6    HD_GPIO_14   32   PMOD_HD_GPIO14  ENC_B 
#SDI3   PMOD_HD_GPIO11   20   HD_GPIO_11  D6   | X  X |   C5    HD_GPIO_15   34   PMOD_HD_GPIO15  ENC_I 
#                             GND              | X  X |         GND                                     
#                             VCC3.3           | X  X |         VCC3.3                                  
#                                              +------+                                                 


set_property PACKAGE_PIN G6 [get_ports SCLK]
set_property PACKAGE_PIN E6 [get_ports SDI1]
set_property PACKAGE_PIN E5 [get_ports SDI2]
set_property PACKAGE_PIN D6 [get_ports SDI3]
set_property PACKAGE_PIN D5 [get_ports SDV]
set_property PACKAGE_PIN C7 [get_ports ENC_A]
set_property PACKAGE_PIN B6 [get_ports ENC_B]
set_property PACKAGE_PIN C5 [get_ports ENC_I]

set_property IOSTANDARD LVCMOS18 [get_ports SCLK]
set_property IOSTANDARD LVCMOS18 [get_ports SDI*]
set_property IOSTANDARD LVCMOS18 [get_ports SDV]
set_property IOSTANDARD LVCMOS18 [get_ports ENC_*]


########################################################################################################
# PMOD1 on mezz board (lines up with PMOD JB on Arty)
#
#
#                 MEZZ          MEZZ  Ultra     FPGA          FPGA  Ultra     MEZZ  MEZ                  
#SIG              SCHEM          J3   SCHEM     PIN#  PMOD 1  PIN#  SCHEM       J3  SCHEM         SIG   
#                                                    +------+                                           
#GH[0]            PMOD_HD_GPIO0  3   HD_GPIO_0  D7   | 1  X |   F6  HD_GPIO_4   11  PMOD_HD_GPIO4 GL[0] 
#GH[1]            PMOD_HD_GPIO1  5   HD_GPIO_1  F8   | X  X |   G5  HD_GPIO_5   13  PMOD_HD_GPIO5 GL[1] 
#GH[2]            PMOD_HD_GPIO2  7   HD_GPIO_2  F7   | X  X |   A6  HD_GPIO_6   29  PMOD_HD_GPIO6 GL[2] 
#GPIO_0_tri_io[1] PMOD_HD_GPIO3  9   HD_GPIO_3  G7   | X  X |   A7  HD_GPIO_7   31  PMOD_HD_GPIO7 GPIO_0_tri_io[0]
#                                    GND             | X  X |       GND                                  
#                                    VCC3.3          | X  X |       VCC3.3                                
#                                                    +------+                                              

set_property PACKAGE_PIN D7 [get_ports {GH[0]}]
set_property PACKAGE_PIN F8 [get_ports {GH[1]}]
set_property PACKAGE_PIN F7 [get_ports {GH[2]}]
set_property PACKAGE_PIN G7 [get_ports {GPIO_0_tri_io[1]}];
set_property PACKAGE_PIN F6 [get_ports {GL[0]}]
set_property PACKAGE_PIN G5 [get_ports {GL[1]}]
set_property PACKAGE_PIN A6 [get_ports {GL[2]}]
set_property PACKAGE_PIN A7 [get_ports {GPIO_0_tri_io[0]}];

set_property IOSTANDARD LVCMOS18 [get_ports GPIO_0_tri_io*]
set_property IOSTANDARD LVCMOS18 [get_ports GH*]
set_property IOSTANDARD LVCMOS18 [get_ports GL*]
set_property DRIVE 4 [get_ports GL*]
set_property DRIVE 4 [get_ports GH*]
set_property DRIVE 4 [get_ports SCLK]
set_property SLEW SLOW [get_ports SCLK]
set_property SLEW SLOW [get_ports GL*]
set_property SLEW SLOW [get_ports GH*]

#Ultra96 does not have SW0 so VIO used to control clk mux
#set_property PACKAGE_PIN M20 [get_ports SW0]
#set_property IOSTANDARD LVCMOS18 [get_ports SW*]


#BT_HCI_RTS on FPGA /  emio_uart0_ctsn connect to 
set_property PACKAGE_PIN B7 [get_ports BT_ctsn]
#BT_HCI_CTS on FPGA / emio_uart0_rtsn
set_property PACKAGE_PIN B5 [get_ports BT_rtsn]
set_property IOSTANDARD LVCMOS18 [get_ports BT*]

########################################################################################################

#create_generated_clock -name clk_fpga_0_ss -source [get_pins zsys_i/clk_wiz_0/inst/mmcme4_adv_inst/CLKIN1] -master_clock zsys_i/clk_wiz_0/inst/clk_in1 [get_pins zsys_i/clk_wiz_0/inst/mmcme4_adv_inst/CLKOUT0]
#set_clock_groups -name exclusive_clks -physically_exclusive -group [get_clocks clk_pl_0] -group [get_clocks clk_fpga_0_ss]

set_case_analysis 0 [get_pins ultra96_foc/clk_mux_0/U0/BUFGMUX_inst/S]

#set_case_analysis 0 SW0_IBUF

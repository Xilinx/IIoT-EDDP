#set_property PACKAGE_PIN W15   [get_ports { shield_spi_io0_io }]; #IO_L10N_T1_34 Sch=ck_miso
#set_property PACKAGE_PIN T12   [get_ports { shield_spi_io1_io }]; #IO_L2P_T0_34 Sch=ck_mosi
#set_property PACKAGE_PIN H15   [get_ports { shield_spi_sck_io }]; #IO_L19P_T3_35 Sch=ck_sck
#set_property PACKAGE_PIN P16   [get_ports { shield_iic_scl_io }]; #IO_L24N_T3_34 Sch=ck_scl
#set_property PACKAGE_PIN P15   [get_ports { shield_iic_sda_io }]; #IO_L24P_T3_34 Sch=ck_sda
#set_property PACKAGE_PIN F16   [get_ports { shield_spi_ss_io }]; #IO_L6P_T0_35 Sch=ck_ss


#set_property PACKAGE_PIN W19 [get_ports {gpio_0_tri_io[0]}]; # EXT1
#set_property IOSTANDARD LVCMOS33 [get_ports gpio_0_tri_io[0]]
# J9 <-> PMODA 
set_property PACKAGE_PIN Y18 [get_ports {SCLK}];  # J9:1  SCLK  -> PMODA:1  JA1_P
set_property PACKAGE_PIN Y19 [get_ports {SDI1}];  # J9:2  SDI1  -> PMODA:2  JA1_N
set_property PACKAGE_PIN Y16 [get_ports {SDI2}];  # J9:3  SDI2  -> PMODA:3  JA2_P
set_property PACKAGE_PIN Y17 [get_ports {SDI3}];  # J9:4  SDI3  -> PMODA:4  JA2_N
set_property PACKAGE_PIN U18 [get_ports {SDV}];   # J9:7  SDV   -> PMODA:7  JA3_P
set_property PACKAGE_PIN U19 [get_ports {ENC_A}]; # J9:8  ENC_A -> PMODA:8  JA3_N
set_property PACKAGE_PIN W18 [get_ports {ENC_B}]; # J9:9  ENC_B -> PMODA:9  JA4_P
set_property PACKAGE_PIN W19 [get_ports {ENC_I}]; # J9:10 ENC_I -> PMODA:10 JA4_N
set_property IOSTANDARD LVCMOS33 [get_ports SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports SDI*]
set_property IOSTANDARD LVCMOS33 [get_ports SDV]
set_property IOSTANDARD LVCMOS33 [get_ports ENC_*]
# J8 <-> PMODB
set_property PACKAGE_PIN W14 [get_ports {GH[0]}]; # J8:1  G1H  -> PMODB:1  JB1_P
set_property PACKAGE_PIN Y14 [get_ports {GH[1]}]; # J8:2  G2H  -> PMODB:1  JB1_N
set_property PACKAGE_PIN T11 [get_ports {GH[2]}]; # J8:3  G3H  -> PMODB:1  JB2_P
#set_property PACKAGE_PIN T10 [get_ports {gpio_0_tri_io[1]}]; # J8:4  EXT2 -> PMODB:1  JB2_N
set_property PACKAGE_PIN V16 [get_ports {GL[0]}]; # J8:7  G1L  -> PMODB:1  JB3_P
set_property PACKAGE_PIN W16 [get_ports {GL[1]}]; # J8:8  G2L  -> PMODB:1  JB3_N
set_property PACKAGE_PIN V12 [get_ports {GL[2]}]; # J8:9  G3L  -> PMODB:1  JB4_P
#set_property PACKAGE_PIN W13 [get_ports {gpio_0_tri_io[0]}]; # J8:10 EXT1 -> PMODB:1  JB4_N
#set_property IOSTANDARD LVCMOS33 [get_ports gpio_0_tri_io*]
set_property IOSTANDARD LVCMOS33 [get_ports GH*]
set_property IOSTANDARD LVCMOS33 [get_ports GL*]
set_property DRIVE 4 [get_ports GL*]
set_property DRIVE 4 [get_ports GH*]
set_property DRIVE 4 [get_ports SCLK]
set_property SLEW SLOW [get_ports SCLK]
set_property SLEW SLOW [get_ports GL*]
set_property SLEW SLOW [get_ports GH*]

set_property PACKAGE_PIN R14 [get_ports {led[0]}]
set_property PACKAGE_PIN P14 [get_ports {led[1]}]
set_property PACKAGE_PIN N16 [get_ports {led[2]}]
set_property PACKAGE_PIN M14 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports led*]
set_property PACKAGE_PIN D19 [get_ports BTN0]
set_property PACKAGE_PIN D20 [get_ports BTN1]
set_property PACKAGE_PIN L20 [get_ports BTN2]
set_property PACKAGE_PIN L19 [get_ports BTN3]
set_property IOSTANDARD LVCMOS33 [get_ports BTN*]
set_property PACKAGE_PIN M20 [get_ports SW0]
set_property IOSTANDARD LVCMOS33 [get_ports SW*]


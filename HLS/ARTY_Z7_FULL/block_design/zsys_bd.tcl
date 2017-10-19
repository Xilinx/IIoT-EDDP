TE::UTILS::te_msg TE_BD-0 INFO "This block design tcl-file was generate with Trenz Electronic GmbH Board Part:trenz.biz:arty_z7_10_edps:part0:1.0, FPGA: xc7z010clg400-1 at 2017-09-24T18:36:25."

################################################################
# This is a generated script based on design: zsys
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source zsys_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z010clg400-1
   set_property BOARD_PART trenz.biz:arty_z7_10_edps:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
set design_name zsys

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: FOC
proc create_hier_cell_FOC { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_FOC() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Monitor -vlnv xilinx.com:interface:axis_rtl:1.0 SLOT_0_AXIS
  create_bd_intf_pin -mode Monitor -vlnv xilinx.com:interface:axis_rtl:1.0 SLOT_0_AXIS1
  create_bd_intf_pin -mode Monitor -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_V
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_V
  create_bd_intf_pin -mode Monitor -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_V1
  create_bd_intf_pin -mode Monitor -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_V2

  # Create pins
  create_bd_pin -dir I -from 31 -to 0 Flux_Ki
  create_bd_pin -dir I -from 31 -to 0 Flux_Kp
  create_bd_pin -dir I -from 31 -to 0 Flux_Sp
  create_bd_pin -dir O -from 31 -to 0 -type data Id_out
  create_bd_pin -dir O -from 31 -to 0 -type data Iq_out
  create_bd_pin -dir O -from 31 -to 0 RPM
  create_bd_pin -dir I -from 31 -to 0 RPM_Ki
  create_bd_pin -dir I -from 31 -to 0 RPM_Kp
  create_bd_pin -dir I -from 31 -to 0 RPM_Sp
  create_bd_pin -dir I -from 31 -to 0 Torque_Ki
  create_bd_pin -dir I -from 31 -to 0 Torque_Kp
  create_bd_pin -dir I -from 31 -to 0 Torque_Sp
  create_bd_pin -dir I -from 31 -to 0 Vd
  create_bd_pin -dir I -from 31 -to 0 Vq
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -type rst ap_rst_n
  create_bd_pin -dir I -from 31 -to 0 -type data control

  # Create instance: Clarke_Direct_0, and set properties
  set Clarke_Direct_0 [ create_bd_cell -type ip -vlnv trenz.biz:hls:Clarke_Direct:1.0 Clarke_Direct_0 ]

  # Create instance: Clarke_Inverse_0, and set properties
  set Clarke_Inverse_0 [ create_bd_cell -type ip -vlnv trenz.biz:hls:Clarke_Inverse:1.0 Clarke_Inverse_0 ]

  # Create instance: Filters_0, and set properties
  set Filters_0 [ create_bd_cell -type ip -vlnv trenz.biz:hls:Filters:1.0 Filters_0 ]

  # Create instance: Flux_Ki_slice, and set properties
  set Flux_Ki_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 Flux_Ki_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $Flux_Ki_slice

  # Create instance: Flux_Kp_slice, and set properties
  set Flux_Kp_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 Flux_Kp_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $Flux_Kp_slice

  # Create instance: Flux_PI_Control, and set properties
  set Flux_PI_Control [ create_bd_cell -type ip -vlnv trenz.biz:hls:PI_Control:1.0 Flux_PI_Control ]

  # Create instance: Flux_Sp_slice, and set properties
  set Flux_Sp_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 Flux_Sp_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $Flux_Sp_slice

  # Create instance: Park_Direct_0, and set properties
  set Park_Direct_0 [ create_bd_cell -type ip -vlnv trenz.biz:hls:Park_Direct:1.0 Park_Direct_0 ]

  # Create instance: Park_Inverse_0, and set properties
  set Park_Inverse_0 [ create_bd_cell -type ip -vlnv trenz.biz:hls:Park_Inverse:1.0 Park_Inverse_0 ]

  # Create instance: RPM_Ki_slice, and set properties
  set RPM_Ki_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 RPM_Ki_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $RPM_Ki_slice

  # Create instance: RPM_Kp_slice, and set properties
  set RPM_Kp_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 RPM_Kp_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $RPM_Kp_slice

  # Create instance: RPM_PI_Control, and set properties
  set RPM_PI_Control [ create_bd_cell -type ip -vlnv trenz.biz:hls:PI_Control:1.0 RPM_PI_Control ]

  # Create instance: RPM_Sp_slice, and set properties
  set RPM_Sp_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 RPM_Sp_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $RPM_Sp_slice

  # Create instance: SVPWM_0, and set properties
  set SVPWM_0 [ create_bd_cell -type ip -vlnv trenz.biz:hls:SVPWM:1.0 SVPWM_0 ]

  # Create instance: Torque_Ki_slice, and set properties
  set Torque_Ki_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 Torque_Ki_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $Torque_Ki_slice

  # Create instance: Torque_Kp_slice, and set properties
  set Torque_Kp_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 Torque_Kp_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $Torque_Kp_slice

  # Create instance: Torque_PI_Control, and set properties
  set Torque_PI_Control [ create_bd_cell -type ip -vlnv trenz.biz:hls:PI_Control:1.0 Torque_PI_Control ]

  # Create instance: Torque_Sp_slice, and set properties
  set Torque_Sp_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 Torque_Sp_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $Torque_Sp_slice

  # Create instance: axis_broadcaster_0, and set properties
  set axis_broadcaster_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_0 ]
  set_property -dict [ list \
CONFIG.M00_TDATA_REMAP {tdata[15:0]} \
CONFIG.M01_TDATA_REMAP {tdata[31:16]} \
CONFIG.M02_TDATA_REMAP {tdata[47:32]} \
CONFIG.M03_TDATA_REMAP {tdata[63:48]} \
CONFIG.M_TDATA_NUM_BYTES {2} \
CONFIG.NUM_MI {4} \
CONFIG.S_TDATA_NUM_BYTES {8} \
 ] $axis_broadcaster_0

  # Create instance: flux_limit, and set properties
  set flux_limit [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 flux_limit ]
  set_property -dict [ list \
CONFIG.CONST_VAL {16777215} \
CONFIG.CONST_WIDTH {32} \
 ] $flux_limit

  # Create instance: foc_control_0, and set properties
  set foc_control_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:foc_control:1.0 foc_control_0 ]

  # Create instance: mode_concat_0, and set properties
  set mode_concat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 mode_concat_0 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {3} \
CONFIG.IN1_WIDTH {29} \
 ] $mode_concat_0

  # Create instance: mode_slice, and set properties
  set mode_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 mode_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {2} \
CONFIG.DOUT_WIDTH {3} \
 ] $mode_slice

  # Create instance: one, and set properties
  set one [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 one ]

  # Create instance: rpm_limit, and set properties
  set rpm_limit [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 rpm_limit ]
  set_property -dict [ list \
CONFIG.CONST_VAL {16777215} \
CONFIG.CONST_WIDTH {32} \
 ] $rpm_limit

  # Create instance: torque_limit, and set properties
  set torque_limit [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 torque_limit ]
  set_property -dict [ list \
CONFIG.CONST_VAL {16777215} \
CONFIG.CONST_WIDTH {32} \
 ] $torque_limit

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {29} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net Clarke_Direct_0_m_axis_V [get_bd_intf_pins Clarke_Direct_0/m_axis_V] [get_bd_intf_pins Park_Direct_0/s_axis_V]
  connect_bd_intf_net -intf_net [get_bd_intf_nets Clarke_Direct_0_m_axis_V] [get_bd_intf_pins s_axis_V1] [get_bd_intf_pins Clarke_Direct_0/m_axis_V]
  connect_bd_intf_net -intf_net Clarke_Inverse_0_m_axis_V [get_bd_intf_pins Clarke_Inverse_0/m_axis_V] [get_bd_intf_pins SVPWM_0/s_axis_V]
  connect_bd_intf_net -intf_net [get_bd_intf_nets Clarke_Inverse_0_m_axis_V] [get_bd_intf_pins SLOT_0_AXIS1] [get_bd_intf_pins Clarke_Inverse_0/m_axis_V]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins s_axis_V] [get_bd_intf_pins Filters_0/s_axis_V]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins m_axis_V] [get_bd_intf_pins SVPWM_0/m_axis_V]
  connect_bd_intf_net -intf_net Filters_0_m_axis_V [get_bd_intf_pins Clarke_Direct_0/s_axis_V] [get_bd_intf_pins Filters_0/m_axis_V]
  connect_bd_intf_net -intf_net Flux_PI_Control_m_axis_V [get_bd_intf_pins Flux_PI_Control/m_axis_V] [get_bd_intf_pins foc_control_0/s_flux]
  connect_bd_intf_net -intf_net Park_Direct_0_m_axis_V [get_bd_intf_pins Park_Direct_0/m_axis_V] [get_bd_intf_pins axis_broadcaster_0/S_AXIS]
  connect_bd_intf_net -intf_net [get_bd_intf_nets Park_Direct_0_m_axis_V] [get_bd_intf_pins SLOT_0_AXIS] [get_bd_intf_pins axis_broadcaster_0/S_AXIS]
  connect_bd_intf_net -intf_net Park_Inverse_0_m_axis_V [get_bd_intf_pins Clarke_Inverse_0/s_axis_V] [get_bd_intf_pins Park_Inverse_0/m_axis_V]
  connect_bd_intf_net -intf_net [get_bd_intf_nets Park_Inverse_0_m_axis_V] [get_bd_intf_pins s_axis_V2] [get_bd_intf_pins Park_Inverse_0/m_axis_V]
  connect_bd_intf_net -intf_net RPM_PI_Control_m_axis_V [get_bd_intf_pins RPM_PI_Control/m_axis_V] [get_bd_intf_pins foc_control_0/s_rpm]
  connect_bd_intf_net -intf_net Torque_PI_Control_m_axis_V [get_bd_intf_pins Torque_PI_Control/m_axis_V] [get_bd_intf_pins foc_control_0/s_torque]
  connect_bd_intf_net -intf_net axis_broadcaster_0_M00_AXIS [get_bd_intf_pins Flux_PI_Control/s_axis_V] [get_bd_intf_pins axis_broadcaster_0/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_0_M01_AXIS [get_bd_intf_pins Torque_PI_Control/s_axis_V] [get_bd_intf_pins axis_broadcaster_0/M01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_0_M02_AXIS [get_bd_intf_pins RPM_PI_Control/s_axis_V] [get_bd_intf_pins axis_broadcaster_0/M02_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_0_M03_AXIS [get_bd_intf_pins axis_broadcaster_0/M03_AXIS] [get_bd_intf_pins foc_control_0/s_angle]
  connect_bd_intf_net -intf_net foc_control_0_m_axis [get_bd_intf_pins Park_Inverse_0/s_axis_V] [get_bd_intf_pins foc_control_0/m_axis]
  connect_bd_intf_net -intf_net [get_bd_intf_nets foc_control_0_m_axis] [get_bd_intf_pins m_axis] [get_bd_intf_pins foc_control_0/m_axis]

  # Create port connections
  connect_bd_net -net Din1_1 [get_bd_pins RPM_Kp] [get_bd_pins RPM_Kp_slice/Din]
  connect_bd_net -net Din2_1 [get_bd_pins RPM_Ki] [get_bd_pins RPM_Ki_slice/Din]
  connect_bd_net -net Din3_1 [get_bd_pins Flux_Sp] [get_bd_pins Flux_Sp_slice/Din]
  connect_bd_net -net Din4_1 [get_bd_pins Flux_Kp] [get_bd_pins Flux_Kp_slice/Din]
  connect_bd_net -net Din5_1 [get_bd_pins Flux_Ki] [get_bd_pins Flux_Ki_slice/Din]
  connect_bd_net -net Din6_1 [get_bd_pins Torque_Kp] [get_bd_pins Torque_Kp_slice/Din]
  connect_bd_net -net Din7_1 [get_bd_pins Torque_Ki] [get_bd_pins Torque_Ki_slice/Din]
  connect_bd_net -net Din_1 [get_bd_pins RPM_Sp] [get_bd_pins RPM_Sp_slice/Din]
  connect_bd_net -net Filters_0_RPM_out [get_bd_pins RPM] [get_bd_pins Filters_0/RPM_out]
  connect_bd_net -net Flux_Ki_slice_Dout [get_bd_pins Flux_Ki_slice/Dout] [get_bd_pins Flux_PI_Control/Ki]
  connect_bd_net -net Flux_Kp_slice_Dout [get_bd_pins Flux_Kp_slice/Dout] [get_bd_pins Flux_PI_Control/Kp]
  connect_bd_net -net Flux_Sp_slice_Dout [get_bd_pins Flux_PI_Control/Sp] [get_bd_pins Flux_Sp_slice/Dout]
  connect_bd_net -net Park_Direct_0_Id_out [get_bd_pins Id_out] [get_bd_pins Park_Direct_0/Id_out]
  connect_bd_net -net Park_Direct_0_Iq_out [get_bd_pins Iq_out] [get_bd_pins Park_Direct_0/Iq_out]
  connect_bd_net -net RPM_Ki_slice_Dout [get_bd_pins RPM_Ki_slice/Dout] [get_bd_pins RPM_PI_Control/Ki]
  connect_bd_net -net RPM_Kp_slice_Dout [get_bd_pins RPM_Kp_slice/Dout] [get_bd_pins RPM_PI_Control/Kp]
  connect_bd_net -net RPM_Sp_slice_Dout [get_bd_pins RPM_PI_Control/Sp] [get_bd_pins RPM_Sp_slice/Dout]
  connect_bd_net -net Torque_Ki_slice_Dout [get_bd_pins Torque_Ki_slice/Dout] [get_bd_pins Torque_PI_Control/Ki]
  connect_bd_net -net Torque_Kp_slice_Dout [get_bd_pins Torque_Kp_slice/Dout] [get_bd_pins Torque_PI_Control/Kp]
  connect_bd_net -net Torque_Sp_1 [get_bd_pins Torque_Sp] [get_bd_pins Torque_Sp_slice/Din]
  connect_bd_net -net Torque_Sp_slice_Dout [get_bd_pins Torque_Sp_slice/Dout] [get_bd_pins foc_control_0/torque_sp_in]
  connect_bd_net -net Vd_1 [get_bd_pins Vd] [get_bd_pins foc_control_0/vd_in]
  connect_bd_net -net Vq_1 [get_bd_pins Vq] [get_bd_pins foc_control_0/vq_in]
  connect_bd_net -net ap_clk_1 [get_bd_pins ap_clk] [get_bd_pins Clarke_Direct_0/ap_clk] [get_bd_pins Clarke_Inverse_0/ap_clk] [get_bd_pins Filters_0/ap_clk] [get_bd_pins Flux_PI_Control/ap_clk] [get_bd_pins Park_Direct_0/ap_clk] [get_bd_pins Park_Inverse_0/ap_clk] [get_bd_pins RPM_PI_Control/ap_clk] [get_bd_pins SVPWM_0/ap_clk] [get_bd_pins Torque_PI_Control/ap_clk] [get_bd_pins axis_broadcaster_0/aclk] [get_bd_pins foc_control_0/axis_aclk]
  connect_bd_net -net ap_rst_n_1 [get_bd_pins ap_rst_n] [get_bd_pins Clarke_Direct_0/ap_rst_n] [get_bd_pins Clarke_Inverse_0/ap_rst_n] [get_bd_pins Filters_0/ap_rst_n] [get_bd_pins Flux_PI_Control/ap_rst_n] [get_bd_pins Park_Direct_0/ap_rst_n] [get_bd_pins Park_Inverse_0/ap_rst_n] [get_bd_pins RPM_PI_Control/ap_rst_n] [get_bd_pins SVPWM_0/ap_rst_n] [get_bd_pins Torque_PI_Control/ap_rst_n] [get_bd_pins axis_broadcaster_0/aresetn] [get_bd_pins foc_control_0/axis_aresetn]
  connect_bd_net -net control_1 [get_bd_pins control] [get_bd_pins foc_control_0/control_in] [get_bd_pins mode_slice/Din]
  connect_bd_net -net flux_limit_dout [get_bd_pins Flux_PI_Control/limit] [get_bd_pins flux_limit/dout]
  connect_bd_net -net foc_control_0_torque_sp_out [get_bd_pins Torque_PI_Control/Sp] [get_bd_pins foc_control_0/torque_sp_out]
  connect_bd_net -net mode_concat_0_dout [get_bd_pins Filters_0/control] [get_bd_pins Flux_PI_Control/mode] [get_bd_pins RPM_PI_Control/mode] [get_bd_pins Torque_PI_Control/mode] [get_bd_pins mode_concat_0/dout]
  connect_bd_net -net one_dout [get_bd_pins Clarke_Direct_0/ap_start] [get_bd_pins Clarke_Inverse_0/ap_start] [get_bd_pins Filters_0/ap_start] [get_bd_pins Flux_PI_Control/ap_start] [get_bd_pins Park_Direct_0/ap_start] [get_bd_pins Park_Inverse_0/ap_start] [get_bd_pins RPM_PI_Control/ap_start] [get_bd_pins SVPWM_0/ap_start] [get_bd_pins Torque_PI_Control/ap_start] [get_bd_pins one/dout]
  connect_bd_net -net rpm_limit_dout [get_bd_pins RPM_PI_Control/limit] [get_bd_pins rpm_limit/dout]
  connect_bd_net -net torque_limit_dout [get_bd_pins Torque_PI_Control/limit] [get_bd_pins torque_limit/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins mode_concat_0/In1] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins mode_concat_0/In0] [get_bd_pins mode_slice/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports
  set BTN0 [ create_bd_port -dir I BTN0 ]
  set BTN1 [ create_bd_port -dir I BTN1 ]
  set BTN2 [ create_bd_port -dir I BTN2 ]
  set BTN3 [ create_bd_port -dir I BTN3 ]
  set ENC_A [ create_bd_port -dir I ENC_A ]
  set ENC_B [ create_bd_port -dir I ENC_B ]
  set ENC_I [ create_bd_port -dir I ENC_I ]
  set GH [ create_bd_port -dir O -from 2 -to 0 GH ]
  set GL [ create_bd_port -dir O -from 2 -to 0 GL ]
  set SCLK [ create_bd_port -dir O SCLK ]
  set SDI1 [ create_bd_port -dir I SDI1 ]
  set SDI2 [ create_bd_port -dir I SDI2 ]
  set SDI3 [ create_bd_port -dir I SDI3 ]
  set SDV [ create_bd_port -dir I SDV ]
  set SW0 [ create_bd_port -dir I SW0 ]
  set led [ create_bd_port -dir O -from 3 -to 0 led ]

  # Create instance: AXI_StreamCapture_0, and set properties
  set AXI_StreamCapture_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:AXI_StreamCapture:1.0 AXI_StreamCapture_0 ]

  # Create instance: Angle_RPM_Ib_Ia, and set properties
  set Angle_RPM_Ib_Ia [ create_bd_cell -type ip -vlnv trenz.biz:user:axis_concat:1.0 Angle_RPM_Ib_Ia ]
  set_property -dict [ list \
CONFIG.C_A_TDATA_WIDTH {32} \
CONFIG.C_IN_CHANNELS {3} \
CONFIG.M_TDATA_WIDTH {64} \
 ] $Angle_RPM_Ib_Ia

  # Create instance: Angle_Shift_slice, and set properties
  set Angle_Shift_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 Angle_Shift_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $Angle_Shift_slice

  # Create instance: Angle_concat, and set properties
  set Angle_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 Angle_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $Angle_concat

  # Create instance: FOC
  create_hier_cell_FOC [current_bd_instance .] FOC

  # Create instance: Ib_Ia, and set properties
  set Ib_Ia [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 Ib_Ia ]
  set_property -dict [ list \
CONFIG.M_TDATA_NUM_BYTES {4} \
CONFIG.S_TDATA_NUM_BYTES {8} \
CONFIG.TDATA_REMAP {tdata[31:0]} \
 ] $Ib_Ia

  # Create instance: axi_datamover_0, and set properties
  set axi_datamover_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_datamover:5.1 axi_datamover_0 ]
  set_property -dict [ list \
CONFIG.c_enable_mm2s {0} \
CONFIG.c_include_mm2s {Omit} \
CONFIG.c_include_mm2s_stsfifo {false} \
CONFIG.c_m_axi_s2mm_id_width {0} \
CONFIG.c_mm2s_include_sf {false} \
CONFIG.c_s2mm_btt_used {23} \
CONFIG.c_s2mm_burst_size {8} \
CONFIG.c_s2mm_include_sf {false} \
CONFIG.c_s2mm_support_indet_btt {true} \
 ] $axi_datamover_0

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_interconnect_0

  # Create instance: axi_reg32_0, and set properties
  set axi_reg32_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:axi_reg32:1.0 axi_reg32_0 ]
  set_property -dict [ list \
CONFIG.C_NUM_RO_REG {5} \
CONFIG.C_NUM_WR_REG {16} \
CONFIG.C_WR0_ALIAS {Control} \
CONFIG.C_WR10_ALIAS {Angle Shift} \
CONFIG.C_WR10_DEFAULT {719} \
CONFIG.C_WR11_ALIAS {Vd} \
CONFIG.C_WR11_DEFAULT {-7424} \
CONFIG.C_WR12_ALIAS {Vq} \
CONFIG.C_WR12_DEFAULT {15000} \
CONFIG.C_WR13_ALIAS {Decimation} \
CONFIG.C_WR14_ALIAS {TR_Control} \
CONFIG.C_WR1_ALIAS {Flux Sp} \
CONFIG.C_WR2_ALIAS {Flux Kp} \
CONFIG.C_WR2_DEFAULT {-45056} \
CONFIG.C_WR3_ALIAS {Flux Ki} \
CONFIG.C_WR4_ALIAS {Torque Sp} \
CONFIG.C_WR4_DEFAULT {100} \
CONFIG.C_WR5_ALIAS {Torque Kp} \
CONFIG.C_WR5_DEFAULT {256} \
CONFIG.C_WR6_ALIAS {Torque Ki} \
CONFIG.C_WR7_ALIAS {RPM Sp} \
CONFIG.C_WR7_DEFAULT {3000} \
CONFIG.C_WR8_ALIAS {RPM Kp} \
CONFIG.C_WR8_DEFAULT {744} \
CONFIG.C_WR9_ALIAS {RPM Ki} \
CONFIG.C_WR9_DEFAULT {9} \
 ] $axi_reg32_0

  # Create instance: axis_AD7403_0, and set properties
  set axis_AD7403_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:axis_AD7403:1.0 axis_AD7403_0 ]
  set_property -dict [ list \
CONFIG.C_CLOCK_RATIO {5} \
CONFIG.C_DECIMATION {128} \
CONFIG.C_SIGNED {true} \
 ] $axis_AD7403_0

  # Create instance: axis_broadcaster_0, and set properties
  set axis_broadcaster_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_0 ]
  set_property -dict [ list \
CONFIG.M00_TDATA_REMAP {tdata[63:0]} \
CONFIG.M01_TDATA_REMAP {tdata[63:0]} \
CONFIG.M_TDATA_NUM_BYTES {8} \
CONFIG.S_TDATA_NUM_BYTES {8} \
 ] $axis_broadcaster_0

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_0 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {4096} \
 ] $axis_data_fifo_0

  # Create instance: axis_data_fifo_1, and set properties
  set axis_data_fifo_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_1 ]
  set_property -dict [ list \
CONFIG.IS_ACLK_ASYNC {1} \
 ] $axis_data_fifo_1

  # Create instance: axis_decimate_0, and set properties
  set axis_decimate_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:axis_decimate:1.0 axis_decimate_0 ]
  set_property -dict [ list \
CONFIG.C_TDATA_WIDTH {64} \
 ] $axis_decimate_0

  # Create instance: axis_encoder_0, and set properties
  set axis_encoder_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:axis_encoder:1.0 axis_encoder_0 ]
  set_property -dict [ list \
CONFIG.C_ANGLE_AXIS {true} \
CONFIG.C_CPR {1000} \
CONFIG.C_RPM_AXIS {true} \
CONFIG.C_USE_SHIFT {true} \
 ] $axis_encoder_0

  # Create instance: axis_monitor_0, and set properties
  set axis_monitor_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:axis_monitor:1.0 axis_monitor_0 ]
  set_property -dict [ list \
CONFIG.C_SLAVE_IF {7} \
 ] $axis_monitor_0

  # Create instance: axis_pwm_0, and set properties
  set axis_pwm_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:axis_pwm:1.0 axis_pwm_0 ]
  set_property -dict [ list \
CONFIG.C_CHANNELS {3} \
CONFIG.C_DEADTIME_SYCLES {50} \
CONFIG.C_IN_TYPE {1} \
CONFIG.C_S_AXIS_TDATA_WIDTH {64} \
 ] $axis_pwm_0

  # Create instance: clk_mux_0, and set properties
  set clk_mux_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:clk_mux:1.0 clk_mux_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.4 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {236.910} \
CONFIG.CLKOUT1_PHASE_ERROR {732.678} \
CONFIG.CLKOUT1_REQUESTED_DUTY_CYCLE {50.0} \
CONFIG.MMCM_BANDWIDTH {LOW} \
CONFIG.MMCM_CLKFBOUT_MULT_F {21.000} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {7.000} \
CONFIG.MMCM_DIVCLK_DIVIDE {3} \
CONFIG.USE_LOCKED {false} \
CONFIG.USE_RESET {false} \
CONFIG.USE_SPREAD_SPECTRUM {true} \
 ] $clk_wiz_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: proc_sys_reset_1, and set properties
  set proc_sys_reset_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_1 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {650.000000} \
CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.096154} \
CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {20.000000} \
CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {50.000000} \
CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {108.333336} \
CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {108.333336} \
CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {108.333336} \
CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {108.333336} \
CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {108.333336} \
CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {108.333336} \
CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {108.333336} \
CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {650} \
CONFIG.PCW_ARMPLL_CTRL_FBDIV {26} \
CONFIG.PCW_CLK0_FREQ {100000000} \
CONFIG.PCW_CLK1_FREQ {20000000} \
CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1300.000} \
CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {52} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {2} \
CONFIG.PCW_DDRPLL_CTRL_FBDIV {21} \
CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1050.000} \
CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_ENET0_RESET_ENABLE {1} \
CONFIG.PCW_ENET0_RESET_IO {MIO 9} \
CONFIG.PCW_ENET_RESET_ENABLE {1} \
CONFIG.PCW_ENET_RESET_SELECT {Share reset pin} \
CONFIG.PCW_EN_CLK1_PORT {1} \
CONFIG.PCW_EN_EMIO_GPIO {1} \
CONFIG.PCW_EN_ENET0 {1} \
CONFIG.PCW_EN_GPIO {1} \
CONFIG.PCW_EN_QSPI {1} \
CONFIG.PCW_EN_SDIO0 {1} \
CONFIG.PCW_EN_UART0 {1} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {2} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {10} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {5} \
CONFIG.PCW_FCLK_CLK1_BUF {TRUE} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {20} \
CONFIG.PCW_FPGA_FCLK1_ENABLE {1} \
CONFIG.PCW_FTM_CTI_IN0 {<Select>} \
CONFIG.PCW_FTM_CTI_IN1 {<Select>} \
CONFIG.PCW_FTM_CTI_IN2 {<Select>} \
CONFIG.PCW_FTM_CTI_IN3 {<Select>} \
CONFIG.PCW_FTM_CTI_OUT0 {<Select>} \
CONFIG.PCW_FTM_CTI_OUT1 {<Select>} \
CONFIG.PCW_FTM_CTI_OUT2 {<Select>} \
CONFIG.PCW_FTM_CTI_OUT3 {<Select>} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_EMIO_GPIO_IO {2} \
CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {2} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
CONFIG.PCW_I2C_RESET_ENABLE {1} \
CONFIG.PCW_IOPLL_CTRL_FBDIV {20} \
CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
CONFIG.PCW_MIO_0_DIRECTION {inout} \
CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_0_PULLUP {enabled} \
CONFIG.PCW_MIO_0_SLEW {slow} \
CONFIG.PCW_MIO_10_DIRECTION {inout} \
CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_10_PULLUP {enabled} \
CONFIG.PCW_MIO_10_SLEW {slow} \
CONFIG.PCW_MIO_11_DIRECTION {inout} \
CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_11_PULLUP {enabled} \
CONFIG.PCW_MIO_11_SLEW {slow} \
CONFIG.PCW_MIO_12_DIRECTION {inout} \
CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_12_PULLUP {enabled} \
CONFIG.PCW_MIO_12_SLEW {slow} \
CONFIG.PCW_MIO_13_DIRECTION {inout} \
CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_13_PULLUP {enabled} \
CONFIG.PCW_MIO_13_SLEW {slow} \
CONFIG.PCW_MIO_14_DIRECTION {in} \
CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_14_PULLUP {enabled} \
CONFIG.PCW_MIO_14_SLEW {slow} \
CONFIG.PCW_MIO_15_DIRECTION {out} \
CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_15_PULLUP {enabled} \
CONFIG.PCW_MIO_15_SLEW {slow} \
CONFIG.PCW_MIO_16_DIRECTION {out} \
CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_16_PULLUP {enabled} \
CONFIG.PCW_MIO_16_SLEW {slow} \
CONFIG.PCW_MIO_17_DIRECTION {out} \
CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_17_PULLUP {enabled} \
CONFIG.PCW_MIO_17_SLEW {slow} \
CONFIG.PCW_MIO_18_DIRECTION {out} \
CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_18_PULLUP {enabled} \
CONFIG.PCW_MIO_18_SLEW {slow} \
CONFIG.PCW_MIO_19_DIRECTION {out} \
CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_19_PULLUP {enabled} \
CONFIG.PCW_MIO_19_SLEW {slow} \
CONFIG.PCW_MIO_1_DIRECTION {out} \
CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_1_PULLUP {enabled} \
CONFIG.PCW_MIO_1_SLEW {slow} \
CONFIG.PCW_MIO_20_DIRECTION {out} \
CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_20_PULLUP {enabled} \
CONFIG.PCW_MIO_20_SLEW {slow} \
CONFIG.PCW_MIO_21_DIRECTION {out} \
CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_21_PULLUP {enabled} \
CONFIG.PCW_MIO_21_SLEW {slow} \
CONFIG.PCW_MIO_22_DIRECTION {in} \
CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_22_PULLUP {enabled} \
CONFIG.PCW_MIO_22_SLEW {slow} \
CONFIG.PCW_MIO_23_DIRECTION {in} \
CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_23_PULLUP {enabled} \
CONFIG.PCW_MIO_23_SLEW {slow} \
CONFIG.PCW_MIO_24_DIRECTION {in} \
CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_24_PULLUP {enabled} \
CONFIG.PCW_MIO_24_SLEW {slow} \
CONFIG.PCW_MIO_25_DIRECTION {in} \
CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_25_PULLUP {enabled} \
CONFIG.PCW_MIO_25_SLEW {slow} \
CONFIG.PCW_MIO_26_DIRECTION {in} \
CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_26_PULLUP {enabled} \
CONFIG.PCW_MIO_26_SLEW {slow} \
CONFIG.PCW_MIO_27_DIRECTION {in} \
CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_27_PULLUP {enabled} \
CONFIG.PCW_MIO_27_SLEW {slow} \
CONFIG.PCW_MIO_28_DIRECTION {inout} \
CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_28_PULLUP {enabled} \
CONFIG.PCW_MIO_28_SLEW {slow} \
CONFIG.PCW_MIO_29_DIRECTION {inout} \
CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_29_PULLUP {enabled} \
CONFIG.PCW_MIO_29_SLEW {slow} \
CONFIG.PCW_MIO_2_DIRECTION {inout} \
CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_2_PULLUP {disabled} \
CONFIG.PCW_MIO_2_SLEW {slow} \
CONFIG.PCW_MIO_30_DIRECTION {inout} \
CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_30_PULLUP {enabled} \
CONFIG.PCW_MIO_30_SLEW {slow} \
CONFIG.PCW_MIO_31_DIRECTION {inout} \
CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_31_PULLUP {enabled} \
CONFIG.PCW_MIO_31_SLEW {slow} \
CONFIG.PCW_MIO_32_DIRECTION {inout} \
CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_32_PULLUP {enabled} \
CONFIG.PCW_MIO_32_SLEW {slow} \
CONFIG.PCW_MIO_33_DIRECTION {inout} \
CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_33_PULLUP {enabled} \
CONFIG.PCW_MIO_33_SLEW {slow} \
CONFIG.PCW_MIO_34_DIRECTION {inout} \
CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_34_PULLUP {enabled} \
CONFIG.PCW_MIO_34_SLEW {slow} \
CONFIG.PCW_MIO_35_DIRECTION {inout} \
CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_35_PULLUP {enabled} \
CONFIG.PCW_MIO_35_SLEW {slow} \
CONFIG.PCW_MIO_36_DIRECTION {inout} \
CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_36_PULLUP {enabled} \
CONFIG.PCW_MIO_36_SLEW {slow} \
CONFIG.PCW_MIO_37_DIRECTION {inout} \
CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_37_PULLUP {enabled} \
CONFIG.PCW_MIO_37_SLEW {slow} \
CONFIG.PCW_MIO_38_DIRECTION {inout} \
CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_38_PULLUP {enabled} \
CONFIG.PCW_MIO_38_SLEW {slow} \
CONFIG.PCW_MIO_39_DIRECTION {inout} \
CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_39_PULLUP {enabled} \
CONFIG.PCW_MIO_39_SLEW {slow} \
CONFIG.PCW_MIO_3_DIRECTION {inout} \
CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_3_PULLUP {disabled} \
CONFIG.PCW_MIO_3_SLEW {slow} \
CONFIG.PCW_MIO_40_DIRECTION {inout} \
CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_40_PULLUP {enabled} \
CONFIG.PCW_MIO_40_SLEW {slow} \
CONFIG.PCW_MIO_41_DIRECTION {inout} \
CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_41_PULLUP {enabled} \
CONFIG.PCW_MIO_41_SLEW {slow} \
CONFIG.PCW_MIO_42_DIRECTION {inout} \
CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_42_PULLUP {enabled} \
CONFIG.PCW_MIO_42_SLEW {slow} \
CONFIG.PCW_MIO_43_DIRECTION {inout} \
CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_43_PULLUP {enabled} \
CONFIG.PCW_MIO_43_SLEW {slow} \
CONFIG.PCW_MIO_44_DIRECTION {inout} \
CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_44_PULLUP {enabled} \
CONFIG.PCW_MIO_44_SLEW {slow} \
CONFIG.PCW_MIO_45_DIRECTION {inout} \
CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_45_PULLUP {enabled} \
CONFIG.PCW_MIO_45_SLEW {slow} \
CONFIG.PCW_MIO_46_DIRECTION {inout} \
CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_46_PULLUP {enabled} \
CONFIG.PCW_MIO_46_SLEW {slow} \
CONFIG.PCW_MIO_47_DIRECTION {in} \
CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_47_PULLUP {enabled} \
CONFIG.PCW_MIO_47_SLEW {slow} \
CONFIG.PCW_MIO_48_DIRECTION {out} \
CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_48_PULLUP {enabled} \
CONFIG.PCW_MIO_48_SLEW {slow} \
CONFIG.PCW_MIO_49_DIRECTION {in} \
CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_49_PULLUP {enabled} \
CONFIG.PCW_MIO_49_SLEW {slow} \
CONFIG.PCW_MIO_4_DIRECTION {inout} \
CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_4_PULLUP {disabled} \
CONFIG.PCW_MIO_4_SLEW {slow} \
CONFIG.PCW_MIO_50_DIRECTION {inout} \
CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_50_PULLUP {enabled} \
CONFIG.PCW_MIO_50_SLEW {slow} \
CONFIG.PCW_MIO_51_DIRECTION {inout} \
CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_51_PULLUP {enabled} \
CONFIG.PCW_MIO_51_SLEW {slow} \
CONFIG.PCW_MIO_52_DIRECTION {out} \
CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_52_PULLUP {enabled} \
CONFIG.PCW_MIO_52_SLEW {slow} \
CONFIG.PCW_MIO_53_DIRECTION {inout} \
CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_53_PULLUP {enabled} \
CONFIG.PCW_MIO_53_SLEW {slow} \
CONFIG.PCW_MIO_5_DIRECTION {inout} \
CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_5_PULLUP {disabled} \
CONFIG.PCW_MIO_5_SLEW {slow} \
CONFIG.PCW_MIO_6_DIRECTION {out} \
CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_6_PULLUP {disabled} \
CONFIG.PCW_MIO_6_SLEW {slow} \
CONFIG.PCW_MIO_7_DIRECTION {out} \
CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_7_PULLUP {disabled} \
CONFIG.PCW_MIO_7_SLEW {slow} \
CONFIG.PCW_MIO_8_DIRECTION {out} \
CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_8_PULLUP {disabled} \
CONFIG.PCW_MIO_8_SLEW {slow} \
CONFIG.PCW_MIO_9_DIRECTION {out} \
CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_9_PULLUP {enabled} \
CONFIG.PCW_MIO_9_SLEW {slow} \
CONFIG.PCW_MIO_TREE_PERIPHERALS {GPIO#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#GPIO#Quad SPI Flash#ENET Reset#GPIO#GPIO#GPIO#GPIO#UART 0#UART 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#GPIO#SD 0#UART 1#UART 1#GPIO#GPIO#Enet 0#Enet 0} \
CONFIG.PCW_MIO_TREE_SIGNALS {gpio[0]#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]#qspi0_sclk#gpio[7]#qspi_fbclk#reset#gpio[10]#gpio[11]#gpio[12]#gpio[13]#rx#tx#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#gpio[28]#gpio[29]#gpio[30]#gpio[31]#gpio[32]#gpio[33]#gpio[34]#gpio[35]#gpio[36]#gpio[37]#gpio[38]#gpio[39]#clk#cmd#data[0]#data[1]#data[2]#data[3]#gpio[46]#cd#tx#rx#gpio[50]#gpio[51]#mdc#mdio} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {0.223} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {0.212} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {0.085} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {0.092} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {0.040} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {0.058} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_2 {-0.009} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {-0.033} \
CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_PERIPHERAL_BOARD_PRESET {part0} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_FBCLK_IO {MIO 8} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {20} \
CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART0_UART0_IO {MIO 14 .. 15} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {10} \
CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {525.000000} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.223} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.212} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.085} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.092} \
CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM {25.8} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH {80.4535} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM {25.8} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH {80.4535} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH {80.4535} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH {80.4535} \
CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM {15.6} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH {105.056} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM {18.8} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH {66.904} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH {89.1715} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH {113.63} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.040} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.058} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.0} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.0} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM {16.5} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH {98.503} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM {18} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH {68.5855} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH {90.295} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH {103.977} \
CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {525} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J256M16 RE-125} \
CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
CONFIG.PCW_UIPARAM_DDR_T_RC {48.91} \
CONFIG.PCW_USB_RESET_ENABLE {1} \
CONFIG.PCW_USE_M_AXI_GP0 {1} \
CONFIG.PCW_USE_S_AXI_GP0 {0} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
 ] $processing_system7_0

  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {2} \
 ] $ps7_0_axi_periph

  # Create instance: rpm_check_0, and set properties
  set rpm_check_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:rpm_check:1.0 rpm_check_0 ]

  # Create instance: rx_fifo, and set properties
  set rx_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 rx_fifo ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {512} \
CONFIG.TDATA_NUM_BYTES {8} \
 ] $rx_fifo

  # Create instance: tx_fifo, and set properties
  set tx_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 tx_fifo ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {512} \
CONFIG.TDATA_NUM_BYTES {8} \
 ] $tx_fifo

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {4} \
 ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {4} \
CONFIG.IN1_WIDTH {4} \
CONFIG.IN2_WIDTH {1} \
CONFIG.IN3_WIDTH {1} \
CONFIG.IN4_WIDTH {1} \
CONFIG.IN5_WIDTH {1} \
CONFIG.IN6_WIDTH {20} \
CONFIG.NUM_PORTS {7} \
 ] $xlconcat_1

  # Create instance: xlconcat_2, and set properties
  set xlconcat_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_2 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {4} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {24} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {20} \
 ] $xlconstant_2

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {3} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {19} \
CONFIG.DIN_TO {4} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_3

  # Create instance: xlslice_4, and set properties
  set xlslice_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_4 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {20} \
CONFIG.DIN_TO {20} \
CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_4

  # Create instance: xlslice_5, and set properties
  set xlslice_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_5 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {21} \
CONFIG.DIN_TO {21} \
CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_5

  # Create instance: xlslice_6, and set properties
  set xlslice_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_6 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {24} \
CONFIG.DOUT_WIDTH {8} \
 ] $xlslice_6

  # Create instance: zero_16, and set properties
  set zero_16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero_16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero_16

  # Create interface connections
  connect_bd_intf_net -intf_net AXI_StreamCapture_0_m_axis_s2mm [get_bd_intf_pins AXI_StreamCapture_0/m_axis_s2mm] [get_bd_intf_pins axi_datamover_0/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net AXI_StreamCapture_0_m_axis_s2mm_cmd [get_bd_intf_pins AXI_StreamCapture_0/m_axis_s2mm_cmd] [get_bd_intf_pins axi_datamover_0/S_AXIS_S2MM_CMD]
  connect_bd_intf_net -intf_net Angle_RPM_Ib_Ia_m_axis [get_bd_intf_pins Angle_RPM_Ib_Ia/m_axis] [get_bd_intf_pins axis_broadcaster_0/S_AXIS]
connect_bd_intf_net -intf_net Conn [get_bd_intf_pins FOC/s_axis_V1] [get_bd_intf_pins axis_monitor_0/s01_axis]
connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins FOC/SLOT_0_AXIS] [get_bd_intf_pins axis_monitor_0/s02_axis]
connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins FOC/m_axis] [get_bd_intf_pins axis_monitor_0/s03_axis]
connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins FOC/s_axis_V2] [get_bd_intf_pins axis_monitor_0/s04_axis]
connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins FOC/SLOT_0_AXIS1] [get_bd_intf_pins axis_monitor_0/s05_axis]
  connect_bd_intf_net -intf_net FOC_m_axis_V [get_bd_intf_pins FOC/m_axis_V] [get_bd_intf_pins tx_fifo/S_AXIS]
connect_bd_intf_net -intf_net [get_bd_intf_nets FOC_m_axis_V] [get_bd_intf_pins axis_monitor_0/s06_axis] [get_bd_intf_pins tx_fifo/S_AXIS]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXIS_S2MM_STS [get_bd_intf_pins AXI_StreamCapture_0/s_axis_s2mm_sts] [get_bd_intf_pins axi_datamover_0/M_AXIS_S2MM_STS]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXI_S2MM [get_bd_intf_pins axi_datamover_0/M_AXI_S2MM] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axis_AD7403_0_m_axis [get_bd_intf_pins axis_AD7403_0/m_axis] [get_bd_intf_pins axis_data_fifo_1/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_0_M00_AXIS [get_bd_intf_pins axis_broadcaster_0/M00_AXIS] [get_bd_intf_pins rx_fifo/S_AXIS]
connect_bd_intf_net -intf_net axis_broadcaster_0_M01_AXIS [get_bd_intf_pins axis_broadcaster_0/M01_AXIS] [get_bd_intf_pins axis_monitor_0/s00_axis]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins AXI_StreamCapture_0/s_axis] [get_bd_intf_pins axis_data_fifo_0/M_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_1_M_AXIS [get_bd_intf_pins Ib_Ia/S_AXIS] [get_bd_intf_pins axis_data_fifo_1/M_AXIS]
  connect_bd_intf_net -intf_net axis_decimate_0_m_axis [get_bd_intf_pins axis_data_fifo_0/S_AXIS] [get_bd_intf_pins axis_decimate_0/m_axis]
  connect_bd_intf_net -intf_net axis_encoder_0_m_angle [get_bd_intf_pins Angle_RPM_Ib_Ia/sc_axis] [get_bd_intf_pins axis_encoder_0/m_angle]
  connect_bd_intf_net -intf_net axis_encoder_0_m_rpm [get_bd_intf_pins Angle_RPM_Ib_Ia/sb_axis] [get_bd_intf_pins axis_encoder_0/m_rpm]
  connect_bd_intf_net -intf_net axis_monitor_0_m_axis [get_bd_intf_pins axis_decimate_0/s_axis] [get_bd_intf_pins axis_monitor_0/m_axis]
  connect_bd_intf_net -intf_net axis_subset_converter_0_M_AXIS [get_bd_intf_pins Angle_RPM_Ib_Ia/sa_axis] [get_bd_intf_pins Ib_Ia/M_AXIS]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins axi_reg32_0/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M01_AXI [get_bd_intf_pins AXI_StreamCapture_0/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net rx_fifo_M_AXIS [get_bd_intf_pins FOC/s_axis_V] [get_bd_intf_pins rx_fifo/M_AXIS]
  connect_bd_intf_net -intf_net tx_fifo_M_AXIS [get_bd_intf_pins axis_pwm_0/S_AXIS] [get_bd_intf_pins tx_fifo/M_AXIS]

  # Create port connections
  connect_bd_net -net A_1 [get_bd_ports ENC_A] [get_bd_pins axis_encoder_0/A]
  connect_bd_net -net Angle_Shift_slice_Dout [get_bd_pins Angle_Shift_slice/Dout] [get_bd_pins axis_encoder_0/angle_shift]
  connect_bd_net -net BTN0_1 [get_bd_ports BTN0] [get_bd_pins rpm_check_0/button] [get_bd_pins xlconcat_1/In2]
  connect_bd_net -net BTN1_1 [get_bd_ports BTN1] [get_bd_pins xlconcat_1/In3]
  connect_bd_net -net BTN2_1 [get_bd_ports BTN2] [get_bd_pins xlconcat_1/In4]
  connect_bd_net -net BTN3_1 [get_bd_ports BTN3] [get_bd_pins xlconcat_1/In5]
  connect_bd_net -net B_1 [get_bd_ports ENC_B] [get_bd_pins axis_encoder_0/B]
  connect_bd_net -net FOC_Id_out [get_bd_pins FOC/Id_out] [get_bd_pins axi_reg32_0/RR2]
  connect_bd_net -net FOC_Iq_out [get_bd_pins FOC/Iq_out] [get_bd_pins axi_reg32_0/RR3]
  connect_bd_net -net FOC_dout [get_bd_pins FOC/RPM] [get_bd_pins axi_reg32_0/RR1] [get_bd_pins xlslice_2/Din]
  connect_bd_net -net I_1 [get_bd_ports ENC_I] [get_bd_pins axis_encoder_0/I]
  connect_bd_net -net SDI1_1 [get_bd_ports SDI1] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net SDI2_1 [get_bd_ports SDI2] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net SDI3_1 [get_bd_ports SDI3] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net SDV_1 [get_bd_ports SDV] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net SW0_1 [get_bd_ports SW0] [get_bd_pins clk_mux_0/sel] [get_bd_pins rpm_check_0/ss_in]
  connect_bd_net -net Vq_1 [get_bd_pins FOC/Vq] [get_bd_pins axi_reg32_0/WR12]
  connect_bd_net -net axi_reg32_0_WR0 [get_bd_pins FOC/control] [get_bd_pins axi_reg32_0/WR0] [get_bd_pins rpm_check_0/mode_in]
  connect_bd_net -net axi_reg32_0_WR1 [get_bd_pins FOC/Flux_Sp] [get_bd_pins axi_reg32_0/WR1]
  connect_bd_net -net axi_reg32_0_WR2 [get_bd_pins FOC/Flux_Kp] [get_bd_pins axi_reg32_0/WR2]
  connect_bd_net -net axi_reg32_0_WR3 [get_bd_pins FOC/Flux_Ki] [get_bd_pins axi_reg32_0/WR3]
  connect_bd_net -net axi_reg32_0_WR4 [get_bd_pins FOC/Torque_Sp] [get_bd_pins axi_reg32_0/WR4]
  connect_bd_net -net axi_reg32_0_WR5 [get_bd_pins FOC/Torque_Kp] [get_bd_pins axi_reg32_0/WR5]
  connect_bd_net -net axi_reg32_0_WR6 [get_bd_pins FOC/Torque_Ki] [get_bd_pins axi_reg32_0/WR6]
  connect_bd_net -net axi_reg32_0_WR7 [get_bd_pins FOC/RPM_Sp] [get_bd_pins axi_reg32_0/WR7]
  connect_bd_net -net axi_reg32_0_WR8 [get_bd_pins FOC/RPM_Kp] [get_bd_pins axi_reg32_0/WR8]
  connect_bd_net -net axi_reg32_0_WR9 [get_bd_pins FOC/RPM_Ki] [get_bd_pins axi_reg32_0/WR9]
  connect_bd_net -net axi_reg32_0_WR10 [get_bd_pins Angle_Shift_slice/Din] [get_bd_pins axi_reg32_0/WR10]
  connect_bd_net -net axi_reg32_0_WR11 [get_bd_pins FOC/Vd] [get_bd_pins axi_reg32_0/WR11]
  connect_bd_net -net axi_reg32_0_WR15 [get_bd_pins axi_reg32_0/WR15] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_3/Din] [get_bd_pins xlslice_4/Din] [get_bd_pins xlslice_5/Din] [get_bd_pins xlslice_6/Din]
  connect_bd_net -net axis_AD7403_0_clkout [get_bd_ports SCLK] [get_bd_pins axis_AD7403_0/clkout]
  connect_bd_net -net axis_encoder_0_angle_data [get_bd_pins Angle_concat/In0] [get_bd_pins axis_encoder_0/angle_data]
  connect_bd_net -net axis_pwm_0_pwm_h [get_bd_ports GH] [get_bd_pins axis_pwm_0/pwm_h]
  connect_bd_net -net axis_pwm_0_pwm_l [get_bd_ports GL] [get_bd_pins axis_pwm_0/pwm_l]
  connect_bd_net -net clk_mux_0_clkout [get_bd_pins axis_AD7403_0/m_axis_aclk] [get_bd_pins axis_data_fifo_1/s_axis_aclk] [get_bd_pins clk_mux_0/clkout] [get_bd_pins proc_sys_reset_1/slowest_sync_clk]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_mux_0/clk1] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins ps7_0_axi_periph/ARESETN]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins AXI_StreamCapture_0/axi_aresetn] [get_bd_pins Angle_RPM_Ib_Ia/s_axis_aresetn] [get_bd_pins FOC/ap_rst_n] [get_bd_pins Ib_Ia/aresetn] [get_bd_pins axi_datamover_0/m_axi_s2mm_aresetn] [get_bd_pins axi_datamover_0/m_axis_s2mm_cmdsts_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_reg32_0/s_axi_aresetn] [get_bd_pins axis_broadcaster_0/aresetn] [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins axis_data_fifo_1/m_axis_aresetn] [get_bd_pins axis_decimate_0/s_axis_aresetn] [get_bd_pins axis_encoder_0/axis_aresetn] [get_bd_pins axis_monitor_0/axis_aresetn] [get_bd_pins axis_pwm_0/s_axis_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/M01_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins rx_fifo/s_axis_aresetn] [get_bd_pins tx_fifo/s_axis_aresetn]
  connect_bd_net -net proc_sys_reset_1_peripheral_aresetn [get_bd_pins axis_AD7403_0/m_axis_aresetn] [get_bd_pins axis_data_fifo_1/s_axis_aresetn] [get_bd_pins proc_sys_reset_1/peripheral_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins AXI_StreamCapture_0/axi_aclk] [get_bd_pins Angle_RPM_Ib_Ia/s_axis_aclk] [get_bd_pins FOC/ap_clk] [get_bd_pins Ib_Ia/aclk] [get_bd_pins axi_datamover_0/m_axi_s2mm_aclk] [get_bd_pins axi_datamover_0/m_axis_s2mm_cmdsts_awclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_reg32_0/s_axi_aclk] [get_bd_pins axis_broadcaster_0/aclk] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins axis_data_fifo_1/m_axis_aclk] [get_bd_pins axis_decimate_0/s_axis_aclk] [get_bd_pins axis_encoder_0/axis_aclk] [get_bd_pins axis_monitor_0/axis_aclk] [get_bd_pins axis_pwm_0/s_axis_aclk] [get_bd_pins clk_mux_0/clk0] [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/M01_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins rpm_check_0/aclk] [get_bd_pins rx_fifo/s_axis_aclk] [get_bd_pins tx_fifo/s_axis_aclk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins proc_sys_reset_1/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  connect_bd_net -net rpm_check_0_led [get_bd_ports led] [get_bd_pins rpm_check_0/led] [get_bd_pins xlconcat_1/In0]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins axis_AD7403_0/din] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins Angle_concat/dout] [get_bd_pins axi_reg32_0/RR0]
  connect_bd_net -net xlconcat_1_dout1 [get_bd_pins axi_reg32_0/RR4] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconcat_2_dout [get_bd_pins axis_decimate_0/decimation] [get_bd_pins xlconcat_2/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconcat_1/In1] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xlconcat_2/In1] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins xlconcat_1/In6] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins axis_monitor_0/mux_in] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins rpm_check_0/rpm_data] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins rpm_check_0/tolerance_in] [get_bd_pins xlslice_3/Dout]
  connect_bd_net -net xlslice_4_Dout [get_bd_pins rpm_check_0/led_in] [get_bd_pins xlslice_4/Dout]
  connect_bd_net -net xlslice_5_Dout [get_bd_pins rpm_check_0/restart_in] [get_bd_pins xlslice_5/Dout]
  connect_bd_net -net xlslice_6_Dout [get_bd_pins xlconcat_2/In0] [get_bd_pins xlslice_6/Dout]
  connect_bd_net -net zero_16_dout [get_bd_pins Angle_concat/In1] [get_bd_pins zero_16/dout]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces axi_datamover_0/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x00010000 -offset 0x43C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs AXI_StreamCapture_0/S_AXI/S_AXI_reg] SEG_AXI_StreamCapture_0_S_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_reg32_0/S_AXI/S_AXI_reg] SEG_axi_reg32_0_S_AXI_reg


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""




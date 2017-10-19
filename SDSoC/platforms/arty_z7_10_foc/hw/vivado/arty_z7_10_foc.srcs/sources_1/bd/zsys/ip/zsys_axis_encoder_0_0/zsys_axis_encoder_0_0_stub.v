// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
// Date        : Thu Oct  5 15:58:21 2017
// Host        : free-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               B:/cores/2017.1/design/TEC0053/platforms/arty_z7_10_foc/hw/vivado/arty_z7_10_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_encoder_0_0/zsys_axis_encoder_0_0_stub.v
// Design      : zsys_axis_encoder_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axis_encoder_v1_0,Vivado 2017.1_sdx" *)
module zsys_axis_encoder_0_0(A, B, I, angle_data, period_data, rpm_data, 
  axis_aclk, axis_aresetn, m_angle_tvalid, m_angle_tdata, m_angle_tready, m_rpm_tvalid, 
  m_rpm_tdata, m_rpm_tready)
/* synthesis syn_black_box black_box_pad_pin="A,B,I,angle_data[15:0],period_data[15:0],rpm_data[15:0],axis_aclk,axis_aresetn,m_angle_tvalid,m_angle_tdata[15:0],m_angle_tready,m_rpm_tvalid,m_rpm_tdata[15:0],m_rpm_tready" */;
  input A;
  input B;
  input I;
  output [15:0]angle_data;
  output [15:0]period_data;
  output [15:0]rpm_data;
  input axis_aclk;
  input axis_aresetn;
  output m_angle_tvalid;
  output [15:0]m_angle_tdata;
  input m_angle_tready;
  output m_rpm_tvalid;
  output [15:0]m_rpm_tdata;
  input m_rpm_tready;
endmodule

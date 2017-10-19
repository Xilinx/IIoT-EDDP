// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
// Date        : Fri Oct  6 12:15:41 2017
// Host        : W7-64-12 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               B:/SVN/cores/2017.1/design/TEC0053/platforms/arty_z7_20_foc/hw/vivado/arty_z7_20_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_AD7403_0_0/zsys_axis_AD7403_0_0_stub.v
// Design      : zsys_axis_AD7403_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axis_AD7403_v1_0,Vivado 2017.1_sdx" *)
module zsys_axis_AD7403_0_0(din, clkout, update, m_axis_tdata, m_axis_tready, 
  m_axis_tvalid, m_axis_aclk, m_axis_aresetn)
/* synthesis syn_black_box black_box_pad_pin="din[3:0],clkout,update,m_axis_tdata[63:0],m_axis_tready,m_axis_tvalid,m_axis_aclk,m_axis_aresetn" */;
  input [3:0]din;
  output clkout;
  output update;
  output [63:0]m_axis_tdata;
  input m_axis_tready;
  output m_axis_tvalid;
  input m_axis_aclk;
  input m_axis_aresetn;
endmodule

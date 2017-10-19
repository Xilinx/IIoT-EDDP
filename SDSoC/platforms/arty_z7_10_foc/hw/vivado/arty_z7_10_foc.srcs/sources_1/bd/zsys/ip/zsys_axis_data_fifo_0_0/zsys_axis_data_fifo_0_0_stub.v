// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
// Date        : Thu Oct  5 15:56:34 2017
// Host        : free-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               B:/cores/2017.1/design/TEC0053/platforms/arty_z7_10_foc/hw/vivado/arty_z7_10_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_data_fifo_0_0/zsys_axis_data_fifo_0_0_stub.v
// Design      : zsys_axis_data_fifo_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_data_fifo_v1_1_13_axis_data_fifo,Vivado 2017.1_sdx" *)
module zsys_axis_data_fifo_0_0(s_axis_aresetn, s_axis_aclk, s_axis_tvalid, 
  s_axis_tready, s_axis_tdata, m_axis_tvalid, m_axis_tready, m_axis_tdata, axis_data_count, 
  axis_wr_data_count, axis_rd_data_count)
/* synthesis syn_black_box black_box_pad_pin="s_axis_aresetn,s_axis_aclk,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],axis_data_count[31:0],axis_wr_data_count[31:0],axis_rd_data_count[31:0]" */;
  input s_axis_aresetn;
  input s_axis_aclk;
  input s_axis_tvalid;
  output s_axis_tready;
  input [63:0]s_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
  output [63:0]m_axis_tdata;
  output [31:0]axis_data_count;
  output [31:0]axis_wr_data_count;
  output [31:0]axis_rd_data_count;
endmodule

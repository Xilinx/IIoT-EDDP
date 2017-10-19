// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
// Date        : Thu Oct  5 15:58:08 2017
// Host        : free-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               B:/cores/2017.1/design/TEC0053/platforms/arty_z7_10_foc/hw/vivado/arty_z7_10_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_pwm_0_0/zsys_axis_pwm_0_0_stub.v
// Design      : zsys_axis_pwm_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axis_pwm_v1_0,Vivado 2017.1_sdx" *)
module zsys_axis_pwm_0_0(pwm_l, pwm_h, s_axis_tdata, s_axis_tdest, 
  s_axis_tvalid, s_axis_tready, s_axis_aclk, s_axis_aresetn)
/* synthesis syn_black_box black_box_pad_pin="pwm_l[2:0],pwm_h[2:0],s_axis_tdata[63:0],s_axis_tdest[1:0],s_axis_tvalid,s_axis_tready,s_axis_aclk,s_axis_aresetn" */;
  output [2:0]pwm_l;
  output [2:0]pwm_h;
  input [63:0]s_axis_tdata;
  input [1:0]s_axis_tdest;
  input s_axis_tvalid;
  output s_axis_tready;
  input s_axis_aclk;
  input s_axis_aresetn;
endmodule

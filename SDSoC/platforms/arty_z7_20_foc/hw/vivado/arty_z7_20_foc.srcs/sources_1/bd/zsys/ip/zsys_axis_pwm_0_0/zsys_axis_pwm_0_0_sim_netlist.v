// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
// Date        : Fri Oct  6 12:14:09 2017
// Host        : W7-64-12 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               B:/SVN/cores/2017.1/design/TEC0053/platforms/arty_z7_20_foc/hw/vivado/arty_z7_20_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_pwm_0_0/zsys_axis_pwm_0_0_sim_netlist.v
// Design      : zsys_axis_pwm_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "zsys_axis_pwm_0_0,axis_pwm_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axis_pwm_v1_0,Vivado 2017.1_sdx" *) 
(* NotValidForBitStream *)
module zsys_axis_pwm_0_0
   (pwm_l,
    pwm_h,
    s_axis_tdata,
    s_axis_tdest,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_aclk,
    s_axis_aresetn);
  output [2:0]pwm_l;
  output [2:0]pwm_h;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [63:0]s_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TDEST" *) input [1:0]s_axis_tdest;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 s_axis_aclk CLK" *) input s_axis_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 s_axis_aresetn RST" *) input s_axis_aresetn;

  wire \<const1> ;
  wire [2:0]pwm_h;
  wire [2:0]pwm_l;
  wire s_axis_aclk;
  wire [63:0]s_axis_tdata;
  wire s_axis_tvalid;

  assign s_axis_tready = \<const1> ;
  zsys_axis_pwm_0_0_axis_pwm_v1_0 U0
       (.pwm_h(pwm_h),
        .pwm_l(pwm_l),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_tdata(s_axis_tdata[47:0]),
        .s_axis_tvalid(s_axis_tvalid));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "axis_pwm_v1_0" *) 
module zsys_axis_pwm_0_0_axis_pwm_v1_0
   (pwm_l,
    pwm_h,
    s_axis_aclk,
    s_axis_tvalid,
    s_axis_tdata);
  output [2:0]pwm_l;
  output [2:0]pwm_h;
  input s_axis_aclk;
  input s_axis_tvalid;
  input [47:0]s_axis_tdata;

  wire _carry__0_i_1_n_0;
  wire _carry__0_i_2_n_0;
  wire _carry__0_n_2;
  wire _carry__0_n_3;
  wire _carry_i_1_n_0;
  wire _carry_i_2_n_0;
  wire _carry_i_3_n_0;
  wire _carry_i_4_n_0;
  wire _carry_n_0;
  wire _carry_n_1;
  wire _carry_n_2;
  wire _carry_n_3;
  wire \_inferred__0/i__carry__0_n_0 ;
  wire \_inferred__0/i__carry__0_n_1 ;
  wire \_inferred__0/i__carry__0_n_2 ;
  wire \_inferred__0/i__carry__0_n_3 ;
  wire \_inferred__0/i__carry__1_n_3 ;
  wire \_inferred__0/i__carry_n_0 ;
  wire \_inferred__0/i__carry_n_1 ;
  wire \_inferred__0/i__carry_n_2 ;
  wire \_inferred__0/i__carry_n_3 ;
  wire \_inferred__1/i__carry__0_n_0 ;
  wire \_inferred__1/i__carry__0_n_1 ;
  wire \_inferred__1/i__carry__0_n_2 ;
  wire \_inferred__1/i__carry__0_n_3 ;
  wire \_inferred__1/i__carry__1_n_0 ;
  wire \_inferred__1/i__carry__1_n_1 ;
  wire \_inferred__1/i__carry__1_n_2 ;
  wire \_inferred__1/i__carry__1_n_3 ;
  wire \_inferred__1/i__carry__2_n_0 ;
  wire \_inferred__1/i__carry__2_n_1 ;
  wire \_inferred__1/i__carry__2_n_2 ;
  wire \_inferred__1/i__carry__2_n_3 ;
  wire \_inferred__1/i__carry_n_0 ;
  wire \_inferred__1/i__carry_n_1 ;
  wire \_inferred__1/i__carry_n_2 ;
  wire \_inferred__1/i__carry_n_3 ;
  wire \_inferred__10/i__carry__0_n_0 ;
  wire \_inferred__10/i__carry__0_n_1 ;
  wire \_inferred__10/i__carry__0_n_2 ;
  wire \_inferred__10/i__carry__0_n_3 ;
  wire \_inferred__10/i__carry__0_n_4 ;
  wire \_inferred__10/i__carry__0_n_5 ;
  wire \_inferred__10/i__carry__0_n_6 ;
  wire \_inferred__10/i__carry__0_n_7 ;
  wire \_inferred__10/i__carry__1_n_0 ;
  wire \_inferred__10/i__carry__1_n_1 ;
  wire \_inferred__10/i__carry__1_n_2 ;
  wire \_inferred__10/i__carry__1_n_3 ;
  wire \_inferred__10/i__carry__1_n_4 ;
  wire \_inferred__10/i__carry__1_n_5 ;
  wire \_inferred__10/i__carry__1_n_6 ;
  wire \_inferred__10/i__carry__1_n_7 ;
  wire \_inferred__10/i__carry__2_n_0 ;
  wire \_inferred__10/i__carry__2_n_1 ;
  wire \_inferred__10/i__carry__2_n_2 ;
  wire \_inferred__10/i__carry__2_n_3 ;
  wire \_inferred__10/i__carry__2_n_4 ;
  wire \_inferred__10/i__carry__2_n_5 ;
  wire \_inferred__10/i__carry__2_n_6 ;
  wire \_inferred__10/i__carry__2_n_7 ;
  wire \_inferred__10/i__carry__3_n_7 ;
  wire \_inferred__10/i__carry_n_0 ;
  wire \_inferred__10/i__carry_n_1 ;
  wire \_inferred__10/i__carry_n_2 ;
  wire \_inferred__10/i__carry_n_3 ;
  wire \_inferred__10/i__carry_n_4 ;
  wire \_inferred__10/i__carry_n_5 ;
  wire \_inferred__10/i__carry_n_6 ;
  wire \_inferred__10/i__carry_n_7 ;
  wire \_inferred__11/i__carry__0_n_3 ;
  wire \_inferred__11/i__carry_n_0 ;
  wire \_inferred__11/i__carry_n_1 ;
  wire \_inferred__11/i__carry_n_2 ;
  wire \_inferred__11/i__carry_n_3 ;
  wire \_inferred__12/i__carry__0_n_0 ;
  wire \_inferred__12/i__carry__0_n_1 ;
  wire \_inferred__12/i__carry__0_n_2 ;
  wire \_inferred__12/i__carry__0_n_3 ;
  wire \_inferred__12/i__carry__0_n_4 ;
  wire \_inferred__12/i__carry__0_n_5 ;
  wire \_inferred__12/i__carry__0_n_6 ;
  wire \_inferred__12/i__carry__0_n_7 ;
  wire \_inferred__12/i__carry__1_n_0 ;
  wire \_inferred__12/i__carry__1_n_1 ;
  wire \_inferred__12/i__carry__1_n_2 ;
  wire \_inferred__12/i__carry__1_n_3 ;
  wire \_inferred__12/i__carry__1_n_4 ;
  wire \_inferred__12/i__carry__1_n_5 ;
  wire \_inferred__12/i__carry__1_n_6 ;
  wire \_inferred__12/i__carry__1_n_7 ;
  wire \_inferred__12/i__carry__2_n_0 ;
  wire \_inferred__12/i__carry__2_n_1 ;
  wire \_inferred__12/i__carry__2_n_2 ;
  wire \_inferred__12/i__carry__2_n_3 ;
  wire \_inferred__12/i__carry__2_n_4 ;
  wire \_inferred__12/i__carry__2_n_5 ;
  wire \_inferred__12/i__carry__2_n_6 ;
  wire \_inferred__12/i__carry__2_n_7 ;
  wire \_inferred__12/i__carry__3_n_7 ;
  wire \_inferred__12/i__carry_n_0 ;
  wire \_inferred__12/i__carry_n_1 ;
  wire \_inferred__12/i__carry_n_2 ;
  wire \_inferred__12/i__carry_n_3 ;
  wire \_inferred__12/i__carry_n_4 ;
  wire \_inferred__12/i__carry_n_5 ;
  wire \_inferred__12/i__carry_n_6 ;
  wire \_inferred__12/i__carry_n_7 ;
  wire \_inferred__13/i__carry__0_n_3 ;
  wire \_inferred__13/i__carry_n_0 ;
  wire \_inferred__13/i__carry_n_1 ;
  wire \_inferred__13/i__carry_n_2 ;
  wire \_inferred__13/i__carry_n_3 ;
  wire \_inferred__14/i__carry__0_n_0 ;
  wire \_inferred__14/i__carry__0_n_1 ;
  wire \_inferred__14/i__carry__0_n_2 ;
  wire \_inferred__14/i__carry__0_n_3 ;
  wire \_inferred__14/i__carry__0_n_4 ;
  wire \_inferred__14/i__carry__0_n_5 ;
  wire \_inferred__14/i__carry__0_n_6 ;
  wire \_inferred__14/i__carry__0_n_7 ;
  wire \_inferred__14/i__carry__1_n_0 ;
  wire \_inferred__14/i__carry__1_n_1 ;
  wire \_inferred__14/i__carry__1_n_2 ;
  wire \_inferred__14/i__carry__1_n_3 ;
  wire \_inferred__14/i__carry__1_n_4 ;
  wire \_inferred__14/i__carry__1_n_5 ;
  wire \_inferred__14/i__carry__1_n_6 ;
  wire \_inferred__14/i__carry__1_n_7 ;
  wire \_inferred__14/i__carry__2_n_0 ;
  wire \_inferred__14/i__carry__2_n_1 ;
  wire \_inferred__14/i__carry__2_n_2 ;
  wire \_inferred__14/i__carry__2_n_3 ;
  wire \_inferred__14/i__carry__2_n_4 ;
  wire \_inferred__14/i__carry__2_n_5 ;
  wire \_inferred__14/i__carry__2_n_6 ;
  wire \_inferred__14/i__carry__2_n_7 ;
  wire \_inferred__14/i__carry__3_n_7 ;
  wire \_inferred__14/i__carry_n_0 ;
  wire \_inferred__14/i__carry_n_1 ;
  wire \_inferred__14/i__carry_n_2 ;
  wire \_inferred__14/i__carry_n_3 ;
  wire \_inferred__14/i__carry_n_4 ;
  wire \_inferred__14/i__carry_n_5 ;
  wire \_inferred__14/i__carry_n_6 ;
  wire \_inferred__14/i__carry_n_7 ;
  wire \_inferred__15/i__carry__0_n_3 ;
  wire \_inferred__15/i__carry_n_0 ;
  wire \_inferred__15/i__carry_n_1 ;
  wire \_inferred__15/i__carry_n_2 ;
  wire \_inferred__15/i__carry_n_3 ;
  wire \_inferred__2/i__carry__0_n_2 ;
  wire \_inferred__2/i__carry__0_n_3 ;
  wire \_inferred__2/i__carry_n_0 ;
  wire \_inferred__2/i__carry_n_1 ;
  wire \_inferred__2/i__carry_n_2 ;
  wire \_inferred__2/i__carry_n_3 ;
  wire \_inferred__3/i__carry__0_n_2 ;
  wire \_inferred__3/i__carry__0_n_3 ;
  wire \_inferred__3/i__carry_n_0 ;
  wire \_inferred__3/i__carry_n_1 ;
  wire \_inferred__3/i__carry_n_2 ;
  wire \_inferred__3/i__carry_n_3 ;
  wire \_inferred__4/i__carry__0_n_0 ;
  wire \_inferred__4/i__carry__0_n_1 ;
  wire \_inferred__4/i__carry__0_n_2 ;
  wire \_inferred__4/i__carry__0_n_3 ;
  wire \_inferred__4/i__carry__1_n_3 ;
  wire \_inferred__4/i__carry_n_0 ;
  wire \_inferred__4/i__carry_n_1 ;
  wire \_inferred__4/i__carry_n_2 ;
  wire \_inferred__4/i__carry_n_3 ;
  wire \_inferred__5/i__carry__0_n_0 ;
  wire \_inferred__5/i__carry__0_n_1 ;
  wire \_inferred__5/i__carry__0_n_2 ;
  wire \_inferred__5/i__carry__0_n_3 ;
  wire \_inferred__5/i__carry__0_n_4 ;
  wire \_inferred__5/i__carry__0_n_5 ;
  wire \_inferred__5/i__carry__0_n_6 ;
  wire \_inferred__5/i__carry__0_n_7 ;
  wire \_inferred__5/i__carry__1_n_0 ;
  wire \_inferred__5/i__carry__1_n_1 ;
  wire \_inferred__5/i__carry__1_n_2 ;
  wire \_inferred__5/i__carry__1_n_3 ;
  wire \_inferred__5/i__carry__1_n_4 ;
  wire \_inferred__5/i__carry__1_n_5 ;
  wire \_inferred__5/i__carry__1_n_6 ;
  wire \_inferred__5/i__carry__1_n_7 ;
  wire \_inferred__5/i__carry__2_n_0 ;
  wire \_inferred__5/i__carry__2_n_1 ;
  wire \_inferred__5/i__carry__2_n_2 ;
  wire \_inferred__5/i__carry__2_n_3 ;
  wire \_inferred__5/i__carry__2_n_4 ;
  wire \_inferred__5/i__carry__2_n_5 ;
  wire \_inferred__5/i__carry__2_n_6 ;
  wire \_inferred__5/i__carry__2_n_7 ;
  wire \_inferred__5/i__carry__3_n_7 ;
  wire \_inferred__5/i__carry_n_0 ;
  wire \_inferred__5/i__carry_n_1 ;
  wire \_inferred__5/i__carry_n_2 ;
  wire \_inferred__5/i__carry_n_3 ;
  wire \_inferred__5/i__carry_n_4 ;
  wire \_inferred__5/i__carry_n_5 ;
  wire \_inferred__5/i__carry_n_6 ;
  wire \_inferred__5/i__carry_n_7 ;
  wire \_inferred__6/i__carry__0_n_2 ;
  wire \_inferred__6/i__carry__0_n_3 ;
  wire \_inferred__6/i__carry_n_0 ;
  wire \_inferred__6/i__carry_n_1 ;
  wire \_inferred__6/i__carry_n_2 ;
  wire \_inferred__6/i__carry_n_3 ;
  wire \_inferred__7/i__carry__0_n_0 ;
  wire \_inferred__7/i__carry__0_n_1 ;
  wire \_inferred__7/i__carry__0_n_2 ;
  wire \_inferred__7/i__carry__0_n_3 ;
  wire \_inferred__7/i__carry__1_n_3 ;
  wire \_inferred__7/i__carry_n_0 ;
  wire \_inferred__7/i__carry_n_1 ;
  wire \_inferred__7/i__carry_n_2 ;
  wire \_inferred__7/i__carry_n_3 ;
  wire \_inferred__8/i__carry__0_n_0 ;
  wire \_inferred__8/i__carry__0_n_1 ;
  wire \_inferred__8/i__carry__0_n_2 ;
  wire \_inferred__8/i__carry__0_n_3 ;
  wire \_inferred__8/i__carry__0_n_4 ;
  wire \_inferred__8/i__carry__0_n_5 ;
  wire \_inferred__8/i__carry__0_n_6 ;
  wire \_inferred__8/i__carry__0_n_7 ;
  wire \_inferred__8/i__carry__1_n_0 ;
  wire \_inferred__8/i__carry__1_n_1 ;
  wire \_inferred__8/i__carry__1_n_2 ;
  wire \_inferred__8/i__carry__1_n_3 ;
  wire \_inferred__8/i__carry__1_n_4 ;
  wire \_inferred__8/i__carry__1_n_5 ;
  wire \_inferred__8/i__carry__1_n_6 ;
  wire \_inferred__8/i__carry__1_n_7 ;
  wire \_inferred__8/i__carry__2_n_0 ;
  wire \_inferred__8/i__carry__2_n_1 ;
  wire \_inferred__8/i__carry__2_n_2 ;
  wire \_inferred__8/i__carry__2_n_3 ;
  wire \_inferred__8/i__carry__2_n_4 ;
  wire \_inferred__8/i__carry__2_n_5 ;
  wire \_inferred__8/i__carry__2_n_6 ;
  wire \_inferred__8/i__carry__2_n_7 ;
  wire \_inferred__8/i__carry__3_n_7 ;
  wire \_inferred__8/i__carry_n_0 ;
  wire \_inferred__8/i__carry_n_1 ;
  wire \_inferred__8/i__carry_n_2 ;
  wire \_inferred__8/i__carry_n_3 ;
  wire \_inferred__8/i__carry_n_4 ;
  wire \_inferred__8/i__carry_n_5 ;
  wire \_inferred__8/i__carry_n_6 ;
  wire \_inferred__8/i__carry_n_7 ;
  wire \_inferred__9/i__carry__0_n_2 ;
  wire \_inferred__9/i__carry__0_n_3 ;
  wire \_inferred__9/i__carry_n_0 ;
  wire \_inferred__9/i__carry_n_1 ;
  wire \_inferred__9/i__carry_n_2 ;
  wire \_inferred__9/i__carry_n_3 ;
  wire \bipolar_gen.h_end[0][17]_i_1_n_0 ;
  wire \bipolar_gen.h_end[1][17]_i_1_n_0 ;
  wire \bipolar_gen.h_end[2][17]_i_1_n_0 ;
  wire [17:0]\bipolar_gen.h_end_reg[0] ;
  wire [17:0]\bipolar_gen.h_end_reg[1] ;
  wire [17:0]\bipolar_gen.h_end_reg[2] ;
  wire \bipolar_gen.h_start[0][12]_i_1_n_0 ;
  wire \bipolar_gen.h_start[0][4]_i_1_n_0 ;
  wire \bipolar_gen.h_start[1][12]_i_1_n_0 ;
  wire \bipolar_gen.h_start[1][4]_i_1_n_0 ;
  wire \bipolar_gen.h_start[2][12]_i_1_n_0 ;
  wire \bipolar_gen.h_start[2][3]_i_1_n_0 ;
  wire \bipolar_gen.h_start[2][4]_i_1_n_0 ;
  wire [12:4]\bipolar_gen.h_start_reg[0] ;
  wire [12:4]\bipolar_gen.h_start_reg[1] ;
  wire [12:3]\bipolar_gen.h_start_reg[2] ;
  wire [12:12]\bipolar_gen.l_end_reg[2] ;
  wire [17:0]\bipolar_gen.l_start_reg[0] ;
  wire [17:0]\bipolar_gen.l_start_reg[1] ;
  wire [17:0]\bipolar_gen.l_start_reg[2] ;
  wire \bipolar_gen.pwm_h_drv[0]_i_1_n_0 ;
  wire \bipolar_gen.pwm_h_drv[1]_i_1_n_0 ;
  wire \bipolar_gen.pwm_h_drv[2]_i_1_n_0 ;
  wire \bipolar_gen.pwm_l_drv[0]_i_1_n_0 ;
  wire \bipolar_gen.pwm_l_drv[1]_i_1_n_0 ;
  wire \bipolar_gen.pwm_l_drv[2]_i_1_n_0 ;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_1__11_n_0;
  wire i__carry__0_i_1__2_n_0;
  wire i__carry__0_i_1__4_n_0;
  wire i__carry__0_i_1__5_n_0;
  wire i__carry__0_i_1__6_n_0;
  wire i__carry__0_i_1__7_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_2__1_n_0;
  wire i__carry__0_i_2__3_n_0;
  wire i__carry__0_i_2__5_n_0;
  wire i__carry__0_i_2__6_n_0;
  wire i__carry__0_i_2__7_n_0;
  wire i__carry__0_i_2__8_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_1__11_n_0;
  wire i__carry_i_1__1_n_0;
  wire i__carry_i_1__3_n_0;
  wire i__carry_i_1__5_n_0;
  wire i__carry_i_1__7_n_0;
  wire i__carry_i_1__9_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_2__11_n_0;
  wire i__carry_i_2__2_n_0;
  wire i__carry_i_2__4_n_0;
  wire i__carry_i_2__5_n_0;
  wire i__carry_i_2__6_n_0;
  wire i__carry_i_2__7_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_3__1_n_0;
  wire i__carry_i_3__3_n_0;
  wire i__carry_i_3__5_n_0;
  wire i__carry_i_3__6_n_0;
  wire i__carry_i_3__7_n_0;
  wire i__carry_i_3__8_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_4__2_n_0;
  wire i__carry_i_4__4_n_0;
  wire i__carry_i_4__5_n_0;
  wire i__carry_i_4__6_n_0;
  wire i__carry_i_4__7_n_0;
  wire i__carry_i_4__8_n_0;
  wire \mult_a[0][12]_i_2_n_0 ;
  wire \mult_a[0][12]_i_3_n_0 ;
  wire \mult_a[0][12]_i_4_n_0 ;
  wire \mult_a[0][12]_i_5_n_0 ;
  wire \mult_a[0][17]_i_2_n_0 ;
  wire \mult_a[0][17]_i_3_n_0 ;
  wire \mult_a[0][17]_i_4_n_0 ;
  wire \mult_a[0][4]_i_2_n_0 ;
  wire \mult_a[0][4]_i_3_n_0 ;
  wire \mult_a[0][4]_i_4_n_0 ;
  wire \mult_a[0][4]_i_5_n_0 ;
  wire \mult_a[0][8]_i_2_n_0 ;
  wire \mult_a[0][8]_i_3_n_0 ;
  wire \mult_a[0][8]_i_4_n_0 ;
  wire \mult_a[0][8]_i_5_n_0 ;
  wire \mult_a[1][0]_i_1_n_0 ;
  wire \mult_a[1][12]_i_2_n_0 ;
  wire \mult_a[1][12]_i_3_n_0 ;
  wire \mult_a[1][12]_i_4_n_0 ;
  wire \mult_a[1][12]_i_5_n_0 ;
  wire \mult_a[1][17]_i_2_n_0 ;
  wire \mult_a[1][17]_i_3_n_0 ;
  wire \mult_a[1][17]_i_4_n_0 ;
  wire \mult_a[1][4]_i_2_n_0 ;
  wire \mult_a[1][4]_i_3_n_0 ;
  wire \mult_a[1][4]_i_4_n_0 ;
  wire \mult_a[1][4]_i_5_n_0 ;
  wire \mult_a[1][8]_i_2_n_0 ;
  wire \mult_a[1][8]_i_3_n_0 ;
  wire \mult_a[1][8]_i_4_n_0 ;
  wire \mult_a[1][8]_i_5_n_0 ;
  wire \mult_a[2][0]_i_1_n_0 ;
  wire \mult_a[2][12]_i_2_n_0 ;
  wire \mult_a[2][12]_i_3_n_0 ;
  wire \mult_a[2][12]_i_4_n_0 ;
  wire \mult_a[2][12]_i_5_n_0 ;
  wire \mult_a[2][17]_i_2_n_0 ;
  wire \mult_a[2][17]_i_3_n_0 ;
  wire \mult_a[2][17]_i_4_n_0 ;
  wire \mult_a[2][4]_i_2_n_0 ;
  wire \mult_a[2][4]_i_3_n_0 ;
  wire \mult_a[2][4]_i_4_n_0 ;
  wire \mult_a[2][4]_i_5_n_0 ;
  wire \mult_a[2][8]_i_2_n_0 ;
  wire \mult_a[2][8]_i_3_n_0 ;
  wire \mult_a[2][8]_i_4_n_0 ;
  wire \mult_a[2][8]_i_5_n_0 ;
  wire \mult_a_reg[0][12]_i_1_n_0 ;
  wire \mult_a_reg[0][12]_i_1_n_1 ;
  wire \mult_a_reg[0][12]_i_1_n_2 ;
  wire \mult_a_reg[0][12]_i_1_n_3 ;
  wire \mult_a_reg[0][17]_i_1_n_1 ;
  wire \mult_a_reg[0][17]_i_1_n_2 ;
  wire \mult_a_reg[0][17]_i_1_n_3 ;
  wire \mult_a_reg[0][4]_i_1_n_0 ;
  wire \mult_a_reg[0][4]_i_1_n_1 ;
  wire \mult_a_reg[0][4]_i_1_n_2 ;
  wire \mult_a_reg[0][4]_i_1_n_3 ;
  wire \mult_a_reg[0][8]_i_1_n_0 ;
  wire \mult_a_reg[0][8]_i_1_n_1 ;
  wire \mult_a_reg[0][8]_i_1_n_2 ;
  wire \mult_a_reg[0][8]_i_1_n_3 ;
  wire \mult_a_reg[1][12]_i_1_n_0 ;
  wire \mult_a_reg[1][12]_i_1_n_1 ;
  wire \mult_a_reg[1][12]_i_1_n_2 ;
  wire \mult_a_reg[1][12]_i_1_n_3 ;
  wire \mult_a_reg[1][12]_i_1_n_4 ;
  wire \mult_a_reg[1][12]_i_1_n_5 ;
  wire \mult_a_reg[1][12]_i_1_n_6 ;
  wire \mult_a_reg[1][12]_i_1_n_7 ;
  wire \mult_a_reg[1][17]_i_1_n_1 ;
  wire \mult_a_reg[1][17]_i_1_n_2 ;
  wire \mult_a_reg[1][17]_i_1_n_3 ;
  wire \mult_a_reg[1][17]_i_1_n_4 ;
  wire \mult_a_reg[1][17]_i_1_n_5 ;
  wire \mult_a_reg[1][17]_i_1_n_6 ;
  wire \mult_a_reg[1][17]_i_1_n_7 ;
  wire \mult_a_reg[1][4]_i_1_n_0 ;
  wire \mult_a_reg[1][4]_i_1_n_1 ;
  wire \mult_a_reg[1][4]_i_1_n_2 ;
  wire \mult_a_reg[1][4]_i_1_n_3 ;
  wire \mult_a_reg[1][4]_i_1_n_4 ;
  wire \mult_a_reg[1][4]_i_1_n_5 ;
  wire \mult_a_reg[1][4]_i_1_n_6 ;
  wire \mult_a_reg[1][4]_i_1_n_7 ;
  wire \mult_a_reg[1][8]_i_1_n_0 ;
  wire \mult_a_reg[1][8]_i_1_n_1 ;
  wire \mult_a_reg[1][8]_i_1_n_2 ;
  wire \mult_a_reg[1][8]_i_1_n_3 ;
  wire \mult_a_reg[1][8]_i_1_n_4 ;
  wire \mult_a_reg[1][8]_i_1_n_5 ;
  wire \mult_a_reg[1][8]_i_1_n_6 ;
  wire \mult_a_reg[1][8]_i_1_n_7 ;
  wire \mult_a_reg[2][12]_i_1_n_0 ;
  wire \mult_a_reg[2][12]_i_1_n_1 ;
  wire \mult_a_reg[2][12]_i_1_n_2 ;
  wire \mult_a_reg[2][12]_i_1_n_3 ;
  wire \mult_a_reg[2][12]_i_1_n_4 ;
  wire \mult_a_reg[2][12]_i_1_n_5 ;
  wire \mult_a_reg[2][12]_i_1_n_6 ;
  wire \mult_a_reg[2][12]_i_1_n_7 ;
  wire \mult_a_reg[2][17]_i_1_n_1 ;
  wire \mult_a_reg[2][17]_i_1_n_2 ;
  wire \mult_a_reg[2][17]_i_1_n_3 ;
  wire \mult_a_reg[2][17]_i_1_n_4 ;
  wire \mult_a_reg[2][17]_i_1_n_5 ;
  wire \mult_a_reg[2][17]_i_1_n_6 ;
  wire \mult_a_reg[2][17]_i_1_n_7 ;
  wire \mult_a_reg[2][4]_i_1_n_0 ;
  wire \mult_a_reg[2][4]_i_1_n_1 ;
  wire \mult_a_reg[2][4]_i_1_n_2 ;
  wire \mult_a_reg[2][4]_i_1_n_3 ;
  wire \mult_a_reg[2][4]_i_1_n_4 ;
  wire \mult_a_reg[2][4]_i_1_n_5 ;
  wire \mult_a_reg[2][4]_i_1_n_6 ;
  wire \mult_a_reg[2][4]_i_1_n_7 ;
  wire \mult_a_reg[2][8]_i_1_n_0 ;
  wire \mult_a_reg[2][8]_i_1_n_1 ;
  wire \mult_a_reg[2][8]_i_1_n_2 ;
  wire \mult_a_reg[2][8]_i_1_n_3 ;
  wire \mult_a_reg[2][8]_i_1_n_4 ;
  wire \mult_a_reg[2][8]_i_1_n_5 ;
  wire \mult_a_reg[2][8]_i_1_n_6 ;
  wire \mult_a_reg[2][8]_i_1_n_7 ;
  wire \mult_a_reg_n_0_[0][0] ;
  wire \mult_a_reg_n_0_[0][10] ;
  wire \mult_a_reg_n_0_[0][11] ;
  wire \mult_a_reg_n_0_[0][12] ;
  wire \mult_a_reg_n_0_[0][13] ;
  wire \mult_a_reg_n_0_[0][14] ;
  wire \mult_a_reg_n_0_[0][15] ;
  wire \mult_a_reg_n_0_[0][17] ;
  wire \mult_a_reg_n_0_[0][1] ;
  wire \mult_a_reg_n_0_[0][2] ;
  wire \mult_a_reg_n_0_[0][3] ;
  wire \mult_a_reg_n_0_[0][4] ;
  wire \mult_a_reg_n_0_[0][5] ;
  wire \mult_a_reg_n_0_[0][6] ;
  wire \mult_a_reg_n_0_[0][7] ;
  wire \mult_a_reg_n_0_[0][8] ;
  wire \mult_a_reg_n_0_[0][9] ;
  wire \mult_a_reg_n_0_[1][0] ;
  wire \mult_a_reg_n_0_[1][10] ;
  wire \mult_a_reg_n_0_[1][11] ;
  wire \mult_a_reg_n_0_[1][12] ;
  wire \mult_a_reg_n_0_[1][13] ;
  wire \mult_a_reg_n_0_[1][14] ;
  wire \mult_a_reg_n_0_[1][15] ;
  wire \mult_a_reg_n_0_[1][17] ;
  wire \mult_a_reg_n_0_[1][1] ;
  wire \mult_a_reg_n_0_[1][2] ;
  wire \mult_a_reg_n_0_[1][3] ;
  wire \mult_a_reg_n_0_[1][4] ;
  wire \mult_a_reg_n_0_[1][5] ;
  wire \mult_a_reg_n_0_[1][6] ;
  wire \mult_a_reg_n_0_[1][7] ;
  wire \mult_a_reg_n_0_[1][8] ;
  wire \mult_a_reg_n_0_[1][9] ;
  wire \mult_a_reg_n_0_[2][0] ;
  wire \mult_a_reg_n_0_[2][10] ;
  wire \mult_a_reg_n_0_[2][11] ;
  wire \mult_a_reg_n_0_[2][12] ;
  wire \mult_a_reg_n_0_[2][13] ;
  wire \mult_a_reg_n_0_[2][14] ;
  wire \mult_a_reg_n_0_[2][15] ;
  wire \mult_a_reg_n_0_[2][17] ;
  wire \mult_a_reg_n_0_[2][1] ;
  wire \mult_a_reg_n_0_[2][2] ;
  wire \mult_a_reg_n_0_[2][3] ;
  wire \mult_a_reg_n_0_[2][4] ;
  wire \mult_a_reg_n_0_[2][5] ;
  wire \mult_a_reg_n_0_[2][6] ;
  wire \mult_a_reg_n_0_[2][7] ;
  wire \mult_a_reg_n_0_[2][8] ;
  wire \mult_a_reg_n_0_[2][9] ;
  wire \mult_gen[0].MULT_MACRO_inst_n_17 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_18 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_19 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_20 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_21 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_22 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_23 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_24 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_25 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_26 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_27 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_28 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_29 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_30 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_31 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_32 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_33 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_34 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_35 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_36 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_37 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_38 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_39 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_40 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_41 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_42 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_43 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_44 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_45 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_46 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_47 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_48 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_49 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_50 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_51 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_52 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_53 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_54 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_55 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_56 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_57 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_58 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_59 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_60 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_61 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_62 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_63 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_64 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_65 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_66 ;
  wire \mult_gen[0].MULT_MACRO_inst_n_67 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_17 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_18 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_19 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_20 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_21 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_22 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_23 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_24 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_25 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_26 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_27 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_28 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_29 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_30 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_31 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_32 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_33 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_34 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_35 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_36 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_37 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_38 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_39 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_40 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_41 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_42 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_43 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_44 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_45 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_46 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_47 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_48 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_49 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_50 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_51 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_52 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_53 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_54 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_55 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_56 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_57 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_58 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_59 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_60 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_61 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_62 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_63 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_64 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_65 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_66 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_67 ;
  wire \mult_gen[1].MULT_MACRO_inst_n_68 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_17 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_18 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_19 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_20 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_21 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_22 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_23 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_24 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_25 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_26 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_27 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_28 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_29 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_30 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_31 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_32 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_33 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_34 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_35 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_36 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_37 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_38 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_39 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_40 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_41 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_42 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_43 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_44 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_45 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_46 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_47 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_48 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_49 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_50 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_51 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_52 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_53 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_54 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_55 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_56 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_57 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_58 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_59 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_60 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_61 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_62 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_63 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_64 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_65 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_66 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_67 ;
  wire \mult_gen[2].MULT_MACRO_inst_n_68 ;
  wire [32:16]\mult_p[0]_0 ;
  wire [32:16]\mult_p[1]_1 ;
  wire [32:16]\mult_p[2]_2 ;
  wire [17:0]p_0_in;
  wire p_0_in_3;
  wire p_0_in_carry__0_i_1_n_0;
  wire p_0_in_carry__0_i_2_n_0;
  wire p_0_in_carry__0_n_3;
  wire p_0_in_carry_i_1_n_0;
  wire p_0_in_carry_i_2_n_0;
  wire p_0_in_carry_i_3_n_0;
  wire p_0_in_carry_i_4_n_0;
  wire p_0_in_carry_n_0;
  wire p_0_in_carry_n_1;
  wire p_0_in_carry_n_2;
  wire p_0_in_carry_n_3;
  wire [2:0]p_0_out;
  wire [17:0]p_1_in;
  wire p_2_in;
  wire p_2_in_carry__0_i_1_n_0;
  wire p_2_in_carry__0_i_2_n_0;
  wire p_2_in_carry__0_n_3;
  wire p_2_in_carry_i_1_n_0;
  wire p_2_in_carry_i_2_n_0;
  wire p_2_in_carry_i_3_n_0;
  wire p_2_in_carry_i_4_n_0;
  wire p_2_in_carry_n_0;
  wire p_2_in_carry_n_1;
  wire p_2_in_carry_n_2;
  wire p_2_in_carry_n_3;
  wire [15:0]\parallel_in_gen.in_data_s_reg[0] ;
  wire [15:0]\parallel_in_gen.in_data_s_reg[1] ;
  wire [15:0]\parallel_in_gen.in_data_s_reg[2] ;
  wire pwm_cnt0_carry__0_i_1_n_0;
  wire pwm_cnt0_carry__0_i_2_n_0;
  wire pwm_cnt0_carry__0_i_3_n_0;
  wire pwm_cnt0_carry__0_i_4_n_0;
  wire pwm_cnt0_carry__0_i_5_n_0;
  wire pwm_cnt0_carry__0_i_6_n_0;
  wire pwm_cnt0_carry__0_n_0;
  wire pwm_cnt0_carry__0_n_1;
  wire pwm_cnt0_carry__0_n_2;
  wire pwm_cnt0_carry__0_n_3;
  wire pwm_cnt0_carry__1_i_1_n_0;
  wire pwm_cnt0_carry__1_i_2_n_0;
  wire pwm_cnt0_carry__1_n_3;
  wire pwm_cnt0_carry_i_1_n_0;
  wire pwm_cnt0_carry_i_2_n_0;
  wire pwm_cnt0_carry_i_3_n_0;
  wire pwm_cnt0_carry_i_4_n_0;
  wire pwm_cnt0_carry_i_5_n_0;
  wire pwm_cnt0_carry_i_6_n_0;
  wire pwm_cnt0_carry_i_7_n_0;
  wire pwm_cnt0_carry_i_8_n_0;
  wire pwm_cnt0_carry_n_0;
  wire pwm_cnt0_carry_n_1;
  wire pwm_cnt0_carry_n_2;
  wire pwm_cnt0_carry_n_3;
  wire \pwm_cnt[0]_i_2_n_0 ;
  wire \pwm_cnt[0]_i_3_n_0 ;
  wire \pwm_cnt[0]_i_4_n_0 ;
  wire \pwm_cnt[0]_i_5_n_0 ;
  wire \pwm_cnt[12]_i_2_n_0 ;
  wire \pwm_cnt[12]_i_3_n_0 ;
  wire \pwm_cnt[12]_i_4_n_0 ;
  wire \pwm_cnt[12]_i_5_n_0 ;
  wire \pwm_cnt[16]_i_2_n_0 ;
  wire \pwm_cnt[16]_i_3_n_0 ;
  wire \pwm_cnt[4]_i_2_n_0 ;
  wire \pwm_cnt[4]_i_3_n_0 ;
  wire \pwm_cnt[4]_i_4_n_0 ;
  wire \pwm_cnt[4]_i_5_n_0 ;
  wire \pwm_cnt[8]_i_2_n_0 ;
  wire \pwm_cnt[8]_i_3_n_0 ;
  wire \pwm_cnt[8]_i_4_n_0 ;
  wire \pwm_cnt[8]_i_5_n_0 ;
  wire [17:0]pwm_cnt_reg;
  wire \pwm_cnt_reg[0]_i_1_n_0 ;
  wire \pwm_cnt_reg[0]_i_1_n_1 ;
  wire \pwm_cnt_reg[0]_i_1_n_2 ;
  wire \pwm_cnt_reg[0]_i_1_n_3 ;
  wire \pwm_cnt_reg[0]_i_1_n_4 ;
  wire \pwm_cnt_reg[0]_i_1_n_5 ;
  wire \pwm_cnt_reg[0]_i_1_n_6 ;
  wire \pwm_cnt_reg[0]_i_1_n_7 ;
  wire \pwm_cnt_reg[12]_i_1_n_0 ;
  wire \pwm_cnt_reg[12]_i_1_n_1 ;
  wire \pwm_cnt_reg[12]_i_1_n_2 ;
  wire \pwm_cnt_reg[12]_i_1_n_3 ;
  wire \pwm_cnt_reg[12]_i_1_n_4 ;
  wire \pwm_cnt_reg[12]_i_1_n_5 ;
  wire \pwm_cnt_reg[12]_i_1_n_6 ;
  wire \pwm_cnt_reg[12]_i_1_n_7 ;
  wire \pwm_cnt_reg[16]_i_1_n_3 ;
  wire \pwm_cnt_reg[16]_i_1_n_6 ;
  wire \pwm_cnt_reg[16]_i_1_n_7 ;
  wire \pwm_cnt_reg[4]_i_1_n_0 ;
  wire \pwm_cnt_reg[4]_i_1_n_1 ;
  wire \pwm_cnt_reg[4]_i_1_n_2 ;
  wire \pwm_cnt_reg[4]_i_1_n_3 ;
  wire \pwm_cnt_reg[4]_i_1_n_4 ;
  wire \pwm_cnt_reg[4]_i_1_n_5 ;
  wire \pwm_cnt_reg[4]_i_1_n_6 ;
  wire \pwm_cnt_reg[4]_i_1_n_7 ;
  wire \pwm_cnt_reg[8]_i_1_n_0 ;
  wire \pwm_cnt_reg[8]_i_1_n_1 ;
  wire \pwm_cnt_reg[8]_i_1_n_2 ;
  wire \pwm_cnt_reg[8]_i_1_n_3 ;
  wire \pwm_cnt_reg[8]_i_1_n_4 ;
  wire \pwm_cnt_reg[8]_i_1_n_5 ;
  wire \pwm_cnt_reg[8]_i_1_n_6 ;
  wire \pwm_cnt_reg[8]_i_1_n_7 ;
  wire [2:0]pwm_h;
  wire [2:0]pwm_l;
  wire s_axis_aclk;
  wire [47:0]s_axis_tdata;
  wire s_axis_tvalid;
  wire [3:0]NLW__carry_O_UNCONNECTED;
  wire [3:2]NLW__carry__0_CO_UNCONNECTED;
  wire [3:0]NLW__carry__0_O_UNCONNECTED;
  wire [3:0]\NLW__inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:1]\NLW__inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__1/i__carry__3_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__1/i__carry__3_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__10/i__carry__3_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__10/i__carry__3_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__11/i__carry_O_UNCONNECTED ;
  wire [3:2]\NLW__inferred__11/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__11/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__12/i__carry__3_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__12/i__carry__3_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__13/i__carry_O_UNCONNECTED ;
  wire [3:2]\NLW__inferred__13/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__13/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__14/i__carry__3_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__14/i__carry__3_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__15/i__carry_O_UNCONNECTED ;
  wire [3:2]\NLW__inferred__15/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__15/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__2/i__carry_O_UNCONNECTED ;
  wire [3:2]\NLW__inferred__2/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__2/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__3/i__carry_O_UNCONNECTED ;
  wire [3:2]\NLW__inferred__3/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__3/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__4/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__4/i__carry__0_O_UNCONNECTED ;
  wire [3:1]\NLW__inferred__4/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__4/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__5/i__carry__3_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__5/i__carry__3_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__6/i__carry_O_UNCONNECTED ;
  wire [3:2]\NLW__inferred__6/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__6/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__7/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__7/i__carry__0_O_UNCONNECTED ;
  wire [3:1]\NLW__inferred__7/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__7/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__8/i__carry__3_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__8/i__carry__3_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__9/i__carry_O_UNCONNECTED ;
  wire [3:2]\NLW__inferred__9/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__9/i__carry__0_O_UNCONNECTED ;
  wire [3:3]\NLW_mult_a_reg[0][17]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_mult_a_reg[1][17]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_mult_a_reg[2][17]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_p_0_in_carry_O_UNCONNECTED;
  wire [3:2]NLW_p_0_in_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_p_0_in_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_p_2_in_carry_O_UNCONNECTED;
  wire [3:2]NLW_p_2_in_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_p_2_in_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_pwm_cnt0_carry_O_UNCONNECTED;
  wire [3:0]NLW_pwm_cnt0_carry__0_O_UNCONNECTED;
  wire [3:1]NLW_pwm_cnt0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_pwm_cnt0_carry__1_O_UNCONNECTED;
  wire [3:1]\NLW_pwm_cnt_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_pwm_cnt_reg[16]_i_1_O_UNCONNECTED ;

  CARRY4 _carry
       (.CI(1'b0),
        .CO({_carry_n_0,_carry_n_1,_carry_n_2,_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW__carry_O_UNCONNECTED[3:0]),
        .S({_carry_i_1_n_0,_carry_i_2_n_0,_carry_i_3_n_0,_carry_i_4_n_0}));
  CARRY4 _carry__0
       (.CI(_carry_n_0),
        .CO({NLW__carry__0_CO_UNCONNECTED[3:2],_carry__0_n_2,_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW__carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,_carry__0_i_1_n_0,_carry__0_i_2_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    _carry__0_i_1
       (.I0(pwm_cnt_reg[17]),
        .I1(pwm_cnt_reg[16]),
        .I2(pwm_cnt_reg[15]),
        .O(_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    _carry__0_i_2
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.l_end_reg[2] ),
        .I2(pwm_cnt_reg[14]),
        .I3(pwm_cnt_reg[13]),
        .O(_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    _carry_i_1
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.l_end_reg[2] ),
        .I2(pwm_cnt_reg[11]),
        .I3(pwm_cnt_reg[10]),
        .O(_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2001)) 
    _carry_i_2
       (.I0(pwm_cnt_reg[6]),
        .I1(pwm_cnt_reg[7]),
        .I2(\bipolar_gen.l_end_reg[2] ),
        .I3(pwm_cnt_reg[8]),
        .O(_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2001)) 
    _carry_i_3
       (.I0(pwm_cnt_reg[3]),
        .I1(pwm_cnt_reg[4]),
        .I2(\bipolar_gen.l_end_reg[2] ),
        .I3(pwm_cnt_reg[5]),
        .O(_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h8001)) 
    _carry_i_4
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.l_end_reg[2] ),
        .I2(pwm_cnt_reg[2]),
        .I3(pwm_cnt_reg[1]),
        .O(_carry_i_4_n_0));
  CARRY4 \_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__0/i__carry_n_0 ,\_inferred__0/i__carry_n_1 ,\_inferred__0/i__carry_n_2 ,\_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({\mult_gen[0].MULT_MACRO_inst_n_48 ,1'b0,\mult_gen[0].MULT_MACRO_inst_n_49 ,\mult_gen[0].MULT_MACRO_inst_n_50 }),
        .O(\NLW__inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({\mult_gen[0].MULT_MACRO_inst_n_23 ,\mult_gen[0].MULT_MACRO_inst_n_24 ,\mult_gen[0].MULT_MACRO_inst_n_25 ,\mult_gen[0].MULT_MACRO_inst_n_26 }));
  CARRY4 \_inferred__0/i__carry__0 
       (.CI(\_inferred__0/i__carry_n_0 ),
        .CO({\_inferred__0/i__carry__0_n_0 ,\_inferred__0/i__carry__0_n_1 ,\_inferred__0/i__carry__0_n_2 ,\_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\mult_gen[0].MULT_MACRO_inst_n_51 ,\mult_gen[0].MULT_MACRO_inst_n_52 ,\mult_gen[0].MULT_MACRO_inst_n_53 ,\mult_gen[0].MULT_MACRO_inst_n_54 }),
        .O(\NLW__inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({\mult_gen[0].MULT_MACRO_inst_n_19 ,\mult_gen[0].MULT_MACRO_inst_n_20 ,\mult_gen[0].MULT_MACRO_inst_n_21 ,\mult_gen[0].MULT_MACRO_inst_n_22 }));
  CARRY4 \_inferred__0/i__carry__1 
       (.CI(\_inferred__0/i__carry__0_n_0 ),
        .CO({\NLW__inferred__0/i__carry__1_CO_UNCONNECTED [3:1],\_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\mult_gen[0].MULT_MACRO_inst_n_17 }),
        .O(\NLW__inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\mult_gen[0].MULT_MACRO_inst_n_18 }));
  CARRY4 \_inferred__1/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__1/i__carry_n_0 ,\_inferred__1/i__carry_n_1 ,\_inferred__1/i__carry_n_2 ,\_inferred__1/i__carry_n_3 }),
        .CYINIT(\mult_p[0]_0 [16]),
        .DI({1'b0,1'b0,\mult_p[0]_0 [18:17]}),
        .O(p_1_in[4:1]),
        .S({\mult_gen[0].MULT_MACRO_inst_n_27 ,\mult_gen[0].MULT_MACRO_inst_n_28 ,\mult_gen[0].MULT_MACRO_inst_n_29 ,\mult_gen[0].MULT_MACRO_inst_n_30 }));
  CARRY4 \_inferred__1/i__carry__0 
       (.CI(\_inferred__1/i__carry_n_0 ),
        .CO({\_inferred__1/i__carry__0_n_0 ,\_inferred__1/i__carry__0_n_1 ,\_inferred__1/i__carry__0_n_2 ,\_inferred__1/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(\mult_p[0]_0 [24:21]),
        .O(p_1_in[8:5]),
        .S({\mult_gen[0].MULT_MACRO_inst_n_55 ,\mult_gen[0].MULT_MACRO_inst_n_56 ,\mult_gen[0].MULT_MACRO_inst_n_57 ,\mult_gen[0].MULT_MACRO_inst_n_58 }));
  CARRY4 \_inferred__1/i__carry__1 
       (.CI(\_inferred__1/i__carry__0_n_0 ),
        .CO({\_inferred__1/i__carry__1_n_0 ,\_inferred__1/i__carry__1_n_1 ,\_inferred__1/i__carry__1_n_2 ,\_inferred__1/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI(\mult_p[0]_0 [28:25]),
        .O(p_1_in[12:9]),
        .S({\mult_gen[0].MULT_MACRO_inst_n_64 ,\mult_gen[0].MULT_MACRO_inst_n_65 ,\mult_gen[0].MULT_MACRO_inst_n_66 ,\mult_gen[0].MULT_MACRO_inst_n_67 }));
  CARRY4 \_inferred__1/i__carry__2 
       (.CI(\_inferred__1/i__carry__1_n_0 ),
        .CO({\_inferred__1/i__carry__2_n_0 ,\_inferred__1/i__carry__2_n_1 ,\_inferred__1/i__carry__2_n_2 ,\_inferred__1/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI(\mult_p[0]_0 [32:29]),
        .O(p_1_in[16:13]),
        .S({\mult_gen[0].MULT_MACRO_inst_n_60 ,\mult_gen[0].MULT_MACRO_inst_n_61 ,\mult_gen[0].MULT_MACRO_inst_n_62 ,\mult_gen[0].MULT_MACRO_inst_n_63 }));
  CARRY4 \_inferred__1/i__carry__3 
       (.CI(\_inferred__1/i__carry__2_n_0 ),
        .CO(\NLW__inferred__1/i__carry__3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__1/i__carry__3_O_UNCONNECTED [3:1],p_1_in[17]}),
        .S({1'b0,1'b0,1'b0,\mult_gen[0].MULT_MACRO_inst_n_59 }));
  CARRY4 \_inferred__10/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__10/i__carry_n_0 ,\_inferred__10/i__carry_n_1 ,\_inferred__10/i__carry_n_2 ,\_inferred__10/i__carry_n_3 }),
        .CYINIT(\mult_p[0]_0 [16]),
        .DI({\mult_p[0]_0 [20:19],1'b0,1'b0}),
        .O({\_inferred__10/i__carry_n_4 ,\_inferred__10/i__carry_n_5 ,\_inferred__10/i__carry_n_6 ,\_inferred__10/i__carry_n_7 }),
        .S({\mult_gen[0].MULT_MACRO_inst_n_31 ,\mult_gen[0].MULT_MACRO_inst_n_32 ,\mult_gen[0].MULT_MACRO_inst_n_33 ,\mult_gen[0].MULT_MACRO_inst_n_34 }));
  CARRY4 \_inferred__10/i__carry__0 
       (.CI(\_inferred__10/i__carry_n_0 ),
        .CO({\_inferred__10/i__carry__0_n_0 ,\_inferred__10/i__carry__0_n_1 ,\_inferred__10/i__carry__0_n_2 ,\_inferred__10/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\_inferred__10/i__carry__0_n_4 ,\_inferred__10/i__carry__0_n_5 ,\_inferred__10/i__carry__0_n_6 ,\_inferred__10/i__carry__0_n_7 }),
        .S({\mult_gen[0].MULT_MACRO_inst_n_35 ,\mult_gen[0].MULT_MACRO_inst_n_36 ,\mult_gen[0].MULT_MACRO_inst_n_37 ,\mult_gen[0].MULT_MACRO_inst_n_38 }));
  CARRY4 \_inferred__10/i__carry__1 
       (.CI(\_inferred__10/i__carry__0_n_0 ),
        .CO({\_inferred__10/i__carry__1_n_0 ,\_inferred__10/i__carry__1_n_1 ,\_inferred__10/i__carry__1_n_2 ,\_inferred__10/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\_inferred__10/i__carry__1_n_4 ,\_inferred__10/i__carry__1_n_5 ,\_inferred__10/i__carry__1_n_6 ,\_inferred__10/i__carry__1_n_7 }),
        .S({\mult_gen[0].MULT_MACRO_inst_n_39 ,\mult_gen[0].MULT_MACRO_inst_n_40 ,\mult_gen[0].MULT_MACRO_inst_n_41 ,\mult_gen[0].MULT_MACRO_inst_n_42 }));
  CARRY4 \_inferred__10/i__carry__2 
       (.CI(\_inferred__10/i__carry__1_n_0 ),
        .CO({\_inferred__10/i__carry__2_n_0 ,\_inferred__10/i__carry__2_n_1 ,\_inferred__10/i__carry__2_n_2 ,\_inferred__10/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\_inferred__10/i__carry__2_n_4 ,\_inferred__10/i__carry__2_n_5 ,\_inferred__10/i__carry__2_n_6 ,\_inferred__10/i__carry__2_n_7 }),
        .S({\mult_gen[0].MULT_MACRO_inst_n_43 ,\mult_gen[0].MULT_MACRO_inst_n_44 ,\mult_gen[0].MULT_MACRO_inst_n_45 ,\mult_gen[0].MULT_MACRO_inst_n_46 }));
  CARRY4 \_inferred__10/i__carry__3 
       (.CI(\_inferred__10/i__carry__2_n_0 ),
        .CO(\NLW__inferred__10/i__carry__3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__10/i__carry__3_O_UNCONNECTED [3:1],\_inferred__10/i__carry__3_n_7 }),
        .S({1'b0,1'b0,1'b0,\mult_gen[0].MULT_MACRO_inst_n_47 }));
  CARRY4 \_inferred__11/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__11/i__carry_n_0 ,\_inferred__11/i__carry_n_1 ,\_inferred__11/i__carry_n_2 ,\_inferred__11/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__11/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1__7_n_0,i__carry_i_2__5_n_0,i__carry_i_3__6_n_0,i__carry_i_4__5_n_0}));
  CARRY4 \_inferred__11/i__carry__0 
       (.CI(\_inferred__11/i__carry_n_0 ),
        .CO({\NLW__inferred__11/i__carry__0_CO_UNCONNECTED [3:2],p_0_out[0],\_inferred__11/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__11/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry__0_i_1__5_n_0,i__carry__0_i_2__6_n_0}));
  CARRY4 \_inferred__12/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__12/i__carry_n_0 ,\_inferred__12/i__carry_n_1 ,\_inferred__12/i__carry_n_2 ,\_inferred__12/i__carry_n_3 }),
        .CYINIT(\mult_p[1]_1 [16]),
        .DI({\mult_p[1]_1 [20:19],1'b0,1'b0}),
        .O({\_inferred__12/i__carry_n_4 ,\_inferred__12/i__carry_n_5 ,\_inferred__12/i__carry_n_6 ,\_inferred__12/i__carry_n_7 }),
        .S({\mult_gen[1].MULT_MACRO_inst_n_31 ,\mult_gen[1].MULT_MACRO_inst_n_32 ,\mult_gen[1].MULT_MACRO_inst_n_33 ,\mult_gen[1].MULT_MACRO_inst_n_34 }));
  CARRY4 \_inferred__12/i__carry__0 
       (.CI(\_inferred__12/i__carry_n_0 ),
        .CO({\_inferred__12/i__carry__0_n_0 ,\_inferred__12/i__carry__0_n_1 ,\_inferred__12/i__carry__0_n_2 ,\_inferred__12/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\_inferred__12/i__carry__0_n_4 ,\_inferred__12/i__carry__0_n_5 ,\_inferred__12/i__carry__0_n_6 ,\_inferred__12/i__carry__0_n_7 }),
        .S({\mult_gen[1].MULT_MACRO_inst_n_35 ,\mult_gen[1].MULT_MACRO_inst_n_36 ,\mult_gen[1].MULT_MACRO_inst_n_37 ,\mult_gen[1].MULT_MACRO_inst_n_38 }));
  CARRY4 \_inferred__12/i__carry__1 
       (.CI(\_inferred__12/i__carry__0_n_0 ),
        .CO({\_inferred__12/i__carry__1_n_0 ,\_inferred__12/i__carry__1_n_1 ,\_inferred__12/i__carry__1_n_2 ,\_inferred__12/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\_inferred__12/i__carry__1_n_4 ,\_inferred__12/i__carry__1_n_5 ,\_inferred__12/i__carry__1_n_6 ,\_inferred__12/i__carry__1_n_7 }),
        .S({\mult_gen[1].MULT_MACRO_inst_n_39 ,\mult_gen[1].MULT_MACRO_inst_n_40 ,\mult_gen[1].MULT_MACRO_inst_n_41 ,\mult_gen[1].MULT_MACRO_inst_n_42 }));
  CARRY4 \_inferred__12/i__carry__2 
       (.CI(\_inferred__12/i__carry__1_n_0 ),
        .CO({\_inferred__12/i__carry__2_n_0 ,\_inferred__12/i__carry__2_n_1 ,\_inferred__12/i__carry__2_n_2 ,\_inferred__12/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\_inferred__12/i__carry__2_n_4 ,\_inferred__12/i__carry__2_n_5 ,\_inferred__12/i__carry__2_n_6 ,\_inferred__12/i__carry__2_n_7 }),
        .S({\mult_gen[1].MULT_MACRO_inst_n_43 ,\mult_gen[1].MULT_MACRO_inst_n_44 ,\mult_gen[1].MULT_MACRO_inst_n_45 ,\mult_gen[1].MULT_MACRO_inst_n_46 }));
  CARRY4 \_inferred__12/i__carry__3 
       (.CI(\_inferred__12/i__carry__2_n_0 ),
        .CO(\NLW__inferred__12/i__carry__3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__12/i__carry__3_O_UNCONNECTED [3:1],\_inferred__12/i__carry__3_n_7 }),
        .S({1'b0,1'b0,1'b0,\mult_gen[1].MULT_MACRO_inst_n_47 }));
  CARRY4 \_inferred__13/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__13/i__carry_n_0 ,\_inferred__13/i__carry_n_1 ,\_inferred__13/i__carry_n_2 ,\_inferred__13/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__13/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1__9_n_0,i__carry_i_2__6_n_0,i__carry_i_3__7_n_0,i__carry_i_4__6_n_0}));
  CARRY4 \_inferred__13/i__carry__0 
       (.CI(\_inferred__13/i__carry_n_0 ),
        .CO({\NLW__inferred__13/i__carry__0_CO_UNCONNECTED [3:2],p_0_out[1],\_inferred__13/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__13/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry__0_i_1__6_n_0,i__carry__0_i_2__7_n_0}));
  CARRY4 \_inferred__14/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__14/i__carry_n_0 ,\_inferred__14/i__carry_n_1 ,\_inferred__14/i__carry_n_2 ,\_inferred__14/i__carry_n_3 }),
        .CYINIT(\mult_p[2]_2 [16]),
        .DI({\mult_p[2]_2 [20:19],1'b0,1'b0}),
        .O({\_inferred__14/i__carry_n_4 ,\_inferred__14/i__carry_n_5 ,\_inferred__14/i__carry_n_6 ,\_inferred__14/i__carry_n_7 }),
        .S({\mult_gen[2].MULT_MACRO_inst_n_31 ,\mult_gen[2].MULT_MACRO_inst_n_32 ,\mult_gen[2].MULT_MACRO_inst_n_33 ,\mult_gen[2].MULT_MACRO_inst_n_34 }));
  CARRY4 \_inferred__14/i__carry__0 
       (.CI(\_inferred__14/i__carry_n_0 ),
        .CO({\_inferred__14/i__carry__0_n_0 ,\_inferred__14/i__carry__0_n_1 ,\_inferred__14/i__carry__0_n_2 ,\_inferred__14/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\_inferred__14/i__carry__0_n_4 ,\_inferred__14/i__carry__0_n_5 ,\_inferred__14/i__carry__0_n_6 ,\_inferred__14/i__carry__0_n_7 }),
        .S({\mult_gen[2].MULT_MACRO_inst_n_35 ,\mult_gen[2].MULT_MACRO_inst_n_36 ,\mult_gen[2].MULT_MACRO_inst_n_37 ,\mult_gen[2].MULT_MACRO_inst_n_38 }));
  CARRY4 \_inferred__14/i__carry__1 
       (.CI(\_inferred__14/i__carry__0_n_0 ),
        .CO({\_inferred__14/i__carry__1_n_0 ,\_inferred__14/i__carry__1_n_1 ,\_inferred__14/i__carry__1_n_2 ,\_inferred__14/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\_inferred__14/i__carry__1_n_4 ,\_inferred__14/i__carry__1_n_5 ,\_inferred__14/i__carry__1_n_6 ,\_inferred__14/i__carry__1_n_7 }),
        .S({\mult_gen[2].MULT_MACRO_inst_n_39 ,\mult_gen[2].MULT_MACRO_inst_n_40 ,\mult_gen[2].MULT_MACRO_inst_n_41 ,\mult_gen[2].MULT_MACRO_inst_n_42 }));
  CARRY4 \_inferred__14/i__carry__2 
       (.CI(\_inferred__14/i__carry__1_n_0 ),
        .CO({\_inferred__14/i__carry__2_n_0 ,\_inferred__14/i__carry__2_n_1 ,\_inferred__14/i__carry__2_n_2 ,\_inferred__14/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\_inferred__14/i__carry__2_n_4 ,\_inferred__14/i__carry__2_n_5 ,\_inferred__14/i__carry__2_n_6 ,\_inferred__14/i__carry__2_n_7 }),
        .S({\mult_gen[2].MULT_MACRO_inst_n_43 ,\mult_gen[2].MULT_MACRO_inst_n_44 ,\mult_gen[2].MULT_MACRO_inst_n_45 ,\mult_gen[2].MULT_MACRO_inst_n_46 }));
  CARRY4 \_inferred__14/i__carry__3 
       (.CI(\_inferred__14/i__carry__2_n_0 ),
        .CO(\NLW__inferred__14/i__carry__3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__14/i__carry__3_O_UNCONNECTED [3:1],\_inferred__14/i__carry__3_n_7 }),
        .S({1'b0,1'b0,1'b0,\mult_gen[2].MULT_MACRO_inst_n_47 }));
  CARRY4 \_inferred__15/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__15/i__carry_n_0 ,\_inferred__15/i__carry_n_1 ,\_inferred__15/i__carry_n_2 ,\_inferred__15/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__15/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1__11_n_0,i__carry_i_2__7_n_0,i__carry_i_3__8_n_0,i__carry_i_4__7_n_0}));
  CARRY4 \_inferred__15/i__carry__0 
       (.CI(\_inferred__15/i__carry_n_0 ),
        .CO({\NLW__inferred__15/i__carry__0_CO_UNCONNECTED [3:2],p_0_out[2],\_inferred__15/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__15/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry__0_i_1__7_n_0,i__carry__0_i_2__8_n_0}));
  CARRY4 \_inferred__2/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__2/i__carry_n_0 ,\_inferred__2/i__carry_n_1 ,\_inferred__2/i__carry_n_2 ,\_inferred__2/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__2/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1__0_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0}));
  CARRY4 \_inferred__2/i__carry__0 
       (.CI(\_inferred__2/i__carry_n_0 ),
        .CO({\NLW__inferred__2/i__carry__0_CO_UNCONNECTED [3:2],\_inferred__2/i__carry__0_n_2 ,\_inferred__2/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__2/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0}));
  CARRY4 \_inferred__3/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__3/i__carry_n_0 ,\_inferred__3/i__carry_n_1 ,\_inferred__3/i__carry_n_2 ,\_inferred__3/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__3/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1__1_n_0,i__carry_i_2__11_n_0,i__carry_i_3__1_n_0,i__carry_i_4__8_n_0}));
  CARRY4 \_inferred__3/i__carry__0 
       (.CI(\_inferred__3/i__carry_n_0 ),
        .CO({\NLW__inferred__3/i__carry__0_CO_UNCONNECTED [3:2],\_inferred__3/i__carry__0_n_2 ,\_inferred__3/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__3/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry__0_i_1__11_n_0,i__carry__0_i_2__1_n_0}));
  CARRY4 \_inferred__4/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__4/i__carry_n_0 ,\_inferred__4/i__carry_n_1 ,\_inferred__4/i__carry_n_2 ,\_inferred__4/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({\mult_gen[1].MULT_MACRO_inst_n_48 ,1'b0,\mult_gen[1].MULT_MACRO_inst_n_49 ,\mult_gen[1].MULT_MACRO_inst_n_50 }),
        .O(\NLW__inferred__4/i__carry_O_UNCONNECTED [3:0]),
        .S({\mult_gen[1].MULT_MACRO_inst_n_23 ,\mult_gen[1].MULT_MACRO_inst_n_24 ,\mult_gen[1].MULT_MACRO_inst_n_25 ,\mult_gen[1].MULT_MACRO_inst_n_26 }));
  CARRY4 \_inferred__4/i__carry__0 
       (.CI(\_inferred__4/i__carry_n_0 ),
        .CO({\_inferred__4/i__carry__0_n_0 ,\_inferred__4/i__carry__0_n_1 ,\_inferred__4/i__carry__0_n_2 ,\_inferred__4/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\mult_gen[1].MULT_MACRO_inst_n_51 ,\mult_gen[1].MULT_MACRO_inst_n_52 ,\mult_gen[1].MULT_MACRO_inst_n_53 ,\mult_gen[1].MULT_MACRO_inst_n_54 }),
        .O(\NLW__inferred__4/i__carry__0_O_UNCONNECTED [3:0]),
        .S({\mult_gen[1].MULT_MACRO_inst_n_19 ,\mult_gen[1].MULT_MACRO_inst_n_20 ,\mult_gen[1].MULT_MACRO_inst_n_21 ,\mult_gen[1].MULT_MACRO_inst_n_22 }));
  CARRY4 \_inferred__4/i__carry__1 
       (.CI(\_inferred__4/i__carry__0_n_0 ),
        .CO({\NLW__inferred__4/i__carry__1_CO_UNCONNECTED [3:1],\_inferred__4/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\mult_gen[1].MULT_MACRO_inst_n_17 }),
        .O(\NLW__inferred__4/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\mult_gen[1].MULT_MACRO_inst_n_18 }));
  CARRY4 \_inferred__5/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__5/i__carry_n_0 ,\_inferred__5/i__carry_n_1 ,\_inferred__5/i__carry_n_2 ,\_inferred__5/i__carry_n_3 }),
        .CYINIT(\mult_p[1]_1 [16]),
        .DI({1'b0,1'b0,\mult_p[1]_1 [18:17]}),
        .O({\_inferred__5/i__carry_n_4 ,\_inferred__5/i__carry_n_5 ,\_inferred__5/i__carry_n_6 ,\_inferred__5/i__carry_n_7 }),
        .S({\mult_gen[1].MULT_MACRO_inst_n_27 ,\mult_gen[1].MULT_MACRO_inst_n_28 ,\mult_gen[1].MULT_MACRO_inst_n_29 ,\mult_gen[1].MULT_MACRO_inst_n_30 }));
  CARRY4 \_inferred__5/i__carry__0 
       (.CI(\_inferred__5/i__carry_n_0 ),
        .CO({\_inferred__5/i__carry__0_n_0 ,\_inferred__5/i__carry__0_n_1 ,\_inferred__5/i__carry__0_n_2 ,\_inferred__5/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(\mult_p[1]_1 [24:21]),
        .O({\_inferred__5/i__carry__0_n_4 ,\_inferred__5/i__carry__0_n_5 ,\_inferred__5/i__carry__0_n_6 ,\_inferred__5/i__carry__0_n_7 }),
        .S({\mult_gen[1].MULT_MACRO_inst_n_55 ,\mult_gen[1].MULT_MACRO_inst_n_56 ,\mult_gen[1].MULT_MACRO_inst_n_57 ,\mult_gen[1].MULT_MACRO_inst_n_58 }));
  CARRY4 \_inferred__5/i__carry__1 
       (.CI(\_inferred__5/i__carry__0_n_0 ),
        .CO({\_inferred__5/i__carry__1_n_0 ,\_inferred__5/i__carry__1_n_1 ,\_inferred__5/i__carry__1_n_2 ,\_inferred__5/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI(\mult_p[1]_1 [28:25]),
        .O({\_inferred__5/i__carry__1_n_4 ,\_inferred__5/i__carry__1_n_5 ,\_inferred__5/i__carry__1_n_6 ,\_inferred__5/i__carry__1_n_7 }),
        .S({\mult_gen[1].MULT_MACRO_inst_n_64 ,\mult_gen[1].MULT_MACRO_inst_n_65 ,\mult_gen[1].MULT_MACRO_inst_n_66 ,\mult_gen[1].MULT_MACRO_inst_n_67 }));
  CARRY4 \_inferred__5/i__carry__2 
       (.CI(\_inferred__5/i__carry__1_n_0 ),
        .CO({\_inferred__5/i__carry__2_n_0 ,\_inferred__5/i__carry__2_n_1 ,\_inferred__5/i__carry__2_n_2 ,\_inferred__5/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI(\mult_p[1]_1 [32:29]),
        .O({\_inferred__5/i__carry__2_n_4 ,\_inferred__5/i__carry__2_n_5 ,\_inferred__5/i__carry__2_n_6 ,\_inferred__5/i__carry__2_n_7 }),
        .S({\mult_gen[1].MULT_MACRO_inst_n_60 ,\mult_gen[1].MULT_MACRO_inst_n_61 ,\mult_gen[1].MULT_MACRO_inst_n_62 ,\mult_gen[1].MULT_MACRO_inst_n_63 }));
  CARRY4 \_inferred__5/i__carry__3 
       (.CI(\_inferred__5/i__carry__2_n_0 ),
        .CO(\NLW__inferred__5/i__carry__3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__5/i__carry__3_O_UNCONNECTED [3:1],\_inferred__5/i__carry__3_n_7 }),
        .S({1'b0,1'b0,1'b0,\mult_gen[1].MULT_MACRO_inst_n_59 }));
  CARRY4 \_inferred__6/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__6/i__carry_n_0 ,\_inferred__6/i__carry_n_1 ,\_inferred__6/i__carry_n_2 ,\_inferred__6/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__6/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1__3_n_0,i__carry_i_2__2_n_0,i__carry_i_3__3_n_0,i__carry_i_4__2_n_0}));
  CARRY4 \_inferred__6/i__carry__0 
       (.CI(\_inferred__6/i__carry_n_0 ),
        .CO({\NLW__inferred__6/i__carry__0_CO_UNCONNECTED [3:2],\_inferred__6/i__carry__0_n_2 ,\_inferred__6/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__6/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry__0_i_1__2_n_0,i__carry__0_i_2__3_n_0}));
  CARRY4 \_inferred__7/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__7/i__carry_n_0 ,\_inferred__7/i__carry_n_1 ,\_inferred__7/i__carry_n_2 ,\_inferred__7/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({\mult_gen[2].MULT_MACRO_inst_n_48 ,1'b0,\mult_gen[2].MULT_MACRO_inst_n_49 ,\mult_gen[2].MULT_MACRO_inst_n_50 }),
        .O(\NLW__inferred__7/i__carry_O_UNCONNECTED [3:0]),
        .S({\mult_gen[2].MULT_MACRO_inst_n_23 ,\mult_gen[2].MULT_MACRO_inst_n_24 ,\mult_gen[2].MULT_MACRO_inst_n_25 ,\mult_gen[2].MULT_MACRO_inst_n_26 }));
  CARRY4 \_inferred__7/i__carry__0 
       (.CI(\_inferred__7/i__carry_n_0 ),
        .CO({\_inferred__7/i__carry__0_n_0 ,\_inferred__7/i__carry__0_n_1 ,\_inferred__7/i__carry__0_n_2 ,\_inferred__7/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\mult_gen[2].MULT_MACRO_inst_n_51 ,\mult_gen[2].MULT_MACRO_inst_n_52 ,\mult_gen[2].MULT_MACRO_inst_n_53 ,\mult_gen[2].MULT_MACRO_inst_n_54 }),
        .O(\NLW__inferred__7/i__carry__0_O_UNCONNECTED [3:0]),
        .S({\mult_gen[2].MULT_MACRO_inst_n_19 ,\mult_gen[2].MULT_MACRO_inst_n_20 ,\mult_gen[2].MULT_MACRO_inst_n_21 ,\mult_gen[2].MULT_MACRO_inst_n_22 }));
  CARRY4 \_inferred__7/i__carry__1 
       (.CI(\_inferred__7/i__carry__0_n_0 ),
        .CO({\NLW__inferred__7/i__carry__1_CO_UNCONNECTED [3:1],\_inferred__7/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\mult_gen[2].MULT_MACRO_inst_n_17 }),
        .O(\NLW__inferred__7/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\mult_gen[2].MULT_MACRO_inst_n_18 }));
  CARRY4 \_inferred__8/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__8/i__carry_n_0 ,\_inferred__8/i__carry_n_1 ,\_inferred__8/i__carry_n_2 ,\_inferred__8/i__carry_n_3 }),
        .CYINIT(\mult_p[2]_2 [16]),
        .DI({1'b0,1'b0,\mult_p[2]_2 [18:17]}),
        .O({\_inferred__8/i__carry_n_4 ,\_inferred__8/i__carry_n_5 ,\_inferred__8/i__carry_n_6 ,\_inferred__8/i__carry_n_7 }),
        .S({\mult_gen[2].MULT_MACRO_inst_n_27 ,\mult_gen[2].MULT_MACRO_inst_n_28 ,\mult_gen[2].MULT_MACRO_inst_n_29 ,\mult_gen[2].MULT_MACRO_inst_n_30 }));
  CARRY4 \_inferred__8/i__carry__0 
       (.CI(\_inferred__8/i__carry_n_0 ),
        .CO({\_inferred__8/i__carry__0_n_0 ,\_inferred__8/i__carry__0_n_1 ,\_inferred__8/i__carry__0_n_2 ,\_inferred__8/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(\mult_p[2]_2 [24:21]),
        .O({\_inferred__8/i__carry__0_n_4 ,\_inferred__8/i__carry__0_n_5 ,\_inferred__8/i__carry__0_n_6 ,\_inferred__8/i__carry__0_n_7 }),
        .S({\mult_gen[2].MULT_MACRO_inst_n_55 ,\mult_gen[2].MULT_MACRO_inst_n_56 ,\mult_gen[2].MULT_MACRO_inst_n_57 ,\mult_gen[2].MULT_MACRO_inst_n_58 }));
  CARRY4 \_inferred__8/i__carry__1 
       (.CI(\_inferred__8/i__carry__0_n_0 ),
        .CO({\_inferred__8/i__carry__1_n_0 ,\_inferred__8/i__carry__1_n_1 ,\_inferred__8/i__carry__1_n_2 ,\_inferred__8/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI(\mult_p[2]_2 [28:25]),
        .O({\_inferred__8/i__carry__1_n_4 ,\_inferred__8/i__carry__1_n_5 ,\_inferred__8/i__carry__1_n_6 ,\_inferred__8/i__carry__1_n_7 }),
        .S({\mult_gen[2].MULT_MACRO_inst_n_64 ,\mult_gen[2].MULT_MACRO_inst_n_65 ,\mult_gen[2].MULT_MACRO_inst_n_66 ,\mult_gen[2].MULT_MACRO_inst_n_67 }));
  CARRY4 \_inferred__8/i__carry__2 
       (.CI(\_inferred__8/i__carry__1_n_0 ),
        .CO({\_inferred__8/i__carry__2_n_0 ,\_inferred__8/i__carry__2_n_1 ,\_inferred__8/i__carry__2_n_2 ,\_inferred__8/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI(\mult_p[2]_2 [32:29]),
        .O({\_inferred__8/i__carry__2_n_4 ,\_inferred__8/i__carry__2_n_5 ,\_inferred__8/i__carry__2_n_6 ,\_inferred__8/i__carry__2_n_7 }),
        .S({\mult_gen[2].MULT_MACRO_inst_n_60 ,\mult_gen[2].MULT_MACRO_inst_n_61 ,\mult_gen[2].MULT_MACRO_inst_n_62 ,\mult_gen[2].MULT_MACRO_inst_n_63 }));
  CARRY4 \_inferred__8/i__carry__3 
       (.CI(\_inferred__8/i__carry__2_n_0 ),
        .CO(\NLW__inferred__8/i__carry__3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__8/i__carry__3_O_UNCONNECTED [3:1],\_inferred__8/i__carry__3_n_7 }),
        .S({1'b0,1'b0,1'b0,\mult_gen[2].MULT_MACRO_inst_n_59 }));
  CARRY4 \_inferred__9/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__9/i__carry_n_0 ,\_inferred__9/i__carry_n_1 ,\_inferred__9/i__carry_n_2 ,\_inferred__9/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__9/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1__5_n_0,i__carry_i_2__4_n_0,i__carry_i_3__5_n_0,i__carry_i_4__4_n_0}));
  CARRY4 \_inferred__9/i__carry__0 
       (.CI(\_inferred__9/i__carry_n_0 ),
        .CO({\NLW__inferred__9/i__carry__0_CO_UNCONNECTED [3:2],\_inferred__9/i__carry__0_n_2 ,\_inferred__9/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW__inferred__9/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry__0_i_1__4_n_0,i__carry__0_i_2__5_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    \bipolar_gen.h_end[0][17]_i_1 
       (.I0(pwm_cnt0_carry__1_n_3),
        .I1(\_inferred__0/i__carry__1_n_3 ),
        .O(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \bipolar_gen.h_end[1][17]_i_1 
       (.I0(pwm_cnt0_carry__1_n_3),
        .I1(\_inferred__4/i__carry__1_n_3 ),
        .O(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \bipolar_gen.h_end[2][17]_i_1 
       (.I0(pwm_cnt0_carry__1_n_3),
        .I1(\_inferred__7/i__carry__1_n_3 ),
        .O(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][0] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[0]),
        .Q(\bipolar_gen.h_end_reg[0] [0]),
        .S(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][10] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[10]),
        .Q(\bipolar_gen.h_end_reg[0] [10]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][11] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[11]),
        .Q(\bipolar_gen.h_end_reg[0] [11]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][12] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[12]),
        .Q(\bipolar_gen.h_end_reg[0] [12]),
        .S(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][13] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[13]),
        .Q(\bipolar_gen.h_end_reg[0] [13]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][14] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[14]),
        .Q(\bipolar_gen.h_end_reg[0] [14]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][15] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[15]),
        .Q(\bipolar_gen.h_end_reg[0] [15]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][16] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[16]),
        .Q(\bipolar_gen.h_end_reg[0] [16]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][17] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[17]),
        .Q(\bipolar_gen.h_end_reg[0] [17]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][1] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[1]),
        .Q(\bipolar_gen.h_end_reg[0] [1]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][2] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[2]),
        .Q(\bipolar_gen.h_end_reg[0] [2]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][3] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[3]),
        .Q(\bipolar_gen.h_end_reg[0] [3]),
        .S(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][4] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[4]),
        .Q(\bipolar_gen.h_end_reg[0] [4]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][5] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[5]),
        .Q(\bipolar_gen.h_end_reg[0] [5]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][6] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[6]),
        .Q(\bipolar_gen.h_end_reg[0] [6]),
        .R(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][7] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[7]),
        .Q(\bipolar_gen.h_end_reg[0] [7]),
        .S(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][8] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[8]),
        .Q(\bipolar_gen.h_end_reg[0] [8]),
        .S(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[0][9] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[9]),
        .Q(\bipolar_gen.h_end_reg[0] [9]),
        .S(\bipolar_gen.h_end[0][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][0] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\mult_gen[1].MULT_MACRO_inst_n_68 ),
        .Q(\bipolar_gen.h_end_reg[1] [0]),
        .S(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][10] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__1_n_6 ),
        .Q(\bipolar_gen.h_end_reg[1] [10]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][11] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__1_n_5 ),
        .Q(\bipolar_gen.h_end_reg[1] [11]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][12] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__1_n_4 ),
        .Q(\bipolar_gen.h_end_reg[1] [12]),
        .S(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][13] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__2_n_7 ),
        .Q(\bipolar_gen.h_end_reg[1] [13]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][14] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__2_n_6 ),
        .Q(\bipolar_gen.h_end_reg[1] [14]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][15] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__2_n_5 ),
        .Q(\bipolar_gen.h_end_reg[1] [15]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][16] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__2_n_4 ),
        .Q(\bipolar_gen.h_end_reg[1] [16]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][17] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__3_n_7 ),
        .Q(\bipolar_gen.h_end_reg[1] [17]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][1] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry_n_7 ),
        .Q(\bipolar_gen.h_end_reg[1] [1]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][2] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry_n_6 ),
        .Q(\bipolar_gen.h_end_reg[1] [2]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][3] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry_n_5 ),
        .Q(\bipolar_gen.h_end_reg[1] [3]),
        .S(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][4] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry_n_4 ),
        .Q(\bipolar_gen.h_end_reg[1] [4]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][5] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__0_n_7 ),
        .Q(\bipolar_gen.h_end_reg[1] [5]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][6] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__0_n_6 ),
        .Q(\bipolar_gen.h_end_reg[1] [6]),
        .R(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][7] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__0_n_5 ),
        .Q(\bipolar_gen.h_end_reg[1] [7]),
        .S(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][8] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__0_n_4 ),
        .Q(\bipolar_gen.h_end_reg[1] [8]),
        .S(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[1][9] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__5/i__carry__1_n_7 ),
        .Q(\bipolar_gen.h_end_reg[1] [9]),
        .S(\bipolar_gen.h_end[1][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][0] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\mult_gen[2].MULT_MACRO_inst_n_68 ),
        .Q(\bipolar_gen.h_end_reg[2] [0]),
        .S(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][10] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__1_n_6 ),
        .Q(\bipolar_gen.h_end_reg[2] [10]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][11] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__1_n_5 ),
        .Q(\bipolar_gen.h_end_reg[2] [11]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][12] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__1_n_4 ),
        .Q(\bipolar_gen.h_end_reg[2] [12]),
        .S(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][13] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__2_n_7 ),
        .Q(\bipolar_gen.h_end_reg[2] [13]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][14] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__2_n_6 ),
        .Q(\bipolar_gen.h_end_reg[2] [14]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][15] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__2_n_5 ),
        .Q(\bipolar_gen.h_end_reg[2] [15]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][16] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__2_n_4 ),
        .Q(\bipolar_gen.h_end_reg[2] [16]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][17] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__3_n_7 ),
        .Q(\bipolar_gen.h_end_reg[2] [17]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][1] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry_n_7 ),
        .Q(\bipolar_gen.h_end_reg[2] [1]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][2] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry_n_6 ),
        .Q(\bipolar_gen.h_end_reg[2] [2]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][3] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry_n_5 ),
        .Q(\bipolar_gen.h_end_reg[2] [3]),
        .S(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][4] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry_n_4 ),
        .Q(\bipolar_gen.h_end_reg[2] [4]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][5] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__0_n_7 ),
        .Q(\bipolar_gen.h_end_reg[2] [5]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][6] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__0_n_6 ),
        .Q(\bipolar_gen.h_end_reg[2] [6]),
        .R(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][7] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__0_n_5 ),
        .Q(\bipolar_gen.h_end_reg[2] [7]),
        .S(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][8] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__0_n_4 ),
        .Q(\bipolar_gen.h_end_reg[2] [8]),
        .S(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_end_reg[2][9] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__8/i__carry__1_n_7 ),
        .Q(\bipolar_gen.h_end_reg[2] [9]),
        .S(\bipolar_gen.h_end[2][17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h3A)) 
    \bipolar_gen.h_start[0][12]_i_1 
       (.I0(\bipolar_gen.h_start_reg[0] [12]),
        .I1(\_inferred__0/i__carry__1_n_3 ),
        .I2(pwm_cnt0_carry__1_n_3),
        .O(\bipolar_gen.h_start[0][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \bipolar_gen.h_start[0][4]_i_1 
       (.I0(\bipolar_gen.h_start_reg[0] [4]),
        .I1(\_inferred__0/i__carry__1_n_3 ),
        .I2(pwm_cnt0_carry__1_n_3),
        .O(\bipolar_gen.h_start[0][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h3A)) 
    \bipolar_gen.h_start[1][12]_i_1 
       (.I0(\bipolar_gen.h_start_reg[1] [12]),
        .I1(\_inferred__4/i__carry__1_n_3 ),
        .I2(pwm_cnt0_carry__1_n_3),
        .O(\bipolar_gen.h_start[1][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \bipolar_gen.h_start[1][4]_i_1 
       (.I0(\bipolar_gen.h_start_reg[1] [4]),
        .I1(\_inferred__4/i__carry__1_n_3 ),
        .I2(pwm_cnt0_carry__1_n_3),
        .O(\bipolar_gen.h_start[1][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h3A)) 
    \bipolar_gen.h_start[2][12]_i_1 
       (.I0(\bipolar_gen.h_start_reg[2] [12]),
        .I1(\_inferred__7/i__carry__1_n_3 ),
        .I2(pwm_cnt0_carry__1_n_3),
        .O(\bipolar_gen.h_start[2][12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \bipolar_gen.h_start[2][3]_i_1 
       (.I0(pwm_cnt0_carry__1_n_3),
        .I1(\bipolar_gen.h_start_reg[2] [3]),
        .O(\bipolar_gen.h_start[2][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \bipolar_gen.h_start[2][4]_i_1 
       (.I0(\bipolar_gen.h_start_reg[2] [4]),
        .I1(\_inferred__7/i__carry__1_n_3 ),
        .I2(pwm_cnt0_carry__1_n_3),
        .O(\bipolar_gen.h_start[2][4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_start_reg[0][12] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.h_start[0][12]_i_1_n_0 ),
        .Q(\bipolar_gen.h_start_reg[0] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_start_reg[0][4] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.h_start[0][4]_i_1_n_0 ),
        .Q(\bipolar_gen.h_start_reg[0] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_start_reg[1][12] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.h_start[1][12]_i_1_n_0 ),
        .Q(\bipolar_gen.h_start_reg[1] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_start_reg[1][4] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.h_start[1][4]_i_1_n_0 ),
        .Q(\bipolar_gen.h_start_reg[1] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_start_reg[2][12] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.h_start[2][12]_i_1_n_0 ),
        .Q(\bipolar_gen.h_start_reg[2] [12]),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_start_reg[2][3] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.h_start[2][3]_i_1_n_0 ),
        .Q(\bipolar_gen.h_start_reg[2] [3]),
        .S(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.h_start_reg[2][4] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.h_start[2][4]_i_1_n_0 ),
        .Q(\bipolar_gen.h_start_reg[2] [4]),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_end_reg[2][12] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.l_end_reg[2] ),
        .Q(\bipolar_gen.l_end_reg[2] ),
        .S(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][0] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(p_1_in[0]),
        .Q(\bipolar_gen.l_start_reg[0] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][10] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__1_n_6 ),
        .Q(\bipolar_gen.l_start_reg[0] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][11] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__1_n_5 ),
        .Q(\bipolar_gen.l_start_reg[0] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][12] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__1_n_4 ),
        .Q(\bipolar_gen.l_start_reg[0] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][13] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__2_n_7 ),
        .Q(\bipolar_gen.l_start_reg[0] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][14] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__2_n_6 ),
        .Q(\bipolar_gen.l_start_reg[0] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][15] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__2_n_5 ),
        .Q(\bipolar_gen.l_start_reg[0] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][16] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__2_n_4 ),
        .Q(\bipolar_gen.l_start_reg[0] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][17] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__3_n_7 ),
        .Q(\bipolar_gen.l_start_reg[0] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][1] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry_n_7 ),
        .Q(\bipolar_gen.l_start_reg[0] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][2] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry_n_6 ),
        .Q(\bipolar_gen.l_start_reg[0] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][3] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry_n_5 ),
        .Q(\bipolar_gen.l_start_reg[0] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][4] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry_n_4 ),
        .Q(\bipolar_gen.l_start_reg[0] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][5] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__0_n_7 ),
        .Q(\bipolar_gen.l_start_reg[0] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][6] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__0_n_6 ),
        .Q(\bipolar_gen.l_start_reg[0] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][7] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__0_n_5 ),
        .Q(\bipolar_gen.l_start_reg[0] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][8] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__0_n_4 ),
        .Q(\bipolar_gen.l_start_reg[0] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[0][9] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__10/i__carry__1_n_7 ),
        .Q(\bipolar_gen.l_start_reg[0] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][0] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\mult_gen[1].MULT_MACRO_inst_n_68 ),
        .Q(\bipolar_gen.l_start_reg[1] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][10] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__1_n_6 ),
        .Q(\bipolar_gen.l_start_reg[1] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][11] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__1_n_5 ),
        .Q(\bipolar_gen.l_start_reg[1] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][12] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__1_n_4 ),
        .Q(\bipolar_gen.l_start_reg[1] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][13] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__2_n_7 ),
        .Q(\bipolar_gen.l_start_reg[1] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][14] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__2_n_6 ),
        .Q(\bipolar_gen.l_start_reg[1] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][15] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__2_n_5 ),
        .Q(\bipolar_gen.l_start_reg[1] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][16] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__2_n_4 ),
        .Q(\bipolar_gen.l_start_reg[1] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][17] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__3_n_7 ),
        .Q(\bipolar_gen.l_start_reg[1] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][1] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry_n_7 ),
        .Q(\bipolar_gen.l_start_reg[1] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][2] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry_n_6 ),
        .Q(\bipolar_gen.l_start_reg[1] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][3] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry_n_5 ),
        .Q(\bipolar_gen.l_start_reg[1] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][4] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry_n_4 ),
        .Q(\bipolar_gen.l_start_reg[1] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][5] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__0_n_7 ),
        .Q(\bipolar_gen.l_start_reg[1] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][6] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__0_n_6 ),
        .Q(\bipolar_gen.l_start_reg[1] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][7] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__0_n_5 ),
        .Q(\bipolar_gen.l_start_reg[1] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][8] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__0_n_4 ),
        .Q(\bipolar_gen.l_start_reg[1] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[1][9] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__12/i__carry__1_n_7 ),
        .Q(\bipolar_gen.l_start_reg[1] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][0] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\mult_gen[2].MULT_MACRO_inst_n_68 ),
        .Q(\bipolar_gen.l_start_reg[2] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][10] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__1_n_6 ),
        .Q(\bipolar_gen.l_start_reg[2] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][11] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__1_n_5 ),
        .Q(\bipolar_gen.l_start_reg[2] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][12] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__1_n_4 ),
        .Q(\bipolar_gen.l_start_reg[2] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][13] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__2_n_7 ),
        .Q(\bipolar_gen.l_start_reg[2] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][14] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__2_n_6 ),
        .Q(\bipolar_gen.l_start_reg[2] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][15] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__2_n_5 ),
        .Q(\bipolar_gen.l_start_reg[2] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][16] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__2_n_4 ),
        .Q(\bipolar_gen.l_start_reg[2] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][17] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__3_n_7 ),
        .Q(\bipolar_gen.l_start_reg[2] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][1] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry_n_7 ),
        .Q(\bipolar_gen.l_start_reg[2] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][2] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry_n_6 ),
        .Q(\bipolar_gen.l_start_reg[2] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][3] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry_n_5 ),
        .Q(\bipolar_gen.l_start_reg[2] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][4] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry_n_4 ),
        .Q(\bipolar_gen.l_start_reg[2] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][5] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__0_n_7 ),
        .Q(\bipolar_gen.l_start_reg[2] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][6] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__0_n_6 ),
        .Q(\bipolar_gen.l_start_reg[2] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][7] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__0_n_5 ),
        .Q(\bipolar_gen.l_start_reg[2] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][8] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__0_n_4 ),
        .Q(\bipolar_gen.l_start_reg[2] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.l_start_reg[2][9] 
       (.C(s_axis_aclk),
        .CE(pwm_cnt0_carry__1_n_3),
        .D(\_inferred__14/i__carry__1_n_7 ),
        .Q(\bipolar_gen.l_start_reg[2] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0000000E)) 
    \bipolar_gen.pwm_h_drv[0]_i_1 
       (.I0(pwm_h[0]),
        .I1(\_inferred__3/i__carry__0_n_2 ),
        .I2(p_0_out[0]),
        .I3(\_inferred__2/i__carry__0_n_2 ),
        .I4(_carry__0_n_2),
        .O(\bipolar_gen.pwm_h_drv[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000000E)) 
    \bipolar_gen.pwm_h_drv[1]_i_1 
       (.I0(pwm_h[1]),
        .I1(p_2_in),
        .I2(p_0_out[1]),
        .I3(\_inferred__6/i__carry__0_n_2 ),
        .I4(_carry__0_n_2),
        .O(\bipolar_gen.pwm_h_drv[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000000E)) 
    \bipolar_gen.pwm_h_drv[2]_i_1 
       (.I0(pwm_h[2]),
        .I1(p_0_in_3),
        .I2(p_0_out[2]),
        .I3(\_inferred__9/i__carry__0_n_2 ),
        .I4(_carry__0_n_2),
        .O(\bipolar_gen.pwm_h_drv[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.pwm_h_drv_reg[0] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.pwm_h_drv[0]_i_1_n_0 ),
        .Q(pwm_h[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.pwm_h_drv_reg[1] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.pwm_h_drv[1]_i_1_n_0 ),
        .Q(pwm_h[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.pwm_h_drv_reg[2] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.pwm_h_drv[2]_i_1_n_0 ),
        .Q(pwm_h[2]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0000FF02)) 
    \bipolar_gen.pwm_l_drv[0]_i_1 
       (.I0(pwm_l[0]),
        .I1(\_inferred__2/i__carry__0_n_2 ),
        .I2(\_inferred__3/i__carry__0_n_2 ),
        .I3(p_0_out[0]),
        .I4(_carry__0_n_2),
        .O(\bipolar_gen.pwm_l_drv[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000FF02)) 
    \bipolar_gen.pwm_l_drv[1]_i_1 
       (.I0(pwm_l[1]),
        .I1(\_inferred__6/i__carry__0_n_2 ),
        .I2(p_2_in),
        .I3(p_0_out[1]),
        .I4(_carry__0_n_2),
        .O(\bipolar_gen.pwm_l_drv[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000FF02)) 
    \bipolar_gen.pwm_l_drv[2]_i_1 
       (.I0(pwm_l[2]),
        .I1(\_inferred__9/i__carry__0_n_2 ),
        .I2(p_0_in_3),
        .I3(p_0_out[2]),
        .I4(_carry__0_n_2),
        .O(\bipolar_gen.pwm_l_drv[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.pwm_l_drv_reg[0] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.pwm_l_drv[0]_i_1_n_0 ),
        .Q(pwm_l[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.pwm_l_drv_reg[1] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.pwm_l_drv[1]_i_1_n_0 ),
        .Q(pwm_l[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bipolar_gen.pwm_l_drv_reg[2] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\bipolar_gen.pwm_l_drv[2]_i_1_n_0 ),
        .Q(pwm_l[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_1__0
       (.I0(pwm_cnt_reg[15]),
        .I1(\bipolar_gen.h_end_reg[0] [15]),
        .I2(\bipolar_gen.h_end_reg[0] [17]),
        .I3(pwm_cnt_reg[17]),
        .I4(\bipolar_gen.h_end_reg[0] [16]),
        .I5(pwm_cnt_reg[16]),
        .O(i__carry__0_i_1__0_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    i__carry__0_i_1__11
       (.I0(pwm_cnt_reg[17]),
        .I1(pwm_cnt_reg[16]),
        .I2(pwm_cnt_reg[15]),
        .O(i__carry__0_i_1__11_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_1__2
       (.I0(pwm_cnt_reg[15]),
        .I1(\bipolar_gen.h_end_reg[1] [15]),
        .I2(\bipolar_gen.h_end_reg[1] [17]),
        .I3(pwm_cnt_reg[17]),
        .I4(\bipolar_gen.h_end_reg[1] [16]),
        .I5(pwm_cnt_reg[16]),
        .O(i__carry__0_i_1__2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_1__4
       (.I0(pwm_cnt_reg[15]),
        .I1(\bipolar_gen.h_end_reg[2] [15]),
        .I2(\bipolar_gen.h_end_reg[2] [17]),
        .I3(pwm_cnt_reg[17]),
        .I4(\bipolar_gen.h_end_reg[2] [16]),
        .I5(pwm_cnt_reg[16]),
        .O(i__carry__0_i_1__4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_1__5
       (.I0(pwm_cnt_reg[15]),
        .I1(\bipolar_gen.l_start_reg[0] [15]),
        .I2(\bipolar_gen.l_start_reg[0] [17]),
        .I3(pwm_cnt_reg[17]),
        .I4(\bipolar_gen.l_start_reg[0] [16]),
        .I5(pwm_cnt_reg[16]),
        .O(i__carry__0_i_1__5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_1__6
       (.I0(pwm_cnt_reg[15]),
        .I1(\bipolar_gen.l_start_reg[1] [15]),
        .I2(\bipolar_gen.l_start_reg[1] [17]),
        .I3(pwm_cnt_reg[17]),
        .I4(\bipolar_gen.l_start_reg[1] [16]),
        .I5(pwm_cnt_reg[16]),
        .O(i__carry__0_i_1__6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_1__7
       (.I0(pwm_cnt_reg[15]),
        .I1(\bipolar_gen.l_start_reg[2] [15]),
        .I2(\bipolar_gen.l_start_reg[2] [17]),
        .I3(pwm_cnt_reg[17]),
        .I4(\bipolar_gen.l_start_reg[2] [16]),
        .I5(pwm_cnt_reg[16]),
        .O(i__carry__0_i_1__7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_2__0
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.h_end_reg[0] [12]),
        .I2(\bipolar_gen.h_end_reg[0] [14]),
        .I3(pwm_cnt_reg[14]),
        .I4(\bipolar_gen.h_end_reg[0] [13]),
        .I5(pwm_cnt_reg[13]),
        .O(i__carry__0_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    i__carry__0_i_2__1
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.h_start_reg[0] [12]),
        .I2(pwm_cnt_reg[14]),
        .I3(pwm_cnt_reg[13]),
        .O(i__carry__0_i_2__1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_2__3
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.h_end_reg[1] [12]),
        .I2(\bipolar_gen.h_end_reg[1] [14]),
        .I3(pwm_cnt_reg[14]),
        .I4(\bipolar_gen.h_end_reg[1] [13]),
        .I5(pwm_cnt_reg[13]),
        .O(i__carry__0_i_2__3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_2__5
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.h_end_reg[2] [12]),
        .I2(\bipolar_gen.h_end_reg[2] [14]),
        .I3(pwm_cnt_reg[14]),
        .I4(\bipolar_gen.h_end_reg[2] [13]),
        .I5(pwm_cnt_reg[13]),
        .O(i__carry__0_i_2__5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_2__6
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.l_start_reg[0] [12]),
        .I2(\bipolar_gen.l_start_reg[0] [14]),
        .I3(pwm_cnt_reg[14]),
        .I4(\bipolar_gen.l_start_reg[0] [13]),
        .I5(pwm_cnt_reg[13]),
        .O(i__carry__0_i_2__6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_2__7
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.l_start_reg[1] [12]),
        .I2(\bipolar_gen.l_start_reg[1] [14]),
        .I3(pwm_cnt_reg[14]),
        .I4(\bipolar_gen.l_start_reg[1] [13]),
        .I5(pwm_cnt_reg[13]),
        .O(i__carry__0_i_2__7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_2__8
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.l_start_reg[2] [12]),
        .I2(\bipolar_gen.l_start_reg[2] [14]),
        .I3(pwm_cnt_reg[14]),
        .I4(\bipolar_gen.l_start_reg[2] [13]),
        .I5(pwm_cnt_reg[13]),
        .O(i__carry__0_i_2__8_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1__0
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.h_end_reg[0] [9]),
        .I2(\bipolar_gen.h_end_reg[0] [11]),
        .I3(pwm_cnt_reg[11]),
        .I4(\bipolar_gen.h_end_reg[0] [10]),
        .I5(pwm_cnt_reg[10]),
        .O(i__carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    i__carry_i_1__1
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.h_start_reg[0] [12]),
        .I2(pwm_cnt_reg[11]),
        .I3(pwm_cnt_reg[10]),
        .O(i__carry_i_1__1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1__11
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.l_start_reg[2] [9]),
        .I2(\bipolar_gen.l_start_reg[2] [11]),
        .I3(pwm_cnt_reg[11]),
        .I4(\bipolar_gen.l_start_reg[2] [10]),
        .I5(pwm_cnt_reg[10]),
        .O(i__carry_i_1__11_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1__3
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.h_end_reg[1] [9]),
        .I2(\bipolar_gen.h_end_reg[1] [11]),
        .I3(pwm_cnt_reg[11]),
        .I4(\bipolar_gen.h_end_reg[1] [10]),
        .I5(pwm_cnt_reg[10]),
        .O(i__carry_i_1__3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1__5
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.h_end_reg[2] [9]),
        .I2(\bipolar_gen.h_end_reg[2] [11]),
        .I3(pwm_cnt_reg[11]),
        .I4(\bipolar_gen.h_end_reg[2] [10]),
        .I5(pwm_cnt_reg[10]),
        .O(i__carry_i_1__5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1__7
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.l_start_reg[0] [9]),
        .I2(\bipolar_gen.l_start_reg[0] [11]),
        .I3(pwm_cnt_reg[11]),
        .I4(\bipolar_gen.l_start_reg[0] [10]),
        .I5(pwm_cnt_reg[10]),
        .O(i__carry_i_1__7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1__9
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.l_start_reg[1] [9]),
        .I2(\bipolar_gen.l_start_reg[1] [11]),
        .I3(pwm_cnt_reg[11]),
        .I4(\bipolar_gen.l_start_reg[1] [10]),
        .I5(pwm_cnt_reg[10]),
        .O(i__carry_i_1__9_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2__0
       (.I0(pwm_cnt_reg[6]),
        .I1(\bipolar_gen.h_end_reg[0] [6]),
        .I2(\bipolar_gen.h_end_reg[0] [8]),
        .I3(pwm_cnt_reg[8]),
        .I4(\bipolar_gen.h_end_reg[0] [7]),
        .I5(pwm_cnt_reg[7]),
        .O(i__carry_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h0081)) 
    i__carry_i_2__11
       (.I0(\bipolar_gen.h_start_reg[0] [12]),
        .I1(pwm_cnt_reg[8]),
        .I2(pwm_cnt_reg[7]),
        .I3(pwm_cnt_reg[6]),
        .O(i__carry_i_2__11_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2__2
       (.I0(pwm_cnt_reg[6]),
        .I1(\bipolar_gen.h_end_reg[1] [6]),
        .I2(\bipolar_gen.h_end_reg[1] [8]),
        .I3(pwm_cnt_reg[8]),
        .I4(\bipolar_gen.h_end_reg[1] [7]),
        .I5(pwm_cnt_reg[7]),
        .O(i__carry_i_2__2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2__4
       (.I0(pwm_cnt_reg[6]),
        .I1(\bipolar_gen.h_end_reg[2] [6]),
        .I2(\bipolar_gen.h_end_reg[2] [8]),
        .I3(pwm_cnt_reg[8]),
        .I4(\bipolar_gen.h_end_reg[2] [7]),
        .I5(pwm_cnt_reg[7]),
        .O(i__carry_i_2__4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2__5
       (.I0(pwm_cnt_reg[6]),
        .I1(\bipolar_gen.l_start_reg[0] [6]),
        .I2(\bipolar_gen.l_start_reg[0] [8]),
        .I3(pwm_cnt_reg[8]),
        .I4(\bipolar_gen.l_start_reg[0] [7]),
        .I5(pwm_cnt_reg[7]),
        .O(i__carry_i_2__5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2__6
       (.I0(pwm_cnt_reg[6]),
        .I1(\bipolar_gen.l_start_reg[1] [6]),
        .I2(\bipolar_gen.l_start_reg[1] [8]),
        .I3(pwm_cnt_reg[8]),
        .I4(\bipolar_gen.l_start_reg[1] [7]),
        .I5(pwm_cnt_reg[7]),
        .O(i__carry_i_2__6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2__7
       (.I0(pwm_cnt_reg[6]),
        .I1(\bipolar_gen.l_start_reg[2] [6]),
        .I2(\bipolar_gen.l_start_reg[2] [8]),
        .I3(pwm_cnt_reg[8]),
        .I4(\bipolar_gen.l_start_reg[2] [7]),
        .I5(pwm_cnt_reg[7]),
        .O(i__carry_i_2__7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3__0
       (.I0(pwm_cnt_reg[3]),
        .I1(\bipolar_gen.h_end_reg[0] [3]),
        .I2(\bipolar_gen.h_end_reg[0] [5]),
        .I3(pwm_cnt_reg[5]),
        .I4(\bipolar_gen.h_end_reg[0] [4]),
        .I5(pwm_cnt_reg[4]),
        .O(i__carry_i_3__0_n_0));
  LUT5 #(
    .INIT(32'h09000009)) 
    i__carry_i_3__1
       (.I0(pwm_cnt_reg[3]),
        .I1(\bipolar_gen.h_start_reg[2] [3]),
        .I2(pwm_cnt_reg[5]),
        .I3(\bipolar_gen.h_start_reg[0] [4]),
        .I4(pwm_cnt_reg[4]),
        .O(i__carry_i_3__1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3__3
       (.I0(pwm_cnt_reg[3]),
        .I1(\bipolar_gen.h_end_reg[1] [3]),
        .I2(\bipolar_gen.h_end_reg[1] [5]),
        .I3(pwm_cnt_reg[5]),
        .I4(\bipolar_gen.h_end_reg[1] [4]),
        .I5(pwm_cnt_reg[4]),
        .O(i__carry_i_3__3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3__5
       (.I0(pwm_cnt_reg[3]),
        .I1(\bipolar_gen.h_end_reg[2] [3]),
        .I2(\bipolar_gen.h_end_reg[2] [5]),
        .I3(pwm_cnt_reg[5]),
        .I4(\bipolar_gen.h_end_reg[2] [4]),
        .I5(pwm_cnt_reg[4]),
        .O(i__carry_i_3__5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3__6
       (.I0(pwm_cnt_reg[3]),
        .I1(\bipolar_gen.l_start_reg[0] [3]),
        .I2(\bipolar_gen.l_start_reg[0] [5]),
        .I3(pwm_cnt_reg[5]),
        .I4(\bipolar_gen.l_start_reg[0] [4]),
        .I5(pwm_cnt_reg[4]),
        .O(i__carry_i_3__6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3__7
       (.I0(pwm_cnt_reg[3]),
        .I1(\bipolar_gen.l_start_reg[1] [3]),
        .I2(\bipolar_gen.l_start_reg[1] [5]),
        .I3(pwm_cnt_reg[5]),
        .I4(\bipolar_gen.l_start_reg[1] [4]),
        .I5(pwm_cnt_reg[4]),
        .O(i__carry_i_3__7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3__8
       (.I0(pwm_cnt_reg[3]),
        .I1(\bipolar_gen.l_start_reg[2] [3]),
        .I2(\bipolar_gen.l_start_reg[2] [5]),
        .I3(pwm_cnt_reg[5]),
        .I4(\bipolar_gen.l_start_reg[2] [4]),
        .I5(pwm_cnt_reg[4]),
        .O(i__carry_i_3__8_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4__0
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.h_end_reg[0] [0]),
        .I2(\bipolar_gen.h_end_reg[0] [2]),
        .I3(pwm_cnt_reg[2]),
        .I4(\bipolar_gen.h_end_reg[0] [1]),
        .I5(pwm_cnt_reg[1]),
        .O(i__carry_i_4__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4__2
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.h_end_reg[1] [0]),
        .I2(\bipolar_gen.h_end_reg[1] [2]),
        .I3(pwm_cnt_reg[2]),
        .I4(\bipolar_gen.h_end_reg[1] [1]),
        .I5(pwm_cnt_reg[1]),
        .O(i__carry_i_4__2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4__4
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.h_end_reg[2] [0]),
        .I2(\bipolar_gen.h_end_reg[2] [2]),
        .I3(pwm_cnt_reg[2]),
        .I4(\bipolar_gen.h_end_reg[2] [1]),
        .I5(pwm_cnt_reg[1]),
        .O(i__carry_i_4__4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4__5
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.l_start_reg[0] [0]),
        .I2(\bipolar_gen.l_start_reg[0] [2]),
        .I3(pwm_cnt_reg[2]),
        .I4(\bipolar_gen.l_start_reg[0] [1]),
        .I5(pwm_cnt_reg[1]),
        .O(i__carry_i_4__5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4__6
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.l_start_reg[1] [0]),
        .I2(\bipolar_gen.l_start_reg[1] [2]),
        .I3(pwm_cnt_reg[2]),
        .I4(\bipolar_gen.l_start_reg[1] [1]),
        .I5(pwm_cnt_reg[1]),
        .O(i__carry_i_4__6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4__7
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.l_start_reg[2] [0]),
        .I2(\bipolar_gen.l_start_reg[2] [2]),
        .I3(pwm_cnt_reg[2]),
        .I4(\bipolar_gen.l_start_reg[2] [1]),
        .I5(pwm_cnt_reg[1]),
        .O(i__carry_i_4__7_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    i__carry_i_4__8
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.h_start_reg[2] [3]),
        .I2(pwm_cnt_reg[2]),
        .I3(pwm_cnt_reg[1]),
        .O(i__carry_i_4__8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][0]_i_1 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [0]),
        .O(p_0_in[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][12]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [12]),
        .O(\mult_a[0][12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][12]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [11]),
        .O(\mult_a[0][12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][12]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [10]),
        .O(\mult_a[0][12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][12]_i_5 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [9]),
        .O(\mult_a[0][12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \mult_a[0][17]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [15]),
        .O(\mult_a[0][17]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][17]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [14]),
        .O(\mult_a[0][17]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][17]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [13]),
        .O(\mult_a[0][17]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][4]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [4]),
        .O(\mult_a[0][4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][4]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [3]),
        .O(\mult_a[0][4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][4]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [2]),
        .O(\mult_a[0][4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][4]_i_5 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [1]),
        .O(\mult_a[0][4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][8]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [8]),
        .O(\mult_a[0][8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][8]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [7]),
        .O(\mult_a[0][8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][8]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [6]),
        .O(\mult_a[0][8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[0][8]_i_5 
       (.I0(\parallel_in_gen.in_data_s_reg[0] [5]),
        .O(\mult_a[0][8]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][0]_i_1 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [0]),
        .O(\mult_a[1][0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][12]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [12]),
        .O(\mult_a[1][12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][12]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [11]),
        .O(\mult_a[1][12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][12]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [10]),
        .O(\mult_a[1][12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][12]_i_5 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [9]),
        .O(\mult_a[1][12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \mult_a[1][17]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [15]),
        .O(\mult_a[1][17]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][17]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [14]),
        .O(\mult_a[1][17]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][17]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [13]),
        .O(\mult_a[1][17]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][4]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [4]),
        .O(\mult_a[1][4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][4]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [3]),
        .O(\mult_a[1][4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][4]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [2]),
        .O(\mult_a[1][4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][4]_i_5 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [1]),
        .O(\mult_a[1][4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][8]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [8]),
        .O(\mult_a[1][8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][8]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [7]),
        .O(\mult_a[1][8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][8]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [6]),
        .O(\mult_a[1][8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[1][8]_i_5 
       (.I0(\parallel_in_gen.in_data_s_reg[1] [5]),
        .O(\mult_a[1][8]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][0]_i_1 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [0]),
        .O(\mult_a[2][0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][12]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [12]),
        .O(\mult_a[2][12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][12]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [11]),
        .O(\mult_a[2][12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][12]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [10]),
        .O(\mult_a[2][12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][12]_i_5 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [9]),
        .O(\mult_a[2][12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \mult_a[2][17]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [15]),
        .O(\mult_a[2][17]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][17]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [14]),
        .O(\mult_a[2][17]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][17]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [13]),
        .O(\mult_a[2][17]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][4]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [4]),
        .O(\mult_a[2][4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][4]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [3]),
        .O(\mult_a[2][4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][4]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [2]),
        .O(\mult_a[2][4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][4]_i_5 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [1]),
        .O(\mult_a[2][4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][8]_i_2 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [8]),
        .O(\mult_a[2][8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][8]_i_3 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [7]),
        .O(\mult_a[2][8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][8]_i_4 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [6]),
        .O(\mult_a[2][8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \mult_a[2][8]_i_5 
       (.I0(\parallel_in_gen.in_data_s_reg[2] [5]),
        .O(\mult_a[2][8]_i_5_n_0 ));
  FDRE \mult_a_reg[0][0] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(\mult_a_reg_n_0_[0][0] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][10] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[10]),
        .Q(\mult_a_reg_n_0_[0][10] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][11] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[11]),
        .Q(\mult_a_reg_n_0_[0][11] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][12] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[12]),
        .Q(\mult_a_reg_n_0_[0][12] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[0][12]_i_1 
       (.CI(\mult_a_reg[0][8]_i_1_n_0 ),
        .CO({\mult_a_reg[0][12]_i_1_n_0 ,\mult_a_reg[0][12]_i_1_n_1 ,\mult_a_reg[0][12]_i_1_n_2 ,\mult_a_reg[0][12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(\parallel_in_gen.in_data_s_reg[0] [12:9]),
        .O(p_0_in[12:9]),
        .S({\mult_a[0][12]_i_2_n_0 ,\mult_a[0][12]_i_3_n_0 ,\mult_a[0][12]_i_4_n_0 ,\mult_a[0][12]_i_5_n_0 }));
  FDRE \mult_a_reg[0][13] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[13]),
        .Q(\mult_a_reg_n_0_[0][13] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][14] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[14]),
        .Q(\mult_a_reg_n_0_[0][14] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][15] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[15]),
        .Q(\mult_a_reg_n_0_[0][15] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][17] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[17]),
        .Q(\mult_a_reg_n_0_[0][17] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[0][17]_i_1 
       (.CI(\mult_a_reg[0][12]_i_1_n_0 ),
        .CO({\NLW_mult_a_reg[0][17]_i_1_CO_UNCONNECTED [3],\mult_a_reg[0][17]_i_1_n_1 ,\mult_a_reg[0][17]_i_1_n_2 ,\mult_a_reg[0][17]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,\parallel_in_gen.in_data_s_reg[0] [14:13]}),
        .O({p_0_in[17],p_0_in[15:13]}),
        .S({1'b1,\mult_a[0][17]_i_2_n_0 ,\mult_a[0][17]_i_3_n_0 ,\mult_a[0][17]_i_4_n_0 }));
  FDRE \mult_a_reg[0][1] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(\mult_a_reg_n_0_[0][1] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][2] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(\mult_a_reg_n_0_[0][2] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][3] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(\mult_a_reg_n_0_[0][3] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][4] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(\mult_a_reg_n_0_[0][4] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[0][4]_i_1 
       (.CI(1'b0),
        .CO({\mult_a_reg[0][4]_i_1_n_0 ,\mult_a_reg[0][4]_i_1_n_1 ,\mult_a_reg[0][4]_i_1_n_2 ,\mult_a_reg[0][4]_i_1_n_3 }),
        .CYINIT(\parallel_in_gen.in_data_s_reg[0] [0]),
        .DI(\parallel_in_gen.in_data_s_reg[0] [4:1]),
        .O(p_0_in[4:1]),
        .S({\mult_a[0][4]_i_2_n_0 ,\mult_a[0][4]_i_3_n_0 ,\mult_a[0][4]_i_4_n_0 ,\mult_a[0][4]_i_5_n_0 }));
  FDRE \mult_a_reg[0][5] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(\mult_a_reg_n_0_[0][5] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][6] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[6]),
        .Q(\mult_a_reg_n_0_[0][6] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][7] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[7]),
        .Q(\mult_a_reg_n_0_[0][7] ),
        .R(1'b0));
  FDRE \mult_a_reg[0][8] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[8]),
        .Q(\mult_a_reg_n_0_[0][8] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[0][8]_i_1 
       (.CI(\mult_a_reg[0][4]_i_1_n_0 ),
        .CO({\mult_a_reg[0][8]_i_1_n_0 ,\mult_a_reg[0][8]_i_1_n_1 ,\mult_a_reg[0][8]_i_1_n_2 ,\mult_a_reg[0][8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(\parallel_in_gen.in_data_s_reg[0] [8:5]),
        .O(p_0_in[8:5]),
        .S({\mult_a[0][8]_i_2_n_0 ,\mult_a[0][8]_i_3_n_0 ,\mult_a[0][8]_i_4_n_0 ,\mult_a[0][8]_i_5_n_0 }));
  FDRE \mult_a_reg[0][9] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(p_0_in[9]),
        .Q(\mult_a_reg_n_0_[0][9] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][0] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a[1][0]_i_1_n_0 ),
        .Q(\mult_a_reg_n_0_[1][0] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][10] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][12]_i_1_n_6 ),
        .Q(\mult_a_reg_n_0_[1][10] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][11] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][12]_i_1_n_5 ),
        .Q(\mult_a_reg_n_0_[1][11] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][12] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][12]_i_1_n_4 ),
        .Q(\mult_a_reg_n_0_[1][12] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[1][12]_i_1 
       (.CI(\mult_a_reg[1][8]_i_1_n_0 ),
        .CO({\mult_a_reg[1][12]_i_1_n_0 ,\mult_a_reg[1][12]_i_1_n_1 ,\mult_a_reg[1][12]_i_1_n_2 ,\mult_a_reg[1][12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(\parallel_in_gen.in_data_s_reg[1] [12:9]),
        .O({\mult_a_reg[1][12]_i_1_n_4 ,\mult_a_reg[1][12]_i_1_n_5 ,\mult_a_reg[1][12]_i_1_n_6 ,\mult_a_reg[1][12]_i_1_n_7 }),
        .S({\mult_a[1][12]_i_2_n_0 ,\mult_a[1][12]_i_3_n_0 ,\mult_a[1][12]_i_4_n_0 ,\mult_a[1][12]_i_5_n_0 }));
  FDRE \mult_a_reg[1][13] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][17]_i_1_n_7 ),
        .Q(\mult_a_reg_n_0_[1][13] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][14] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][17]_i_1_n_6 ),
        .Q(\mult_a_reg_n_0_[1][14] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][15] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][17]_i_1_n_5 ),
        .Q(\mult_a_reg_n_0_[1][15] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][17] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][17]_i_1_n_4 ),
        .Q(\mult_a_reg_n_0_[1][17] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[1][17]_i_1 
       (.CI(\mult_a_reg[1][12]_i_1_n_0 ),
        .CO({\NLW_mult_a_reg[1][17]_i_1_CO_UNCONNECTED [3],\mult_a_reg[1][17]_i_1_n_1 ,\mult_a_reg[1][17]_i_1_n_2 ,\mult_a_reg[1][17]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,\parallel_in_gen.in_data_s_reg[1] [14:13]}),
        .O({\mult_a_reg[1][17]_i_1_n_4 ,\mult_a_reg[1][17]_i_1_n_5 ,\mult_a_reg[1][17]_i_1_n_6 ,\mult_a_reg[1][17]_i_1_n_7 }),
        .S({1'b1,\mult_a[1][17]_i_2_n_0 ,\mult_a[1][17]_i_3_n_0 ,\mult_a[1][17]_i_4_n_0 }));
  FDRE \mult_a_reg[1][1] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][4]_i_1_n_7 ),
        .Q(\mult_a_reg_n_0_[1][1] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][2] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][4]_i_1_n_6 ),
        .Q(\mult_a_reg_n_0_[1][2] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][3] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][4]_i_1_n_5 ),
        .Q(\mult_a_reg_n_0_[1][3] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][4] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][4]_i_1_n_4 ),
        .Q(\mult_a_reg_n_0_[1][4] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[1][4]_i_1 
       (.CI(1'b0),
        .CO({\mult_a_reg[1][4]_i_1_n_0 ,\mult_a_reg[1][4]_i_1_n_1 ,\mult_a_reg[1][4]_i_1_n_2 ,\mult_a_reg[1][4]_i_1_n_3 }),
        .CYINIT(\parallel_in_gen.in_data_s_reg[1] [0]),
        .DI(\parallel_in_gen.in_data_s_reg[1] [4:1]),
        .O({\mult_a_reg[1][4]_i_1_n_4 ,\mult_a_reg[1][4]_i_1_n_5 ,\mult_a_reg[1][4]_i_1_n_6 ,\mult_a_reg[1][4]_i_1_n_7 }),
        .S({\mult_a[1][4]_i_2_n_0 ,\mult_a[1][4]_i_3_n_0 ,\mult_a[1][4]_i_4_n_0 ,\mult_a[1][4]_i_5_n_0 }));
  FDRE \mult_a_reg[1][5] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][8]_i_1_n_7 ),
        .Q(\mult_a_reg_n_0_[1][5] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][6] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][8]_i_1_n_6 ),
        .Q(\mult_a_reg_n_0_[1][6] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][7] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][8]_i_1_n_5 ),
        .Q(\mult_a_reg_n_0_[1][7] ),
        .R(1'b0));
  FDRE \mult_a_reg[1][8] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][8]_i_1_n_4 ),
        .Q(\mult_a_reg_n_0_[1][8] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[1][8]_i_1 
       (.CI(\mult_a_reg[1][4]_i_1_n_0 ),
        .CO({\mult_a_reg[1][8]_i_1_n_0 ,\mult_a_reg[1][8]_i_1_n_1 ,\mult_a_reg[1][8]_i_1_n_2 ,\mult_a_reg[1][8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(\parallel_in_gen.in_data_s_reg[1] [8:5]),
        .O({\mult_a_reg[1][8]_i_1_n_4 ,\mult_a_reg[1][8]_i_1_n_5 ,\mult_a_reg[1][8]_i_1_n_6 ,\mult_a_reg[1][8]_i_1_n_7 }),
        .S({\mult_a[1][8]_i_2_n_0 ,\mult_a[1][8]_i_3_n_0 ,\mult_a[1][8]_i_4_n_0 ,\mult_a[1][8]_i_5_n_0 }));
  FDRE \mult_a_reg[1][9] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[1][12]_i_1_n_7 ),
        .Q(\mult_a_reg_n_0_[1][9] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][0] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a[2][0]_i_1_n_0 ),
        .Q(\mult_a_reg_n_0_[2][0] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][10] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][12]_i_1_n_6 ),
        .Q(\mult_a_reg_n_0_[2][10] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][11] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][12]_i_1_n_5 ),
        .Q(\mult_a_reg_n_0_[2][11] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][12] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][12]_i_1_n_4 ),
        .Q(\mult_a_reg_n_0_[2][12] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[2][12]_i_1 
       (.CI(\mult_a_reg[2][8]_i_1_n_0 ),
        .CO({\mult_a_reg[2][12]_i_1_n_0 ,\mult_a_reg[2][12]_i_1_n_1 ,\mult_a_reg[2][12]_i_1_n_2 ,\mult_a_reg[2][12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(\parallel_in_gen.in_data_s_reg[2] [12:9]),
        .O({\mult_a_reg[2][12]_i_1_n_4 ,\mult_a_reg[2][12]_i_1_n_5 ,\mult_a_reg[2][12]_i_1_n_6 ,\mult_a_reg[2][12]_i_1_n_7 }),
        .S({\mult_a[2][12]_i_2_n_0 ,\mult_a[2][12]_i_3_n_0 ,\mult_a[2][12]_i_4_n_0 ,\mult_a[2][12]_i_5_n_0 }));
  FDRE \mult_a_reg[2][13] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][17]_i_1_n_7 ),
        .Q(\mult_a_reg_n_0_[2][13] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][14] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][17]_i_1_n_6 ),
        .Q(\mult_a_reg_n_0_[2][14] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][15] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][17]_i_1_n_5 ),
        .Q(\mult_a_reg_n_0_[2][15] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][17] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][17]_i_1_n_4 ),
        .Q(\mult_a_reg_n_0_[2][17] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[2][17]_i_1 
       (.CI(\mult_a_reg[2][12]_i_1_n_0 ),
        .CO({\NLW_mult_a_reg[2][17]_i_1_CO_UNCONNECTED [3],\mult_a_reg[2][17]_i_1_n_1 ,\mult_a_reg[2][17]_i_1_n_2 ,\mult_a_reg[2][17]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,\parallel_in_gen.in_data_s_reg[2] [14:13]}),
        .O({\mult_a_reg[2][17]_i_1_n_4 ,\mult_a_reg[2][17]_i_1_n_5 ,\mult_a_reg[2][17]_i_1_n_6 ,\mult_a_reg[2][17]_i_1_n_7 }),
        .S({1'b1,\mult_a[2][17]_i_2_n_0 ,\mult_a[2][17]_i_3_n_0 ,\mult_a[2][17]_i_4_n_0 }));
  FDRE \mult_a_reg[2][1] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][4]_i_1_n_7 ),
        .Q(\mult_a_reg_n_0_[2][1] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][2] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][4]_i_1_n_6 ),
        .Q(\mult_a_reg_n_0_[2][2] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][3] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][4]_i_1_n_5 ),
        .Q(\mult_a_reg_n_0_[2][3] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][4] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][4]_i_1_n_4 ),
        .Q(\mult_a_reg_n_0_[2][4] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[2][4]_i_1 
       (.CI(1'b0),
        .CO({\mult_a_reg[2][4]_i_1_n_0 ,\mult_a_reg[2][4]_i_1_n_1 ,\mult_a_reg[2][4]_i_1_n_2 ,\mult_a_reg[2][4]_i_1_n_3 }),
        .CYINIT(\parallel_in_gen.in_data_s_reg[2] [0]),
        .DI(\parallel_in_gen.in_data_s_reg[2] [4:1]),
        .O({\mult_a_reg[2][4]_i_1_n_4 ,\mult_a_reg[2][4]_i_1_n_5 ,\mult_a_reg[2][4]_i_1_n_6 ,\mult_a_reg[2][4]_i_1_n_7 }),
        .S({\mult_a[2][4]_i_2_n_0 ,\mult_a[2][4]_i_3_n_0 ,\mult_a[2][4]_i_4_n_0 ,\mult_a[2][4]_i_5_n_0 }));
  FDRE \mult_a_reg[2][5] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][8]_i_1_n_7 ),
        .Q(\mult_a_reg_n_0_[2][5] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][6] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][8]_i_1_n_6 ),
        .Q(\mult_a_reg_n_0_[2][6] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][7] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][8]_i_1_n_5 ),
        .Q(\mult_a_reg_n_0_[2][7] ),
        .R(1'b0));
  FDRE \mult_a_reg[2][8] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][8]_i_1_n_4 ),
        .Q(\mult_a_reg_n_0_[2][8] ),
        .R(1'b0));
  CARRY4 \mult_a_reg[2][8]_i_1 
       (.CI(\mult_a_reg[2][4]_i_1_n_0 ),
        .CO({\mult_a_reg[2][8]_i_1_n_0 ,\mult_a_reg[2][8]_i_1_n_1 ,\mult_a_reg[2][8]_i_1_n_2 ,\mult_a_reg[2][8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(\parallel_in_gen.in_data_s_reg[2] [8:5]),
        .O({\mult_a_reg[2][8]_i_1_n_4 ,\mult_a_reg[2][8]_i_1_n_5 ,\mult_a_reg[2][8]_i_1_n_6 ,\mult_a_reg[2][8]_i_1_n_7 }),
        .S({\mult_a[2][8]_i_2_n_0 ,\mult_a[2][8]_i_3_n_0 ,\mult_a[2][8]_i_4_n_0 ,\mult_a[2][8]_i_5_n_0 }));
  FDRE \mult_a_reg[2][9] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\mult_a_reg[2][12]_i_1_n_7 ),
        .Q(\mult_a_reg_n_0_[2][9] ),
        .R(1'b0));
  zsys_axis_pwm_0_0_unimacro_MULT_MACRO \mult_gen[0].MULT_MACRO_inst 
       (.D(p_1_in[0]),
        .DI(\mult_gen[0].MULT_MACRO_inst_n_17 ),
        .P(\mult_p[0]_0 ),
        .Q({\mult_a_reg_n_0_[0][17] ,\mult_a_reg_n_0_[0][15] ,\mult_a_reg_n_0_[0][14] ,\mult_a_reg_n_0_[0][13] ,\mult_a_reg_n_0_[0][12] ,\mult_a_reg_n_0_[0][11] ,\mult_a_reg_n_0_[0][10] ,\mult_a_reg_n_0_[0][9] ,\mult_a_reg_n_0_[0][8] ,\mult_a_reg_n_0_[0][7] ,\mult_a_reg_n_0_[0][6] ,\mult_a_reg_n_0_[0][5] ,\mult_a_reg_n_0_[0][4] ,\mult_a_reg_n_0_[0][3] ,\mult_a_reg_n_0_[0][2] ,\mult_a_reg_n_0_[0][1] ,\mult_a_reg_n_0_[0][0] }),
        .S(\mult_gen[0].MULT_MACRO_inst_n_18 ),
        .\bipolar_gen.h_end_reg[0][12] ({\mult_gen[0].MULT_MACRO_inst_n_19 ,\mult_gen[0].MULT_MACRO_inst_n_20 ,\mult_gen[0].MULT_MACRO_inst_n_21 ,\mult_gen[0].MULT_MACRO_inst_n_22 }),
        .\bipolar_gen.h_end_reg[0][12]_0 ({\mult_gen[0].MULT_MACRO_inst_n_23 ,\mult_gen[0].MULT_MACRO_inst_n_24 ,\mult_gen[0].MULT_MACRO_inst_n_25 ,\mult_gen[0].MULT_MACRO_inst_n_26 }),
        .\bipolar_gen.h_end_reg[0][12]_1 ({\mult_gen[0].MULT_MACRO_inst_n_48 ,\mult_gen[0].MULT_MACRO_inst_n_49 ,\mult_gen[0].MULT_MACRO_inst_n_50 }),
        .\bipolar_gen.h_end_reg[0][12]_2 ({\mult_gen[0].MULT_MACRO_inst_n_51 ,\mult_gen[0].MULT_MACRO_inst_n_52 ,\mult_gen[0].MULT_MACRO_inst_n_53 ,\mult_gen[0].MULT_MACRO_inst_n_54 }),
        .\bipolar_gen.h_end_reg[0][12]_3 ({\mult_gen[0].MULT_MACRO_inst_n_64 ,\mult_gen[0].MULT_MACRO_inst_n_65 ,\mult_gen[0].MULT_MACRO_inst_n_66 ,\mult_gen[0].MULT_MACRO_inst_n_67 }),
        .\bipolar_gen.h_end_reg[0][16] ({\mult_gen[0].MULT_MACRO_inst_n_60 ,\mult_gen[0].MULT_MACRO_inst_n_61 ,\mult_gen[0].MULT_MACRO_inst_n_62 ,\mult_gen[0].MULT_MACRO_inst_n_63 }),
        .\bipolar_gen.h_end_reg[0][17] (\mult_gen[0].MULT_MACRO_inst_n_59 ),
        .\bipolar_gen.h_end_reg[0][4] ({\mult_gen[0].MULT_MACRO_inst_n_27 ,\mult_gen[0].MULT_MACRO_inst_n_28 ,\mult_gen[0].MULT_MACRO_inst_n_29 ,\mult_gen[0].MULT_MACRO_inst_n_30 }),
        .\bipolar_gen.h_end_reg[0][8] ({\mult_gen[0].MULT_MACRO_inst_n_55 ,\mult_gen[0].MULT_MACRO_inst_n_56 ,\mult_gen[0].MULT_MACRO_inst_n_57 ,\mult_gen[0].MULT_MACRO_inst_n_58 }),
        .\bipolar_gen.l_start_reg[0][12] ({\mult_gen[0].MULT_MACRO_inst_n_39 ,\mult_gen[0].MULT_MACRO_inst_n_40 ,\mult_gen[0].MULT_MACRO_inst_n_41 ,\mult_gen[0].MULT_MACRO_inst_n_42 }),
        .\bipolar_gen.l_start_reg[0][16] ({\mult_gen[0].MULT_MACRO_inst_n_43 ,\mult_gen[0].MULT_MACRO_inst_n_44 ,\mult_gen[0].MULT_MACRO_inst_n_45 ,\mult_gen[0].MULT_MACRO_inst_n_46 }),
        .\bipolar_gen.l_start_reg[0][17] (\mult_gen[0].MULT_MACRO_inst_n_47 ),
        .\bipolar_gen.l_start_reg[0][4] ({\mult_gen[0].MULT_MACRO_inst_n_31 ,\mult_gen[0].MULT_MACRO_inst_n_32 ,\mult_gen[0].MULT_MACRO_inst_n_33 ,\mult_gen[0].MULT_MACRO_inst_n_34 }),
        .\bipolar_gen.l_start_reg[0][8] ({\mult_gen[0].MULT_MACRO_inst_n_35 ,\mult_gen[0].MULT_MACRO_inst_n_36 ,\mult_gen[0].MULT_MACRO_inst_n_37 ,\mult_gen[0].MULT_MACRO_inst_n_38 }),
        .s_axis_aclk(s_axis_aclk));
  zsys_axis_pwm_0_0_unimacro_MULT_MACRO_0 \mult_gen[1].MULT_MACRO_inst 
       (.D(\mult_gen[1].MULT_MACRO_inst_n_68 ),
        .DI(\mult_gen[1].MULT_MACRO_inst_n_17 ),
        .P(\mult_p[1]_1 ),
        .Q({\mult_a_reg_n_0_[1][17] ,\mult_a_reg_n_0_[1][15] ,\mult_a_reg_n_0_[1][14] ,\mult_a_reg_n_0_[1][13] ,\mult_a_reg_n_0_[1][12] ,\mult_a_reg_n_0_[1][11] ,\mult_a_reg_n_0_[1][10] ,\mult_a_reg_n_0_[1][9] ,\mult_a_reg_n_0_[1][8] ,\mult_a_reg_n_0_[1][7] ,\mult_a_reg_n_0_[1][6] ,\mult_a_reg_n_0_[1][5] ,\mult_a_reg_n_0_[1][4] ,\mult_a_reg_n_0_[1][3] ,\mult_a_reg_n_0_[1][2] ,\mult_a_reg_n_0_[1][1] ,\mult_a_reg_n_0_[1][0] }),
        .S(\mult_gen[1].MULT_MACRO_inst_n_18 ),
        .\bipolar_gen.h_end_reg[1][12] ({\mult_gen[1].MULT_MACRO_inst_n_19 ,\mult_gen[1].MULT_MACRO_inst_n_20 ,\mult_gen[1].MULT_MACRO_inst_n_21 ,\mult_gen[1].MULT_MACRO_inst_n_22 }),
        .\bipolar_gen.h_end_reg[1][12]_0 ({\mult_gen[1].MULT_MACRO_inst_n_23 ,\mult_gen[1].MULT_MACRO_inst_n_24 ,\mult_gen[1].MULT_MACRO_inst_n_25 ,\mult_gen[1].MULT_MACRO_inst_n_26 }),
        .\bipolar_gen.h_end_reg[1][12]_1 ({\mult_gen[1].MULT_MACRO_inst_n_48 ,\mult_gen[1].MULT_MACRO_inst_n_49 ,\mult_gen[1].MULT_MACRO_inst_n_50 }),
        .\bipolar_gen.h_end_reg[1][12]_2 ({\mult_gen[1].MULT_MACRO_inst_n_51 ,\mult_gen[1].MULT_MACRO_inst_n_52 ,\mult_gen[1].MULT_MACRO_inst_n_53 ,\mult_gen[1].MULT_MACRO_inst_n_54 }),
        .\bipolar_gen.h_end_reg[1][12]_3 ({\mult_gen[1].MULT_MACRO_inst_n_64 ,\mult_gen[1].MULT_MACRO_inst_n_65 ,\mult_gen[1].MULT_MACRO_inst_n_66 ,\mult_gen[1].MULT_MACRO_inst_n_67 }),
        .\bipolar_gen.h_end_reg[1][16] ({\mult_gen[1].MULT_MACRO_inst_n_60 ,\mult_gen[1].MULT_MACRO_inst_n_61 ,\mult_gen[1].MULT_MACRO_inst_n_62 ,\mult_gen[1].MULT_MACRO_inst_n_63 }),
        .\bipolar_gen.h_end_reg[1][17] (\mult_gen[1].MULT_MACRO_inst_n_59 ),
        .\bipolar_gen.h_end_reg[1][4] ({\mult_gen[1].MULT_MACRO_inst_n_27 ,\mult_gen[1].MULT_MACRO_inst_n_28 ,\mult_gen[1].MULT_MACRO_inst_n_29 ,\mult_gen[1].MULT_MACRO_inst_n_30 }),
        .\bipolar_gen.h_end_reg[1][8] ({\mult_gen[1].MULT_MACRO_inst_n_55 ,\mult_gen[1].MULT_MACRO_inst_n_56 ,\mult_gen[1].MULT_MACRO_inst_n_57 ,\mult_gen[1].MULT_MACRO_inst_n_58 }),
        .\bipolar_gen.l_start_reg[1][12] ({\mult_gen[1].MULT_MACRO_inst_n_39 ,\mult_gen[1].MULT_MACRO_inst_n_40 ,\mult_gen[1].MULT_MACRO_inst_n_41 ,\mult_gen[1].MULT_MACRO_inst_n_42 }),
        .\bipolar_gen.l_start_reg[1][16] ({\mult_gen[1].MULT_MACRO_inst_n_43 ,\mult_gen[1].MULT_MACRO_inst_n_44 ,\mult_gen[1].MULT_MACRO_inst_n_45 ,\mult_gen[1].MULT_MACRO_inst_n_46 }),
        .\bipolar_gen.l_start_reg[1][17] (\mult_gen[1].MULT_MACRO_inst_n_47 ),
        .\bipolar_gen.l_start_reg[1][4] ({\mult_gen[1].MULT_MACRO_inst_n_31 ,\mult_gen[1].MULT_MACRO_inst_n_32 ,\mult_gen[1].MULT_MACRO_inst_n_33 ,\mult_gen[1].MULT_MACRO_inst_n_34 }),
        .\bipolar_gen.l_start_reg[1][8] ({\mult_gen[1].MULT_MACRO_inst_n_35 ,\mult_gen[1].MULT_MACRO_inst_n_36 ,\mult_gen[1].MULT_MACRO_inst_n_37 ,\mult_gen[1].MULT_MACRO_inst_n_38 }),
        .s_axis_aclk(s_axis_aclk));
  zsys_axis_pwm_0_0_unimacro_MULT_MACRO_1 \mult_gen[2].MULT_MACRO_inst 
       (.D(\mult_gen[2].MULT_MACRO_inst_n_68 ),
        .DI(\mult_gen[2].MULT_MACRO_inst_n_17 ),
        .P(\mult_p[2]_2 ),
        .Q({\mult_a_reg_n_0_[2][17] ,\mult_a_reg_n_0_[2][15] ,\mult_a_reg_n_0_[2][14] ,\mult_a_reg_n_0_[2][13] ,\mult_a_reg_n_0_[2][12] ,\mult_a_reg_n_0_[2][11] ,\mult_a_reg_n_0_[2][10] ,\mult_a_reg_n_0_[2][9] ,\mult_a_reg_n_0_[2][8] ,\mult_a_reg_n_0_[2][7] ,\mult_a_reg_n_0_[2][6] ,\mult_a_reg_n_0_[2][5] ,\mult_a_reg_n_0_[2][4] ,\mult_a_reg_n_0_[2][3] ,\mult_a_reg_n_0_[2][2] ,\mult_a_reg_n_0_[2][1] ,\mult_a_reg_n_0_[2][0] }),
        .S(\mult_gen[2].MULT_MACRO_inst_n_18 ),
        .\bipolar_gen.h_end_reg[2][12] ({\mult_gen[2].MULT_MACRO_inst_n_19 ,\mult_gen[2].MULT_MACRO_inst_n_20 ,\mult_gen[2].MULT_MACRO_inst_n_21 ,\mult_gen[2].MULT_MACRO_inst_n_22 }),
        .\bipolar_gen.h_end_reg[2][12]_0 ({\mult_gen[2].MULT_MACRO_inst_n_23 ,\mult_gen[2].MULT_MACRO_inst_n_24 ,\mult_gen[2].MULT_MACRO_inst_n_25 ,\mult_gen[2].MULT_MACRO_inst_n_26 }),
        .\bipolar_gen.h_end_reg[2][12]_1 ({\mult_gen[2].MULT_MACRO_inst_n_48 ,\mult_gen[2].MULT_MACRO_inst_n_49 ,\mult_gen[2].MULT_MACRO_inst_n_50 }),
        .\bipolar_gen.h_end_reg[2][12]_2 ({\mult_gen[2].MULT_MACRO_inst_n_51 ,\mult_gen[2].MULT_MACRO_inst_n_52 ,\mult_gen[2].MULT_MACRO_inst_n_53 ,\mult_gen[2].MULT_MACRO_inst_n_54 }),
        .\bipolar_gen.h_end_reg[2][12]_3 ({\mult_gen[2].MULT_MACRO_inst_n_64 ,\mult_gen[2].MULT_MACRO_inst_n_65 ,\mult_gen[2].MULT_MACRO_inst_n_66 ,\mult_gen[2].MULT_MACRO_inst_n_67 }),
        .\bipolar_gen.h_end_reg[2][16] ({\mult_gen[2].MULT_MACRO_inst_n_60 ,\mult_gen[2].MULT_MACRO_inst_n_61 ,\mult_gen[2].MULT_MACRO_inst_n_62 ,\mult_gen[2].MULT_MACRO_inst_n_63 }),
        .\bipolar_gen.h_end_reg[2][17] (\mult_gen[2].MULT_MACRO_inst_n_59 ),
        .\bipolar_gen.h_end_reg[2][4] ({\mult_gen[2].MULT_MACRO_inst_n_27 ,\mult_gen[2].MULT_MACRO_inst_n_28 ,\mult_gen[2].MULT_MACRO_inst_n_29 ,\mult_gen[2].MULT_MACRO_inst_n_30 }),
        .\bipolar_gen.h_end_reg[2][8] ({\mult_gen[2].MULT_MACRO_inst_n_55 ,\mult_gen[2].MULT_MACRO_inst_n_56 ,\mult_gen[2].MULT_MACRO_inst_n_57 ,\mult_gen[2].MULT_MACRO_inst_n_58 }),
        .\bipolar_gen.l_start_reg[2][12] ({\mult_gen[2].MULT_MACRO_inst_n_39 ,\mult_gen[2].MULT_MACRO_inst_n_40 ,\mult_gen[2].MULT_MACRO_inst_n_41 ,\mult_gen[2].MULT_MACRO_inst_n_42 }),
        .\bipolar_gen.l_start_reg[2][16] ({\mult_gen[2].MULT_MACRO_inst_n_43 ,\mult_gen[2].MULT_MACRO_inst_n_44 ,\mult_gen[2].MULT_MACRO_inst_n_45 ,\mult_gen[2].MULT_MACRO_inst_n_46 }),
        .\bipolar_gen.l_start_reg[2][17] (\mult_gen[2].MULT_MACRO_inst_n_47 ),
        .\bipolar_gen.l_start_reg[2][4] ({\mult_gen[2].MULT_MACRO_inst_n_31 ,\mult_gen[2].MULT_MACRO_inst_n_32 ,\mult_gen[2].MULT_MACRO_inst_n_33 ,\mult_gen[2].MULT_MACRO_inst_n_34 }),
        .\bipolar_gen.l_start_reg[2][8] ({\mult_gen[2].MULT_MACRO_inst_n_35 ,\mult_gen[2].MULT_MACRO_inst_n_36 ,\mult_gen[2].MULT_MACRO_inst_n_37 ,\mult_gen[2].MULT_MACRO_inst_n_38 }),
        .s_axis_aclk(s_axis_aclk));
  CARRY4 p_0_in_carry
       (.CI(1'b0),
        .CO({p_0_in_carry_n_0,p_0_in_carry_n_1,p_0_in_carry_n_2,p_0_in_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_p_0_in_carry_O_UNCONNECTED[3:0]),
        .S({p_0_in_carry_i_1_n_0,p_0_in_carry_i_2_n_0,p_0_in_carry_i_3_n_0,p_0_in_carry_i_4_n_0}));
  CARRY4 p_0_in_carry__0
       (.CI(p_0_in_carry_n_0),
        .CO({NLW_p_0_in_carry__0_CO_UNCONNECTED[3:2],p_0_in_3,p_0_in_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_p_0_in_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,p_0_in_carry__0_i_1_n_0,p_0_in_carry__0_i_2_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    p_0_in_carry__0_i_1
       (.I0(pwm_cnt_reg[17]),
        .I1(pwm_cnt_reg[16]),
        .I2(pwm_cnt_reg[15]),
        .O(p_0_in_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    p_0_in_carry__0_i_2
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.h_start_reg[2] [12]),
        .I2(pwm_cnt_reg[14]),
        .I3(pwm_cnt_reg[13]),
        .O(p_0_in_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    p_0_in_carry_i_1
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.h_start_reg[2] [12]),
        .I2(pwm_cnt_reg[11]),
        .I3(pwm_cnt_reg[10]),
        .O(p_0_in_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h0081)) 
    p_0_in_carry_i_2
       (.I0(\bipolar_gen.h_start_reg[2] [12]),
        .I1(pwm_cnt_reg[8]),
        .I2(pwm_cnt_reg[7]),
        .I3(pwm_cnt_reg[6]),
        .O(p_0_in_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'h09000009)) 
    p_0_in_carry_i_3
       (.I0(pwm_cnt_reg[3]),
        .I1(\bipolar_gen.h_start_reg[2] [3]),
        .I2(pwm_cnt_reg[5]),
        .I3(\bipolar_gen.h_start_reg[2] [4]),
        .I4(pwm_cnt_reg[4]),
        .O(p_0_in_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    p_0_in_carry_i_4
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.h_start_reg[2] [3]),
        .I2(pwm_cnt_reg[2]),
        .I3(pwm_cnt_reg[1]),
        .O(p_0_in_carry_i_4_n_0));
  CARRY4 p_2_in_carry
       (.CI(1'b0),
        .CO({p_2_in_carry_n_0,p_2_in_carry_n_1,p_2_in_carry_n_2,p_2_in_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_p_2_in_carry_O_UNCONNECTED[3:0]),
        .S({p_2_in_carry_i_1_n_0,p_2_in_carry_i_2_n_0,p_2_in_carry_i_3_n_0,p_2_in_carry_i_4_n_0}));
  CARRY4 p_2_in_carry__0
       (.CI(p_2_in_carry_n_0),
        .CO({NLW_p_2_in_carry__0_CO_UNCONNECTED[3:2],p_2_in,p_2_in_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_p_2_in_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,p_2_in_carry__0_i_1_n_0,p_2_in_carry__0_i_2_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    p_2_in_carry__0_i_1
       (.I0(pwm_cnt_reg[17]),
        .I1(pwm_cnt_reg[16]),
        .I2(pwm_cnt_reg[15]),
        .O(p_2_in_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    p_2_in_carry__0_i_2
       (.I0(pwm_cnt_reg[12]),
        .I1(\bipolar_gen.h_start_reg[1] [12]),
        .I2(pwm_cnt_reg[14]),
        .I3(pwm_cnt_reg[13]),
        .O(p_2_in_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    p_2_in_carry_i_1
       (.I0(pwm_cnt_reg[9]),
        .I1(\bipolar_gen.h_start_reg[1] [12]),
        .I2(pwm_cnt_reg[11]),
        .I3(pwm_cnt_reg[10]),
        .O(p_2_in_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h0081)) 
    p_2_in_carry_i_2
       (.I0(\bipolar_gen.h_start_reg[1] [12]),
        .I1(pwm_cnt_reg[8]),
        .I2(pwm_cnt_reg[7]),
        .I3(pwm_cnt_reg[6]),
        .O(p_2_in_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'h09000009)) 
    p_2_in_carry_i_3
       (.I0(pwm_cnt_reg[3]),
        .I1(\bipolar_gen.h_start_reg[2] [3]),
        .I2(pwm_cnt_reg[5]),
        .I3(\bipolar_gen.h_start_reg[1] [4]),
        .I4(pwm_cnt_reg[4]),
        .O(p_2_in_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    p_2_in_carry_i_4
       (.I0(pwm_cnt_reg[0]),
        .I1(\bipolar_gen.h_start_reg[2] [3]),
        .I2(pwm_cnt_reg[2]),
        .I3(pwm_cnt_reg[1]),
        .O(p_2_in_carry_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][0] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[0]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][10] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[10]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][11] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[11]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][12] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[12]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][13] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[13]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][14] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[14]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][15] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[15]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][1] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[1]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][2] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[2]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][3] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[3]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][4] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[4]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][5] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[5]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][6] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[6]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][7] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[7]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][8] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[8]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[0][9] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[9]),
        .Q(\parallel_in_gen.in_data_s_reg[0] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][0] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[16]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][10] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[26]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][11] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[27]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][12] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[28]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][13] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[29]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][14] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[30]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][15] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[31]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][1] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[17]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][2] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[18]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][3] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[19]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][4] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[20]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][5] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[21]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][6] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[22]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][7] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[23]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][8] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[24]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[1][9] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[25]),
        .Q(\parallel_in_gen.in_data_s_reg[1] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][0] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[32]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][10] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[42]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][11] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[43]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][12] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[44]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][13] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[45]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][14] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[46]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][15] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[47]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][1] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[33]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][2] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[34]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][3] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[35]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][4] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[36]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][5] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[37]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][6] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[38]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][7] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[39]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][8] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[40]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \parallel_in_gen.in_data_s_reg[2][9] 
       (.C(s_axis_aclk),
        .CE(s_axis_tvalid),
        .D(s_axis_tdata[41]),
        .Q(\parallel_in_gen.in_data_s_reg[2] [9]),
        .R(1'b0));
  CARRY4 pwm_cnt0_carry
       (.CI(1'b0),
        .CO({pwm_cnt0_carry_n_0,pwm_cnt0_carry_n_1,pwm_cnt0_carry_n_2,pwm_cnt0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({pwm_cnt0_carry_i_1_n_0,pwm_cnt0_carry_i_2_n_0,pwm_cnt0_carry_i_3_n_0,pwm_cnt0_carry_i_4_n_0}),
        .O(NLW_pwm_cnt0_carry_O_UNCONNECTED[3:0]),
        .S({pwm_cnt0_carry_i_5_n_0,pwm_cnt0_carry_i_6_n_0,pwm_cnt0_carry_i_7_n_0,pwm_cnt0_carry_i_8_n_0}));
  CARRY4 pwm_cnt0_carry__0
       (.CI(pwm_cnt0_carry_n_0),
        .CO({pwm_cnt0_carry__0_n_0,pwm_cnt0_carry__0_n_1,pwm_cnt0_carry__0_n_2,pwm_cnt0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_cnt0_carry__0_i_1_n_0,pwm_cnt_reg[13],pwm_cnt0_carry__0_i_2_n_0,1'b0}),
        .O(NLW_pwm_cnt0_carry__0_O_UNCONNECTED[3:0]),
        .S({pwm_cnt0_carry__0_i_3_n_0,pwm_cnt0_carry__0_i_4_n_0,pwm_cnt0_carry__0_i_5_n_0,pwm_cnt0_carry__0_i_6_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    pwm_cnt0_carry__0_i_1
       (.I0(pwm_cnt_reg[14]),
        .I1(pwm_cnt_reg[15]),
        .O(pwm_cnt0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    pwm_cnt0_carry__0_i_2
       (.I0(pwm_cnt_reg[10]),
        .I1(pwm_cnt_reg[11]),
        .O(pwm_cnt0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    pwm_cnt0_carry__0_i_3
       (.I0(pwm_cnt_reg[14]),
        .I1(pwm_cnt_reg[15]),
        .O(pwm_cnt0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    pwm_cnt0_carry__0_i_4
       (.I0(pwm_cnt_reg[12]),
        .I1(pwm_cnt_reg[13]),
        .O(pwm_cnt0_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    pwm_cnt0_carry__0_i_5
       (.I0(pwm_cnt_reg[10]),
        .I1(pwm_cnt_reg[11]),
        .O(pwm_cnt0_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    pwm_cnt0_carry__0_i_6
       (.I0(pwm_cnt_reg[8]),
        .I1(pwm_cnt_reg[9]),
        .O(pwm_cnt0_carry__0_i_6_n_0));
  CARRY4 pwm_cnt0_carry__1
       (.CI(pwm_cnt0_carry__0_n_0),
        .CO({NLW_pwm_cnt0_carry__1_CO_UNCONNECTED[3:1],pwm_cnt0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,pwm_cnt0_carry__1_i_1_n_0}),
        .O(NLW_pwm_cnt0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,pwm_cnt0_carry__1_i_2_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    pwm_cnt0_carry__1_i_1
       (.I0(pwm_cnt_reg[16]),
        .I1(pwm_cnt_reg[17]),
        .O(pwm_cnt0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    pwm_cnt0_carry__1_i_2
       (.I0(pwm_cnt_reg[16]),
        .I1(pwm_cnt_reg[17]),
        .O(pwm_cnt0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    pwm_cnt0_carry_i_1
       (.I0(pwm_cnt_reg[6]),
        .I1(pwm_cnt_reg[7]),
        .O(pwm_cnt0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    pwm_cnt0_carry_i_2
       (.I0(pwm_cnt_reg[4]),
        .I1(pwm_cnt_reg[5]),
        .O(pwm_cnt0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    pwm_cnt0_carry_i_3
       (.I0(pwm_cnt_reg[2]),
        .I1(pwm_cnt_reg[3]),
        .O(pwm_cnt0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    pwm_cnt0_carry_i_4
       (.I0(pwm_cnt_reg[0]),
        .I1(pwm_cnt_reg[1]),
        .O(pwm_cnt0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    pwm_cnt0_carry_i_5
       (.I0(pwm_cnt_reg[7]),
        .I1(pwm_cnt_reg[6]),
        .O(pwm_cnt0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    pwm_cnt0_carry_i_6
       (.I0(pwm_cnt_reg[4]),
        .I1(pwm_cnt_reg[5]),
        .O(pwm_cnt0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    pwm_cnt0_carry_i_7
       (.I0(pwm_cnt_reg[3]),
        .I1(pwm_cnt_reg[2]),
        .O(pwm_cnt0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    pwm_cnt0_carry_i_8
       (.I0(pwm_cnt_reg[0]),
        .I1(pwm_cnt_reg[1]),
        .O(pwm_cnt0_carry_i_8_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[0]_i_2 
       (.I0(pwm_cnt_reg[3]),
        .O(\pwm_cnt[0]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[0]_i_3 
       (.I0(pwm_cnt_reg[2]),
        .O(\pwm_cnt[0]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[0]_i_4 
       (.I0(pwm_cnt_reg[1]),
        .O(\pwm_cnt[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \pwm_cnt[0]_i_5 
       (.I0(pwm_cnt_reg[0]),
        .O(\pwm_cnt[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[12]_i_2 
       (.I0(pwm_cnt_reg[15]),
        .O(\pwm_cnt[12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[12]_i_3 
       (.I0(pwm_cnt_reg[14]),
        .O(\pwm_cnt[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[12]_i_4 
       (.I0(pwm_cnt_reg[13]),
        .O(\pwm_cnt[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[12]_i_5 
       (.I0(pwm_cnt_reg[12]),
        .O(\pwm_cnt[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[16]_i_2 
       (.I0(pwm_cnt_reg[17]),
        .O(\pwm_cnt[16]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[16]_i_3 
       (.I0(pwm_cnt_reg[16]),
        .O(\pwm_cnt[16]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[4]_i_2 
       (.I0(pwm_cnt_reg[7]),
        .O(\pwm_cnt[4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[4]_i_3 
       (.I0(pwm_cnt_reg[6]),
        .O(\pwm_cnt[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[4]_i_4 
       (.I0(pwm_cnt_reg[5]),
        .O(\pwm_cnt[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[4]_i_5 
       (.I0(pwm_cnt_reg[4]),
        .O(\pwm_cnt[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[8]_i_2 
       (.I0(pwm_cnt_reg[11]),
        .O(\pwm_cnt[8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[8]_i_3 
       (.I0(pwm_cnt_reg[10]),
        .O(\pwm_cnt[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[8]_i_4 
       (.I0(pwm_cnt_reg[9]),
        .O(\pwm_cnt[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \pwm_cnt[8]_i_5 
       (.I0(pwm_cnt_reg[8]),
        .O(\pwm_cnt[8]_i_5_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[0] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[0]_i_1_n_7 ),
        .Q(pwm_cnt_reg[0]),
        .S(pwm_cnt0_carry__1_n_3));
  CARRY4 \pwm_cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\pwm_cnt_reg[0]_i_1_n_0 ,\pwm_cnt_reg[0]_i_1_n_1 ,\pwm_cnt_reg[0]_i_1_n_2 ,\pwm_cnt_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\pwm_cnt_reg[0]_i_1_n_4 ,\pwm_cnt_reg[0]_i_1_n_5 ,\pwm_cnt_reg[0]_i_1_n_6 ,\pwm_cnt_reg[0]_i_1_n_7 }),
        .S({\pwm_cnt[0]_i_2_n_0 ,\pwm_cnt[0]_i_3_n_0 ,\pwm_cnt[0]_i_4_n_0 ,\pwm_cnt[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[10] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[8]_i_1_n_5 ),
        .Q(pwm_cnt_reg[10]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[11] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[8]_i_1_n_4 ),
        .Q(pwm_cnt_reg[11]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[12] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[12]_i_1_n_7 ),
        .Q(pwm_cnt_reg[12]),
        .R(pwm_cnt0_carry__1_n_3));
  CARRY4 \pwm_cnt_reg[12]_i_1 
       (.CI(\pwm_cnt_reg[8]_i_1_n_0 ),
        .CO({\pwm_cnt_reg[12]_i_1_n_0 ,\pwm_cnt_reg[12]_i_1_n_1 ,\pwm_cnt_reg[12]_i_1_n_2 ,\pwm_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_cnt_reg[12]_i_1_n_4 ,\pwm_cnt_reg[12]_i_1_n_5 ,\pwm_cnt_reg[12]_i_1_n_6 ,\pwm_cnt_reg[12]_i_1_n_7 }),
        .S({\pwm_cnt[12]_i_2_n_0 ,\pwm_cnt[12]_i_3_n_0 ,\pwm_cnt[12]_i_4_n_0 ,\pwm_cnt[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[13] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[12]_i_1_n_6 ),
        .Q(pwm_cnt_reg[13]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[14] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[12]_i_1_n_5 ),
        .Q(pwm_cnt_reg[14]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[15] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[12]_i_1_n_4 ),
        .Q(pwm_cnt_reg[15]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[16] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[16]_i_1_n_7 ),
        .Q(pwm_cnt_reg[16]),
        .R(pwm_cnt0_carry__1_n_3));
  CARRY4 \pwm_cnt_reg[16]_i_1 
       (.CI(\pwm_cnt_reg[12]_i_1_n_0 ),
        .CO({\NLW_pwm_cnt_reg[16]_i_1_CO_UNCONNECTED [3:1],\pwm_cnt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_pwm_cnt_reg[16]_i_1_O_UNCONNECTED [3:2],\pwm_cnt_reg[16]_i_1_n_6 ,\pwm_cnt_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,\pwm_cnt[16]_i_2_n_0 ,\pwm_cnt[16]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[17] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[16]_i_1_n_6 ),
        .Q(pwm_cnt_reg[17]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[1] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[0]_i_1_n_6 ),
        .Q(pwm_cnt_reg[1]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[2] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[0]_i_1_n_5 ),
        .Q(pwm_cnt_reg[2]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[3] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[0]_i_1_n_4 ),
        .Q(pwm_cnt_reg[3]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[4] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[4]_i_1_n_7 ),
        .Q(pwm_cnt_reg[4]),
        .R(pwm_cnt0_carry__1_n_3));
  CARRY4 \pwm_cnt_reg[4]_i_1 
       (.CI(\pwm_cnt_reg[0]_i_1_n_0 ),
        .CO({\pwm_cnt_reg[4]_i_1_n_0 ,\pwm_cnt_reg[4]_i_1_n_1 ,\pwm_cnt_reg[4]_i_1_n_2 ,\pwm_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_cnt_reg[4]_i_1_n_4 ,\pwm_cnt_reg[4]_i_1_n_5 ,\pwm_cnt_reg[4]_i_1_n_6 ,\pwm_cnt_reg[4]_i_1_n_7 }),
        .S({\pwm_cnt[4]_i_2_n_0 ,\pwm_cnt[4]_i_3_n_0 ,\pwm_cnt[4]_i_4_n_0 ,\pwm_cnt[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[5] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[4]_i_1_n_6 ),
        .Q(pwm_cnt_reg[5]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[6] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[4]_i_1_n_5 ),
        .Q(pwm_cnt_reg[6]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[7] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[4]_i_1_n_4 ),
        .Q(pwm_cnt_reg[7]),
        .R(pwm_cnt0_carry__1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[8] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[8]_i_1_n_7 ),
        .Q(pwm_cnt_reg[8]),
        .R(pwm_cnt0_carry__1_n_3));
  CARRY4 \pwm_cnt_reg[8]_i_1 
       (.CI(\pwm_cnt_reg[4]_i_1_n_0 ),
        .CO({\pwm_cnt_reg[8]_i_1_n_0 ,\pwm_cnt_reg[8]_i_1_n_1 ,\pwm_cnt_reg[8]_i_1_n_2 ,\pwm_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_cnt_reg[8]_i_1_n_4 ,\pwm_cnt_reg[8]_i_1_n_5 ,\pwm_cnt_reg[8]_i_1_n_6 ,\pwm_cnt_reg[8]_i_1_n_7 }),
        .S({\pwm_cnt[8]_i_2_n_0 ,\pwm_cnt[8]_i_3_n_0 ,\pwm_cnt[8]_i_4_n_0 ,\pwm_cnt[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[9] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\pwm_cnt_reg[8]_i_1_n_6 ),
        .Q(pwm_cnt_reg[9]),
        .R(pwm_cnt0_carry__1_n_3));
endmodule

(* ORIG_REF_NAME = "unimacro_MULT_MACRO" *) 
module zsys_axis_pwm_0_0_unimacro_MULT_MACRO
   (P,
    DI,
    S,
    \bipolar_gen.h_end_reg[0][12] ,
    \bipolar_gen.h_end_reg[0][12]_0 ,
    \bipolar_gen.h_end_reg[0][4] ,
    \bipolar_gen.l_start_reg[0][4] ,
    \bipolar_gen.l_start_reg[0][8] ,
    \bipolar_gen.l_start_reg[0][12] ,
    \bipolar_gen.l_start_reg[0][16] ,
    \bipolar_gen.l_start_reg[0][17] ,
    \bipolar_gen.h_end_reg[0][12]_1 ,
    \bipolar_gen.h_end_reg[0][12]_2 ,
    \bipolar_gen.h_end_reg[0][8] ,
    \bipolar_gen.h_end_reg[0][17] ,
    \bipolar_gen.h_end_reg[0][16] ,
    \bipolar_gen.h_end_reg[0][12]_3 ,
    D,
    Q,
    s_axis_aclk);
  output [16:0]P;
  output [0:0]DI;
  output [0:0]S;
  output [3:0]\bipolar_gen.h_end_reg[0][12] ;
  output [3:0]\bipolar_gen.h_end_reg[0][12]_0 ;
  output [3:0]\bipolar_gen.h_end_reg[0][4] ;
  output [3:0]\bipolar_gen.l_start_reg[0][4] ;
  output [3:0]\bipolar_gen.l_start_reg[0][8] ;
  output [3:0]\bipolar_gen.l_start_reg[0][12] ;
  output [3:0]\bipolar_gen.l_start_reg[0][16] ;
  output [0:0]\bipolar_gen.l_start_reg[0][17] ;
  output [2:0]\bipolar_gen.h_end_reg[0][12]_1 ;
  output [3:0]\bipolar_gen.h_end_reg[0][12]_2 ;
  output [3:0]\bipolar_gen.h_end_reg[0][8] ;
  output [0:0]\bipolar_gen.h_end_reg[0][17] ;
  output [3:0]\bipolar_gen.h_end_reg[0][16] ;
  output [3:0]\bipolar_gen.h_end_reg[0][12]_3 ;
  output [0:0]D;
  input [16:0]Q;
  input s_axis_aclk;

  wire [0:0]D;
  wire [0:0]DI;
  wire [16:0]P;
  wire [16:0]Q;
  wire [6:0]RESULT_OUT;
  wire [0:0]S;
  wire [3:0]\bipolar_gen.h_end_reg[0][12] ;
  wire [3:0]\bipolar_gen.h_end_reg[0][12]_0 ;
  wire [2:0]\bipolar_gen.h_end_reg[0][12]_1 ;
  wire [3:0]\bipolar_gen.h_end_reg[0][12]_2 ;
  wire [3:0]\bipolar_gen.h_end_reg[0][12]_3 ;
  wire [3:0]\bipolar_gen.h_end_reg[0][16] ;
  wire [0:0]\bipolar_gen.h_end_reg[0][17] ;
  wire [3:0]\bipolar_gen.h_end_reg[0][4] ;
  wire [3:0]\bipolar_gen.h_end_reg[0][8] ;
  wire [3:0]\bipolar_gen.l_start_reg[0][12] ;
  wire [3:0]\bipolar_gen.l_start_reg[0][16] ;
  wire [0:0]\bipolar_gen.l_start_reg[0][17] ;
  wire [3:0]\bipolar_gen.l_start_reg[0][4] ;
  wire [3:0]\bipolar_gen.l_start_reg[0][8] ;
  wire [33:33]\mult_p[0]_0 ;
  wire s_axis_aclk;
  wire \v5.v5_2.DSP48E_1_n_60 ;
  wire \v5.v5_2.DSP48E_1_n_61 ;
  wire \v5.v5_2.DSP48E_1_n_80 ;
  wire \v5.v5_2.DSP48E_1_n_81 ;
  wire \v5.v5_2.DSP48E_1_n_82 ;
  wire \v5.v5_2.DSP48E_1_n_83 ;
  wire \v5.v5_2.DSP48E_1_n_84 ;
  wire \v5.v5_2.DSP48E_1_n_85 ;
  wire \v5.v5_2.DSP48E_1_n_86 ;
  wire \v5.v5_2.DSP48E_1_n_87 ;
  wire \v5.v5_2.DSP48E_1_n_88 ;
  wire \v5.v5_2.DSP48E_1_n_89 ;
  wire \v5.v5_2.DSP48E_1_n_90 ;
  wire \v5.v5_2.DSP48E_1_n_91 ;
  wire \v5.v5_2.DSP48E_1_n_92 ;
  wire \v5.v5_2.DSP48E_1_n_93 ;
  wire \v5.v5_2.DSP48E_1_n_94 ;
  wire \v5.v5_2.DSP48E_1_n_95 ;
  wire \NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED ;
  wire [47:43]\NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED ;
  wire [47:0]\NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \bipolar_gen.h_end[0][0]_i_1 
       (.I0(P[0]),
        .O(D));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_1
       (.I0(P[14]),
        .I1(P[15]),
        .O(\bipolar_gen.h_end_reg[0][12]_2 [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1__10
       (.I0(P[8]),
        .O(\bipolar_gen.h_end_reg[0][8] [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_1__12
       (.I0(P[8]),
        .O(\bipolar_gen.l_start_reg[0][8] [3]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_2
       (.I0(P[12]),
        .I1(P[13]),
        .O(\bipolar_gen.h_end_reg[0][12]_2 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2__11
       (.I0(P[7]),
        .O(\bipolar_gen.h_end_reg[0][8] [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_2__12
       (.I0(P[7]),
        .O(\bipolar_gen.l_start_reg[0][8] [2]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_3
       (.I0(P[10]),
        .I1(P[11]),
        .O(\bipolar_gen.h_end_reg[0][12]_2 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3__4
       (.I0(P[6]),
        .O(\bipolar_gen.h_end_reg[0][8] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_3__5
       (.I0(P[6]),
        .O(\bipolar_gen.l_start_reg[0][8] [1]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_4
       (.I0(P[8]),
        .I1(P[9]),
        .O(\bipolar_gen.h_end_reg[0][12]_2 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4__0
       (.I0(P[5]),
        .O(\bipolar_gen.h_end_reg[0][8] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_4__5
       (.I0(P[5]),
        .O(\bipolar_gen.l_start_reg[0][8] [0]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_5__1
       (.I0(P[14]),
        .I1(P[15]),
        .O(\bipolar_gen.h_end_reg[0][12] [3]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_6__1
       (.I0(P[12]),
        .I1(P[13]),
        .O(\bipolar_gen.h_end_reg[0][12] [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_7__1
       (.I0(P[10]),
        .I1(P[11]),
        .O(\bipolar_gen.h_end_reg[0][12] [1]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_8__1
       (.I0(P[8]),
        .I1(P[9]),
        .O(\bipolar_gen.h_end_reg[0][12] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1__1
       (.I0(P[12]),
        .O(\bipolar_gen.h_end_reg[0][12]_3 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry__1_i_1__4
       (.I0(P[16]),
        .I1(\mult_p[0]_0 ),
        .O(DI));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_1__5
       (.I0(P[12]),
        .O(\bipolar_gen.l_start_reg[0][12] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2__1
       (.I0(P[11]),
        .O(\bipolar_gen.h_end_reg[0][12]_3 [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_2__4
       (.I0(P[16]),
        .I1(\mult_p[0]_0 ),
        .O(S));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_2__5
       (.I0(P[11]),
        .O(\bipolar_gen.l_start_reg[0][12] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_3__1
       (.I0(P[10]),
        .O(\bipolar_gen.h_end_reg[0][12]_3 [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_3__2
       (.I0(P[10]),
        .O(\bipolar_gen.l_start_reg[0][12] [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_4__1
       (.I0(P[9]),
        .O(\bipolar_gen.h_end_reg[0][12]_3 [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_4__2
       (.I0(P[9]),
        .O(\bipolar_gen.l_start_reg[0][12] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_1__1
       (.I0(P[16]),
        .O(\bipolar_gen.h_end_reg[0][16] [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_1__2
       (.I0(P[16]),
        .O(\bipolar_gen.l_start_reg[0][16] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_2__1
       (.I0(P[15]),
        .O(\bipolar_gen.h_end_reg[0][16] [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_2__2
       (.I0(P[15]),
        .O(\bipolar_gen.l_start_reg[0][16] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_3__1
       (.I0(P[14]),
        .O(\bipolar_gen.h_end_reg[0][16] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_3__2
       (.I0(P[14]),
        .O(\bipolar_gen.l_start_reg[0][16] [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_4__1
       (.I0(P[13]),
        .O(\bipolar_gen.h_end_reg[0][16] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_4__2
       (.I0(P[13]),
        .O(\bipolar_gen.l_start_reg[0][16] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_1__1
       (.I0(\mult_p[0]_0 ),
        .O(\bipolar_gen.h_end_reg[0][17] ));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__3_i_1__2
       (.I0(\mult_p[0]_0 ),
        .O(\bipolar_gen.l_start_reg[0][17] ));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_1
       (.I0(P[6]),
        .I1(P[7]),
        .O(\bipolar_gen.h_end_reg[0][12]_1 [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_1__12
       (.I0(P[4]),
        .O(\bipolar_gen.h_end_reg[0][4] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__6
       (.I0(P[4]),
        .O(\bipolar_gen.l_start_reg[0][4] [3]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_2
       (.I0(P[2]),
        .I1(P[3]),
        .O(\bipolar_gen.h_end_reg[0][12]_1 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2__10
       (.I0(P[3]),
        .O(\bipolar_gen.l_start_reg[0][4] [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_2__12
       (.I0(P[3]),
        .O(\bipolar_gen.h_end_reg[0][4] [2]));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_3
       (.I0(P[0]),
        .I1(P[1]),
        .O(\bipolar_gen.h_end_reg[0][12]_1 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3__11
       (.I0(P[2]),
        .O(\bipolar_gen.h_end_reg[0][4] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_3__12
       (.I0(P[2]),
        .O(\bipolar_gen.l_start_reg[0][4] [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4
       (.I0(P[1]),
        .O(\bipolar_gen.h_end_reg[0][4] [0]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_4__11
       (.I0(P[6]),
        .I1(P[7]),
        .O(\bipolar_gen.h_end_reg[0][12]_0 [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_4__12
       (.I0(P[1]),
        .O(\bipolar_gen.l_start_reg[0][4] [0]));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_5
       (.I0(P[4]),
        .I1(P[5]),
        .O(\bipolar_gen.h_end_reg[0][12]_0 [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_6__1
       (.I0(P[2]),
        .I1(P[3]),
        .O(\bipolar_gen.h_end_reg[0][12]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_7__1
       (.I0(P[1]),
        .I1(P[0]),
        .O(\bipolar_gen.h_end_reg[0][12]_0 [0]));
  (* XILINX_LEGACY_PRIM = "DSP48E" *) 
  (* box_type = "PRIMITIVE" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(0),
    .ALUMODEREG(1),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .CREG(1),
    .DREG(0),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(1),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \v5.v5_2.DSP48E_1 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,Q[16],Q,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED [17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(1'b0),
        .CEA2(1'b1),
        .CEAD(1'b1),
        .CEALUMODE(1'b1),
        .CEB1(1'b0),
        .CEB2(1'b1),
        .CEC(1'b1),
        .CECARRYIN(1'b1),
        .CECTRL(1'b1),
        .CED(1'b1),
        .CEINMODE(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(s_axis_aclk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED ),
        .P({\NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED [47:43],\v5.v5_2.DSP48E_1_n_60 ,\v5.v5_2.DSP48E_1_n_61 ,\mult_p[0]_0 ,P,\v5.v5_2.DSP48E_1_n_80 ,\v5.v5_2.DSP48E_1_n_81 ,\v5.v5_2.DSP48E_1_n_82 ,\v5.v5_2.DSP48E_1_n_83 ,\v5.v5_2.DSP48E_1_n_84 ,\v5.v5_2.DSP48E_1_n_85 ,\v5.v5_2.DSP48E_1_n_86 ,\v5.v5_2.DSP48E_1_n_87 ,\v5.v5_2.DSP48E_1_n_88 ,\v5.v5_2.DSP48E_1_n_89 ,\v5.v5_2.DSP48E_1_n_90 ,\v5.v5_2.DSP48E_1_n_91 ,\v5.v5_2.DSP48E_1_n_92 ,\v5.v5_2.DSP48E_1_n_93 ,\v5.v5_2.DSP48E_1_n_94 ,\v5.v5_2.DSP48E_1_n_95 ,RESULT_OUT}),
        .PATTERNBDETECT(\NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED ),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(\NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED [47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED ));
endmodule

(* ORIG_REF_NAME = "unimacro_MULT_MACRO" *) 
module zsys_axis_pwm_0_0_unimacro_MULT_MACRO_0
   (P,
    DI,
    S,
    \bipolar_gen.h_end_reg[1][12] ,
    \bipolar_gen.h_end_reg[1][12]_0 ,
    \bipolar_gen.h_end_reg[1][4] ,
    \bipolar_gen.l_start_reg[1][4] ,
    \bipolar_gen.l_start_reg[1][8] ,
    \bipolar_gen.l_start_reg[1][12] ,
    \bipolar_gen.l_start_reg[1][16] ,
    \bipolar_gen.l_start_reg[1][17] ,
    \bipolar_gen.h_end_reg[1][12]_1 ,
    \bipolar_gen.h_end_reg[1][12]_2 ,
    \bipolar_gen.h_end_reg[1][8] ,
    \bipolar_gen.h_end_reg[1][17] ,
    \bipolar_gen.h_end_reg[1][16] ,
    \bipolar_gen.h_end_reg[1][12]_3 ,
    D,
    Q,
    s_axis_aclk);
  output [16:0]P;
  output [0:0]DI;
  output [0:0]S;
  output [3:0]\bipolar_gen.h_end_reg[1][12] ;
  output [3:0]\bipolar_gen.h_end_reg[1][12]_0 ;
  output [3:0]\bipolar_gen.h_end_reg[1][4] ;
  output [3:0]\bipolar_gen.l_start_reg[1][4] ;
  output [3:0]\bipolar_gen.l_start_reg[1][8] ;
  output [3:0]\bipolar_gen.l_start_reg[1][12] ;
  output [3:0]\bipolar_gen.l_start_reg[1][16] ;
  output [0:0]\bipolar_gen.l_start_reg[1][17] ;
  output [2:0]\bipolar_gen.h_end_reg[1][12]_1 ;
  output [3:0]\bipolar_gen.h_end_reg[1][12]_2 ;
  output [3:0]\bipolar_gen.h_end_reg[1][8] ;
  output [0:0]\bipolar_gen.h_end_reg[1][17] ;
  output [3:0]\bipolar_gen.h_end_reg[1][16] ;
  output [3:0]\bipolar_gen.h_end_reg[1][12]_3 ;
  output [0:0]D;
  input [16:0]Q;
  input s_axis_aclk;

  wire [0:0]D;
  wire [0:0]DI;
  wire [16:0]P;
  wire [16:0]Q;
  wire [6:0]RESULT_OUT;
  wire [0:0]S;
  wire [3:0]\bipolar_gen.h_end_reg[1][12] ;
  wire [3:0]\bipolar_gen.h_end_reg[1][12]_0 ;
  wire [2:0]\bipolar_gen.h_end_reg[1][12]_1 ;
  wire [3:0]\bipolar_gen.h_end_reg[1][12]_2 ;
  wire [3:0]\bipolar_gen.h_end_reg[1][12]_3 ;
  wire [3:0]\bipolar_gen.h_end_reg[1][16] ;
  wire [0:0]\bipolar_gen.h_end_reg[1][17] ;
  wire [3:0]\bipolar_gen.h_end_reg[1][4] ;
  wire [3:0]\bipolar_gen.h_end_reg[1][8] ;
  wire [3:0]\bipolar_gen.l_start_reg[1][12] ;
  wire [3:0]\bipolar_gen.l_start_reg[1][16] ;
  wire [0:0]\bipolar_gen.l_start_reg[1][17] ;
  wire [3:0]\bipolar_gen.l_start_reg[1][4] ;
  wire [3:0]\bipolar_gen.l_start_reg[1][8] ;
  wire [33:33]\mult_p[1]_1 ;
  wire s_axis_aclk;
  wire \v5.v5_2.DSP48E_1_n_60 ;
  wire \v5.v5_2.DSP48E_1_n_61 ;
  wire \v5.v5_2.DSP48E_1_n_80 ;
  wire \v5.v5_2.DSP48E_1_n_81 ;
  wire \v5.v5_2.DSP48E_1_n_82 ;
  wire \v5.v5_2.DSP48E_1_n_83 ;
  wire \v5.v5_2.DSP48E_1_n_84 ;
  wire \v5.v5_2.DSP48E_1_n_85 ;
  wire \v5.v5_2.DSP48E_1_n_86 ;
  wire \v5.v5_2.DSP48E_1_n_87 ;
  wire \v5.v5_2.DSP48E_1_n_88 ;
  wire \v5.v5_2.DSP48E_1_n_89 ;
  wire \v5.v5_2.DSP48E_1_n_90 ;
  wire \v5.v5_2.DSP48E_1_n_91 ;
  wire \v5.v5_2.DSP48E_1_n_92 ;
  wire \v5.v5_2.DSP48E_1_n_93 ;
  wire \v5.v5_2.DSP48E_1_n_94 ;
  wire \v5.v5_2.DSP48E_1_n_95 ;
  wire \NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED ;
  wire [47:43]\NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED ;
  wire [47:0]\NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \bipolar_gen.h_end[1][0]_i_1 
       (.I0(P[0]),
        .O(D));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_1__1
       (.I0(P[14]),
        .I1(P[15]),
        .O(\bipolar_gen.h_end_reg[1][12]_2 [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_1__13
       (.I0(P[8]),
        .O(\bipolar_gen.l_start_reg[1][8] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1__9
       (.I0(P[8]),
        .O(\bipolar_gen.h_end_reg[1][8] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2__10
       (.I0(P[7]),
        .O(\bipolar_gen.h_end_reg[1][8] [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_2__13
       (.I0(P[7]),
        .O(\bipolar_gen.l_start_reg[1][8] [2]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_2__2
       (.I0(P[12]),
        .I1(P[13]),
        .O(\bipolar_gen.h_end_reg[1][12]_2 [2]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_3__0
       (.I0(P[10]),
        .I1(P[11]),
        .O(\bipolar_gen.h_end_reg[1][12]_2 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3__3
       (.I0(P[6]),
        .O(\bipolar_gen.h_end_reg[1][8] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_3__6
       (.I0(P[6]),
        .O(\bipolar_gen.l_start_reg[1][8] [1]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_4__1
       (.I0(P[8]),
        .I1(P[9]),
        .O(\bipolar_gen.h_end_reg[1][12]_2 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4__2
       (.I0(P[5]),
        .O(\bipolar_gen.h_end_reg[1][8] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_4__6
       (.I0(P[5]),
        .O(\bipolar_gen.l_start_reg[1][8] [0]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_5__0
       (.I0(P[14]),
        .I1(P[15]),
        .O(\bipolar_gen.h_end_reg[1][12] [3]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_6__0
       (.I0(P[12]),
        .I1(P[13]),
        .O(\bipolar_gen.h_end_reg[1][12] [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_7__0
       (.I0(P[10]),
        .I1(P[11]),
        .O(\bipolar_gen.h_end_reg[1][12] [1]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_8__0
       (.I0(P[8]),
        .I1(P[9]),
        .O(\bipolar_gen.h_end_reg[1][12] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1__0
       (.I0(P[12]),
        .O(\bipolar_gen.h_end_reg[1][12]_3 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry__1_i_1__3
       (.I0(P[16]),
        .I1(\mult_p[1]_1 ),
        .O(DI));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_1__6
       (.I0(P[12]),
        .O(\bipolar_gen.l_start_reg[1][12] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2__0
       (.I0(P[11]),
        .O(\bipolar_gen.h_end_reg[1][12]_3 [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_2__3
       (.I0(P[16]),
        .I1(\mult_p[1]_1 ),
        .O(S));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_2__6
       (.I0(P[11]),
        .O(\bipolar_gen.l_start_reg[1][12] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_3__0
       (.I0(P[10]),
        .O(\bipolar_gen.h_end_reg[1][12]_3 [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_3__3
       (.I0(P[10]),
        .O(\bipolar_gen.l_start_reg[1][12] [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_4__0
       (.I0(P[9]),
        .O(\bipolar_gen.h_end_reg[1][12]_3 [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_4__3
       (.I0(P[9]),
        .O(\bipolar_gen.l_start_reg[1][12] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_1__0
       (.I0(P[16]),
        .O(\bipolar_gen.h_end_reg[1][16] [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_1__3
       (.I0(P[16]),
        .O(\bipolar_gen.l_start_reg[1][16] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_2__0
       (.I0(P[15]),
        .O(\bipolar_gen.h_end_reg[1][16] [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_2__3
       (.I0(P[15]),
        .O(\bipolar_gen.l_start_reg[1][16] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_3__0
       (.I0(P[14]),
        .O(\bipolar_gen.h_end_reg[1][16] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_3__3
       (.I0(P[14]),
        .O(\bipolar_gen.l_start_reg[1][16] [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_4__0
       (.I0(P[13]),
        .O(\bipolar_gen.h_end_reg[1][16] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_4__3
       (.I0(P[13]),
        .O(\bipolar_gen.l_start_reg[1][16] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_1__0
       (.I0(\mult_p[1]_1 ),
        .O(\bipolar_gen.h_end_reg[1][17] ));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__3_i_1__3
       (.I0(\mult_p[1]_1 ),
        .O(\bipolar_gen.l_start_reg[1][17] ));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_1__13
       (.I0(P[4]),
        .O(\bipolar_gen.h_end_reg[1][4] [3]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_1__2
       (.I0(P[6]),
        .I1(P[7]),
        .O(\bipolar_gen.h_end_reg[1][12]_1 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__8
       (.I0(P[4]),
        .O(\bipolar_gen.l_start_reg[1][4] [3]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_2__1
       (.I0(P[2]),
        .I1(P[3]),
        .O(\bipolar_gen.h_end_reg[1][12]_1 [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_2__13
       (.I0(P[3]),
        .O(\bipolar_gen.h_end_reg[1][4] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2__9
       (.I0(P[3]),
        .O(\bipolar_gen.l_start_reg[1][4] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3__10
       (.I0(P[2]),
        .O(\bipolar_gen.h_end_reg[1][4] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_3__13
       (.I0(P[2]),
        .O(\bipolar_gen.l_start_reg[1][4] [1]));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_3__2
       (.I0(P[0]),
        .I1(P[1]),
        .O(\bipolar_gen.h_end_reg[1][12]_1 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4__1
       (.I0(P[1]),
        .O(\bipolar_gen.h_end_reg[1][4] [0]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_4__10
       (.I0(P[6]),
        .I1(P[7]),
        .O(\bipolar_gen.h_end_reg[1][12]_0 [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_4__13
       (.I0(P[1]),
        .O(\bipolar_gen.l_start_reg[1][4] [0]));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_5__0
       (.I0(P[4]),
        .I1(P[5]),
        .O(\bipolar_gen.h_end_reg[1][12]_0 [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_6__0
       (.I0(P[2]),
        .I1(P[3]),
        .O(\bipolar_gen.h_end_reg[1][12]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_7__0
       (.I0(P[1]),
        .I1(P[0]),
        .O(\bipolar_gen.h_end_reg[1][12]_0 [0]));
  (* XILINX_LEGACY_PRIM = "DSP48E" *) 
  (* box_type = "PRIMITIVE" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(0),
    .ALUMODEREG(1),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .CREG(1),
    .DREG(0),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(1),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \v5.v5_2.DSP48E_1 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,Q[16],Q,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED [17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(1'b0),
        .CEA2(1'b1),
        .CEAD(1'b1),
        .CEALUMODE(1'b1),
        .CEB1(1'b0),
        .CEB2(1'b1),
        .CEC(1'b1),
        .CECARRYIN(1'b1),
        .CECTRL(1'b1),
        .CED(1'b1),
        .CEINMODE(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(s_axis_aclk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED ),
        .P({\NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED [47:43],\v5.v5_2.DSP48E_1_n_60 ,\v5.v5_2.DSP48E_1_n_61 ,\mult_p[1]_1 ,P,\v5.v5_2.DSP48E_1_n_80 ,\v5.v5_2.DSP48E_1_n_81 ,\v5.v5_2.DSP48E_1_n_82 ,\v5.v5_2.DSP48E_1_n_83 ,\v5.v5_2.DSP48E_1_n_84 ,\v5.v5_2.DSP48E_1_n_85 ,\v5.v5_2.DSP48E_1_n_86 ,\v5.v5_2.DSP48E_1_n_87 ,\v5.v5_2.DSP48E_1_n_88 ,\v5.v5_2.DSP48E_1_n_89 ,\v5.v5_2.DSP48E_1_n_90 ,\v5.v5_2.DSP48E_1_n_91 ,\v5.v5_2.DSP48E_1_n_92 ,\v5.v5_2.DSP48E_1_n_93 ,\v5.v5_2.DSP48E_1_n_94 ,\v5.v5_2.DSP48E_1_n_95 ,RESULT_OUT}),
        .PATTERNBDETECT(\NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED ),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(\NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED [47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED ));
endmodule

(* ORIG_REF_NAME = "unimacro_MULT_MACRO" *) 
module zsys_axis_pwm_0_0_unimacro_MULT_MACRO_1
   (P,
    DI,
    S,
    \bipolar_gen.h_end_reg[2][12] ,
    \bipolar_gen.h_end_reg[2][12]_0 ,
    \bipolar_gen.h_end_reg[2][4] ,
    \bipolar_gen.l_start_reg[2][4] ,
    \bipolar_gen.l_start_reg[2][8] ,
    \bipolar_gen.l_start_reg[2][12] ,
    \bipolar_gen.l_start_reg[2][16] ,
    \bipolar_gen.l_start_reg[2][17] ,
    \bipolar_gen.h_end_reg[2][12]_1 ,
    \bipolar_gen.h_end_reg[2][12]_2 ,
    \bipolar_gen.h_end_reg[2][8] ,
    \bipolar_gen.h_end_reg[2][17] ,
    \bipolar_gen.h_end_reg[2][16] ,
    \bipolar_gen.h_end_reg[2][12]_3 ,
    D,
    Q,
    s_axis_aclk);
  output [16:0]P;
  output [0:0]DI;
  output [0:0]S;
  output [3:0]\bipolar_gen.h_end_reg[2][12] ;
  output [3:0]\bipolar_gen.h_end_reg[2][12]_0 ;
  output [3:0]\bipolar_gen.h_end_reg[2][4] ;
  output [3:0]\bipolar_gen.l_start_reg[2][4] ;
  output [3:0]\bipolar_gen.l_start_reg[2][8] ;
  output [3:0]\bipolar_gen.l_start_reg[2][12] ;
  output [3:0]\bipolar_gen.l_start_reg[2][16] ;
  output [0:0]\bipolar_gen.l_start_reg[2][17] ;
  output [2:0]\bipolar_gen.h_end_reg[2][12]_1 ;
  output [3:0]\bipolar_gen.h_end_reg[2][12]_2 ;
  output [3:0]\bipolar_gen.h_end_reg[2][8] ;
  output [0:0]\bipolar_gen.h_end_reg[2][17] ;
  output [3:0]\bipolar_gen.h_end_reg[2][16] ;
  output [3:0]\bipolar_gen.h_end_reg[2][12]_3 ;
  output [0:0]D;
  input [16:0]Q;
  input s_axis_aclk;

  wire [0:0]D;
  wire [0:0]DI;
  wire [16:0]P;
  wire [16:0]Q;
  wire [6:0]RESULT_OUT;
  wire [0:0]S;
  wire [3:0]\bipolar_gen.h_end_reg[2][12] ;
  wire [3:0]\bipolar_gen.h_end_reg[2][12]_0 ;
  wire [2:0]\bipolar_gen.h_end_reg[2][12]_1 ;
  wire [3:0]\bipolar_gen.h_end_reg[2][12]_2 ;
  wire [3:0]\bipolar_gen.h_end_reg[2][12]_3 ;
  wire [3:0]\bipolar_gen.h_end_reg[2][16] ;
  wire [0:0]\bipolar_gen.h_end_reg[2][17] ;
  wire [3:0]\bipolar_gen.h_end_reg[2][4] ;
  wire [3:0]\bipolar_gen.h_end_reg[2][8] ;
  wire [3:0]\bipolar_gen.l_start_reg[2][12] ;
  wire [3:0]\bipolar_gen.l_start_reg[2][16] ;
  wire [0:0]\bipolar_gen.l_start_reg[2][17] ;
  wire [3:0]\bipolar_gen.l_start_reg[2][4] ;
  wire [3:0]\bipolar_gen.l_start_reg[2][8] ;
  wire [33:33]\mult_p[2]_2 ;
  wire s_axis_aclk;
  wire \v5.v5_2.DSP48E_1_n_60 ;
  wire \v5.v5_2.DSP48E_1_n_61 ;
  wire \v5.v5_2.DSP48E_1_n_80 ;
  wire \v5.v5_2.DSP48E_1_n_81 ;
  wire \v5.v5_2.DSP48E_1_n_82 ;
  wire \v5.v5_2.DSP48E_1_n_83 ;
  wire \v5.v5_2.DSP48E_1_n_84 ;
  wire \v5.v5_2.DSP48E_1_n_85 ;
  wire \v5.v5_2.DSP48E_1_n_86 ;
  wire \v5.v5_2.DSP48E_1_n_87 ;
  wire \v5.v5_2.DSP48E_1_n_88 ;
  wire \v5.v5_2.DSP48E_1_n_89 ;
  wire \v5.v5_2.DSP48E_1_n_90 ;
  wire \v5.v5_2.DSP48E_1_n_91 ;
  wire \v5.v5_2.DSP48E_1_n_92 ;
  wire \v5.v5_2.DSP48E_1_n_93 ;
  wire \v5.v5_2.DSP48E_1_n_94 ;
  wire \v5.v5_2.DSP48E_1_n_95 ;
  wire \NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED ;
  wire [47:43]\NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED ;
  wire [47:0]\NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \bipolar_gen.h_end[2][0]_i_1 
       (.I0(P[0]),
        .O(D));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_1__14
       (.I0(P[8]),
        .O(\bipolar_gen.l_start_reg[2][8] [3]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_1__3
       (.I0(P[14]),
        .I1(P[15]),
        .O(\bipolar_gen.h_end_reg[2][12]_2 [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1__8
       (.I0(P[8]),
        .O(\bipolar_gen.h_end_reg[2][8] [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_2__14
       (.I0(P[7]),
        .O(\bipolar_gen.l_start_reg[2][8] [2]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_2__4
       (.I0(P[12]),
        .I1(P[13]),
        .O(\bipolar_gen.h_end_reg[2][12]_2 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2__9
       (.I0(P[7]),
        .O(\bipolar_gen.h_end_reg[2][8] [2]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_3__1
       (.I0(P[10]),
        .I1(P[11]),
        .O(\bipolar_gen.h_end_reg[2][12]_2 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3__2
       (.I0(P[6]),
        .O(\bipolar_gen.h_end_reg[2][8] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_3__7
       (.I0(P[6]),
        .O(\bipolar_gen.l_start_reg[2][8] [1]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_4__3
       (.I0(P[8]),
        .I1(P[9]),
        .O(\bipolar_gen.h_end_reg[2][12]_2 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4__4
       (.I0(P[5]),
        .O(\bipolar_gen.h_end_reg[2][8] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__0_i_4__7
       (.I0(P[5]),
        .O(\bipolar_gen.l_start_reg[2][8] [0]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_5
       (.I0(P[14]),
        .I1(P[15]),
        .O(\bipolar_gen.h_end_reg[2][12] [3]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_6
       (.I0(P[12]),
        .I1(P[13]),
        .O(\bipolar_gen.h_end_reg[2][12] [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_7
       (.I0(P[10]),
        .I1(P[11]),
        .O(\bipolar_gen.h_end_reg[2][12] [1]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_8
       (.I0(P[8]),
        .I1(P[9]),
        .O(\bipolar_gen.h_end_reg[2][12] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1
       (.I0(P[12]),
        .O(\bipolar_gen.h_end_reg[2][12]_3 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry__1_i_1__2
       (.I0(P[16]),
        .I1(\mult_p[2]_2 ),
        .O(DI));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_1__7
       (.I0(P[12]),
        .O(\bipolar_gen.l_start_reg[2][12] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2
       (.I0(P[11]),
        .O(\bipolar_gen.h_end_reg[2][12]_3 [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_2__2
       (.I0(P[16]),
        .I1(\mult_p[2]_2 ),
        .O(S));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_2__7
       (.I0(P[11]),
        .O(\bipolar_gen.l_start_reg[2][12] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_3
       (.I0(P[10]),
        .O(\bipolar_gen.h_end_reg[2][12]_3 [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_3__4
       (.I0(P[10]),
        .O(\bipolar_gen.l_start_reg[2][12] [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_4
       (.I0(P[9]),
        .O(\bipolar_gen.h_end_reg[2][12]_3 [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__1_i_4__4
       (.I0(P[9]),
        .O(\bipolar_gen.l_start_reg[2][12] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_1
       (.I0(P[16]),
        .O(\bipolar_gen.h_end_reg[2][16] [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_1__4
       (.I0(P[16]),
        .O(\bipolar_gen.l_start_reg[2][16] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_2
       (.I0(P[15]),
        .O(\bipolar_gen.h_end_reg[2][16] [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_2__4
       (.I0(P[15]),
        .O(\bipolar_gen.l_start_reg[2][16] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_3
       (.I0(P[14]),
        .O(\bipolar_gen.h_end_reg[2][16] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_3__4
       (.I0(P[14]),
        .O(\bipolar_gen.l_start_reg[2][16] [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_4
       (.I0(P[13]),
        .O(\bipolar_gen.h_end_reg[2][16] [0]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__2_i_4__4
       (.I0(P[13]),
        .O(\bipolar_gen.l_start_reg[2][16] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_1
       (.I0(\mult_p[2]_2 ),
        .O(\bipolar_gen.h_end_reg[2][17] ));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry__3_i_1__4
       (.I0(\mult_p[2]_2 ),
        .O(\bipolar_gen.l_start_reg[2][17] ));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__10
       (.I0(P[4]),
        .O(\bipolar_gen.l_start_reg[2][4] [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_1__14
       (.I0(P[4]),
        .O(\bipolar_gen.h_end_reg[2][4] [3]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_1__4
       (.I0(P[6]),
        .I1(P[7]),
        .O(\bipolar_gen.h_end_reg[2][12]_1 [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_2__14
       (.I0(P[3]),
        .O(\bipolar_gen.h_end_reg[2][4] [2]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_2__3
       (.I0(P[2]),
        .I1(P[3]),
        .O(\bipolar_gen.h_end_reg[2][12]_1 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2__8
       (.I0(P[3]),
        .O(\bipolar_gen.l_start_reg[2][4] [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_3__14
       (.I0(P[2]),
        .O(\bipolar_gen.l_start_reg[2][4] [1]));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_3__4
       (.I0(P[0]),
        .I1(P[1]),
        .O(\bipolar_gen.h_end_reg[2][12]_1 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3__9
       (.I0(P[2]),
        .O(\bipolar_gen.h_end_reg[2][4] [1]));
  LUT1 #(
    .INIT(2'h2)) 
    i__carry_i_4__14
       (.I0(P[1]),
        .O(\bipolar_gen.l_start_reg[2][4] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4__3
       (.I0(P[1]),
        .O(\bipolar_gen.h_end_reg[2][4] [0]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_4__9
       (.I0(P[6]),
        .I1(P[7]),
        .O(\bipolar_gen.h_end_reg[2][12]_0 [3]));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_5__1
       (.I0(P[4]),
        .I1(P[5]),
        .O(\bipolar_gen.h_end_reg[2][12]_0 [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_6
       (.I0(P[2]),
        .I1(P[3]),
        .O(\bipolar_gen.h_end_reg[2][12]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_7
       (.I0(P[1]),
        .I1(P[0]),
        .O(\bipolar_gen.h_end_reg[2][12]_0 [0]));
  (* XILINX_LEGACY_PRIM = "DSP48E" *) 
  (* box_type = "PRIMITIVE" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(0),
    .ALUMODEREG(1),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .CREG(1),
    .DREG(0),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(1),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \v5.v5_2.DSP48E_1 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,Q[16],Q,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED [17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(1'b0),
        .CEA2(1'b1),
        .CEAD(1'b1),
        .CEALUMODE(1'b1),
        .CEB1(1'b0),
        .CEB2(1'b1),
        .CEC(1'b1),
        .CECARRYIN(1'b1),
        .CECTRL(1'b1),
        .CED(1'b1),
        .CEINMODE(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(s_axis_aclk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED ),
        .P({\NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED [47:43],\v5.v5_2.DSP48E_1_n_60 ,\v5.v5_2.DSP48E_1_n_61 ,\mult_p[2]_2 ,P,\v5.v5_2.DSP48E_1_n_80 ,\v5.v5_2.DSP48E_1_n_81 ,\v5.v5_2.DSP48E_1_n_82 ,\v5.v5_2.DSP48E_1_n_83 ,\v5.v5_2.DSP48E_1_n_84 ,\v5.v5_2.DSP48E_1_n_85 ,\v5.v5_2.DSP48E_1_n_86 ,\v5.v5_2.DSP48E_1_n_87 ,\v5.v5_2.DSP48E_1_n_88 ,\v5.v5_2.DSP48E_1_n_89 ,\v5.v5_2.DSP48E_1_n_90 ,\v5.v5_2.DSP48E_1_n_91 ,\v5.v5_2.DSP48E_1_n_92 ,\v5.v5_2.DSP48E_1_n_93 ,\v5.v5_2.DSP48E_1_n_94 ,\v5.v5_2.DSP48E_1_n_95 ,RESULT_OUT}),
        .PATTERNBDETECT(\NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED ),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(\NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED [47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

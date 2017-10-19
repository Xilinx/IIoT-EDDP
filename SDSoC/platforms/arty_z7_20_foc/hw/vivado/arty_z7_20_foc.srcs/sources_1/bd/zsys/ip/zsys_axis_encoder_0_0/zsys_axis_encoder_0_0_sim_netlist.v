// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
// Date        : Fri Oct  6 12:12:19 2017
// Host        : W7-64-12 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               B:/SVN/cores/2017.1/design/TEC0053/platforms/arty_z7_20_foc/hw/vivado/arty_z7_20_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_encoder_0_0/zsys_axis_encoder_0_0_sim_netlist.v
// Design      : zsys_axis_encoder_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "zsys_axis_encoder_0_0,axis_encoder_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axis_encoder_v1_0,Vivado 2017.1_sdx" *) 
(* NotValidForBitStream *)
module zsys_axis_encoder_0_0
   (A,
    B,
    I,
    angle_data,
    period_data,
    rpm_data,
    axis_aclk,
    axis_aresetn,
    m_angle_tvalid,
    m_angle_tdata,
    m_angle_tready,
    m_rpm_tvalid,
    m_rpm_tdata,
    m_rpm_tready);
  input A;
  input B;
  input I;
  output [15:0]angle_data;
  output [15:0]period_data;
  output [15:0]rpm_data;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 axis_aclk CLK" *) input axis_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 axis_aresetn RST" *) input axis_aresetn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_angle TVALID" *) output m_angle_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_angle TDATA" *) output [15:0]m_angle_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_angle TREADY" *) input m_angle_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_rpm TVALID" *) output m_rpm_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_rpm TDATA" *) output [15:0]m_rpm_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_rpm TREADY" *) input m_rpm_tready;

  wire A;
  wire B;
  wire I;
  wire axis_aclk;
  wire [15:0]m_angle_tdata;
  wire m_angle_tvalid;
  wire [15:0]m_rpm_tdata;
  wire m_rpm_tvalid;
  wire [15:0]period_data;
  wire [15:0]rpm_data;

  assign angle_data[15:0] = m_angle_tdata;
  zsys_axis_encoder_0_0_axis_encoder_v1_0 U0
       (.A(A),
        .B(B),
        .I(I),
        .axis_aclk(axis_aclk),
        .m_angle_tdata(m_angle_tdata),
        .m_angle_tvalid(m_angle_tvalid),
        .m_rpm_tdata(m_rpm_tdata),
        .m_rpm_tvalid(m_rpm_tvalid),
        .period_data(period_data),
        .rpm_data(rpm_data));
endmodule

(* ORIG_REF_NAME = "axis_encoder_v1_0" *) 
module zsys_axis_encoder_0_0_axis_encoder_v1_0
   (m_angle_tdata,
    period_data,
    rpm_data,
    m_angle_tvalid,
    m_rpm_tvalid,
    m_rpm_tdata,
    axis_aclk,
    A,
    I,
    B);
  output [15:0]m_angle_tdata;
  output [15:0]period_data;
  output [15:0]rpm_data;
  output m_angle_tvalid;
  output m_rpm_tvalid;
  output [15:0]m_rpm_tdata;
  input axis_aclk;
  input A;
  input I;
  input B;

  wire A;
  wire B;
  wire I;
  wire a_f;
  wire a_i;
  wire [1:0]a_sr;
  wire axis_aclk;
  wire b_f;
  wire b_i;
  wire [15:0]clip_down_angle;
  wire [15:2]clip_down_angle0;
  wire clip_down_angle0_carry__0_i_1_n_0;
  wire clip_down_angle0_carry__0_i_2_n_0;
  wire clip_down_angle0_carry__0_i_3_n_0;
  wire clip_down_angle0_carry__0_i_4_n_0;
  wire clip_down_angle0_carry__0_n_0;
  wire clip_down_angle0_carry__0_n_1;
  wire clip_down_angle0_carry__0_n_2;
  wire clip_down_angle0_carry__0_n_3;
  wire clip_down_angle0_carry__1_i_1_n_0;
  wire clip_down_angle0_carry__1_i_2_n_0;
  wire clip_down_angle0_carry__1_i_3_n_0;
  wire clip_down_angle0_carry__1_i_4_n_0;
  wire clip_down_angle0_carry__1_n_0;
  wire clip_down_angle0_carry__1_n_1;
  wire clip_down_angle0_carry__1_n_2;
  wire clip_down_angle0_carry__1_n_3;
  wire clip_down_angle0_carry__2_i_1_n_0;
  wire clip_down_angle0_carry__2_i_2_n_0;
  wire clip_down_angle0_carry__2_n_3;
  wire clip_down_angle0_carry_i_1_n_0;
  wire clip_down_angle0_carry_i_2_n_0;
  wire clip_down_angle0_carry_i_3_n_0;
  wire clip_down_angle0_carry_i_4_n_0;
  wire clip_down_angle0_carry_n_0;
  wire clip_down_angle0_carry_n_1;
  wire clip_down_angle0_carry_n_2;
  wire clip_down_angle0_carry_n_3;
  wire \clip_down_angle[10]_i_1_n_0 ;
  wire \clip_down_angle[11]_i_1_n_0 ;
  wire \clip_down_angle[12]_i_1_n_0 ;
  wire \clip_down_angle[13]_i_1_n_0 ;
  wire \clip_down_angle[14]_i_1_n_0 ;
  wire \clip_down_angle[15]_i_1_n_0 ;
  wire \clip_down_angle[2]_i_1_n_0 ;
  wire \clip_down_angle[3]_i_1_n_0 ;
  wire \clip_down_angle[4]_i_1_n_0 ;
  wire \clip_down_angle[5]_i_1_n_0 ;
  wire \clip_down_angle[6]_i_1_n_0 ;
  wire \clip_down_angle[7]_i_1_n_0 ;
  wire \clip_down_angle[8]_i_1_n_0 ;
  wire \clip_down_angle[9]_i_1_n_0 ;
  wire [15:0]clip_up_angle;
  wire [15:2]clip_up_angle0;
  wire clip_up_angle0_carry__0_i_1_n_0;
  wire clip_up_angle0_carry__0_i_2_n_0;
  wire clip_up_angle0_carry__0_i_3_n_0;
  wire clip_up_angle0_carry__0_i_4_n_0;
  wire clip_up_angle0_carry__0_n_0;
  wire clip_up_angle0_carry__0_n_1;
  wire clip_up_angle0_carry__0_n_2;
  wire clip_up_angle0_carry__0_n_3;
  wire clip_up_angle0_carry__1_i_1_n_0;
  wire clip_up_angle0_carry__1_i_2_n_0;
  wire clip_up_angle0_carry__1_i_3_n_0;
  wire clip_up_angle0_carry__1_i_4_n_0;
  wire clip_up_angle0_carry__1_n_0;
  wire clip_up_angle0_carry__1_n_1;
  wire clip_up_angle0_carry__1_n_2;
  wire clip_up_angle0_carry__1_n_3;
  wire clip_up_angle0_carry__2_i_1_n_0;
  wire clip_up_angle0_carry__2_i_2_n_0;
  wire clip_up_angle0_carry__2_n_3;
  wire clip_up_angle0_carry_i_1_n_0;
  wire clip_up_angle0_carry_i_2_n_0;
  wire clip_up_angle0_carry_i_3_n_0;
  wire clip_up_angle0_carry_i_4_n_0;
  wire clip_up_angle0_carry_n_0;
  wire clip_up_angle0_carry_n_1;
  wire clip_up_angle0_carry_n_2;
  wire clip_up_angle0_carry_n_3;
  wire clip_up_angle1;
  wire clip_up_angle1_carry__0_i_1_n_0;
  wire clip_up_angle1_carry__0_i_2_n_0;
  wire clip_up_angle1_carry__0_i_3_n_0;
  wire clip_up_angle1_carry__0_i_4_n_0;
  wire clip_up_angle1_carry__0_i_5_n_0;
  wire clip_up_angle1_carry__0_i_6_n_0;
  wire clip_up_angle1_carry__0_i_7_n_0;
  wire clip_up_angle1_carry__0_n_1;
  wire clip_up_angle1_carry__0_n_2;
  wire clip_up_angle1_carry__0_n_3;
  wire clip_up_angle1_carry_i_1_n_0;
  wire clip_up_angle1_carry_i_2_n_0;
  wire clip_up_angle1_carry_i_3_n_0;
  wire clip_up_angle1_carry_i_4_n_0;
  wire clip_up_angle1_carry_i_5_n_0;
  wire clip_up_angle1_carry_i_6_n_0;
  wire clip_up_angle1_carry_i_7_n_0;
  wire clip_up_angle1_carry_n_0;
  wire clip_up_angle1_carry_n_1;
  wire clip_up_angle1_carry_n_2;
  wire clip_up_angle1_carry_n_3;
  wire \clip_up_angle[10]_i_1_n_0 ;
  wire \clip_up_angle[11]_i_1_n_0 ;
  wire \clip_up_angle[12]_i_1_n_0 ;
  wire \clip_up_angle[13]_i_1_n_0 ;
  wire \clip_up_angle[14]_i_1_n_0 ;
  wire \clip_up_angle[15]_i_1_n_0 ;
  wire \clip_up_angle[2]_i_1_n_0 ;
  wire \clip_up_angle[3]_i_1_n_0 ;
  wire \clip_up_angle[4]_i_1_n_0 ;
  wire \clip_up_angle[5]_i_1_n_0 ;
  wire \clip_up_angle[6]_i_1_n_0 ;
  wire \clip_up_angle[7]_i_1_n_0 ;
  wire \clip_up_angle[8]_i_1_n_0 ;
  wire \clip_up_angle[9]_i_1_n_0 ;
  wire [15:0]cnt;
  wire \cnt[12]_i_10_n_0 ;
  wire \cnt[12]_i_11_n_0 ;
  wire \cnt[12]_i_4_n_0 ;
  wire \cnt[12]_i_5_n_0 ;
  wire \cnt[12]_i_6_n_0 ;
  wire \cnt[12]_i_7_n_0 ;
  wire \cnt[12]_i_8_n_0 ;
  wire \cnt[12]_i_9_n_0 ;
  wire \cnt[15]_i_10_n_0 ;
  wire \cnt[15]_i_11_n_0 ;
  wire \cnt[15]_i_12_n_0 ;
  wire \cnt[15]_i_13_n_0 ;
  wire \cnt[15]_i_14_n_0 ;
  wire \cnt[15]_i_15_n_0 ;
  wire \cnt[15]_i_16_n_0 ;
  wire \cnt[15]_i_17_n_0 ;
  wire \cnt[15]_i_18_n_0 ;
  wire \cnt[15]_i_19_n_0 ;
  wire \cnt[15]_i_1_n_0 ;
  wire \cnt[15]_i_20_n_0 ;
  wire \cnt[15]_i_21_n_0 ;
  wire \cnt[15]_i_2_n_0 ;
  wire \cnt[15]_i_5_n_0 ;
  wire \cnt[15]_i_7_n_0 ;
  wire \cnt[15]_i_8_n_0 ;
  wire \cnt[15]_i_9_n_0 ;
  wire \cnt[4]_i_10_n_0 ;
  wire \cnt[4]_i_11_n_0 ;
  wire \cnt[4]_i_4_n_0 ;
  wire \cnt[4]_i_5_n_0 ;
  wire \cnt[4]_i_6_n_0 ;
  wire \cnt[4]_i_7_n_0 ;
  wire \cnt[4]_i_8_n_0 ;
  wire \cnt[4]_i_9_n_0 ;
  wire \cnt[8]_i_10_n_0 ;
  wire \cnt[8]_i_11_n_0 ;
  wire \cnt[8]_i_4_n_0 ;
  wire \cnt[8]_i_5_n_0 ;
  wire \cnt[8]_i_6_n_0 ;
  wire \cnt[8]_i_7_n_0 ;
  wire \cnt[8]_i_8_n_0 ;
  wire \cnt[8]_i_9_n_0 ;
  wire \cnt_reg[12]_i_2_n_0 ;
  wire \cnt_reg[12]_i_2_n_1 ;
  wire \cnt_reg[12]_i_2_n_2 ;
  wire \cnt_reg[12]_i_2_n_3 ;
  wire \cnt_reg[12]_i_3_n_0 ;
  wire \cnt_reg[12]_i_3_n_1 ;
  wire \cnt_reg[12]_i_3_n_2 ;
  wire \cnt_reg[12]_i_3_n_3 ;
  wire \cnt_reg[12]_i_3_n_4 ;
  wire \cnt_reg[12]_i_3_n_5 ;
  wire \cnt_reg[12]_i_3_n_6 ;
  wire \cnt_reg[12]_i_3_n_7 ;
  wire \cnt_reg[15]_i_4_n_2 ;
  wire \cnt_reg[15]_i_4_n_3 ;
  wire \cnt_reg[15]_i_6_n_2 ;
  wire \cnt_reg[15]_i_6_n_3 ;
  wire \cnt_reg[15]_i_6_n_5 ;
  wire \cnt_reg[15]_i_6_n_6 ;
  wire \cnt_reg[15]_i_6_n_7 ;
  wire \cnt_reg[4]_i_2_n_0 ;
  wire \cnt_reg[4]_i_2_n_1 ;
  wire \cnt_reg[4]_i_2_n_2 ;
  wire \cnt_reg[4]_i_2_n_3 ;
  wire \cnt_reg[4]_i_3_n_0 ;
  wire \cnt_reg[4]_i_3_n_1 ;
  wire \cnt_reg[4]_i_3_n_2 ;
  wire \cnt_reg[4]_i_3_n_3 ;
  wire \cnt_reg[4]_i_3_n_4 ;
  wire \cnt_reg[4]_i_3_n_5 ;
  wire \cnt_reg[4]_i_3_n_6 ;
  wire \cnt_reg[4]_i_3_n_7 ;
  wire \cnt_reg[8]_i_2_n_0 ;
  wire \cnt_reg[8]_i_2_n_1 ;
  wire \cnt_reg[8]_i_2_n_2 ;
  wire \cnt_reg[8]_i_2_n_3 ;
  wire \cnt_reg[8]_i_3_n_0 ;
  wire \cnt_reg[8]_i_3_n_1 ;
  wire \cnt_reg[8]_i_3_n_2 ;
  wire \cnt_reg[8]_i_3_n_3 ;
  wire \cnt_reg[8]_i_3_n_4 ;
  wire \cnt_reg[8]_i_3_n_5 ;
  wire \cnt_reg[8]_i_3_n_6 ;
  wire \cnt_reg[8]_i_3_n_7 ;
  wire [15:0]corr_angle;
  wire [15:0]corr_angle0;
  wire \corr_angle[11]_i_2_n_0 ;
  wire \corr_angle[11]_i_3_n_0 ;
  wire \corr_angle[11]_i_4_n_0 ;
  wire \corr_angle[11]_i_5_n_0 ;
  wire \corr_angle[15]_i_2_n_0 ;
  wire \corr_angle[15]_i_3_n_0 ;
  wire \corr_angle[15]_i_4_n_0 ;
  wire \corr_angle[15]_i_5_n_0 ;
  wire \corr_angle[3]_i_2_n_0 ;
  wire \corr_angle[3]_i_3_n_0 ;
  wire \corr_angle[3]_i_4_n_0 ;
  wire \corr_angle[3]_i_5_n_0 ;
  wire \corr_angle[7]_i_2_n_0 ;
  wire \corr_angle[7]_i_3_n_0 ;
  wire \corr_angle[7]_i_4_n_0 ;
  wire \corr_angle[7]_i_5_n_0 ;
  wire \corr_angle_reg[11]_i_1_n_0 ;
  wire \corr_angle_reg[11]_i_1_n_1 ;
  wire \corr_angle_reg[11]_i_1_n_2 ;
  wire \corr_angle_reg[11]_i_1_n_3 ;
  wire \corr_angle_reg[15]_i_1_n_1 ;
  wire \corr_angle_reg[15]_i_1_n_2 ;
  wire \corr_angle_reg[15]_i_1_n_3 ;
  wire \corr_angle_reg[3]_i_1_n_0 ;
  wire \corr_angle_reg[3]_i_1_n_1 ;
  wire \corr_angle_reg[3]_i_1_n_2 ;
  wire \corr_angle_reg[3]_i_1_n_3 ;
  wire \corr_angle_reg[7]_i_1_n_0 ;
  wire \corr_angle_reg[7]_i_1_n_1 ;
  wire \corr_angle_reg[7]_i_1_n_2 ;
  wire \corr_angle_reg[7]_i_1_n_3 ;
  wire [15:1]data0;
  wire \div_cnt[0]_i_2_n_0 ;
  wire \div_cnt[0]_i_3_n_0 ;
  wire \div_cnt[0]_i_4_n_0 ;
  wire \div_cnt[0]_i_5_n_0 ;
  wire \div_cnt[12]_i_2_n_0 ;
  wire \div_cnt[12]_i_3_n_0 ;
  wire \div_cnt[12]_i_4_n_0 ;
  wire \div_cnt[12]_i_5_n_0 ;
  wire \div_cnt[4]_i_2_n_0 ;
  wire \div_cnt[4]_i_3_n_0 ;
  wire \div_cnt[4]_i_4_n_0 ;
  wire \div_cnt[4]_i_5_n_0 ;
  wire \div_cnt[8]_i_2_n_0 ;
  wire \div_cnt[8]_i_3_n_0 ;
  wire \div_cnt[8]_i_4_n_0 ;
  wire \div_cnt[8]_i_5_n_0 ;
  wire [15:0]div_cnt_reg;
  wire \div_cnt_reg[0]_i_1_n_0 ;
  wire \div_cnt_reg[0]_i_1_n_1 ;
  wire \div_cnt_reg[0]_i_1_n_2 ;
  wire \div_cnt_reg[0]_i_1_n_3 ;
  wire \div_cnt_reg[0]_i_1_n_4 ;
  wire \div_cnt_reg[0]_i_1_n_5 ;
  wire \div_cnt_reg[0]_i_1_n_6 ;
  wire \div_cnt_reg[0]_i_1_n_7 ;
  wire \div_cnt_reg[12]_i_1_n_1 ;
  wire \div_cnt_reg[12]_i_1_n_2 ;
  wire \div_cnt_reg[12]_i_1_n_3 ;
  wire \div_cnt_reg[12]_i_1_n_4 ;
  wire \div_cnt_reg[12]_i_1_n_5 ;
  wire \div_cnt_reg[12]_i_1_n_6 ;
  wire \div_cnt_reg[12]_i_1_n_7 ;
  wire \div_cnt_reg[4]_i_1_n_0 ;
  wire \div_cnt_reg[4]_i_1_n_1 ;
  wire \div_cnt_reg[4]_i_1_n_2 ;
  wire \div_cnt_reg[4]_i_1_n_3 ;
  wire \div_cnt_reg[4]_i_1_n_4 ;
  wire \div_cnt_reg[4]_i_1_n_5 ;
  wire \div_cnt_reg[4]_i_1_n_6 ;
  wire \div_cnt_reg[4]_i_1_n_7 ;
  wire \div_cnt_reg[8]_i_1_n_0 ;
  wire \div_cnt_reg[8]_i_1_n_1 ;
  wire \div_cnt_reg[8]_i_1_n_2 ;
  wire \div_cnt_reg[8]_i_1_n_3 ;
  wire \div_cnt_reg[8]_i_1_n_4 ;
  wire \div_cnt_reg[8]_i_1_n_5 ;
  wire \div_cnt_reg[8]_i_1_n_6 ;
  wire \div_cnt_reg[8]_i_1_n_7 ;
  wire [31:0]div_value;
  wire [31:0]div_value0;
  wire \div_value0_inferred__0/i__carry__0_n_0 ;
  wire \div_value0_inferred__0/i__carry__0_n_1 ;
  wire \div_value0_inferred__0/i__carry__0_n_2 ;
  wire \div_value0_inferred__0/i__carry__0_n_3 ;
  wire \div_value0_inferred__0/i__carry__1_n_0 ;
  wire \div_value0_inferred__0/i__carry__1_n_1 ;
  wire \div_value0_inferred__0/i__carry__1_n_2 ;
  wire \div_value0_inferred__0/i__carry__1_n_3 ;
  wire \div_value0_inferred__0/i__carry__2_n_0 ;
  wire \div_value0_inferred__0/i__carry__2_n_1 ;
  wire \div_value0_inferred__0/i__carry__2_n_2 ;
  wire \div_value0_inferred__0/i__carry__2_n_3 ;
  wire \div_value0_inferred__0/i__carry__3_n_0 ;
  wire \div_value0_inferred__0/i__carry__3_n_1 ;
  wire \div_value0_inferred__0/i__carry__3_n_2 ;
  wire \div_value0_inferred__0/i__carry__3_n_3 ;
  wire \div_value0_inferred__0/i__carry__4_n_0 ;
  wire \div_value0_inferred__0/i__carry__4_n_1 ;
  wire \div_value0_inferred__0/i__carry__4_n_2 ;
  wire \div_value0_inferred__0/i__carry__4_n_3 ;
  wire \div_value0_inferred__0/i__carry__5_n_0 ;
  wire \div_value0_inferred__0/i__carry__5_n_1 ;
  wire \div_value0_inferred__0/i__carry__5_n_2 ;
  wire \div_value0_inferred__0/i__carry__5_n_3 ;
  wire \div_value0_inferred__0/i__carry__6_n_1 ;
  wire \div_value0_inferred__0/i__carry__6_n_2 ;
  wire \div_value0_inferred__0/i__carry__6_n_3 ;
  wire \div_value0_inferred__0/i__carry_n_0 ;
  wire \div_value0_inferred__0/i__carry_n_1 ;
  wire \div_value0_inferred__0/i__carry_n_2 ;
  wire \div_value0_inferred__0/i__carry_n_3 ;
  wire div_value1_carry__0_i_1_n_0;
  wire div_value1_carry__0_i_2_n_0;
  wire div_value1_carry__0_i_3_n_0;
  wire div_value1_carry__0_i_4_n_0;
  wire div_value1_carry__0_i_5_n_0;
  wire div_value1_carry__0_i_6_n_0;
  wire div_value1_carry__0_i_7_n_0;
  wire div_value1_carry__0_i_8_n_0;
  wire div_value1_carry__0_n_0;
  wire div_value1_carry__0_n_1;
  wire div_value1_carry__0_n_2;
  wire div_value1_carry__0_n_3;
  wire div_value1_carry__1_i_1_n_0;
  wire div_value1_carry__1_i_2_n_0;
  wire div_value1_carry__1_i_3_n_0;
  wire div_value1_carry__1_i_4_n_0;
  wire div_value1_carry__1_i_5_n_0;
  wire div_value1_carry__1_i_6_n_0;
  wire div_value1_carry__1_i_7_n_0;
  wire div_value1_carry__1_i_8_n_0;
  wire div_value1_carry__1_n_0;
  wire div_value1_carry__1_n_1;
  wire div_value1_carry__1_n_2;
  wire div_value1_carry__1_n_3;
  wire div_value1_carry__2_i_1_n_0;
  wire div_value1_carry__2_i_2_n_0;
  wire div_value1_carry__2_i_3_n_0;
  wire div_value1_carry__2_i_4_n_0;
  wire div_value1_carry__2_i_5_n_0;
  wire div_value1_carry__2_i_6_n_0;
  wire div_value1_carry__2_i_7_n_0;
  wire div_value1_carry__2_i_8_n_0;
  wire div_value1_carry__2_n_0;
  wire div_value1_carry__2_n_1;
  wire div_value1_carry__2_n_2;
  wire div_value1_carry__2_n_3;
  wire div_value1_carry_i_1_n_0;
  wire div_value1_carry_i_2_n_0;
  wire div_value1_carry_i_3_n_0;
  wire div_value1_carry_i_4_n_0;
  wire div_value1_carry_i_5_n_0;
  wire div_value1_carry_i_6_n_0;
  wire div_value1_carry_i_7_n_0;
  wire div_value1_carry_i_8_n_0;
  wire div_value1_carry_n_0;
  wire div_value1_carry_n_1;
  wire div_value1_carry_n_2;
  wire div_value1_carry_n_3;
  wire \div_value[31]_i_1_n_0 ;
  wire [31:0]divider;
  wire \divider[31]_i_1_n_0 ;
  wire \dp_valid_reg[2]_srl3_n_0 ;
  wire \filter_a_cnt[0]_i_1_n_0 ;
  wire \filter_a_cnt[1]_i_1_n_0 ;
  wire \filter_a_cnt[2]_i_1_n_0 ;
  wire \filter_a_cnt[3]_i_1_n_0 ;
  wire \filter_a_cnt[4]_i_1_n_0 ;
  wire \filter_a_cnt[4]_i_2_n_0 ;
  wire [4:0]filter_a_cnt_reg__0;
  wire \filter_b_cnt[0]_i_1_n_0 ;
  wire \filter_b_cnt[1]_i_1_n_0 ;
  wire \filter_b_cnt[2]_i_1_n_0 ;
  wire \filter_b_cnt[3]_i_1_n_0 ;
  wire \filter_b_cnt[4]_i_1_n_0 ;
  wire \filter_b_cnt[4]_i_2_n_0 ;
  wire [4:0]filter_b_cnt_reg__0;
  wire \filter_i_cnt[0]_i_1_n_0 ;
  wire \filter_i_cnt[1]_i_1_n_0 ;
  wire \filter_i_cnt[2]_i_1_n_0 ;
  wire \filter_i_cnt[3]_i_1_n_0 ;
  wire \filter_i_cnt[4]_i_1_n_0 ;
  wire \filter_i_cnt[4]_i_2_n_0 ;
  wire [4:0]filter_i_cnt_reg__0;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__1_i_4_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__2_i_2_n_0;
  wire i__carry__2_i_3_n_0;
  wire i__carry__2_i_4_n_0;
  wire i__carry__3_i_1_n_0;
  wire i__carry__3_i_2_n_0;
  wire i__carry__3_i_3_n_0;
  wire i__carry__3_i_4_n_0;
  wire i__carry__4_i_1_n_0;
  wire i__carry__4_i_2_n_0;
  wire i__carry__4_i_3_n_0;
  wire i__carry__4_i_4_n_0;
  wire i__carry__5_i_1_n_0;
  wire i__carry__5_i_2_n_0;
  wire i__carry__5_i_3_n_0;
  wire i__carry__5_i_4_n_0;
  wire i__carry__6_i_1_n_0;
  wire i__carry__6_i_2_n_0;
  wire i__carry__6_i_3_n_0;
  wire i__carry__6_i_4_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i_f;
  wire i_i;
  wire [15:0]m_angle_tdata;
  wire m_angle_tvalid;
  wire m_period_tvalid0_carry__0_i_1_n_0;
  wire m_period_tvalid0_carry__0_i_2_n_0;
  wire m_period_tvalid0_carry__0_i_3_n_0;
  wire m_period_tvalid0_carry__0_i_4_n_0;
  wire m_period_tvalid0_carry__0_i_5_n_0;
  wire m_period_tvalid0_carry__0_i_6_n_0;
  wire m_period_tvalid0_carry__0_i_7_n_0;
  wire m_period_tvalid0_carry__0_i_8_n_0;
  wire m_period_tvalid0_carry__0_n_0;
  wire m_period_tvalid0_carry__0_n_1;
  wire m_period_tvalid0_carry__0_n_2;
  wire m_period_tvalid0_carry__0_n_3;
  wire m_period_tvalid0_carry__1_i_1_n_0;
  wire m_period_tvalid0_carry__1_i_2_n_0;
  wire m_period_tvalid0_carry__1_i_3_n_0;
  wire m_period_tvalid0_carry__1_i_4_n_0;
  wire m_period_tvalid0_carry__1_i_5_n_0;
  wire m_period_tvalid0_carry__1_i_6_n_0;
  wire m_period_tvalid0_carry__1_i_7_n_0;
  wire m_period_tvalid0_carry__1_i_8_n_0;
  wire m_period_tvalid0_carry__1_n_0;
  wire m_period_tvalid0_carry__1_n_1;
  wire m_period_tvalid0_carry__1_n_2;
  wire m_period_tvalid0_carry__1_n_3;
  wire m_period_tvalid0_carry__2_i_1_n_0;
  wire m_period_tvalid0_carry__2_i_2_n_0;
  wire m_period_tvalid0_carry__2_i_3_n_0;
  wire m_period_tvalid0_carry__2_i_4_n_0;
  wire m_period_tvalid0_carry__2_i_5_n_0;
  wire m_period_tvalid0_carry__2_i_6_n_0;
  wire m_period_tvalid0_carry__2_i_7_n_0;
  wire m_period_tvalid0_carry__2_i_8_n_0;
  wire m_period_tvalid0_carry__2_n_0;
  wire m_period_tvalid0_carry__2_n_1;
  wire m_period_tvalid0_carry__2_n_2;
  wire m_period_tvalid0_carry__2_n_3;
  wire m_period_tvalid0_carry_i_1_n_0;
  wire m_period_tvalid0_carry_i_2_n_0;
  wire m_period_tvalid0_carry_i_3_n_0;
  wire m_period_tvalid0_carry_i_4_n_0;
  wire m_period_tvalid0_carry_i_5_n_0;
  wire m_period_tvalid0_carry_i_6_n_0;
  wire m_period_tvalid0_carry_i_7_n_0;
  wire m_period_tvalid0_carry_i_8_n_0;
  wire m_period_tvalid0_carry_n_0;
  wire m_period_tvalid0_carry_n_1;
  wire m_period_tvalid0_carry_n_2;
  wire m_period_tvalid0_carry_n_3;
  wire [15:0]m_rpm_tdata;
  wire m_rpm_tvalid;
  wire m_rpm_tvalid_i_1_n_0;
  wire \out_period_cnt[0]_i_1_n_0 ;
  wire \out_period_cnt[1]_i_1_n_0 ;
  wire \out_period_cnt[2]_i_1_n_0 ;
  wire \out_period_cnt[3]_i_1_n_0 ;
  wire \out_period_cnt[4]_i_1_n_0 ;
  wire \out_period_cnt[5]_i_1_n_0 ;
  wire \out_period_cnt_reg_n_0_[0] ;
  wire \out_period_cnt_reg_n_0_[1] ;
  wire \out_period_cnt_reg_n_0_[2] ;
  wire \out_period_cnt_reg_n_0_[3] ;
  wire \out_period_cnt_reg_n_0_[4] ;
  wire \out_period_cnt_reg_n_0_[5] ;
  wire p_0_in;
  wire [15:0]p_1_in;
  wire \period_cnt[0]_i_1_n_0 ;
  wire \period_cnt[0]_i_3_n_0 ;
  wire \period_cnt[0]_i_4_n_0 ;
  wire \period_cnt[0]_i_5_n_0 ;
  wire \period_cnt[0]_i_6_n_0 ;
  wire \period_cnt[12]_i_2_n_0 ;
  wire \period_cnt[12]_i_3_n_0 ;
  wire \period_cnt[12]_i_4_n_0 ;
  wire \period_cnt[12]_i_5_n_0 ;
  wire \period_cnt[16]_i_2_n_0 ;
  wire \period_cnt[16]_i_3_n_0 ;
  wire \period_cnt[16]_i_4_n_0 ;
  wire \period_cnt[16]_i_5_n_0 ;
  wire \period_cnt[20]_i_2_n_0 ;
  wire \period_cnt[20]_i_3_n_0 ;
  wire \period_cnt[20]_i_4_n_0 ;
  wire \period_cnt[20]_i_5_n_0 ;
  wire \period_cnt[24]_i_2_n_0 ;
  wire \period_cnt[24]_i_3_n_0 ;
  wire \period_cnt[24]_i_4_n_0 ;
  wire \period_cnt[24]_i_5_n_0 ;
  wire \period_cnt[28]_i_2_n_0 ;
  wire \period_cnt[28]_i_3_n_0 ;
  wire \period_cnt[28]_i_4_n_0 ;
  wire \period_cnt[28]_i_5_n_0 ;
  wire \period_cnt[4]_i_2_n_0 ;
  wire \period_cnt[4]_i_3_n_0 ;
  wire \period_cnt[4]_i_4_n_0 ;
  wire \period_cnt[4]_i_5_n_0 ;
  wire \period_cnt[8]_i_2_n_0 ;
  wire \period_cnt[8]_i_3_n_0 ;
  wire \period_cnt[8]_i_4_n_0 ;
  wire \period_cnt[8]_i_5_n_0 ;
  wire [31:0]period_cnt_reg;
  wire \period_cnt_reg[0]_i_2_n_0 ;
  wire \period_cnt_reg[0]_i_2_n_1 ;
  wire \period_cnt_reg[0]_i_2_n_2 ;
  wire \period_cnt_reg[0]_i_2_n_3 ;
  wire \period_cnt_reg[0]_i_2_n_4 ;
  wire \period_cnt_reg[0]_i_2_n_5 ;
  wire \period_cnt_reg[0]_i_2_n_6 ;
  wire \period_cnt_reg[0]_i_2_n_7 ;
  wire \period_cnt_reg[12]_i_1_n_0 ;
  wire \period_cnt_reg[12]_i_1_n_1 ;
  wire \period_cnt_reg[12]_i_1_n_2 ;
  wire \period_cnt_reg[12]_i_1_n_3 ;
  wire \period_cnt_reg[12]_i_1_n_4 ;
  wire \period_cnt_reg[12]_i_1_n_5 ;
  wire \period_cnt_reg[12]_i_1_n_6 ;
  wire \period_cnt_reg[12]_i_1_n_7 ;
  wire \period_cnt_reg[16]_i_1_n_0 ;
  wire \period_cnt_reg[16]_i_1_n_1 ;
  wire \period_cnt_reg[16]_i_1_n_2 ;
  wire \period_cnt_reg[16]_i_1_n_3 ;
  wire \period_cnt_reg[16]_i_1_n_4 ;
  wire \period_cnt_reg[16]_i_1_n_5 ;
  wire \period_cnt_reg[16]_i_1_n_6 ;
  wire \period_cnt_reg[16]_i_1_n_7 ;
  wire \period_cnt_reg[20]_i_1_n_0 ;
  wire \period_cnt_reg[20]_i_1_n_1 ;
  wire \period_cnt_reg[20]_i_1_n_2 ;
  wire \period_cnt_reg[20]_i_1_n_3 ;
  wire \period_cnt_reg[20]_i_1_n_4 ;
  wire \period_cnt_reg[20]_i_1_n_5 ;
  wire \period_cnt_reg[20]_i_1_n_6 ;
  wire \period_cnt_reg[20]_i_1_n_7 ;
  wire \period_cnt_reg[24]_i_1_n_0 ;
  wire \period_cnt_reg[24]_i_1_n_1 ;
  wire \period_cnt_reg[24]_i_1_n_2 ;
  wire \period_cnt_reg[24]_i_1_n_3 ;
  wire \period_cnt_reg[24]_i_1_n_4 ;
  wire \period_cnt_reg[24]_i_1_n_5 ;
  wire \period_cnt_reg[24]_i_1_n_6 ;
  wire \period_cnt_reg[24]_i_1_n_7 ;
  wire \period_cnt_reg[28]_i_1_n_1 ;
  wire \period_cnt_reg[28]_i_1_n_2 ;
  wire \period_cnt_reg[28]_i_1_n_3 ;
  wire \period_cnt_reg[28]_i_1_n_4 ;
  wire \period_cnt_reg[28]_i_1_n_5 ;
  wire \period_cnt_reg[28]_i_1_n_6 ;
  wire \period_cnt_reg[28]_i_1_n_7 ;
  wire \period_cnt_reg[4]_i_1_n_0 ;
  wire \period_cnt_reg[4]_i_1_n_1 ;
  wire \period_cnt_reg[4]_i_1_n_2 ;
  wire \period_cnt_reg[4]_i_1_n_3 ;
  wire \period_cnt_reg[4]_i_1_n_4 ;
  wire \period_cnt_reg[4]_i_1_n_5 ;
  wire \period_cnt_reg[4]_i_1_n_6 ;
  wire \period_cnt_reg[4]_i_1_n_7 ;
  wire \period_cnt_reg[8]_i_1_n_0 ;
  wire \period_cnt_reg[8]_i_1_n_1 ;
  wire \period_cnt_reg[8]_i_1_n_2 ;
  wire \period_cnt_reg[8]_i_1_n_3 ;
  wire \period_cnt_reg[8]_i_1_n_4 ;
  wire \period_cnt_reg[8]_i_1_n_5 ;
  wire \period_cnt_reg[8]_i_1_n_6 ;
  wire \period_cnt_reg[8]_i_1_n_7 ;
  wire [15:0]period_data;
  wire period_dir;
  wire period_dir_i_1_n_0;
  wire [31:0]period_prev;
  wire [31:16]period_value;
  wire \period_value[15]_i_1_n_0 ;
  wire \period_value[15]_i_2_n_0 ;
  wire \period_value[15]_i_3_n_0 ;
  wire \period_value[15]_i_4_n_0 ;
  wire \period_value[15]_i_5_n_0 ;
  wire \period_value[15]_i_6_n_0 ;
  wire \period_value[15]_i_7_n_0 ;
  wire \period_value[15]_i_8_n_0 ;
  wire \period_value[15]_i_9_n_0 ;
  wire [15:0]rpm_data;
  wire \rpm_data_i[15]_i_10_n_0 ;
  wire \rpm_data_i[15]_i_1_n_0 ;
  wire \rpm_data_i[15]_i_2_n_0 ;
  wire \rpm_data_i[15]_i_3_n_0 ;
  wire \rpm_data_i[15]_i_4_n_0 ;
  wire \rpm_data_i[15]_i_5_n_0 ;
  wire \rpm_data_i[15]_i_6_n_0 ;
  wire \rpm_data_i[15]_i_7_n_0 ;
  wire \rpm_data_i[15]_i_8_n_0 ;
  wire \rpm_data_i[15]_i_9_n_0 ;
  wire sm_state;
  wire sm_state_i_1_n_0;
  wire update;
  wire [3:1]NLW_clip_down_angle0_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_clip_down_angle0_carry__2_O_UNCONNECTED;
  wire [3:1]NLW_clip_up_angle0_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_clip_up_angle0_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_clip_up_angle1_carry_O_UNCONNECTED;
  wire [3:0]NLW_clip_up_angle1_carry__0_O_UNCONNECTED;
  wire [3:2]\NLW_cnt_reg[15]_i_4_CO_UNCONNECTED ;
  wire [3:3]\NLW_cnt_reg[15]_i_4_O_UNCONNECTED ;
  wire [3:2]\NLW_cnt_reg[15]_i_6_CO_UNCONNECTED ;
  wire [3:3]\NLW_cnt_reg[15]_i_6_O_UNCONNECTED ;
  wire [3:3]\NLW_corr_angle_reg[15]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_div_cnt_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_div_value0_inferred__0/i__carry__6_CO_UNCONNECTED ;
  wire [3:0]NLW_div_value1_carry_O_UNCONNECTED;
  wire [3:0]NLW_div_value1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_div_value1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_div_value1_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_m_period_tvalid0_carry_O_UNCONNECTED;
  wire [3:0]NLW_m_period_tvalid0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_m_period_tvalid0_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_m_period_tvalid0_carry__2_O_UNCONNECTED;
  wire [3:3]\NLW_period_cnt_reg[28]_i_1_CO_UNCONNECTED ;

  FDRE a_f_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(filter_a_cnt_reg__0[4]),
        .Q(a_f),
        .R(1'b0));
  FDRE a_i_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(A),
        .Q(a_i),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_sr_reg[0] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(a_f),
        .Q(a_sr[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_sr_reg[1] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(a_sr[0]),
        .Q(a_sr[1]),
        .R(1'b0));
  FDRE b_f_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(filter_b_cnt_reg__0[4]),
        .Q(b_f),
        .R(1'b0));
  FDRE b_i_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(B),
        .Q(b_i),
        .R(1'b0));
  CARRY4 clip_down_angle0_carry
       (.CI(1'b0),
        .CO({clip_down_angle0_carry_n_0,clip_down_angle0_carry_n_1,clip_down_angle0_carry_n_2,clip_down_angle0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({clip_up_angle[5],1'b0,clip_up_angle[3],1'b0}),
        .O(clip_down_angle0[5:2]),
        .S({clip_down_angle0_carry_i_1_n_0,clip_down_angle0_carry_i_2_n_0,clip_down_angle0_carry_i_3_n_0,clip_down_angle0_carry_i_4_n_0}));
  CARRY4 clip_down_angle0_carry__0
       (.CI(clip_down_angle0_carry_n_0),
        .CO({clip_down_angle0_carry__0_n_0,clip_down_angle0_carry__0_n_1,clip_down_angle0_carry__0_n_2,clip_down_angle0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(clip_up_angle[9:6]),
        .O(clip_down_angle0[9:6]),
        .S({clip_down_angle0_carry__0_i_1_n_0,clip_down_angle0_carry__0_i_2_n_0,clip_down_angle0_carry__0_i_3_n_0,clip_down_angle0_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    clip_down_angle0_carry__0_i_1
       (.I0(clip_up_angle[9]),
        .O(clip_down_angle0_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_down_angle0_carry__0_i_2
       (.I0(clip_up_angle[8]),
        .O(clip_down_angle0_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_down_angle0_carry__0_i_3
       (.I0(clip_up_angle[7]),
        .O(clip_down_angle0_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_down_angle0_carry__0_i_4
       (.I0(clip_up_angle[6]),
        .O(clip_down_angle0_carry__0_i_4_n_0));
  CARRY4 clip_down_angle0_carry__1
       (.CI(clip_down_angle0_carry__0_n_0),
        .CO({clip_down_angle0_carry__1_n_0,clip_down_angle0_carry__1_n_1,clip_down_angle0_carry__1_n_2,clip_down_angle0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(clip_down_angle0[13:10]),
        .S({clip_down_angle0_carry__1_i_1_n_0,clip_down_angle0_carry__1_i_2_n_0,clip_down_angle0_carry__1_i_3_n_0,clip_down_angle0_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h2)) 
    clip_down_angle0_carry__1_i_1
       (.I0(clip_up_angle[13]),
        .O(clip_down_angle0_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_down_angle0_carry__1_i_2
       (.I0(clip_up_angle[12]),
        .O(clip_down_angle0_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_down_angle0_carry__1_i_3
       (.I0(clip_up_angle[11]),
        .O(clip_down_angle0_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_down_angle0_carry__1_i_4
       (.I0(clip_up_angle[10]),
        .O(clip_down_angle0_carry__1_i_4_n_0));
  CARRY4 clip_down_angle0_carry__2
       (.CI(clip_down_angle0_carry__1_n_0),
        .CO({NLW_clip_down_angle0_carry__2_CO_UNCONNECTED[3:1],clip_down_angle0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_clip_down_angle0_carry__2_O_UNCONNECTED[3:2],clip_down_angle0[15:14]}),
        .S({1'b0,1'b0,clip_down_angle0_carry__2_i_1_n_0,clip_down_angle0_carry__2_i_2_n_0}));
  LUT1 #(
    .INIT(2'h2)) 
    clip_down_angle0_carry__2_i_1
       (.I0(clip_up_angle[15]),
        .O(clip_down_angle0_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_down_angle0_carry__2_i_2
       (.I0(clip_up_angle[14]),
        .O(clip_down_angle0_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_down_angle0_carry_i_1
       (.I0(clip_up_angle[5]),
        .O(clip_down_angle0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_down_angle0_carry_i_2
       (.I0(clip_up_angle[4]),
        .O(clip_down_angle0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_down_angle0_carry_i_3
       (.I0(clip_up_angle[3]),
        .O(clip_down_angle0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_down_angle0_carry_i_4
       (.I0(clip_up_angle[2]),
        .O(clip_down_angle0_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[10]_i_1 
       (.I0(clip_down_angle0[10]),
        .I1(clip_up_angle[10]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[11]_i_1 
       (.I0(clip_down_angle0[11]),
        .I1(clip_up_angle[11]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[12]_i_1 
       (.I0(clip_down_angle0[12]),
        .I1(clip_up_angle[12]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[13]_i_1 
       (.I0(clip_down_angle0[13]),
        .I1(clip_up_angle[13]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[14]_i_1 
       (.I0(clip_down_angle0[14]),
        .I1(clip_up_angle[14]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \clip_down_angle[15]_i_1 
       (.I0(clip_down_angle0[15]),
        .I1(clip_up_angle[15]),
        .O(\clip_down_angle[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[2]_i_1 
       (.I0(clip_down_angle0[2]),
        .I1(clip_up_angle[2]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[3]_i_1 
       (.I0(clip_down_angle0[3]),
        .I1(clip_up_angle[3]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[4]_i_1 
       (.I0(clip_down_angle0[4]),
        .I1(clip_up_angle[4]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[5]_i_1 
       (.I0(clip_down_angle0[5]),
        .I1(clip_up_angle[5]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[6]_i_1 
       (.I0(clip_down_angle0[6]),
        .I1(clip_up_angle[6]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[7]_i_1 
       (.I0(clip_down_angle0[7]),
        .I1(clip_up_angle[7]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[8]_i_1 
       (.I0(clip_down_angle0[8]),
        .I1(clip_up_angle[8]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_down_angle[9]_i_1 
       (.I0(clip_down_angle0[9]),
        .I1(clip_up_angle[9]),
        .I2(clip_up_angle[15]),
        .O(\clip_down_angle[9]_i_1_n_0 ));
  FDRE \clip_down_angle_reg[0] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(clip_up_angle[0]),
        .Q(clip_down_angle[0]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[10] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[10]_i_1_n_0 ),
        .Q(clip_down_angle[10]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[11] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[11]_i_1_n_0 ),
        .Q(clip_down_angle[11]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[12] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[12]_i_1_n_0 ),
        .Q(clip_down_angle[12]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[13] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[13]_i_1_n_0 ),
        .Q(clip_down_angle[13]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[14] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[14]_i_1_n_0 ),
        .Q(clip_down_angle[14]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[15] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[15]_i_1_n_0 ),
        .Q(clip_down_angle[15]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[1] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(clip_up_angle[1]),
        .Q(clip_down_angle[1]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[2] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[2]_i_1_n_0 ),
        .Q(clip_down_angle[2]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[3] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[3]_i_1_n_0 ),
        .Q(clip_down_angle[3]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[4] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[4]_i_1_n_0 ),
        .Q(clip_down_angle[4]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[5] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[5]_i_1_n_0 ),
        .Q(clip_down_angle[5]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[6] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[6]_i_1_n_0 ),
        .Q(clip_down_angle[6]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[7] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[7]_i_1_n_0 ),
        .Q(clip_down_angle[7]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[8] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[8]_i_1_n_0 ),
        .Q(clip_down_angle[8]),
        .R(1'b0));
  FDRE \clip_down_angle_reg[9] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_down_angle[9]_i_1_n_0 ),
        .Q(clip_down_angle[9]),
        .R(1'b0));
  CARRY4 clip_up_angle0_carry
       (.CI(1'b0),
        .CO({clip_up_angle0_carry_n_0,clip_up_angle0_carry_n_1,clip_up_angle0_carry_n_2,clip_up_angle0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,corr_angle[4:3],1'b0}),
        .O(clip_up_angle0[5:2]),
        .S({clip_up_angle0_carry_i_1_n_0,clip_up_angle0_carry_i_2_n_0,clip_up_angle0_carry_i_3_n_0,clip_up_angle0_carry_i_4_n_0}));
  CARRY4 clip_up_angle0_carry__0
       (.CI(clip_up_angle0_carry_n_0),
        .CO({clip_up_angle0_carry__0_n_0,clip_up_angle0_carry__0_n_1,clip_up_angle0_carry__0_n_2,clip_up_angle0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(clip_up_angle0[9:6]),
        .S({clip_up_angle0_carry__0_i_1_n_0,clip_up_angle0_carry__0_i_2_n_0,clip_up_angle0_carry__0_i_3_n_0,clip_up_angle0_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h2)) 
    clip_up_angle0_carry__0_i_1
       (.I0(corr_angle[9]),
        .O(clip_up_angle0_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_up_angle0_carry__0_i_2
       (.I0(corr_angle[8]),
        .O(clip_up_angle0_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_up_angle0_carry__0_i_3
       (.I0(corr_angle[7]),
        .O(clip_up_angle0_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_up_angle0_carry__0_i_4
       (.I0(corr_angle[6]),
        .O(clip_up_angle0_carry__0_i_4_n_0));
  CARRY4 clip_up_angle0_carry__1
       (.CI(clip_up_angle0_carry__0_n_0),
        .CO({clip_up_angle0_carry__1_n_0,clip_up_angle0_carry__1_n_1,clip_up_angle0_carry__1_n_2,clip_up_angle0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(corr_angle[13:10]),
        .O(clip_up_angle0[13:10]),
        .S({clip_up_angle0_carry__1_i_1_n_0,clip_up_angle0_carry__1_i_2_n_0,clip_up_angle0_carry__1_i_3_n_0,clip_up_angle0_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    clip_up_angle0_carry__1_i_1
       (.I0(corr_angle[13]),
        .O(clip_up_angle0_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_up_angle0_carry__1_i_2
       (.I0(corr_angle[12]),
        .O(clip_up_angle0_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_up_angle0_carry__1_i_3
       (.I0(corr_angle[11]),
        .O(clip_up_angle0_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_up_angle0_carry__1_i_4
       (.I0(corr_angle[10]),
        .O(clip_up_angle0_carry__1_i_4_n_0));
  CARRY4 clip_up_angle0_carry__2
       (.CI(clip_up_angle0_carry__1_n_0),
        .CO({NLW_clip_up_angle0_carry__2_CO_UNCONNECTED[3:1],clip_up_angle0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,corr_angle[14]}),
        .O({NLW_clip_up_angle0_carry__2_O_UNCONNECTED[3:2],clip_up_angle0[15:14]}),
        .S({1'b0,1'b0,clip_up_angle0_carry__2_i_1_n_0,clip_up_angle0_carry__2_i_2_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    clip_up_angle0_carry__2_i_1
       (.I0(corr_angle[15]),
        .O(clip_up_angle0_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_up_angle0_carry__2_i_2
       (.I0(corr_angle[14]),
        .O(clip_up_angle0_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_up_angle0_carry_i_1
       (.I0(corr_angle[5]),
        .O(clip_up_angle0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_up_angle0_carry_i_2
       (.I0(corr_angle[4]),
        .O(clip_up_angle0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clip_up_angle0_carry_i_3
       (.I0(corr_angle[3]),
        .O(clip_up_angle0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    clip_up_angle0_carry_i_4
       (.I0(corr_angle[2]),
        .O(clip_up_angle0_carry_i_4_n_0));
  CARRY4 clip_up_angle1_carry
       (.CI(1'b0),
        .CO({clip_up_angle1_carry_n_0,clip_up_angle1_carry_n_1,clip_up_angle1_carry_n_2,clip_up_angle1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,clip_up_angle1_carry_i_1_n_0,clip_up_angle1_carry_i_2_n_0,clip_up_angle1_carry_i_3_n_0}),
        .O(NLW_clip_up_angle1_carry_O_UNCONNECTED[3:0]),
        .S({clip_up_angle1_carry_i_4_n_0,clip_up_angle1_carry_i_5_n_0,clip_up_angle1_carry_i_6_n_0,clip_up_angle1_carry_i_7_n_0}));
  CARRY4 clip_up_angle1_carry__0
       (.CI(clip_up_angle1_carry_n_0),
        .CO({clip_up_angle1,clip_up_angle1_carry__0_n_1,clip_up_angle1_carry__0_n_2,clip_up_angle1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({clip_up_angle1_carry__0_i_1_n_0,clip_up_angle1_carry__0_i_2_n_0,clip_up_angle1_carry__0_i_3_n_0,1'b0}),
        .O(NLW_clip_up_angle1_carry__0_O_UNCONNECTED[3:0]),
        .S({clip_up_angle1_carry__0_i_4_n_0,clip_up_angle1_carry__0_i_5_n_0,clip_up_angle1_carry__0_i_6_n_0,clip_up_angle1_carry__0_i_7_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    clip_up_angle1_carry__0_i_1
       (.I0(corr_angle[14]),
        .I1(corr_angle[15]),
        .O(clip_up_angle1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    clip_up_angle1_carry__0_i_2
       (.I0(corr_angle[12]),
        .I1(corr_angle[13]),
        .O(clip_up_angle1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    clip_up_angle1_carry__0_i_3
       (.I0(corr_angle[10]),
        .I1(corr_angle[11]),
        .O(clip_up_angle1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clip_up_angle1_carry__0_i_4
       (.I0(corr_angle[14]),
        .I1(corr_angle[15]),
        .O(clip_up_angle1_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clip_up_angle1_carry__0_i_5
       (.I0(corr_angle[12]),
        .I1(corr_angle[13]),
        .O(clip_up_angle1_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clip_up_angle1_carry__0_i_6
       (.I0(corr_angle[10]),
        .I1(corr_angle[11]),
        .O(clip_up_angle1_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    clip_up_angle1_carry__0_i_7
       (.I0(corr_angle[8]),
        .I1(corr_angle[9]),
        .O(clip_up_angle1_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    clip_up_angle1_carry_i_1
       (.I0(corr_angle[4]),
        .I1(corr_angle[5]),
        .O(clip_up_angle1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    clip_up_angle1_carry_i_2
       (.I0(corr_angle[2]),
        .I1(corr_angle[3]),
        .O(clip_up_angle1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    clip_up_angle1_carry_i_3
       (.I0(corr_angle[0]),
        .I1(corr_angle[1]),
        .O(clip_up_angle1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    clip_up_angle1_carry_i_4
       (.I0(corr_angle[6]),
        .I1(corr_angle[7]),
        .O(clip_up_angle1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    clip_up_angle1_carry_i_5
       (.I0(corr_angle[5]),
        .I1(corr_angle[4]),
        .O(clip_up_angle1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    clip_up_angle1_carry_i_6
       (.I0(corr_angle[3]),
        .I1(corr_angle[2]),
        .O(clip_up_angle1_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clip_up_angle1_carry_i_7
       (.I0(corr_angle[0]),
        .I1(corr_angle[1]),
        .O(clip_up_angle1_carry_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[10]_i_1 
       (.I0(clip_up_angle0[10]),
        .I1(corr_angle[10]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[11]_i_1 
       (.I0(clip_up_angle0[11]),
        .I1(corr_angle[11]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[12]_i_1 
       (.I0(clip_up_angle0[12]),
        .I1(corr_angle[12]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[13]_i_1 
       (.I0(clip_up_angle0[13]),
        .I1(corr_angle[13]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[14]_i_1 
       (.I0(clip_up_angle0[14]),
        .I1(corr_angle[14]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[15]_i_1 
       (.I0(clip_up_angle0[15]),
        .I1(corr_angle[15]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[2]_i_1 
       (.I0(clip_up_angle0[2]),
        .I1(corr_angle[2]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[3]_i_1 
       (.I0(clip_up_angle0[3]),
        .I1(corr_angle[3]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[4]_i_1 
       (.I0(clip_up_angle0[4]),
        .I1(corr_angle[4]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[5]_i_1 
       (.I0(clip_up_angle0[5]),
        .I1(corr_angle[5]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[6]_i_1 
       (.I0(clip_up_angle0[6]),
        .I1(corr_angle[6]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[7]_i_1 
       (.I0(clip_up_angle0[7]),
        .I1(corr_angle[7]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[8]_i_1 
       (.I0(clip_up_angle0[8]),
        .I1(corr_angle[8]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \clip_up_angle[9]_i_1 
       (.I0(clip_up_angle0[9]),
        .I1(corr_angle[9]),
        .I2(clip_up_angle1),
        .O(\clip_up_angle[9]_i_1_n_0 ));
  FDRE \clip_up_angle_reg[0] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(corr_angle[0]),
        .Q(clip_up_angle[0]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[10] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[10]_i_1_n_0 ),
        .Q(clip_up_angle[10]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[11] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[11]_i_1_n_0 ),
        .Q(clip_up_angle[11]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[12] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[12]_i_1_n_0 ),
        .Q(clip_up_angle[12]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[13] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[13]_i_1_n_0 ),
        .Q(clip_up_angle[13]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[14] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[14]_i_1_n_0 ),
        .Q(clip_up_angle[14]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[15] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[15]_i_1_n_0 ),
        .Q(clip_up_angle[15]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[1] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(corr_angle[1]),
        .Q(clip_up_angle[1]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[2] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[2]_i_1_n_0 ),
        .Q(clip_up_angle[2]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[3] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[3]_i_1_n_0 ),
        .Q(clip_up_angle[3]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[4] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[4]_i_1_n_0 ),
        .Q(clip_up_angle[4]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[5] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[5]_i_1_n_0 ),
        .Q(clip_up_angle[5]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[6] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[6]_i_1_n_0 ),
        .Q(clip_up_angle[6]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[7] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[7]_i_1_n_0 ),
        .Q(clip_up_angle[7]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[8] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[8]_i_1_n_0 ),
        .Q(clip_up_angle[8]),
        .R(1'b0));
  FDRE \clip_up_angle_reg[9] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\clip_up_angle[9]_i_1_n_0 ),
        .Q(clip_up_angle[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h3F22)) 
    \cnt[0]_i_1 
       (.I0(\cnt[15]_i_5_n_0 ),
        .I1(cnt[0]),
        .I2(\cnt[15]_i_7_n_0 ),
        .I3(b_f),
        .O(p_1_in[0]));
  LUT5 #(
    .INIT(32'hF0008888)) 
    \cnt[10]_i_1 
       (.I0(data0[10]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[12]_i_3_n_6 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[10]));
  LUT5 #(
    .INIT(32'hF0008888)) 
    \cnt[11]_i_1 
       (.I0(data0[11]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[12]_i_3_n_5 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[11]));
  LUT5 #(
    .INIT(32'hF0008888)) 
    \cnt[12]_i_1 
       (.I0(data0[12]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[12]_i_3_n_4 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[12]));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[12]_i_10 
       (.I0(cnt[10]),
        .O(\cnt[12]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[12]_i_11 
       (.I0(cnt[9]),
        .O(\cnt[12]_i_11_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[12]_i_4 
       (.I0(cnt[12]),
        .O(\cnt[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[12]_i_5 
       (.I0(cnt[11]),
        .O(\cnt[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[12]_i_6 
       (.I0(cnt[10]),
        .O(\cnt[12]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[12]_i_7 
       (.I0(cnt[9]),
        .O(\cnt[12]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[12]_i_8 
       (.I0(cnt[12]),
        .O(\cnt[12]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[12]_i_9 
       (.I0(cnt[11]),
        .O(\cnt[12]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hF0008888)) 
    \cnt[13]_i_1 
       (.I0(data0[13]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[15]_i_6_n_7 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[13]));
  LUT5 #(
    .INIT(32'hF0008888)) 
    \cnt[14]_i_1 
       (.I0(data0[14]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[15]_i_6_n_6 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[14]));
  LUT3 #(
    .INIT(8'h40)) 
    \cnt[15]_i_1 
       (.I0(a_sr[1]),
        .I1(a_sr[0]),
        .I2(i_f),
        .O(\cnt[15]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[15]_i_10 
       (.I0(cnt[13]),
        .O(\cnt[15]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \cnt[15]_i_11 
       (.I0(cnt[6]),
        .I1(cnt[5]),
        .I2(cnt[8]),
        .I3(cnt[9]),
        .O(\cnt[15]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \cnt[15]_i_12 
       (.I0(cnt[0]),
        .I1(cnt[7]),
        .I2(cnt[2]),
        .I3(cnt[1]),
        .O(\cnt[15]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[15]_i_13 
       (.I0(cnt[12]),
        .I1(cnt[3]),
        .I2(cnt[15]),
        .I3(cnt[13]),
        .O(\cnt[15]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[15]_i_14 
       (.I0(cnt[10]),
        .I1(cnt[14]),
        .I2(cnt[4]),
        .I3(cnt[11]),
        .O(\cnt[15]_i_14_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[15]_i_15 
       (.I0(cnt[15]),
        .O(\cnt[15]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[15]_i_16 
       (.I0(cnt[14]),
        .O(\cnt[15]_i_16_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[15]_i_17 
       (.I0(cnt[13]),
        .O(\cnt[15]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[15]_i_18 
       (.I0(cnt[10]),
        .I1(cnt[11]),
        .I2(cnt[8]),
        .I3(cnt[9]),
        .O(\cnt[15]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[15]_i_19 
       (.I0(cnt[15]),
        .I1(cnt[14]),
        .I2(cnt[12]),
        .I3(cnt[13]),
        .O(\cnt[15]_i_19_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[15]_i_2 
       (.I0(a_sr[0]),
        .I1(a_sr[1]),
        .O(\cnt[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[15]_i_20 
       (.I0(cnt[2]),
        .I1(cnt[3]),
        .I2(cnt[0]),
        .I3(cnt[1]),
        .O(\cnt[15]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[15]_i_21 
       (.I0(cnt[6]),
        .I1(cnt[7]),
        .I2(cnt[4]),
        .I3(cnt[5]),
        .O(\cnt[15]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'hF0008888)) 
    \cnt[15]_i_3 
       (.I0(data0[15]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[15]_i_6_n_5 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[15]_i_5 
       (.I0(\cnt[15]_i_11_n_0 ),
        .I1(\cnt[15]_i_12_n_0 ),
        .I2(\cnt[15]_i_13_n_0 ),
        .I3(\cnt[15]_i_14_n_0 ),
        .O(\cnt[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[15]_i_7 
       (.I0(\cnt[15]_i_18_n_0 ),
        .I1(\cnt[15]_i_19_n_0 ),
        .I2(\cnt[15]_i_20_n_0 ),
        .I3(\cnt[15]_i_21_n_0 ),
        .O(\cnt[15]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[15]_i_8 
       (.I0(cnt[15]),
        .O(\cnt[15]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[15]_i_9 
       (.I0(cnt[14]),
        .O(\cnt[15]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hF0FF8888)) 
    \cnt[1]_i_1 
       (.I0(data0[1]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[4]_i_3_n_7 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[1]));
  LUT5 #(
    .INIT(32'hF0FF8888)) 
    \cnt[2]_i_1 
       (.I0(data0[2]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[4]_i_3_n_6 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[2]));
  LUT5 #(
    .INIT(32'hF0008888)) 
    \cnt[3]_i_1 
       (.I0(data0[3]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[4]_i_3_n_5 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[3]));
  LUT5 #(
    .INIT(32'hF0008888)) 
    \cnt[4]_i_1 
       (.I0(data0[4]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[4]_i_3_n_4 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[4]_i_10 
       (.I0(cnt[2]),
        .O(\cnt[4]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[4]_i_11 
       (.I0(cnt[1]),
        .O(\cnt[4]_i_11_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[4]_i_4 
       (.I0(cnt[4]),
        .O(\cnt[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[4]_i_5 
       (.I0(cnt[3]),
        .O(\cnt[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[4]_i_6 
       (.I0(cnt[2]),
        .O(\cnt[4]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[4]_i_7 
       (.I0(cnt[1]),
        .O(\cnt[4]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[4]_i_8 
       (.I0(cnt[4]),
        .O(\cnt[4]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[4]_i_9 
       (.I0(cnt[3]),
        .O(\cnt[4]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hF0FF8888)) 
    \cnt[5]_i_1 
       (.I0(data0[5]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[8]_i_3_n_7 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[5]));
  LUT5 #(
    .INIT(32'hF0FF8888)) 
    \cnt[6]_i_1 
       (.I0(data0[6]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[8]_i_3_n_6 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[6]));
  LUT5 #(
    .INIT(32'hF0FF8888)) 
    \cnt[7]_i_1 
       (.I0(data0[7]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[8]_i_3_n_5 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[7]));
  LUT5 #(
    .INIT(32'hF0FF8888)) 
    \cnt[8]_i_1 
       (.I0(data0[8]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[8]_i_3_n_4 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[8]));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[8]_i_10 
       (.I0(cnt[6]),
        .O(\cnt[8]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[8]_i_11 
       (.I0(cnt[5]),
        .O(\cnt[8]_i_11_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[8]_i_4 
       (.I0(cnt[8]),
        .O(\cnt[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[8]_i_5 
       (.I0(cnt[7]),
        .O(\cnt[8]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[8]_i_6 
       (.I0(cnt[6]),
        .O(\cnt[8]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \cnt[8]_i_7 
       (.I0(cnt[5]),
        .O(\cnt[8]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[8]_i_8 
       (.I0(cnt[8]),
        .O(\cnt[8]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[8]_i_9 
       (.I0(cnt[7]),
        .O(\cnt[8]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hF0FF8888)) 
    \cnt[9]_i_1 
       (.I0(data0[9]),
        .I1(\cnt[15]_i_5_n_0 ),
        .I2(\cnt_reg[12]_i_3_n_7 ),
        .I3(\cnt[15]_i_7_n_0 ),
        .I4(b_f),
        .O(p_1_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[0]),
        .Q(cnt[0]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[10]),
        .Q(cnt[10]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[11]),
        .Q(cnt[11]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[12]),
        .Q(cnt[12]),
        .R(\cnt[15]_i_1_n_0 ));
  CARRY4 \cnt_reg[12]_i_2 
       (.CI(\cnt_reg[8]_i_2_n_0 ),
        .CO({\cnt_reg[12]_i_2_n_0 ,\cnt_reg[12]_i_2_n_1 ,\cnt_reg[12]_i_2_n_2 ,\cnt_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S({\cnt[12]_i_4_n_0 ,\cnt[12]_i_5_n_0 ,\cnt[12]_i_6_n_0 ,\cnt[12]_i_7_n_0 }));
  CARRY4 \cnt_reg[12]_i_3 
       (.CI(\cnt_reg[8]_i_3_n_0 ),
        .CO({\cnt_reg[12]_i_3_n_0 ,\cnt_reg[12]_i_3_n_1 ,\cnt_reg[12]_i_3_n_2 ,\cnt_reg[12]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(cnt[12:9]),
        .O({\cnt_reg[12]_i_3_n_4 ,\cnt_reg[12]_i_3_n_5 ,\cnt_reg[12]_i_3_n_6 ,\cnt_reg[12]_i_3_n_7 }),
        .S({\cnt[12]_i_8_n_0 ,\cnt[12]_i_9_n_0 ,\cnt[12]_i_10_n_0 ,\cnt[12]_i_11_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[13] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[13]),
        .Q(cnt[13]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[14] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[14]),
        .Q(cnt[14]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[15] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[15]),
        .Q(cnt[15]),
        .R(\cnt[15]_i_1_n_0 ));
  CARRY4 \cnt_reg[15]_i_4 
       (.CI(\cnt_reg[12]_i_2_n_0 ),
        .CO({\NLW_cnt_reg[15]_i_4_CO_UNCONNECTED [3:2],\cnt_reg[15]_i_4_n_2 ,\cnt_reg[15]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_reg[15]_i_4_O_UNCONNECTED [3],data0[15:13]}),
        .S({1'b0,\cnt[15]_i_8_n_0 ,\cnt[15]_i_9_n_0 ,\cnt[15]_i_10_n_0 }));
  CARRY4 \cnt_reg[15]_i_6 
       (.CI(\cnt_reg[12]_i_3_n_0 ),
        .CO({\NLW_cnt_reg[15]_i_6_CO_UNCONNECTED [3:2],\cnt_reg[15]_i_6_n_2 ,\cnt_reg[15]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,cnt[14:13]}),
        .O({\NLW_cnt_reg[15]_i_6_O_UNCONNECTED [3],\cnt_reg[15]_i_6_n_5 ,\cnt_reg[15]_i_6_n_6 ,\cnt_reg[15]_i_6_n_7 }),
        .S({1'b0,\cnt[15]_i_15_n_0 ,\cnt[15]_i_16_n_0 ,\cnt[15]_i_17_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[1]),
        .Q(cnt[1]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[2]),
        .Q(cnt[2]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[3]),
        .Q(cnt[3]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[4]),
        .Q(cnt[4]),
        .R(\cnt[15]_i_1_n_0 ));
  CARRY4 \cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\cnt_reg[4]_i_2_n_0 ,\cnt_reg[4]_i_2_n_1 ,\cnt_reg[4]_i_2_n_2 ,\cnt_reg[4]_i_2_n_3 }),
        .CYINIT(cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S({\cnt[4]_i_4_n_0 ,\cnt[4]_i_5_n_0 ,\cnt[4]_i_6_n_0 ,\cnt[4]_i_7_n_0 }));
  CARRY4 \cnt_reg[4]_i_3 
       (.CI(1'b0),
        .CO({\cnt_reg[4]_i_3_n_0 ,\cnt_reg[4]_i_3_n_1 ,\cnt_reg[4]_i_3_n_2 ,\cnt_reg[4]_i_3_n_3 }),
        .CYINIT(cnt[0]),
        .DI(cnt[4:1]),
        .O({\cnt_reg[4]_i_3_n_4 ,\cnt_reg[4]_i_3_n_5 ,\cnt_reg[4]_i_3_n_6 ,\cnt_reg[4]_i_3_n_7 }),
        .S({\cnt[4]_i_8_n_0 ,\cnt[4]_i_9_n_0 ,\cnt[4]_i_10_n_0 ,\cnt[4]_i_11_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[5]),
        .Q(cnt[5]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[6]),
        .Q(cnt[6]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[7]),
        .Q(cnt[7]),
        .R(\cnt[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[8]),
        .Q(cnt[8]),
        .R(\cnt[15]_i_1_n_0 ));
  CARRY4 \cnt_reg[8]_i_2 
       (.CI(\cnt_reg[4]_i_2_n_0 ),
        .CO({\cnt_reg[8]_i_2_n_0 ,\cnt_reg[8]_i_2_n_1 ,\cnt_reg[8]_i_2_n_2 ,\cnt_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S({\cnt[8]_i_4_n_0 ,\cnt[8]_i_5_n_0 ,\cnt[8]_i_6_n_0 ,\cnt[8]_i_7_n_0 }));
  CARRY4 \cnt_reg[8]_i_3 
       (.CI(\cnt_reg[4]_i_3_n_0 ),
        .CO({\cnt_reg[8]_i_3_n_0 ,\cnt_reg[8]_i_3_n_1 ,\cnt_reg[8]_i_3_n_2 ,\cnt_reg[8]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(cnt[8:5]),
        .O({\cnt_reg[8]_i_3_n_4 ,\cnt_reg[8]_i_3_n_5 ,\cnt_reg[8]_i_3_n_6 ,\cnt_reg[8]_i_3_n_7 }),
        .S({\cnt[8]_i_8_n_0 ,\cnt[8]_i_9_n_0 ,\cnt[8]_i_10_n_0 ,\cnt[8]_i_11_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(p_1_in[9]),
        .Q(cnt[9]),
        .R(\cnt[15]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[11]_i_2 
       (.I0(cnt[11]),
        .O(\corr_angle[11]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[11]_i_3 
       (.I0(cnt[10]),
        .O(\corr_angle[11]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[11]_i_4 
       (.I0(cnt[9]),
        .O(\corr_angle[11]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[11]_i_5 
       (.I0(cnt[8]),
        .O(\corr_angle[11]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[15]_i_2 
       (.I0(cnt[15]),
        .O(\corr_angle[15]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[15]_i_3 
       (.I0(cnt[14]),
        .O(\corr_angle[15]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[15]_i_4 
       (.I0(cnt[13]),
        .O(\corr_angle[15]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[15]_i_5 
       (.I0(cnt[12]),
        .O(\corr_angle[15]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[3]_i_2 
       (.I0(cnt[3]),
        .O(\corr_angle[3]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[3]_i_3 
       (.I0(cnt[2]),
        .O(\corr_angle[3]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[3]_i_4 
       (.I0(cnt[1]),
        .O(\corr_angle[3]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[3]_i_5 
       (.I0(cnt[0]),
        .O(\corr_angle[3]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[7]_i_2 
       (.I0(cnt[7]),
        .O(\corr_angle[7]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[7]_i_3 
       (.I0(cnt[6]),
        .O(\corr_angle[7]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[7]_i_4 
       (.I0(cnt[5]),
        .O(\corr_angle[7]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \corr_angle[7]_i_5 
       (.I0(cnt[4]),
        .O(\corr_angle[7]_i_5_n_0 ));
  FDRE \corr_angle_reg[0] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[0]),
        .Q(corr_angle[0]),
        .R(1'b0));
  FDRE \corr_angle_reg[10] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[10]),
        .Q(corr_angle[10]),
        .R(1'b0));
  FDRE \corr_angle_reg[11] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[11]),
        .Q(corr_angle[11]),
        .R(1'b0));
  CARRY4 \corr_angle_reg[11]_i_1 
       (.CI(\corr_angle_reg[7]_i_1_n_0 ),
        .CO({\corr_angle_reg[11]_i_1_n_0 ,\corr_angle_reg[11]_i_1_n_1 ,\corr_angle_reg[11]_i_1_n_2 ,\corr_angle_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(cnt[11:8]),
        .O(corr_angle0[11:8]),
        .S({\corr_angle[11]_i_2_n_0 ,\corr_angle[11]_i_3_n_0 ,\corr_angle[11]_i_4_n_0 ,\corr_angle[11]_i_5_n_0 }));
  FDRE \corr_angle_reg[12] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[12]),
        .Q(corr_angle[12]),
        .R(1'b0));
  FDRE \corr_angle_reg[13] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[13]),
        .Q(corr_angle[13]),
        .R(1'b0));
  FDRE \corr_angle_reg[14] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[14]),
        .Q(corr_angle[14]),
        .R(1'b0));
  FDRE \corr_angle_reg[15] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[15]),
        .Q(corr_angle[15]),
        .R(1'b0));
  CARRY4 \corr_angle_reg[15]_i_1 
       (.CI(\corr_angle_reg[11]_i_1_n_0 ),
        .CO({\NLW_corr_angle_reg[15]_i_1_CO_UNCONNECTED [3],\corr_angle_reg[15]_i_1_n_1 ,\corr_angle_reg[15]_i_1_n_2 ,\corr_angle_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,cnt[14:12]}),
        .O(corr_angle0[15:12]),
        .S({\corr_angle[15]_i_2_n_0 ,\corr_angle[15]_i_3_n_0 ,\corr_angle[15]_i_4_n_0 ,\corr_angle[15]_i_5_n_0 }));
  FDRE \corr_angle_reg[1] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[1]),
        .Q(corr_angle[1]),
        .R(1'b0));
  FDRE \corr_angle_reg[2] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[2]),
        .Q(corr_angle[2]),
        .R(1'b0));
  FDRE \corr_angle_reg[3] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[3]),
        .Q(corr_angle[3]),
        .R(1'b0));
  CARRY4 \corr_angle_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\corr_angle_reg[3]_i_1_n_0 ,\corr_angle_reg[3]_i_1_n_1 ,\corr_angle_reg[3]_i_1_n_2 ,\corr_angle_reg[3]_i_1_n_3 }),
        .CYINIT(1'b1),
        .DI(cnt[3:0]),
        .O(corr_angle0[3:0]),
        .S({\corr_angle[3]_i_2_n_0 ,\corr_angle[3]_i_3_n_0 ,\corr_angle[3]_i_4_n_0 ,\corr_angle[3]_i_5_n_0 }));
  FDRE \corr_angle_reg[4] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[4]),
        .Q(corr_angle[4]),
        .R(1'b0));
  FDRE \corr_angle_reg[5] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[5]),
        .Q(corr_angle[5]),
        .R(1'b0));
  FDRE \corr_angle_reg[6] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[6]),
        .Q(corr_angle[6]),
        .R(1'b0));
  FDRE \corr_angle_reg[7] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[7]),
        .Q(corr_angle[7]),
        .R(1'b0));
  CARRY4 \corr_angle_reg[7]_i_1 
       (.CI(\corr_angle_reg[3]_i_1_n_0 ),
        .CO({\corr_angle_reg[7]_i_1_n_0 ,\corr_angle_reg[7]_i_1_n_1 ,\corr_angle_reg[7]_i_1_n_2 ,\corr_angle_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(cnt[7:4]),
        .O(corr_angle0[7:4]),
        .S({\corr_angle[7]_i_2_n_0 ,\corr_angle[7]_i_3_n_0 ,\corr_angle[7]_i_4_n_0 ,\corr_angle[7]_i_5_n_0 }));
  FDRE \corr_angle_reg[8] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[8]),
        .Q(corr_angle[8]),
        .R(1'b0));
  FDRE \corr_angle_reg[9] 
       (.C(axis_aclk),
        .CE(update),
        .D(corr_angle0[9]),
        .Q(corr_angle[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[0]_i_2 
       (.I0(period_dir),
        .I1(div_cnt_reg[3]),
        .O(\div_cnt[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[0]_i_3 
       (.I0(period_dir),
        .I1(div_cnt_reg[2]),
        .O(\div_cnt[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[0]_i_4 
       (.I0(period_dir),
        .I1(div_cnt_reg[1]),
        .O(\div_cnt[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \div_cnt[0]_i_5 
       (.I0(div_cnt_reg[0]),
        .O(\div_cnt[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[12]_i_2 
       (.I0(period_dir),
        .I1(div_cnt_reg[15]),
        .O(\div_cnt[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[12]_i_3 
       (.I0(period_dir),
        .I1(div_cnt_reg[14]),
        .O(\div_cnt[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[12]_i_4 
       (.I0(period_dir),
        .I1(div_cnt_reg[13]),
        .O(\div_cnt[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[12]_i_5 
       (.I0(period_dir),
        .I1(div_cnt_reg[12]),
        .O(\div_cnt[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[4]_i_2 
       (.I0(period_dir),
        .I1(div_cnt_reg[7]),
        .O(\div_cnt[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[4]_i_3 
       (.I0(period_dir),
        .I1(div_cnt_reg[6]),
        .O(\div_cnt[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[4]_i_4 
       (.I0(period_dir),
        .I1(div_cnt_reg[5]),
        .O(\div_cnt[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[4]_i_5 
       (.I0(period_dir),
        .I1(div_cnt_reg[4]),
        .O(\div_cnt[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[8]_i_2 
       (.I0(period_dir),
        .I1(div_cnt_reg[11]),
        .O(\div_cnt[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[8]_i_3 
       (.I0(period_dir),
        .I1(div_cnt_reg[10]),
        .O(\div_cnt[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[8]_i_4 
       (.I0(period_dir),
        .I1(div_cnt_reg[9]),
        .O(\div_cnt[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \div_cnt[8]_i_5 
       (.I0(period_dir),
        .I1(div_cnt_reg[8]),
        .O(\div_cnt[8]_i_5_n_0 ));
  FDRE \div_cnt_reg[0] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[0]_i_1_n_7 ),
        .Q(div_cnt_reg[0]),
        .R(\divider[31]_i_1_n_0 ));
  CARRY4 \div_cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\div_cnt_reg[0]_i_1_n_0 ,\div_cnt_reg[0]_i_1_n_1 ,\div_cnt_reg[0]_i_1_n_2 ,\div_cnt_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({div_cnt_reg[3:1],1'b1}),
        .O({\div_cnt_reg[0]_i_1_n_4 ,\div_cnt_reg[0]_i_1_n_5 ,\div_cnt_reg[0]_i_1_n_6 ,\div_cnt_reg[0]_i_1_n_7 }),
        .S({\div_cnt[0]_i_2_n_0 ,\div_cnt[0]_i_3_n_0 ,\div_cnt[0]_i_4_n_0 ,\div_cnt[0]_i_5_n_0 }));
  FDRE \div_cnt_reg[10] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[8]_i_1_n_5 ),
        .Q(div_cnt_reg[10]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[11] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[8]_i_1_n_4 ),
        .Q(div_cnt_reg[11]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[12] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[12]_i_1_n_7 ),
        .Q(div_cnt_reg[12]),
        .R(\divider[31]_i_1_n_0 ));
  CARRY4 \div_cnt_reg[12]_i_1 
       (.CI(\div_cnt_reg[8]_i_1_n_0 ),
        .CO({\NLW_div_cnt_reg[12]_i_1_CO_UNCONNECTED [3],\div_cnt_reg[12]_i_1_n_1 ,\div_cnt_reg[12]_i_1_n_2 ,\div_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,div_cnt_reg[14:12]}),
        .O({\div_cnt_reg[12]_i_1_n_4 ,\div_cnt_reg[12]_i_1_n_5 ,\div_cnt_reg[12]_i_1_n_6 ,\div_cnt_reg[12]_i_1_n_7 }),
        .S({\div_cnt[12]_i_2_n_0 ,\div_cnt[12]_i_3_n_0 ,\div_cnt[12]_i_4_n_0 ,\div_cnt[12]_i_5_n_0 }));
  FDRE \div_cnt_reg[13] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[12]_i_1_n_6 ),
        .Q(div_cnt_reg[13]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[14] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[12]_i_1_n_5 ),
        .Q(div_cnt_reg[14]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[15] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[12]_i_1_n_4 ),
        .Q(div_cnt_reg[15]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[1] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[0]_i_1_n_6 ),
        .Q(div_cnt_reg[1]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[2] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[0]_i_1_n_5 ),
        .Q(div_cnt_reg[2]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[3] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[0]_i_1_n_4 ),
        .Q(div_cnt_reg[3]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[4] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[4]_i_1_n_7 ),
        .Q(div_cnt_reg[4]),
        .R(\divider[31]_i_1_n_0 ));
  CARRY4 \div_cnt_reg[4]_i_1 
       (.CI(\div_cnt_reg[0]_i_1_n_0 ),
        .CO({\div_cnt_reg[4]_i_1_n_0 ,\div_cnt_reg[4]_i_1_n_1 ,\div_cnt_reg[4]_i_1_n_2 ,\div_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(div_cnt_reg[7:4]),
        .O({\div_cnt_reg[4]_i_1_n_4 ,\div_cnt_reg[4]_i_1_n_5 ,\div_cnt_reg[4]_i_1_n_6 ,\div_cnt_reg[4]_i_1_n_7 }),
        .S({\div_cnt[4]_i_2_n_0 ,\div_cnt[4]_i_3_n_0 ,\div_cnt[4]_i_4_n_0 ,\div_cnt[4]_i_5_n_0 }));
  FDRE \div_cnt_reg[5] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[4]_i_1_n_6 ),
        .Q(div_cnt_reg[5]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[6] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[4]_i_1_n_5 ),
        .Q(div_cnt_reg[6]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[7] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[4]_i_1_n_4 ),
        .Q(div_cnt_reg[7]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_cnt_reg[8] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[8]_i_1_n_7 ),
        .Q(div_cnt_reg[8]),
        .R(\divider[31]_i_1_n_0 ));
  CARRY4 \div_cnt_reg[8]_i_1 
       (.CI(\div_cnt_reg[4]_i_1_n_0 ),
        .CO({\div_cnt_reg[8]_i_1_n_0 ,\div_cnt_reg[8]_i_1_n_1 ,\div_cnt_reg[8]_i_1_n_2 ,\div_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(div_cnt_reg[11:8]),
        .O({\div_cnt_reg[8]_i_1_n_4 ,\div_cnt_reg[8]_i_1_n_5 ,\div_cnt_reg[8]_i_1_n_6 ,\div_cnt_reg[8]_i_1_n_7 }),
        .S({\div_cnt[8]_i_2_n_0 ,\div_cnt[8]_i_3_n_0 ,\div_cnt[8]_i_4_n_0 ,\div_cnt[8]_i_5_n_0 }));
  FDRE \div_cnt_reg[9] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(\div_cnt_reg[8]_i_1_n_6 ),
        .Q(div_cnt_reg[9]),
        .R(\divider[31]_i_1_n_0 ));
  CARRY4 \div_value0_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\div_value0_inferred__0/i__carry_n_0 ,\div_value0_inferred__0/i__carry_n_1 ,\div_value0_inferred__0/i__carry_n_2 ,\div_value0_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI(div_value[3:0]),
        .O(div_value0[3:0]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  CARRY4 \div_value0_inferred__0/i__carry__0 
       (.CI(\div_value0_inferred__0/i__carry_n_0 ),
        .CO({\div_value0_inferred__0/i__carry__0_n_0 ,\div_value0_inferred__0/i__carry__0_n_1 ,\div_value0_inferred__0/i__carry__0_n_2 ,\div_value0_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(div_value[7:4]),
        .O(div_value0[7:4]),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}));
  CARRY4 \div_value0_inferred__0/i__carry__1 
       (.CI(\div_value0_inferred__0/i__carry__0_n_0 ),
        .CO({\div_value0_inferred__0/i__carry__1_n_0 ,\div_value0_inferred__0/i__carry__1_n_1 ,\div_value0_inferred__0/i__carry__1_n_2 ,\div_value0_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI(div_value[11:8]),
        .O(div_value0[11:8]),
        .S({i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0,i__carry__1_i_4_n_0}));
  CARRY4 \div_value0_inferred__0/i__carry__2 
       (.CI(\div_value0_inferred__0/i__carry__1_n_0 ),
        .CO({\div_value0_inferred__0/i__carry__2_n_0 ,\div_value0_inferred__0/i__carry__2_n_1 ,\div_value0_inferred__0/i__carry__2_n_2 ,\div_value0_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI(div_value[15:12]),
        .O(div_value0[15:12]),
        .S({i__carry__2_i_1_n_0,i__carry__2_i_2_n_0,i__carry__2_i_3_n_0,i__carry__2_i_4_n_0}));
  CARRY4 \div_value0_inferred__0/i__carry__3 
       (.CI(\div_value0_inferred__0/i__carry__2_n_0 ),
        .CO({\div_value0_inferred__0/i__carry__3_n_0 ,\div_value0_inferred__0/i__carry__3_n_1 ,\div_value0_inferred__0/i__carry__3_n_2 ,\div_value0_inferred__0/i__carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI(div_value[19:16]),
        .O(div_value0[19:16]),
        .S({i__carry__3_i_1_n_0,i__carry__3_i_2_n_0,i__carry__3_i_3_n_0,i__carry__3_i_4_n_0}));
  CARRY4 \div_value0_inferred__0/i__carry__4 
       (.CI(\div_value0_inferred__0/i__carry__3_n_0 ),
        .CO({\div_value0_inferred__0/i__carry__4_n_0 ,\div_value0_inferred__0/i__carry__4_n_1 ,\div_value0_inferred__0/i__carry__4_n_2 ,\div_value0_inferred__0/i__carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI(div_value[23:20]),
        .O(div_value0[23:20]),
        .S({i__carry__4_i_1_n_0,i__carry__4_i_2_n_0,i__carry__4_i_3_n_0,i__carry__4_i_4_n_0}));
  CARRY4 \div_value0_inferred__0/i__carry__5 
       (.CI(\div_value0_inferred__0/i__carry__4_n_0 ),
        .CO({\div_value0_inferred__0/i__carry__5_n_0 ,\div_value0_inferred__0/i__carry__5_n_1 ,\div_value0_inferred__0/i__carry__5_n_2 ,\div_value0_inferred__0/i__carry__5_n_3 }),
        .CYINIT(1'b0),
        .DI(div_value[27:24]),
        .O(div_value0[27:24]),
        .S({i__carry__5_i_1_n_0,i__carry__5_i_2_n_0,i__carry__5_i_3_n_0,i__carry__5_i_4_n_0}));
  CARRY4 \div_value0_inferred__0/i__carry__6 
       (.CI(\div_value0_inferred__0/i__carry__5_n_0 ),
        .CO({\NLW_div_value0_inferred__0/i__carry__6_CO_UNCONNECTED [3],\div_value0_inferred__0/i__carry__6_n_1 ,\div_value0_inferred__0/i__carry__6_n_2 ,\div_value0_inferred__0/i__carry__6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,div_value[30:28]}),
        .O(div_value0[31:28]),
        .S({i__carry__6_i_1_n_0,i__carry__6_i_2_n_0,i__carry__6_i_3_n_0,i__carry__6_i_4_n_0}));
  CARRY4 div_value1_carry
       (.CI(1'b0),
        .CO({div_value1_carry_n_0,div_value1_carry_n_1,div_value1_carry_n_2,div_value1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({div_value1_carry_i_1_n_0,div_value1_carry_i_2_n_0,div_value1_carry_i_3_n_0,div_value1_carry_i_4_n_0}),
        .O(NLW_div_value1_carry_O_UNCONNECTED[3:0]),
        .S({div_value1_carry_i_5_n_0,div_value1_carry_i_6_n_0,div_value1_carry_i_7_n_0,div_value1_carry_i_8_n_0}));
  CARRY4 div_value1_carry__0
       (.CI(div_value1_carry_n_0),
        .CO({div_value1_carry__0_n_0,div_value1_carry__0_n_1,div_value1_carry__0_n_2,div_value1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({div_value1_carry__0_i_1_n_0,div_value1_carry__0_i_2_n_0,div_value1_carry__0_i_3_n_0,div_value1_carry__0_i_4_n_0}),
        .O(NLW_div_value1_carry__0_O_UNCONNECTED[3:0]),
        .S({div_value1_carry__0_i_5_n_0,div_value1_carry__0_i_6_n_0,div_value1_carry__0_i_7_n_0,div_value1_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__0_i_1
       (.I0(divider[14]),
        .I1(div_value[14]),
        .I2(div_value[15]),
        .I3(divider[15]),
        .O(div_value1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__0_i_2
       (.I0(divider[12]),
        .I1(div_value[12]),
        .I2(div_value[13]),
        .I3(divider[13]),
        .O(div_value1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__0_i_3
       (.I0(divider[10]),
        .I1(div_value[10]),
        .I2(div_value[11]),
        .I3(divider[11]),
        .O(div_value1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__0_i_4
       (.I0(divider[8]),
        .I1(div_value[8]),
        .I2(div_value[9]),
        .I3(divider[9]),
        .O(div_value1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__0_i_5
       (.I0(divider[14]),
        .I1(div_value[14]),
        .I2(divider[15]),
        .I3(div_value[15]),
        .O(div_value1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__0_i_6
       (.I0(divider[12]),
        .I1(div_value[12]),
        .I2(divider[13]),
        .I3(div_value[13]),
        .O(div_value1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__0_i_7
       (.I0(divider[10]),
        .I1(div_value[10]),
        .I2(divider[11]),
        .I3(div_value[11]),
        .O(div_value1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__0_i_8
       (.I0(divider[8]),
        .I1(div_value[8]),
        .I2(divider[9]),
        .I3(div_value[9]),
        .O(div_value1_carry__0_i_8_n_0));
  CARRY4 div_value1_carry__1
       (.CI(div_value1_carry__0_n_0),
        .CO({div_value1_carry__1_n_0,div_value1_carry__1_n_1,div_value1_carry__1_n_2,div_value1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({div_value1_carry__1_i_1_n_0,div_value1_carry__1_i_2_n_0,div_value1_carry__1_i_3_n_0,div_value1_carry__1_i_4_n_0}),
        .O(NLW_div_value1_carry__1_O_UNCONNECTED[3:0]),
        .S({div_value1_carry__1_i_5_n_0,div_value1_carry__1_i_6_n_0,div_value1_carry__1_i_7_n_0,div_value1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__1_i_1
       (.I0(divider[22]),
        .I1(div_value[22]),
        .I2(div_value[23]),
        .I3(divider[23]),
        .O(div_value1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__1_i_2
       (.I0(divider[20]),
        .I1(div_value[20]),
        .I2(div_value[21]),
        .I3(divider[21]),
        .O(div_value1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__1_i_3
       (.I0(divider[18]),
        .I1(div_value[18]),
        .I2(div_value[19]),
        .I3(divider[19]),
        .O(div_value1_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__1_i_4
       (.I0(divider[16]),
        .I1(div_value[16]),
        .I2(div_value[17]),
        .I3(divider[17]),
        .O(div_value1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__1_i_5
       (.I0(divider[22]),
        .I1(div_value[22]),
        .I2(divider[23]),
        .I3(div_value[23]),
        .O(div_value1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__1_i_6
       (.I0(divider[20]),
        .I1(div_value[20]),
        .I2(divider[21]),
        .I3(div_value[21]),
        .O(div_value1_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__1_i_7
       (.I0(divider[18]),
        .I1(div_value[18]),
        .I2(divider[19]),
        .I3(div_value[19]),
        .O(div_value1_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__1_i_8
       (.I0(divider[16]),
        .I1(div_value[16]),
        .I2(divider[17]),
        .I3(div_value[17]),
        .O(div_value1_carry__1_i_8_n_0));
  CARRY4 div_value1_carry__2
       (.CI(div_value1_carry__1_n_0),
        .CO({div_value1_carry__2_n_0,div_value1_carry__2_n_1,div_value1_carry__2_n_2,div_value1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({div_value1_carry__2_i_1_n_0,div_value1_carry__2_i_2_n_0,div_value1_carry__2_i_3_n_0,div_value1_carry__2_i_4_n_0}),
        .O(NLW_div_value1_carry__2_O_UNCONNECTED[3:0]),
        .S({div_value1_carry__2_i_5_n_0,div_value1_carry__2_i_6_n_0,div_value1_carry__2_i_7_n_0,div_value1_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__2_i_1
       (.I0(divider[30]),
        .I1(div_value[30]),
        .I2(div_value[31]),
        .I3(divider[31]),
        .O(div_value1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__2_i_2
       (.I0(divider[28]),
        .I1(div_value[28]),
        .I2(div_value[29]),
        .I3(divider[29]),
        .O(div_value1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__2_i_3
       (.I0(divider[26]),
        .I1(div_value[26]),
        .I2(div_value[27]),
        .I3(divider[27]),
        .O(div_value1_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry__2_i_4
       (.I0(divider[24]),
        .I1(div_value[24]),
        .I2(div_value[25]),
        .I3(divider[25]),
        .O(div_value1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__2_i_5
       (.I0(divider[30]),
        .I1(div_value[30]),
        .I2(divider[31]),
        .I3(div_value[31]),
        .O(div_value1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__2_i_6
       (.I0(divider[28]),
        .I1(div_value[28]),
        .I2(divider[29]),
        .I3(div_value[29]),
        .O(div_value1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__2_i_7
       (.I0(divider[26]),
        .I1(div_value[26]),
        .I2(divider[27]),
        .I3(div_value[27]),
        .O(div_value1_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry__2_i_8
       (.I0(divider[24]),
        .I1(div_value[24]),
        .I2(divider[25]),
        .I3(div_value[25]),
        .O(div_value1_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry_i_1
       (.I0(divider[6]),
        .I1(div_value[6]),
        .I2(div_value[7]),
        .I3(divider[7]),
        .O(div_value1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry_i_2
       (.I0(divider[4]),
        .I1(div_value[4]),
        .I2(div_value[5]),
        .I3(divider[5]),
        .O(div_value1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry_i_3
       (.I0(divider[2]),
        .I1(div_value[2]),
        .I2(div_value[3]),
        .I3(divider[3]),
        .O(div_value1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    div_value1_carry_i_4
       (.I0(divider[0]),
        .I1(div_value[0]),
        .I2(div_value[1]),
        .I3(divider[1]),
        .O(div_value1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry_i_5
       (.I0(divider[6]),
        .I1(div_value[6]),
        .I2(divider[7]),
        .I3(div_value[7]),
        .O(div_value1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry_i_6
       (.I0(divider[4]),
        .I1(div_value[4]),
        .I2(divider[5]),
        .I3(div_value[5]),
        .O(div_value1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry_i_7
       (.I0(divider[2]),
        .I1(div_value[2]),
        .I2(divider[3]),
        .I3(div_value[3]),
        .O(div_value1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    div_value1_carry_i_8
       (.I0(divider[0]),
        .I1(div_value[0]),
        .I2(divider[1]),
        .I3(div_value[1]),
        .O(div_value1_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \div_value[31]_i_1 
       (.I0(sm_state),
        .I1(div_value1_carry__2_n_0),
        .O(\div_value[31]_i_1_n_0 ));
  FDRE \div_value_reg[0] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[0]),
        .Q(div_value[0]),
        .R(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[10] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[10]),
        .Q(div_value[10]),
        .S(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[11] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[11]),
        .Q(div_value[11]),
        .S(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[12] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[12]),
        .Q(div_value[12]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[13] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[13]),
        .Q(div_value[13]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[14] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[14]),
        .Q(div_value[14]),
        .R(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[15] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[15]),
        .Q(div_value[15]),
        .S(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[16] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[16]),
        .Q(div_value[16]),
        .S(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[17] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[17]),
        .Q(div_value[17]),
        .S(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[18] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[18]),
        .Q(div_value[18]),
        .R(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[19] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[19]),
        .Q(div_value[19]),
        .S(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[1] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[1]),
        .Q(div_value[1]),
        .R(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[20] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[20]),
        .Q(div_value[20]),
        .S(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[21] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[21]),
        .Q(div_value[21]),
        .R(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[22] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[22]),
        .Q(div_value[22]),
        .S(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[23] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[23]),
        .Q(div_value[23]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[24] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[24]),
        .Q(div_value[24]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[25] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[25]),
        .Q(div_value[25]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[26] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[26]),
        .Q(div_value[26]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[27] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[27]),
        .Q(div_value[27]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[28] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[28]),
        .Q(div_value[28]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[29] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[29]),
        .Q(div_value[29]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[2] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[2]),
        .Q(div_value[2]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[30] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[30]),
        .Q(div_value[30]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[31] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[31]),
        .Q(div_value[31]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[3] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[3]),
        .Q(div_value[3]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[4] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[4]),
        .Q(div_value[4]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[5] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[5]),
        .Q(div_value[5]),
        .R(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[6] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[6]),
        .Q(div_value[6]),
        .R(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[7] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[7]),
        .Q(div_value[7]),
        .S(\divider[31]_i_1_n_0 ));
  FDSE \div_value_reg[8] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[8]),
        .Q(div_value[8]),
        .S(\divider[31]_i_1_n_0 ));
  FDRE \div_value_reg[9] 
       (.C(axis_aclk),
        .CE(\div_value[31]_i_1_n_0 ),
        .D(div_value0[9]),
        .Q(div_value[9]),
        .R(\divider[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000FFDF)) 
    \divider[31]_i_1 
       (.I0(\rpm_data_i[15]_i_3_n_0 ),
        .I1(\rpm_data_i[15]_i_4_n_0 ),
        .I2(\rpm_data_i[15]_i_5_n_0 ),
        .I3(\rpm_data_i[15]_i_6_n_0 ),
        .I4(sm_state),
        .O(\divider[31]_i_1_n_0 ));
  FDRE \divider_reg[0] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[0]),
        .Q(divider[0]),
        .R(1'b0));
  FDRE \divider_reg[10] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[10]),
        .Q(divider[10]),
        .R(1'b0));
  FDRE \divider_reg[11] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[11]),
        .Q(divider[11]),
        .R(1'b0));
  FDRE \divider_reg[12] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[12]),
        .Q(divider[12]),
        .R(1'b0));
  FDRE \divider_reg[13] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[13]),
        .Q(divider[13]),
        .R(1'b0));
  FDRE \divider_reg[14] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[14]),
        .Q(divider[14]),
        .R(1'b0));
  FDRE \divider_reg[15] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[15]),
        .Q(divider[15]),
        .R(1'b0));
  FDRE \divider_reg[16] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[16]),
        .Q(divider[16]),
        .R(1'b0));
  FDRE \divider_reg[17] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[17]),
        .Q(divider[17]),
        .R(1'b0));
  FDRE \divider_reg[18] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[18]),
        .Q(divider[18]),
        .R(1'b0));
  FDRE \divider_reg[19] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[19]),
        .Q(divider[19]),
        .R(1'b0));
  FDRE \divider_reg[1] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[1]),
        .Q(divider[1]),
        .R(1'b0));
  FDRE \divider_reg[20] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[20]),
        .Q(divider[20]),
        .R(1'b0));
  FDRE \divider_reg[21] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[21]),
        .Q(divider[21]),
        .R(1'b0));
  FDRE \divider_reg[22] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[22]),
        .Q(divider[22]),
        .R(1'b0));
  FDRE \divider_reg[23] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[23]),
        .Q(divider[23]),
        .R(1'b0));
  FDRE \divider_reg[24] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[24]),
        .Q(divider[24]),
        .R(1'b0));
  FDRE \divider_reg[25] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[25]),
        .Q(divider[25]),
        .R(1'b0));
  FDRE \divider_reg[26] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[26]),
        .Q(divider[26]),
        .R(1'b0));
  FDRE \divider_reg[27] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[27]),
        .Q(divider[27]),
        .R(1'b0));
  FDRE \divider_reg[28] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[28]),
        .Q(divider[28]),
        .R(1'b0));
  FDRE \divider_reg[29] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[29]),
        .Q(divider[29]),
        .R(1'b0));
  FDRE \divider_reg[2] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[2]),
        .Q(divider[2]),
        .R(1'b0));
  FDRE \divider_reg[30] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[30]),
        .Q(divider[30]),
        .R(1'b0));
  FDRE \divider_reg[31] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_value[31]),
        .Q(divider[31]),
        .R(1'b0));
  FDRE \divider_reg[3] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[3]),
        .Q(divider[3]),
        .R(1'b0));
  FDRE \divider_reg[4] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[4]),
        .Q(divider[4]),
        .R(1'b0));
  FDRE \divider_reg[5] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[5]),
        .Q(divider[5]),
        .R(1'b0));
  FDRE \divider_reg[6] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[6]),
        .Q(divider[6]),
        .R(1'b0));
  FDRE \divider_reg[7] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[7]),
        .Q(divider[7]),
        .R(1'b0));
  FDRE \divider_reg[8] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[8]),
        .Q(divider[8]),
        .R(1'b0));
  FDRE \divider_reg[9] 
       (.C(axis_aclk),
        .CE(\divider[31]_i_1_n_0 ),
        .D(period_data[9]),
        .Q(divider[9]),
        .R(1'b0));
  (* srl_bus_name = "\U0/dp_valid_reg " *) 
  (* srl_name = "\U0/dp_valid_reg[2]_srl3 " *) 
  SRL16E \dp_valid_reg[2]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(axis_aclk),
        .D(update),
        .Q(\dp_valid_reg[2]_srl3_n_0 ));
  FDRE \dp_valid_reg[3] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\dp_valid_reg[2]_srl3_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \filter_a_cnt[0]_i_1 
       (.I0(filter_a_cnt_reg__0[0]),
        .O(\filter_a_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \filter_a_cnt[1]_i_1 
       (.I0(filter_a_cnt_reg__0[0]),
        .I1(a_i),
        .I2(filter_a_cnt_reg__0[1]),
        .O(\filter_a_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h78E1)) 
    \filter_a_cnt[2]_i_1 
       (.I0(filter_a_cnt_reg__0[0]),
        .I1(a_i),
        .I2(filter_a_cnt_reg__0[2]),
        .I3(filter_a_cnt_reg__0[1]),
        .O(\filter_a_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7F80FE01)) 
    \filter_a_cnt[3]_i_1 
       (.I0(a_i),
        .I1(filter_a_cnt_reg__0[0]),
        .I2(filter_a_cnt_reg__0[1]),
        .I3(filter_a_cnt_reg__0[3]),
        .I4(filter_a_cnt_reg__0[2]),
        .O(\filter_a_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFE)) 
    \filter_a_cnt[4]_i_1 
       (.I0(a_i),
        .I1(filter_a_cnt_reg__0[3]),
        .I2(filter_a_cnt_reg__0[1]),
        .I3(filter_a_cnt_reg__0[0]),
        .I4(filter_a_cnt_reg__0[4]),
        .I5(filter_a_cnt_reg__0[2]),
        .O(\filter_a_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
    \filter_a_cnt[4]_i_2 
       (.I0(filter_a_cnt_reg__0[1]),
        .I1(filter_a_cnt_reg__0[0]),
        .I2(a_i),
        .I3(filter_a_cnt_reg__0[2]),
        .I4(filter_a_cnt_reg__0[4]),
        .I5(filter_a_cnt_reg__0[3]),
        .O(\filter_a_cnt[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \filter_a_cnt_reg[0] 
       (.C(axis_aclk),
        .CE(\filter_a_cnt[4]_i_1_n_0 ),
        .D(\filter_a_cnt[0]_i_1_n_0 ),
        .Q(filter_a_cnt_reg__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_a_cnt_reg[1] 
       (.C(axis_aclk),
        .CE(\filter_a_cnt[4]_i_1_n_0 ),
        .D(\filter_a_cnt[1]_i_1_n_0 ),
        .Q(filter_a_cnt_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_a_cnt_reg[2] 
       (.C(axis_aclk),
        .CE(\filter_a_cnt[4]_i_1_n_0 ),
        .D(\filter_a_cnt[2]_i_1_n_0 ),
        .Q(filter_a_cnt_reg__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_a_cnt_reg[3] 
       (.C(axis_aclk),
        .CE(\filter_a_cnt[4]_i_1_n_0 ),
        .D(\filter_a_cnt[3]_i_1_n_0 ),
        .Q(filter_a_cnt_reg__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_a_cnt_reg[4] 
       (.C(axis_aclk),
        .CE(\filter_a_cnt[4]_i_1_n_0 ),
        .D(\filter_a_cnt[4]_i_2_n_0 ),
        .Q(filter_a_cnt_reg__0[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \filter_b_cnt[0]_i_1 
       (.I0(filter_b_cnt_reg__0[0]),
        .O(\filter_b_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \filter_b_cnt[1]_i_1 
       (.I0(filter_b_cnt_reg__0[0]),
        .I1(b_i),
        .I2(filter_b_cnt_reg__0[1]),
        .O(\filter_b_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h78E1)) 
    \filter_b_cnt[2]_i_1 
       (.I0(filter_b_cnt_reg__0[0]),
        .I1(b_i),
        .I2(filter_b_cnt_reg__0[2]),
        .I3(filter_b_cnt_reg__0[1]),
        .O(\filter_b_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7F80FE01)) 
    \filter_b_cnt[3]_i_1 
       (.I0(b_i),
        .I1(filter_b_cnt_reg__0[0]),
        .I2(filter_b_cnt_reg__0[1]),
        .I3(filter_b_cnt_reg__0[3]),
        .I4(filter_b_cnt_reg__0[2]),
        .O(\filter_b_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFE)) 
    \filter_b_cnt[4]_i_1 
       (.I0(b_i),
        .I1(filter_b_cnt_reg__0[3]),
        .I2(filter_b_cnt_reg__0[1]),
        .I3(filter_b_cnt_reg__0[0]),
        .I4(filter_b_cnt_reg__0[4]),
        .I5(filter_b_cnt_reg__0[2]),
        .O(\filter_b_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
    \filter_b_cnt[4]_i_2 
       (.I0(filter_b_cnt_reg__0[1]),
        .I1(filter_b_cnt_reg__0[0]),
        .I2(b_i),
        .I3(filter_b_cnt_reg__0[2]),
        .I4(filter_b_cnt_reg__0[4]),
        .I5(filter_b_cnt_reg__0[3]),
        .O(\filter_b_cnt[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \filter_b_cnt_reg[0] 
       (.C(axis_aclk),
        .CE(\filter_b_cnt[4]_i_1_n_0 ),
        .D(\filter_b_cnt[0]_i_1_n_0 ),
        .Q(filter_b_cnt_reg__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_b_cnt_reg[1] 
       (.C(axis_aclk),
        .CE(\filter_b_cnt[4]_i_1_n_0 ),
        .D(\filter_b_cnt[1]_i_1_n_0 ),
        .Q(filter_b_cnt_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_b_cnt_reg[2] 
       (.C(axis_aclk),
        .CE(\filter_b_cnt[4]_i_1_n_0 ),
        .D(\filter_b_cnt[2]_i_1_n_0 ),
        .Q(filter_b_cnt_reg__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_b_cnt_reg[3] 
       (.C(axis_aclk),
        .CE(\filter_b_cnt[4]_i_1_n_0 ),
        .D(\filter_b_cnt[3]_i_1_n_0 ),
        .Q(filter_b_cnt_reg__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_b_cnt_reg[4] 
       (.C(axis_aclk),
        .CE(\filter_b_cnt[4]_i_1_n_0 ),
        .D(\filter_b_cnt[4]_i_2_n_0 ),
        .Q(filter_b_cnt_reg__0[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \filter_i_cnt[0]_i_1 
       (.I0(filter_i_cnt_reg__0[0]),
        .O(\filter_i_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \filter_i_cnt[1]_i_1 
       (.I0(filter_i_cnt_reg__0[0]),
        .I1(i_i),
        .I2(filter_i_cnt_reg__0[1]),
        .O(\filter_i_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h78E1)) 
    \filter_i_cnt[2]_i_1 
       (.I0(filter_i_cnt_reg__0[0]),
        .I1(i_i),
        .I2(filter_i_cnt_reg__0[2]),
        .I3(filter_i_cnt_reg__0[1]),
        .O(\filter_i_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7F80FE01)) 
    \filter_i_cnt[3]_i_1 
       (.I0(i_i),
        .I1(filter_i_cnt_reg__0[0]),
        .I2(filter_i_cnt_reg__0[1]),
        .I3(filter_i_cnt_reg__0[3]),
        .I4(filter_i_cnt_reg__0[2]),
        .O(\filter_i_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFE)) 
    \filter_i_cnt[4]_i_1 
       (.I0(i_i),
        .I1(filter_i_cnt_reg__0[3]),
        .I2(filter_i_cnt_reg__0[1]),
        .I3(filter_i_cnt_reg__0[0]),
        .I4(filter_i_cnt_reg__0[4]),
        .I5(filter_i_cnt_reg__0[2]),
        .O(\filter_i_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
    \filter_i_cnt[4]_i_2 
       (.I0(filter_i_cnt_reg__0[1]),
        .I1(filter_i_cnt_reg__0[0]),
        .I2(i_i),
        .I3(filter_i_cnt_reg__0[2]),
        .I4(filter_i_cnt_reg__0[4]),
        .I5(filter_i_cnt_reg__0[3]),
        .O(\filter_i_cnt[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \filter_i_cnt_reg[0] 
       (.C(axis_aclk),
        .CE(\filter_i_cnt[4]_i_1_n_0 ),
        .D(\filter_i_cnt[0]_i_1_n_0 ),
        .Q(filter_i_cnt_reg__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_i_cnt_reg[1] 
       (.C(axis_aclk),
        .CE(\filter_i_cnt[4]_i_1_n_0 ),
        .D(\filter_i_cnt[1]_i_1_n_0 ),
        .Q(filter_i_cnt_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_i_cnt_reg[2] 
       (.C(axis_aclk),
        .CE(\filter_i_cnt[4]_i_1_n_0 ),
        .D(\filter_i_cnt[2]_i_1_n_0 ),
        .Q(filter_i_cnt_reg__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_i_cnt_reg[3] 
       (.C(axis_aclk),
        .CE(\filter_i_cnt[4]_i_1_n_0 ),
        .D(\filter_i_cnt[3]_i_1_n_0 ),
        .Q(filter_i_cnt_reg__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \filter_i_cnt_reg[4] 
       (.C(axis_aclk),
        .CE(\filter_i_cnt[4]_i_1_n_0 ),
        .D(\filter_i_cnt[4]_i_2_n_0 ),
        .Q(filter_i_cnt_reg__0[4]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_1
       (.I0(div_value[7]),
        .I1(divider[7]),
        .O(i__carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_2
       (.I0(div_value[6]),
        .I1(divider[6]),
        .O(i__carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_3
       (.I0(div_value[5]),
        .I1(divider[5]),
        .O(i__carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_4
       (.I0(div_value[4]),
        .I1(divider[4]),
        .O(i__carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_1
       (.I0(div_value[11]),
        .I1(divider[11]),
        .O(i__carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_2
       (.I0(div_value[10]),
        .I1(divider[10]),
        .O(i__carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_3
       (.I0(div_value[9]),
        .I1(divider[9]),
        .O(i__carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_4
       (.I0(div_value[8]),
        .I1(divider[8]),
        .O(i__carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_1
       (.I0(div_value[15]),
        .I1(divider[15]),
        .O(i__carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_2
       (.I0(div_value[14]),
        .I1(divider[14]),
        .O(i__carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_3
       (.I0(div_value[13]),
        .I1(divider[13]),
        .O(i__carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_4
       (.I0(div_value[12]),
        .I1(divider[12]),
        .O(i__carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_1
       (.I0(div_value[19]),
        .I1(divider[19]),
        .O(i__carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_2
       (.I0(div_value[18]),
        .I1(divider[18]),
        .O(i__carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_3
       (.I0(div_value[17]),
        .I1(divider[17]),
        .O(i__carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_4
       (.I0(div_value[16]),
        .I1(divider[16]),
        .O(i__carry__3_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_1
       (.I0(div_value[23]),
        .I1(divider[23]),
        .O(i__carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_2
       (.I0(div_value[22]),
        .I1(divider[22]),
        .O(i__carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_3
       (.I0(div_value[21]),
        .I1(divider[21]),
        .O(i__carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_4
       (.I0(div_value[20]),
        .I1(divider[20]),
        .O(i__carry__4_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_1
       (.I0(div_value[27]),
        .I1(divider[27]),
        .O(i__carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_2
       (.I0(div_value[26]),
        .I1(divider[26]),
        .O(i__carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_3
       (.I0(div_value[25]),
        .I1(divider[25]),
        .O(i__carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_4
       (.I0(div_value[24]),
        .I1(divider[24]),
        .O(i__carry__5_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_1
       (.I0(div_value[31]),
        .I1(divider[31]),
        .O(i__carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_2
       (.I0(div_value[30]),
        .I1(divider[30]),
        .O(i__carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_3
       (.I0(div_value[29]),
        .I1(divider[29]),
        .O(i__carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_4
       (.I0(div_value[28]),
        .I1(divider[28]),
        .O(i__carry__6_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_1
       (.I0(div_value[3]),
        .I1(divider[3]),
        .O(i__carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_2
       (.I0(div_value[2]),
        .I1(divider[2]),
        .O(i__carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_3
       (.I0(div_value[1]),
        .I1(divider[1]),
        .O(i__carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_4
       (.I0(div_value[0]),
        .I1(divider[0]),
        .O(i__carry_i_4_n_0));
  FDRE i_f_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(filter_i_cnt_reg__0[4]),
        .Q(i_f),
        .R(1'b0));
  FDRE i_i_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(I),
        .Q(i_i),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[0] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[0]),
        .Q(m_angle_tdata[0]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[10] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[10]),
        .Q(m_angle_tdata[10]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[11] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[11]),
        .Q(m_angle_tdata[11]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[12] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[12]),
        .Q(m_angle_tdata[12]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[13] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[13]),
        .Q(m_angle_tdata[13]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[14] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[14]),
        .Q(m_angle_tdata[14]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[15] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[15]),
        .Q(m_angle_tdata[15]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[1] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[1]),
        .Q(m_angle_tdata[1]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[2] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[2]),
        .Q(m_angle_tdata[2]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[3] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[3]),
        .Q(m_angle_tdata[3]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[4] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[4]),
        .Q(m_angle_tdata[4]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[5] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[5]),
        .Q(m_angle_tdata[5]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[6] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[6]),
        .Q(m_angle_tdata[6]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[7] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[7]),
        .Q(m_angle_tdata[7]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[8] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[8]),
        .Q(m_angle_tdata[8]),
        .R(1'b0));
  FDRE \m_angle_tdata_reg[9] 
       (.C(axis_aclk),
        .CE(p_0_in),
        .D(clip_down_angle[9]),
        .Q(m_angle_tdata[9]),
        .R(1'b0));
  FDRE m_angle_tvalid_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(m_angle_tvalid),
        .R(1'b0));
  CARRY4 m_period_tvalid0_carry
       (.CI(1'b0),
        .CO({m_period_tvalid0_carry_n_0,m_period_tvalid0_carry_n_1,m_period_tvalid0_carry_n_2,m_period_tvalid0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({m_period_tvalid0_carry_i_1_n_0,m_period_tvalid0_carry_i_2_n_0,m_period_tvalid0_carry_i_3_n_0,m_period_tvalid0_carry_i_4_n_0}),
        .O(NLW_m_period_tvalid0_carry_O_UNCONNECTED[3:0]),
        .S({m_period_tvalid0_carry_i_5_n_0,m_period_tvalid0_carry_i_6_n_0,m_period_tvalid0_carry_i_7_n_0,m_period_tvalid0_carry_i_8_n_0}));
  CARRY4 m_period_tvalid0_carry__0
       (.CI(m_period_tvalid0_carry_n_0),
        .CO({m_period_tvalid0_carry__0_n_0,m_period_tvalid0_carry__0_n_1,m_period_tvalid0_carry__0_n_2,m_period_tvalid0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({m_period_tvalid0_carry__0_i_1_n_0,m_period_tvalid0_carry__0_i_2_n_0,m_period_tvalid0_carry__0_i_3_n_0,m_period_tvalid0_carry__0_i_4_n_0}),
        .O(NLW_m_period_tvalid0_carry__0_O_UNCONNECTED[3:0]),
        .S({m_period_tvalid0_carry__0_i_5_n_0,m_period_tvalid0_carry__0_i_6_n_0,m_period_tvalid0_carry__0_i_7_n_0,m_period_tvalid0_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__0_i_1
       (.I0(period_cnt_reg[14]),
        .I1(period_prev[14]),
        .I2(period_prev[15]),
        .I3(period_cnt_reg[15]),
        .O(m_period_tvalid0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__0_i_2
       (.I0(period_cnt_reg[12]),
        .I1(period_prev[12]),
        .I2(period_prev[13]),
        .I3(period_cnt_reg[13]),
        .O(m_period_tvalid0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__0_i_3
       (.I0(period_cnt_reg[10]),
        .I1(period_prev[10]),
        .I2(period_prev[11]),
        .I3(period_cnt_reg[11]),
        .O(m_period_tvalid0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__0_i_4
       (.I0(period_cnt_reg[8]),
        .I1(period_prev[8]),
        .I2(period_prev[9]),
        .I3(period_cnt_reg[9]),
        .O(m_period_tvalid0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__0_i_5
       (.I0(period_cnt_reg[14]),
        .I1(period_prev[14]),
        .I2(period_cnt_reg[15]),
        .I3(period_prev[15]),
        .O(m_period_tvalid0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__0_i_6
       (.I0(period_cnt_reg[12]),
        .I1(period_prev[12]),
        .I2(period_cnt_reg[13]),
        .I3(period_prev[13]),
        .O(m_period_tvalid0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__0_i_7
       (.I0(period_cnt_reg[10]),
        .I1(period_prev[10]),
        .I2(period_cnt_reg[11]),
        .I3(period_prev[11]),
        .O(m_period_tvalid0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__0_i_8
       (.I0(period_cnt_reg[8]),
        .I1(period_prev[8]),
        .I2(period_cnt_reg[9]),
        .I3(period_prev[9]),
        .O(m_period_tvalid0_carry__0_i_8_n_0));
  CARRY4 m_period_tvalid0_carry__1
       (.CI(m_period_tvalid0_carry__0_n_0),
        .CO({m_period_tvalid0_carry__1_n_0,m_period_tvalid0_carry__1_n_1,m_period_tvalid0_carry__1_n_2,m_period_tvalid0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({m_period_tvalid0_carry__1_i_1_n_0,m_period_tvalid0_carry__1_i_2_n_0,m_period_tvalid0_carry__1_i_3_n_0,m_period_tvalid0_carry__1_i_4_n_0}),
        .O(NLW_m_period_tvalid0_carry__1_O_UNCONNECTED[3:0]),
        .S({m_period_tvalid0_carry__1_i_5_n_0,m_period_tvalid0_carry__1_i_6_n_0,m_period_tvalid0_carry__1_i_7_n_0,m_period_tvalid0_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__1_i_1
       (.I0(period_cnt_reg[22]),
        .I1(period_prev[22]),
        .I2(period_prev[23]),
        .I3(period_cnt_reg[23]),
        .O(m_period_tvalid0_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__1_i_2
       (.I0(period_cnt_reg[20]),
        .I1(period_prev[20]),
        .I2(period_prev[21]),
        .I3(period_cnt_reg[21]),
        .O(m_period_tvalid0_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__1_i_3
       (.I0(period_cnt_reg[18]),
        .I1(period_prev[18]),
        .I2(period_prev[19]),
        .I3(period_cnt_reg[19]),
        .O(m_period_tvalid0_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__1_i_4
       (.I0(period_cnt_reg[16]),
        .I1(period_prev[16]),
        .I2(period_prev[17]),
        .I3(period_cnt_reg[17]),
        .O(m_period_tvalid0_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__1_i_5
       (.I0(period_cnt_reg[22]),
        .I1(period_prev[22]),
        .I2(period_cnt_reg[23]),
        .I3(period_prev[23]),
        .O(m_period_tvalid0_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__1_i_6
       (.I0(period_cnt_reg[20]),
        .I1(period_prev[20]),
        .I2(period_cnt_reg[21]),
        .I3(period_prev[21]),
        .O(m_period_tvalid0_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__1_i_7
       (.I0(period_cnt_reg[18]),
        .I1(period_prev[18]),
        .I2(period_cnt_reg[19]),
        .I3(period_prev[19]),
        .O(m_period_tvalid0_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__1_i_8
       (.I0(period_cnt_reg[16]),
        .I1(period_prev[16]),
        .I2(period_cnt_reg[17]),
        .I3(period_prev[17]),
        .O(m_period_tvalid0_carry__1_i_8_n_0));
  CARRY4 m_period_tvalid0_carry__2
       (.CI(m_period_tvalid0_carry__1_n_0),
        .CO({m_period_tvalid0_carry__2_n_0,m_period_tvalid0_carry__2_n_1,m_period_tvalid0_carry__2_n_2,m_period_tvalid0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({m_period_tvalid0_carry__2_i_1_n_0,m_period_tvalid0_carry__2_i_2_n_0,m_period_tvalid0_carry__2_i_3_n_0,m_period_tvalid0_carry__2_i_4_n_0}),
        .O(NLW_m_period_tvalid0_carry__2_O_UNCONNECTED[3:0]),
        .S({m_period_tvalid0_carry__2_i_5_n_0,m_period_tvalid0_carry__2_i_6_n_0,m_period_tvalid0_carry__2_i_7_n_0,m_period_tvalid0_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__2_i_1
       (.I0(period_cnt_reg[30]),
        .I1(period_prev[30]),
        .I2(period_prev[31]),
        .I3(period_cnt_reg[31]),
        .O(m_period_tvalid0_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__2_i_2
       (.I0(period_cnt_reg[28]),
        .I1(period_prev[28]),
        .I2(period_prev[29]),
        .I3(period_cnt_reg[29]),
        .O(m_period_tvalid0_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__2_i_3
       (.I0(period_cnt_reg[26]),
        .I1(period_prev[26]),
        .I2(period_prev[27]),
        .I3(period_cnt_reg[27]),
        .O(m_period_tvalid0_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry__2_i_4
       (.I0(period_cnt_reg[24]),
        .I1(period_prev[24]),
        .I2(period_prev[25]),
        .I3(period_cnt_reg[25]),
        .O(m_period_tvalid0_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__2_i_5
       (.I0(period_cnt_reg[30]),
        .I1(period_prev[30]),
        .I2(period_cnt_reg[31]),
        .I3(period_prev[31]),
        .O(m_period_tvalid0_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__2_i_6
       (.I0(period_cnt_reg[28]),
        .I1(period_prev[28]),
        .I2(period_cnt_reg[29]),
        .I3(period_prev[29]),
        .O(m_period_tvalid0_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__2_i_7
       (.I0(period_cnt_reg[26]),
        .I1(period_prev[26]),
        .I2(period_cnt_reg[27]),
        .I3(period_prev[27]),
        .O(m_period_tvalid0_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry__2_i_8
       (.I0(period_cnt_reg[24]),
        .I1(period_prev[24]),
        .I2(period_cnt_reg[25]),
        .I3(period_prev[25]),
        .O(m_period_tvalid0_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry_i_1
       (.I0(period_cnt_reg[6]),
        .I1(period_prev[6]),
        .I2(period_prev[7]),
        .I3(period_cnt_reg[7]),
        .O(m_period_tvalid0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry_i_2
       (.I0(period_cnt_reg[4]),
        .I1(period_prev[4]),
        .I2(period_prev[5]),
        .I3(period_cnt_reg[5]),
        .O(m_period_tvalid0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry_i_3
       (.I0(period_cnt_reg[2]),
        .I1(period_prev[2]),
        .I2(period_prev[3]),
        .I3(period_cnt_reg[3]),
        .O(m_period_tvalid0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    m_period_tvalid0_carry_i_4
       (.I0(period_cnt_reg[0]),
        .I1(period_prev[0]),
        .I2(period_prev[1]),
        .I3(period_cnt_reg[1]),
        .O(m_period_tvalid0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry_i_5
       (.I0(period_cnt_reg[6]),
        .I1(period_prev[6]),
        .I2(period_cnt_reg[7]),
        .I3(period_prev[7]),
        .O(m_period_tvalid0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry_i_6
       (.I0(period_cnt_reg[4]),
        .I1(period_prev[4]),
        .I2(period_cnt_reg[5]),
        .I3(period_prev[5]),
        .O(m_period_tvalid0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry_i_7
       (.I0(period_cnt_reg[2]),
        .I1(period_prev[2]),
        .I2(period_cnt_reg[3]),
        .I3(period_prev[3]),
        .O(m_period_tvalid0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    m_period_tvalid0_carry_i_8
       (.I0(period_cnt_reg[0]),
        .I1(period_prev[0]),
        .I2(period_cnt_reg[1]),
        .I3(period_prev[1]),
        .O(m_period_tvalid0_carry_i_8_n_0));
  FDRE \m_rpm_tdata_reg[0] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[0]),
        .Q(m_rpm_tdata[0]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[10] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[10]),
        .Q(m_rpm_tdata[10]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[11] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[11]),
        .Q(m_rpm_tdata[11]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[12] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[12]),
        .Q(m_rpm_tdata[12]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[13] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[13]),
        .Q(m_rpm_tdata[13]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[14] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[14]),
        .Q(m_rpm_tdata[14]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[15] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[15]),
        .Q(m_rpm_tdata[15]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[1] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[1]),
        .Q(m_rpm_tdata[1]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[2] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[2]),
        .Q(m_rpm_tdata[2]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[3] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[3]),
        .Q(m_rpm_tdata[3]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[4] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[4]),
        .Q(m_rpm_tdata[4]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[5] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[5]),
        .Q(m_rpm_tdata[5]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[6] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[6]),
        .Q(m_rpm_tdata[6]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[7] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[7]),
        .Q(m_rpm_tdata[7]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[8] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[8]),
        .Q(m_rpm_tdata[8]),
        .R(1'b0));
  FDRE \m_rpm_tdata_reg[9] 
       (.C(axis_aclk),
        .CE(m_rpm_tvalid_i_1_n_0),
        .D(rpm_data[9]),
        .Q(m_rpm_tdata[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    m_rpm_tvalid_i_1
       (.I0(\out_period_cnt_reg_n_0_[5] ),
        .I1(\out_period_cnt_reg_n_0_[4] ),
        .I2(\out_period_cnt_reg_n_0_[1] ),
        .I3(\out_period_cnt_reg_n_0_[0] ),
        .I4(\out_period_cnt_reg_n_0_[3] ),
        .I5(\out_period_cnt_reg_n_0_[2] ),
        .O(m_rpm_tvalid_i_1_n_0));
  FDSE m_rpm_tvalid_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(1'b0),
        .Q(m_rpm_tvalid),
        .S(m_rpm_tvalid_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \out_period_cnt[0]_i_1 
       (.I0(\out_period_cnt_reg_n_0_[0] ),
        .O(\out_period_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \out_period_cnt[1]_i_1 
       (.I0(\out_period_cnt_reg_n_0_[0] ),
        .I1(\out_period_cnt_reg_n_0_[1] ),
        .O(\out_period_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \out_period_cnt[2]_i_1 
       (.I0(\out_period_cnt_reg_n_0_[0] ),
        .I1(\out_period_cnt_reg_n_0_[1] ),
        .I2(\out_period_cnt_reg_n_0_[2] ),
        .O(\out_period_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \out_period_cnt[3]_i_1 
       (.I0(\out_period_cnt_reg_n_0_[1] ),
        .I1(\out_period_cnt_reg_n_0_[0] ),
        .I2(\out_period_cnt_reg_n_0_[2] ),
        .I3(\out_period_cnt_reg_n_0_[3] ),
        .O(\out_period_cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \out_period_cnt[4]_i_1 
       (.I0(\out_period_cnt_reg_n_0_[2] ),
        .I1(\out_period_cnt_reg_n_0_[0] ),
        .I2(\out_period_cnt_reg_n_0_[1] ),
        .I3(\out_period_cnt_reg_n_0_[3] ),
        .I4(\out_period_cnt_reg_n_0_[4] ),
        .O(\out_period_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \out_period_cnt[5]_i_1 
       (.I0(\out_period_cnt_reg_n_0_[3] ),
        .I1(\out_period_cnt_reg_n_0_[1] ),
        .I2(\out_period_cnt_reg_n_0_[0] ),
        .I3(\out_period_cnt_reg_n_0_[2] ),
        .I4(\out_period_cnt_reg_n_0_[4] ),
        .I5(\out_period_cnt_reg_n_0_[5] ),
        .O(\out_period_cnt[5]_i_1_n_0 ));
  FDRE \out_period_cnt_reg[0] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\out_period_cnt[0]_i_1_n_0 ),
        .Q(\out_period_cnt_reg_n_0_[0] ),
        .R(m_rpm_tvalid_i_1_n_0));
  FDRE \out_period_cnt_reg[1] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\out_period_cnt[1]_i_1_n_0 ),
        .Q(\out_period_cnt_reg_n_0_[1] ),
        .R(m_rpm_tvalid_i_1_n_0));
  FDRE \out_period_cnt_reg[2] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\out_period_cnt[2]_i_1_n_0 ),
        .Q(\out_period_cnt_reg_n_0_[2] ),
        .R(m_rpm_tvalid_i_1_n_0));
  FDRE \out_period_cnt_reg[3] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\out_period_cnt[3]_i_1_n_0 ),
        .Q(\out_period_cnt_reg_n_0_[3] ),
        .R(m_rpm_tvalid_i_1_n_0));
  FDRE \out_period_cnt_reg[4] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\out_period_cnt[4]_i_1_n_0 ),
        .Q(\out_period_cnt_reg_n_0_[4] ),
        .R(m_rpm_tvalid_i_1_n_0));
  FDRE \out_period_cnt_reg[5] 
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\out_period_cnt[5]_i_1_n_0 ),
        .Q(\out_period_cnt_reg_n_0_[5] ),
        .R(m_rpm_tvalid_i_1_n_0));
  LUT4 #(
    .INIT(16'h00F7)) 
    \period_cnt[0]_i_1 
       (.I0(\period_value[15]_i_2_n_0 ),
        .I1(\period_value[15]_i_3_n_0 ),
        .I2(\period_value[15]_i_4_n_0 ),
        .I3(period_cnt_reg[31]),
        .O(\period_cnt[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[0]_i_3 
       (.I0(period_cnt_reg[3]),
        .O(\period_cnt[0]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[0]_i_4 
       (.I0(period_cnt_reg[2]),
        .O(\period_cnt[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[0]_i_5 
       (.I0(period_cnt_reg[1]),
        .O(\period_cnt[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \period_cnt[0]_i_6 
       (.I0(period_cnt_reg[0]),
        .O(\period_cnt[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[12]_i_2 
       (.I0(period_cnt_reg[15]),
        .O(\period_cnt[12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[12]_i_3 
       (.I0(period_cnt_reg[14]),
        .O(\period_cnt[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[12]_i_4 
       (.I0(period_cnt_reg[13]),
        .O(\period_cnt[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[12]_i_5 
       (.I0(period_cnt_reg[12]),
        .O(\period_cnt[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[16]_i_2 
       (.I0(period_cnt_reg[19]),
        .O(\period_cnt[16]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[16]_i_3 
       (.I0(period_cnt_reg[18]),
        .O(\period_cnt[16]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[16]_i_4 
       (.I0(period_cnt_reg[17]),
        .O(\period_cnt[16]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[16]_i_5 
       (.I0(period_cnt_reg[16]),
        .O(\period_cnt[16]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[20]_i_2 
       (.I0(period_cnt_reg[23]),
        .O(\period_cnt[20]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[20]_i_3 
       (.I0(period_cnt_reg[22]),
        .O(\period_cnt[20]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[20]_i_4 
       (.I0(period_cnt_reg[21]),
        .O(\period_cnt[20]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[20]_i_5 
       (.I0(period_cnt_reg[20]),
        .O(\period_cnt[20]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[24]_i_2 
       (.I0(period_cnt_reg[27]),
        .O(\period_cnt[24]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[24]_i_3 
       (.I0(period_cnt_reg[26]),
        .O(\period_cnt[24]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[24]_i_4 
       (.I0(period_cnt_reg[25]),
        .O(\period_cnt[24]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[24]_i_5 
       (.I0(period_cnt_reg[24]),
        .O(\period_cnt[24]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[28]_i_2 
       (.I0(period_cnt_reg[31]),
        .O(\period_cnt[28]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[28]_i_3 
       (.I0(period_cnt_reg[30]),
        .O(\period_cnt[28]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[28]_i_4 
       (.I0(period_cnt_reg[29]),
        .O(\period_cnt[28]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[28]_i_5 
       (.I0(period_cnt_reg[28]),
        .O(\period_cnt[28]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[4]_i_2 
       (.I0(period_cnt_reg[7]),
        .O(\period_cnt[4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[4]_i_3 
       (.I0(period_cnt_reg[6]),
        .O(\period_cnt[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[4]_i_4 
       (.I0(period_cnt_reg[5]),
        .O(\period_cnt[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[4]_i_5 
       (.I0(period_cnt_reg[4]),
        .O(\period_cnt[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[8]_i_2 
       (.I0(period_cnt_reg[11]),
        .O(\period_cnt[8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[8]_i_3 
       (.I0(period_cnt_reg[10]),
        .O(\period_cnt[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[8]_i_4 
       (.I0(period_cnt_reg[9]),
        .O(\period_cnt[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \period_cnt[8]_i_5 
       (.I0(period_cnt_reg[8]),
        .O(\period_cnt[8]_i_5_n_0 ));
  FDRE \period_cnt_reg[0] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[0]_i_2_n_7 ),
        .Q(period_cnt_reg[0]),
        .R(\cnt[15]_i_2_n_0 ));
  CARRY4 \period_cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\period_cnt_reg[0]_i_2_n_0 ,\period_cnt_reg[0]_i_2_n_1 ,\period_cnt_reg[0]_i_2_n_2 ,\period_cnt_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\period_cnt_reg[0]_i_2_n_4 ,\period_cnt_reg[0]_i_2_n_5 ,\period_cnt_reg[0]_i_2_n_6 ,\period_cnt_reg[0]_i_2_n_7 }),
        .S({\period_cnt[0]_i_3_n_0 ,\period_cnt[0]_i_4_n_0 ,\period_cnt[0]_i_5_n_0 ,\period_cnt[0]_i_6_n_0 }));
  FDRE \period_cnt_reg[10] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[8]_i_1_n_5 ),
        .Q(period_cnt_reg[10]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[11] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[8]_i_1_n_4 ),
        .Q(period_cnt_reg[11]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[12] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[12]_i_1_n_7 ),
        .Q(period_cnt_reg[12]),
        .R(\cnt[15]_i_2_n_0 ));
  CARRY4 \period_cnt_reg[12]_i_1 
       (.CI(\period_cnt_reg[8]_i_1_n_0 ),
        .CO({\period_cnt_reg[12]_i_1_n_0 ,\period_cnt_reg[12]_i_1_n_1 ,\period_cnt_reg[12]_i_1_n_2 ,\period_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\period_cnt_reg[12]_i_1_n_4 ,\period_cnt_reg[12]_i_1_n_5 ,\period_cnt_reg[12]_i_1_n_6 ,\period_cnt_reg[12]_i_1_n_7 }),
        .S({\period_cnt[12]_i_2_n_0 ,\period_cnt[12]_i_3_n_0 ,\period_cnt[12]_i_4_n_0 ,\period_cnt[12]_i_5_n_0 }));
  FDRE \period_cnt_reg[13] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[12]_i_1_n_6 ),
        .Q(period_cnt_reg[13]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[14] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[12]_i_1_n_5 ),
        .Q(period_cnt_reg[14]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[15] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[12]_i_1_n_4 ),
        .Q(period_cnt_reg[15]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[16] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[16]_i_1_n_7 ),
        .Q(period_cnt_reg[16]),
        .R(\cnt[15]_i_2_n_0 ));
  CARRY4 \period_cnt_reg[16]_i_1 
       (.CI(\period_cnt_reg[12]_i_1_n_0 ),
        .CO({\period_cnt_reg[16]_i_1_n_0 ,\period_cnt_reg[16]_i_1_n_1 ,\period_cnt_reg[16]_i_1_n_2 ,\period_cnt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\period_cnt_reg[16]_i_1_n_4 ,\period_cnt_reg[16]_i_1_n_5 ,\period_cnt_reg[16]_i_1_n_6 ,\period_cnt_reg[16]_i_1_n_7 }),
        .S({\period_cnt[16]_i_2_n_0 ,\period_cnt[16]_i_3_n_0 ,\period_cnt[16]_i_4_n_0 ,\period_cnt[16]_i_5_n_0 }));
  FDRE \period_cnt_reg[17] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[16]_i_1_n_6 ),
        .Q(period_cnt_reg[17]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[18] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[16]_i_1_n_5 ),
        .Q(period_cnt_reg[18]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[19] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[16]_i_1_n_4 ),
        .Q(period_cnt_reg[19]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[1] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[0]_i_2_n_6 ),
        .Q(period_cnt_reg[1]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[20] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[20]_i_1_n_7 ),
        .Q(period_cnt_reg[20]),
        .R(\cnt[15]_i_2_n_0 ));
  CARRY4 \period_cnt_reg[20]_i_1 
       (.CI(\period_cnt_reg[16]_i_1_n_0 ),
        .CO({\period_cnt_reg[20]_i_1_n_0 ,\period_cnt_reg[20]_i_1_n_1 ,\period_cnt_reg[20]_i_1_n_2 ,\period_cnt_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\period_cnt_reg[20]_i_1_n_4 ,\period_cnt_reg[20]_i_1_n_5 ,\period_cnt_reg[20]_i_1_n_6 ,\period_cnt_reg[20]_i_1_n_7 }),
        .S({\period_cnt[20]_i_2_n_0 ,\period_cnt[20]_i_3_n_0 ,\period_cnt[20]_i_4_n_0 ,\period_cnt[20]_i_5_n_0 }));
  FDRE \period_cnt_reg[21] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[20]_i_1_n_6 ),
        .Q(period_cnt_reg[21]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[22] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[20]_i_1_n_5 ),
        .Q(period_cnt_reg[22]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[23] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[20]_i_1_n_4 ),
        .Q(period_cnt_reg[23]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[24] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[24]_i_1_n_7 ),
        .Q(period_cnt_reg[24]),
        .R(\cnt[15]_i_2_n_0 ));
  CARRY4 \period_cnt_reg[24]_i_1 
       (.CI(\period_cnt_reg[20]_i_1_n_0 ),
        .CO({\period_cnt_reg[24]_i_1_n_0 ,\period_cnt_reg[24]_i_1_n_1 ,\period_cnt_reg[24]_i_1_n_2 ,\period_cnt_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\period_cnt_reg[24]_i_1_n_4 ,\period_cnt_reg[24]_i_1_n_5 ,\period_cnt_reg[24]_i_1_n_6 ,\period_cnt_reg[24]_i_1_n_7 }),
        .S({\period_cnt[24]_i_2_n_0 ,\period_cnt[24]_i_3_n_0 ,\period_cnt[24]_i_4_n_0 ,\period_cnt[24]_i_5_n_0 }));
  FDRE \period_cnt_reg[25] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[24]_i_1_n_6 ),
        .Q(period_cnt_reg[25]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[26] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[24]_i_1_n_5 ),
        .Q(period_cnt_reg[26]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[27] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[24]_i_1_n_4 ),
        .Q(period_cnt_reg[27]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[28] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[28]_i_1_n_7 ),
        .Q(period_cnt_reg[28]),
        .R(\cnt[15]_i_2_n_0 ));
  CARRY4 \period_cnt_reg[28]_i_1 
       (.CI(\period_cnt_reg[24]_i_1_n_0 ),
        .CO({\NLW_period_cnt_reg[28]_i_1_CO_UNCONNECTED [3],\period_cnt_reg[28]_i_1_n_1 ,\period_cnt_reg[28]_i_1_n_2 ,\period_cnt_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\period_cnt_reg[28]_i_1_n_4 ,\period_cnt_reg[28]_i_1_n_5 ,\period_cnt_reg[28]_i_1_n_6 ,\period_cnt_reg[28]_i_1_n_7 }),
        .S({\period_cnt[28]_i_2_n_0 ,\period_cnt[28]_i_3_n_0 ,\period_cnt[28]_i_4_n_0 ,\period_cnt[28]_i_5_n_0 }));
  FDRE \period_cnt_reg[29] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[28]_i_1_n_6 ),
        .Q(period_cnt_reg[29]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[2] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[0]_i_2_n_5 ),
        .Q(period_cnt_reg[2]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[30] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[28]_i_1_n_5 ),
        .Q(period_cnt_reg[30]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[31] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[28]_i_1_n_4 ),
        .Q(period_cnt_reg[31]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[3] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[0]_i_2_n_4 ),
        .Q(period_cnt_reg[3]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[4] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[4]_i_1_n_7 ),
        .Q(period_cnt_reg[4]),
        .R(\cnt[15]_i_2_n_0 ));
  CARRY4 \period_cnt_reg[4]_i_1 
       (.CI(\period_cnt_reg[0]_i_2_n_0 ),
        .CO({\period_cnt_reg[4]_i_1_n_0 ,\period_cnt_reg[4]_i_1_n_1 ,\period_cnt_reg[4]_i_1_n_2 ,\period_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\period_cnt_reg[4]_i_1_n_4 ,\period_cnt_reg[4]_i_1_n_5 ,\period_cnt_reg[4]_i_1_n_6 ,\period_cnt_reg[4]_i_1_n_7 }),
        .S({\period_cnt[4]_i_2_n_0 ,\period_cnt[4]_i_3_n_0 ,\period_cnt[4]_i_4_n_0 ,\period_cnt[4]_i_5_n_0 }));
  FDRE \period_cnt_reg[5] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[4]_i_1_n_6 ),
        .Q(period_cnt_reg[5]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[6] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[4]_i_1_n_5 ),
        .Q(period_cnt_reg[6]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[7] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[4]_i_1_n_4 ),
        .Q(period_cnt_reg[7]),
        .R(\cnt[15]_i_2_n_0 ));
  FDRE \period_cnt_reg[8] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[8]_i_1_n_7 ),
        .Q(period_cnt_reg[8]),
        .R(\cnt[15]_i_2_n_0 ));
  CARRY4 \period_cnt_reg[8]_i_1 
       (.CI(\period_cnt_reg[4]_i_1_n_0 ),
        .CO({\period_cnt_reg[8]_i_1_n_0 ,\period_cnt_reg[8]_i_1_n_1 ,\period_cnt_reg[8]_i_1_n_2 ,\period_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\period_cnt_reg[8]_i_1_n_4 ,\period_cnt_reg[8]_i_1_n_5 ,\period_cnt_reg[8]_i_1_n_6 ,\period_cnt_reg[8]_i_1_n_7 }),
        .S({\period_cnt[8]_i_2_n_0 ,\period_cnt[8]_i_3_n_0 ,\period_cnt[8]_i_4_n_0 ,\period_cnt[8]_i_5_n_0 }));
  FDRE \period_cnt_reg[9] 
       (.C(axis_aclk),
        .CE(\period_cnt[0]_i_1_n_0 ),
        .D(\period_cnt_reg[8]_i_1_n_6 ),
        .Q(period_cnt_reg[9]),
        .R(\cnt[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hAACA)) 
    period_dir_i_1
       (.I0(period_dir),
        .I1(b_f),
        .I2(a_sr[0]),
        .I3(a_sr[1]),
        .O(period_dir_i_1_n_0));
  FDRE period_dir_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(period_dir_i_1_n_0),
        .Q(period_dir),
        .R(1'b0));
  FDRE \period_prev_reg[0] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[0]),
        .Q(period_prev[0]),
        .R(1'b0));
  FDRE \period_prev_reg[10] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[10]),
        .Q(period_prev[10]),
        .R(1'b0));
  FDRE \period_prev_reg[11] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[11]),
        .Q(period_prev[11]),
        .R(1'b0));
  FDRE \period_prev_reg[12] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[12]),
        .Q(period_prev[12]),
        .R(1'b0));
  FDRE \period_prev_reg[13] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[13]),
        .Q(period_prev[13]),
        .R(1'b0));
  FDRE \period_prev_reg[14] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[14]),
        .Q(period_prev[14]),
        .R(1'b0));
  FDRE \period_prev_reg[15] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[15]),
        .Q(period_prev[15]),
        .R(1'b0));
  FDRE \period_prev_reg[16] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[16]),
        .Q(period_prev[16]),
        .R(1'b0));
  FDRE \period_prev_reg[17] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[17]),
        .Q(period_prev[17]),
        .R(1'b0));
  FDRE \period_prev_reg[18] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[18]),
        .Q(period_prev[18]),
        .R(1'b0));
  FDRE \period_prev_reg[19] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[19]),
        .Q(period_prev[19]),
        .R(1'b0));
  FDRE \period_prev_reg[1] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[1]),
        .Q(period_prev[1]),
        .R(1'b0));
  FDRE \period_prev_reg[20] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[20]),
        .Q(period_prev[20]),
        .R(1'b0));
  FDRE \period_prev_reg[21] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[21]),
        .Q(period_prev[21]),
        .R(1'b0));
  FDRE \period_prev_reg[22] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[22]),
        .Q(period_prev[22]),
        .R(1'b0));
  FDRE \period_prev_reg[23] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[23]),
        .Q(period_prev[23]),
        .R(1'b0));
  FDRE \period_prev_reg[24] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[24]),
        .Q(period_prev[24]),
        .R(1'b0));
  FDRE \period_prev_reg[25] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[25]),
        .Q(period_prev[25]),
        .R(1'b0));
  FDRE \period_prev_reg[26] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[26]),
        .Q(period_prev[26]),
        .R(1'b0));
  FDRE \period_prev_reg[27] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[27]),
        .Q(period_prev[27]),
        .R(1'b0));
  FDRE \period_prev_reg[28] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[28]),
        .Q(period_prev[28]),
        .R(1'b0));
  FDRE \period_prev_reg[29] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[29]),
        .Q(period_prev[29]),
        .R(1'b0));
  FDRE \period_prev_reg[2] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[2]),
        .Q(period_prev[2]),
        .R(1'b0));
  FDRE \period_prev_reg[30] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[30]),
        .Q(period_prev[30]),
        .R(1'b0));
  FDRE \period_prev_reg[31] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_value[31]),
        .Q(period_prev[31]),
        .R(1'b0));
  FDRE \period_prev_reg[3] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[3]),
        .Q(period_prev[3]),
        .R(1'b0));
  FDRE \period_prev_reg[4] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[4]),
        .Q(period_prev[4]),
        .R(1'b0));
  FDRE \period_prev_reg[5] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[5]),
        .Q(period_prev[5]),
        .R(1'b0));
  FDRE \period_prev_reg[6] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[6]),
        .Q(period_prev[6]),
        .R(1'b0));
  FDRE \period_prev_reg[7] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[7]),
        .Q(period_prev[7]),
        .R(1'b0));
  FDRE \period_prev_reg[8] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[8]),
        .Q(period_prev[8]),
        .R(1'b0));
  FDRE \period_prev_reg[9] 
       (.C(axis_aclk),
        .CE(\cnt[15]_i_2_n_0 ),
        .D(period_data[9]),
        .Q(period_prev[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000AA2A)) 
    \period_value[15]_i_1 
       (.I0(m_period_tvalid0_carry__2_n_0),
        .I1(\period_value[15]_i_2_n_0 ),
        .I2(\period_value[15]_i_3_n_0 ),
        .I3(\period_value[15]_i_4_n_0 ),
        .I4(period_cnt_reg[31]),
        .I5(\cnt[15]_i_2_n_0 ),
        .O(\period_value[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \period_value[15]_i_2 
       (.I0(\period_value[15]_i_5_n_0 ),
        .I1(period_cnt_reg[29]),
        .I2(period_cnt_reg[30]),
        .I3(period_cnt_reg[28]),
        .I4(\period_value[15]_i_6_n_0 ),
        .I5(\period_value[15]_i_7_n_0 ),
        .O(\period_value[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \period_value[15]_i_3 
       (.I0(period_cnt_reg[14]),
        .I1(period_cnt_reg[15]),
        .I2(period_cnt_reg[12]),
        .I3(period_cnt_reg[13]),
        .I4(\period_value[15]_i_8_n_0 ),
        .O(\period_value[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \period_value[15]_i_4 
       (.I0(period_cnt_reg[2]),
        .I1(period_cnt_reg[3]),
        .I2(period_cnt_reg[0]),
        .I3(period_cnt_reg[1]),
        .I4(\period_value[15]_i_9_n_0 ),
        .O(\period_value[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \period_value[15]_i_5 
       (.I0(period_cnt_reg[25]),
        .I1(period_cnt_reg[24]),
        .I2(period_cnt_reg[27]),
        .I3(period_cnt_reg[26]),
        .O(\period_value[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \period_value[15]_i_6 
       (.I0(period_cnt_reg[21]),
        .I1(period_cnt_reg[20]),
        .I2(period_cnt_reg[23]),
        .I3(period_cnt_reg[22]),
        .O(\period_value[15]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \period_value[15]_i_7 
       (.I0(period_cnt_reg[17]),
        .I1(period_cnt_reg[16]),
        .I2(period_cnt_reg[19]),
        .I3(period_cnt_reg[18]),
        .O(\period_value[15]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \period_value[15]_i_8 
       (.I0(period_cnt_reg[9]),
        .I1(period_cnt_reg[8]),
        .I2(period_cnt_reg[11]),
        .I3(period_cnt_reg[10]),
        .O(\period_value[15]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \period_value[15]_i_9 
       (.I0(period_cnt_reg[5]),
        .I1(period_cnt_reg[4]),
        .I2(period_cnt_reg[7]),
        .I3(period_cnt_reg[6]),
        .O(\period_value[15]_i_9_n_0 ));
  FDRE \period_value_reg[0] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[0]),
        .Q(period_data[0]),
        .R(1'b0));
  FDRE \period_value_reg[10] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[10]),
        .Q(period_data[10]),
        .R(1'b0));
  FDRE \period_value_reg[11] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[11]),
        .Q(period_data[11]),
        .R(1'b0));
  FDRE \period_value_reg[12] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[12]),
        .Q(period_data[12]),
        .R(1'b0));
  FDRE \period_value_reg[13] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[13]),
        .Q(period_data[13]),
        .R(1'b0));
  FDRE \period_value_reg[14] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[14]),
        .Q(period_data[14]),
        .R(1'b0));
  FDRE \period_value_reg[15] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[15]),
        .Q(period_data[15]),
        .R(1'b0));
  FDRE \period_value_reg[16] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[16]),
        .Q(period_value[16]),
        .R(1'b0));
  FDRE \period_value_reg[17] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[17]),
        .Q(period_value[17]),
        .R(1'b0));
  FDRE \period_value_reg[18] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[18]),
        .Q(period_value[18]),
        .R(1'b0));
  FDRE \period_value_reg[19] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[19]),
        .Q(period_value[19]),
        .R(1'b0));
  FDRE \period_value_reg[1] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[1]),
        .Q(period_data[1]),
        .R(1'b0));
  FDRE \period_value_reg[20] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[20]),
        .Q(period_value[20]),
        .R(1'b0));
  FDRE \period_value_reg[21] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[21]),
        .Q(period_value[21]),
        .R(1'b0));
  FDRE \period_value_reg[22] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[22]),
        .Q(period_value[22]),
        .R(1'b0));
  FDRE \period_value_reg[23] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[23]),
        .Q(period_value[23]),
        .R(1'b0));
  FDRE \period_value_reg[24] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[24]),
        .Q(period_value[24]),
        .R(1'b0));
  FDRE \period_value_reg[25] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[25]),
        .Q(period_value[25]),
        .R(1'b0));
  FDRE \period_value_reg[26] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[26]),
        .Q(period_value[26]),
        .R(1'b0));
  FDRE \period_value_reg[27] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[27]),
        .Q(period_value[27]),
        .R(1'b0));
  FDRE \period_value_reg[28] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[28]),
        .Q(period_value[28]),
        .R(1'b0));
  FDRE \period_value_reg[29] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[29]),
        .Q(period_value[29]),
        .R(1'b0));
  FDRE \period_value_reg[2] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[2]),
        .Q(period_data[2]),
        .R(1'b0));
  FDRE \period_value_reg[30] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[30]),
        .Q(period_value[30]),
        .R(1'b0));
  FDRE \period_value_reg[31] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[31]),
        .Q(period_value[31]),
        .R(1'b0));
  FDRE \period_value_reg[3] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[3]),
        .Q(period_data[3]),
        .R(1'b0));
  FDRE \period_value_reg[4] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[4]),
        .Q(period_data[4]),
        .R(1'b0));
  FDRE \period_value_reg[5] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[5]),
        .Q(period_data[5]),
        .R(1'b0));
  FDRE \period_value_reg[6] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[6]),
        .Q(period_data[6]),
        .R(1'b0));
  FDRE \period_value_reg[7] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[7]),
        .Q(period_data[7]),
        .R(1'b0));
  FDRE \period_value_reg[8] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[8]),
        .Q(period_data[8]),
        .R(1'b0));
  FDRE \period_value_reg[9] 
       (.C(axis_aclk),
        .CE(\period_value[15]_i_1_n_0 ),
        .D(period_cnt_reg[9]),
        .Q(period_data[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000400)) 
    \rpm_data_i[15]_i_1 
       (.I0(sm_state),
        .I1(\rpm_data_i[15]_i_3_n_0 ),
        .I2(\rpm_data_i[15]_i_4_n_0 ),
        .I3(\rpm_data_i[15]_i_5_n_0 ),
        .I4(\rpm_data_i[15]_i_6_n_0 ),
        .O(\rpm_data_i[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \rpm_data_i[15]_i_10 
       (.I0(period_data[7]),
        .I1(period_data[6]),
        .I2(period_data[5]),
        .I3(period_data[4]),
        .O(\rpm_data_i[15]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rpm_data_i[15]_i_2 
       (.I0(sm_state),
        .I1(div_value1_carry__2_n_0),
        .O(\rpm_data_i[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \rpm_data_i[15]_i_3 
       (.I0(period_value[28]),
        .I1(period_value[29]),
        .I2(period_value[31]),
        .I3(period_value[30]),
        .I4(\rpm_data_i[15]_i_7_n_0 ),
        .O(\rpm_data_i[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \rpm_data_i[15]_i_4 
       (.I0(period_value[16]),
        .I1(period_value[17]),
        .I2(period_value[18]),
        .I3(period_value[19]),
        .I4(\rpm_data_i[15]_i_8_n_0 ),
        .O(\rpm_data_i[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \rpm_data_i[15]_i_5 
       (.I0(period_data[12]),
        .I1(period_data[13]),
        .I2(period_data[14]),
        .I3(period_data[15]),
        .I4(\rpm_data_i[15]_i_9_n_0 ),
        .O(\rpm_data_i[15]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \rpm_data_i[15]_i_6 
       (.I0(period_data[0]),
        .I1(period_data[1]),
        .I2(period_data[2]),
        .I3(period_data[3]),
        .I4(\rpm_data_i[15]_i_10_n_0 ),
        .O(\rpm_data_i[15]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rpm_data_i[15]_i_7 
       (.I0(period_value[25]),
        .I1(period_value[24]),
        .I2(period_value[27]),
        .I3(period_value[26]),
        .O(\rpm_data_i[15]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \rpm_data_i[15]_i_8 
       (.I0(period_value[23]),
        .I1(period_value[22]),
        .I2(period_value[21]),
        .I3(period_value[20]),
        .O(\rpm_data_i[15]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rpm_data_i[15]_i_9 
       (.I0(period_data[9]),
        .I1(period_data[8]),
        .I2(period_data[11]),
        .I3(period_data[10]),
        .O(\rpm_data_i[15]_i_9_n_0 ));
  FDRE \rpm_data_i_reg[0] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[0]),
        .Q(rpm_data[0]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[10] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[10]),
        .Q(rpm_data[10]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[11] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[11]),
        .Q(rpm_data[11]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[12] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[12]),
        .Q(rpm_data[12]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[13] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[13]),
        .Q(rpm_data[13]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[14] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[14]),
        .Q(rpm_data[14]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[15] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[15]),
        .Q(rpm_data[15]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[1] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[1]),
        .Q(rpm_data[1]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[2] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[2]),
        .Q(rpm_data[2]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[3] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[3]),
        .Q(rpm_data[3]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[4] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[4]),
        .Q(rpm_data[4]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[5] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[5]),
        .Q(rpm_data[5]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[6] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[6]),
        .Q(rpm_data[6]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[7] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[7]),
        .Q(rpm_data[7]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[8] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[8]),
        .Q(rpm_data[8]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  FDRE \rpm_data_i_reg[9] 
       (.C(axis_aclk),
        .CE(\rpm_data_i[15]_i_2_n_0 ),
        .D(div_cnt_reg[9]),
        .Q(rpm_data[9]),
        .R(\rpm_data_i[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7777747777777777)) 
    sm_state_i_1
       (.I0(div_value1_carry__2_n_0),
        .I1(sm_state),
        .I2(\rpm_data_i[15]_i_6_n_0 ),
        .I3(\rpm_data_i[15]_i_5_n_0 ),
        .I4(\rpm_data_i[15]_i_4_n_0 ),
        .I5(\rpm_data_i[15]_i_3_n_0 ),
        .O(sm_state_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sm_state_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(sm_state_i_1_n_0),
        .Q(sm_state),
        .R(1'b0));
  FDRE update_reg
       (.C(axis_aclk),
        .CE(1'b1),
        .D(\cnt[15]_i_2_n_0 ),
        .Q(update),
        .R(1'b0));
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

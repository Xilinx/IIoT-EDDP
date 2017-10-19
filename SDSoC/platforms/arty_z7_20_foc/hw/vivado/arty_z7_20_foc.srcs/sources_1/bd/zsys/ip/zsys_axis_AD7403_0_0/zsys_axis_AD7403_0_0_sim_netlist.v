// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
// Date        : Fri Oct  6 12:15:41 2017
// Host        : W7-64-12 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               B:/SVN/cores/2017.1/design/TEC0053/platforms/arty_z7_20_foc/hw/vivado/arty_z7_20_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_AD7403_0_0/zsys_axis_AD7403_0_0_sim_netlist.v
// Design      : zsys_axis_AD7403_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "zsys_axis_AD7403_0_0,axis_AD7403_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axis_AD7403_v1_0,Vivado 2017.1_sdx" *) 
(* NotValidForBitStream *)
module zsys_axis_AD7403_0_0
   (din,
    clkout,
    update,
    m_axis_tdata,
    m_axis_tready,
    m_axis_tvalid,
    m_axis_aclk,
    m_axis_aresetn);
  input [3:0]din;
  output clkout;
  output update;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) output [63:0]m_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 m_axis_aclk CLK" *) input m_axis_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 m_axis_aresetn RST" *) input m_axis_aresetn;

  wire clkout;
  wire [3:0]din;
  wire m_axis_aclk;
  wire [63:0]m_axis_tdata;
  wire update;

  assign m_axis_tvalid = update;
  zsys_axis_AD7403_0_0_axis_AD7403_v1_0 U0
       (.clkout(clkout),
        .din(din),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_tdata(m_axis_tdata),
        .update(update));
endmodule

(* ORIG_REF_NAME = "axis_AD7403_v1_0" *) 
module zsys_axis_AD7403_0_0_axis_AD7403_v1_0
   (update,
    clkout,
    m_axis_tdata,
    din,
    m_axis_aclk);
  output update;
  output clkout;
  output [63:0]m_axis_tdata;
  input [3:0]din;
  input m_axis_aclk;

  wire [14:0]\ch_data[0]_0 ;
  wire [14:0]\ch_data[1]_1 ;
  wire [14:0]\ch_data[2]_2 ;
  wire [14:0]\ch_data[3]_3 ;
  wire \channels_gen[1].ch_inst_n_0 ;
  wire \channels_gen[2].ch_inst_n_0 ;
  wire \channels_gen[3].ch_inst_n_0 ;
  wire clkout;
  wire [3:0]din;
  wire m_axis_aclk;
  wire [63:0]m_axis_tdata;
  wire [15:15]p_0_in;
  wire update;
  wire NLW_mclk_ODDR_inst_R_UNCONNECTED;
  wire NLW_mclk_ODDR_inst_S_UNCONNECTED;

  zsys_axis_AD7403_0_0_sinc3 \channels_gen[0].ch_inst 
       (.D({p_0_in,\ch_data[0]_0 }),
        .din(din[0]),
        .m_axis_aclk(m_axis_aclk),
        .update(update));
  zsys_axis_AD7403_0_0_sinc3_0 \channels_gen[1].ch_inst 
       (.D({\channels_gen[1].ch_inst_n_0 ,\ch_data[1]_1 }),
        .din(din[1]),
        .m_axis_aclk(m_axis_aclk));
  zsys_axis_AD7403_0_0_sinc3_1 \channels_gen[2].ch_inst 
       (.D({\channels_gen[2].ch_inst_n_0 ,\ch_data[2]_2 }),
        .din(din[2]),
        .m_axis_aclk(m_axis_aclk));
  zsys_axis_AD7403_0_0_sinc3_2 \channels_gen[3].ch_inst 
       (.D({\channels_gen[3].ch_inst_n_0 ,\ch_data[3]_3 }),
        .din(din[3]),
        .m_axis_aclk(m_axis_aclk));
  (* __SRVAL = "TRUE" *) 
  (* box_type = "PRIMITIVE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    mclk_ODDR_inst
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b1),
        .Q(clkout),
        .R(NLW_mclk_ODDR_inst_R_UNCONNECTED),
        .S(NLW_mclk_ODDR_inst_S_UNCONNECTED));
  FDRE \signed_gen[0].ch_s_data_reg[0][0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [0]),
        .Q(m_axis_tdata[0]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [10]),
        .Q(m_axis_tdata[10]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [11]),
        .Q(m_axis_tdata[11]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [12]),
        .Q(m_axis_tdata[12]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [13]),
        .Q(m_axis_tdata[13]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [14]),
        .Q(m_axis_tdata[14]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(m_axis_tdata[15]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [1]),
        .Q(m_axis_tdata[1]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [2]),
        .Q(m_axis_tdata[2]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [3]),
        .Q(m_axis_tdata[3]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [4]),
        .Q(m_axis_tdata[4]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [5]),
        .Q(m_axis_tdata[5]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [6]),
        .Q(m_axis_tdata[6]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [7]),
        .Q(m_axis_tdata[7]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [8]),
        .Q(m_axis_tdata[8]),
        .R(1'b0));
  FDRE \signed_gen[0].ch_s_data_reg[0][9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[0]_0 [9]),
        .Q(m_axis_tdata[9]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [0]),
        .Q(m_axis_tdata[16]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [10]),
        .Q(m_axis_tdata[26]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [11]),
        .Q(m_axis_tdata[27]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [12]),
        .Q(m_axis_tdata[28]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [13]),
        .Q(m_axis_tdata[29]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [14]),
        .Q(m_axis_tdata[30]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\channels_gen[1].ch_inst_n_0 ),
        .Q(m_axis_tdata[31]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [1]),
        .Q(m_axis_tdata[17]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [2]),
        .Q(m_axis_tdata[18]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [3]),
        .Q(m_axis_tdata[19]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [4]),
        .Q(m_axis_tdata[20]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [5]),
        .Q(m_axis_tdata[21]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [6]),
        .Q(m_axis_tdata[22]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [7]),
        .Q(m_axis_tdata[23]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [8]),
        .Q(m_axis_tdata[24]),
        .R(1'b0));
  FDRE \signed_gen[1].ch_s_data_reg[1][9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[1]_1 [9]),
        .Q(m_axis_tdata[25]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [0]),
        .Q(m_axis_tdata[32]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [10]),
        .Q(m_axis_tdata[42]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [11]),
        .Q(m_axis_tdata[43]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [12]),
        .Q(m_axis_tdata[44]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [13]),
        .Q(m_axis_tdata[45]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [14]),
        .Q(m_axis_tdata[46]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\channels_gen[2].ch_inst_n_0 ),
        .Q(m_axis_tdata[47]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [1]),
        .Q(m_axis_tdata[33]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [2]),
        .Q(m_axis_tdata[34]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [3]),
        .Q(m_axis_tdata[35]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [4]),
        .Q(m_axis_tdata[36]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [5]),
        .Q(m_axis_tdata[37]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [6]),
        .Q(m_axis_tdata[38]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [7]),
        .Q(m_axis_tdata[39]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [8]),
        .Q(m_axis_tdata[40]),
        .R(1'b0));
  FDRE \signed_gen[2].ch_s_data_reg[2][9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[2]_2 [9]),
        .Q(m_axis_tdata[41]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [0]),
        .Q(m_axis_tdata[48]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [10]),
        .Q(m_axis_tdata[58]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [11]),
        .Q(m_axis_tdata[59]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [12]),
        .Q(m_axis_tdata[60]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [13]),
        .Q(m_axis_tdata[61]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [14]),
        .Q(m_axis_tdata[62]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\channels_gen[3].ch_inst_n_0 ),
        .Q(m_axis_tdata[63]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [1]),
        .Q(m_axis_tdata[49]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [2]),
        .Q(m_axis_tdata[50]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [3]),
        .Q(m_axis_tdata[51]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [4]),
        .Q(m_axis_tdata[52]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [5]),
        .Q(m_axis_tdata[53]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [6]),
        .Q(m_axis_tdata[54]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [7]),
        .Q(m_axis_tdata[55]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [8]),
        .Q(m_axis_tdata[56]),
        .R(1'b0));
  FDRE \signed_gen[3].ch_s_data_reg[3][9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\ch_data[3]_3 [9]),
        .Q(m_axis_tdata[57]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "sinc3" *) 
module zsys_axis_AD7403_0_0_sinc3
   (D,
    update,
    din,
    m_axis_aclk);
  output [15:0]D;
  output update;
  input [0:0]din;
  input m_axis_aclk;

  wire [15:0]D;
  wire \acc1[0]_i_2_n_0 ;
  wire \acc1[0]_i_3_n_0 ;
  wire \acc1[0]_i_4_n_0 ;
  wire \acc1[0]_i_5_n_0 ;
  wire \acc1[12]_i_2_n_0 ;
  wire \acc1[12]_i_3_n_0 ;
  wire \acc1[12]_i_4_n_0 ;
  wire \acc1[12]_i_5_n_0 ;
  wire \acc1[16]_i_2_n_0 ;
  wire \acc1[16]_i_3_n_0 ;
  wire \acc1[16]_i_4_n_0 ;
  wire \acc1[16]_i_5_n_0 ;
  wire \acc1[20]_i_2_n_0 ;
  wire \acc1[20]_i_3_n_0 ;
  wire \acc1[4]_i_2_n_0 ;
  wire \acc1[4]_i_3_n_0 ;
  wire \acc1[4]_i_4_n_0 ;
  wire \acc1[4]_i_5_n_0 ;
  wire \acc1[8]_i_2_n_0 ;
  wire \acc1[8]_i_3_n_0 ;
  wire \acc1[8]_i_4_n_0 ;
  wire \acc1[8]_i_5_n_0 ;
  wire [21:0]acc1_reg;
  wire \acc1_reg[0]_i_1_n_0 ;
  wire \acc1_reg[0]_i_1_n_1 ;
  wire \acc1_reg[0]_i_1_n_2 ;
  wire \acc1_reg[0]_i_1_n_3 ;
  wire \acc1_reg[0]_i_1_n_4 ;
  wire \acc1_reg[0]_i_1_n_5 ;
  wire \acc1_reg[0]_i_1_n_6 ;
  wire \acc1_reg[0]_i_1_n_7 ;
  wire \acc1_reg[12]_i_1_n_0 ;
  wire \acc1_reg[12]_i_1_n_1 ;
  wire \acc1_reg[12]_i_1_n_2 ;
  wire \acc1_reg[12]_i_1_n_3 ;
  wire \acc1_reg[12]_i_1_n_4 ;
  wire \acc1_reg[12]_i_1_n_5 ;
  wire \acc1_reg[12]_i_1_n_6 ;
  wire \acc1_reg[12]_i_1_n_7 ;
  wire \acc1_reg[16]_i_1_n_0 ;
  wire \acc1_reg[16]_i_1_n_1 ;
  wire \acc1_reg[16]_i_1_n_2 ;
  wire \acc1_reg[16]_i_1_n_3 ;
  wire \acc1_reg[16]_i_1_n_4 ;
  wire \acc1_reg[16]_i_1_n_5 ;
  wire \acc1_reg[16]_i_1_n_6 ;
  wire \acc1_reg[16]_i_1_n_7 ;
  wire \acc1_reg[20]_i_1_n_3 ;
  wire \acc1_reg[20]_i_1_n_6 ;
  wire \acc1_reg[20]_i_1_n_7 ;
  wire \acc1_reg[4]_i_1_n_0 ;
  wire \acc1_reg[4]_i_1_n_1 ;
  wire \acc1_reg[4]_i_1_n_2 ;
  wire \acc1_reg[4]_i_1_n_3 ;
  wire \acc1_reg[4]_i_1_n_4 ;
  wire \acc1_reg[4]_i_1_n_5 ;
  wire \acc1_reg[4]_i_1_n_6 ;
  wire \acc1_reg[4]_i_1_n_7 ;
  wire \acc1_reg[8]_i_1_n_0 ;
  wire \acc1_reg[8]_i_1_n_1 ;
  wire \acc1_reg[8]_i_1_n_2 ;
  wire \acc1_reg[8]_i_1_n_3 ;
  wire \acc1_reg[8]_i_1_n_4 ;
  wire \acc1_reg[8]_i_1_n_5 ;
  wire \acc1_reg[8]_i_1_n_6 ;
  wire \acc1_reg[8]_i_1_n_7 ;
  wire \acc2[0]_i_2_n_0 ;
  wire \acc2[0]_i_3_n_0 ;
  wire \acc2[0]_i_4_n_0 ;
  wire \acc2[0]_i_5_n_0 ;
  wire \acc2[12]_i_2_n_0 ;
  wire \acc2[12]_i_3_n_0 ;
  wire \acc2[12]_i_4_n_0 ;
  wire \acc2[12]_i_5_n_0 ;
  wire \acc2[16]_i_2_n_0 ;
  wire \acc2[16]_i_3_n_0 ;
  wire \acc2[16]_i_4_n_0 ;
  wire \acc2[16]_i_5_n_0 ;
  wire \acc2[20]_i_2_n_0 ;
  wire \acc2[20]_i_3_n_0 ;
  wire \acc2[4]_i_2_n_0 ;
  wire \acc2[4]_i_3_n_0 ;
  wire \acc2[4]_i_4_n_0 ;
  wire \acc2[4]_i_5_n_0 ;
  wire \acc2[8]_i_2_n_0 ;
  wire \acc2[8]_i_3_n_0 ;
  wire \acc2[8]_i_4_n_0 ;
  wire \acc2[8]_i_5_n_0 ;
  wire [21:0]acc2_reg;
  wire \acc2_reg[0]_i_1_n_0 ;
  wire \acc2_reg[0]_i_1_n_1 ;
  wire \acc2_reg[0]_i_1_n_2 ;
  wire \acc2_reg[0]_i_1_n_3 ;
  wire \acc2_reg[0]_i_1_n_4 ;
  wire \acc2_reg[0]_i_1_n_5 ;
  wire \acc2_reg[0]_i_1_n_6 ;
  wire \acc2_reg[0]_i_1_n_7 ;
  wire \acc2_reg[12]_i_1_n_0 ;
  wire \acc2_reg[12]_i_1_n_1 ;
  wire \acc2_reg[12]_i_1_n_2 ;
  wire \acc2_reg[12]_i_1_n_3 ;
  wire \acc2_reg[12]_i_1_n_4 ;
  wire \acc2_reg[12]_i_1_n_5 ;
  wire \acc2_reg[12]_i_1_n_6 ;
  wire \acc2_reg[12]_i_1_n_7 ;
  wire \acc2_reg[16]_i_1_n_0 ;
  wire \acc2_reg[16]_i_1_n_1 ;
  wire \acc2_reg[16]_i_1_n_2 ;
  wire \acc2_reg[16]_i_1_n_3 ;
  wire \acc2_reg[16]_i_1_n_4 ;
  wire \acc2_reg[16]_i_1_n_5 ;
  wire \acc2_reg[16]_i_1_n_6 ;
  wire \acc2_reg[16]_i_1_n_7 ;
  wire \acc2_reg[20]_i_1_n_3 ;
  wire \acc2_reg[20]_i_1_n_6 ;
  wire \acc2_reg[20]_i_1_n_7 ;
  wire \acc2_reg[4]_i_1_n_0 ;
  wire \acc2_reg[4]_i_1_n_1 ;
  wire \acc2_reg[4]_i_1_n_2 ;
  wire \acc2_reg[4]_i_1_n_3 ;
  wire \acc2_reg[4]_i_1_n_4 ;
  wire \acc2_reg[4]_i_1_n_5 ;
  wire \acc2_reg[4]_i_1_n_6 ;
  wire \acc2_reg[4]_i_1_n_7 ;
  wire \acc2_reg[8]_i_1_n_0 ;
  wire \acc2_reg[8]_i_1_n_1 ;
  wire \acc2_reg[8]_i_1_n_2 ;
  wire \acc2_reg[8]_i_1_n_3 ;
  wire \acc2_reg[8]_i_1_n_4 ;
  wire \acc2_reg[8]_i_1_n_5 ;
  wire \acc2_reg[8]_i_1_n_6 ;
  wire \acc2_reg[8]_i_1_n_7 ;
  wire \acc3[0]_i_2_n_0 ;
  wire \acc3[0]_i_3_n_0 ;
  wire \acc3[0]_i_4_n_0 ;
  wire \acc3[0]_i_5_n_0 ;
  wire \acc3[12]_i_2_n_0 ;
  wire \acc3[12]_i_3_n_0 ;
  wire \acc3[12]_i_4_n_0 ;
  wire \acc3[12]_i_5_n_0 ;
  wire \acc3[16]_i_2_n_0 ;
  wire \acc3[16]_i_3_n_0 ;
  wire \acc3[16]_i_4_n_0 ;
  wire \acc3[16]_i_5_n_0 ;
  wire \acc3[20]_i_2_n_0 ;
  wire \acc3[20]_i_3_n_0 ;
  wire \acc3[4]_i_2_n_0 ;
  wire \acc3[4]_i_3_n_0 ;
  wire \acc3[4]_i_4_n_0 ;
  wire \acc3[4]_i_5_n_0 ;
  wire \acc3[8]_i_2_n_0 ;
  wire \acc3[8]_i_3_n_0 ;
  wire \acc3[8]_i_4_n_0 ;
  wire \acc3[8]_i_5_n_0 ;
  wire [21:0]acc3_d2;
  wire [21:0]acc3_reg;
  wire \acc3_reg[0]_i_1_n_0 ;
  wire \acc3_reg[0]_i_1_n_1 ;
  wire \acc3_reg[0]_i_1_n_2 ;
  wire \acc3_reg[0]_i_1_n_3 ;
  wire \acc3_reg[0]_i_1_n_4 ;
  wire \acc3_reg[0]_i_1_n_5 ;
  wire \acc3_reg[0]_i_1_n_6 ;
  wire \acc3_reg[0]_i_1_n_7 ;
  wire \acc3_reg[12]_i_1_n_0 ;
  wire \acc3_reg[12]_i_1_n_1 ;
  wire \acc3_reg[12]_i_1_n_2 ;
  wire \acc3_reg[12]_i_1_n_3 ;
  wire \acc3_reg[12]_i_1_n_4 ;
  wire \acc3_reg[12]_i_1_n_5 ;
  wire \acc3_reg[12]_i_1_n_6 ;
  wire \acc3_reg[12]_i_1_n_7 ;
  wire \acc3_reg[16]_i_1_n_0 ;
  wire \acc3_reg[16]_i_1_n_1 ;
  wire \acc3_reg[16]_i_1_n_2 ;
  wire \acc3_reg[16]_i_1_n_3 ;
  wire \acc3_reg[16]_i_1_n_4 ;
  wire \acc3_reg[16]_i_1_n_5 ;
  wire \acc3_reg[16]_i_1_n_6 ;
  wire \acc3_reg[16]_i_1_n_7 ;
  wire \acc3_reg[20]_i_1_n_3 ;
  wire \acc3_reg[20]_i_1_n_6 ;
  wire \acc3_reg[20]_i_1_n_7 ;
  wire \acc3_reg[4]_i_1_n_0 ;
  wire \acc3_reg[4]_i_1_n_1 ;
  wire \acc3_reg[4]_i_1_n_2 ;
  wire \acc3_reg[4]_i_1_n_3 ;
  wire \acc3_reg[4]_i_1_n_4 ;
  wire \acc3_reg[4]_i_1_n_5 ;
  wire \acc3_reg[4]_i_1_n_6 ;
  wire \acc3_reg[4]_i_1_n_7 ;
  wire \acc3_reg[8]_i_1_n_0 ;
  wire \acc3_reg[8]_i_1_n_1 ;
  wire \acc3_reg[8]_i_1_n_2 ;
  wire \acc3_reg[8]_i_1_n_3 ;
  wire \acc3_reg[8]_i_1_n_4 ;
  wire \acc3_reg[8]_i_1_n_5 ;
  wire \acc3_reg[8]_i_1_n_6 ;
  wire \acc3_reg[8]_i_1_n_7 ;
  wire [15:15]\ch_data[0]_0 ;
  wire [13:0]data0;
  wire [21:0]diff1;
  wire [21:0]diff102_out;
  wire \diff1[11]_i_2_n_0 ;
  wire \diff1[11]_i_3_n_0 ;
  wire \diff1[11]_i_4_n_0 ;
  wire \diff1[11]_i_5_n_0 ;
  wire \diff1[15]_i_2_n_0 ;
  wire \diff1[15]_i_3_n_0 ;
  wire \diff1[15]_i_4_n_0 ;
  wire \diff1[15]_i_5_n_0 ;
  wire \diff1[19]_i_2_n_0 ;
  wire \diff1[19]_i_3_n_0 ;
  wire \diff1[19]_i_4_n_0 ;
  wire \diff1[19]_i_5_n_0 ;
  wire \diff1[21]_i_2_n_0 ;
  wire \diff1[21]_i_3_n_0 ;
  wire \diff1[3]_i_2_n_0 ;
  wire \diff1[3]_i_3_n_0 ;
  wire \diff1[3]_i_4_n_0 ;
  wire \diff1[3]_i_5_n_0 ;
  wire \diff1[7]_i_2_n_0 ;
  wire \diff1[7]_i_3_n_0 ;
  wire \diff1[7]_i_4_n_0 ;
  wire \diff1[7]_i_5_n_0 ;
  wire [21:0]diff1_d;
  wire \diff1_reg[11]_i_1_n_0 ;
  wire \diff1_reg[11]_i_1_n_1 ;
  wire \diff1_reg[11]_i_1_n_2 ;
  wire \diff1_reg[11]_i_1_n_3 ;
  wire \diff1_reg[15]_i_1_n_0 ;
  wire \diff1_reg[15]_i_1_n_1 ;
  wire \diff1_reg[15]_i_1_n_2 ;
  wire \diff1_reg[15]_i_1_n_3 ;
  wire \diff1_reg[19]_i_1_n_0 ;
  wire \diff1_reg[19]_i_1_n_1 ;
  wire \diff1_reg[19]_i_1_n_2 ;
  wire \diff1_reg[19]_i_1_n_3 ;
  wire \diff1_reg[21]_i_1_n_3 ;
  wire \diff1_reg[3]_i_1_n_0 ;
  wire \diff1_reg[3]_i_1_n_1 ;
  wire \diff1_reg[3]_i_1_n_2 ;
  wire \diff1_reg[3]_i_1_n_3 ;
  wire \diff1_reg[7]_i_1_n_0 ;
  wire \diff1_reg[7]_i_1_n_1 ;
  wire \diff1_reg[7]_i_1_n_2 ;
  wire \diff1_reg[7]_i_1_n_3 ;
  wire [21:0]diff2;
  wire [21:0]diff201_out;
  wire \diff2[11]_i_2_n_0 ;
  wire \diff2[11]_i_3_n_0 ;
  wire \diff2[11]_i_4_n_0 ;
  wire \diff2[11]_i_5_n_0 ;
  wire \diff2[15]_i_2_n_0 ;
  wire \diff2[15]_i_3_n_0 ;
  wire \diff2[15]_i_4_n_0 ;
  wire \diff2[15]_i_5_n_0 ;
  wire \diff2[19]_i_2_n_0 ;
  wire \diff2[19]_i_3_n_0 ;
  wire \diff2[19]_i_4_n_0 ;
  wire \diff2[19]_i_5_n_0 ;
  wire \diff2[21]_i_2_n_0 ;
  wire \diff2[21]_i_3_n_0 ;
  wire \diff2[3]_i_2_n_0 ;
  wire \diff2[3]_i_3_n_0 ;
  wire \diff2[3]_i_4_n_0 ;
  wire \diff2[3]_i_5_n_0 ;
  wire \diff2[7]_i_2_n_0 ;
  wire \diff2[7]_i_3_n_0 ;
  wire \diff2[7]_i_4_n_0 ;
  wire \diff2[7]_i_5_n_0 ;
  wire [21:0]diff2_d;
  wire \diff2_reg[11]_i_1_n_0 ;
  wire \diff2_reg[11]_i_1_n_1 ;
  wire \diff2_reg[11]_i_1_n_2 ;
  wire \diff2_reg[11]_i_1_n_3 ;
  wire \diff2_reg[15]_i_1_n_0 ;
  wire \diff2_reg[15]_i_1_n_1 ;
  wire \diff2_reg[15]_i_1_n_2 ;
  wire \diff2_reg[15]_i_1_n_3 ;
  wire \diff2_reg[19]_i_1_n_0 ;
  wire \diff2_reg[19]_i_1_n_1 ;
  wire \diff2_reg[19]_i_1_n_2 ;
  wire \diff2_reg[19]_i_1_n_3 ;
  wire \diff2_reg[21]_i_1_n_3 ;
  wire \diff2_reg[3]_i_1_n_0 ;
  wire \diff2_reg[3]_i_1_n_1 ;
  wire \diff2_reg[3]_i_1_n_2 ;
  wire \diff2_reg[3]_i_1_n_3 ;
  wire \diff2_reg[7]_i_1_n_0 ;
  wire \diff2_reg[7]_i_1_n_1 ;
  wire \diff2_reg[7]_i_1_n_2 ;
  wire \diff2_reg[7]_i_1_n_3 ;
  wire [21:5]diff300_out;
  wire \diff3[11]_i_2_n_0 ;
  wire \diff3[11]_i_3_n_0 ;
  wire \diff3[11]_i_4_n_0 ;
  wire \diff3[11]_i_5_n_0 ;
  wire \diff3[15]_i_2_n_0 ;
  wire \diff3[15]_i_3_n_0 ;
  wire \diff3[15]_i_4_n_0 ;
  wire \diff3[15]_i_5_n_0 ;
  wire \diff3[19]_i_2_n_0 ;
  wire \diff3[19]_i_3_n_0 ;
  wire \diff3[19]_i_4_n_0 ;
  wire \diff3[19]_i_5_n_0 ;
  wire \diff3[21]_i_2_n_0 ;
  wire \diff3[21]_i_3_n_0 ;
  wire \diff3[7]_i_10_n_0 ;
  wire \diff3[7]_i_3_n_0 ;
  wire \diff3[7]_i_4_n_0 ;
  wire \diff3[7]_i_5_n_0 ;
  wire \diff3[7]_i_6_n_0 ;
  wire \diff3[7]_i_7_n_0 ;
  wire \diff3[7]_i_8_n_0 ;
  wire \diff3[7]_i_9_n_0 ;
  wire \diff3_reg[11]_i_1_n_0 ;
  wire \diff3_reg[11]_i_1_n_1 ;
  wire \diff3_reg[11]_i_1_n_2 ;
  wire \diff3_reg[11]_i_1_n_3 ;
  wire \diff3_reg[15]_i_1_n_0 ;
  wire \diff3_reg[15]_i_1_n_1 ;
  wire \diff3_reg[15]_i_1_n_2 ;
  wire \diff3_reg[15]_i_1_n_3 ;
  wire \diff3_reg[19]_i_1_n_0 ;
  wire \diff3_reg[19]_i_1_n_1 ;
  wire \diff3_reg[19]_i_1_n_2 ;
  wire \diff3_reg[19]_i_1_n_3 ;
  wire \diff3_reg[21]_i_1_n_3 ;
  wire \diff3_reg[7]_i_1_n_0 ;
  wire \diff3_reg[7]_i_1_n_1 ;
  wire \diff3_reg[7]_i_1_n_2 ;
  wire \diff3_reg[7]_i_1_n_3 ;
  wire \diff3_reg[7]_i_2_n_0 ;
  wire \diff3_reg[7]_i_2_n_1 ;
  wire \diff3_reg[7]_i_2_n_2 ;
  wire \diff3_reg[7]_i_2_n_3 ;
  wire \diff3_reg_n_0_[5] ;
  wire \diff3_reg_n_0_[6] ;
  wire \diff3_reg_n_0_[7] ;
  wire [0:0]din;
  wire m_axis_aclk;
  wire mdat_i;
  wire [0:0]p_1_in;
  wire \tdata[0]_i_2_n_0 ;
  wire \tdata[0]_i_3_n_0 ;
  wire \tdata[0]_i_4_n_0 ;
  wire \tdata[0]_i_5_n_0 ;
  wire \tdata[15]_i_1_n_0 ;
  wire update;
  wire word_clk;
  wire word_clk0;
  wire word_clk_i_3_n_0;
  wire word_clk_i_4_n_0;
  wire word_clk_i_5_n_0;
  wire word_clk_i_6_n_0;
  wire word_clk_i_7_n_0;
  wire word_clk_i_8_n_0;
  wire word_clk_reg_i_1_n_3;
  wire word_clk_reg_i_2_n_0;
  wire word_clk_reg_i_2_n_1;
  wire word_clk_reg_i_2_n_2;
  wire word_clk_reg_i_2_n_3;
  wire word_count0;
  wire \word_count[0]_i_10_n_0 ;
  wire \word_count[0]_i_11_n_0 ;
  wire \word_count[0]_i_12_n_0 ;
  wire \word_count[0]_i_13_n_0 ;
  wire \word_count[0]_i_4_n_0 ;
  wire \word_count[0]_i_5_n_0 ;
  wire \word_count[0]_i_6_n_0 ;
  wire \word_count[0]_i_7_n_0 ;
  wire \word_count[0]_i_8_n_0 ;
  wire \word_count[0]_i_9_n_0 ;
  wire \word_count[12]_i_2_n_0 ;
  wire \word_count[12]_i_3_n_0 ;
  wire \word_count[12]_i_4_n_0 ;
  wire \word_count[12]_i_5_n_0 ;
  wire \word_count[4]_i_2_n_0 ;
  wire \word_count[4]_i_3_n_0 ;
  wire \word_count[4]_i_4_n_0 ;
  wire \word_count[4]_i_5_n_0 ;
  wire \word_count[8]_i_2_n_0 ;
  wire \word_count[8]_i_3_n_0 ;
  wire \word_count[8]_i_4_n_0 ;
  wire \word_count[8]_i_5_n_0 ;
  wire [15:0]word_count_reg;
  wire \word_count_reg[0]_i_1_n_3 ;
  wire \word_count_reg[0]_i_2_n_0 ;
  wire \word_count_reg[0]_i_2_n_1 ;
  wire \word_count_reg[0]_i_2_n_2 ;
  wire \word_count_reg[0]_i_2_n_3 ;
  wire \word_count_reg[0]_i_2_n_4 ;
  wire \word_count_reg[0]_i_2_n_5 ;
  wire \word_count_reg[0]_i_2_n_6 ;
  wire \word_count_reg[0]_i_2_n_7 ;
  wire \word_count_reg[0]_i_3_n_0 ;
  wire \word_count_reg[0]_i_3_n_1 ;
  wire \word_count_reg[0]_i_3_n_2 ;
  wire \word_count_reg[0]_i_3_n_3 ;
  wire \word_count_reg[12]_i_1_n_1 ;
  wire \word_count_reg[12]_i_1_n_2 ;
  wire \word_count_reg[12]_i_1_n_3 ;
  wire \word_count_reg[12]_i_1_n_4 ;
  wire \word_count_reg[12]_i_1_n_5 ;
  wire \word_count_reg[12]_i_1_n_6 ;
  wire \word_count_reg[12]_i_1_n_7 ;
  wire \word_count_reg[4]_i_1_n_0 ;
  wire \word_count_reg[4]_i_1_n_1 ;
  wire \word_count_reg[4]_i_1_n_2 ;
  wire \word_count_reg[4]_i_1_n_3 ;
  wire \word_count_reg[4]_i_1_n_4 ;
  wire \word_count_reg[4]_i_1_n_5 ;
  wire \word_count_reg[4]_i_1_n_6 ;
  wire \word_count_reg[4]_i_1_n_7 ;
  wire \word_count_reg[8]_i_1_n_0 ;
  wire \word_count_reg[8]_i_1_n_1 ;
  wire \word_count_reg[8]_i_1_n_2 ;
  wire \word_count_reg[8]_i_1_n_3 ;
  wire \word_count_reg[8]_i_1_n_4 ;
  wire \word_count_reg[8]_i_1_n_5 ;
  wire \word_count_reg[8]_i_1_n_6 ;
  wire \word_count_reg[8]_i_1_n_7 ;
  wire [3:1]\NLW_acc1_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc1_reg[20]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_acc2_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc2_reg[20]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_acc3_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc3_reg[20]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_diff1_reg[21]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff1_reg[21]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_diff2_reg[21]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff2_reg[21]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_diff3_reg[21]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff3_reg[21]_i_1_O_UNCONNECTED ;
  wire [0:0]\NLW_diff3_reg[7]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_diff3_reg[7]_i_2_O_UNCONNECTED ;
  wire [3:2]NLW_word_clk_reg_i_1_CO_UNCONNECTED;
  wire [3:0]NLW_word_clk_reg_i_1_O_UNCONNECTED;
  wire [3:0]NLW_word_clk_reg_i_2_O_UNCONNECTED;
  wire [3:2]\NLW_word_count_reg[0]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_word_count_reg[0]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_word_count_reg[0]_i_3_O_UNCONNECTED ;
  wire [3:3]\NLW_word_count_reg[12]_i_1_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_2 
       (.I0(acc1_reg[3]),
        .O(\acc1[0]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_3 
       (.I0(acc1_reg[2]),
        .O(\acc1[0]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_4 
       (.I0(acc1_reg[1]),
        .O(\acc1[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \acc1[0]_i_5 
       (.I0(acc1_reg[0]),
        .O(\acc1[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_2 
       (.I0(acc1_reg[15]),
        .O(\acc1[12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_3 
       (.I0(acc1_reg[14]),
        .O(\acc1[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_4 
       (.I0(acc1_reg[13]),
        .O(\acc1[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_5 
       (.I0(acc1_reg[12]),
        .O(\acc1[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_2 
       (.I0(acc1_reg[19]),
        .O(\acc1[16]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_3 
       (.I0(acc1_reg[18]),
        .O(\acc1[16]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_4 
       (.I0(acc1_reg[17]),
        .O(\acc1[16]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_5 
       (.I0(acc1_reg[16]),
        .O(\acc1[16]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[20]_i_2 
       (.I0(acc1_reg[21]),
        .O(\acc1[20]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[20]_i_3 
       (.I0(acc1_reg[20]),
        .O(\acc1[20]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_2 
       (.I0(acc1_reg[7]),
        .O(\acc1[4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_3 
       (.I0(acc1_reg[6]),
        .O(\acc1[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_4 
       (.I0(acc1_reg[5]),
        .O(\acc1[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_5 
       (.I0(acc1_reg[4]),
        .O(\acc1[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_2 
       (.I0(acc1_reg[11]),
        .O(\acc1[8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_3 
       (.I0(acc1_reg[10]),
        .O(\acc1[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_4 
       (.I0(acc1_reg[9]),
        .O(\acc1[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_5 
       (.I0(acc1_reg[8]),
        .O(\acc1[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[0] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1_n_7 ),
        .Q(acc1_reg[0]),
        .R(1'b0));
  CARRY4 \acc1_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\acc1_reg[0]_i_1_n_0 ,\acc1_reg[0]_i_1_n_1 ,\acc1_reg[0]_i_1_n_2 ,\acc1_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\acc1_reg[0]_i_1_n_4 ,\acc1_reg[0]_i_1_n_5 ,\acc1_reg[0]_i_1_n_6 ,\acc1_reg[0]_i_1_n_7 }),
        .S({\acc1[0]_i_2_n_0 ,\acc1[0]_i_3_n_0 ,\acc1[0]_i_4_n_0 ,\acc1[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[10] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1_n_5 ),
        .Q(acc1_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[11] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1_n_4 ),
        .Q(acc1_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[12] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1_n_7 ),
        .Q(acc1_reg[12]),
        .R(1'b0));
  CARRY4 \acc1_reg[12]_i_1 
       (.CI(\acc1_reg[8]_i_1_n_0 ),
        .CO({\acc1_reg[12]_i_1_n_0 ,\acc1_reg[12]_i_1_n_1 ,\acc1_reg[12]_i_1_n_2 ,\acc1_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[12]_i_1_n_4 ,\acc1_reg[12]_i_1_n_5 ,\acc1_reg[12]_i_1_n_6 ,\acc1_reg[12]_i_1_n_7 }),
        .S({\acc1[12]_i_2_n_0 ,\acc1[12]_i_3_n_0 ,\acc1[12]_i_4_n_0 ,\acc1[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[13] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1_n_6 ),
        .Q(acc1_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[14] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1_n_5 ),
        .Q(acc1_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[15] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1_n_4 ),
        .Q(acc1_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[16] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1_n_7 ),
        .Q(acc1_reg[16]),
        .R(1'b0));
  CARRY4 \acc1_reg[16]_i_1 
       (.CI(\acc1_reg[12]_i_1_n_0 ),
        .CO({\acc1_reg[16]_i_1_n_0 ,\acc1_reg[16]_i_1_n_1 ,\acc1_reg[16]_i_1_n_2 ,\acc1_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[16]_i_1_n_4 ,\acc1_reg[16]_i_1_n_5 ,\acc1_reg[16]_i_1_n_6 ,\acc1_reg[16]_i_1_n_7 }),
        .S({\acc1[16]_i_2_n_0 ,\acc1[16]_i_3_n_0 ,\acc1[16]_i_4_n_0 ,\acc1[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[17] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1_n_6 ),
        .Q(acc1_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[18] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1_n_5 ),
        .Q(acc1_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[19] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1_n_4 ),
        .Q(acc1_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[1] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1_n_6 ),
        .Q(acc1_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[20] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[20]_i_1_n_7 ),
        .Q(acc1_reg[20]),
        .R(1'b0));
  CARRY4 \acc1_reg[20]_i_1 
       (.CI(\acc1_reg[16]_i_1_n_0 ),
        .CO({\NLW_acc1_reg[20]_i_1_CO_UNCONNECTED [3:1],\acc1_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_acc1_reg[20]_i_1_O_UNCONNECTED [3:2],\acc1_reg[20]_i_1_n_6 ,\acc1_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,\acc1[20]_i_2_n_0 ,\acc1[20]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[21] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[20]_i_1_n_6 ),
        .Q(acc1_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[2] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1_n_5 ),
        .Q(acc1_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[3] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1_n_4 ),
        .Q(acc1_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[4] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1_n_7 ),
        .Q(acc1_reg[4]),
        .R(1'b0));
  CARRY4 \acc1_reg[4]_i_1 
       (.CI(\acc1_reg[0]_i_1_n_0 ),
        .CO({\acc1_reg[4]_i_1_n_0 ,\acc1_reg[4]_i_1_n_1 ,\acc1_reg[4]_i_1_n_2 ,\acc1_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[4]_i_1_n_4 ,\acc1_reg[4]_i_1_n_5 ,\acc1_reg[4]_i_1_n_6 ,\acc1_reg[4]_i_1_n_7 }),
        .S({\acc1[4]_i_2_n_0 ,\acc1[4]_i_3_n_0 ,\acc1[4]_i_4_n_0 ,\acc1[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[5] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1_n_6 ),
        .Q(acc1_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[6] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1_n_5 ),
        .Q(acc1_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[7] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1_n_4 ),
        .Q(acc1_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[8] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1_n_7 ),
        .Q(acc1_reg[8]),
        .R(1'b0));
  CARRY4 \acc1_reg[8]_i_1 
       (.CI(\acc1_reg[4]_i_1_n_0 ),
        .CO({\acc1_reg[8]_i_1_n_0 ,\acc1_reg[8]_i_1_n_1 ,\acc1_reg[8]_i_1_n_2 ,\acc1_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[8]_i_1_n_4 ,\acc1_reg[8]_i_1_n_5 ,\acc1_reg[8]_i_1_n_6 ,\acc1_reg[8]_i_1_n_7 }),
        .S({\acc1[8]_i_2_n_0 ,\acc1[8]_i_3_n_0 ,\acc1[8]_i_4_n_0 ,\acc1[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[9] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1_n_6 ),
        .Q(acc1_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_2 
       (.I0(acc1_reg[3]),
        .I1(acc2_reg[3]),
        .O(\acc2[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_3 
       (.I0(acc1_reg[2]),
        .I1(acc2_reg[2]),
        .O(\acc2[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_4 
       (.I0(acc1_reg[1]),
        .I1(acc2_reg[1]),
        .O(\acc2[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_5 
       (.I0(acc1_reg[0]),
        .I1(acc2_reg[0]),
        .O(\acc2[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_2 
       (.I0(acc1_reg[15]),
        .I1(acc2_reg[15]),
        .O(\acc2[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_3 
       (.I0(acc1_reg[14]),
        .I1(acc2_reg[14]),
        .O(\acc2[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_4 
       (.I0(acc1_reg[13]),
        .I1(acc2_reg[13]),
        .O(\acc2[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_5 
       (.I0(acc1_reg[12]),
        .I1(acc2_reg[12]),
        .O(\acc2[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_2 
       (.I0(acc1_reg[19]),
        .I1(acc2_reg[19]),
        .O(\acc2[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_3 
       (.I0(acc1_reg[18]),
        .I1(acc2_reg[18]),
        .O(\acc2[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_4 
       (.I0(acc1_reg[17]),
        .I1(acc2_reg[17]),
        .O(\acc2[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_5 
       (.I0(acc1_reg[16]),
        .I1(acc2_reg[16]),
        .O(\acc2[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[20]_i_2 
       (.I0(acc2_reg[21]),
        .I1(acc1_reg[21]),
        .O(\acc2[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[20]_i_3 
       (.I0(acc1_reg[20]),
        .I1(acc2_reg[20]),
        .O(\acc2[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_2 
       (.I0(acc1_reg[7]),
        .I1(acc2_reg[7]),
        .O(\acc2[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_3 
       (.I0(acc1_reg[6]),
        .I1(acc2_reg[6]),
        .O(\acc2[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_4 
       (.I0(acc1_reg[5]),
        .I1(acc2_reg[5]),
        .O(\acc2[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_5 
       (.I0(acc1_reg[4]),
        .I1(acc2_reg[4]),
        .O(\acc2[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_2 
       (.I0(acc1_reg[11]),
        .I1(acc2_reg[11]),
        .O(\acc2[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_3 
       (.I0(acc1_reg[10]),
        .I1(acc2_reg[10]),
        .O(\acc2[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_4 
       (.I0(acc1_reg[9]),
        .I1(acc2_reg[9]),
        .O(\acc2[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_5 
       (.I0(acc1_reg[8]),
        .I1(acc2_reg[8]),
        .O(\acc2[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1_n_7 ),
        .Q(acc2_reg[0]),
        .R(1'b0));
  CARRY4 \acc2_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\acc2_reg[0]_i_1_n_0 ,\acc2_reg[0]_i_1_n_1 ,\acc2_reg[0]_i_1_n_2 ,\acc2_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[3:0]),
        .O({\acc2_reg[0]_i_1_n_4 ,\acc2_reg[0]_i_1_n_5 ,\acc2_reg[0]_i_1_n_6 ,\acc2_reg[0]_i_1_n_7 }),
        .S({\acc2[0]_i_2_n_0 ,\acc2[0]_i_3_n_0 ,\acc2[0]_i_4_n_0 ,\acc2[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1_n_5 ),
        .Q(acc2_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1_n_4 ),
        .Q(acc2_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1_n_7 ),
        .Q(acc2_reg[12]),
        .R(1'b0));
  CARRY4 \acc2_reg[12]_i_1 
       (.CI(\acc2_reg[8]_i_1_n_0 ),
        .CO({\acc2_reg[12]_i_1_n_0 ,\acc2_reg[12]_i_1_n_1 ,\acc2_reg[12]_i_1_n_2 ,\acc2_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[15:12]),
        .O({\acc2_reg[12]_i_1_n_4 ,\acc2_reg[12]_i_1_n_5 ,\acc2_reg[12]_i_1_n_6 ,\acc2_reg[12]_i_1_n_7 }),
        .S({\acc2[12]_i_2_n_0 ,\acc2[12]_i_3_n_0 ,\acc2[12]_i_4_n_0 ,\acc2[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1_n_6 ),
        .Q(acc2_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1_n_5 ),
        .Q(acc2_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1_n_4 ),
        .Q(acc2_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[16] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1_n_7 ),
        .Q(acc2_reg[16]),
        .R(1'b0));
  CARRY4 \acc2_reg[16]_i_1 
       (.CI(\acc2_reg[12]_i_1_n_0 ),
        .CO({\acc2_reg[16]_i_1_n_0 ,\acc2_reg[16]_i_1_n_1 ,\acc2_reg[16]_i_1_n_2 ,\acc2_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[19:16]),
        .O({\acc2_reg[16]_i_1_n_4 ,\acc2_reg[16]_i_1_n_5 ,\acc2_reg[16]_i_1_n_6 ,\acc2_reg[16]_i_1_n_7 }),
        .S({\acc2[16]_i_2_n_0 ,\acc2[16]_i_3_n_0 ,\acc2[16]_i_4_n_0 ,\acc2[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[17] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1_n_6 ),
        .Q(acc2_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[18] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1_n_5 ),
        .Q(acc2_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[19] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1_n_4 ),
        .Q(acc2_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1_n_6 ),
        .Q(acc2_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[20] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[20]_i_1_n_7 ),
        .Q(acc2_reg[20]),
        .R(1'b0));
  CARRY4 \acc2_reg[20]_i_1 
       (.CI(\acc2_reg[16]_i_1_n_0 ),
        .CO({\NLW_acc2_reg[20]_i_1_CO_UNCONNECTED [3:1],\acc2_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc1_reg[20]}),
        .O({\NLW_acc2_reg[20]_i_1_O_UNCONNECTED [3:2],\acc2_reg[20]_i_1_n_6 ,\acc2_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,\acc2[20]_i_2_n_0 ,\acc2[20]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[21] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[20]_i_1_n_6 ),
        .Q(acc2_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1_n_5 ),
        .Q(acc2_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1_n_4 ),
        .Q(acc2_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1_n_7 ),
        .Q(acc2_reg[4]),
        .R(1'b0));
  CARRY4 \acc2_reg[4]_i_1 
       (.CI(\acc2_reg[0]_i_1_n_0 ),
        .CO({\acc2_reg[4]_i_1_n_0 ,\acc2_reg[4]_i_1_n_1 ,\acc2_reg[4]_i_1_n_2 ,\acc2_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[7:4]),
        .O({\acc2_reg[4]_i_1_n_4 ,\acc2_reg[4]_i_1_n_5 ,\acc2_reg[4]_i_1_n_6 ,\acc2_reg[4]_i_1_n_7 }),
        .S({\acc2[4]_i_2_n_0 ,\acc2[4]_i_3_n_0 ,\acc2[4]_i_4_n_0 ,\acc2[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1_n_6 ),
        .Q(acc2_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1_n_5 ),
        .Q(acc2_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1_n_4 ),
        .Q(acc2_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1_n_7 ),
        .Q(acc2_reg[8]),
        .R(1'b0));
  CARRY4 \acc2_reg[8]_i_1 
       (.CI(\acc2_reg[4]_i_1_n_0 ),
        .CO({\acc2_reg[8]_i_1_n_0 ,\acc2_reg[8]_i_1_n_1 ,\acc2_reg[8]_i_1_n_2 ,\acc2_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[11:8]),
        .O({\acc2_reg[8]_i_1_n_4 ,\acc2_reg[8]_i_1_n_5 ,\acc2_reg[8]_i_1_n_6 ,\acc2_reg[8]_i_1_n_7 }),
        .S({\acc2[8]_i_2_n_0 ,\acc2[8]_i_3_n_0 ,\acc2[8]_i_4_n_0 ,\acc2[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1_n_6 ),
        .Q(acc2_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_2 
       (.I0(acc2_reg[3]),
        .I1(acc3_reg[3]),
        .O(\acc3[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_3 
       (.I0(acc2_reg[2]),
        .I1(acc3_reg[2]),
        .O(\acc3[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_4 
       (.I0(acc2_reg[1]),
        .I1(acc3_reg[1]),
        .O(\acc3[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_5 
       (.I0(acc2_reg[0]),
        .I1(acc3_reg[0]),
        .O(\acc3[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_2 
       (.I0(acc2_reg[15]),
        .I1(acc3_reg[15]),
        .O(\acc3[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_3 
       (.I0(acc2_reg[14]),
        .I1(acc3_reg[14]),
        .O(\acc3[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_4 
       (.I0(acc2_reg[13]),
        .I1(acc3_reg[13]),
        .O(\acc3[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_5 
       (.I0(acc2_reg[12]),
        .I1(acc3_reg[12]),
        .O(\acc3[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_2 
       (.I0(acc2_reg[19]),
        .I1(acc3_reg[19]),
        .O(\acc3[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_3 
       (.I0(acc2_reg[18]),
        .I1(acc3_reg[18]),
        .O(\acc3[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_4 
       (.I0(acc2_reg[17]),
        .I1(acc3_reg[17]),
        .O(\acc3[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_5 
       (.I0(acc2_reg[16]),
        .I1(acc3_reg[16]),
        .O(\acc3[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[20]_i_2 
       (.I0(acc2_reg[21]),
        .I1(acc3_reg[21]),
        .O(\acc3[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[20]_i_3 
       (.I0(acc2_reg[20]),
        .I1(acc3_reg[20]),
        .O(\acc3[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_2 
       (.I0(acc2_reg[7]),
        .I1(acc3_reg[7]),
        .O(\acc3[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_3 
       (.I0(acc2_reg[6]),
        .I1(acc3_reg[6]),
        .O(\acc3[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_4 
       (.I0(acc2_reg[5]),
        .I1(acc3_reg[5]),
        .O(\acc3[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_5 
       (.I0(acc2_reg[4]),
        .I1(acc3_reg[4]),
        .O(\acc3[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_2 
       (.I0(acc2_reg[11]),
        .I1(acc3_reg[11]),
        .O(\acc3[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_3 
       (.I0(acc2_reg[10]),
        .I1(acc3_reg[10]),
        .O(\acc3[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_4 
       (.I0(acc2_reg[9]),
        .I1(acc3_reg[9]),
        .O(\acc3[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_5 
       (.I0(acc2_reg[8]),
        .I1(acc3_reg[8]),
        .O(\acc3[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[0]),
        .Q(acc3_d2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[10]),
        .Q(acc3_d2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[11]),
        .Q(acc3_d2[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[12]),
        .Q(acc3_d2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[13]),
        .Q(acc3_d2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[14]),
        .Q(acc3_d2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[15]),
        .Q(acc3_d2[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[16]),
        .Q(acc3_d2[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[17]),
        .Q(acc3_d2[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[18]),
        .Q(acc3_d2[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[19]),
        .Q(acc3_d2[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[1]),
        .Q(acc3_d2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[20]),
        .Q(acc3_d2[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[21]),
        .Q(acc3_d2[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[2]),
        .Q(acc3_d2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[3]),
        .Q(acc3_d2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[4]),
        .Q(acc3_d2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[5]),
        .Q(acc3_d2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[6]),
        .Q(acc3_d2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[7]),
        .Q(acc3_d2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[8]),
        .Q(acc3_d2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[9]),
        .Q(acc3_d2[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1_n_7 ),
        .Q(acc3_reg[0]),
        .R(1'b0));
  CARRY4 \acc3_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\acc3_reg[0]_i_1_n_0 ,\acc3_reg[0]_i_1_n_1 ,\acc3_reg[0]_i_1_n_2 ,\acc3_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[3:0]),
        .O({\acc3_reg[0]_i_1_n_4 ,\acc3_reg[0]_i_1_n_5 ,\acc3_reg[0]_i_1_n_6 ,\acc3_reg[0]_i_1_n_7 }),
        .S({\acc3[0]_i_2_n_0 ,\acc3[0]_i_3_n_0 ,\acc3[0]_i_4_n_0 ,\acc3[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1_n_5 ),
        .Q(acc3_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1_n_4 ),
        .Q(acc3_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1_n_7 ),
        .Q(acc3_reg[12]),
        .R(1'b0));
  CARRY4 \acc3_reg[12]_i_1 
       (.CI(\acc3_reg[8]_i_1_n_0 ),
        .CO({\acc3_reg[12]_i_1_n_0 ,\acc3_reg[12]_i_1_n_1 ,\acc3_reg[12]_i_1_n_2 ,\acc3_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[15:12]),
        .O({\acc3_reg[12]_i_1_n_4 ,\acc3_reg[12]_i_1_n_5 ,\acc3_reg[12]_i_1_n_6 ,\acc3_reg[12]_i_1_n_7 }),
        .S({\acc3[12]_i_2_n_0 ,\acc3[12]_i_3_n_0 ,\acc3[12]_i_4_n_0 ,\acc3[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1_n_6 ),
        .Q(acc3_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1_n_5 ),
        .Q(acc3_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1_n_4 ),
        .Q(acc3_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[16] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1_n_7 ),
        .Q(acc3_reg[16]),
        .R(1'b0));
  CARRY4 \acc3_reg[16]_i_1 
       (.CI(\acc3_reg[12]_i_1_n_0 ),
        .CO({\acc3_reg[16]_i_1_n_0 ,\acc3_reg[16]_i_1_n_1 ,\acc3_reg[16]_i_1_n_2 ,\acc3_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[19:16]),
        .O({\acc3_reg[16]_i_1_n_4 ,\acc3_reg[16]_i_1_n_5 ,\acc3_reg[16]_i_1_n_6 ,\acc3_reg[16]_i_1_n_7 }),
        .S({\acc3[16]_i_2_n_0 ,\acc3[16]_i_3_n_0 ,\acc3[16]_i_4_n_0 ,\acc3[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[17] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1_n_6 ),
        .Q(acc3_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[18] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1_n_5 ),
        .Q(acc3_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[19] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1_n_4 ),
        .Q(acc3_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1_n_6 ),
        .Q(acc3_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[20] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[20]_i_1_n_7 ),
        .Q(acc3_reg[20]),
        .R(1'b0));
  CARRY4 \acc3_reg[20]_i_1 
       (.CI(\acc3_reg[16]_i_1_n_0 ),
        .CO({\NLW_acc3_reg[20]_i_1_CO_UNCONNECTED [3:1],\acc3_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc2_reg[20]}),
        .O({\NLW_acc3_reg[20]_i_1_O_UNCONNECTED [3:2],\acc3_reg[20]_i_1_n_6 ,\acc3_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,\acc3[20]_i_2_n_0 ,\acc3[20]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[21] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[20]_i_1_n_6 ),
        .Q(acc3_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1_n_5 ),
        .Q(acc3_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1_n_4 ),
        .Q(acc3_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1_n_7 ),
        .Q(acc3_reg[4]),
        .R(1'b0));
  CARRY4 \acc3_reg[4]_i_1 
       (.CI(\acc3_reg[0]_i_1_n_0 ),
        .CO({\acc3_reg[4]_i_1_n_0 ,\acc3_reg[4]_i_1_n_1 ,\acc3_reg[4]_i_1_n_2 ,\acc3_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[7:4]),
        .O({\acc3_reg[4]_i_1_n_4 ,\acc3_reg[4]_i_1_n_5 ,\acc3_reg[4]_i_1_n_6 ,\acc3_reg[4]_i_1_n_7 }),
        .S({\acc3[4]_i_2_n_0 ,\acc3[4]_i_3_n_0 ,\acc3[4]_i_4_n_0 ,\acc3[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1_n_6 ),
        .Q(acc3_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1_n_5 ),
        .Q(acc3_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1_n_4 ),
        .Q(acc3_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1_n_7 ),
        .Q(acc3_reg[8]),
        .R(1'b0));
  CARRY4 \acc3_reg[8]_i_1 
       (.CI(\acc3_reg[4]_i_1_n_0 ),
        .CO({\acc3_reg[8]_i_1_n_0 ,\acc3_reg[8]_i_1_n_1 ,\acc3_reg[8]_i_1_n_2 ,\acc3_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[11:8]),
        .O({\acc3_reg[8]_i_1_n_4 ,\acc3_reg[8]_i_1_n_5 ,\acc3_reg[8]_i_1_n_6 ,\acc3_reg[8]_i_1_n_7 }),
        .S({\acc3[8]_i_2_n_0 ,\acc3[8]_i_3_n_0 ,\acc3[8]_i_4_n_0 ,\acc3[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1_n_6 ),
        .Q(acc3_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_2 
       (.I0(acc3_reg[11]),
        .I1(acc3_d2[11]),
        .O(\diff1[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_3 
       (.I0(acc3_reg[10]),
        .I1(acc3_d2[10]),
        .O(\diff1[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_4 
       (.I0(acc3_reg[9]),
        .I1(acc3_d2[9]),
        .O(\diff1[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_5 
       (.I0(acc3_reg[8]),
        .I1(acc3_d2[8]),
        .O(\diff1[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_2 
       (.I0(acc3_reg[15]),
        .I1(acc3_d2[15]),
        .O(\diff1[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_3 
       (.I0(acc3_reg[14]),
        .I1(acc3_d2[14]),
        .O(\diff1[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_4 
       (.I0(acc3_reg[13]),
        .I1(acc3_d2[13]),
        .O(\diff1[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_5 
       (.I0(acc3_reg[12]),
        .I1(acc3_d2[12]),
        .O(\diff1[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_2 
       (.I0(acc3_reg[19]),
        .I1(acc3_d2[19]),
        .O(\diff1[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_3 
       (.I0(acc3_reg[18]),
        .I1(acc3_d2[18]),
        .O(\diff1[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_4 
       (.I0(acc3_reg[17]),
        .I1(acc3_d2[17]),
        .O(\diff1[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_5 
       (.I0(acc3_reg[16]),
        .I1(acc3_d2[16]),
        .O(\diff1[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[21]_i_2 
       (.I0(acc3_reg[21]),
        .I1(acc3_d2[21]),
        .O(\diff1[21]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[21]_i_3 
       (.I0(acc3_reg[20]),
        .I1(acc3_d2[20]),
        .O(\diff1[21]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_2 
       (.I0(acc3_reg[3]),
        .I1(acc3_d2[3]),
        .O(\diff1[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_3 
       (.I0(acc3_reg[2]),
        .I1(acc3_d2[2]),
        .O(\diff1[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_4 
       (.I0(acc3_reg[1]),
        .I1(acc3_d2[1]),
        .O(\diff1[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_5 
       (.I0(acc3_reg[0]),
        .I1(acc3_d2[0]),
        .O(\diff1[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_2 
       (.I0(acc3_reg[7]),
        .I1(acc3_d2[7]),
        .O(\diff1[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_3 
       (.I0(acc3_reg[6]),
        .I1(acc3_d2[6]),
        .O(\diff1[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_4 
       (.I0(acc3_reg[5]),
        .I1(acc3_d2[5]),
        .O(\diff1[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_5 
       (.I0(acc3_reg[4]),
        .I1(acc3_d2[4]),
        .O(\diff1[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[0]),
        .Q(diff1_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[10]),
        .Q(diff1_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[11]),
        .Q(diff1_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[12]),
        .Q(diff1_d[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[13]),
        .Q(diff1_d[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[14]),
        .Q(diff1_d[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[15]),
        .Q(diff1_d[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[16]),
        .Q(diff1_d[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[17]),
        .Q(diff1_d[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[18]),
        .Q(diff1_d[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[19]),
        .Q(diff1_d[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[1]),
        .Q(diff1_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[20]),
        .Q(diff1_d[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[21]),
        .Q(diff1_d[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[2]),
        .Q(diff1_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[3]),
        .Q(diff1_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[4]),
        .Q(diff1_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[5]),
        .Q(diff1_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[6]),
        .Q(diff1_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[7]),
        .Q(diff1_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[8]),
        .Q(diff1_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[9]),
        .Q(diff1_d[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[0]),
        .Q(diff1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[10]),
        .Q(diff1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[11]),
        .Q(diff1[11]),
        .R(1'b0));
  CARRY4 \diff1_reg[11]_i_1 
       (.CI(\diff1_reg[7]_i_1_n_0 ),
        .CO({\diff1_reg[11]_i_1_n_0 ,\diff1_reg[11]_i_1_n_1 ,\diff1_reg[11]_i_1_n_2 ,\diff1_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[11:8]),
        .O(diff102_out[11:8]),
        .S({\diff1[11]_i_2_n_0 ,\diff1[11]_i_3_n_0 ,\diff1[11]_i_4_n_0 ,\diff1[11]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[12]),
        .Q(diff1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[13]),
        .Q(diff1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[14]),
        .Q(diff1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[15]),
        .Q(diff1[15]),
        .R(1'b0));
  CARRY4 \diff1_reg[15]_i_1 
       (.CI(\diff1_reg[11]_i_1_n_0 ),
        .CO({\diff1_reg[15]_i_1_n_0 ,\diff1_reg[15]_i_1_n_1 ,\diff1_reg[15]_i_1_n_2 ,\diff1_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[15:12]),
        .O(diff102_out[15:12]),
        .S({\diff1[15]_i_2_n_0 ,\diff1[15]_i_3_n_0 ,\diff1[15]_i_4_n_0 ,\diff1[15]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[16]),
        .Q(diff1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[17]),
        .Q(diff1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[18]),
        .Q(diff1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[19]),
        .Q(diff1[19]),
        .R(1'b0));
  CARRY4 \diff1_reg[19]_i_1 
       (.CI(\diff1_reg[15]_i_1_n_0 ),
        .CO({\diff1_reg[19]_i_1_n_0 ,\diff1_reg[19]_i_1_n_1 ,\diff1_reg[19]_i_1_n_2 ,\diff1_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[19:16]),
        .O(diff102_out[19:16]),
        .S({\diff1[19]_i_2_n_0 ,\diff1[19]_i_3_n_0 ,\diff1[19]_i_4_n_0 ,\diff1[19]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[1]),
        .Q(diff1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[20]),
        .Q(diff1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[21]),
        .Q(diff1[21]),
        .R(1'b0));
  CARRY4 \diff1_reg[21]_i_1 
       (.CI(\diff1_reg[19]_i_1_n_0 ),
        .CO({\NLW_diff1_reg[21]_i_1_CO_UNCONNECTED [3:1],\diff1_reg[21]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc3_reg[20]}),
        .O({\NLW_diff1_reg[21]_i_1_O_UNCONNECTED [3:2],diff102_out[21:20]}),
        .S({1'b0,1'b0,\diff1[21]_i_2_n_0 ,\diff1[21]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[2]),
        .Q(diff1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[3]),
        .Q(diff1[3]),
        .R(1'b0));
  CARRY4 \diff1_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\diff1_reg[3]_i_1_n_0 ,\diff1_reg[3]_i_1_n_1 ,\diff1_reg[3]_i_1_n_2 ,\diff1_reg[3]_i_1_n_3 }),
        .CYINIT(1'b1),
        .DI(acc3_reg[3:0]),
        .O(diff102_out[3:0]),
        .S({\diff1[3]_i_2_n_0 ,\diff1[3]_i_3_n_0 ,\diff1[3]_i_4_n_0 ,\diff1[3]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[4]),
        .Q(diff1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[5]),
        .Q(diff1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[6]),
        .Q(diff1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[7]),
        .Q(diff1[7]),
        .R(1'b0));
  CARRY4 \diff1_reg[7]_i_1 
       (.CI(\diff1_reg[3]_i_1_n_0 ),
        .CO({\diff1_reg[7]_i_1_n_0 ,\diff1_reg[7]_i_1_n_1 ,\diff1_reg[7]_i_1_n_2 ,\diff1_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[7:4]),
        .O(diff102_out[7:4]),
        .S({\diff1[7]_i_2_n_0 ,\diff1[7]_i_3_n_0 ,\diff1[7]_i_4_n_0 ,\diff1[7]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[8]),
        .Q(diff1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[9]),
        .Q(diff1[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_2 
       (.I0(diff1[11]),
        .I1(diff1_d[11]),
        .O(\diff2[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_3 
       (.I0(diff1[10]),
        .I1(diff1_d[10]),
        .O(\diff2[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_4 
       (.I0(diff1[9]),
        .I1(diff1_d[9]),
        .O(\diff2[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_5 
       (.I0(diff1[8]),
        .I1(diff1_d[8]),
        .O(\diff2[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_2 
       (.I0(diff1[15]),
        .I1(diff1_d[15]),
        .O(\diff2[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_3 
       (.I0(diff1[14]),
        .I1(diff1_d[14]),
        .O(\diff2[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_4 
       (.I0(diff1[13]),
        .I1(diff1_d[13]),
        .O(\diff2[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_5 
       (.I0(diff1[12]),
        .I1(diff1_d[12]),
        .O(\diff2[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_2 
       (.I0(diff1[19]),
        .I1(diff1_d[19]),
        .O(\diff2[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_3 
       (.I0(diff1[18]),
        .I1(diff1_d[18]),
        .O(\diff2[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_4 
       (.I0(diff1[17]),
        .I1(diff1_d[17]),
        .O(\diff2[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_5 
       (.I0(diff1[16]),
        .I1(diff1_d[16]),
        .O(\diff2[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[21]_i_2 
       (.I0(diff1[21]),
        .I1(diff1_d[21]),
        .O(\diff2[21]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[21]_i_3 
       (.I0(diff1[20]),
        .I1(diff1_d[20]),
        .O(\diff2[21]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_2 
       (.I0(diff1[3]),
        .I1(diff1_d[3]),
        .O(\diff2[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_3 
       (.I0(diff1[2]),
        .I1(diff1_d[2]),
        .O(\diff2[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_4 
       (.I0(diff1[1]),
        .I1(diff1_d[1]),
        .O(\diff2[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_5 
       (.I0(diff1[0]),
        .I1(diff1_d[0]),
        .O(\diff2[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_2 
       (.I0(diff1[7]),
        .I1(diff1_d[7]),
        .O(\diff2[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_3 
       (.I0(diff1[6]),
        .I1(diff1_d[6]),
        .O(\diff2[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_4 
       (.I0(diff1[5]),
        .I1(diff1_d[5]),
        .O(\diff2[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_5 
       (.I0(diff1[4]),
        .I1(diff1_d[4]),
        .O(\diff2[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[0]),
        .Q(diff2_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[10]),
        .Q(diff2_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[11]),
        .Q(diff2_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[12]),
        .Q(diff2_d[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[13]),
        .Q(diff2_d[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[14]),
        .Q(diff2_d[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[15]),
        .Q(diff2_d[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[16]),
        .Q(diff2_d[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[17]),
        .Q(diff2_d[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[18]),
        .Q(diff2_d[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[19]),
        .Q(diff2_d[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[1]),
        .Q(diff2_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[20]),
        .Q(diff2_d[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[21]),
        .Q(diff2_d[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[2]),
        .Q(diff2_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[3]),
        .Q(diff2_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[4]),
        .Q(diff2_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[5]),
        .Q(diff2_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[6]),
        .Q(diff2_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[7]),
        .Q(diff2_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[8]),
        .Q(diff2_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[9]),
        .Q(diff2_d[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[0]),
        .Q(diff2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[10]),
        .Q(diff2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[11]),
        .Q(diff2[11]),
        .R(1'b0));
  CARRY4 \diff2_reg[11]_i_1 
       (.CI(\diff2_reg[7]_i_1_n_0 ),
        .CO({\diff2_reg[11]_i_1_n_0 ,\diff2_reg[11]_i_1_n_1 ,\diff2_reg[11]_i_1_n_2 ,\diff2_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[11:8]),
        .O(diff201_out[11:8]),
        .S({\diff2[11]_i_2_n_0 ,\diff2[11]_i_3_n_0 ,\diff2[11]_i_4_n_0 ,\diff2[11]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[12]),
        .Q(diff2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[13]),
        .Q(diff2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[14]),
        .Q(diff2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[15]),
        .Q(diff2[15]),
        .R(1'b0));
  CARRY4 \diff2_reg[15]_i_1 
       (.CI(\diff2_reg[11]_i_1_n_0 ),
        .CO({\diff2_reg[15]_i_1_n_0 ,\diff2_reg[15]_i_1_n_1 ,\diff2_reg[15]_i_1_n_2 ,\diff2_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[15:12]),
        .O(diff201_out[15:12]),
        .S({\diff2[15]_i_2_n_0 ,\diff2[15]_i_3_n_0 ,\diff2[15]_i_4_n_0 ,\diff2[15]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[16]),
        .Q(diff2[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[17]),
        .Q(diff2[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[18]),
        .Q(diff2[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[19]),
        .Q(diff2[19]),
        .R(1'b0));
  CARRY4 \diff2_reg[19]_i_1 
       (.CI(\diff2_reg[15]_i_1_n_0 ),
        .CO({\diff2_reg[19]_i_1_n_0 ,\diff2_reg[19]_i_1_n_1 ,\diff2_reg[19]_i_1_n_2 ,\diff2_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[19:16]),
        .O(diff201_out[19:16]),
        .S({\diff2[19]_i_2_n_0 ,\diff2[19]_i_3_n_0 ,\diff2[19]_i_4_n_0 ,\diff2[19]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[1]),
        .Q(diff2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[20]),
        .Q(diff2[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[21]),
        .Q(diff2[21]),
        .R(1'b0));
  CARRY4 \diff2_reg[21]_i_1 
       (.CI(\diff2_reg[19]_i_1_n_0 ),
        .CO({\NLW_diff2_reg[21]_i_1_CO_UNCONNECTED [3:1],\diff2_reg[21]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,diff1[20]}),
        .O({\NLW_diff2_reg[21]_i_1_O_UNCONNECTED [3:2],diff201_out[21:20]}),
        .S({1'b0,1'b0,\diff2[21]_i_2_n_0 ,\diff2[21]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[2]),
        .Q(diff2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[3]),
        .Q(diff2[3]),
        .R(1'b0));
  CARRY4 \diff2_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\diff2_reg[3]_i_1_n_0 ,\diff2_reg[3]_i_1_n_1 ,\diff2_reg[3]_i_1_n_2 ,\diff2_reg[3]_i_1_n_3 }),
        .CYINIT(1'b1),
        .DI(diff1[3:0]),
        .O(diff201_out[3:0]),
        .S({\diff2[3]_i_2_n_0 ,\diff2[3]_i_3_n_0 ,\diff2[3]_i_4_n_0 ,\diff2[3]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[4]),
        .Q(diff2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[5]),
        .Q(diff2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[6]),
        .Q(diff2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[7]),
        .Q(diff2[7]),
        .R(1'b0));
  CARRY4 \diff2_reg[7]_i_1 
       (.CI(\diff2_reg[3]_i_1_n_0 ),
        .CO({\diff2_reg[7]_i_1_n_0 ,\diff2_reg[7]_i_1_n_1 ,\diff2_reg[7]_i_1_n_2 ,\diff2_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[7:4]),
        .O(diff201_out[7:4]),
        .S({\diff2[7]_i_2_n_0 ,\diff2[7]_i_3_n_0 ,\diff2[7]_i_4_n_0 ,\diff2[7]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[8]),
        .Q(diff2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[9]),
        .Q(diff2[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_2 
       (.I0(diff2[11]),
        .I1(diff2_d[11]),
        .O(\diff3[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_3 
       (.I0(diff2[10]),
        .I1(diff2_d[10]),
        .O(\diff3[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_4 
       (.I0(diff2[9]),
        .I1(diff2_d[9]),
        .O(\diff3[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_5 
       (.I0(diff2[8]),
        .I1(diff2_d[8]),
        .O(\diff3[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_2 
       (.I0(diff2[15]),
        .I1(diff2_d[15]),
        .O(\diff3[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_3 
       (.I0(diff2[14]),
        .I1(diff2_d[14]),
        .O(\diff3[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_4 
       (.I0(diff2[13]),
        .I1(diff2_d[13]),
        .O(\diff3[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_5 
       (.I0(diff2[12]),
        .I1(diff2_d[12]),
        .O(\diff3[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_2 
       (.I0(diff2[19]),
        .I1(diff2_d[19]),
        .O(\diff3[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_3 
       (.I0(diff2[18]),
        .I1(diff2_d[18]),
        .O(\diff3[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_4 
       (.I0(diff2[17]),
        .I1(diff2_d[17]),
        .O(\diff3[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_5 
       (.I0(diff2[16]),
        .I1(diff2_d[16]),
        .O(\diff3[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[21]_i_2 
       (.I0(diff2[21]),
        .I1(diff2_d[21]),
        .O(\diff3[21]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[21]_i_3 
       (.I0(diff2[20]),
        .I1(diff2_d[20]),
        .O(\diff3[21]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_10 
       (.I0(diff2[0]),
        .I1(diff2_d[0]),
        .O(\diff3[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_3 
       (.I0(diff2[7]),
        .I1(diff2_d[7]),
        .O(\diff3[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_4 
       (.I0(diff2[6]),
        .I1(diff2_d[6]),
        .O(\diff3[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_5 
       (.I0(diff2[5]),
        .I1(diff2_d[5]),
        .O(\diff3[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_6 
       (.I0(diff2[4]),
        .I1(diff2_d[4]),
        .O(\diff3[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_7 
       (.I0(diff2[3]),
        .I1(diff2_d[3]),
        .O(\diff3[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_8 
       (.I0(diff2[2]),
        .I1(diff2_d[2]),
        .O(\diff3[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_9 
       (.I0(diff2[1]),
        .I1(diff2_d[1]),
        .O(\diff3[7]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[10]),
        .Q(data0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[11]),
        .Q(data0[3]),
        .R(1'b0));
  CARRY4 \diff3_reg[11]_i_1 
       (.CI(\diff3_reg[7]_i_1_n_0 ),
        .CO({\diff3_reg[11]_i_1_n_0 ,\diff3_reg[11]_i_1_n_1 ,\diff3_reg[11]_i_1_n_2 ,\diff3_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[11:8]),
        .O(diff300_out[11:8]),
        .S({\diff3[11]_i_2_n_0 ,\diff3[11]_i_3_n_0 ,\diff3[11]_i_4_n_0 ,\diff3[11]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[12]),
        .Q(data0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[13]),
        .Q(data0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[14]),
        .Q(data0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[15]),
        .Q(data0[7]),
        .R(1'b0));
  CARRY4 \diff3_reg[15]_i_1 
       (.CI(\diff3_reg[11]_i_1_n_0 ),
        .CO({\diff3_reg[15]_i_1_n_0 ,\diff3_reg[15]_i_1_n_1 ,\diff3_reg[15]_i_1_n_2 ,\diff3_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[15:12]),
        .O(diff300_out[15:12]),
        .S({\diff3[15]_i_2_n_0 ,\diff3[15]_i_3_n_0 ,\diff3[15]_i_4_n_0 ,\diff3[15]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[16]),
        .Q(data0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[17]),
        .Q(data0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[18]),
        .Q(data0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[19]),
        .Q(data0[11]),
        .R(1'b0));
  CARRY4 \diff3_reg[19]_i_1 
       (.CI(\diff3_reg[15]_i_1_n_0 ),
        .CO({\diff3_reg[19]_i_1_n_0 ,\diff3_reg[19]_i_1_n_1 ,\diff3_reg[19]_i_1_n_2 ,\diff3_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[19:16]),
        .O(diff300_out[19:16]),
        .S({\diff3[19]_i_2_n_0 ,\diff3[19]_i_3_n_0 ,\diff3[19]_i_4_n_0 ,\diff3[19]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[20]),
        .Q(data0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[21]),
        .Q(data0[13]),
        .R(1'b0));
  CARRY4 \diff3_reg[21]_i_1 
       (.CI(\diff3_reg[19]_i_1_n_0 ),
        .CO({\NLW_diff3_reg[21]_i_1_CO_UNCONNECTED [3:1],\diff3_reg[21]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,diff2[20]}),
        .O({\NLW_diff3_reg[21]_i_1_O_UNCONNECTED [3:2],diff300_out[21:20]}),
        .S({1'b0,1'b0,\diff3[21]_i_2_n_0 ,\diff3[21]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[5]),
        .Q(\diff3_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[6]),
        .Q(\diff3_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[7]),
        .Q(\diff3_reg_n_0_[7] ),
        .R(1'b0));
  CARRY4 \diff3_reg[7]_i_1 
       (.CI(\diff3_reg[7]_i_2_n_0 ),
        .CO({\diff3_reg[7]_i_1_n_0 ,\diff3_reg[7]_i_1_n_1 ,\diff3_reg[7]_i_1_n_2 ,\diff3_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[7:4]),
        .O({diff300_out[7:5],\NLW_diff3_reg[7]_i_1_O_UNCONNECTED [0]}),
        .S({\diff3[7]_i_3_n_0 ,\diff3[7]_i_4_n_0 ,\diff3[7]_i_5_n_0 ,\diff3[7]_i_6_n_0 }));
  CARRY4 \diff3_reg[7]_i_2 
       (.CI(1'b0),
        .CO({\diff3_reg[7]_i_2_n_0 ,\diff3_reg[7]_i_2_n_1 ,\diff3_reg[7]_i_2_n_2 ,\diff3_reg[7]_i_2_n_3 }),
        .CYINIT(1'b1),
        .DI(diff2[3:0]),
        .O(\NLW_diff3_reg[7]_i_2_O_UNCONNECTED [3:0]),
        .S({\diff3[7]_i_7_n_0 ,\diff3[7]_i_8_n_0 ,\diff3[7]_i_9_n_0 ,\diff3[7]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[8]),
        .Q(data0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[9]),
        .Q(data0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mdat_i_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(din),
        .Q(mdat_i),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \signed_gen[0].ch_s_data[0][15]_i_1 
       (.I0(\ch_data[0]_0 ),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    \tdata[0]_i_1 
       (.I0(\diff3_reg_n_0_[5] ),
        .I1(\tdata[0]_i_2_n_0 ),
        .I2(\tdata[0]_i_3_n_0 ),
        .I3(\tdata[0]_i_4_n_0 ),
        .I4(\tdata[0]_i_5_n_0 ),
        .O(p_1_in));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \tdata[0]_i_2 
       (.I0(data0[11]),
        .I1(data0[10]),
        .I2(data0[13]),
        .I3(data0[12]),
        .O(\tdata[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tdata[0]_i_3 
       (.I0(data0[1]),
        .I1(\diff3_reg_n_0_[6] ),
        .I2(data0[3]),
        .I3(data0[4]),
        .O(\tdata[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \tdata[0]_i_4 
       (.I0(data0[9]),
        .I1(data0[6]),
        .I2(data0[8]),
        .I3(data0[7]),
        .O(\tdata[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tdata[0]_i_5 
       (.I0(data0[0]),
        .I1(\diff3_reg_n_0_[7] ),
        .I2(data0[2]),
        .I3(data0[5]),
        .O(\tdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \tdata[15]_i_1 
       (.I0(\diff3_reg_n_0_[5] ),
        .I1(\tdata[0]_i_5_n_0 ),
        .I2(\tdata[0]_i_4_n_0 ),
        .I3(\tdata[0]_i_3_n_0 ),
        .I4(\tdata[0]_i_2_n_0 ),
        .I5(word_clk),
        .O(\tdata[15]_i_1_n_0 ));
  FDRE \tdata_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(p_1_in),
        .Q(D[0]),
        .R(1'b0));
  FDSE \tdata_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[7]),
        .Q(D[10]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[8]),
        .Q(D[11]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[9]),
        .Q(D[12]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[10]),
        .Q(D[13]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[11]),
        .Q(D[14]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[12]),
        .Q(\ch_data[0]_0 ),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(\diff3_reg_n_0_[6] ),
        .Q(D[1]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(\diff3_reg_n_0_[7] ),
        .Q(D[2]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[0]),
        .Q(D[3]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[1]),
        .Q(D[4]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[2]),
        .Q(D[5]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[3]),
        .Q(D[6]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[4]),
        .Q(D[7]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[5]),
        .Q(D[8]),
        .S(\tdata[15]_i_1_n_0 ));
  FDSE \tdata_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[6]),
        .Q(D[9]),
        .S(\tdata[15]_i_1_n_0 ));
  FDRE tvalid_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(word_clk),
        .Q(update),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    word_clk_i_3
       (.I0(word_count_reg[15]),
        .O(word_clk_i_3_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_4
       (.I0(word_count_reg[13]),
        .I1(word_count_reg[14]),
        .I2(word_count_reg[12]),
        .O(word_clk_i_4_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_5
       (.I0(word_count_reg[10]),
        .I1(word_count_reg[11]),
        .I2(word_count_reg[9]),
        .O(word_clk_i_5_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_6
       (.I0(word_count_reg[6]),
        .I1(word_count_reg[7]),
        .I2(word_count_reg[8]),
        .O(word_clk_i_6_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    word_clk_i_7
       (.I0(word_count_reg[3]),
        .I1(word_count_reg[4]),
        .I2(word_count_reg[5]),
        .O(word_clk_i_7_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    word_clk_i_8
       (.I0(word_count_reg[1]),
        .I1(word_count_reg[2]),
        .I2(word_count_reg[0]),
        .O(word_clk_i_8_n_0));
  FDRE #(
    .INIT(1'b0)) 
    word_clk_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(word_clk0),
        .Q(word_clk),
        .R(1'b0));
  CARRY4 word_clk_reg_i_1
       (.CI(word_clk_reg_i_2_n_0),
        .CO({NLW_word_clk_reg_i_1_CO_UNCONNECTED[3:2],word_clk0,word_clk_reg_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_word_clk_reg_i_1_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,word_clk_i_3_n_0,word_clk_i_4_n_0}));
  CARRY4 word_clk_reg_i_2
       (.CI(1'b0),
        .CO({word_clk_reg_i_2_n_0,word_clk_reg_i_2_n_1,word_clk_reg_i_2_n_2,word_clk_reg_i_2_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_word_clk_reg_i_2_O_UNCONNECTED[3:0]),
        .S({word_clk_i_5_n_0,word_clk_i_6_n_0,word_clk_i_7_n_0,word_clk_i_8_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    \word_count[0]_i_10 
       (.I0(word_count_reg[10]),
        .I1(word_count_reg[11]),
        .I2(word_count_reg[9]),
        .O(\word_count[0]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \word_count[0]_i_11 
       (.I0(word_count_reg[6]),
        .I1(word_count_reg[7]),
        .I2(word_count_reg[8]),
        .O(\word_count[0]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \word_count[0]_i_12 
       (.I0(word_count_reg[3]),
        .I1(word_count_reg[4]),
        .I2(word_count_reg[5]),
        .O(\word_count[0]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \word_count[0]_i_13 
       (.I0(word_count_reg[1]),
        .I1(word_count_reg[2]),
        .I2(word_count_reg[0]),
        .O(\word_count[0]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \word_count[0]_i_4 
       (.I0(word_count_reg[15]),
        .O(\word_count[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \word_count[0]_i_5 
       (.I0(word_count_reg[13]),
        .I1(word_count_reg[14]),
        .I2(word_count_reg[12]),
        .O(\word_count[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_6 
       (.I0(word_count_reg[3]),
        .O(\word_count[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_7 
       (.I0(word_count_reg[2]),
        .O(\word_count[0]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_8 
       (.I0(word_count_reg[1]),
        .O(\word_count[0]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \word_count[0]_i_9 
       (.I0(word_count_reg[0]),
        .O(\word_count[0]_i_9_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_2 
       (.I0(word_count_reg[15]),
        .O(\word_count[12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_3 
       (.I0(word_count_reg[14]),
        .O(\word_count[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_4 
       (.I0(word_count_reg[13]),
        .O(\word_count[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_5 
       (.I0(word_count_reg[12]),
        .O(\word_count[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_2 
       (.I0(word_count_reg[7]),
        .O(\word_count[4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_3 
       (.I0(word_count_reg[6]),
        .O(\word_count[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_4 
       (.I0(word_count_reg[5]),
        .O(\word_count[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_5 
       (.I0(word_count_reg[4]),
        .O(\word_count[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_2 
       (.I0(word_count_reg[11]),
        .O(\word_count[8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_3 
       (.I0(word_count_reg[10]),
        .O(\word_count[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_4 
       (.I0(word_count_reg[9]),
        .O(\word_count[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_5 
       (.I0(word_count_reg[8]),
        .O(\word_count[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2_n_7 ),
        .Q(word_count_reg[0]),
        .R(word_count0));
  CARRY4 \word_count_reg[0]_i_1 
       (.CI(\word_count_reg[0]_i_3_n_0 ),
        .CO({\NLW_word_count_reg[0]_i_1_CO_UNCONNECTED [3:2],word_count0,\word_count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_word_count_reg[0]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,\word_count[0]_i_4_n_0 ,\word_count[0]_i_5_n_0 }));
  CARRY4 \word_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\word_count_reg[0]_i_2_n_0 ,\word_count_reg[0]_i_2_n_1 ,\word_count_reg[0]_i_2_n_2 ,\word_count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\word_count_reg[0]_i_2_n_4 ,\word_count_reg[0]_i_2_n_5 ,\word_count_reg[0]_i_2_n_6 ,\word_count_reg[0]_i_2_n_7 }),
        .S({\word_count[0]_i_6_n_0 ,\word_count[0]_i_7_n_0 ,\word_count[0]_i_8_n_0 ,\word_count[0]_i_9_n_0 }));
  CARRY4 \word_count_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\word_count_reg[0]_i_3_n_0 ,\word_count_reg[0]_i_3_n_1 ,\word_count_reg[0]_i_3_n_2 ,\word_count_reg[0]_i_3_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_word_count_reg[0]_i_3_O_UNCONNECTED [3:0]),
        .S({\word_count[0]_i_10_n_0 ,\word_count[0]_i_11_n_0 ,\word_count[0]_i_12_n_0 ,\word_count[0]_i_13_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1_n_5 ),
        .Q(word_count_reg[10]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1_n_4 ),
        .Q(word_count_reg[11]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1_n_7 ),
        .Q(word_count_reg[12]),
        .R(word_count0));
  CARRY4 \word_count_reg[12]_i_1 
       (.CI(\word_count_reg[8]_i_1_n_0 ),
        .CO({\NLW_word_count_reg[12]_i_1_CO_UNCONNECTED [3],\word_count_reg[12]_i_1_n_1 ,\word_count_reg[12]_i_1_n_2 ,\word_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[12]_i_1_n_4 ,\word_count_reg[12]_i_1_n_5 ,\word_count_reg[12]_i_1_n_6 ,\word_count_reg[12]_i_1_n_7 }),
        .S({\word_count[12]_i_2_n_0 ,\word_count[12]_i_3_n_0 ,\word_count[12]_i_4_n_0 ,\word_count[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1_n_6 ),
        .Q(word_count_reg[13]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1_n_5 ),
        .Q(word_count_reg[14]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1_n_4 ),
        .Q(word_count_reg[15]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2_n_6 ),
        .Q(word_count_reg[1]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2_n_5 ),
        .Q(word_count_reg[2]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2_n_4 ),
        .Q(word_count_reg[3]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1_n_7 ),
        .Q(word_count_reg[4]),
        .R(word_count0));
  CARRY4 \word_count_reg[4]_i_1 
       (.CI(\word_count_reg[0]_i_2_n_0 ),
        .CO({\word_count_reg[4]_i_1_n_0 ,\word_count_reg[4]_i_1_n_1 ,\word_count_reg[4]_i_1_n_2 ,\word_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[4]_i_1_n_4 ,\word_count_reg[4]_i_1_n_5 ,\word_count_reg[4]_i_1_n_6 ,\word_count_reg[4]_i_1_n_7 }),
        .S({\word_count[4]_i_2_n_0 ,\word_count[4]_i_3_n_0 ,\word_count[4]_i_4_n_0 ,\word_count[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1_n_6 ),
        .Q(word_count_reg[5]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1_n_5 ),
        .Q(word_count_reg[6]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1_n_4 ),
        .Q(word_count_reg[7]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1_n_7 ),
        .Q(word_count_reg[8]),
        .R(word_count0));
  CARRY4 \word_count_reg[8]_i_1 
       (.CI(\word_count_reg[4]_i_1_n_0 ),
        .CO({\word_count_reg[8]_i_1_n_0 ,\word_count_reg[8]_i_1_n_1 ,\word_count_reg[8]_i_1_n_2 ,\word_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[8]_i_1_n_4 ,\word_count_reg[8]_i_1_n_5 ,\word_count_reg[8]_i_1_n_6 ,\word_count_reg[8]_i_1_n_7 }),
        .S({\word_count[8]_i_2_n_0 ,\word_count[8]_i_3_n_0 ,\word_count[8]_i_4_n_0 ,\word_count[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1_n_6 ),
        .Q(word_count_reg[9]),
        .R(word_count0));
endmodule

(* ORIG_REF_NAME = "sinc3" *) 
module zsys_axis_AD7403_0_0_sinc3_0
   (D,
    din,
    m_axis_aclk);
  output [15:0]D;
  input [0:0]din;
  input m_axis_aclk;

  wire [15:0]D;
  wire \acc1[0]_i_2__0_n_0 ;
  wire \acc1[0]_i_3__0_n_0 ;
  wire \acc1[0]_i_4__0_n_0 ;
  wire \acc1[0]_i_5__0_n_0 ;
  wire \acc1[12]_i_2__0_n_0 ;
  wire \acc1[12]_i_3__0_n_0 ;
  wire \acc1[12]_i_4__0_n_0 ;
  wire \acc1[12]_i_5__0_n_0 ;
  wire \acc1[16]_i_2__0_n_0 ;
  wire \acc1[16]_i_3__0_n_0 ;
  wire \acc1[16]_i_4__0_n_0 ;
  wire \acc1[16]_i_5__0_n_0 ;
  wire \acc1[20]_i_2__0_n_0 ;
  wire \acc1[20]_i_3__0_n_0 ;
  wire \acc1[4]_i_2__0_n_0 ;
  wire \acc1[4]_i_3__0_n_0 ;
  wire \acc1[4]_i_4__0_n_0 ;
  wire \acc1[4]_i_5__0_n_0 ;
  wire \acc1[8]_i_2__0_n_0 ;
  wire \acc1[8]_i_3__0_n_0 ;
  wire \acc1[8]_i_4__0_n_0 ;
  wire \acc1[8]_i_5__0_n_0 ;
  wire [21:0]acc1_reg;
  wire \acc1_reg[0]_i_1__0_n_0 ;
  wire \acc1_reg[0]_i_1__0_n_1 ;
  wire \acc1_reg[0]_i_1__0_n_2 ;
  wire \acc1_reg[0]_i_1__0_n_3 ;
  wire \acc1_reg[0]_i_1__0_n_4 ;
  wire \acc1_reg[0]_i_1__0_n_5 ;
  wire \acc1_reg[0]_i_1__0_n_6 ;
  wire \acc1_reg[0]_i_1__0_n_7 ;
  wire \acc1_reg[12]_i_1__0_n_0 ;
  wire \acc1_reg[12]_i_1__0_n_1 ;
  wire \acc1_reg[12]_i_1__0_n_2 ;
  wire \acc1_reg[12]_i_1__0_n_3 ;
  wire \acc1_reg[12]_i_1__0_n_4 ;
  wire \acc1_reg[12]_i_1__0_n_5 ;
  wire \acc1_reg[12]_i_1__0_n_6 ;
  wire \acc1_reg[12]_i_1__0_n_7 ;
  wire \acc1_reg[16]_i_1__0_n_0 ;
  wire \acc1_reg[16]_i_1__0_n_1 ;
  wire \acc1_reg[16]_i_1__0_n_2 ;
  wire \acc1_reg[16]_i_1__0_n_3 ;
  wire \acc1_reg[16]_i_1__0_n_4 ;
  wire \acc1_reg[16]_i_1__0_n_5 ;
  wire \acc1_reg[16]_i_1__0_n_6 ;
  wire \acc1_reg[16]_i_1__0_n_7 ;
  wire \acc1_reg[20]_i_1__0_n_3 ;
  wire \acc1_reg[20]_i_1__0_n_6 ;
  wire \acc1_reg[20]_i_1__0_n_7 ;
  wire \acc1_reg[4]_i_1__0_n_0 ;
  wire \acc1_reg[4]_i_1__0_n_1 ;
  wire \acc1_reg[4]_i_1__0_n_2 ;
  wire \acc1_reg[4]_i_1__0_n_3 ;
  wire \acc1_reg[4]_i_1__0_n_4 ;
  wire \acc1_reg[4]_i_1__0_n_5 ;
  wire \acc1_reg[4]_i_1__0_n_6 ;
  wire \acc1_reg[4]_i_1__0_n_7 ;
  wire \acc1_reg[8]_i_1__0_n_0 ;
  wire \acc1_reg[8]_i_1__0_n_1 ;
  wire \acc1_reg[8]_i_1__0_n_2 ;
  wire \acc1_reg[8]_i_1__0_n_3 ;
  wire \acc1_reg[8]_i_1__0_n_4 ;
  wire \acc1_reg[8]_i_1__0_n_5 ;
  wire \acc1_reg[8]_i_1__0_n_6 ;
  wire \acc1_reg[8]_i_1__0_n_7 ;
  wire \acc2[0]_i_2__0_n_0 ;
  wire \acc2[0]_i_3__0_n_0 ;
  wire \acc2[0]_i_4__0_n_0 ;
  wire \acc2[0]_i_5__0_n_0 ;
  wire \acc2[12]_i_2__0_n_0 ;
  wire \acc2[12]_i_3__0_n_0 ;
  wire \acc2[12]_i_4__0_n_0 ;
  wire \acc2[12]_i_5__0_n_0 ;
  wire \acc2[16]_i_2__0_n_0 ;
  wire \acc2[16]_i_3__0_n_0 ;
  wire \acc2[16]_i_4__0_n_0 ;
  wire \acc2[16]_i_5__0_n_0 ;
  wire \acc2[20]_i_2__0_n_0 ;
  wire \acc2[20]_i_3__0_n_0 ;
  wire \acc2[4]_i_2__0_n_0 ;
  wire \acc2[4]_i_3__0_n_0 ;
  wire \acc2[4]_i_4__0_n_0 ;
  wire \acc2[4]_i_5__0_n_0 ;
  wire \acc2[8]_i_2__0_n_0 ;
  wire \acc2[8]_i_3__0_n_0 ;
  wire \acc2[8]_i_4__0_n_0 ;
  wire \acc2[8]_i_5__0_n_0 ;
  wire [21:0]acc2_reg;
  wire \acc2_reg[0]_i_1__0_n_0 ;
  wire \acc2_reg[0]_i_1__0_n_1 ;
  wire \acc2_reg[0]_i_1__0_n_2 ;
  wire \acc2_reg[0]_i_1__0_n_3 ;
  wire \acc2_reg[0]_i_1__0_n_4 ;
  wire \acc2_reg[0]_i_1__0_n_5 ;
  wire \acc2_reg[0]_i_1__0_n_6 ;
  wire \acc2_reg[0]_i_1__0_n_7 ;
  wire \acc2_reg[12]_i_1__0_n_0 ;
  wire \acc2_reg[12]_i_1__0_n_1 ;
  wire \acc2_reg[12]_i_1__0_n_2 ;
  wire \acc2_reg[12]_i_1__0_n_3 ;
  wire \acc2_reg[12]_i_1__0_n_4 ;
  wire \acc2_reg[12]_i_1__0_n_5 ;
  wire \acc2_reg[12]_i_1__0_n_6 ;
  wire \acc2_reg[12]_i_1__0_n_7 ;
  wire \acc2_reg[16]_i_1__0_n_0 ;
  wire \acc2_reg[16]_i_1__0_n_1 ;
  wire \acc2_reg[16]_i_1__0_n_2 ;
  wire \acc2_reg[16]_i_1__0_n_3 ;
  wire \acc2_reg[16]_i_1__0_n_4 ;
  wire \acc2_reg[16]_i_1__0_n_5 ;
  wire \acc2_reg[16]_i_1__0_n_6 ;
  wire \acc2_reg[16]_i_1__0_n_7 ;
  wire \acc2_reg[20]_i_1__0_n_3 ;
  wire \acc2_reg[20]_i_1__0_n_6 ;
  wire \acc2_reg[20]_i_1__0_n_7 ;
  wire \acc2_reg[4]_i_1__0_n_0 ;
  wire \acc2_reg[4]_i_1__0_n_1 ;
  wire \acc2_reg[4]_i_1__0_n_2 ;
  wire \acc2_reg[4]_i_1__0_n_3 ;
  wire \acc2_reg[4]_i_1__0_n_4 ;
  wire \acc2_reg[4]_i_1__0_n_5 ;
  wire \acc2_reg[4]_i_1__0_n_6 ;
  wire \acc2_reg[4]_i_1__0_n_7 ;
  wire \acc2_reg[8]_i_1__0_n_0 ;
  wire \acc2_reg[8]_i_1__0_n_1 ;
  wire \acc2_reg[8]_i_1__0_n_2 ;
  wire \acc2_reg[8]_i_1__0_n_3 ;
  wire \acc2_reg[8]_i_1__0_n_4 ;
  wire \acc2_reg[8]_i_1__0_n_5 ;
  wire \acc2_reg[8]_i_1__0_n_6 ;
  wire \acc2_reg[8]_i_1__0_n_7 ;
  wire \acc3[0]_i_2__0_n_0 ;
  wire \acc3[0]_i_3__0_n_0 ;
  wire \acc3[0]_i_4__0_n_0 ;
  wire \acc3[0]_i_5__0_n_0 ;
  wire \acc3[12]_i_2__0_n_0 ;
  wire \acc3[12]_i_3__0_n_0 ;
  wire \acc3[12]_i_4__0_n_0 ;
  wire \acc3[12]_i_5__0_n_0 ;
  wire \acc3[16]_i_2__0_n_0 ;
  wire \acc3[16]_i_3__0_n_0 ;
  wire \acc3[16]_i_4__0_n_0 ;
  wire \acc3[16]_i_5__0_n_0 ;
  wire \acc3[20]_i_2__0_n_0 ;
  wire \acc3[20]_i_3__0_n_0 ;
  wire \acc3[4]_i_2__0_n_0 ;
  wire \acc3[4]_i_3__0_n_0 ;
  wire \acc3[4]_i_4__0_n_0 ;
  wire \acc3[4]_i_5__0_n_0 ;
  wire \acc3[8]_i_2__0_n_0 ;
  wire \acc3[8]_i_3__0_n_0 ;
  wire \acc3[8]_i_4__0_n_0 ;
  wire \acc3[8]_i_5__0_n_0 ;
  wire [21:0]acc3_d2;
  wire [21:0]acc3_reg;
  wire \acc3_reg[0]_i_1__0_n_0 ;
  wire \acc3_reg[0]_i_1__0_n_1 ;
  wire \acc3_reg[0]_i_1__0_n_2 ;
  wire \acc3_reg[0]_i_1__0_n_3 ;
  wire \acc3_reg[0]_i_1__0_n_4 ;
  wire \acc3_reg[0]_i_1__0_n_5 ;
  wire \acc3_reg[0]_i_1__0_n_6 ;
  wire \acc3_reg[0]_i_1__0_n_7 ;
  wire \acc3_reg[12]_i_1__0_n_0 ;
  wire \acc3_reg[12]_i_1__0_n_1 ;
  wire \acc3_reg[12]_i_1__0_n_2 ;
  wire \acc3_reg[12]_i_1__0_n_3 ;
  wire \acc3_reg[12]_i_1__0_n_4 ;
  wire \acc3_reg[12]_i_1__0_n_5 ;
  wire \acc3_reg[12]_i_1__0_n_6 ;
  wire \acc3_reg[12]_i_1__0_n_7 ;
  wire \acc3_reg[16]_i_1__0_n_0 ;
  wire \acc3_reg[16]_i_1__0_n_1 ;
  wire \acc3_reg[16]_i_1__0_n_2 ;
  wire \acc3_reg[16]_i_1__0_n_3 ;
  wire \acc3_reg[16]_i_1__0_n_4 ;
  wire \acc3_reg[16]_i_1__0_n_5 ;
  wire \acc3_reg[16]_i_1__0_n_6 ;
  wire \acc3_reg[16]_i_1__0_n_7 ;
  wire \acc3_reg[20]_i_1__0_n_3 ;
  wire \acc3_reg[20]_i_1__0_n_6 ;
  wire \acc3_reg[20]_i_1__0_n_7 ;
  wire \acc3_reg[4]_i_1__0_n_0 ;
  wire \acc3_reg[4]_i_1__0_n_1 ;
  wire \acc3_reg[4]_i_1__0_n_2 ;
  wire \acc3_reg[4]_i_1__0_n_3 ;
  wire \acc3_reg[4]_i_1__0_n_4 ;
  wire \acc3_reg[4]_i_1__0_n_5 ;
  wire \acc3_reg[4]_i_1__0_n_6 ;
  wire \acc3_reg[4]_i_1__0_n_7 ;
  wire \acc3_reg[8]_i_1__0_n_0 ;
  wire \acc3_reg[8]_i_1__0_n_1 ;
  wire \acc3_reg[8]_i_1__0_n_2 ;
  wire \acc3_reg[8]_i_1__0_n_3 ;
  wire \acc3_reg[8]_i_1__0_n_4 ;
  wire \acc3_reg[8]_i_1__0_n_5 ;
  wire \acc3_reg[8]_i_1__0_n_6 ;
  wire \acc3_reg[8]_i_1__0_n_7 ;
  wire [15:15]\ch_data[1]_1 ;
  wire [13:0]data0;
  wire [21:0]diff1;
  wire [21:0]diff102_out;
  wire \diff1[11]_i_2__0_n_0 ;
  wire \diff1[11]_i_3__0_n_0 ;
  wire \diff1[11]_i_4__0_n_0 ;
  wire \diff1[11]_i_5__0_n_0 ;
  wire \diff1[15]_i_2__0_n_0 ;
  wire \diff1[15]_i_3__0_n_0 ;
  wire \diff1[15]_i_4__0_n_0 ;
  wire \diff1[15]_i_5__0_n_0 ;
  wire \diff1[19]_i_2__0_n_0 ;
  wire \diff1[19]_i_3__0_n_0 ;
  wire \diff1[19]_i_4__0_n_0 ;
  wire \diff1[19]_i_5__0_n_0 ;
  wire \diff1[21]_i_2__0_n_0 ;
  wire \diff1[21]_i_3__0_n_0 ;
  wire \diff1[3]_i_2__0_n_0 ;
  wire \diff1[3]_i_3__0_n_0 ;
  wire \diff1[3]_i_4__0_n_0 ;
  wire \diff1[3]_i_5__0_n_0 ;
  wire \diff1[7]_i_2__0_n_0 ;
  wire \diff1[7]_i_3__0_n_0 ;
  wire \diff1[7]_i_4__0_n_0 ;
  wire \diff1[7]_i_5__0_n_0 ;
  wire [21:0]diff1_d;
  wire \diff1_reg[11]_i_1__0_n_0 ;
  wire \diff1_reg[11]_i_1__0_n_1 ;
  wire \diff1_reg[11]_i_1__0_n_2 ;
  wire \diff1_reg[11]_i_1__0_n_3 ;
  wire \diff1_reg[15]_i_1__0_n_0 ;
  wire \diff1_reg[15]_i_1__0_n_1 ;
  wire \diff1_reg[15]_i_1__0_n_2 ;
  wire \diff1_reg[15]_i_1__0_n_3 ;
  wire \diff1_reg[19]_i_1__0_n_0 ;
  wire \diff1_reg[19]_i_1__0_n_1 ;
  wire \diff1_reg[19]_i_1__0_n_2 ;
  wire \diff1_reg[19]_i_1__0_n_3 ;
  wire \diff1_reg[21]_i_1__0_n_3 ;
  wire \diff1_reg[3]_i_1__0_n_0 ;
  wire \diff1_reg[3]_i_1__0_n_1 ;
  wire \diff1_reg[3]_i_1__0_n_2 ;
  wire \diff1_reg[3]_i_1__0_n_3 ;
  wire \diff1_reg[7]_i_1__0_n_0 ;
  wire \diff1_reg[7]_i_1__0_n_1 ;
  wire \diff1_reg[7]_i_1__0_n_2 ;
  wire \diff1_reg[7]_i_1__0_n_3 ;
  wire [21:0]diff2;
  wire [21:0]diff201_out;
  wire \diff2[11]_i_2__0_n_0 ;
  wire \diff2[11]_i_3__0_n_0 ;
  wire \diff2[11]_i_4__0_n_0 ;
  wire \diff2[11]_i_5__0_n_0 ;
  wire \diff2[15]_i_2__0_n_0 ;
  wire \diff2[15]_i_3__0_n_0 ;
  wire \diff2[15]_i_4__0_n_0 ;
  wire \diff2[15]_i_5__0_n_0 ;
  wire \diff2[19]_i_2__0_n_0 ;
  wire \diff2[19]_i_3__0_n_0 ;
  wire \diff2[19]_i_4__0_n_0 ;
  wire \diff2[19]_i_5__0_n_0 ;
  wire \diff2[21]_i_2__0_n_0 ;
  wire \diff2[21]_i_3__0_n_0 ;
  wire \diff2[3]_i_2__0_n_0 ;
  wire \diff2[3]_i_3__0_n_0 ;
  wire \diff2[3]_i_4__0_n_0 ;
  wire \diff2[3]_i_5__0_n_0 ;
  wire \diff2[7]_i_2__0_n_0 ;
  wire \diff2[7]_i_3__0_n_0 ;
  wire \diff2[7]_i_4__0_n_0 ;
  wire \diff2[7]_i_5__0_n_0 ;
  wire [21:0]diff2_d;
  wire \diff2_reg[11]_i_1__0_n_0 ;
  wire \diff2_reg[11]_i_1__0_n_1 ;
  wire \diff2_reg[11]_i_1__0_n_2 ;
  wire \diff2_reg[11]_i_1__0_n_3 ;
  wire \diff2_reg[15]_i_1__0_n_0 ;
  wire \diff2_reg[15]_i_1__0_n_1 ;
  wire \diff2_reg[15]_i_1__0_n_2 ;
  wire \diff2_reg[15]_i_1__0_n_3 ;
  wire \diff2_reg[19]_i_1__0_n_0 ;
  wire \diff2_reg[19]_i_1__0_n_1 ;
  wire \diff2_reg[19]_i_1__0_n_2 ;
  wire \diff2_reg[19]_i_1__0_n_3 ;
  wire \diff2_reg[21]_i_1__0_n_3 ;
  wire \diff2_reg[3]_i_1__0_n_0 ;
  wire \diff2_reg[3]_i_1__0_n_1 ;
  wire \diff2_reg[3]_i_1__0_n_2 ;
  wire \diff2_reg[3]_i_1__0_n_3 ;
  wire \diff2_reg[7]_i_1__0_n_0 ;
  wire \diff2_reg[7]_i_1__0_n_1 ;
  wire \diff2_reg[7]_i_1__0_n_2 ;
  wire \diff2_reg[7]_i_1__0_n_3 ;
  wire [21:5]diff300_out;
  wire \diff3[11]_i_2__0_n_0 ;
  wire \diff3[11]_i_3__0_n_0 ;
  wire \diff3[11]_i_4__0_n_0 ;
  wire \diff3[11]_i_5__0_n_0 ;
  wire \diff3[15]_i_2__0_n_0 ;
  wire \diff3[15]_i_3__0_n_0 ;
  wire \diff3[15]_i_4__0_n_0 ;
  wire \diff3[15]_i_5__0_n_0 ;
  wire \diff3[19]_i_2__0_n_0 ;
  wire \diff3[19]_i_3__0_n_0 ;
  wire \diff3[19]_i_4__0_n_0 ;
  wire \diff3[19]_i_5__0_n_0 ;
  wire \diff3[21]_i_2__0_n_0 ;
  wire \diff3[21]_i_3__0_n_0 ;
  wire \diff3[7]_i_10__0_n_0 ;
  wire \diff3[7]_i_3__0_n_0 ;
  wire \diff3[7]_i_4__0_n_0 ;
  wire \diff3[7]_i_5__0_n_0 ;
  wire \diff3[7]_i_6__0_n_0 ;
  wire \diff3[7]_i_7__0_n_0 ;
  wire \diff3[7]_i_8__0_n_0 ;
  wire \diff3[7]_i_9__0_n_0 ;
  wire \diff3_reg[11]_i_1__0_n_0 ;
  wire \diff3_reg[11]_i_1__0_n_1 ;
  wire \diff3_reg[11]_i_1__0_n_2 ;
  wire \diff3_reg[11]_i_1__0_n_3 ;
  wire \diff3_reg[15]_i_1__0_n_0 ;
  wire \diff3_reg[15]_i_1__0_n_1 ;
  wire \diff3_reg[15]_i_1__0_n_2 ;
  wire \diff3_reg[15]_i_1__0_n_3 ;
  wire \diff3_reg[19]_i_1__0_n_0 ;
  wire \diff3_reg[19]_i_1__0_n_1 ;
  wire \diff3_reg[19]_i_1__0_n_2 ;
  wire \diff3_reg[19]_i_1__0_n_3 ;
  wire \diff3_reg[21]_i_1__0_n_3 ;
  wire \diff3_reg[7]_i_1__0_n_0 ;
  wire \diff3_reg[7]_i_1__0_n_1 ;
  wire \diff3_reg[7]_i_1__0_n_2 ;
  wire \diff3_reg[7]_i_1__0_n_3 ;
  wire \diff3_reg[7]_i_2__0_n_0 ;
  wire \diff3_reg[7]_i_2__0_n_1 ;
  wire \diff3_reg[7]_i_2__0_n_2 ;
  wire \diff3_reg[7]_i_2__0_n_3 ;
  wire \diff3_reg_n_0_[5] ;
  wire \diff3_reg_n_0_[6] ;
  wire \diff3_reg_n_0_[7] ;
  wire [0:0]din;
  wire m_axis_aclk;
  wire mdat_i;
  wire [0:0]p_1_in;
  wire \tdata[0]_i_2__0_n_0 ;
  wire \tdata[0]_i_3__0_n_0 ;
  wire \tdata[0]_i_4__0_n_0 ;
  wire \tdata[0]_i_5__0_n_0 ;
  wire \tdata[15]_i_1__0_n_0 ;
  wire word_clk;
  wire word_clk0;
  wire word_clk_i_3__0_n_0;
  wire word_clk_i_4__0_n_0;
  wire word_clk_i_5__0_n_0;
  wire word_clk_i_6__0_n_0;
  wire word_clk_i_7__0_n_0;
  wire word_clk_i_8__0_n_0;
  wire word_clk_reg_i_1__0_n_3;
  wire word_clk_reg_i_2__0_n_0;
  wire word_clk_reg_i_2__0_n_1;
  wire word_clk_reg_i_2__0_n_2;
  wire word_clk_reg_i_2__0_n_3;
  wire word_count0;
  wire \word_count[0]_i_10__0_n_0 ;
  wire \word_count[0]_i_11__0_n_0 ;
  wire \word_count[0]_i_12__0_n_0 ;
  wire \word_count[0]_i_13__0_n_0 ;
  wire \word_count[0]_i_4__0_n_0 ;
  wire \word_count[0]_i_5__0_n_0 ;
  wire \word_count[0]_i_6__0_n_0 ;
  wire \word_count[0]_i_7__0_n_0 ;
  wire \word_count[0]_i_8__0_n_0 ;
  wire \word_count[0]_i_9__0_n_0 ;
  wire \word_count[12]_i_2__0_n_0 ;
  wire \word_count[12]_i_3__0_n_0 ;
  wire \word_count[12]_i_4__0_n_0 ;
  wire \word_count[12]_i_5__0_n_0 ;
  wire \word_count[4]_i_2__0_n_0 ;
  wire \word_count[4]_i_3__0_n_0 ;
  wire \word_count[4]_i_4__0_n_0 ;
  wire \word_count[4]_i_5__0_n_0 ;
  wire \word_count[8]_i_2__0_n_0 ;
  wire \word_count[8]_i_3__0_n_0 ;
  wire \word_count[8]_i_4__0_n_0 ;
  wire \word_count[8]_i_5__0_n_0 ;
  wire [15:0]word_count_reg;
  wire \word_count_reg[0]_i_1__0_n_3 ;
  wire \word_count_reg[0]_i_2__0_n_0 ;
  wire \word_count_reg[0]_i_2__0_n_1 ;
  wire \word_count_reg[0]_i_2__0_n_2 ;
  wire \word_count_reg[0]_i_2__0_n_3 ;
  wire \word_count_reg[0]_i_2__0_n_4 ;
  wire \word_count_reg[0]_i_2__0_n_5 ;
  wire \word_count_reg[0]_i_2__0_n_6 ;
  wire \word_count_reg[0]_i_2__0_n_7 ;
  wire \word_count_reg[0]_i_3__0_n_0 ;
  wire \word_count_reg[0]_i_3__0_n_1 ;
  wire \word_count_reg[0]_i_3__0_n_2 ;
  wire \word_count_reg[0]_i_3__0_n_3 ;
  wire \word_count_reg[12]_i_1__0_n_1 ;
  wire \word_count_reg[12]_i_1__0_n_2 ;
  wire \word_count_reg[12]_i_1__0_n_3 ;
  wire \word_count_reg[12]_i_1__0_n_4 ;
  wire \word_count_reg[12]_i_1__0_n_5 ;
  wire \word_count_reg[12]_i_1__0_n_6 ;
  wire \word_count_reg[12]_i_1__0_n_7 ;
  wire \word_count_reg[4]_i_1__0_n_0 ;
  wire \word_count_reg[4]_i_1__0_n_1 ;
  wire \word_count_reg[4]_i_1__0_n_2 ;
  wire \word_count_reg[4]_i_1__0_n_3 ;
  wire \word_count_reg[4]_i_1__0_n_4 ;
  wire \word_count_reg[4]_i_1__0_n_5 ;
  wire \word_count_reg[4]_i_1__0_n_6 ;
  wire \word_count_reg[4]_i_1__0_n_7 ;
  wire \word_count_reg[8]_i_1__0_n_0 ;
  wire \word_count_reg[8]_i_1__0_n_1 ;
  wire \word_count_reg[8]_i_1__0_n_2 ;
  wire \word_count_reg[8]_i_1__0_n_3 ;
  wire \word_count_reg[8]_i_1__0_n_4 ;
  wire \word_count_reg[8]_i_1__0_n_5 ;
  wire \word_count_reg[8]_i_1__0_n_6 ;
  wire \word_count_reg[8]_i_1__0_n_7 ;
  wire [3:1]\NLW_acc1_reg[20]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc1_reg[20]_i_1__0_O_UNCONNECTED ;
  wire [3:1]\NLW_acc2_reg[20]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc2_reg[20]_i_1__0_O_UNCONNECTED ;
  wire [3:1]\NLW_acc3_reg[20]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc3_reg[20]_i_1__0_O_UNCONNECTED ;
  wire [3:1]\NLW_diff1_reg[21]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff1_reg[21]_i_1__0_O_UNCONNECTED ;
  wire [3:1]\NLW_diff2_reg[21]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff2_reg[21]_i_1__0_O_UNCONNECTED ;
  wire [3:1]\NLW_diff3_reg[21]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff3_reg[21]_i_1__0_O_UNCONNECTED ;
  wire [0:0]\NLW_diff3_reg[7]_i_1__0_O_UNCONNECTED ;
  wire [3:0]\NLW_diff3_reg[7]_i_2__0_O_UNCONNECTED ;
  wire [3:2]NLW_word_clk_reg_i_1__0_CO_UNCONNECTED;
  wire [3:0]NLW_word_clk_reg_i_1__0_O_UNCONNECTED;
  wire [3:0]NLW_word_clk_reg_i_2__0_O_UNCONNECTED;
  wire [3:2]\NLW_word_count_reg[0]_i_1__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_word_count_reg[0]_i_1__0_O_UNCONNECTED ;
  wire [3:0]\NLW_word_count_reg[0]_i_3__0_O_UNCONNECTED ;
  wire [3:3]\NLW_word_count_reg[12]_i_1__0_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_2__0 
       (.I0(acc1_reg[3]),
        .O(\acc1[0]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_3__0 
       (.I0(acc1_reg[2]),
        .O(\acc1[0]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_4__0 
       (.I0(acc1_reg[1]),
        .O(\acc1[0]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \acc1[0]_i_5__0 
       (.I0(acc1_reg[0]),
        .O(\acc1[0]_i_5__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_2__0 
       (.I0(acc1_reg[15]),
        .O(\acc1[12]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_3__0 
       (.I0(acc1_reg[14]),
        .O(\acc1[12]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_4__0 
       (.I0(acc1_reg[13]),
        .O(\acc1[12]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_5__0 
       (.I0(acc1_reg[12]),
        .O(\acc1[12]_i_5__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_2__0 
       (.I0(acc1_reg[19]),
        .O(\acc1[16]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_3__0 
       (.I0(acc1_reg[18]),
        .O(\acc1[16]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_4__0 
       (.I0(acc1_reg[17]),
        .O(\acc1[16]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_5__0 
       (.I0(acc1_reg[16]),
        .O(\acc1[16]_i_5__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[20]_i_2__0 
       (.I0(acc1_reg[21]),
        .O(\acc1[20]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[20]_i_3__0 
       (.I0(acc1_reg[20]),
        .O(\acc1[20]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_2__0 
       (.I0(acc1_reg[7]),
        .O(\acc1[4]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_3__0 
       (.I0(acc1_reg[6]),
        .O(\acc1[4]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_4__0 
       (.I0(acc1_reg[5]),
        .O(\acc1[4]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_5__0 
       (.I0(acc1_reg[4]),
        .O(\acc1[4]_i_5__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_2__0 
       (.I0(acc1_reg[11]),
        .O(\acc1[8]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_3__0 
       (.I0(acc1_reg[10]),
        .O(\acc1[8]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_4__0 
       (.I0(acc1_reg[9]),
        .O(\acc1[8]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_5__0 
       (.I0(acc1_reg[8]),
        .O(\acc1[8]_i_5__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[0] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__0_n_7 ),
        .Q(acc1_reg[0]),
        .R(1'b0));
  CARRY4 \acc1_reg[0]_i_1__0 
       (.CI(1'b0),
        .CO({\acc1_reg[0]_i_1__0_n_0 ,\acc1_reg[0]_i_1__0_n_1 ,\acc1_reg[0]_i_1__0_n_2 ,\acc1_reg[0]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\acc1_reg[0]_i_1__0_n_4 ,\acc1_reg[0]_i_1__0_n_5 ,\acc1_reg[0]_i_1__0_n_6 ,\acc1_reg[0]_i_1__0_n_7 }),
        .S({\acc1[0]_i_2__0_n_0 ,\acc1[0]_i_3__0_n_0 ,\acc1[0]_i_4__0_n_0 ,\acc1[0]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[10] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__0_n_5 ),
        .Q(acc1_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[11] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__0_n_4 ),
        .Q(acc1_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[12] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__0_n_7 ),
        .Q(acc1_reg[12]),
        .R(1'b0));
  CARRY4 \acc1_reg[12]_i_1__0 
       (.CI(\acc1_reg[8]_i_1__0_n_0 ),
        .CO({\acc1_reg[12]_i_1__0_n_0 ,\acc1_reg[12]_i_1__0_n_1 ,\acc1_reg[12]_i_1__0_n_2 ,\acc1_reg[12]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[12]_i_1__0_n_4 ,\acc1_reg[12]_i_1__0_n_5 ,\acc1_reg[12]_i_1__0_n_6 ,\acc1_reg[12]_i_1__0_n_7 }),
        .S({\acc1[12]_i_2__0_n_0 ,\acc1[12]_i_3__0_n_0 ,\acc1[12]_i_4__0_n_0 ,\acc1[12]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[13] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__0_n_6 ),
        .Q(acc1_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[14] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__0_n_5 ),
        .Q(acc1_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[15] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__0_n_4 ),
        .Q(acc1_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[16] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__0_n_7 ),
        .Q(acc1_reg[16]),
        .R(1'b0));
  CARRY4 \acc1_reg[16]_i_1__0 
       (.CI(\acc1_reg[12]_i_1__0_n_0 ),
        .CO({\acc1_reg[16]_i_1__0_n_0 ,\acc1_reg[16]_i_1__0_n_1 ,\acc1_reg[16]_i_1__0_n_2 ,\acc1_reg[16]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[16]_i_1__0_n_4 ,\acc1_reg[16]_i_1__0_n_5 ,\acc1_reg[16]_i_1__0_n_6 ,\acc1_reg[16]_i_1__0_n_7 }),
        .S({\acc1[16]_i_2__0_n_0 ,\acc1[16]_i_3__0_n_0 ,\acc1[16]_i_4__0_n_0 ,\acc1[16]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[17] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__0_n_6 ),
        .Q(acc1_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[18] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__0_n_5 ),
        .Q(acc1_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[19] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__0_n_4 ),
        .Q(acc1_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[1] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__0_n_6 ),
        .Q(acc1_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[20] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[20]_i_1__0_n_7 ),
        .Q(acc1_reg[20]),
        .R(1'b0));
  CARRY4 \acc1_reg[20]_i_1__0 
       (.CI(\acc1_reg[16]_i_1__0_n_0 ),
        .CO({\NLW_acc1_reg[20]_i_1__0_CO_UNCONNECTED [3:1],\acc1_reg[20]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_acc1_reg[20]_i_1__0_O_UNCONNECTED [3:2],\acc1_reg[20]_i_1__0_n_6 ,\acc1_reg[20]_i_1__0_n_7 }),
        .S({1'b0,1'b0,\acc1[20]_i_2__0_n_0 ,\acc1[20]_i_3__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[21] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[20]_i_1__0_n_6 ),
        .Q(acc1_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[2] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__0_n_5 ),
        .Q(acc1_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[3] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__0_n_4 ),
        .Q(acc1_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[4] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__0_n_7 ),
        .Q(acc1_reg[4]),
        .R(1'b0));
  CARRY4 \acc1_reg[4]_i_1__0 
       (.CI(\acc1_reg[0]_i_1__0_n_0 ),
        .CO({\acc1_reg[4]_i_1__0_n_0 ,\acc1_reg[4]_i_1__0_n_1 ,\acc1_reg[4]_i_1__0_n_2 ,\acc1_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[4]_i_1__0_n_4 ,\acc1_reg[4]_i_1__0_n_5 ,\acc1_reg[4]_i_1__0_n_6 ,\acc1_reg[4]_i_1__0_n_7 }),
        .S({\acc1[4]_i_2__0_n_0 ,\acc1[4]_i_3__0_n_0 ,\acc1[4]_i_4__0_n_0 ,\acc1[4]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[5] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__0_n_6 ),
        .Q(acc1_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[6] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__0_n_5 ),
        .Q(acc1_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[7] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__0_n_4 ),
        .Q(acc1_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[8] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__0_n_7 ),
        .Q(acc1_reg[8]),
        .R(1'b0));
  CARRY4 \acc1_reg[8]_i_1__0 
       (.CI(\acc1_reg[4]_i_1__0_n_0 ),
        .CO({\acc1_reg[8]_i_1__0_n_0 ,\acc1_reg[8]_i_1__0_n_1 ,\acc1_reg[8]_i_1__0_n_2 ,\acc1_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[8]_i_1__0_n_4 ,\acc1_reg[8]_i_1__0_n_5 ,\acc1_reg[8]_i_1__0_n_6 ,\acc1_reg[8]_i_1__0_n_7 }),
        .S({\acc1[8]_i_2__0_n_0 ,\acc1[8]_i_3__0_n_0 ,\acc1[8]_i_4__0_n_0 ,\acc1[8]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[9] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__0_n_6 ),
        .Q(acc1_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_2__0 
       (.I0(acc1_reg[3]),
        .I1(acc2_reg[3]),
        .O(\acc2[0]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_3__0 
       (.I0(acc1_reg[2]),
        .I1(acc2_reg[2]),
        .O(\acc2[0]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_4__0 
       (.I0(acc1_reg[1]),
        .I1(acc2_reg[1]),
        .O(\acc2[0]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_5__0 
       (.I0(acc1_reg[0]),
        .I1(acc2_reg[0]),
        .O(\acc2[0]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_2__0 
       (.I0(acc1_reg[15]),
        .I1(acc2_reg[15]),
        .O(\acc2[12]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_3__0 
       (.I0(acc1_reg[14]),
        .I1(acc2_reg[14]),
        .O(\acc2[12]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_4__0 
       (.I0(acc1_reg[13]),
        .I1(acc2_reg[13]),
        .O(\acc2[12]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_5__0 
       (.I0(acc1_reg[12]),
        .I1(acc2_reg[12]),
        .O(\acc2[12]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_2__0 
       (.I0(acc1_reg[19]),
        .I1(acc2_reg[19]),
        .O(\acc2[16]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_3__0 
       (.I0(acc1_reg[18]),
        .I1(acc2_reg[18]),
        .O(\acc2[16]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_4__0 
       (.I0(acc1_reg[17]),
        .I1(acc2_reg[17]),
        .O(\acc2[16]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_5__0 
       (.I0(acc1_reg[16]),
        .I1(acc2_reg[16]),
        .O(\acc2[16]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[20]_i_2__0 
       (.I0(acc2_reg[21]),
        .I1(acc1_reg[21]),
        .O(\acc2[20]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[20]_i_3__0 
       (.I0(acc1_reg[20]),
        .I1(acc2_reg[20]),
        .O(\acc2[20]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_2__0 
       (.I0(acc1_reg[7]),
        .I1(acc2_reg[7]),
        .O(\acc2[4]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_3__0 
       (.I0(acc1_reg[6]),
        .I1(acc2_reg[6]),
        .O(\acc2[4]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_4__0 
       (.I0(acc1_reg[5]),
        .I1(acc2_reg[5]),
        .O(\acc2[4]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_5__0 
       (.I0(acc1_reg[4]),
        .I1(acc2_reg[4]),
        .O(\acc2[4]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_2__0 
       (.I0(acc1_reg[11]),
        .I1(acc2_reg[11]),
        .O(\acc2[8]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_3__0 
       (.I0(acc1_reg[10]),
        .I1(acc2_reg[10]),
        .O(\acc2[8]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_4__0 
       (.I0(acc1_reg[9]),
        .I1(acc2_reg[9]),
        .O(\acc2[8]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_5__0 
       (.I0(acc1_reg[8]),
        .I1(acc2_reg[8]),
        .O(\acc2[8]_i_5__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__0_n_7 ),
        .Q(acc2_reg[0]),
        .R(1'b0));
  CARRY4 \acc2_reg[0]_i_1__0 
       (.CI(1'b0),
        .CO({\acc2_reg[0]_i_1__0_n_0 ,\acc2_reg[0]_i_1__0_n_1 ,\acc2_reg[0]_i_1__0_n_2 ,\acc2_reg[0]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[3:0]),
        .O({\acc2_reg[0]_i_1__0_n_4 ,\acc2_reg[0]_i_1__0_n_5 ,\acc2_reg[0]_i_1__0_n_6 ,\acc2_reg[0]_i_1__0_n_7 }),
        .S({\acc2[0]_i_2__0_n_0 ,\acc2[0]_i_3__0_n_0 ,\acc2[0]_i_4__0_n_0 ,\acc2[0]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__0_n_5 ),
        .Q(acc2_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__0_n_4 ),
        .Q(acc2_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__0_n_7 ),
        .Q(acc2_reg[12]),
        .R(1'b0));
  CARRY4 \acc2_reg[12]_i_1__0 
       (.CI(\acc2_reg[8]_i_1__0_n_0 ),
        .CO({\acc2_reg[12]_i_1__0_n_0 ,\acc2_reg[12]_i_1__0_n_1 ,\acc2_reg[12]_i_1__0_n_2 ,\acc2_reg[12]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[15:12]),
        .O({\acc2_reg[12]_i_1__0_n_4 ,\acc2_reg[12]_i_1__0_n_5 ,\acc2_reg[12]_i_1__0_n_6 ,\acc2_reg[12]_i_1__0_n_7 }),
        .S({\acc2[12]_i_2__0_n_0 ,\acc2[12]_i_3__0_n_0 ,\acc2[12]_i_4__0_n_0 ,\acc2[12]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__0_n_6 ),
        .Q(acc2_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__0_n_5 ),
        .Q(acc2_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__0_n_4 ),
        .Q(acc2_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[16] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__0_n_7 ),
        .Q(acc2_reg[16]),
        .R(1'b0));
  CARRY4 \acc2_reg[16]_i_1__0 
       (.CI(\acc2_reg[12]_i_1__0_n_0 ),
        .CO({\acc2_reg[16]_i_1__0_n_0 ,\acc2_reg[16]_i_1__0_n_1 ,\acc2_reg[16]_i_1__0_n_2 ,\acc2_reg[16]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[19:16]),
        .O({\acc2_reg[16]_i_1__0_n_4 ,\acc2_reg[16]_i_1__0_n_5 ,\acc2_reg[16]_i_1__0_n_6 ,\acc2_reg[16]_i_1__0_n_7 }),
        .S({\acc2[16]_i_2__0_n_0 ,\acc2[16]_i_3__0_n_0 ,\acc2[16]_i_4__0_n_0 ,\acc2[16]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[17] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__0_n_6 ),
        .Q(acc2_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[18] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__0_n_5 ),
        .Q(acc2_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[19] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__0_n_4 ),
        .Q(acc2_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__0_n_6 ),
        .Q(acc2_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[20] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[20]_i_1__0_n_7 ),
        .Q(acc2_reg[20]),
        .R(1'b0));
  CARRY4 \acc2_reg[20]_i_1__0 
       (.CI(\acc2_reg[16]_i_1__0_n_0 ),
        .CO({\NLW_acc2_reg[20]_i_1__0_CO_UNCONNECTED [3:1],\acc2_reg[20]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc1_reg[20]}),
        .O({\NLW_acc2_reg[20]_i_1__0_O_UNCONNECTED [3:2],\acc2_reg[20]_i_1__0_n_6 ,\acc2_reg[20]_i_1__0_n_7 }),
        .S({1'b0,1'b0,\acc2[20]_i_2__0_n_0 ,\acc2[20]_i_3__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[21] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[20]_i_1__0_n_6 ),
        .Q(acc2_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__0_n_5 ),
        .Q(acc2_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__0_n_4 ),
        .Q(acc2_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__0_n_7 ),
        .Q(acc2_reg[4]),
        .R(1'b0));
  CARRY4 \acc2_reg[4]_i_1__0 
       (.CI(\acc2_reg[0]_i_1__0_n_0 ),
        .CO({\acc2_reg[4]_i_1__0_n_0 ,\acc2_reg[4]_i_1__0_n_1 ,\acc2_reg[4]_i_1__0_n_2 ,\acc2_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[7:4]),
        .O({\acc2_reg[4]_i_1__0_n_4 ,\acc2_reg[4]_i_1__0_n_5 ,\acc2_reg[4]_i_1__0_n_6 ,\acc2_reg[4]_i_1__0_n_7 }),
        .S({\acc2[4]_i_2__0_n_0 ,\acc2[4]_i_3__0_n_0 ,\acc2[4]_i_4__0_n_0 ,\acc2[4]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__0_n_6 ),
        .Q(acc2_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__0_n_5 ),
        .Q(acc2_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__0_n_4 ),
        .Q(acc2_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__0_n_7 ),
        .Q(acc2_reg[8]),
        .R(1'b0));
  CARRY4 \acc2_reg[8]_i_1__0 
       (.CI(\acc2_reg[4]_i_1__0_n_0 ),
        .CO({\acc2_reg[8]_i_1__0_n_0 ,\acc2_reg[8]_i_1__0_n_1 ,\acc2_reg[8]_i_1__0_n_2 ,\acc2_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[11:8]),
        .O({\acc2_reg[8]_i_1__0_n_4 ,\acc2_reg[8]_i_1__0_n_5 ,\acc2_reg[8]_i_1__0_n_6 ,\acc2_reg[8]_i_1__0_n_7 }),
        .S({\acc2[8]_i_2__0_n_0 ,\acc2[8]_i_3__0_n_0 ,\acc2[8]_i_4__0_n_0 ,\acc2[8]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__0_n_6 ),
        .Q(acc2_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_2__0 
       (.I0(acc2_reg[3]),
        .I1(acc3_reg[3]),
        .O(\acc3[0]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_3__0 
       (.I0(acc2_reg[2]),
        .I1(acc3_reg[2]),
        .O(\acc3[0]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_4__0 
       (.I0(acc2_reg[1]),
        .I1(acc3_reg[1]),
        .O(\acc3[0]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_5__0 
       (.I0(acc2_reg[0]),
        .I1(acc3_reg[0]),
        .O(\acc3[0]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_2__0 
       (.I0(acc2_reg[15]),
        .I1(acc3_reg[15]),
        .O(\acc3[12]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_3__0 
       (.I0(acc2_reg[14]),
        .I1(acc3_reg[14]),
        .O(\acc3[12]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_4__0 
       (.I0(acc2_reg[13]),
        .I1(acc3_reg[13]),
        .O(\acc3[12]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_5__0 
       (.I0(acc2_reg[12]),
        .I1(acc3_reg[12]),
        .O(\acc3[12]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_2__0 
       (.I0(acc2_reg[19]),
        .I1(acc3_reg[19]),
        .O(\acc3[16]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_3__0 
       (.I0(acc2_reg[18]),
        .I1(acc3_reg[18]),
        .O(\acc3[16]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_4__0 
       (.I0(acc2_reg[17]),
        .I1(acc3_reg[17]),
        .O(\acc3[16]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_5__0 
       (.I0(acc2_reg[16]),
        .I1(acc3_reg[16]),
        .O(\acc3[16]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[20]_i_2__0 
       (.I0(acc2_reg[21]),
        .I1(acc3_reg[21]),
        .O(\acc3[20]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[20]_i_3__0 
       (.I0(acc2_reg[20]),
        .I1(acc3_reg[20]),
        .O(\acc3[20]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_2__0 
       (.I0(acc2_reg[7]),
        .I1(acc3_reg[7]),
        .O(\acc3[4]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_3__0 
       (.I0(acc2_reg[6]),
        .I1(acc3_reg[6]),
        .O(\acc3[4]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_4__0 
       (.I0(acc2_reg[5]),
        .I1(acc3_reg[5]),
        .O(\acc3[4]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_5__0 
       (.I0(acc2_reg[4]),
        .I1(acc3_reg[4]),
        .O(\acc3[4]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_2__0 
       (.I0(acc2_reg[11]),
        .I1(acc3_reg[11]),
        .O(\acc3[8]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_3__0 
       (.I0(acc2_reg[10]),
        .I1(acc3_reg[10]),
        .O(\acc3[8]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_4__0 
       (.I0(acc2_reg[9]),
        .I1(acc3_reg[9]),
        .O(\acc3[8]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_5__0 
       (.I0(acc2_reg[8]),
        .I1(acc3_reg[8]),
        .O(\acc3[8]_i_5__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[0]),
        .Q(acc3_d2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[10]),
        .Q(acc3_d2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[11]),
        .Q(acc3_d2[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[12]),
        .Q(acc3_d2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[13]),
        .Q(acc3_d2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[14]),
        .Q(acc3_d2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[15]),
        .Q(acc3_d2[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[16]),
        .Q(acc3_d2[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[17]),
        .Q(acc3_d2[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[18]),
        .Q(acc3_d2[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[19]),
        .Q(acc3_d2[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[1]),
        .Q(acc3_d2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[20]),
        .Q(acc3_d2[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[21]),
        .Q(acc3_d2[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[2]),
        .Q(acc3_d2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[3]),
        .Q(acc3_d2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[4]),
        .Q(acc3_d2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[5]),
        .Q(acc3_d2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[6]),
        .Q(acc3_d2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[7]),
        .Q(acc3_d2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[8]),
        .Q(acc3_d2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[9]),
        .Q(acc3_d2[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__0_n_7 ),
        .Q(acc3_reg[0]),
        .R(1'b0));
  CARRY4 \acc3_reg[0]_i_1__0 
       (.CI(1'b0),
        .CO({\acc3_reg[0]_i_1__0_n_0 ,\acc3_reg[0]_i_1__0_n_1 ,\acc3_reg[0]_i_1__0_n_2 ,\acc3_reg[0]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[3:0]),
        .O({\acc3_reg[0]_i_1__0_n_4 ,\acc3_reg[0]_i_1__0_n_5 ,\acc3_reg[0]_i_1__0_n_6 ,\acc3_reg[0]_i_1__0_n_7 }),
        .S({\acc3[0]_i_2__0_n_0 ,\acc3[0]_i_3__0_n_0 ,\acc3[0]_i_4__0_n_0 ,\acc3[0]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__0_n_5 ),
        .Q(acc3_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__0_n_4 ),
        .Q(acc3_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__0_n_7 ),
        .Q(acc3_reg[12]),
        .R(1'b0));
  CARRY4 \acc3_reg[12]_i_1__0 
       (.CI(\acc3_reg[8]_i_1__0_n_0 ),
        .CO({\acc3_reg[12]_i_1__0_n_0 ,\acc3_reg[12]_i_1__0_n_1 ,\acc3_reg[12]_i_1__0_n_2 ,\acc3_reg[12]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[15:12]),
        .O({\acc3_reg[12]_i_1__0_n_4 ,\acc3_reg[12]_i_1__0_n_5 ,\acc3_reg[12]_i_1__0_n_6 ,\acc3_reg[12]_i_1__0_n_7 }),
        .S({\acc3[12]_i_2__0_n_0 ,\acc3[12]_i_3__0_n_0 ,\acc3[12]_i_4__0_n_0 ,\acc3[12]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__0_n_6 ),
        .Q(acc3_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__0_n_5 ),
        .Q(acc3_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__0_n_4 ),
        .Q(acc3_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[16] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__0_n_7 ),
        .Q(acc3_reg[16]),
        .R(1'b0));
  CARRY4 \acc3_reg[16]_i_1__0 
       (.CI(\acc3_reg[12]_i_1__0_n_0 ),
        .CO({\acc3_reg[16]_i_1__0_n_0 ,\acc3_reg[16]_i_1__0_n_1 ,\acc3_reg[16]_i_1__0_n_2 ,\acc3_reg[16]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[19:16]),
        .O({\acc3_reg[16]_i_1__0_n_4 ,\acc3_reg[16]_i_1__0_n_5 ,\acc3_reg[16]_i_1__0_n_6 ,\acc3_reg[16]_i_1__0_n_7 }),
        .S({\acc3[16]_i_2__0_n_0 ,\acc3[16]_i_3__0_n_0 ,\acc3[16]_i_4__0_n_0 ,\acc3[16]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[17] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__0_n_6 ),
        .Q(acc3_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[18] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__0_n_5 ),
        .Q(acc3_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[19] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__0_n_4 ),
        .Q(acc3_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__0_n_6 ),
        .Q(acc3_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[20] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[20]_i_1__0_n_7 ),
        .Q(acc3_reg[20]),
        .R(1'b0));
  CARRY4 \acc3_reg[20]_i_1__0 
       (.CI(\acc3_reg[16]_i_1__0_n_0 ),
        .CO({\NLW_acc3_reg[20]_i_1__0_CO_UNCONNECTED [3:1],\acc3_reg[20]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc2_reg[20]}),
        .O({\NLW_acc3_reg[20]_i_1__0_O_UNCONNECTED [3:2],\acc3_reg[20]_i_1__0_n_6 ,\acc3_reg[20]_i_1__0_n_7 }),
        .S({1'b0,1'b0,\acc3[20]_i_2__0_n_0 ,\acc3[20]_i_3__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[21] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[20]_i_1__0_n_6 ),
        .Q(acc3_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__0_n_5 ),
        .Q(acc3_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__0_n_4 ),
        .Q(acc3_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__0_n_7 ),
        .Q(acc3_reg[4]),
        .R(1'b0));
  CARRY4 \acc3_reg[4]_i_1__0 
       (.CI(\acc3_reg[0]_i_1__0_n_0 ),
        .CO({\acc3_reg[4]_i_1__0_n_0 ,\acc3_reg[4]_i_1__0_n_1 ,\acc3_reg[4]_i_1__0_n_2 ,\acc3_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[7:4]),
        .O({\acc3_reg[4]_i_1__0_n_4 ,\acc3_reg[4]_i_1__0_n_5 ,\acc3_reg[4]_i_1__0_n_6 ,\acc3_reg[4]_i_1__0_n_7 }),
        .S({\acc3[4]_i_2__0_n_0 ,\acc3[4]_i_3__0_n_0 ,\acc3[4]_i_4__0_n_0 ,\acc3[4]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__0_n_6 ),
        .Q(acc3_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__0_n_5 ),
        .Q(acc3_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__0_n_4 ),
        .Q(acc3_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__0_n_7 ),
        .Q(acc3_reg[8]),
        .R(1'b0));
  CARRY4 \acc3_reg[8]_i_1__0 
       (.CI(\acc3_reg[4]_i_1__0_n_0 ),
        .CO({\acc3_reg[8]_i_1__0_n_0 ,\acc3_reg[8]_i_1__0_n_1 ,\acc3_reg[8]_i_1__0_n_2 ,\acc3_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[11:8]),
        .O({\acc3_reg[8]_i_1__0_n_4 ,\acc3_reg[8]_i_1__0_n_5 ,\acc3_reg[8]_i_1__0_n_6 ,\acc3_reg[8]_i_1__0_n_7 }),
        .S({\acc3[8]_i_2__0_n_0 ,\acc3[8]_i_3__0_n_0 ,\acc3[8]_i_4__0_n_0 ,\acc3[8]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__0_n_6 ),
        .Q(acc3_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_2__0 
       (.I0(acc3_reg[11]),
        .I1(acc3_d2[11]),
        .O(\diff1[11]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_3__0 
       (.I0(acc3_reg[10]),
        .I1(acc3_d2[10]),
        .O(\diff1[11]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_4__0 
       (.I0(acc3_reg[9]),
        .I1(acc3_d2[9]),
        .O(\diff1[11]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_5__0 
       (.I0(acc3_reg[8]),
        .I1(acc3_d2[8]),
        .O(\diff1[11]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_2__0 
       (.I0(acc3_reg[15]),
        .I1(acc3_d2[15]),
        .O(\diff1[15]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_3__0 
       (.I0(acc3_reg[14]),
        .I1(acc3_d2[14]),
        .O(\diff1[15]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_4__0 
       (.I0(acc3_reg[13]),
        .I1(acc3_d2[13]),
        .O(\diff1[15]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_5__0 
       (.I0(acc3_reg[12]),
        .I1(acc3_d2[12]),
        .O(\diff1[15]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_2__0 
       (.I0(acc3_reg[19]),
        .I1(acc3_d2[19]),
        .O(\diff1[19]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_3__0 
       (.I0(acc3_reg[18]),
        .I1(acc3_d2[18]),
        .O(\diff1[19]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_4__0 
       (.I0(acc3_reg[17]),
        .I1(acc3_d2[17]),
        .O(\diff1[19]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_5__0 
       (.I0(acc3_reg[16]),
        .I1(acc3_d2[16]),
        .O(\diff1[19]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[21]_i_2__0 
       (.I0(acc3_reg[21]),
        .I1(acc3_d2[21]),
        .O(\diff1[21]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[21]_i_3__0 
       (.I0(acc3_reg[20]),
        .I1(acc3_d2[20]),
        .O(\diff1[21]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_2__0 
       (.I0(acc3_reg[3]),
        .I1(acc3_d2[3]),
        .O(\diff1[3]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_3__0 
       (.I0(acc3_reg[2]),
        .I1(acc3_d2[2]),
        .O(\diff1[3]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_4__0 
       (.I0(acc3_reg[1]),
        .I1(acc3_d2[1]),
        .O(\diff1[3]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_5__0 
       (.I0(acc3_reg[0]),
        .I1(acc3_d2[0]),
        .O(\diff1[3]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_2__0 
       (.I0(acc3_reg[7]),
        .I1(acc3_d2[7]),
        .O(\diff1[7]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_3__0 
       (.I0(acc3_reg[6]),
        .I1(acc3_d2[6]),
        .O(\diff1[7]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_4__0 
       (.I0(acc3_reg[5]),
        .I1(acc3_d2[5]),
        .O(\diff1[7]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_5__0 
       (.I0(acc3_reg[4]),
        .I1(acc3_d2[4]),
        .O(\diff1[7]_i_5__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[0]),
        .Q(diff1_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[10]),
        .Q(diff1_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[11]),
        .Q(diff1_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[12]),
        .Q(diff1_d[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[13]),
        .Q(diff1_d[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[14]),
        .Q(diff1_d[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[15]),
        .Q(diff1_d[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[16]),
        .Q(diff1_d[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[17]),
        .Q(diff1_d[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[18]),
        .Q(diff1_d[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[19]),
        .Q(diff1_d[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[1]),
        .Q(diff1_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[20]),
        .Q(diff1_d[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[21]),
        .Q(diff1_d[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[2]),
        .Q(diff1_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[3]),
        .Q(diff1_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[4]),
        .Q(diff1_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[5]),
        .Q(diff1_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[6]),
        .Q(diff1_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[7]),
        .Q(diff1_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[8]),
        .Q(diff1_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[9]),
        .Q(diff1_d[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[0]),
        .Q(diff1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[10]),
        .Q(diff1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[11]),
        .Q(diff1[11]),
        .R(1'b0));
  CARRY4 \diff1_reg[11]_i_1__0 
       (.CI(\diff1_reg[7]_i_1__0_n_0 ),
        .CO({\diff1_reg[11]_i_1__0_n_0 ,\diff1_reg[11]_i_1__0_n_1 ,\diff1_reg[11]_i_1__0_n_2 ,\diff1_reg[11]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[11:8]),
        .O(diff102_out[11:8]),
        .S({\diff1[11]_i_2__0_n_0 ,\diff1[11]_i_3__0_n_0 ,\diff1[11]_i_4__0_n_0 ,\diff1[11]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[12]),
        .Q(diff1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[13]),
        .Q(diff1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[14]),
        .Q(diff1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[15]),
        .Q(diff1[15]),
        .R(1'b0));
  CARRY4 \diff1_reg[15]_i_1__0 
       (.CI(\diff1_reg[11]_i_1__0_n_0 ),
        .CO({\diff1_reg[15]_i_1__0_n_0 ,\diff1_reg[15]_i_1__0_n_1 ,\diff1_reg[15]_i_1__0_n_2 ,\diff1_reg[15]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[15:12]),
        .O(diff102_out[15:12]),
        .S({\diff1[15]_i_2__0_n_0 ,\diff1[15]_i_3__0_n_0 ,\diff1[15]_i_4__0_n_0 ,\diff1[15]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[16]),
        .Q(diff1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[17]),
        .Q(diff1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[18]),
        .Q(diff1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[19]),
        .Q(diff1[19]),
        .R(1'b0));
  CARRY4 \diff1_reg[19]_i_1__0 
       (.CI(\diff1_reg[15]_i_1__0_n_0 ),
        .CO({\diff1_reg[19]_i_1__0_n_0 ,\diff1_reg[19]_i_1__0_n_1 ,\diff1_reg[19]_i_1__0_n_2 ,\diff1_reg[19]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[19:16]),
        .O(diff102_out[19:16]),
        .S({\diff1[19]_i_2__0_n_0 ,\diff1[19]_i_3__0_n_0 ,\diff1[19]_i_4__0_n_0 ,\diff1[19]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[1]),
        .Q(diff1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[20]),
        .Q(diff1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[21]),
        .Q(diff1[21]),
        .R(1'b0));
  CARRY4 \diff1_reg[21]_i_1__0 
       (.CI(\diff1_reg[19]_i_1__0_n_0 ),
        .CO({\NLW_diff1_reg[21]_i_1__0_CO_UNCONNECTED [3:1],\diff1_reg[21]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc3_reg[20]}),
        .O({\NLW_diff1_reg[21]_i_1__0_O_UNCONNECTED [3:2],diff102_out[21:20]}),
        .S({1'b0,1'b0,\diff1[21]_i_2__0_n_0 ,\diff1[21]_i_3__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[2]),
        .Q(diff1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[3]),
        .Q(diff1[3]),
        .R(1'b0));
  CARRY4 \diff1_reg[3]_i_1__0 
       (.CI(1'b0),
        .CO({\diff1_reg[3]_i_1__0_n_0 ,\diff1_reg[3]_i_1__0_n_1 ,\diff1_reg[3]_i_1__0_n_2 ,\diff1_reg[3]_i_1__0_n_3 }),
        .CYINIT(1'b1),
        .DI(acc3_reg[3:0]),
        .O(diff102_out[3:0]),
        .S({\diff1[3]_i_2__0_n_0 ,\diff1[3]_i_3__0_n_0 ,\diff1[3]_i_4__0_n_0 ,\diff1[3]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[4]),
        .Q(diff1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[5]),
        .Q(diff1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[6]),
        .Q(diff1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[7]),
        .Q(diff1[7]),
        .R(1'b0));
  CARRY4 \diff1_reg[7]_i_1__0 
       (.CI(\diff1_reg[3]_i_1__0_n_0 ),
        .CO({\diff1_reg[7]_i_1__0_n_0 ,\diff1_reg[7]_i_1__0_n_1 ,\diff1_reg[7]_i_1__0_n_2 ,\diff1_reg[7]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[7:4]),
        .O(diff102_out[7:4]),
        .S({\diff1[7]_i_2__0_n_0 ,\diff1[7]_i_3__0_n_0 ,\diff1[7]_i_4__0_n_0 ,\diff1[7]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[8]),
        .Q(diff1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[9]),
        .Q(diff1[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_2__0 
       (.I0(diff1[11]),
        .I1(diff1_d[11]),
        .O(\diff2[11]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_3__0 
       (.I0(diff1[10]),
        .I1(diff1_d[10]),
        .O(\diff2[11]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_4__0 
       (.I0(diff1[9]),
        .I1(diff1_d[9]),
        .O(\diff2[11]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_5__0 
       (.I0(diff1[8]),
        .I1(diff1_d[8]),
        .O(\diff2[11]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_2__0 
       (.I0(diff1[15]),
        .I1(diff1_d[15]),
        .O(\diff2[15]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_3__0 
       (.I0(diff1[14]),
        .I1(diff1_d[14]),
        .O(\diff2[15]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_4__0 
       (.I0(diff1[13]),
        .I1(diff1_d[13]),
        .O(\diff2[15]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_5__0 
       (.I0(diff1[12]),
        .I1(diff1_d[12]),
        .O(\diff2[15]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_2__0 
       (.I0(diff1[19]),
        .I1(diff1_d[19]),
        .O(\diff2[19]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_3__0 
       (.I0(diff1[18]),
        .I1(diff1_d[18]),
        .O(\diff2[19]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_4__0 
       (.I0(diff1[17]),
        .I1(diff1_d[17]),
        .O(\diff2[19]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_5__0 
       (.I0(diff1[16]),
        .I1(diff1_d[16]),
        .O(\diff2[19]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[21]_i_2__0 
       (.I0(diff1[21]),
        .I1(diff1_d[21]),
        .O(\diff2[21]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[21]_i_3__0 
       (.I0(diff1[20]),
        .I1(diff1_d[20]),
        .O(\diff2[21]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_2__0 
       (.I0(diff1[3]),
        .I1(diff1_d[3]),
        .O(\diff2[3]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_3__0 
       (.I0(diff1[2]),
        .I1(diff1_d[2]),
        .O(\diff2[3]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_4__0 
       (.I0(diff1[1]),
        .I1(diff1_d[1]),
        .O(\diff2[3]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_5__0 
       (.I0(diff1[0]),
        .I1(diff1_d[0]),
        .O(\diff2[3]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_2__0 
       (.I0(diff1[7]),
        .I1(diff1_d[7]),
        .O(\diff2[7]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_3__0 
       (.I0(diff1[6]),
        .I1(diff1_d[6]),
        .O(\diff2[7]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_4__0 
       (.I0(diff1[5]),
        .I1(diff1_d[5]),
        .O(\diff2[7]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_5__0 
       (.I0(diff1[4]),
        .I1(diff1_d[4]),
        .O(\diff2[7]_i_5__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[0]),
        .Q(diff2_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[10]),
        .Q(diff2_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[11]),
        .Q(diff2_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[12]),
        .Q(diff2_d[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[13]),
        .Q(diff2_d[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[14]),
        .Q(diff2_d[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[15]),
        .Q(diff2_d[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[16]),
        .Q(diff2_d[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[17]),
        .Q(diff2_d[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[18]),
        .Q(diff2_d[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[19]),
        .Q(diff2_d[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[1]),
        .Q(diff2_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[20]),
        .Q(diff2_d[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[21]),
        .Q(diff2_d[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[2]),
        .Q(diff2_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[3]),
        .Q(diff2_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[4]),
        .Q(diff2_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[5]),
        .Q(diff2_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[6]),
        .Q(diff2_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[7]),
        .Q(diff2_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[8]),
        .Q(diff2_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[9]),
        .Q(diff2_d[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[0]),
        .Q(diff2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[10]),
        .Q(diff2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[11]),
        .Q(diff2[11]),
        .R(1'b0));
  CARRY4 \diff2_reg[11]_i_1__0 
       (.CI(\diff2_reg[7]_i_1__0_n_0 ),
        .CO({\diff2_reg[11]_i_1__0_n_0 ,\diff2_reg[11]_i_1__0_n_1 ,\diff2_reg[11]_i_1__0_n_2 ,\diff2_reg[11]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[11:8]),
        .O(diff201_out[11:8]),
        .S({\diff2[11]_i_2__0_n_0 ,\diff2[11]_i_3__0_n_0 ,\diff2[11]_i_4__0_n_0 ,\diff2[11]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[12]),
        .Q(diff2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[13]),
        .Q(diff2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[14]),
        .Q(diff2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[15]),
        .Q(diff2[15]),
        .R(1'b0));
  CARRY4 \diff2_reg[15]_i_1__0 
       (.CI(\diff2_reg[11]_i_1__0_n_0 ),
        .CO({\diff2_reg[15]_i_1__0_n_0 ,\diff2_reg[15]_i_1__0_n_1 ,\diff2_reg[15]_i_1__0_n_2 ,\diff2_reg[15]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[15:12]),
        .O(diff201_out[15:12]),
        .S({\diff2[15]_i_2__0_n_0 ,\diff2[15]_i_3__0_n_0 ,\diff2[15]_i_4__0_n_0 ,\diff2[15]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[16]),
        .Q(diff2[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[17]),
        .Q(diff2[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[18]),
        .Q(diff2[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[19]),
        .Q(diff2[19]),
        .R(1'b0));
  CARRY4 \diff2_reg[19]_i_1__0 
       (.CI(\diff2_reg[15]_i_1__0_n_0 ),
        .CO({\diff2_reg[19]_i_1__0_n_0 ,\diff2_reg[19]_i_1__0_n_1 ,\diff2_reg[19]_i_1__0_n_2 ,\diff2_reg[19]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[19:16]),
        .O(diff201_out[19:16]),
        .S({\diff2[19]_i_2__0_n_0 ,\diff2[19]_i_3__0_n_0 ,\diff2[19]_i_4__0_n_0 ,\diff2[19]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[1]),
        .Q(diff2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[20]),
        .Q(diff2[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[21]),
        .Q(diff2[21]),
        .R(1'b0));
  CARRY4 \diff2_reg[21]_i_1__0 
       (.CI(\diff2_reg[19]_i_1__0_n_0 ),
        .CO({\NLW_diff2_reg[21]_i_1__0_CO_UNCONNECTED [3:1],\diff2_reg[21]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,diff1[20]}),
        .O({\NLW_diff2_reg[21]_i_1__0_O_UNCONNECTED [3:2],diff201_out[21:20]}),
        .S({1'b0,1'b0,\diff2[21]_i_2__0_n_0 ,\diff2[21]_i_3__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[2]),
        .Q(diff2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[3]),
        .Q(diff2[3]),
        .R(1'b0));
  CARRY4 \diff2_reg[3]_i_1__0 
       (.CI(1'b0),
        .CO({\diff2_reg[3]_i_1__0_n_0 ,\diff2_reg[3]_i_1__0_n_1 ,\diff2_reg[3]_i_1__0_n_2 ,\diff2_reg[3]_i_1__0_n_3 }),
        .CYINIT(1'b1),
        .DI(diff1[3:0]),
        .O(diff201_out[3:0]),
        .S({\diff2[3]_i_2__0_n_0 ,\diff2[3]_i_3__0_n_0 ,\diff2[3]_i_4__0_n_0 ,\diff2[3]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[4]),
        .Q(diff2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[5]),
        .Q(diff2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[6]),
        .Q(diff2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[7]),
        .Q(diff2[7]),
        .R(1'b0));
  CARRY4 \diff2_reg[7]_i_1__0 
       (.CI(\diff2_reg[3]_i_1__0_n_0 ),
        .CO({\diff2_reg[7]_i_1__0_n_0 ,\diff2_reg[7]_i_1__0_n_1 ,\diff2_reg[7]_i_1__0_n_2 ,\diff2_reg[7]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[7:4]),
        .O(diff201_out[7:4]),
        .S({\diff2[7]_i_2__0_n_0 ,\diff2[7]_i_3__0_n_0 ,\diff2[7]_i_4__0_n_0 ,\diff2[7]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[8]),
        .Q(diff2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[9]),
        .Q(diff2[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_2__0 
       (.I0(diff2[11]),
        .I1(diff2_d[11]),
        .O(\diff3[11]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_3__0 
       (.I0(diff2[10]),
        .I1(diff2_d[10]),
        .O(\diff3[11]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_4__0 
       (.I0(diff2[9]),
        .I1(diff2_d[9]),
        .O(\diff3[11]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_5__0 
       (.I0(diff2[8]),
        .I1(diff2_d[8]),
        .O(\diff3[11]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_2__0 
       (.I0(diff2[15]),
        .I1(diff2_d[15]),
        .O(\diff3[15]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_3__0 
       (.I0(diff2[14]),
        .I1(diff2_d[14]),
        .O(\diff3[15]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_4__0 
       (.I0(diff2[13]),
        .I1(diff2_d[13]),
        .O(\diff3[15]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_5__0 
       (.I0(diff2[12]),
        .I1(diff2_d[12]),
        .O(\diff3[15]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_2__0 
       (.I0(diff2[19]),
        .I1(diff2_d[19]),
        .O(\diff3[19]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_3__0 
       (.I0(diff2[18]),
        .I1(diff2_d[18]),
        .O(\diff3[19]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_4__0 
       (.I0(diff2[17]),
        .I1(diff2_d[17]),
        .O(\diff3[19]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_5__0 
       (.I0(diff2[16]),
        .I1(diff2_d[16]),
        .O(\diff3[19]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[21]_i_2__0 
       (.I0(diff2[21]),
        .I1(diff2_d[21]),
        .O(\diff3[21]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[21]_i_3__0 
       (.I0(diff2[20]),
        .I1(diff2_d[20]),
        .O(\diff3[21]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_10__0 
       (.I0(diff2[0]),
        .I1(diff2_d[0]),
        .O(\diff3[7]_i_10__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_3__0 
       (.I0(diff2[7]),
        .I1(diff2_d[7]),
        .O(\diff3[7]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_4__0 
       (.I0(diff2[6]),
        .I1(diff2_d[6]),
        .O(\diff3[7]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_5__0 
       (.I0(diff2[5]),
        .I1(diff2_d[5]),
        .O(\diff3[7]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_6__0 
       (.I0(diff2[4]),
        .I1(diff2_d[4]),
        .O(\diff3[7]_i_6__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_7__0 
       (.I0(diff2[3]),
        .I1(diff2_d[3]),
        .O(\diff3[7]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_8__0 
       (.I0(diff2[2]),
        .I1(diff2_d[2]),
        .O(\diff3[7]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_9__0 
       (.I0(diff2[1]),
        .I1(diff2_d[1]),
        .O(\diff3[7]_i_9__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[10]),
        .Q(data0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[11]),
        .Q(data0[3]),
        .R(1'b0));
  CARRY4 \diff3_reg[11]_i_1__0 
       (.CI(\diff3_reg[7]_i_1__0_n_0 ),
        .CO({\diff3_reg[11]_i_1__0_n_0 ,\diff3_reg[11]_i_1__0_n_1 ,\diff3_reg[11]_i_1__0_n_2 ,\diff3_reg[11]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[11:8]),
        .O(diff300_out[11:8]),
        .S({\diff3[11]_i_2__0_n_0 ,\diff3[11]_i_3__0_n_0 ,\diff3[11]_i_4__0_n_0 ,\diff3[11]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[12]),
        .Q(data0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[13]),
        .Q(data0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[14]),
        .Q(data0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[15]),
        .Q(data0[7]),
        .R(1'b0));
  CARRY4 \diff3_reg[15]_i_1__0 
       (.CI(\diff3_reg[11]_i_1__0_n_0 ),
        .CO({\diff3_reg[15]_i_1__0_n_0 ,\diff3_reg[15]_i_1__0_n_1 ,\diff3_reg[15]_i_1__0_n_2 ,\diff3_reg[15]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[15:12]),
        .O(diff300_out[15:12]),
        .S({\diff3[15]_i_2__0_n_0 ,\diff3[15]_i_3__0_n_0 ,\diff3[15]_i_4__0_n_0 ,\diff3[15]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[16]),
        .Q(data0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[17]),
        .Q(data0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[18]),
        .Q(data0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[19]),
        .Q(data0[11]),
        .R(1'b0));
  CARRY4 \diff3_reg[19]_i_1__0 
       (.CI(\diff3_reg[15]_i_1__0_n_0 ),
        .CO({\diff3_reg[19]_i_1__0_n_0 ,\diff3_reg[19]_i_1__0_n_1 ,\diff3_reg[19]_i_1__0_n_2 ,\diff3_reg[19]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[19:16]),
        .O(diff300_out[19:16]),
        .S({\diff3[19]_i_2__0_n_0 ,\diff3[19]_i_3__0_n_0 ,\diff3[19]_i_4__0_n_0 ,\diff3[19]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[20]),
        .Q(data0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[21]),
        .Q(data0[13]),
        .R(1'b0));
  CARRY4 \diff3_reg[21]_i_1__0 
       (.CI(\diff3_reg[19]_i_1__0_n_0 ),
        .CO({\NLW_diff3_reg[21]_i_1__0_CO_UNCONNECTED [3:1],\diff3_reg[21]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,diff2[20]}),
        .O({\NLW_diff3_reg[21]_i_1__0_O_UNCONNECTED [3:2],diff300_out[21:20]}),
        .S({1'b0,1'b0,\diff3[21]_i_2__0_n_0 ,\diff3[21]_i_3__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[5]),
        .Q(\diff3_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[6]),
        .Q(\diff3_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[7]),
        .Q(\diff3_reg_n_0_[7] ),
        .R(1'b0));
  CARRY4 \diff3_reg[7]_i_1__0 
       (.CI(\diff3_reg[7]_i_2__0_n_0 ),
        .CO({\diff3_reg[7]_i_1__0_n_0 ,\diff3_reg[7]_i_1__0_n_1 ,\diff3_reg[7]_i_1__0_n_2 ,\diff3_reg[7]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[7:4]),
        .O({diff300_out[7:5],\NLW_diff3_reg[7]_i_1__0_O_UNCONNECTED [0]}),
        .S({\diff3[7]_i_3__0_n_0 ,\diff3[7]_i_4__0_n_0 ,\diff3[7]_i_5__0_n_0 ,\diff3[7]_i_6__0_n_0 }));
  CARRY4 \diff3_reg[7]_i_2__0 
       (.CI(1'b0),
        .CO({\diff3_reg[7]_i_2__0_n_0 ,\diff3_reg[7]_i_2__0_n_1 ,\diff3_reg[7]_i_2__0_n_2 ,\diff3_reg[7]_i_2__0_n_3 }),
        .CYINIT(1'b1),
        .DI(diff2[3:0]),
        .O(\NLW_diff3_reg[7]_i_2__0_O_UNCONNECTED [3:0]),
        .S({\diff3[7]_i_7__0_n_0 ,\diff3[7]_i_8__0_n_0 ,\diff3[7]_i_9__0_n_0 ,\diff3[7]_i_10__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[8]),
        .Q(data0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[9]),
        .Q(data0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mdat_i_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(din),
        .Q(mdat_i),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \signed_gen[1].ch_s_data[1][15]_i_1 
       (.I0(\ch_data[1]_1 ),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    \tdata[0]_i_1__0 
       (.I0(\diff3_reg_n_0_[5] ),
        .I1(\tdata[0]_i_2__0_n_0 ),
        .I2(\tdata[0]_i_3__0_n_0 ),
        .I3(\tdata[0]_i_4__0_n_0 ),
        .I4(\tdata[0]_i_5__0_n_0 ),
        .O(p_1_in));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \tdata[0]_i_2__0 
       (.I0(data0[11]),
        .I1(data0[10]),
        .I2(data0[13]),
        .I3(data0[12]),
        .O(\tdata[0]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tdata[0]_i_3__0 
       (.I0(data0[1]),
        .I1(\diff3_reg_n_0_[6] ),
        .I2(data0[3]),
        .I3(data0[4]),
        .O(\tdata[0]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \tdata[0]_i_4__0 
       (.I0(data0[9]),
        .I1(data0[6]),
        .I2(data0[8]),
        .I3(data0[7]),
        .O(\tdata[0]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tdata[0]_i_5__0 
       (.I0(data0[0]),
        .I1(\diff3_reg_n_0_[7] ),
        .I2(data0[2]),
        .I3(data0[5]),
        .O(\tdata[0]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \tdata[15]_i_1__0 
       (.I0(\diff3_reg_n_0_[5] ),
        .I1(\tdata[0]_i_5__0_n_0 ),
        .I2(\tdata[0]_i_4__0_n_0 ),
        .I3(\tdata[0]_i_3__0_n_0 ),
        .I4(\tdata[0]_i_2__0_n_0 ),
        .I5(word_clk),
        .O(\tdata[15]_i_1__0_n_0 ));
  FDRE \tdata_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(p_1_in),
        .Q(D[0]),
        .R(1'b0));
  FDSE \tdata_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[7]),
        .Q(D[10]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[8]),
        .Q(D[11]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[9]),
        .Q(D[12]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[10]),
        .Q(D[13]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[11]),
        .Q(D[14]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[12]),
        .Q(\ch_data[1]_1 ),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(\diff3_reg_n_0_[6] ),
        .Q(D[1]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(\diff3_reg_n_0_[7] ),
        .Q(D[2]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[0]),
        .Q(D[3]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[1]),
        .Q(D[4]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[2]),
        .Q(D[5]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[3]),
        .Q(D[6]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[4]),
        .Q(D[7]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[5]),
        .Q(D[8]),
        .S(\tdata[15]_i_1__0_n_0 ));
  FDSE \tdata_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[6]),
        .Q(D[9]),
        .S(\tdata[15]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    word_clk_i_3__0
       (.I0(word_count_reg[15]),
        .O(word_clk_i_3__0_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_4__0
       (.I0(word_count_reg[13]),
        .I1(word_count_reg[14]),
        .I2(word_count_reg[12]),
        .O(word_clk_i_4__0_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_5__0
       (.I0(word_count_reg[10]),
        .I1(word_count_reg[11]),
        .I2(word_count_reg[9]),
        .O(word_clk_i_5__0_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_6__0
       (.I0(word_count_reg[6]),
        .I1(word_count_reg[7]),
        .I2(word_count_reg[8]),
        .O(word_clk_i_6__0_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    word_clk_i_7__0
       (.I0(word_count_reg[3]),
        .I1(word_count_reg[4]),
        .I2(word_count_reg[5]),
        .O(word_clk_i_7__0_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    word_clk_i_8__0
       (.I0(word_count_reg[1]),
        .I1(word_count_reg[2]),
        .I2(word_count_reg[0]),
        .O(word_clk_i_8__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    word_clk_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(word_clk0),
        .Q(word_clk),
        .R(1'b0));
  CARRY4 word_clk_reg_i_1__0
       (.CI(word_clk_reg_i_2__0_n_0),
        .CO({NLW_word_clk_reg_i_1__0_CO_UNCONNECTED[3:2],word_clk0,word_clk_reg_i_1__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_word_clk_reg_i_1__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,word_clk_i_3__0_n_0,word_clk_i_4__0_n_0}));
  CARRY4 word_clk_reg_i_2__0
       (.CI(1'b0),
        .CO({word_clk_reg_i_2__0_n_0,word_clk_reg_i_2__0_n_1,word_clk_reg_i_2__0_n_2,word_clk_reg_i_2__0_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_word_clk_reg_i_2__0_O_UNCONNECTED[3:0]),
        .S({word_clk_i_5__0_n_0,word_clk_i_6__0_n_0,word_clk_i_7__0_n_0,word_clk_i_8__0_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    \word_count[0]_i_10__0 
       (.I0(word_count_reg[10]),
        .I1(word_count_reg[11]),
        .I2(word_count_reg[9]),
        .O(\word_count[0]_i_10__0_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \word_count[0]_i_11__0 
       (.I0(word_count_reg[6]),
        .I1(word_count_reg[7]),
        .I2(word_count_reg[8]),
        .O(\word_count[0]_i_11__0_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \word_count[0]_i_12__0 
       (.I0(word_count_reg[3]),
        .I1(word_count_reg[4]),
        .I2(word_count_reg[5]),
        .O(\word_count[0]_i_12__0_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \word_count[0]_i_13__0 
       (.I0(word_count_reg[1]),
        .I1(word_count_reg[2]),
        .I2(word_count_reg[0]),
        .O(\word_count[0]_i_13__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \word_count[0]_i_4__0 
       (.I0(word_count_reg[15]),
        .O(\word_count[0]_i_4__0_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \word_count[0]_i_5__0 
       (.I0(word_count_reg[13]),
        .I1(word_count_reg[14]),
        .I2(word_count_reg[12]),
        .O(\word_count[0]_i_5__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_6__0 
       (.I0(word_count_reg[3]),
        .O(\word_count[0]_i_6__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_7__0 
       (.I0(word_count_reg[2]),
        .O(\word_count[0]_i_7__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_8__0 
       (.I0(word_count_reg[1]),
        .O(\word_count[0]_i_8__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \word_count[0]_i_9__0 
       (.I0(word_count_reg[0]),
        .O(\word_count[0]_i_9__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_2__0 
       (.I0(word_count_reg[15]),
        .O(\word_count[12]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_3__0 
       (.I0(word_count_reg[14]),
        .O(\word_count[12]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_4__0 
       (.I0(word_count_reg[13]),
        .O(\word_count[12]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_5__0 
       (.I0(word_count_reg[12]),
        .O(\word_count[12]_i_5__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_2__0 
       (.I0(word_count_reg[7]),
        .O(\word_count[4]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_3__0 
       (.I0(word_count_reg[6]),
        .O(\word_count[4]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_4__0 
       (.I0(word_count_reg[5]),
        .O(\word_count[4]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_5__0 
       (.I0(word_count_reg[4]),
        .O(\word_count[4]_i_5__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_2__0 
       (.I0(word_count_reg[11]),
        .O(\word_count[8]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_3__0 
       (.I0(word_count_reg[10]),
        .O(\word_count[8]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_4__0 
       (.I0(word_count_reg[9]),
        .O(\word_count[8]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_5__0 
       (.I0(word_count_reg[8]),
        .O(\word_count[8]_i_5__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__0_n_7 ),
        .Q(word_count_reg[0]),
        .R(word_count0));
  CARRY4 \word_count_reg[0]_i_1__0 
       (.CI(\word_count_reg[0]_i_3__0_n_0 ),
        .CO({\NLW_word_count_reg[0]_i_1__0_CO_UNCONNECTED [3:2],word_count0,\word_count_reg[0]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_word_count_reg[0]_i_1__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,\word_count[0]_i_4__0_n_0 ,\word_count[0]_i_5__0_n_0 }));
  CARRY4 \word_count_reg[0]_i_2__0 
       (.CI(1'b0),
        .CO({\word_count_reg[0]_i_2__0_n_0 ,\word_count_reg[0]_i_2__0_n_1 ,\word_count_reg[0]_i_2__0_n_2 ,\word_count_reg[0]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\word_count_reg[0]_i_2__0_n_4 ,\word_count_reg[0]_i_2__0_n_5 ,\word_count_reg[0]_i_2__0_n_6 ,\word_count_reg[0]_i_2__0_n_7 }),
        .S({\word_count[0]_i_6__0_n_0 ,\word_count[0]_i_7__0_n_0 ,\word_count[0]_i_8__0_n_0 ,\word_count[0]_i_9__0_n_0 }));
  CARRY4 \word_count_reg[0]_i_3__0 
       (.CI(1'b0),
        .CO({\word_count_reg[0]_i_3__0_n_0 ,\word_count_reg[0]_i_3__0_n_1 ,\word_count_reg[0]_i_3__0_n_2 ,\word_count_reg[0]_i_3__0_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_word_count_reg[0]_i_3__0_O_UNCONNECTED [3:0]),
        .S({\word_count[0]_i_10__0_n_0 ,\word_count[0]_i_11__0_n_0 ,\word_count[0]_i_12__0_n_0 ,\word_count[0]_i_13__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__0_n_5 ),
        .Q(word_count_reg[10]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__0_n_4 ),
        .Q(word_count_reg[11]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__0_n_7 ),
        .Q(word_count_reg[12]),
        .R(word_count0));
  CARRY4 \word_count_reg[12]_i_1__0 
       (.CI(\word_count_reg[8]_i_1__0_n_0 ),
        .CO({\NLW_word_count_reg[12]_i_1__0_CO_UNCONNECTED [3],\word_count_reg[12]_i_1__0_n_1 ,\word_count_reg[12]_i_1__0_n_2 ,\word_count_reg[12]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[12]_i_1__0_n_4 ,\word_count_reg[12]_i_1__0_n_5 ,\word_count_reg[12]_i_1__0_n_6 ,\word_count_reg[12]_i_1__0_n_7 }),
        .S({\word_count[12]_i_2__0_n_0 ,\word_count[12]_i_3__0_n_0 ,\word_count[12]_i_4__0_n_0 ,\word_count[12]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__0_n_6 ),
        .Q(word_count_reg[13]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__0_n_5 ),
        .Q(word_count_reg[14]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__0_n_4 ),
        .Q(word_count_reg[15]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__0_n_6 ),
        .Q(word_count_reg[1]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__0_n_5 ),
        .Q(word_count_reg[2]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__0_n_4 ),
        .Q(word_count_reg[3]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__0_n_7 ),
        .Q(word_count_reg[4]),
        .R(word_count0));
  CARRY4 \word_count_reg[4]_i_1__0 
       (.CI(\word_count_reg[0]_i_2__0_n_0 ),
        .CO({\word_count_reg[4]_i_1__0_n_0 ,\word_count_reg[4]_i_1__0_n_1 ,\word_count_reg[4]_i_1__0_n_2 ,\word_count_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[4]_i_1__0_n_4 ,\word_count_reg[4]_i_1__0_n_5 ,\word_count_reg[4]_i_1__0_n_6 ,\word_count_reg[4]_i_1__0_n_7 }),
        .S({\word_count[4]_i_2__0_n_0 ,\word_count[4]_i_3__0_n_0 ,\word_count[4]_i_4__0_n_0 ,\word_count[4]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__0_n_6 ),
        .Q(word_count_reg[5]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__0_n_5 ),
        .Q(word_count_reg[6]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__0_n_4 ),
        .Q(word_count_reg[7]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__0_n_7 ),
        .Q(word_count_reg[8]),
        .R(word_count0));
  CARRY4 \word_count_reg[8]_i_1__0 
       (.CI(\word_count_reg[4]_i_1__0_n_0 ),
        .CO({\word_count_reg[8]_i_1__0_n_0 ,\word_count_reg[8]_i_1__0_n_1 ,\word_count_reg[8]_i_1__0_n_2 ,\word_count_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[8]_i_1__0_n_4 ,\word_count_reg[8]_i_1__0_n_5 ,\word_count_reg[8]_i_1__0_n_6 ,\word_count_reg[8]_i_1__0_n_7 }),
        .S({\word_count[8]_i_2__0_n_0 ,\word_count[8]_i_3__0_n_0 ,\word_count[8]_i_4__0_n_0 ,\word_count[8]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__0_n_6 ),
        .Q(word_count_reg[9]),
        .R(word_count0));
endmodule

(* ORIG_REF_NAME = "sinc3" *) 
module zsys_axis_AD7403_0_0_sinc3_1
   (D,
    din,
    m_axis_aclk);
  output [15:0]D;
  input [0:0]din;
  input m_axis_aclk;

  wire [15:0]D;
  wire \acc1[0]_i_2__1_n_0 ;
  wire \acc1[0]_i_3__1_n_0 ;
  wire \acc1[0]_i_4__1_n_0 ;
  wire \acc1[0]_i_5__1_n_0 ;
  wire \acc1[12]_i_2__1_n_0 ;
  wire \acc1[12]_i_3__1_n_0 ;
  wire \acc1[12]_i_4__1_n_0 ;
  wire \acc1[12]_i_5__1_n_0 ;
  wire \acc1[16]_i_2__1_n_0 ;
  wire \acc1[16]_i_3__1_n_0 ;
  wire \acc1[16]_i_4__1_n_0 ;
  wire \acc1[16]_i_5__1_n_0 ;
  wire \acc1[20]_i_2__1_n_0 ;
  wire \acc1[20]_i_3__1_n_0 ;
  wire \acc1[4]_i_2__1_n_0 ;
  wire \acc1[4]_i_3__1_n_0 ;
  wire \acc1[4]_i_4__1_n_0 ;
  wire \acc1[4]_i_5__1_n_0 ;
  wire \acc1[8]_i_2__1_n_0 ;
  wire \acc1[8]_i_3__1_n_0 ;
  wire \acc1[8]_i_4__1_n_0 ;
  wire \acc1[8]_i_5__1_n_0 ;
  wire [21:0]acc1_reg;
  wire \acc1_reg[0]_i_1__1_n_0 ;
  wire \acc1_reg[0]_i_1__1_n_1 ;
  wire \acc1_reg[0]_i_1__1_n_2 ;
  wire \acc1_reg[0]_i_1__1_n_3 ;
  wire \acc1_reg[0]_i_1__1_n_4 ;
  wire \acc1_reg[0]_i_1__1_n_5 ;
  wire \acc1_reg[0]_i_1__1_n_6 ;
  wire \acc1_reg[0]_i_1__1_n_7 ;
  wire \acc1_reg[12]_i_1__1_n_0 ;
  wire \acc1_reg[12]_i_1__1_n_1 ;
  wire \acc1_reg[12]_i_1__1_n_2 ;
  wire \acc1_reg[12]_i_1__1_n_3 ;
  wire \acc1_reg[12]_i_1__1_n_4 ;
  wire \acc1_reg[12]_i_1__1_n_5 ;
  wire \acc1_reg[12]_i_1__1_n_6 ;
  wire \acc1_reg[12]_i_1__1_n_7 ;
  wire \acc1_reg[16]_i_1__1_n_0 ;
  wire \acc1_reg[16]_i_1__1_n_1 ;
  wire \acc1_reg[16]_i_1__1_n_2 ;
  wire \acc1_reg[16]_i_1__1_n_3 ;
  wire \acc1_reg[16]_i_1__1_n_4 ;
  wire \acc1_reg[16]_i_1__1_n_5 ;
  wire \acc1_reg[16]_i_1__1_n_6 ;
  wire \acc1_reg[16]_i_1__1_n_7 ;
  wire \acc1_reg[20]_i_1__1_n_3 ;
  wire \acc1_reg[20]_i_1__1_n_6 ;
  wire \acc1_reg[20]_i_1__1_n_7 ;
  wire \acc1_reg[4]_i_1__1_n_0 ;
  wire \acc1_reg[4]_i_1__1_n_1 ;
  wire \acc1_reg[4]_i_1__1_n_2 ;
  wire \acc1_reg[4]_i_1__1_n_3 ;
  wire \acc1_reg[4]_i_1__1_n_4 ;
  wire \acc1_reg[4]_i_1__1_n_5 ;
  wire \acc1_reg[4]_i_1__1_n_6 ;
  wire \acc1_reg[4]_i_1__1_n_7 ;
  wire \acc1_reg[8]_i_1__1_n_0 ;
  wire \acc1_reg[8]_i_1__1_n_1 ;
  wire \acc1_reg[8]_i_1__1_n_2 ;
  wire \acc1_reg[8]_i_1__1_n_3 ;
  wire \acc1_reg[8]_i_1__1_n_4 ;
  wire \acc1_reg[8]_i_1__1_n_5 ;
  wire \acc1_reg[8]_i_1__1_n_6 ;
  wire \acc1_reg[8]_i_1__1_n_7 ;
  wire \acc2[0]_i_2__1_n_0 ;
  wire \acc2[0]_i_3__1_n_0 ;
  wire \acc2[0]_i_4__1_n_0 ;
  wire \acc2[0]_i_5__1_n_0 ;
  wire \acc2[12]_i_2__1_n_0 ;
  wire \acc2[12]_i_3__1_n_0 ;
  wire \acc2[12]_i_4__1_n_0 ;
  wire \acc2[12]_i_5__1_n_0 ;
  wire \acc2[16]_i_2__1_n_0 ;
  wire \acc2[16]_i_3__1_n_0 ;
  wire \acc2[16]_i_4__1_n_0 ;
  wire \acc2[16]_i_5__1_n_0 ;
  wire \acc2[20]_i_2__1_n_0 ;
  wire \acc2[20]_i_3__1_n_0 ;
  wire \acc2[4]_i_2__1_n_0 ;
  wire \acc2[4]_i_3__1_n_0 ;
  wire \acc2[4]_i_4__1_n_0 ;
  wire \acc2[4]_i_5__1_n_0 ;
  wire \acc2[8]_i_2__1_n_0 ;
  wire \acc2[8]_i_3__1_n_0 ;
  wire \acc2[8]_i_4__1_n_0 ;
  wire \acc2[8]_i_5__1_n_0 ;
  wire [21:0]acc2_reg;
  wire \acc2_reg[0]_i_1__1_n_0 ;
  wire \acc2_reg[0]_i_1__1_n_1 ;
  wire \acc2_reg[0]_i_1__1_n_2 ;
  wire \acc2_reg[0]_i_1__1_n_3 ;
  wire \acc2_reg[0]_i_1__1_n_4 ;
  wire \acc2_reg[0]_i_1__1_n_5 ;
  wire \acc2_reg[0]_i_1__1_n_6 ;
  wire \acc2_reg[0]_i_1__1_n_7 ;
  wire \acc2_reg[12]_i_1__1_n_0 ;
  wire \acc2_reg[12]_i_1__1_n_1 ;
  wire \acc2_reg[12]_i_1__1_n_2 ;
  wire \acc2_reg[12]_i_1__1_n_3 ;
  wire \acc2_reg[12]_i_1__1_n_4 ;
  wire \acc2_reg[12]_i_1__1_n_5 ;
  wire \acc2_reg[12]_i_1__1_n_6 ;
  wire \acc2_reg[12]_i_1__1_n_7 ;
  wire \acc2_reg[16]_i_1__1_n_0 ;
  wire \acc2_reg[16]_i_1__1_n_1 ;
  wire \acc2_reg[16]_i_1__1_n_2 ;
  wire \acc2_reg[16]_i_1__1_n_3 ;
  wire \acc2_reg[16]_i_1__1_n_4 ;
  wire \acc2_reg[16]_i_1__1_n_5 ;
  wire \acc2_reg[16]_i_1__1_n_6 ;
  wire \acc2_reg[16]_i_1__1_n_7 ;
  wire \acc2_reg[20]_i_1__1_n_3 ;
  wire \acc2_reg[20]_i_1__1_n_6 ;
  wire \acc2_reg[20]_i_1__1_n_7 ;
  wire \acc2_reg[4]_i_1__1_n_0 ;
  wire \acc2_reg[4]_i_1__1_n_1 ;
  wire \acc2_reg[4]_i_1__1_n_2 ;
  wire \acc2_reg[4]_i_1__1_n_3 ;
  wire \acc2_reg[4]_i_1__1_n_4 ;
  wire \acc2_reg[4]_i_1__1_n_5 ;
  wire \acc2_reg[4]_i_1__1_n_6 ;
  wire \acc2_reg[4]_i_1__1_n_7 ;
  wire \acc2_reg[8]_i_1__1_n_0 ;
  wire \acc2_reg[8]_i_1__1_n_1 ;
  wire \acc2_reg[8]_i_1__1_n_2 ;
  wire \acc2_reg[8]_i_1__1_n_3 ;
  wire \acc2_reg[8]_i_1__1_n_4 ;
  wire \acc2_reg[8]_i_1__1_n_5 ;
  wire \acc2_reg[8]_i_1__1_n_6 ;
  wire \acc2_reg[8]_i_1__1_n_7 ;
  wire \acc3[0]_i_2__1_n_0 ;
  wire \acc3[0]_i_3__1_n_0 ;
  wire \acc3[0]_i_4__1_n_0 ;
  wire \acc3[0]_i_5__1_n_0 ;
  wire \acc3[12]_i_2__1_n_0 ;
  wire \acc3[12]_i_3__1_n_0 ;
  wire \acc3[12]_i_4__1_n_0 ;
  wire \acc3[12]_i_5__1_n_0 ;
  wire \acc3[16]_i_2__1_n_0 ;
  wire \acc3[16]_i_3__1_n_0 ;
  wire \acc3[16]_i_4__1_n_0 ;
  wire \acc3[16]_i_5__1_n_0 ;
  wire \acc3[20]_i_2__1_n_0 ;
  wire \acc3[20]_i_3__1_n_0 ;
  wire \acc3[4]_i_2__1_n_0 ;
  wire \acc3[4]_i_3__1_n_0 ;
  wire \acc3[4]_i_4__1_n_0 ;
  wire \acc3[4]_i_5__1_n_0 ;
  wire \acc3[8]_i_2__1_n_0 ;
  wire \acc3[8]_i_3__1_n_0 ;
  wire \acc3[8]_i_4__1_n_0 ;
  wire \acc3[8]_i_5__1_n_0 ;
  wire [21:0]acc3_d2;
  wire [21:0]acc3_reg;
  wire \acc3_reg[0]_i_1__1_n_0 ;
  wire \acc3_reg[0]_i_1__1_n_1 ;
  wire \acc3_reg[0]_i_1__1_n_2 ;
  wire \acc3_reg[0]_i_1__1_n_3 ;
  wire \acc3_reg[0]_i_1__1_n_4 ;
  wire \acc3_reg[0]_i_1__1_n_5 ;
  wire \acc3_reg[0]_i_1__1_n_6 ;
  wire \acc3_reg[0]_i_1__1_n_7 ;
  wire \acc3_reg[12]_i_1__1_n_0 ;
  wire \acc3_reg[12]_i_1__1_n_1 ;
  wire \acc3_reg[12]_i_1__1_n_2 ;
  wire \acc3_reg[12]_i_1__1_n_3 ;
  wire \acc3_reg[12]_i_1__1_n_4 ;
  wire \acc3_reg[12]_i_1__1_n_5 ;
  wire \acc3_reg[12]_i_1__1_n_6 ;
  wire \acc3_reg[12]_i_1__1_n_7 ;
  wire \acc3_reg[16]_i_1__1_n_0 ;
  wire \acc3_reg[16]_i_1__1_n_1 ;
  wire \acc3_reg[16]_i_1__1_n_2 ;
  wire \acc3_reg[16]_i_1__1_n_3 ;
  wire \acc3_reg[16]_i_1__1_n_4 ;
  wire \acc3_reg[16]_i_1__1_n_5 ;
  wire \acc3_reg[16]_i_1__1_n_6 ;
  wire \acc3_reg[16]_i_1__1_n_7 ;
  wire \acc3_reg[20]_i_1__1_n_3 ;
  wire \acc3_reg[20]_i_1__1_n_6 ;
  wire \acc3_reg[20]_i_1__1_n_7 ;
  wire \acc3_reg[4]_i_1__1_n_0 ;
  wire \acc3_reg[4]_i_1__1_n_1 ;
  wire \acc3_reg[4]_i_1__1_n_2 ;
  wire \acc3_reg[4]_i_1__1_n_3 ;
  wire \acc3_reg[4]_i_1__1_n_4 ;
  wire \acc3_reg[4]_i_1__1_n_5 ;
  wire \acc3_reg[4]_i_1__1_n_6 ;
  wire \acc3_reg[4]_i_1__1_n_7 ;
  wire \acc3_reg[8]_i_1__1_n_0 ;
  wire \acc3_reg[8]_i_1__1_n_1 ;
  wire \acc3_reg[8]_i_1__1_n_2 ;
  wire \acc3_reg[8]_i_1__1_n_3 ;
  wire \acc3_reg[8]_i_1__1_n_4 ;
  wire \acc3_reg[8]_i_1__1_n_5 ;
  wire \acc3_reg[8]_i_1__1_n_6 ;
  wire \acc3_reg[8]_i_1__1_n_7 ;
  wire [15:15]\ch_data[2]_2 ;
  wire [13:0]data0;
  wire [21:0]diff1;
  wire [21:0]diff102_out;
  wire \diff1[11]_i_2__1_n_0 ;
  wire \diff1[11]_i_3__1_n_0 ;
  wire \diff1[11]_i_4__1_n_0 ;
  wire \diff1[11]_i_5__1_n_0 ;
  wire \diff1[15]_i_2__1_n_0 ;
  wire \diff1[15]_i_3__1_n_0 ;
  wire \diff1[15]_i_4__1_n_0 ;
  wire \diff1[15]_i_5__1_n_0 ;
  wire \diff1[19]_i_2__1_n_0 ;
  wire \diff1[19]_i_3__1_n_0 ;
  wire \diff1[19]_i_4__1_n_0 ;
  wire \diff1[19]_i_5__1_n_0 ;
  wire \diff1[21]_i_2__1_n_0 ;
  wire \diff1[21]_i_3__1_n_0 ;
  wire \diff1[3]_i_2__1_n_0 ;
  wire \diff1[3]_i_3__1_n_0 ;
  wire \diff1[3]_i_4__1_n_0 ;
  wire \diff1[3]_i_5__1_n_0 ;
  wire \diff1[7]_i_2__1_n_0 ;
  wire \diff1[7]_i_3__1_n_0 ;
  wire \diff1[7]_i_4__1_n_0 ;
  wire \diff1[7]_i_5__1_n_0 ;
  wire [21:0]diff1_d;
  wire \diff1_reg[11]_i_1__1_n_0 ;
  wire \diff1_reg[11]_i_1__1_n_1 ;
  wire \diff1_reg[11]_i_1__1_n_2 ;
  wire \diff1_reg[11]_i_1__1_n_3 ;
  wire \diff1_reg[15]_i_1__1_n_0 ;
  wire \diff1_reg[15]_i_1__1_n_1 ;
  wire \diff1_reg[15]_i_1__1_n_2 ;
  wire \diff1_reg[15]_i_1__1_n_3 ;
  wire \diff1_reg[19]_i_1__1_n_0 ;
  wire \diff1_reg[19]_i_1__1_n_1 ;
  wire \diff1_reg[19]_i_1__1_n_2 ;
  wire \diff1_reg[19]_i_1__1_n_3 ;
  wire \diff1_reg[21]_i_1__1_n_3 ;
  wire \diff1_reg[3]_i_1__1_n_0 ;
  wire \diff1_reg[3]_i_1__1_n_1 ;
  wire \diff1_reg[3]_i_1__1_n_2 ;
  wire \diff1_reg[3]_i_1__1_n_3 ;
  wire \diff1_reg[7]_i_1__1_n_0 ;
  wire \diff1_reg[7]_i_1__1_n_1 ;
  wire \diff1_reg[7]_i_1__1_n_2 ;
  wire \diff1_reg[7]_i_1__1_n_3 ;
  wire [21:0]diff2;
  wire [21:0]diff201_out;
  wire \diff2[11]_i_2__1_n_0 ;
  wire \diff2[11]_i_3__1_n_0 ;
  wire \diff2[11]_i_4__1_n_0 ;
  wire \diff2[11]_i_5__1_n_0 ;
  wire \diff2[15]_i_2__1_n_0 ;
  wire \diff2[15]_i_3__1_n_0 ;
  wire \diff2[15]_i_4__1_n_0 ;
  wire \diff2[15]_i_5__1_n_0 ;
  wire \diff2[19]_i_2__1_n_0 ;
  wire \diff2[19]_i_3__1_n_0 ;
  wire \diff2[19]_i_4__1_n_0 ;
  wire \diff2[19]_i_5__1_n_0 ;
  wire \diff2[21]_i_2__1_n_0 ;
  wire \diff2[21]_i_3__1_n_0 ;
  wire \diff2[3]_i_2__1_n_0 ;
  wire \diff2[3]_i_3__1_n_0 ;
  wire \diff2[3]_i_4__1_n_0 ;
  wire \diff2[3]_i_5__1_n_0 ;
  wire \diff2[7]_i_2__1_n_0 ;
  wire \diff2[7]_i_3__1_n_0 ;
  wire \diff2[7]_i_4__1_n_0 ;
  wire \diff2[7]_i_5__1_n_0 ;
  wire [21:0]diff2_d;
  wire \diff2_reg[11]_i_1__1_n_0 ;
  wire \diff2_reg[11]_i_1__1_n_1 ;
  wire \diff2_reg[11]_i_1__1_n_2 ;
  wire \diff2_reg[11]_i_1__1_n_3 ;
  wire \diff2_reg[15]_i_1__1_n_0 ;
  wire \diff2_reg[15]_i_1__1_n_1 ;
  wire \diff2_reg[15]_i_1__1_n_2 ;
  wire \diff2_reg[15]_i_1__1_n_3 ;
  wire \diff2_reg[19]_i_1__1_n_0 ;
  wire \diff2_reg[19]_i_1__1_n_1 ;
  wire \diff2_reg[19]_i_1__1_n_2 ;
  wire \diff2_reg[19]_i_1__1_n_3 ;
  wire \diff2_reg[21]_i_1__1_n_3 ;
  wire \diff2_reg[3]_i_1__1_n_0 ;
  wire \diff2_reg[3]_i_1__1_n_1 ;
  wire \diff2_reg[3]_i_1__1_n_2 ;
  wire \diff2_reg[3]_i_1__1_n_3 ;
  wire \diff2_reg[7]_i_1__1_n_0 ;
  wire \diff2_reg[7]_i_1__1_n_1 ;
  wire \diff2_reg[7]_i_1__1_n_2 ;
  wire \diff2_reg[7]_i_1__1_n_3 ;
  wire [21:5]diff300_out;
  wire \diff3[11]_i_2__1_n_0 ;
  wire \diff3[11]_i_3__1_n_0 ;
  wire \diff3[11]_i_4__1_n_0 ;
  wire \diff3[11]_i_5__1_n_0 ;
  wire \diff3[15]_i_2__1_n_0 ;
  wire \diff3[15]_i_3__1_n_0 ;
  wire \diff3[15]_i_4__1_n_0 ;
  wire \diff3[15]_i_5__1_n_0 ;
  wire \diff3[19]_i_2__1_n_0 ;
  wire \diff3[19]_i_3__1_n_0 ;
  wire \diff3[19]_i_4__1_n_0 ;
  wire \diff3[19]_i_5__1_n_0 ;
  wire \diff3[21]_i_2__1_n_0 ;
  wire \diff3[21]_i_3__1_n_0 ;
  wire \diff3[7]_i_10__1_n_0 ;
  wire \diff3[7]_i_3__1_n_0 ;
  wire \diff3[7]_i_4__1_n_0 ;
  wire \diff3[7]_i_5__1_n_0 ;
  wire \diff3[7]_i_6__1_n_0 ;
  wire \diff3[7]_i_7__1_n_0 ;
  wire \diff3[7]_i_8__1_n_0 ;
  wire \diff3[7]_i_9__1_n_0 ;
  wire \diff3_reg[11]_i_1__1_n_0 ;
  wire \diff3_reg[11]_i_1__1_n_1 ;
  wire \diff3_reg[11]_i_1__1_n_2 ;
  wire \diff3_reg[11]_i_1__1_n_3 ;
  wire \diff3_reg[15]_i_1__1_n_0 ;
  wire \diff3_reg[15]_i_1__1_n_1 ;
  wire \diff3_reg[15]_i_1__1_n_2 ;
  wire \diff3_reg[15]_i_1__1_n_3 ;
  wire \diff3_reg[19]_i_1__1_n_0 ;
  wire \diff3_reg[19]_i_1__1_n_1 ;
  wire \diff3_reg[19]_i_1__1_n_2 ;
  wire \diff3_reg[19]_i_1__1_n_3 ;
  wire \diff3_reg[21]_i_1__1_n_3 ;
  wire \diff3_reg[7]_i_1__1_n_0 ;
  wire \diff3_reg[7]_i_1__1_n_1 ;
  wire \diff3_reg[7]_i_1__1_n_2 ;
  wire \diff3_reg[7]_i_1__1_n_3 ;
  wire \diff3_reg[7]_i_2__1_n_0 ;
  wire \diff3_reg[7]_i_2__1_n_1 ;
  wire \diff3_reg[7]_i_2__1_n_2 ;
  wire \diff3_reg[7]_i_2__1_n_3 ;
  wire \diff3_reg_n_0_[5] ;
  wire \diff3_reg_n_0_[6] ;
  wire \diff3_reg_n_0_[7] ;
  wire [0:0]din;
  wire m_axis_aclk;
  wire mdat_i;
  wire [0:0]p_1_in;
  wire \tdata[0]_i_2__1_n_0 ;
  wire \tdata[0]_i_3__1_n_0 ;
  wire \tdata[0]_i_4__1_n_0 ;
  wire \tdata[0]_i_5__1_n_0 ;
  wire \tdata[15]_i_1__1_n_0 ;
  wire word_clk;
  wire word_clk0;
  wire word_clk_i_3__1_n_0;
  wire word_clk_i_4__1_n_0;
  wire word_clk_i_5__1_n_0;
  wire word_clk_i_6__1_n_0;
  wire word_clk_i_7__1_n_0;
  wire word_clk_i_8__1_n_0;
  wire word_clk_reg_i_1__1_n_3;
  wire word_clk_reg_i_2__1_n_0;
  wire word_clk_reg_i_2__1_n_1;
  wire word_clk_reg_i_2__1_n_2;
  wire word_clk_reg_i_2__1_n_3;
  wire word_count0;
  wire \word_count[0]_i_10__1_n_0 ;
  wire \word_count[0]_i_11__1_n_0 ;
  wire \word_count[0]_i_12__1_n_0 ;
  wire \word_count[0]_i_13__1_n_0 ;
  wire \word_count[0]_i_4__1_n_0 ;
  wire \word_count[0]_i_5__1_n_0 ;
  wire \word_count[0]_i_6__1_n_0 ;
  wire \word_count[0]_i_7__1_n_0 ;
  wire \word_count[0]_i_8__1_n_0 ;
  wire \word_count[0]_i_9__1_n_0 ;
  wire \word_count[12]_i_2__1_n_0 ;
  wire \word_count[12]_i_3__1_n_0 ;
  wire \word_count[12]_i_4__1_n_0 ;
  wire \word_count[12]_i_5__1_n_0 ;
  wire \word_count[4]_i_2__1_n_0 ;
  wire \word_count[4]_i_3__1_n_0 ;
  wire \word_count[4]_i_4__1_n_0 ;
  wire \word_count[4]_i_5__1_n_0 ;
  wire \word_count[8]_i_2__1_n_0 ;
  wire \word_count[8]_i_3__1_n_0 ;
  wire \word_count[8]_i_4__1_n_0 ;
  wire \word_count[8]_i_5__1_n_0 ;
  wire [15:0]word_count_reg;
  wire \word_count_reg[0]_i_1__1_n_3 ;
  wire \word_count_reg[0]_i_2__1_n_0 ;
  wire \word_count_reg[0]_i_2__1_n_1 ;
  wire \word_count_reg[0]_i_2__1_n_2 ;
  wire \word_count_reg[0]_i_2__1_n_3 ;
  wire \word_count_reg[0]_i_2__1_n_4 ;
  wire \word_count_reg[0]_i_2__1_n_5 ;
  wire \word_count_reg[0]_i_2__1_n_6 ;
  wire \word_count_reg[0]_i_2__1_n_7 ;
  wire \word_count_reg[0]_i_3__1_n_0 ;
  wire \word_count_reg[0]_i_3__1_n_1 ;
  wire \word_count_reg[0]_i_3__1_n_2 ;
  wire \word_count_reg[0]_i_3__1_n_3 ;
  wire \word_count_reg[12]_i_1__1_n_1 ;
  wire \word_count_reg[12]_i_1__1_n_2 ;
  wire \word_count_reg[12]_i_1__1_n_3 ;
  wire \word_count_reg[12]_i_1__1_n_4 ;
  wire \word_count_reg[12]_i_1__1_n_5 ;
  wire \word_count_reg[12]_i_1__1_n_6 ;
  wire \word_count_reg[12]_i_1__1_n_7 ;
  wire \word_count_reg[4]_i_1__1_n_0 ;
  wire \word_count_reg[4]_i_1__1_n_1 ;
  wire \word_count_reg[4]_i_1__1_n_2 ;
  wire \word_count_reg[4]_i_1__1_n_3 ;
  wire \word_count_reg[4]_i_1__1_n_4 ;
  wire \word_count_reg[4]_i_1__1_n_5 ;
  wire \word_count_reg[4]_i_1__1_n_6 ;
  wire \word_count_reg[4]_i_1__1_n_7 ;
  wire \word_count_reg[8]_i_1__1_n_0 ;
  wire \word_count_reg[8]_i_1__1_n_1 ;
  wire \word_count_reg[8]_i_1__1_n_2 ;
  wire \word_count_reg[8]_i_1__1_n_3 ;
  wire \word_count_reg[8]_i_1__1_n_4 ;
  wire \word_count_reg[8]_i_1__1_n_5 ;
  wire \word_count_reg[8]_i_1__1_n_6 ;
  wire \word_count_reg[8]_i_1__1_n_7 ;
  wire [3:1]\NLW_acc1_reg[20]_i_1__1_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc1_reg[20]_i_1__1_O_UNCONNECTED ;
  wire [3:1]\NLW_acc2_reg[20]_i_1__1_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc2_reg[20]_i_1__1_O_UNCONNECTED ;
  wire [3:1]\NLW_acc3_reg[20]_i_1__1_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc3_reg[20]_i_1__1_O_UNCONNECTED ;
  wire [3:1]\NLW_diff1_reg[21]_i_1__1_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff1_reg[21]_i_1__1_O_UNCONNECTED ;
  wire [3:1]\NLW_diff2_reg[21]_i_1__1_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff2_reg[21]_i_1__1_O_UNCONNECTED ;
  wire [3:1]\NLW_diff3_reg[21]_i_1__1_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff3_reg[21]_i_1__1_O_UNCONNECTED ;
  wire [0:0]\NLW_diff3_reg[7]_i_1__1_O_UNCONNECTED ;
  wire [3:0]\NLW_diff3_reg[7]_i_2__1_O_UNCONNECTED ;
  wire [3:2]NLW_word_clk_reg_i_1__1_CO_UNCONNECTED;
  wire [3:0]NLW_word_clk_reg_i_1__1_O_UNCONNECTED;
  wire [3:0]NLW_word_clk_reg_i_2__1_O_UNCONNECTED;
  wire [3:2]\NLW_word_count_reg[0]_i_1__1_CO_UNCONNECTED ;
  wire [3:0]\NLW_word_count_reg[0]_i_1__1_O_UNCONNECTED ;
  wire [3:0]\NLW_word_count_reg[0]_i_3__1_O_UNCONNECTED ;
  wire [3:3]\NLW_word_count_reg[12]_i_1__1_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_2__1 
       (.I0(acc1_reg[3]),
        .O(\acc1[0]_i_2__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_3__1 
       (.I0(acc1_reg[2]),
        .O(\acc1[0]_i_3__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_4__1 
       (.I0(acc1_reg[1]),
        .O(\acc1[0]_i_4__1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \acc1[0]_i_5__1 
       (.I0(acc1_reg[0]),
        .O(\acc1[0]_i_5__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_2__1 
       (.I0(acc1_reg[15]),
        .O(\acc1[12]_i_2__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_3__1 
       (.I0(acc1_reg[14]),
        .O(\acc1[12]_i_3__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_4__1 
       (.I0(acc1_reg[13]),
        .O(\acc1[12]_i_4__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_5__1 
       (.I0(acc1_reg[12]),
        .O(\acc1[12]_i_5__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_2__1 
       (.I0(acc1_reg[19]),
        .O(\acc1[16]_i_2__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_3__1 
       (.I0(acc1_reg[18]),
        .O(\acc1[16]_i_3__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_4__1 
       (.I0(acc1_reg[17]),
        .O(\acc1[16]_i_4__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_5__1 
       (.I0(acc1_reg[16]),
        .O(\acc1[16]_i_5__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[20]_i_2__1 
       (.I0(acc1_reg[21]),
        .O(\acc1[20]_i_2__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[20]_i_3__1 
       (.I0(acc1_reg[20]),
        .O(\acc1[20]_i_3__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_2__1 
       (.I0(acc1_reg[7]),
        .O(\acc1[4]_i_2__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_3__1 
       (.I0(acc1_reg[6]),
        .O(\acc1[4]_i_3__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_4__1 
       (.I0(acc1_reg[5]),
        .O(\acc1[4]_i_4__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_5__1 
       (.I0(acc1_reg[4]),
        .O(\acc1[4]_i_5__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_2__1 
       (.I0(acc1_reg[11]),
        .O(\acc1[8]_i_2__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_3__1 
       (.I0(acc1_reg[10]),
        .O(\acc1[8]_i_3__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_4__1 
       (.I0(acc1_reg[9]),
        .O(\acc1[8]_i_4__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_5__1 
       (.I0(acc1_reg[8]),
        .O(\acc1[8]_i_5__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[0] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__1_n_7 ),
        .Q(acc1_reg[0]),
        .R(1'b0));
  CARRY4 \acc1_reg[0]_i_1__1 
       (.CI(1'b0),
        .CO({\acc1_reg[0]_i_1__1_n_0 ,\acc1_reg[0]_i_1__1_n_1 ,\acc1_reg[0]_i_1__1_n_2 ,\acc1_reg[0]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\acc1_reg[0]_i_1__1_n_4 ,\acc1_reg[0]_i_1__1_n_5 ,\acc1_reg[0]_i_1__1_n_6 ,\acc1_reg[0]_i_1__1_n_7 }),
        .S({\acc1[0]_i_2__1_n_0 ,\acc1[0]_i_3__1_n_0 ,\acc1[0]_i_4__1_n_0 ,\acc1[0]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[10] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__1_n_5 ),
        .Q(acc1_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[11] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__1_n_4 ),
        .Q(acc1_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[12] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__1_n_7 ),
        .Q(acc1_reg[12]),
        .R(1'b0));
  CARRY4 \acc1_reg[12]_i_1__1 
       (.CI(\acc1_reg[8]_i_1__1_n_0 ),
        .CO({\acc1_reg[12]_i_1__1_n_0 ,\acc1_reg[12]_i_1__1_n_1 ,\acc1_reg[12]_i_1__1_n_2 ,\acc1_reg[12]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[12]_i_1__1_n_4 ,\acc1_reg[12]_i_1__1_n_5 ,\acc1_reg[12]_i_1__1_n_6 ,\acc1_reg[12]_i_1__1_n_7 }),
        .S({\acc1[12]_i_2__1_n_0 ,\acc1[12]_i_3__1_n_0 ,\acc1[12]_i_4__1_n_0 ,\acc1[12]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[13] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__1_n_6 ),
        .Q(acc1_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[14] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__1_n_5 ),
        .Q(acc1_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[15] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__1_n_4 ),
        .Q(acc1_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[16] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__1_n_7 ),
        .Q(acc1_reg[16]),
        .R(1'b0));
  CARRY4 \acc1_reg[16]_i_1__1 
       (.CI(\acc1_reg[12]_i_1__1_n_0 ),
        .CO({\acc1_reg[16]_i_1__1_n_0 ,\acc1_reg[16]_i_1__1_n_1 ,\acc1_reg[16]_i_1__1_n_2 ,\acc1_reg[16]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[16]_i_1__1_n_4 ,\acc1_reg[16]_i_1__1_n_5 ,\acc1_reg[16]_i_1__1_n_6 ,\acc1_reg[16]_i_1__1_n_7 }),
        .S({\acc1[16]_i_2__1_n_0 ,\acc1[16]_i_3__1_n_0 ,\acc1[16]_i_4__1_n_0 ,\acc1[16]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[17] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__1_n_6 ),
        .Q(acc1_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[18] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__1_n_5 ),
        .Q(acc1_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[19] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__1_n_4 ),
        .Q(acc1_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[1] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__1_n_6 ),
        .Q(acc1_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[20] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[20]_i_1__1_n_7 ),
        .Q(acc1_reg[20]),
        .R(1'b0));
  CARRY4 \acc1_reg[20]_i_1__1 
       (.CI(\acc1_reg[16]_i_1__1_n_0 ),
        .CO({\NLW_acc1_reg[20]_i_1__1_CO_UNCONNECTED [3:1],\acc1_reg[20]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_acc1_reg[20]_i_1__1_O_UNCONNECTED [3:2],\acc1_reg[20]_i_1__1_n_6 ,\acc1_reg[20]_i_1__1_n_7 }),
        .S({1'b0,1'b0,\acc1[20]_i_2__1_n_0 ,\acc1[20]_i_3__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[21] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[20]_i_1__1_n_6 ),
        .Q(acc1_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[2] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__1_n_5 ),
        .Q(acc1_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[3] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__1_n_4 ),
        .Q(acc1_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[4] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__1_n_7 ),
        .Q(acc1_reg[4]),
        .R(1'b0));
  CARRY4 \acc1_reg[4]_i_1__1 
       (.CI(\acc1_reg[0]_i_1__1_n_0 ),
        .CO({\acc1_reg[4]_i_1__1_n_0 ,\acc1_reg[4]_i_1__1_n_1 ,\acc1_reg[4]_i_1__1_n_2 ,\acc1_reg[4]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[4]_i_1__1_n_4 ,\acc1_reg[4]_i_1__1_n_5 ,\acc1_reg[4]_i_1__1_n_6 ,\acc1_reg[4]_i_1__1_n_7 }),
        .S({\acc1[4]_i_2__1_n_0 ,\acc1[4]_i_3__1_n_0 ,\acc1[4]_i_4__1_n_0 ,\acc1[4]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[5] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__1_n_6 ),
        .Q(acc1_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[6] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__1_n_5 ),
        .Q(acc1_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[7] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__1_n_4 ),
        .Q(acc1_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[8] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__1_n_7 ),
        .Q(acc1_reg[8]),
        .R(1'b0));
  CARRY4 \acc1_reg[8]_i_1__1 
       (.CI(\acc1_reg[4]_i_1__1_n_0 ),
        .CO({\acc1_reg[8]_i_1__1_n_0 ,\acc1_reg[8]_i_1__1_n_1 ,\acc1_reg[8]_i_1__1_n_2 ,\acc1_reg[8]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[8]_i_1__1_n_4 ,\acc1_reg[8]_i_1__1_n_5 ,\acc1_reg[8]_i_1__1_n_6 ,\acc1_reg[8]_i_1__1_n_7 }),
        .S({\acc1[8]_i_2__1_n_0 ,\acc1[8]_i_3__1_n_0 ,\acc1[8]_i_4__1_n_0 ,\acc1[8]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[9] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__1_n_6 ),
        .Q(acc1_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_2__1 
       (.I0(acc1_reg[3]),
        .I1(acc2_reg[3]),
        .O(\acc2[0]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_3__1 
       (.I0(acc1_reg[2]),
        .I1(acc2_reg[2]),
        .O(\acc2[0]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_4__1 
       (.I0(acc1_reg[1]),
        .I1(acc2_reg[1]),
        .O(\acc2[0]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_5__1 
       (.I0(acc1_reg[0]),
        .I1(acc2_reg[0]),
        .O(\acc2[0]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_2__1 
       (.I0(acc1_reg[15]),
        .I1(acc2_reg[15]),
        .O(\acc2[12]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_3__1 
       (.I0(acc1_reg[14]),
        .I1(acc2_reg[14]),
        .O(\acc2[12]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_4__1 
       (.I0(acc1_reg[13]),
        .I1(acc2_reg[13]),
        .O(\acc2[12]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_5__1 
       (.I0(acc1_reg[12]),
        .I1(acc2_reg[12]),
        .O(\acc2[12]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_2__1 
       (.I0(acc1_reg[19]),
        .I1(acc2_reg[19]),
        .O(\acc2[16]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_3__1 
       (.I0(acc1_reg[18]),
        .I1(acc2_reg[18]),
        .O(\acc2[16]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_4__1 
       (.I0(acc1_reg[17]),
        .I1(acc2_reg[17]),
        .O(\acc2[16]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_5__1 
       (.I0(acc1_reg[16]),
        .I1(acc2_reg[16]),
        .O(\acc2[16]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[20]_i_2__1 
       (.I0(acc2_reg[21]),
        .I1(acc1_reg[21]),
        .O(\acc2[20]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[20]_i_3__1 
       (.I0(acc1_reg[20]),
        .I1(acc2_reg[20]),
        .O(\acc2[20]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_2__1 
       (.I0(acc1_reg[7]),
        .I1(acc2_reg[7]),
        .O(\acc2[4]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_3__1 
       (.I0(acc1_reg[6]),
        .I1(acc2_reg[6]),
        .O(\acc2[4]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_4__1 
       (.I0(acc1_reg[5]),
        .I1(acc2_reg[5]),
        .O(\acc2[4]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_5__1 
       (.I0(acc1_reg[4]),
        .I1(acc2_reg[4]),
        .O(\acc2[4]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_2__1 
       (.I0(acc1_reg[11]),
        .I1(acc2_reg[11]),
        .O(\acc2[8]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_3__1 
       (.I0(acc1_reg[10]),
        .I1(acc2_reg[10]),
        .O(\acc2[8]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_4__1 
       (.I0(acc1_reg[9]),
        .I1(acc2_reg[9]),
        .O(\acc2[8]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_5__1 
       (.I0(acc1_reg[8]),
        .I1(acc2_reg[8]),
        .O(\acc2[8]_i_5__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__1_n_7 ),
        .Q(acc2_reg[0]),
        .R(1'b0));
  CARRY4 \acc2_reg[0]_i_1__1 
       (.CI(1'b0),
        .CO({\acc2_reg[0]_i_1__1_n_0 ,\acc2_reg[0]_i_1__1_n_1 ,\acc2_reg[0]_i_1__1_n_2 ,\acc2_reg[0]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[3:0]),
        .O({\acc2_reg[0]_i_1__1_n_4 ,\acc2_reg[0]_i_1__1_n_5 ,\acc2_reg[0]_i_1__1_n_6 ,\acc2_reg[0]_i_1__1_n_7 }),
        .S({\acc2[0]_i_2__1_n_0 ,\acc2[0]_i_3__1_n_0 ,\acc2[0]_i_4__1_n_0 ,\acc2[0]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__1_n_5 ),
        .Q(acc2_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__1_n_4 ),
        .Q(acc2_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__1_n_7 ),
        .Q(acc2_reg[12]),
        .R(1'b0));
  CARRY4 \acc2_reg[12]_i_1__1 
       (.CI(\acc2_reg[8]_i_1__1_n_0 ),
        .CO({\acc2_reg[12]_i_1__1_n_0 ,\acc2_reg[12]_i_1__1_n_1 ,\acc2_reg[12]_i_1__1_n_2 ,\acc2_reg[12]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[15:12]),
        .O({\acc2_reg[12]_i_1__1_n_4 ,\acc2_reg[12]_i_1__1_n_5 ,\acc2_reg[12]_i_1__1_n_6 ,\acc2_reg[12]_i_1__1_n_7 }),
        .S({\acc2[12]_i_2__1_n_0 ,\acc2[12]_i_3__1_n_0 ,\acc2[12]_i_4__1_n_0 ,\acc2[12]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__1_n_6 ),
        .Q(acc2_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__1_n_5 ),
        .Q(acc2_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__1_n_4 ),
        .Q(acc2_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[16] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__1_n_7 ),
        .Q(acc2_reg[16]),
        .R(1'b0));
  CARRY4 \acc2_reg[16]_i_1__1 
       (.CI(\acc2_reg[12]_i_1__1_n_0 ),
        .CO({\acc2_reg[16]_i_1__1_n_0 ,\acc2_reg[16]_i_1__1_n_1 ,\acc2_reg[16]_i_1__1_n_2 ,\acc2_reg[16]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[19:16]),
        .O({\acc2_reg[16]_i_1__1_n_4 ,\acc2_reg[16]_i_1__1_n_5 ,\acc2_reg[16]_i_1__1_n_6 ,\acc2_reg[16]_i_1__1_n_7 }),
        .S({\acc2[16]_i_2__1_n_0 ,\acc2[16]_i_3__1_n_0 ,\acc2[16]_i_4__1_n_0 ,\acc2[16]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[17] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__1_n_6 ),
        .Q(acc2_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[18] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__1_n_5 ),
        .Q(acc2_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[19] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__1_n_4 ),
        .Q(acc2_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__1_n_6 ),
        .Q(acc2_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[20] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[20]_i_1__1_n_7 ),
        .Q(acc2_reg[20]),
        .R(1'b0));
  CARRY4 \acc2_reg[20]_i_1__1 
       (.CI(\acc2_reg[16]_i_1__1_n_0 ),
        .CO({\NLW_acc2_reg[20]_i_1__1_CO_UNCONNECTED [3:1],\acc2_reg[20]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc1_reg[20]}),
        .O({\NLW_acc2_reg[20]_i_1__1_O_UNCONNECTED [3:2],\acc2_reg[20]_i_1__1_n_6 ,\acc2_reg[20]_i_1__1_n_7 }),
        .S({1'b0,1'b0,\acc2[20]_i_2__1_n_0 ,\acc2[20]_i_3__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[21] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[20]_i_1__1_n_6 ),
        .Q(acc2_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__1_n_5 ),
        .Q(acc2_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__1_n_4 ),
        .Q(acc2_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__1_n_7 ),
        .Q(acc2_reg[4]),
        .R(1'b0));
  CARRY4 \acc2_reg[4]_i_1__1 
       (.CI(\acc2_reg[0]_i_1__1_n_0 ),
        .CO({\acc2_reg[4]_i_1__1_n_0 ,\acc2_reg[4]_i_1__1_n_1 ,\acc2_reg[4]_i_1__1_n_2 ,\acc2_reg[4]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[7:4]),
        .O({\acc2_reg[4]_i_1__1_n_4 ,\acc2_reg[4]_i_1__1_n_5 ,\acc2_reg[4]_i_1__1_n_6 ,\acc2_reg[4]_i_1__1_n_7 }),
        .S({\acc2[4]_i_2__1_n_0 ,\acc2[4]_i_3__1_n_0 ,\acc2[4]_i_4__1_n_0 ,\acc2[4]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__1_n_6 ),
        .Q(acc2_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__1_n_5 ),
        .Q(acc2_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__1_n_4 ),
        .Q(acc2_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__1_n_7 ),
        .Q(acc2_reg[8]),
        .R(1'b0));
  CARRY4 \acc2_reg[8]_i_1__1 
       (.CI(\acc2_reg[4]_i_1__1_n_0 ),
        .CO({\acc2_reg[8]_i_1__1_n_0 ,\acc2_reg[8]_i_1__1_n_1 ,\acc2_reg[8]_i_1__1_n_2 ,\acc2_reg[8]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[11:8]),
        .O({\acc2_reg[8]_i_1__1_n_4 ,\acc2_reg[8]_i_1__1_n_5 ,\acc2_reg[8]_i_1__1_n_6 ,\acc2_reg[8]_i_1__1_n_7 }),
        .S({\acc2[8]_i_2__1_n_0 ,\acc2[8]_i_3__1_n_0 ,\acc2[8]_i_4__1_n_0 ,\acc2[8]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__1_n_6 ),
        .Q(acc2_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_2__1 
       (.I0(acc2_reg[3]),
        .I1(acc3_reg[3]),
        .O(\acc3[0]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_3__1 
       (.I0(acc2_reg[2]),
        .I1(acc3_reg[2]),
        .O(\acc3[0]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_4__1 
       (.I0(acc2_reg[1]),
        .I1(acc3_reg[1]),
        .O(\acc3[0]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_5__1 
       (.I0(acc2_reg[0]),
        .I1(acc3_reg[0]),
        .O(\acc3[0]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_2__1 
       (.I0(acc2_reg[15]),
        .I1(acc3_reg[15]),
        .O(\acc3[12]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_3__1 
       (.I0(acc2_reg[14]),
        .I1(acc3_reg[14]),
        .O(\acc3[12]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_4__1 
       (.I0(acc2_reg[13]),
        .I1(acc3_reg[13]),
        .O(\acc3[12]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_5__1 
       (.I0(acc2_reg[12]),
        .I1(acc3_reg[12]),
        .O(\acc3[12]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_2__1 
       (.I0(acc2_reg[19]),
        .I1(acc3_reg[19]),
        .O(\acc3[16]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_3__1 
       (.I0(acc2_reg[18]),
        .I1(acc3_reg[18]),
        .O(\acc3[16]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_4__1 
       (.I0(acc2_reg[17]),
        .I1(acc3_reg[17]),
        .O(\acc3[16]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_5__1 
       (.I0(acc2_reg[16]),
        .I1(acc3_reg[16]),
        .O(\acc3[16]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[20]_i_2__1 
       (.I0(acc2_reg[21]),
        .I1(acc3_reg[21]),
        .O(\acc3[20]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[20]_i_3__1 
       (.I0(acc2_reg[20]),
        .I1(acc3_reg[20]),
        .O(\acc3[20]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_2__1 
       (.I0(acc2_reg[7]),
        .I1(acc3_reg[7]),
        .O(\acc3[4]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_3__1 
       (.I0(acc2_reg[6]),
        .I1(acc3_reg[6]),
        .O(\acc3[4]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_4__1 
       (.I0(acc2_reg[5]),
        .I1(acc3_reg[5]),
        .O(\acc3[4]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_5__1 
       (.I0(acc2_reg[4]),
        .I1(acc3_reg[4]),
        .O(\acc3[4]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_2__1 
       (.I0(acc2_reg[11]),
        .I1(acc3_reg[11]),
        .O(\acc3[8]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_3__1 
       (.I0(acc2_reg[10]),
        .I1(acc3_reg[10]),
        .O(\acc3[8]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_4__1 
       (.I0(acc2_reg[9]),
        .I1(acc3_reg[9]),
        .O(\acc3[8]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_5__1 
       (.I0(acc2_reg[8]),
        .I1(acc3_reg[8]),
        .O(\acc3[8]_i_5__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[0]),
        .Q(acc3_d2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[10]),
        .Q(acc3_d2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[11]),
        .Q(acc3_d2[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[12]),
        .Q(acc3_d2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[13]),
        .Q(acc3_d2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[14]),
        .Q(acc3_d2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[15]),
        .Q(acc3_d2[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[16]),
        .Q(acc3_d2[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[17]),
        .Q(acc3_d2[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[18]),
        .Q(acc3_d2[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[19]),
        .Q(acc3_d2[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[1]),
        .Q(acc3_d2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[20]),
        .Q(acc3_d2[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[21]),
        .Q(acc3_d2[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[2]),
        .Q(acc3_d2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[3]),
        .Q(acc3_d2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[4]),
        .Q(acc3_d2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[5]),
        .Q(acc3_d2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[6]),
        .Q(acc3_d2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[7]),
        .Q(acc3_d2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[8]),
        .Q(acc3_d2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[9]),
        .Q(acc3_d2[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__1_n_7 ),
        .Q(acc3_reg[0]),
        .R(1'b0));
  CARRY4 \acc3_reg[0]_i_1__1 
       (.CI(1'b0),
        .CO({\acc3_reg[0]_i_1__1_n_0 ,\acc3_reg[0]_i_1__1_n_1 ,\acc3_reg[0]_i_1__1_n_2 ,\acc3_reg[0]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[3:0]),
        .O({\acc3_reg[0]_i_1__1_n_4 ,\acc3_reg[0]_i_1__1_n_5 ,\acc3_reg[0]_i_1__1_n_6 ,\acc3_reg[0]_i_1__1_n_7 }),
        .S({\acc3[0]_i_2__1_n_0 ,\acc3[0]_i_3__1_n_0 ,\acc3[0]_i_4__1_n_0 ,\acc3[0]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__1_n_5 ),
        .Q(acc3_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__1_n_4 ),
        .Q(acc3_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__1_n_7 ),
        .Q(acc3_reg[12]),
        .R(1'b0));
  CARRY4 \acc3_reg[12]_i_1__1 
       (.CI(\acc3_reg[8]_i_1__1_n_0 ),
        .CO({\acc3_reg[12]_i_1__1_n_0 ,\acc3_reg[12]_i_1__1_n_1 ,\acc3_reg[12]_i_1__1_n_2 ,\acc3_reg[12]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[15:12]),
        .O({\acc3_reg[12]_i_1__1_n_4 ,\acc3_reg[12]_i_1__1_n_5 ,\acc3_reg[12]_i_1__1_n_6 ,\acc3_reg[12]_i_1__1_n_7 }),
        .S({\acc3[12]_i_2__1_n_0 ,\acc3[12]_i_3__1_n_0 ,\acc3[12]_i_4__1_n_0 ,\acc3[12]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__1_n_6 ),
        .Q(acc3_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__1_n_5 ),
        .Q(acc3_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__1_n_4 ),
        .Q(acc3_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[16] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__1_n_7 ),
        .Q(acc3_reg[16]),
        .R(1'b0));
  CARRY4 \acc3_reg[16]_i_1__1 
       (.CI(\acc3_reg[12]_i_1__1_n_0 ),
        .CO({\acc3_reg[16]_i_1__1_n_0 ,\acc3_reg[16]_i_1__1_n_1 ,\acc3_reg[16]_i_1__1_n_2 ,\acc3_reg[16]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[19:16]),
        .O({\acc3_reg[16]_i_1__1_n_4 ,\acc3_reg[16]_i_1__1_n_5 ,\acc3_reg[16]_i_1__1_n_6 ,\acc3_reg[16]_i_1__1_n_7 }),
        .S({\acc3[16]_i_2__1_n_0 ,\acc3[16]_i_3__1_n_0 ,\acc3[16]_i_4__1_n_0 ,\acc3[16]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[17] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__1_n_6 ),
        .Q(acc3_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[18] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__1_n_5 ),
        .Q(acc3_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[19] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__1_n_4 ),
        .Q(acc3_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__1_n_6 ),
        .Q(acc3_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[20] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[20]_i_1__1_n_7 ),
        .Q(acc3_reg[20]),
        .R(1'b0));
  CARRY4 \acc3_reg[20]_i_1__1 
       (.CI(\acc3_reg[16]_i_1__1_n_0 ),
        .CO({\NLW_acc3_reg[20]_i_1__1_CO_UNCONNECTED [3:1],\acc3_reg[20]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc2_reg[20]}),
        .O({\NLW_acc3_reg[20]_i_1__1_O_UNCONNECTED [3:2],\acc3_reg[20]_i_1__1_n_6 ,\acc3_reg[20]_i_1__1_n_7 }),
        .S({1'b0,1'b0,\acc3[20]_i_2__1_n_0 ,\acc3[20]_i_3__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[21] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[20]_i_1__1_n_6 ),
        .Q(acc3_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__1_n_5 ),
        .Q(acc3_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__1_n_4 ),
        .Q(acc3_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__1_n_7 ),
        .Q(acc3_reg[4]),
        .R(1'b0));
  CARRY4 \acc3_reg[4]_i_1__1 
       (.CI(\acc3_reg[0]_i_1__1_n_0 ),
        .CO({\acc3_reg[4]_i_1__1_n_0 ,\acc3_reg[4]_i_1__1_n_1 ,\acc3_reg[4]_i_1__1_n_2 ,\acc3_reg[4]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[7:4]),
        .O({\acc3_reg[4]_i_1__1_n_4 ,\acc3_reg[4]_i_1__1_n_5 ,\acc3_reg[4]_i_1__1_n_6 ,\acc3_reg[4]_i_1__1_n_7 }),
        .S({\acc3[4]_i_2__1_n_0 ,\acc3[4]_i_3__1_n_0 ,\acc3[4]_i_4__1_n_0 ,\acc3[4]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__1_n_6 ),
        .Q(acc3_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__1_n_5 ),
        .Q(acc3_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__1_n_4 ),
        .Q(acc3_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__1_n_7 ),
        .Q(acc3_reg[8]),
        .R(1'b0));
  CARRY4 \acc3_reg[8]_i_1__1 
       (.CI(\acc3_reg[4]_i_1__1_n_0 ),
        .CO({\acc3_reg[8]_i_1__1_n_0 ,\acc3_reg[8]_i_1__1_n_1 ,\acc3_reg[8]_i_1__1_n_2 ,\acc3_reg[8]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[11:8]),
        .O({\acc3_reg[8]_i_1__1_n_4 ,\acc3_reg[8]_i_1__1_n_5 ,\acc3_reg[8]_i_1__1_n_6 ,\acc3_reg[8]_i_1__1_n_7 }),
        .S({\acc3[8]_i_2__1_n_0 ,\acc3[8]_i_3__1_n_0 ,\acc3[8]_i_4__1_n_0 ,\acc3[8]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__1_n_6 ),
        .Q(acc3_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_2__1 
       (.I0(acc3_reg[11]),
        .I1(acc3_d2[11]),
        .O(\diff1[11]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_3__1 
       (.I0(acc3_reg[10]),
        .I1(acc3_d2[10]),
        .O(\diff1[11]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_4__1 
       (.I0(acc3_reg[9]),
        .I1(acc3_d2[9]),
        .O(\diff1[11]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_5__1 
       (.I0(acc3_reg[8]),
        .I1(acc3_d2[8]),
        .O(\diff1[11]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_2__1 
       (.I0(acc3_reg[15]),
        .I1(acc3_d2[15]),
        .O(\diff1[15]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_3__1 
       (.I0(acc3_reg[14]),
        .I1(acc3_d2[14]),
        .O(\diff1[15]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_4__1 
       (.I0(acc3_reg[13]),
        .I1(acc3_d2[13]),
        .O(\diff1[15]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_5__1 
       (.I0(acc3_reg[12]),
        .I1(acc3_d2[12]),
        .O(\diff1[15]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_2__1 
       (.I0(acc3_reg[19]),
        .I1(acc3_d2[19]),
        .O(\diff1[19]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_3__1 
       (.I0(acc3_reg[18]),
        .I1(acc3_d2[18]),
        .O(\diff1[19]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_4__1 
       (.I0(acc3_reg[17]),
        .I1(acc3_d2[17]),
        .O(\diff1[19]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_5__1 
       (.I0(acc3_reg[16]),
        .I1(acc3_d2[16]),
        .O(\diff1[19]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[21]_i_2__1 
       (.I0(acc3_reg[21]),
        .I1(acc3_d2[21]),
        .O(\diff1[21]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[21]_i_3__1 
       (.I0(acc3_reg[20]),
        .I1(acc3_d2[20]),
        .O(\diff1[21]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_2__1 
       (.I0(acc3_reg[3]),
        .I1(acc3_d2[3]),
        .O(\diff1[3]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_3__1 
       (.I0(acc3_reg[2]),
        .I1(acc3_d2[2]),
        .O(\diff1[3]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_4__1 
       (.I0(acc3_reg[1]),
        .I1(acc3_d2[1]),
        .O(\diff1[3]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_5__1 
       (.I0(acc3_reg[0]),
        .I1(acc3_d2[0]),
        .O(\diff1[3]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_2__1 
       (.I0(acc3_reg[7]),
        .I1(acc3_d2[7]),
        .O(\diff1[7]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_3__1 
       (.I0(acc3_reg[6]),
        .I1(acc3_d2[6]),
        .O(\diff1[7]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_4__1 
       (.I0(acc3_reg[5]),
        .I1(acc3_d2[5]),
        .O(\diff1[7]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_5__1 
       (.I0(acc3_reg[4]),
        .I1(acc3_d2[4]),
        .O(\diff1[7]_i_5__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[0]),
        .Q(diff1_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[10]),
        .Q(diff1_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[11]),
        .Q(diff1_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[12]),
        .Q(diff1_d[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[13]),
        .Q(diff1_d[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[14]),
        .Q(diff1_d[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[15]),
        .Q(diff1_d[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[16]),
        .Q(diff1_d[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[17]),
        .Q(diff1_d[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[18]),
        .Q(diff1_d[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[19]),
        .Q(diff1_d[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[1]),
        .Q(diff1_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[20]),
        .Q(diff1_d[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[21]),
        .Q(diff1_d[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[2]),
        .Q(diff1_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[3]),
        .Q(diff1_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[4]),
        .Q(diff1_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[5]),
        .Q(diff1_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[6]),
        .Q(diff1_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[7]),
        .Q(diff1_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[8]),
        .Q(diff1_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[9]),
        .Q(diff1_d[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[0]),
        .Q(diff1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[10]),
        .Q(diff1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[11]),
        .Q(diff1[11]),
        .R(1'b0));
  CARRY4 \diff1_reg[11]_i_1__1 
       (.CI(\diff1_reg[7]_i_1__1_n_0 ),
        .CO({\diff1_reg[11]_i_1__1_n_0 ,\diff1_reg[11]_i_1__1_n_1 ,\diff1_reg[11]_i_1__1_n_2 ,\diff1_reg[11]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[11:8]),
        .O(diff102_out[11:8]),
        .S({\diff1[11]_i_2__1_n_0 ,\diff1[11]_i_3__1_n_0 ,\diff1[11]_i_4__1_n_0 ,\diff1[11]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[12]),
        .Q(diff1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[13]),
        .Q(diff1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[14]),
        .Q(diff1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[15]),
        .Q(diff1[15]),
        .R(1'b0));
  CARRY4 \diff1_reg[15]_i_1__1 
       (.CI(\diff1_reg[11]_i_1__1_n_0 ),
        .CO({\diff1_reg[15]_i_1__1_n_0 ,\diff1_reg[15]_i_1__1_n_1 ,\diff1_reg[15]_i_1__1_n_2 ,\diff1_reg[15]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[15:12]),
        .O(diff102_out[15:12]),
        .S({\diff1[15]_i_2__1_n_0 ,\diff1[15]_i_3__1_n_0 ,\diff1[15]_i_4__1_n_0 ,\diff1[15]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[16]),
        .Q(diff1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[17]),
        .Q(diff1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[18]),
        .Q(diff1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[19]),
        .Q(diff1[19]),
        .R(1'b0));
  CARRY4 \diff1_reg[19]_i_1__1 
       (.CI(\diff1_reg[15]_i_1__1_n_0 ),
        .CO({\diff1_reg[19]_i_1__1_n_0 ,\diff1_reg[19]_i_1__1_n_1 ,\diff1_reg[19]_i_1__1_n_2 ,\diff1_reg[19]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[19:16]),
        .O(diff102_out[19:16]),
        .S({\diff1[19]_i_2__1_n_0 ,\diff1[19]_i_3__1_n_0 ,\diff1[19]_i_4__1_n_0 ,\diff1[19]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[1]),
        .Q(diff1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[20]),
        .Q(diff1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[21]),
        .Q(diff1[21]),
        .R(1'b0));
  CARRY4 \diff1_reg[21]_i_1__1 
       (.CI(\diff1_reg[19]_i_1__1_n_0 ),
        .CO({\NLW_diff1_reg[21]_i_1__1_CO_UNCONNECTED [3:1],\diff1_reg[21]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc3_reg[20]}),
        .O({\NLW_diff1_reg[21]_i_1__1_O_UNCONNECTED [3:2],diff102_out[21:20]}),
        .S({1'b0,1'b0,\diff1[21]_i_2__1_n_0 ,\diff1[21]_i_3__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[2]),
        .Q(diff1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[3]),
        .Q(diff1[3]),
        .R(1'b0));
  CARRY4 \diff1_reg[3]_i_1__1 
       (.CI(1'b0),
        .CO({\diff1_reg[3]_i_1__1_n_0 ,\diff1_reg[3]_i_1__1_n_1 ,\diff1_reg[3]_i_1__1_n_2 ,\diff1_reg[3]_i_1__1_n_3 }),
        .CYINIT(1'b1),
        .DI(acc3_reg[3:0]),
        .O(diff102_out[3:0]),
        .S({\diff1[3]_i_2__1_n_0 ,\diff1[3]_i_3__1_n_0 ,\diff1[3]_i_4__1_n_0 ,\diff1[3]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[4]),
        .Q(diff1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[5]),
        .Q(diff1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[6]),
        .Q(diff1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[7]),
        .Q(diff1[7]),
        .R(1'b0));
  CARRY4 \diff1_reg[7]_i_1__1 
       (.CI(\diff1_reg[3]_i_1__1_n_0 ),
        .CO({\diff1_reg[7]_i_1__1_n_0 ,\diff1_reg[7]_i_1__1_n_1 ,\diff1_reg[7]_i_1__1_n_2 ,\diff1_reg[7]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[7:4]),
        .O(diff102_out[7:4]),
        .S({\diff1[7]_i_2__1_n_0 ,\diff1[7]_i_3__1_n_0 ,\diff1[7]_i_4__1_n_0 ,\diff1[7]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[8]),
        .Q(diff1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[9]),
        .Q(diff1[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_2__1 
       (.I0(diff1[11]),
        .I1(diff1_d[11]),
        .O(\diff2[11]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_3__1 
       (.I0(diff1[10]),
        .I1(diff1_d[10]),
        .O(\diff2[11]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_4__1 
       (.I0(diff1[9]),
        .I1(diff1_d[9]),
        .O(\diff2[11]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_5__1 
       (.I0(diff1[8]),
        .I1(diff1_d[8]),
        .O(\diff2[11]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_2__1 
       (.I0(diff1[15]),
        .I1(diff1_d[15]),
        .O(\diff2[15]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_3__1 
       (.I0(diff1[14]),
        .I1(diff1_d[14]),
        .O(\diff2[15]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_4__1 
       (.I0(diff1[13]),
        .I1(diff1_d[13]),
        .O(\diff2[15]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_5__1 
       (.I0(diff1[12]),
        .I1(diff1_d[12]),
        .O(\diff2[15]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_2__1 
       (.I0(diff1[19]),
        .I1(diff1_d[19]),
        .O(\diff2[19]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_3__1 
       (.I0(diff1[18]),
        .I1(diff1_d[18]),
        .O(\diff2[19]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_4__1 
       (.I0(diff1[17]),
        .I1(diff1_d[17]),
        .O(\diff2[19]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_5__1 
       (.I0(diff1[16]),
        .I1(diff1_d[16]),
        .O(\diff2[19]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[21]_i_2__1 
       (.I0(diff1[21]),
        .I1(diff1_d[21]),
        .O(\diff2[21]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[21]_i_3__1 
       (.I0(diff1[20]),
        .I1(diff1_d[20]),
        .O(\diff2[21]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_2__1 
       (.I0(diff1[3]),
        .I1(diff1_d[3]),
        .O(\diff2[3]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_3__1 
       (.I0(diff1[2]),
        .I1(diff1_d[2]),
        .O(\diff2[3]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_4__1 
       (.I0(diff1[1]),
        .I1(diff1_d[1]),
        .O(\diff2[3]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_5__1 
       (.I0(diff1[0]),
        .I1(diff1_d[0]),
        .O(\diff2[3]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_2__1 
       (.I0(diff1[7]),
        .I1(diff1_d[7]),
        .O(\diff2[7]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_3__1 
       (.I0(diff1[6]),
        .I1(diff1_d[6]),
        .O(\diff2[7]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_4__1 
       (.I0(diff1[5]),
        .I1(diff1_d[5]),
        .O(\diff2[7]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_5__1 
       (.I0(diff1[4]),
        .I1(diff1_d[4]),
        .O(\diff2[7]_i_5__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[0]),
        .Q(diff2_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[10]),
        .Q(diff2_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[11]),
        .Q(diff2_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[12]),
        .Q(diff2_d[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[13]),
        .Q(diff2_d[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[14]),
        .Q(diff2_d[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[15]),
        .Q(diff2_d[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[16]),
        .Q(diff2_d[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[17]),
        .Q(diff2_d[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[18]),
        .Q(diff2_d[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[19]),
        .Q(diff2_d[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[1]),
        .Q(diff2_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[20]),
        .Q(diff2_d[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[21]),
        .Q(diff2_d[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[2]),
        .Q(diff2_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[3]),
        .Q(diff2_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[4]),
        .Q(diff2_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[5]),
        .Q(diff2_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[6]),
        .Q(diff2_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[7]),
        .Q(diff2_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[8]),
        .Q(diff2_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[9]),
        .Q(diff2_d[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[0]),
        .Q(diff2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[10]),
        .Q(diff2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[11]),
        .Q(diff2[11]),
        .R(1'b0));
  CARRY4 \diff2_reg[11]_i_1__1 
       (.CI(\diff2_reg[7]_i_1__1_n_0 ),
        .CO({\diff2_reg[11]_i_1__1_n_0 ,\diff2_reg[11]_i_1__1_n_1 ,\diff2_reg[11]_i_1__1_n_2 ,\diff2_reg[11]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[11:8]),
        .O(diff201_out[11:8]),
        .S({\diff2[11]_i_2__1_n_0 ,\diff2[11]_i_3__1_n_0 ,\diff2[11]_i_4__1_n_0 ,\diff2[11]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[12]),
        .Q(diff2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[13]),
        .Q(diff2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[14]),
        .Q(diff2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[15]),
        .Q(diff2[15]),
        .R(1'b0));
  CARRY4 \diff2_reg[15]_i_1__1 
       (.CI(\diff2_reg[11]_i_1__1_n_0 ),
        .CO({\diff2_reg[15]_i_1__1_n_0 ,\diff2_reg[15]_i_1__1_n_1 ,\diff2_reg[15]_i_1__1_n_2 ,\diff2_reg[15]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[15:12]),
        .O(diff201_out[15:12]),
        .S({\diff2[15]_i_2__1_n_0 ,\diff2[15]_i_3__1_n_0 ,\diff2[15]_i_4__1_n_0 ,\diff2[15]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[16]),
        .Q(diff2[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[17]),
        .Q(diff2[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[18]),
        .Q(diff2[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[19]),
        .Q(diff2[19]),
        .R(1'b0));
  CARRY4 \diff2_reg[19]_i_1__1 
       (.CI(\diff2_reg[15]_i_1__1_n_0 ),
        .CO({\diff2_reg[19]_i_1__1_n_0 ,\diff2_reg[19]_i_1__1_n_1 ,\diff2_reg[19]_i_1__1_n_2 ,\diff2_reg[19]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[19:16]),
        .O(diff201_out[19:16]),
        .S({\diff2[19]_i_2__1_n_0 ,\diff2[19]_i_3__1_n_0 ,\diff2[19]_i_4__1_n_0 ,\diff2[19]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[1]),
        .Q(diff2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[20]),
        .Q(diff2[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[21]),
        .Q(diff2[21]),
        .R(1'b0));
  CARRY4 \diff2_reg[21]_i_1__1 
       (.CI(\diff2_reg[19]_i_1__1_n_0 ),
        .CO({\NLW_diff2_reg[21]_i_1__1_CO_UNCONNECTED [3:1],\diff2_reg[21]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,diff1[20]}),
        .O({\NLW_diff2_reg[21]_i_1__1_O_UNCONNECTED [3:2],diff201_out[21:20]}),
        .S({1'b0,1'b0,\diff2[21]_i_2__1_n_0 ,\diff2[21]_i_3__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[2]),
        .Q(diff2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[3]),
        .Q(diff2[3]),
        .R(1'b0));
  CARRY4 \diff2_reg[3]_i_1__1 
       (.CI(1'b0),
        .CO({\diff2_reg[3]_i_1__1_n_0 ,\diff2_reg[3]_i_1__1_n_1 ,\diff2_reg[3]_i_1__1_n_2 ,\diff2_reg[3]_i_1__1_n_3 }),
        .CYINIT(1'b1),
        .DI(diff1[3:0]),
        .O(diff201_out[3:0]),
        .S({\diff2[3]_i_2__1_n_0 ,\diff2[3]_i_3__1_n_0 ,\diff2[3]_i_4__1_n_0 ,\diff2[3]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[4]),
        .Q(diff2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[5]),
        .Q(diff2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[6]),
        .Q(diff2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[7]),
        .Q(diff2[7]),
        .R(1'b0));
  CARRY4 \diff2_reg[7]_i_1__1 
       (.CI(\diff2_reg[3]_i_1__1_n_0 ),
        .CO({\diff2_reg[7]_i_1__1_n_0 ,\diff2_reg[7]_i_1__1_n_1 ,\diff2_reg[7]_i_1__1_n_2 ,\diff2_reg[7]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[7:4]),
        .O(diff201_out[7:4]),
        .S({\diff2[7]_i_2__1_n_0 ,\diff2[7]_i_3__1_n_0 ,\diff2[7]_i_4__1_n_0 ,\diff2[7]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[8]),
        .Q(diff2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[9]),
        .Q(diff2[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_2__1 
       (.I0(diff2[11]),
        .I1(diff2_d[11]),
        .O(\diff3[11]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_3__1 
       (.I0(diff2[10]),
        .I1(diff2_d[10]),
        .O(\diff3[11]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_4__1 
       (.I0(diff2[9]),
        .I1(diff2_d[9]),
        .O(\diff3[11]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_5__1 
       (.I0(diff2[8]),
        .I1(diff2_d[8]),
        .O(\diff3[11]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_2__1 
       (.I0(diff2[15]),
        .I1(diff2_d[15]),
        .O(\diff3[15]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_3__1 
       (.I0(diff2[14]),
        .I1(diff2_d[14]),
        .O(\diff3[15]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_4__1 
       (.I0(diff2[13]),
        .I1(diff2_d[13]),
        .O(\diff3[15]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_5__1 
       (.I0(diff2[12]),
        .I1(diff2_d[12]),
        .O(\diff3[15]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_2__1 
       (.I0(diff2[19]),
        .I1(diff2_d[19]),
        .O(\diff3[19]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_3__1 
       (.I0(diff2[18]),
        .I1(diff2_d[18]),
        .O(\diff3[19]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_4__1 
       (.I0(diff2[17]),
        .I1(diff2_d[17]),
        .O(\diff3[19]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_5__1 
       (.I0(diff2[16]),
        .I1(diff2_d[16]),
        .O(\diff3[19]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[21]_i_2__1 
       (.I0(diff2[21]),
        .I1(diff2_d[21]),
        .O(\diff3[21]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[21]_i_3__1 
       (.I0(diff2[20]),
        .I1(diff2_d[20]),
        .O(\diff3[21]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_10__1 
       (.I0(diff2[0]),
        .I1(diff2_d[0]),
        .O(\diff3[7]_i_10__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_3__1 
       (.I0(diff2[7]),
        .I1(diff2_d[7]),
        .O(\diff3[7]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_4__1 
       (.I0(diff2[6]),
        .I1(diff2_d[6]),
        .O(\diff3[7]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_5__1 
       (.I0(diff2[5]),
        .I1(diff2_d[5]),
        .O(\diff3[7]_i_5__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_6__1 
       (.I0(diff2[4]),
        .I1(diff2_d[4]),
        .O(\diff3[7]_i_6__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_7__1 
       (.I0(diff2[3]),
        .I1(diff2_d[3]),
        .O(\diff3[7]_i_7__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_8__1 
       (.I0(diff2[2]),
        .I1(diff2_d[2]),
        .O(\diff3[7]_i_8__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_9__1 
       (.I0(diff2[1]),
        .I1(diff2_d[1]),
        .O(\diff3[7]_i_9__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[10]),
        .Q(data0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[11]),
        .Q(data0[3]),
        .R(1'b0));
  CARRY4 \diff3_reg[11]_i_1__1 
       (.CI(\diff3_reg[7]_i_1__1_n_0 ),
        .CO({\diff3_reg[11]_i_1__1_n_0 ,\diff3_reg[11]_i_1__1_n_1 ,\diff3_reg[11]_i_1__1_n_2 ,\diff3_reg[11]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[11:8]),
        .O(diff300_out[11:8]),
        .S({\diff3[11]_i_2__1_n_0 ,\diff3[11]_i_3__1_n_0 ,\diff3[11]_i_4__1_n_0 ,\diff3[11]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[12]),
        .Q(data0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[13]),
        .Q(data0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[14]),
        .Q(data0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[15]),
        .Q(data0[7]),
        .R(1'b0));
  CARRY4 \diff3_reg[15]_i_1__1 
       (.CI(\diff3_reg[11]_i_1__1_n_0 ),
        .CO({\diff3_reg[15]_i_1__1_n_0 ,\diff3_reg[15]_i_1__1_n_1 ,\diff3_reg[15]_i_1__1_n_2 ,\diff3_reg[15]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[15:12]),
        .O(diff300_out[15:12]),
        .S({\diff3[15]_i_2__1_n_0 ,\diff3[15]_i_3__1_n_0 ,\diff3[15]_i_4__1_n_0 ,\diff3[15]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[16]),
        .Q(data0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[17]),
        .Q(data0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[18]),
        .Q(data0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[19]),
        .Q(data0[11]),
        .R(1'b0));
  CARRY4 \diff3_reg[19]_i_1__1 
       (.CI(\diff3_reg[15]_i_1__1_n_0 ),
        .CO({\diff3_reg[19]_i_1__1_n_0 ,\diff3_reg[19]_i_1__1_n_1 ,\diff3_reg[19]_i_1__1_n_2 ,\diff3_reg[19]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[19:16]),
        .O(diff300_out[19:16]),
        .S({\diff3[19]_i_2__1_n_0 ,\diff3[19]_i_3__1_n_0 ,\diff3[19]_i_4__1_n_0 ,\diff3[19]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[20]),
        .Q(data0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[21]),
        .Q(data0[13]),
        .R(1'b0));
  CARRY4 \diff3_reg[21]_i_1__1 
       (.CI(\diff3_reg[19]_i_1__1_n_0 ),
        .CO({\NLW_diff3_reg[21]_i_1__1_CO_UNCONNECTED [3:1],\diff3_reg[21]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,diff2[20]}),
        .O({\NLW_diff3_reg[21]_i_1__1_O_UNCONNECTED [3:2],diff300_out[21:20]}),
        .S({1'b0,1'b0,\diff3[21]_i_2__1_n_0 ,\diff3[21]_i_3__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[5]),
        .Q(\diff3_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[6]),
        .Q(\diff3_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[7]),
        .Q(\diff3_reg_n_0_[7] ),
        .R(1'b0));
  CARRY4 \diff3_reg[7]_i_1__1 
       (.CI(\diff3_reg[7]_i_2__1_n_0 ),
        .CO({\diff3_reg[7]_i_1__1_n_0 ,\diff3_reg[7]_i_1__1_n_1 ,\diff3_reg[7]_i_1__1_n_2 ,\diff3_reg[7]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[7:4]),
        .O({diff300_out[7:5],\NLW_diff3_reg[7]_i_1__1_O_UNCONNECTED [0]}),
        .S({\diff3[7]_i_3__1_n_0 ,\diff3[7]_i_4__1_n_0 ,\diff3[7]_i_5__1_n_0 ,\diff3[7]_i_6__1_n_0 }));
  CARRY4 \diff3_reg[7]_i_2__1 
       (.CI(1'b0),
        .CO({\diff3_reg[7]_i_2__1_n_0 ,\diff3_reg[7]_i_2__1_n_1 ,\diff3_reg[7]_i_2__1_n_2 ,\diff3_reg[7]_i_2__1_n_3 }),
        .CYINIT(1'b1),
        .DI(diff2[3:0]),
        .O(\NLW_diff3_reg[7]_i_2__1_O_UNCONNECTED [3:0]),
        .S({\diff3[7]_i_7__1_n_0 ,\diff3[7]_i_8__1_n_0 ,\diff3[7]_i_9__1_n_0 ,\diff3[7]_i_10__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[8]),
        .Q(data0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[9]),
        .Q(data0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mdat_i_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(din),
        .Q(mdat_i),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \signed_gen[2].ch_s_data[2][15]_i_1 
       (.I0(\ch_data[2]_2 ),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    \tdata[0]_i_1__1 
       (.I0(\diff3_reg_n_0_[5] ),
        .I1(\tdata[0]_i_2__1_n_0 ),
        .I2(\tdata[0]_i_3__1_n_0 ),
        .I3(\tdata[0]_i_4__1_n_0 ),
        .I4(\tdata[0]_i_5__1_n_0 ),
        .O(p_1_in));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \tdata[0]_i_2__1 
       (.I0(data0[11]),
        .I1(data0[10]),
        .I2(data0[13]),
        .I3(data0[12]),
        .O(\tdata[0]_i_2__1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tdata[0]_i_3__1 
       (.I0(data0[1]),
        .I1(\diff3_reg_n_0_[6] ),
        .I2(data0[3]),
        .I3(data0[4]),
        .O(\tdata[0]_i_3__1_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \tdata[0]_i_4__1 
       (.I0(data0[9]),
        .I1(data0[6]),
        .I2(data0[8]),
        .I3(data0[7]),
        .O(\tdata[0]_i_4__1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tdata[0]_i_5__1 
       (.I0(data0[0]),
        .I1(\diff3_reg_n_0_[7] ),
        .I2(data0[2]),
        .I3(data0[5]),
        .O(\tdata[0]_i_5__1_n_0 ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \tdata[15]_i_1__1 
       (.I0(\diff3_reg_n_0_[5] ),
        .I1(\tdata[0]_i_5__1_n_0 ),
        .I2(\tdata[0]_i_4__1_n_0 ),
        .I3(\tdata[0]_i_3__1_n_0 ),
        .I4(\tdata[0]_i_2__1_n_0 ),
        .I5(word_clk),
        .O(\tdata[15]_i_1__1_n_0 ));
  FDRE \tdata_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(p_1_in),
        .Q(D[0]),
        .R(1'b0));
  FDSE \tdata_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[7]),
        .Q(D[10]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[8]),
        .Q(D[11]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[9]),
        .Q(D[12]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[10]),
        .Q(D[13]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[11]),
        .Q(D[14]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[12]),
        .Q(\ch_data[2]_2 ),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(\diff3_reg_n_0_[6] ),
        .Q(D[1]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(\diff3_reg_n_0_[7] ),
        .Q(D[2]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[0]),
        .Q(D[3]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[1]),
        .Q(D[4]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[2]),
        .Q(D[5]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[3]),
        .Q(D[6]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[4]),
        .Q(D[7]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[5]),
        .Q(D[8]),
        .S(\tdata[15]_i_1__1_n_0 ));
  FDSE \tdata_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[6]),
        .Q(D[9]),
        .S(\tdata[15]_i_1__1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    word_clk_i_3__1
       (.I0(word_count_reg[15]),
        .O(word_clk_i_3__1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_4__1
       (.I0(word_count_reg[13]),
        .I1(word_count_reg[14]),
        .I2(word_count_reg[12]),
        .O(word_clk_i_4__1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_5__1
       (.I0(word_count_reg[10]),
        .I1(word_count_reg[11]),
        .I2(word_count_reg[9]),
        .O(word_clk_i_5__1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_6__1
       (.I0(word_count_reg[6]),
        .I1(word_count_reg[7]),
        .I2(word_count_reg[8]),
        .O(word_clk_i_6__1_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    word_clk_i_7__1
       (.I0(word_count_reg[3]),
        .I1(word_count_reg[4]),
        .I2(word_count_reg[5]),
        .O(word_clk_i_7__1_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    word_clk_i_8__1
       (.I0(word_count_reg[1]),
        .I1(word_count_reg[2]),
        .I2(word_count_reg[0]),
        .O(word_clk_i_8__1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    word_clk_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(word_clk0),
        .Q(word_clk),
        .R(1'b0));
  CARRY4 word_clk_reg_i_1__1
       (.CI(word_clk_reg_i_2__1_n_0),
        .CO({NLW_word_clk_reg_i_1__1_CO_UNCONNECTED[3:2],word_clk0,word_clk_reg_i_1__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_word_clk_reg_i_1__1_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,word_clk_i_3__1_n_0,word_clk_i_4__1_n_0}));
  CARRY4 word_clk_reg_i_2__1
       (.CI(1'b0),
        .CO({word_clk_reg_i_2__1_n_0,word_clk_reg_i_2__1_n_1,word_clk_reg_i_2__1_n_2,word_clk_reg_i_2__1_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_word_clk_reg_i_2__1_O_UNCONNECTED[3:0]),
        .S({word_clk_i_5__1_n_0,word_clk_i_6__1_n_0,word_clk_i_7__1_n_0,word_clk_i_8__1_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    \word_count[0]_i_10__1 
       (.I0(word_count_reg[10]),
        .I1(word_count_reg[11]),
        .I2(word_count_reg[9]),
        .O(\word_count[0]_i_10__1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \word_count[0]_i_11__1 
       (.I0(word_count_reg[6]),
        .I1(word_count_reg[7]),
        .I2(word_count_reg[8]),
        .O(\word_count[0]_i_11__1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \word_count[0]_i_12__1 
       (.I0(word_count_reg[3]),
        .I1(word_count_reg[4]),
        .I2(word_count_reg[5]),
        .O(\word_count[0]_i_12__1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \word_count[0]_i_13__1 
       (.I0(word_count_reg[1]),
        .I1(word_count_reg[2]),
        .I2(word_count_reg[0]),
        .O(\word_count[0]_i_13__1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \word_count[0]_i_4__1 
       (.I0(word_count_reg[15]),
        .O(\word_count[0]_i_4__1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \word_count[0]_i_5__1 
       (.I0(word_count_reg[13]),
        .I1(word_count_reg[14]),
        .I2(word_count_reg[12]),
        .O(\word_count[0]_i_5__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_6__1 
       (.I0(word_count_reg[3]),
        .O(\word_count[0]_i_6__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_7__1 
       (.I0(word_count_reg[2]),
        .O(\word_count[0]_i_7__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_8__1 
       (.I0(word_count_reg[1]),
        .O(\word_count[0]_i_8__1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \word_count[0]_i_9__1 
       (.I0(word_count_reg[0]),
        .O(\word_count[0]_i_9__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_2__1 
       (.I0(word_count_reg[15]),
        .O(\word_count[12]_i_2__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_3__1 
       (.I0(word_count_reg[14]),
        .O(\word_count[12]_i_3__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_4__1 
       (.I0(word_count_reg[13]),
        .O(\word_count[12]_i_4__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_5__1 
       (.I0(word_count_reg[12]),
        .O(\word_count[12]_i_5__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_2__1 
       (.I0(word_count_reg[7]),
        .O(\word_count[4]_i_2__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_3__1 
       (.I0(word_count_reg[6]),
        .O(\word_count[4]_i_3__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_4__1 
       (.I0(word_count_reg[5]),
        .O(\word_count[4]_i_4__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_5__1 
       (.I0(word_count_reg[4]),
        .O(\word_count[4]_i_5__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_2__1 
       (.I0(word_count_reg[11]),
        .O(\word_count[8]_i_2__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_3__1 
       (.I0(word_count_reg[10]),
        .O(\word_count[8]_i_3__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_4__1 
       (.I0(word_count_reg[9]),
        .O(\word_count[8]_i_4__1_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_5__1 
       (.I0(word_count_reg[8]),
        .O(\word_count[8]_i_5__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__1_n_7 ),
        .Q(word_count_reg[0]),
        .R(word_count0));
  CARRY4 \word_count_reg[0]_i_1__1 
       (.CI(\word_count_reg[0]_i_3__1_n_0 ),
        .CO({\NLW_word_count_reg[0]_i_1__1_CO_UNCONNECTED [3:2],word_count0,\word_count_reg[0]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_word_count_reg[0]_i_1__1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,\word_count[0]_i_4__1_n_0 ,\word_count[0]_i_5__1_n_0 }));
  CARRY4 \word_count_reg[0]_i_2__1 
       (.CI(1'b0),
        .CO({\word_count_reg[0]_i_2__1_n_0 ,\word_count_reg[0]_i_2__1_n_1 ,\word_count_reg[0]_i_2__1_n_2 ,\word_count_reg[0]_i_2__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\word_count_reg[0]_i_2__1_n_4 ,\word_count_reg[0]_i_2__1_n_5 ,\word_count_reg[0]_i_2__1_n_6 ,\word_count_reg[0]_i_2__1_n_7 }),
        .S({\word_count[0]_i_6__1_n_0 ,\word_count[0]_i_7__1_n_0 ,\word_count[0]_i_8__1_n_0 ,\word_count[0]_i_9__1_n_0 }));
  CARRY4 \word_count_reg[0]_i_3__1 
       (.CI(1'b0),
        .CO({\word_count_reg[0]_i_3__1_n_0 ,\word_count_reg[0]_i_3__1_n_1 ,\word_count_reg[0]_i_3__1_n_2 ,\word_count_reg[0]_i_3__1_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_word_count_reg[0]_i_3__1_O_UNCONNECTED [3:0]),
        .S({\word_count[0]_i_10__1_n_0 ,\word_count[0]_i_11__1_n_0 ,\word_count[0]_i_12__1_n_0 ,\word_count[0]_i_13__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__1_n_5 ),
        .Q(word_count_reg[10]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__1_n_4 ),
        .Q(word_count_reg[11]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__1_n_7 ),
        .Q(word_count_reg[12]),
        .R(word_count0));
  CARRY4 \word_count_reg[12]_i_1__1 
       (.CI(\word_count_reg[8]_i_1__1_n_0 ),
        .CO({\NLW_word_count_reg[12]_i_1__1_CO_UNCONNECTED [3],\word_count_reg[12]_i_1__1_n_1 ,\word_count_reg[12]_i_1__1_n_2 ,\word_count_reg[12]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[12]_i_1__1_n_4 ,\word_count_reg[12]_i_1__1_n_5 ,\word_count_reg[12]_i_1__1_n_6 ,\word_count_reg[12]_i_1__1_n_7 }),
        .S({\word_count[12]_i_2__1_n_0 ,\word_count[12]_i_3__1_n_0 ,\word_count[12]_i_4__1_n_0 ,\word_count[12]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__1_n_6 ),
        .Q(word_count_reg[13]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__1_n_5 ),
        .Q(word_count_reg[14]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__1_n_4 ),
        .Q(word_count_reg[15]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__1_n_6 ),
        .Q(word_count_reg[1]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__1_n_5 ),
        .Q(word_count_reg[2]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__1_n_4 ),
        .Q(word_count_reg[3]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__1_n_7 ),
        .Q(word_count_reg[4]),
        .R(word_count0));
  CARRY4 \word_count_reg[4]_i_1__1 
       (.CI(\word_count_reg[0]_i_2__1_n_0 ),
        .CO({\word_count_reg[4]_i_1__1_n_0 ,\word_count_reg[4]_i_1__1_n_1 ,\word_count_reg[4]_i_1__1_n_2 ,\word_count_reg[4]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[4]_i_1__1_n_4 ,\word_count_reg[4]_i_1__1_n_5 ,\word_count_reg[4]_i_1__1_n_6 ,\word_count_reg[4]_i_1__1_n_7 }),
        .S({\word_count[4]_i_2__1_n_0 ,\word_count[4]_i_3__1_n_0 ,\word_count[4]_i_4__1_n_0 ,\word_count[4]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__1_n_6 ),
        .Q(word_count_reg[5]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__1_n_5 ),
        .Q(word_count_reg[6]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__1_n_4 ),
        .Q(word_count_reg[7]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__1_n_7 ),
        .Q(word_count_reg[8]),
        .R(word_count0));
  CARRY4 \word_count_reg[8]_i_1__1 
       (.CI(\word_count_reg[4]_i_1__1_n_0 ),
        .CO({\word_count_reg[8]_i_1__1_n_0 ,\word_count_reg[8]_i_1__1_n_1 ,\word_count_reg[8]_i_1__1_n_2 ,\word_count_reg[8]_i_1__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[8]_i_1__1_n_4 ,\word_count_reg[8]_i_1__1_n_5 ,\word_count_reg[8]_i_1__1_n_6 ,\word_count_reg[8]_i_1__1_n_7 }),
        .S({\word_count[8]_i_2__1_n_0 ,\word_count[8]_i_3__1_n_0 ,\word_count[8]_i_4__1_n_0 ,\word_count[8]_i_5__1_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__1_n_6 ),
        .Q(word_count_reg[9]),
        .R(word_count0));
endmodule

(* ORIG_REF_NAME = "sinc3" *) 
module zsys_axis_AD7403_0_0_sinc3_2
   (D,
    din,
    m_axis_aclk);
  output [15:0]D;
  input [0:0]din;
  input m_axis_aclk;

  wire [15:0]D;
  wire \acc1[0]_i_2__2_n_0 ;
  wire \acc1[0]_i_3__2_n_0 ;
  wire \acc1[0]_i_4__2_n_0 ;
  wire \acc1[0]_i_5__2_n_0 ;
  wire \acc1[12]_i_2__2_n_0 ;
  wire \acc1[12]_i_3__2_n_0 ;
  wire \acc1[12]_i_4__2_n_0 ;
  wire \acc1[12]_i_5__2_n_0 ;
  wire \acc1[16]_i_2__2_n_0 ;
  wire \acc1[16]_i_3__2_n_0 ;
  wire \acc1[16]_i_4__2_n_0 ;
  wire \acc1[16]_i_5__2_n_0 ;
  wire \acc1[20]_i_2__2_n_0 ;
  wire \acc1[20]_i_3__2_n_0 ;
  wire \acc1[4]_i_2__2_n_0 ;
  wire \acc1[4]_i_3__2_n_0 ;
  wire \acc1[4]_i_4__2_n_0 ;
  wire \acc1[4]_i_5__2_n_0 ;
  wire \acc1[8]_i_2__2_n_0 ;
  wire \acc1[8]_i_3__2_n_0 ;
  wire \acc1[8]_i_4__2_n_0 ;
  wire \acc1[8]_i_5__2_n_0 ;
  wire [21:0]acc1_reg;
  wire \acc1_reg[0]_i_1__2_n_0 ;
  wire \acc1_reg[0]_i_1__2_n_1 ;
  wire \acc1_reg[0]_i_1__2_n_2 ;
  wire \acc1_reg[0]_i_1__2_n_3 ;
  wire \acc1_reg[0]_i_1__2_n_4 ;
  wire \acc1_reg[0]_i_1__2_n_5 ;
  wire \acc1_reg[0]_i_1__2_n_6 ;
  wire \acc1_reg[0]_i_1__2_n_7 ;
  wire \acc1_reg[12]_i_1__2_n_0 ;
  wire \acc1_reg[12]_i_1__2_n_1 ;
  wire \acc1_reg[12]_i_1__2_n_2 ;
  wire \acc1_reg[12]_i_1__2_n_3 ;
  wire \acc1_reg[12]_i_1__2_n_4 ;
  wire \acc1_reg[12]_i_1__2_n_5 ;
  wire \acc1_reg[12]_i_1__2_n_6 ;
  wire \acc1_reg[12]_i_1__2_n_7 ;
  wire \acc1_reg[16]_i_1__2_n_0 ;
  wire \acc1_reg[16]_i_1__2_n_1 ;
  wire \acc1_reg[16]_i_1__2_n_2 ;
  wire \acc1_reg[16]_i_1__2_n_3 ;
  wire \acc1_reg[16]_i_1__2_n_4 ;
  wire \acc1_reg[16]_i_1__2_n_5 ;
  wire \acc1_reg[16]_i_1__2_n_6 ;
  wire \acc1_reg[16]_i_1__2_n_7 ;
  wire \acc1_reg[20]_i_1__2_n_3 ;
  wire \acc1_reg[20]_i_1__2_n_6 ;
  wire \acc1_reg[20]_i_1__2_n_7 ;
  wire \acc1_reg[4]_i_1__2_n_0 ;
  wire \acc1_reg[4]_i_1__2_n_1 ;
  wire \acc1_reg[4]_i_1__2_n_2 ;
  wire \acc1_reg[4]_i_1__2_n_3 ;
  wire \acc1_reg[4]_i_1__2_n_4 ;
  wire \acc1_reg[4]_i_1__2_n_5 ;
  wire \acc1_reg[4]_i_1__2_n_6 ;
  wire \acc1_reg[4]_i_1__2_n_7 ;
  wire \acc1_reg[8]_i_1__2_n_0 ;
  wire \acc1_reg[8]_i_1__2_n_1 ;
  wire \acc1_reg[8]_i_1__2_n_2 ;
  wire \acc1_reg[8]_i_1__2_n_3 ;
  wire \acc1_reg[8]_i_1__2_n_4 ;
  wire \acc1_reg[8]_i_1__2_n_5 ;
  wire \acc1_reg[8]_i_1__2_n_6 ;
  wire \acc1_reg[8]_i_1__2_n_7 ;
  wire \acc2[0]_i_2__2_n_0 ;
  wire \acc2[0]_i_3__2_n_0 ;
  wire \acc2[0]_i_4__2_n_0 ;
  wire \acc2[0]_i_5__2_n_0 ;
  wire \acc2[12]_i_2__2_n_0 ;
  wire \acc2[12]_i_3__2_n_0 ;
  wire \acc2[12]_i_4__2_n_0 ;
  wire \acc2[12]_i_5__2_n_0 ;
  wire \acc2[16]_i_2__2_n_0 ;
  wire \acc2[16]_i_3__2_n_0 ;
  wire \acc2[16]_i_4__2_n_0 ;
  wire \acc2[16]_i_5__2_n_0 ;
  wire \acc2[20]_i_2__2_n_0 ;
  wire \acc2[20]_i_3__2_n_0 ;
  wire \acc2[4]_i_2__2_n_0 ;
  wire \acc2[4]_i_3__2_n_0 ;
  wire \acc2[4]_i_4__2_n_0 ;
  wire \acc2[4]_i_5__2_n_0 ;
  wire \acc2[8]_i_2__2_n_0 ;
  wire \acc2[8]_i_3__2_n_0 ;
  wire \acc2[8]_i_4__2_n_0 ;
  wire \acc2[8]_i_5__2_n_0 ;
  wire [21:0]acc2_reg;
  wire \acc2_reg[0]_i_1__2_n_0 ;
  wire \acc2_reg[0]_i_1__2_n_1 ;
  wire \acc2_reg[0]_i_1__2_n_2 ;
  wire \acc2_reg[0]_i_1__2_n_3 ;
  wire \acc2_reg[0]_i_1__2_n_4 ;
  wire \acc2_reg[0]_i_1__2_n_5 ;
  wire \acc2_reg[0]_i_1__2_n_6 ;
  wire \acc2_reg[0]_i_1__2_n_7 ;
  wire \acc2_reg[12]_i_1__2_n_0 ;
  wire \acc2_reg[12]_i_1__2_n_1 ;
  wire \acc2_reg[12]_i_1__2_n_2 ;
  wire \acc2_reg[12]_i_1__2_n_3 ;
  wire \acc2_reg[12]_i_1__2_n_4 ;
  wire \acc2_reg[12]_i_1__2_n_5 ;
  wire \acc2_reg[12]_i_1__2_n_6 ;
  wire \acc2_reg[12]_i_1__2_n_7 ;
  wire \acc2_reg[16]_i_1__2_n_0 ;
  wire \acc2_reg[16]_i_1__2_n_1 ;
  wire \acc2_reg[16]_i_1__2_n_2 ;
  wire \acc2_reg[16]_i_1__2_n_3 ;
  wire \acc2_reg[16]_i_1__2_n_4 ;
  wire \acc2_reg[16]_i_1__2_n_5 ;
  wire \acc2_reg[16]_i_1__2_n_6 ;
  wire \acc2_reg[16]_i_1__2_n_7 ;
  wire \acc2_reg[20]_i_1__2_n_3 ;
  wire \acc2_reg[20]_i_1__2_n_6 ;
  wire \acc2_reg[20]_i_1__2_n_7 ;
  wire \acc2_reg[4]_i_1__2_n_0 ;
  wire \acc2_reg[4]_i_1__2_n_1 ;
  wire \acc2_reg[4]_i_1__2_n_2 ;
  wire \acc2_reg[4]_i_1__2_n_3 ;
  wire \acc2_reg[4]_i_1__2_n_4 ;
  wire \acc2_reg[4]_i_1__2_n_5 ;
  wire \acc2_reg[4]_i_1__2_n_6 ;
  wire \acc2_reg[4]_i_1__2_n_7 ;
  wire \acc2_reg[8]_i_1__2_n_0 ;
  wire \acc2_reg[8]_i_1__2_n_1 ;
  wire \acc2_reg[8]_i_1__2_n_2 ;
  wire \acc2_reg[8]_i_1__2_n_3 ;
  wire \acc2_reg[8]_i_1__2_n_4 ;
  wire \acc2_reg[8]_i_1__2_n_5 ;
  wire \acc2_reg[8]_i_1__2_n_6 ;
  wire \acc2_reg[8]_i_1__2_n_7 ;
  wire \acc3[0]_i_2__2_n_0 ;
  wire \acc3[0]_i_3__2_n_0 ;
  wire \acc3[0]_i_4__2_n_0 ;
  wire \acc3[0]_i_5__2_n_0 ;
  wire \acc3[12]_i_2__2_n_0 ;
  wire \acc3[12]_i_3__2_n_0 ;
  wire \acc3[12]_i_4__2_n_0 ;
  wire \acc3[12]_i_5__2_n_0 ;
  wire \acc3[16]_i_2__2_n_0 ;
  wire \acc3[16]_i_3__2_n_0 ;
  wire \acc3[16]_i_4__2_n_0 ;
  wire \acc3[16]_i_5__2_n_0 ;
  wire \acc3[20]_i_2__2_n_0 ;
  wire \acc3[20]_i_3__2_n_0 ;
  wire \acc3[4]_i_2__2_n_0 ;
  wire \acc3[4]_i_3__2_n_0 ;
  wire \acc3[4]_i_4__2_n_0 ;
  wire \acc3[4]_i_5__2_n_0 ;
  wire \acc3[8]_i_2__2_n_0 ;
  wire \acc3[8]_i_3__2_n_0 ;
  wire \acc3[8]_i_4__2_n_0 ;
  wire \acc3[8]_i_5__2_n_0 ;
  wire [21:0]acc3_d2;
  wire [21:0]acc3_reg;
  wire \acc3_reg[0]_i_1__2_n_0 ;
  wire \acc3_reg[0]_i_1__2_n_1 ;
  wire \acc3_reg[0]_i_1__2_n_2 ;
  wire \acc3_reg[0]_i_1__2_n_3 ;
  wire \acc3_reg[0]_i_1__2_n_4 ;
  wire \acc3_reg[0]_i_1__2_n_5 ;
  wire \acc3_reg[0]_i_1__2_n_6 ;
  wire \acc3_reg[0]_i_1__2_n_7 ;
  wire \acc3_reg[12]_i_1__2_n_0 ;
  wire \acc3_reg[12]_i_1__2_n_1 ;
  wire \acc3_reg[12]_i_1__2_n_2 ;
  wire \acc3_reg[12]_i_1__2_n_3 ;
  wire \acc3_reg[12]_i_1__2_n_4 ;
  wire \acc3_reg[12]_i_1__2_n_5 ;
  wire \acc3_reg[12]_i_1__2_n_6 ;
  wire \acc3_reg[12]_i_1__2_n_7 ;
  wire \acc3_reg[16]_i_1__2_n_0 ;
  wire \acc3_reg[16]_i_1__2_n_1 ;
  wire \acc3_reg[16]_i_1__2_n_2 ;
  wire \acc3_reg[16]_i_1__2_n_3 ;
  wire \acc3_reg[16]_i_1__2_n_4 ;
  wire \acc3_reg[16]_i_1__2_n_5 ;
  wire \acc3_reg[16]_i_1__2_n_6 ;
  wire \acc3_reg[16]_i_1__2_n_7 ;
  wire \acc3_reg[20]_i_1__2_n_3 ;
  wire \acc3_reg[20]_i_1__2_n_6 ;
  wire \acc3_reg[20]_i_1__2_n_7 ;
  wire \acc3_reg[4]_i_1__2_n_0 ;
  wire \acc3_reg[4]_i_1__2_n_1 ;
  wire \acc3_reg[4]_i_1__2_n_2 ;
  wire \acc3_reg[4]_i_1__2_n_3 ;
  wire \acc3_reg[4]_i_1__2_n_4 ;
  wire \acc3_reg[4]_i_1__2_n_5 ;
  wire \acc3_reg[4]_i_1__2_n_6 ;
  wire \acc3_reg[4]_i_1__2_n_7 ;
  wire \acc3_reg[8]_i_1__2_n_0 ;
  wire \acc3_reg[8]_i_1__2_n_1 ;
  wire \acc3_reg[8]_i_1__2_n_2 ;
  wire \acc3_reg[8]_i_1__2_n_3 ;
  wire \acc3_reg[8]_i_1__2_n_4 ;
  wire \acc3_reg[8]_i_1__2_n_5 ;
  wire \acc3_reg[8]_i_1__2_n_6 ;
  wire \acc3_reg[8]_i_1__2_n_7 ;
  wire [15:15]\ch_data[3]_3 ;
  wire [13:0]data0;
  wire [21:0]diff1;
  wire [21:0]diff102_out;
  wire \diff1[11]_i_2__2_n_0 ;
  wire \diff1[11]_i_3__2_n_0 ;
  wire \diff1[11]_i_4__2_n_0 ;
  wire \diff1[11]_i_5__2_n_0 ;
  wire \diff1[15]_i_2__2_n_0 ;
  wire \diff1[15]_i_3__2_n_0 ;
  wire \diff1[15]_i_4__2_n_0 ;
  wire \diff1[15]_i_5__2_n_0 ;
  wire \diff1[19]_i_2__2_n_0 ;
  wire \diff1[19]_i_3__2_n_0 ;
  wire \diff1[19]_i_4__2_n_0 ;
  wire \diff1[19]_i_5__2_n_0 ;
  wire \diff1[21]_i_2__2_n_0 ;
  wire \diff1[21]_i_3__2_n_0 ;
  wire \diff1[3]_i_2__2_n_0 ;
  wire \diff1[3]_i_3__2_n_0 ;
  wire \diff1[3]_i_4__2_n_0 ;
  wire \diff1[3]_i_5__2_n_0 ;
  wire \diff1[7]_i_2__2_n_0 ;
  wire \diff1[7]_i_3__2_n_0 ;
  wire \diff1[7]_i_4__2_n_0 ;
  wire \diff1[7]_i_5__2_n_0 ;
  wire [21:0]diff1_d;
  wire \diff1_reg[11]_i_1__2_n_0 ;
  wire \diff1_reg[11]_i_1__2_n_1 ;
  wire \diff1_reg[11]_i_1__2_n_2 ;
  wire \diff1_reg[11]_i_1__2_n_3 ;
  wire \diff1_reg[15]_i_1__2_n_0 ;
  wire \diff1_reg[15]_i_1__2_n_1 ;
  wire \diff1_reg[15]_i_1__2_n_2 ;
  wire \diff1_reg[15]_i_1__2_n_3 ;
  wire \diff1_reg[19]_i_1__2_n_0 ;
  wire \diff1_reg[19]_i_1__2_n_1 ;
  wire \diff1_reg[19]_i_1__2_n_2 ;
  wire \diff1_reg[19]_i_1__2_n_3 ;
  wire \diff1_reg[21]_i_1__2_n_3 ;
  wire \diff1_reg[3]_i_1__2_n_0 ;
  wire \diff1_reg[3]_i_1__2_n_1 ;
  wire \diff1_reg[3]_i_1__2_n_2 ;
  wire \diff1_reg[3]_i_1__2_n_3 ;
  wire \diff1_reg[7]_i_1__2_n_0 ;
  wire \diff1_reg[7]_i_1__2_n_1 ;
  wire \diff1_reg[7]_i_1__2_n_2 ;
  wire \diff1_reg[7]_i_1__2_n_3 ;
  wire [21:0]diff2;
  wire [21:0]diff201_out;
  wire \diff2[11]_i_2__2_n_0 ;
  wire \diff2[11]_i_3__2_n_0 ;
  wire \diff2[11]_i_4__2_n_0 ;
  wire \diff2[11]_i_5__2_n_0 ;
  wire \diff2[15]_i_2__2_n_0 ;
  wire \diff2[15]_i_3__2_n_0 ;
  wire \diff2[15]_i_4__2_n_0 ;
  wire \diff2[15]_i_5__2_n_0 ;
  wire \diff2[19]_i_2__2_n_0 ;
  wire \diff2[19]_i_3__2_n_0 ;
  wire \diff2[19]_i_4__2_n_0 ;
  wire \diff2[19]_i_5__2_n_0 ;
  wire \diff2[21]_i_2__2_n_0 ;
  wire \diff2[21]_i_3__2_n_0 ;
  wire \diff2[3]_i_2__2_n_0 ;
  wire \diff2[3]_i_3__2_n_0 ;
  wire \diff2[3]_i_4__2_n_0 ;
  wire \diff2[3]_i_5__2_n_0 ;
  wire \diff2[7]_i_2__2_n_0 ;
  wire \diff2[7]_i_3__2_n_0 ;
  wire \diff2[7]_i_4__2_n_0 ;
  wire \diff2[7]_i_5__2_n_0 ;
  wire [21:0]diff2_d;
  wire \diff2_reg[11]_i_1__2_n_0 ;
  wire \diff2_reg[11]_i_1__2_n_1 ;
  wire \diff2_reg[11]_i_1__2_n_2 ;
  wire \diff2_reg[11]_i_1__2_n_3 ;
  wire \diff2_reg[15]_i_1__2_n_0 ;
  wire \diff2_reg[15]_i_1__2_n_1 ;
  wire \diff2_reg[15]_i_1__2_n_2 ;
  wire \diff2_reg[15]_i_1__2_n_3 ;
  wire \diff2_reg[19]_i_1__2_n_0 ;
  wire \diff2_reg[19]_i_1__2_n_1 ;
  wire \diff2_reg[19]_i_1__2_n_2 ;
  wire \diff2_reg[19]_i_1__2_n_3 ;
  wire \diff2_reg[21]_i_1__2_n_3 ;
  wire \diff2_reg[3]_i_1__2_n_0 ;
  wire \diff2_reg[3]_i_1__2_n_1 ;
  wire \diff2_reg[3]_i_1__2_n_2 ;
  wire \diff2_reg[3]_i_1__2_n_3 ;
  wire \diff2_reg[7]_i_1__2_n_0 ;
  wire \diff2_reg[7]_i_1__2_n_1 ;
  wire \diff2_reg[7]_i_1__2_n_2 ;
  wire \diff2_reg[7]_i_1__2_n_3 ;
  wire [21:5]diff300_out;
  wire \diff3[11]_i_2__2_n_0 ;
  wire \diff3[11]_i_3__2_n_0 ;
  wire \diff3[11]_i_4__2_n_0 ;
  wire \diff3[11]_i_5__2_n_0 ;
  wire \diff3[15]_i_2__2_n_0 ;
  wire \diff3[15]_i_3__2_n_0 ;
  wire \diff3[15]_i_4__2_n_0 ;
  wire \diff3[15]_i_5__2_n_0 ;
  wire \diff3[19]_i_2__2_n_0 ;
  wire \diff3[19]_i_3__2_n_0 ;
  wire \diff3[19]_i_4__2_n_0 ;
  wire \diff3[19]_i_5__2_n_0 ;
  wire \diff3[21]_i_2__2_n_0 ;
  wire \diff3[21]_i_3__2_n_0 ;
  wire \diff3[7]_i_10__2_n_0 ;
  wire \diff3[7]_i_3__2_n_0 ;
  wire \diff3[7]_i_4__2_n_0 ;
  wire \diff3[7]_i_5__2_n_0 ;
  wire \diff3[7]_i_6__2_n_0 ;
  wire \diff3[7]_i_7__2_n_0 ;
  wire \diff3[7]_i_8__2_n_0 ;
  wire \diff3[7]_i_9__2_n_0 ;
  wire \diff3_reg[11]_i_1__2_n_0 ;
  wire \diff3_reg[11]_i_1__2_n_1 ;
  wire \diff3_reg[11]_i_1__2_n_2 ;
  wire \diff3_reg[11]_i_1__2_n_3 ;
  wire \diff3_reg[15]_i_1__2_n_0 ;
  wire \diff3_reg[15]_i_1__2_n_1 ;
  wire \diff3_reg[15]_i_1__2_n_2 ;
  wire \diff3_reg[15]_i_1__2_n_3 ;
  wire \diff3_reg[19]_i_1__2_n_0 ;
  wire \diff3_reg[19]_i_1__2_n_1 ;
  wire \diff3_reg[19]_i_1__2_n_2 ;
  wire \diff3_reg[19]_i_1__2_n_3 ;
  wire \diff3_reg[21]_i_1__2_n_3 ;
  wire \diff3_reg[7]_i_1__2_n_0 ;
  wire \diff3_reg[7]_i_1__2_n_1 ;
  wire \diff3_reg[7]_i_1__2_n_2 ;
  wire \diff3_reg[7]_i_1__2_n_3 ;
  wire \diff3_reg[7]_i_2__2_n_0 ;
  wire \diff3_reg[7]_i_2__2_n_1 ;
  wire \diff3_reg[7]_i_2__2_n_2 ;
  wire \diff3_reg[7]_i_2__2_n_3 ;
  wire \diff3_reg_n_0_[5] ;
  wire \diff3_reg_n_0_[6] ;
  wire \diff3_reg_n_0_[7] ;
  wire [0:0]din;
  wire m_axis_aclk;
  wire mdat_i;
  wire [0:0]p_1_in;
  wire \tdata[0]_i_2__2_n_0 ;
  wire \tdata[0]_i_3__2_n_0 ;
  wire \tdata[0]_i_4__2_n_0 ;
  wire \tdata[0]_i_5__2_n_0 ;
  wire \tdata[15]_i_1__2_n_0 ;
  wire word_clk;
  wire word_clk0;
  wire word_clk_i_3__2_n_0;
  wire word_clk_i_4__2_n_0;
  wire word_clk_i_5__2_n_0;
  wire word_clk_i_6__2_n_0;
  wire word_clk_i_7__2_n_0;
  wire word_clk_i_8__2_n_0;
  wire word_clk_reg_i_1__2_n_3;
  wire word_clk_reg_i_2__2_n_0;
  wire word_clk_reg_i_2__2_n_1;
  wire word_clk_reg_i_2__2_n_2;
  wire word_clk_reg_i_2__2_n_3;
  wire word_count0;
  wire \word_count[0]_i_10__2_n_0 ;
  wire \word_count[0]_i_11__2_n_0 ;
  wire \word_count[0]_i_12__2_n_0 ;
  wire \word_count[0]_i_13__2_n_0 ;
  wire \word_count[0]_i_4__2_n_0 ;
  wire \word_count[0]_i_5__2_n_0 ;
  wire \word_count[0]_i_6__2_n_0 ;
  wire \word_count[0]_i_7__2_n_0 ;
  wire \word_count[0]_i_8__2_n_0 ;
  wire \word_count[0]_i_9__2_n_0 ;
  wire \word_count[12]_i_2__2_n_0 ;
  wire \word_count[12]_i_3__2_n_0 ;
  wire \word_count[12]_i_4__2_n_0 ;
  wire \word_count[12]_i_5__2_n_0 ;
  wire \word_count[4]_i_2__2_n_0 ;
  wire \word_count[4]_i_3__2_n_0 ;
  wire \word_count[4]_i_4__2_n_0 ;
  wire \word_count[4]_i_5__2_n_0 ;
  wire \word_count[8]_i_2__2_n_0 ;
  wire \word_count[8]_i_3__2_n_0 ;
  wire \word_count[8]_i_4__2_n_0 ;
  wire \word_count[8]_i_5__2_n_0 ;
  wire [15:0]word_count_reg;
  wire \word_count_reg[0]_i_1__2_n_3 ;
  wire \word_count_reg[0]_i_2__2_n_0 ;
  wire \word_count_reg[0]_i_2__2_n_1 ;
  wire \word_count_reg[0]_i_2__2_n_2 ;
  wire \word_count_reg[0]_i_2__2_n_3 ;
  wire \word_count_reg[0]_i_2__2_n_4 ;
  wire \word_count_reg[0]_i_2__2_n_5 ;
  wire \word_count_reg[0]_i_2__2_n_6 ;
  wire \word_count_reg[0]_i_2__2_n_7 ;
  wire \word_count_reg[0]_i_3__2_n_0 ;
  wire \word_count_reg[0]_i_3__2_n_1 ;
  wire \word_count_reg[0]_i_3__2_n_2 ;
  wire \word_count_reg[0]_i_3__2_n_3 ;
  wire \word_count_reg[12]_i_1__2_n_1 ;
  wire \word_count_reg[12]_i_1__2_n_2 ;
  wire \word_count_reg[12]_i_1__2_n_3 ;
  wire \word_count_reg[12]_i_1__2_n_4 ;
  wire \word_count_reg[12]_i_1__2_n_5 ;
  wire \word_count_reg[12]_i_1__2_n_6 ;
  wire \word_count_reg[12]_i_1__2_n_7 ;
  wire \word_count_reg[4]_i_1__2_n_0 ;
  wire \word_count_reg[4]_i_1__2_n_1 ;
  wire \word_count_reg[4]_i_1__2_n_2 ;
  wire \word_count_reg[4]_i_1__2_n_3 ;
  wire \word_count_reg[4]_i_1__2_n_4 ;
  wire \word_count_reg[4]_i_1__2_n_5 ;
  wire \word_count_reg[4]_i_1__2_n_6 ;
  wire \word_count_reg[4]_i_1__2_n_7 ;
  wire \word_count_reg[8]_i_1__2_n_0 ;
  wire \word_count_reg[8]_i_1__2_n_1 ;
  wire \word_count_reg[8]_i_1__2_n_2 ;
  wire \word_count_reg[8]_i_1__2_n_3 ;
  wire \word_count_reg[8]_i_1__2_n_4 ;
  wire \word_count_reg[8]_i_1__2_n_5 ;
  wire \word_count_reg[8]_i_1__2_n_6 ;
  wire \word_count_reg[8]_i_1__2_n_7 ;
  wire [3:1]\NLW_acc1_reg[20]_i_1__2_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc1_reg[20]_i_1__2_O_UNCONNECTED ;
  wire [3:1]\NLW_acc2_reg[20]_i_1__2_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc2_reg[20]_i_1__2_O_UNCONNECTED ;
  wire [3:1]\NLW_acc3_reg[20]_i_1__2_CO_UNCONNECTED ;
  wire [3:2]\NLW_acc3_reg[20]_i_1__2_O_UNCONNECTED ;
  wire [3:1]\NLW_diff1_reg[21]_i_1__2_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff1_reg[21]_i_1__2_O_UNCONNECTED ;
  wire [3:1]\NLW_diff2_reg[21]_i_1__2_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff2_reg[21]_i_1__2_O_UNCONNECTED ;
  wire [3:1]\NLW_diff3_reg[21]_i_1__2_CO_UNCONNECTED ;
  wire [3:2]\NLW_diff3_reg[21]_i_1__2_O_UNCONNECTED ;
  wire [0:0]\NLW_diff3_reg[7]_i_1__2_O_UNCONNECTED ;
  wire [3:0]\NLW_diff3_reg[7]_i_2__2_O_UNCONNECTED ;
  wire [3:2]NLW_word_clk_reg_i_1__2_CO_UNCONNECTED;
  wire [3:0]NLW_word_clk_reg_i_1__2_O_UNCONNECTED;
  wire [3:0]NLW_word_clk_reg_i_2__2_O_UNCONNECTED;
  wire [3:2]\NLW_word_count_reg[0]_i_1__2_CO_UNCONNECTED ;
  wire [3:0]\NLW_word_count_reg[0]_i_1__2_O_UNCONNECTED ;
  wire [3:0]\NLW_word_count_reg[0]_i_3__2_O_UNCONNECTED ;
  wire [3:3]\NLW_word_count_reg[12]_i_1__2_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_2__2 
       (.I0(acc1_reg[3]),
        .O(\acc1[0]_i_2__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_3__2 
       (.I0(acc1_reg[2]),
        .O(\acc1[0]_i_3__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[0]_i_4__2 
       (.I0(acc1_reg[1]),
        .O(\acc1[0]_i_4__2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \acc1[0]_i_5__2 
       (.I0(acc1_reg[0]),
        .O(\acc1[0]_i_5__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_2__2 
       (.I0(acc1_reg[15]),
        .O(\acc1[12]_i_2__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_3__2 
       (.I0(acc1_reg[14]),
        .O(\acc1[12]_i_3__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_4__2 
       (.I0(acc1_reg[13]),
        .O(\acc1[12]_i_4__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[12]_i_5__2 
       (.I0(acc1_reg[12]),
        .O(\acc1[12]_i_5__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_2__2 
       (.I0(acc1_reg[19]),
        .O(\acc1[16]_i_2__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_3__2 
       (.I0(acc1_reg[18]),
        .O(\acc1[16]_i_3__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_4__2 
       (.I0(acc1_reg[17]),
        .O(\acc1[16]_i_4__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[16]_i_5__2 
       (.I0(acc1_reg[16]),
        .O(\acc1[16]_i_5__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[20]_i_2__2 
       (.I0(acc1_reg[21]),
        .O(\acc1[20]_i_2__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[20]_i_3__2 
       (.I0(acc1_reg[20]),
        .O(\acc1[20]_i_3__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_2__2 
       (.I0(acc1_reg[7]),
        .O(\acc1[4]_i_2__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_3__2 
       (.I0(acc1_reg[6]),
        .O(\acc1[4]_i_3__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_4__2 
       (.I0(acc1_reg[5]),
        .O(\acc1[4]_i_4__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[4]_i_5__2 
       (.I0(acc1_reg[4]),
        .O(\acc1[4]_i_5__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_2__2 
       (.I0(acc1_reg[11]),
        .O(\acc1[8]_i_2__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_3__2 
       (.I0(acc1_reg[10]),
        .O(\acc1[8]_i_3__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_4__2 
       (.I0(acc1_reg[9]),
        .O(\acc1[8]_i_4__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \acc1[8]_i_5__2 
       (.I0(acc1_reg[8]),
        .O(\acc1[8]_i_5__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[0] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__2_n_7 ),
        .Q(acc1_reg[0]),
        .R(1'b0));
  CARRY4 \acc1_reg[0]_i_1__2 
       (.CI(1'b0),
        .CO({\acc1_reg[0]_i_1__2_n_0 ,\acc1_reg[0]_i_1__2_n_1 ,\acc1_reg[0]_i_1__2_n_2 ,\acc1_reg[0]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\acc1_reg[0]_i_1__2_n_4 ,\acc1_reg[0]_i_1__2_n_5 ,\acc1_reg[0]_i_1__2_n_6 ,\acc1_reg[0]_i_1__2_n_7 }),
        .S({\acc1[0]_i_2__2_n_0 ,\acc1[0]_i_3__2_n_0 ,\acc1[0]_i_4__2_n_0 ,\acc1[0]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[10] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__2_n_5 ),
        .Q(acc1_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[11] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__2_n_4 ),
        .Q(acc1_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[12] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__2_n_7 ),
        .Q(acc1_reg[12]),
        .R(1'b0));
  CARRY4 \acc1_reg[12]_i_1__2 
       (.CI(\acc1_reg[8]_i_1__2_n_0 ),
        .CO({\acc1_reg[12]_i_1__2_n_0 ,\acc1_reg[12]_i_1__2_n_1 ,\acc1_reg[12]_i_1__2_n_2 ,\acc1_reg[12]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[12]_i_1__2_n_4 ,\acc1_reg[12]_i_1__2_n_5 ,\acc1_reg[12]_i_1__2_n_6 ,\acc1_reg[12]_i_1__2_n_7 }),
        .S({\acc1[12]_i_2__2_n_0 ,\acc1[12]_i_3__2_n_0 ,\acc1[12]_i_4__2_n_0 ,\acc1[12]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[13] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__2_n_6 ),
        .Q(acc1_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[14] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__2_n_5 ),
        .Q(acc1_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[15] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[12]_i_1__2_n_4 ),
        .Q(acc1_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[16] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__2_n_7 ),
        .Q(acc1_reg[16]),
        .R(1'b0));
  CARRY4 \acc1_reg[16]_i_1__2 
       (.CI(\acc1_reg[12]_i_1__2_n_0 ),
        .CO({\acc1_reg[16]_i_1__2_n_0 ,\acc1_reg[16]_i_1__2_n_1 ,\acc1_reg[16]_i_1__2_n_2 ,\acc1_reg[16]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[16]_i_1__2_n_4 ,\acc1_reg[16]_i_1__2_n_5 ,\acc1_reg[16]_i_1__2_n_6 ,\acc1_reg[16]_i_1__2_n_7 }),
        .S({\acc1[16]_i_2__2_n_0 ,\acc1[16]_i_3__2_n_0 ,\acc1[16]_i_4__2_n_0 ,\acc1[16]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[17] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__2_n_6 ),
        .Q(acc1_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[18] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__2_n_5 ),
        .Q(acc1_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[19] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[16]_i_1__2_n_4 ),
        .Q(acc1_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[1] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__2_n_6 ),
        .Q(acc1_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[20] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[20]_i_1__2_n_7 ),
        .Q(acc1_reg[20]),
        .R(1'b0));
  CARRY4 \acc1_reg[20]_i_1__2 
       (.CI(\acc1_reg[16]_i_1__2_n_0 ),
        .CO({\NLW_acc1_reg[20]_i_1__2_CO_UNCONNECTED [3:1],\acc1_reg[20]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_acc1_reg[20]_i_1__2_O_UNCONNECTED [3:2],\acc1_reg[20]_i_1__2_n_6 ,\acc1_reg[20]_i_1__2_n_7 }),
        .S({1'b0,1'b0,\acc1[20]_i_2__2_n_0 ,\acc1[20]_i_3__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[21] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[20]_i_1__2_n_6 ),
        .Q(acc1_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[2] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__2_n_5 ),
        .Q(acc1_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[3] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[0]_i_1__2_n_4 ),
        .Q(acc1_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[4] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__2_n_7 ),
        .Q(acc1_reg[4]),
        .R(1'b0));
  CARRY4 \acc1_reg[4]_i_1__2 
       (.CI(\acc1_reg[0]_i_1__2_n_0 ),
        .CO({\acc1_reg[4]_i_1__2_n_0 ,\acc1_reg[4]_i_1__2_n_1 ,\acc1_reg[4]_i_1__2_n_2 ,\acc1_reg[4]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[4]_i_1__2_n_4 ,\acc1_reg[4]_i_1__2_n_5 ,\acc1_reg[4]_i_1__2_n_6 ,\acc1_reg[4]_i_1__2_n_7 }),
        .S({\acc1[4]_i_2__2_n_0 ,\acc1[4]_i_3__2_n_0 ,\acc1[4]_i_4__2_n_0 ,\acc1[4]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[5] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__2_n_6 ),
        .Q(acc1_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[6] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__2_n_5 ),
        .Q(acc1_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[7] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[4]_i_1__2_n_4 ),
        .Q(acc1_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[8] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__2_n_7 ),
        .Q(acc1_reg[8]),
        .R(1'b0));
  CARRY4 \acc1_reg[8]_i_1__2 
       (.CI(\acc1_reg[4]_i_1__2_n_0 ),
        .CO({\acc1_reg[8]_i_1__2_n_0 ,\acc1_reg[8]_i_1__2_n_1 ,\acc1_reg[8]_i_1__2_n_2 ,\acc1_reg[8]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\acc1_reg[8]_i_1__2_n_4 ,\acc1_reg[8]_i_1__2_n_5 ,\acc1_reg[8]_i_1__2_n_6 ,\acc1_reg[8]_i_1__2_n_7 }),
        .S({\acc1[8]_i_2__2_n_0 ,\acc1[8]_i_3__2_n_0 ,\acc1[8]_i_4__2_n_0 ,\acc1[8]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc1_reg[9] 
       (.C(m_axis_aclk),
        .CE(mdat_i),
        .D(\acc1_reg[8]_i_1__2_n_6 ),
        .Q(acc1_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_2__2 
       (.I0(acc1_reg[3]),
        .I1(acc2_reg[3]),
        .O(\acc2[0]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_3__2 
       (.I0(acc1_reg[2]),
        .I1(acc2_reg[2]),
        .O(\acc2[0]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_4__2 
       (.I0(acc1_reg[1]),
        .I1(acc2_reg[1]),
        .O(\acc2[0]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[0]_i_5__2 
       (.I0(acc1_reg[0]),
        .I1(acc2_reg[0]),
        .O(\acc2[0]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_2__2 
       (.I0(acc1_reg[15]),
        .I1(acc2_reg[15]),
        .O(\acc2[12]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_3__2 
       (.I0(acc1_reg[14]),
        .I1(acc2_reg[14]),
        .O(\acc2[12]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_4__2 
       (.I0(acc1_reg[13]),
        .I1(acc2_reg[13]),
        .O(\acc2[12]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[12]_i_5__2 
       (.I0(acc1_reg[12]),
        .I1(acc2_reg[12]),
        .O(\acc2[12]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_2__2 
       (.I0(acc1_reg[19]),
        .I1(acc2_reg[19]),
        .O(\acc2[16]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_3__2 
       (.I0(acc1_reg[18]),
        .I1(acc2_reg[18]),
        .O(\acc2[16]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_4__2 
       (.I0(acc1_reg[17]),
        .I1(acc2_reg[17]),
        .O(\acc2[16]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[16]_i_5__2 
       (.I0(acc1_reg[16]),
        .I1(acc2_reg[16]),
        .O(\acc2[16]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[20]_i_2__2 
       (.I0(acc2_reg[21]),
        .I1(acc1_reg[21]),
        .O(\acc2[20]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[20]_i_3__2 
       (.I0(acc1_reg[20]),
        .I1(acc2_reg[20]),
        .O(\acc2[20]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_2__2 
       (.I0(acc1_reg[7]),
        .I1(acc2_reg[7]),
        .O(\acc2[4]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_3__2 
       (.I0(acc1_reg[6]),
        .I1(acc2_reg[6]),
        .O(\acc2[4]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_4__2 
       (.I0(acc1_reg[5]),
        .I1(acc2_reg[5]),
        .O(\acc2[4]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[4]_i_5__2 
       (.I0(acc1_reg[4]),
        .I1(acc2_reg[4]),
        .O(\acc2[4]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_2__2 
       (.I0(acc1_reg[11]),
        .I1(acc2_reg[11]),
        .O(\acc2[8]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_3__2 
       (.I0(acc1_reg[10]),
        .I1(acc2_reg[10]),
        .O(\acc2[8]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_4__2 
       (.I0(acc1_reg[9]),
        .I1(acc2_reg[9]),
        .O(\acc2[8]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc2[8]_i_5__2 
       (.I0(acc1_reg[8]),
        .I1(acc2_reg[8]),
        .O(\acc2[8]_i_5__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__2_n_7 ),
        .Q(acc2_reg[0]),
        .R(1'b0));
  CARRY4 \acc2_reg[0]_i_1__2 
       (.CI(1'b0),
        .CO({\acc2_reg[0]_i_1__2_n_0 ,\acc2_reg[0]_i_1__2_n_1 ,\acc2_reg[0]_i_1__2_n_2 ,\acc2_reg[0]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[3:0]),
        .O({\acc2_reg[0]_i_1__2_n_4 ,\acc2_reg[0]_i_1__2_n_5 ,\acc2_reg[0]_i_1__2_n_6 ,\acc2_reg[0]_i_1__2_n_7 }),
        .S({\acc2[0]_i_2__2_n_0 ,\acc2[0]_i_3__2_n_0 ,\acc2[0]_i_4__2_n_0 ,\acc2[0]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__2_n_5 ),
        .Q(acc2_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__2_n_4 ),
        .Q(acc2_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__2_n_7 ),
        .Q(acc2_reg[12]),
        .R(1'b0));
  CARRY4 \acc2_reg[12]_i_1__2 
       (.CI(\acc2_reg[8]_i_1__2_n_0 ),
        .CO({\acc2_reg[12]_i_1__2_n_0 ,\acc2_reg[12]_i_1__2_n_1 ,\acc2_reg[12]_i_1__2_n_2 ,\acc2_reg[12]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[15:12]),
        .O({\acc2_reg[12]_i_1__2_n_4 ,\acc2_reg[12]_i_1__2_n_5 ,\acc2_reg[12]_i_1__2_n_6 ,\acc2_reg[12]_i_1__2_n_7 }),
        .S({\acc2[12]_i_2__2_n_0 ,\acc2[12]_i_3__2_n_0 ,\acc2[12]_i_4__2_n_0 ,\acc2[12]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__2_n_6 ),
        .Q(acc2_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__2_n_5 ),
        .Q(acc2_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[12]_i_1__2_n_4 ),
        .Q(acc2_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[16] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__2_n_7 ),
        .Q(acc2_reg[16]),
        .R(1'b0));
  CARRY4 \acc2_reg[16]_i_1__2 
       (.CI(\acc2_reg[12]_i_1__2_n_0 ),
        .CO({\acc2_reg[16]_i_1__2_n_0 ,\acc2_reg[16]_i_1__2_n_1 ,\acc2_reg[16]_i_1__2_n_2 ,\acc2_reg[16]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[19:16]),
        .O({\acc2_reg[16]_i_1__2_n_4 ,\acc2_reg[16]_i_1__2_n_5 ,\acc2_reg[16]_i_1__2_n_6 ,\acc2_reg[16]_i_1__2_n_7 }),
        .S({\acc2[16]_i_2__2_n_0 ,\acc2[16]_i_3__2_n_0 ,\acc2[16]_i_4__2_n_0 ,\acc2[16]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[17] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__2_n_6 ),
        .Q(acc2_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[18] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__2_n_5 ),
        .Q(acc2_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[19] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[16]_i_1__2_n_4 ),
        .Q(acc2_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__2_n_6 ),
        .Q(acc2_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[20] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[20]_i_1__2_n_7 ),
        .Q(acc2_reg[20]),
        .R(1'b0));
  CARRY4 \acc2_reg[20]_i_1__2 
       (.CI(\acc2_reg[16]_i_1__2_n_0 ),
        .CO({\NLW_acc2_reg[20]_i_1__2_CO_UNCONNECTED [3:1],\acc2_reg[20]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc1_reg[20]}),
        .O({\NLW_acc2_reg[20]_i_1__2_O_UNCONNECTED [3:2],\acc2_reg[20]_i_1__2_n_6 ,\acc2_reg[20]_i_1__2_n_7 }),
        .S({1'b0,1'b0,\acc2[20]_i_2__2_n_0 ,\acc2[20]_i_3__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[21] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[20]_i_1__2_n_6 ),
        .Q(acc2_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__2_n_5 ),
        .Q(acc2_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[0]_i_1__2_n_4 ),
        .Q(acc2_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__2_n_7 ),
        .Q(acc2_reg[4]),
        .R(1'b0));
  CARRY4 \acc2_reg[4]_i_1__2 
       (.CI(\acc2_reg[0]_i_1__2_n_0 ),
        .CO({\acc2_reg[4]_i_1__2_n_0 ,\acc2_reg[4]_i_1__2_n_1 ,\acc2_reg[4]_i_1__2_n_2 ,\acc2_reg[4]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[7:4]),
        .O({\acc2_reg[4]_i_1__2_n_4 ,\acc2_reg[4]_i_1__2_n_5 ,\acc2_reg[4]_i_1__2_n_6 ,\acc2_reg[4]_i_1__2_n_7 }),
        .S({\acc2[4]_i_2__2_n_0 ,\acc2[4]_i_3__2_n_0 ,\acc2[4]_i_4__2_n_0 ,\acc2[4]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__2_n_6 ),
        .Q(acc2_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__2_n_5 ),
        .Q(acc2_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[4]_i_1__2_n_4 ),
        .Q(acc2_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__2_n_7 ),
        .Q(acc2_reg[8]),
        .R(1'b0));
  CARRY4 \acc2_reg[8]_i_1__2 
       (.CI(\acc2_reg[4]_i_1__2_n_0 ),
        .CO({\acc2_reg[8]_i_1__2_n_0 ,\acc2_reg[8]_i_1__2_n_1 ,\acc2_reg[8]_i_1__2_n_2 ,\acc2_reg[8]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc1_reg[11:8]),
        .O({\acc2_reg[8]_i_1__2_n_4 ,\acc2_reg[8]_i_1__2_n_5 ,\acc2_reg[8]_i_1__2_n_6 ,\acc2_reg[8]_i_1__2_n_7 }),
        .S({\acc2[8]_i_2__2_n_0 ,\acc2[8]_i_3__2_n_0 ,\acc2[8]_i_4__2_n_0 ,\acc2[8]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc2_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc2_reg[8]_i_1__2_n_6 ),
        .Q(acc2_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_2__2 
       (.I0(acc2_reg[3]),
        .I1(acc3_reg[3]),
        .O(\acc3[0]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_3__2 
       (.I0(acc2_reg[2]),
        .I1(acc3_reg[2]),
        .O(\acc3[0]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_4__2 
       (.I0(acc2_reg[1]),
        .I1(acc3_reg[1]),
        .O(\acc3[0]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[0]_i_5__2 
       (.I0(acc2_reg[0]),
        .I1(acc3_reg[0]),
        .O(\acc3[0]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_2__2 
       (.I0(acc2_reg[15]),
        .I1(acc3_reg[15]),
        .O(\acc3[12]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_3__2 
       (.I0(acc2_reg[14]),
        .I1(acc3_reg[14]),
        .O(\acc3[12]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_4__2 
       (.I0(acc2_reg[13]),
        .I1(acc3_reg[13]),
        .O(\acc3[12]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[12]_i_5__2 
       (.I0(acc2_reg[12]),
        .I1(acc3_reg[12]),
        .O(\acc3[12]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_2__2 
       (.I0(acc2_reg[19]),
        .I1(acc3_reg[19]),
        .O(\acc3[16]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_3__2 
       (.I0(acc2_reg[18]),
        .I1(acc3_reg[18]),
        .O(\acc3[16]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_4__2 
       (.I0(acc2_reg[17]),
        .I1(acc3_reg[17]),
        .O(\acc3[16]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[16]_i_5__2 
       (.I0(acc2_reg[16]),
        .I1(acc3_reg[16]),
        .O(\acc3[16]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[20]_i_2__2 
       (.I0(acc2_reg[21]),
        .I1(acc3_reg[21]),
        .O(\acc3[20]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[20]_i_3__2 
       (.I0(acc2_reg[20]),
        .I1(acc3_reg[20]),
        .O(\acc3[20]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_2__2 
       (.I0(acc2_reg[7]),
        .I1(acc3_reg[7]),
        .O(\acc3[4]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_3__2 
       (.I0(acc2_reg[6]),
        .I1(acc3_reg[6]),
        .O(\acc3[4]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_4__2 
       (.I0(acc2_reg[5]),
        .I1(acc3_reg[5]),
        .O(\acc3[4]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[4]_i_5__2 
       (.I0(acc2_reg[4]),
        .I1(acc3_reg[4]),
        .O(\acc3[4]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_2__2 
       (.I0(acc2_reg[11]),
        .I1(acc3_reg[11]),
        .O(\acc3[8]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_3__2 
       (.I0(acc2_reg[10]),
        .I1(acc3_reg[10]),
        .O(\acc3[8]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_4__2 
       (.I0(acc2_reg[9]),
        .I1(acc3_reg[9]),
        .O(\acc3[8]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc3[8]_i_5__2 
       (.I0(acc2_reg[8]),
        .I1(acc3_reg[8]),
        .O(\acc3[8]_i_5__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[0]),
        .Q(acc3_d2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[10]),
        .Q(acc3_d2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[11]),
        .Q(acc3_d2[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[12]),
        .Q(acc3_d2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[13]),
        .Q(acc3_d2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[14]),
        .Q(acc3_d2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[15]),
        .Q(acc3_d2[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[16]),
        .Q(acc3_d2[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[17]),
        .Q(acc3_d2[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[18]),
        .Q(acc3_d2[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[19]),
        .Q(acc3_d2[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[1]),
        .Q(acc3_d2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[20]),
        .Q(acc3_d2[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[21]),
        .Q(acc3_d2[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[2]),
        .Q(acc3_d2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[3]),
        .Q(acc3_d2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[4]),
        .Q(acc3_d2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[5]),
        .Q(acc3_d2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[6]),
        .Q(acc3_d2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[7]),
        .Q(acc3_d2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[8]),
        .Q(acc3_d2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_d2_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(acc3_reg[9]),
        .Q(acc3_d2[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__2_n_7 ),
        .Q(acc3_reg[0]),
        .R(1'b0));
  CARRY4 \acc3_reg[0]_i_1__2 
       (.CI(1'b0),
        .CO({\acc3_reg[0]_i_1__2_n_0 ,\acc3_reg[0]_i_1__2_n_1 ,\acc3_reg[0]_i_1__2_n_2 ,\acc3_reg[0]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[3:0]),
        .O({\acc3_reg[0]_i_1__2_n_4 ,\acc3_reg[0]_i_1__2_n_5 ,\acc3_reg[0]_i_1__2_n_6 ,\acc3_reg[0]_i_1__2_n_7 }),
        .S({\acc3[0]_i_2__2_n_0 ,\acc3[0]_i_3__2_n_0 ,\acc3[0]_i_4__2_n_0 ,\acc3[0]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__2_n_5 ),
        .Q(acc3_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__2_n_4 ),
        .Q(acc3_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__2_n_7 ),
        .Q(acc3_reg[12]),
        .R(1'b0));
  CARRY4 \acc3_reg[12]_i_1__2 
       (.CI(\acc3_reg[8]_i_1__2_n_0 ),
        .CO({\acc3_reg[12]_i_1__2_n_0 ,\acc3_reg[12]_i_1__2_n_1 ,\acc3_reg[12]_i_1__2_n_2 ,\acc3_reg[12]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[15:12]),
        .O({\acc3_reg[12]_i_1__2_n_4 ,\acc3_reg[12]_i_1__2_n_5 ,\acc3_reg[12]_i_1__2_n_6 ,\acc3_reg[12]_i_1__2_n_7 }),
        .S({\acc3[12]_i_2__2_n_0 ,\acc3[12]_i_3__2_n_0 ,\acc3[12]_i_4__2_n_0 ,\acc3[12]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__2_n_6 ),
        .Q(acc3_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__2_n_5 ),
        .Q(acc3_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[12]_i_1__2_n_4 ),
        .Q(acc3_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[16] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__2_n_7 ),
        .Q(acc3_reg[16]),
        .R(1'b0));
  CARRY4 \acc3_reg[16]_i_1__2 
       (.CI(\acc3_reg[12]_i_1__2_n_0 ),
        .CO({\acc3_reg[16]_i_1__2_n_0 ,\acc3_reg[16]_i_1__2_n_1 ,\acc3_reg[16]_i_1__2_n_2 ,\acc3_reg[16]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[19:16]),
        .O({\acc3_reg[16]_i_1__2_n_4 ,\acc3_reg[16]_i_1__2_n_5 ,\acc3_reg[16]_i_1__2_n_6 ,\acc3_reg[16]_i_1__2_n_7 }),
        .S({\acc3[16]_i_2__2_n_0 ,\acc3[16]_i_3__2_n_0 ,\acc3[16]_i_4__2_n_0 ,\acc3[16]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[17] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__2_n_6 ),
        .Q(acc3_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[18] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__2_n_5 ),
        .Q(acc3_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[19] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[16]_i_1__2_n_4 ),
        .Q(acc3_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__2_n_6 ),
        .Q(acc3_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[20] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[20]_i_1__2_n_7 ),
        .Q(acc3_reg[20]),
        .R(1'b0));
  CARRY4 \acc3_reg[20]_i_1__2 
       (.CI(\acc3_reg[16]_i_1__2_n_0 ),
        .CO({\NLW_acc3_reg[20]_i_1__2_CO_UNCONNECTED [3:1],\acc3_reg[20]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc2_reg[20]}),
        .O({\NLW_acc3_reg[20]_i_1__2_O_UNCONNECTED [3:2],\acc3_reg[20]_i_1__2_n_6 ,\acc3_reg[20]_i_1__2_n_7 }),
        .S({1'b0,1'b0,\acc3[20]_i_2__2_n_0 ,\acc3[20]_i_3__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[21] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[20]_i_1__2_n_6 ),
        .Q(acc3_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__2_n_5 ),
        .Q(acc3_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[0]_i_1__2_n_4 ),
        .Q(acc3_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__2_n_7 ),
        .Q(acc3_reg[4]),
        .R(1'b0));
  CARRY4 \acc3_reg[4]_i_1__2 
       (.CI(\acc3_reg[0]_i_1__2_n_0 ),
        .CO({\acc3_reg[4]_i_1__2_n_0 ,\acc3_reg[4]_i_1__2_n_1 ,\acc3_reg[4]_i_1__2_n_2 ,\acc3_reg[4]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[7:4]),
        .O({\acc3_reg[4]_i_1__2_n_4 ,\acc3_reg[4]_i_1__2_n_5 ,\acc3_reg[4]_i_1__2_n_6 ,\acc3_reg[4]_i_1__2_n_7 }),
        .S({\acc3[4]_i_2__2_n_0 ,\acc3[4]_i_3__2_n_0 ,\acc3[4]_i_4__2_n_0 ,\acc3[4]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__2_n_6 ),
        .Q(acc3_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__2_n_5 ),
        .Q(acc3_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[4]_i_1__2_n_4 ),
        .Q(acc3_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__2_n_7 ),
        .Q(acc3_reg[8]),
        .R(1'b0));
  CARRY4 \acc3_reg[8]_i_1__2 
       (.CI(\acc3_reg[4]_i_1__2_n_0 ),
        .CO({\acc3_reg[8]_i_1__2_n_0 ,\acc3_reg[8]_i_1__2_n_1 ,\acc3_reg[8]_i_1__2_n_2 ,\acc3_reg[8]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc2_reg[11:8]),
        .O({\acc3_reg[8]_i_1__2_n_4 ,\acc3_reg[8]_i_1__2_n_5 ,\acc3_reg[8]_i_1__2_n_6 ,\acc3_reg[8]_i_1__2_n_7 }),
        .S({\acc3[8]_i_2__2_n_0 ,\acc3[8]_i_3__2_n_0 ,\acc3[8]_i_4__2_n_0 ,\acc3[8]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc3_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\acc3_reg[8]_i_1__2_n_6 ),
        .Q(acc3_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_2__2 
       (.I0(acc3_reg[11]),
        .I1(acc3_d2[11]),
        .O(\diff1[11]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_3__2 
       (.I0(acc3_reg[10]),
        .I1(acc3_d2[10]),
        .O(\diff1[11]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_4__2 
       (.I0(acc3_reg[9]),
        .I1(acc3_d2[9]),
        .O(\diff1[11]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[11]_i_5__2 
       (.I0(acc3_reg[8]),
        .I1(acc3_d2[8]),
        .O(\diff1[11]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_2__2 
       (.I0(acc3_reg[15]),
        .I1(acc3_d2[15]),
        .O(\diff1[15]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_3__2 
       (.I0(acc3_reg[14]),
        .I1(acc3_d2[14]),
        .O(\diff1[15]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_4__2 
       (.I0(acc3_reg[13]),
        .I1(acc3_d2[13]),
        .O(\diff1[15]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[15]_i_5__2 
       (.I0(acc3_reg[12]),
        .I1(acc3_d2[12]),
        .O(\diff1[15]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_2__2 
       (.I0(acc3_reg[19]),
        .I1(acc3_d2[19]),
        .O(\diff1[19]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_3__2 
       (.I0(acc3_reg[18]),
        .I1(acc3_d2[18]),
        .O(\diff1[19]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_4__2 
       (.I0(acc3_reg[17]),
        .I1(acc3_d2[17]),
        .O(\diff1[19]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[19]_i_5__2 
       (.I0(acc3_reg[16]),
        .I1(acc3_d2[16]),
        .O(\diff1[19]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[21]_i_2__2 
       (.I0(acc3_reg[21]),
        .I1(acc3_d2[21]),
        .O(\diff1[21]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[21]_i_3__2 
       (.I0(acc3_reg[20]),
        .I1(acc3_d2[20]),
        .O(\diff1[21]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_2__2 
       (.I0(acc3_reg[3]),
        .I1(acc3_d2[3]),
        .O(\diff1[3]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_3__2 
       (.I0(acc3_reg[2]),
        .I1(acc3_d2[2]),
        .O(\diff1[3]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_4__2 
       (.I0(acc3_reg[1]),
        .I1(acc3_d2[1]),
        .O(\diff1[3]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[3]_i_5__2 
       (.I0(acc3_reg[0]),
        .I1(acc3_d2[0]),
        .O(\diff1[3]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_2__2 
       (.I0(acc3_reg[7]),
        .I1(acc3_d2[7]),
        .O(\diff1[7]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_3__2 
       (.I0(acc3_reg[6]),
        .I1(acc3_d2[6]),
        .O(\diff1[7]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_4__2 
       (.I0(acc3_reg[5]),
        .I1(acc3_d2[5]),
        .O(\diff1[7]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff1[7]_i_5__2 
       (.I0(acc3_reg[4]),
        .I1(acc3_d2[4]),
        .O(\diff1[7]_i_5__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[0]),
        .Q(diff1_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[10]),
        .Q(diff1_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[11]),
        .Q(diff1_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[12]),
        .Q(diff1_d[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[13]),
        .Q(diff1_d[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[14]),
        .Q(diff1_d[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[15]),
        .Q(diff1_d[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[16]),
        .Q(diff1_d[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[17]),
        .Q(diff1_d[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[18]),
        .Q(diff1_d[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[19]),
        .Q(diff1_d[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[1]),
        .Q(diff1_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[20]),
        .Q(diff1_d[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[21]),
        .Q(diff1_d[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[2]),
        .Q(diff1_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[3]),
        .Q(diff1_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[4]),
        .Q(diff1_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[5]),
        .Q(diff1_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[6]),
        .Q(diff1_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[7]),
        .Q(diff1_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[8]),
        .Q(diff1_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_d_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff1[9]),
        .Q(diff1_d[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[0]),
        .Q(diff1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[10]),
        .Q(diff1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[11]),
        .Q(diff1[11]),
        .R(1'b0));
  CARRY4 \diff1_reg[11]_i_1__2 
       (.CI(\diff1_reg[7]_i_1__2_n_0 ),
        .CO({\diff1_reg[11]_i_1__2_n_0 ,\diff1_reg[11]_i_1__2_n_1 ,\diff1_reg[11]_i_1__2_n_2 ,\diff1_reg[11]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[11:8]),
        .O(diff102_out[11:8]),
        .S({\diff1[11]_i_2__2_n_0 ,\diff1[11]_i_3__2_n_0 ,\diff1[11]_i_4__2_n_0 ,\diff1[11]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[12]),
        .Q(diff1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[13]),
        .Q(diff1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[14]),
        .Q(diff1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[15]),
        .Q(diff1[15]),
        .R(1'b0));
  CARRY4 \diff1_reg[15]_i_1__2 
       (.CI(\diff1_reg[11]_i_1__2_n_0 ),
        .CO({\diff1_reg[15]_i_1__2_n_0 ,\diff1_reg[15]_i_1__2_n_1 ,\diff1_reg[15]_i_1__2_n_2 ,\diff1_reg[15]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[15:12]),
        .O(diff102_out[15:12]),
        .S({\diff1[15]_i_2__2_n_0 ,\diff1[15]_i_3__2_n_0 ,\diff1[15]_i_4__2_n_0 ,\diff1[15]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[16]),
        .Q(diff1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[17]),
        .Q(diff1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[18]),
        .Q(diff1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[19]),
        .Q(diff1[19]),
        .R(1'b0));
  CARRY4 \diff1_reg[19]_i_1__2 
       (.CI(\diff1_reg[15]_i_1__2_n_0 ),
        .CO({\diff1_reg[19]_i_1__2_n_0 ,\diff1_reg[19]_i_1__2_n_1 ,\diff1_reg[19]_i_1__2_n_2 ,\diff1_reg[19]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[19:16]),
        .O(diff102_out[19:16]),
        .S({\diff1[19]_i_2__2_n_0 ,\diff1[19]_i_3__2_n_0 ,\diff1[19]_i_4__2_n_0 ,\diff1[19]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[1]),
        .Q(diff1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[20]),
        .Q(diff1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[21]),
        .Q(diff1[21]),
        .R(1'b0));
  CARRY4 \diff1_reg[21]_i_1__2 
       (.CI(\diff1_reg[19]_i_1__2_n_0 ),
        .CO({\NLW_diff1_reg[21]_i_1__2_CO_UNCONNECTED [3:1],\diff1_reg[21]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,acc3_reg[20]}),
        .O({\NLW_diff1_reg[21]_i_1__2_O_UNCONNECTED [3:2],diff102_out[21:20]}),
        .S({1'b0,1'b0,\diff1[21]_i_2__2_n_0 ,\diff1[21]_i_3__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[2]),
        .Q(diff1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[3]),
        .Q(diff1[3]),
        .R(1'b0));
  CARRY4 \diff1_reg[3]_i_1__2 
       (.CI(1'b0),
        .CO({\diff1_reg[3]_i_1__2_n_0 ,\diff1_reg[3]_i_1__2_n_1 ,\diff1_reg[3]_i_1__2_n_2 ,\diff1_reg[3]_i_1__2_n_3 }),
        .CYINIT(1'b1),
        .DI(acc3_reg[3:0]),
        .O(diff102_out[3:0]),
        .S({\diff1[3]_i_2__2_n_0 ,\diff1[3]_i_3__2_n_0 ,\diff1[3]_i_4__2_n_0 ,\diff1[3]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[4]),
        .Q(diff1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[5]),
        .Q(diff1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[6]),
        .Q(diff1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[7]),
        .Q(diff1[7]),
        .R(1'b0));
  CARRY4 \diff1_reg[7]_i_1__2 
       (.CI(\diff1_reg[3]_i_1__2_n_0 ),
        .CO({\diff1_reg[7]_i_1__2_n_0 ,\diff1_reg[7]_i_1__2_n_1 ,\diff1_reg[7]_i_1__2_n_2 ,\diff1_reg[7]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(acc3_reg[7:4]),
        .O(diff102_out[7:4]),
        .S({\diff1[7]_i_2__2_n_0 ,\diff1[7]_i_3__2_n_0 ,\diff1[7]_i_4__2_n_0 ,\diff1[7]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[8]),
        .Q(diff1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff1_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff102_out[9]),
        .Q(diff1[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_2__2 
       (.I0(diff1[11]),
        .I1(diff1_d[11]),
        .O(\diff2[11]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_3__2 
       (.I0(diff1[10]),
        .I1(diff1_d[10]),
        .O(\diff2[11]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_4__2 
       (.I0(diff1[9]),
        .I1(diff1_d[9]),
        .O(\diff2[11]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[11]_i_5__2 
       (.I0(diff1[8]),
        .I1(diff1_d[8]),
        .O(\diff2[11]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_2__2 
       (.I0(diff1[15]),
        .I1(diff1_d[15]),
        .O(\diff2[15]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_3__2 
       (.I0(diff1[14]),
        .I1(diff1_d[14]),
        .O(\diff2[15]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_4__2 
       (.I0(diff1[13]),
        .I1(diff1_d[13]),
        .O(\diff2[15]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[15]_i_5__2 
       (.I0(diff1[12]),
        .I1(diff1_d[12]),
        .O(\diff2[15]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_2__2 
       (.I0(diff1[19]),
        .I1(diff1_d[19]),
        .O(\diff2[19]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_3__2 
       (.I0(diff1[18]),
        .I1(diff1_d[18]),
        .O(\diff2[19]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_4__2 
       (.I0(diff1[17]),
        .I1(diff1_d[17]),
        .O(\diff2[19]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[19]_i_5__2 
       (.I0(diff1[16]),
        .I1(diff1_d[16]),
        .O(\diff2[19]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[21]_i_2__2 
       (.I0(diff1[21]),
        .I1(diff1_d[21]),
        .O(\diff2[21]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[21]_i_3__2 
       (.I0(diff1[20]),
        .I1(diff1_d[20]),
        .O(\diff2[21]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_2__2 
       (.I0(diff1[3]),
        .I1(diff1_d[3]),
        .O(\diff2[3]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_3__2 
       (.I0(diff1[2]),
        .I1(diff1_d[2]),
        .O(\diff2[3]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_4__2 
       (.I0(diff1[1]),
        .I1(diff1_d[1]),
        .O(\diff2[3]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[3]_i_5__2 
       (.I0(diff1[0]),
        .I1(diff1_d[0]),
        .O(\diff2[3]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_2__2 
       (.I0(diff1[7]),
        .I1(diff1_d[7]),
        .O(\diff2[7]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_3__2 
       (.I0(diff1[6]),
        .I1(diff1_d[6]),
        .O(\diff2[7]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_4__2 
       (.I0(diff1[5]),
        .I1(diff1_d[5]),
        .O(\diff2[7]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff2[7]_i_5__2 
       (.I0(diff1[4]),
        .I1(diff1_d[4]),
        .O(\diff2[7]_i_5__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[0]),
        .Q(diff2_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[10]),
        .Q(diff2_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[11]),
        .Q(diff2_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[12]),
        .Q(diff2_d[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[13]),
        .Q(diff2_d[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[14]),
        .Q(diff2_d[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[15]),
        .Q(diff2_d[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[16]),
        .Q(diff2_d[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[17]),
        .Q(diff2_d[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[18]),
        .Q(diff2_d[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[19]),
        .Q(diff2_d[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[1]),
        .Q(diff2_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[20]),
        .Q(diff2_d[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[21]),
        .Q(diff2_d[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[2]),
        .Q(diff2_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[3]),
        .Q(diff2_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[4]),
        .Q(diff2_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[5]),
        .Q(diff2_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[6]),
        .Q(diff2_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[7]),
        .Q(diff2_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[8]),
        .Q(diff2_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_d_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff2[9]),
        .Q(diff2_d[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[0]),
        .Q(diff2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[10]),
        .Q(diff2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[11]),
        .Q(diff2[11]),
        .R(1'b0));
  CARRY4 \diff2_reg[11]_i_1__2 
       (.CI(\diff2_reg[7]_i_1__2_n_0 ),
        .CO({\diff2_reg[11]_i_1__2_n_0 ,\diff2_reg[11]_i_1__2_n_1 ,\diff2_reg[11]_i_1__2_n_2 ,\diff2_reg[11]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[11:8]),
        .O(diff201_out[11:8]),
        .S({\diff2[11]_i_2__2_n_0 ,\diff2[11]_i_3__2_n_0 ,\diff2[11]_i_4__2_n_0 ,\diff2[11]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[12]),
        .Q(diff2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[13]),
        .Q(diff2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[14]),
        .Q(diff2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[15]),
        .Q(diff2[15]),
        .R(1'b0));
  CARRY4 \diff2_reg[15]_i_1__2 
       (.CI(\diff2_reg[11]_i_1__2_n_0 ),
        .CO({\diff2_reg[15]_i_1__2_n_0 ,\diff2_reg[15]_i_1__2_n_1 ,\diff2_reg[15]_i_1__2_n_2 ,\diff2_reg[15]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[15:12]),
        .O(diff201_out[15:12]),
        .S({\diff2[15]_i_2__2_n_0 ,\diff2[15]_i_3__2_n_0 ,\diff2[15]_i_4__2_n_0 ,\diff2[15]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[16]),
        .Q(diff2[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[17]),
        .Q(diff2[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[18]),
        .Q(diff2[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[19]),
        .Q(diff2[19]),
        .R(1'b0));
  CARRY4 \diff2_reg[19]_i_1__2 
       (.CI(\diff2_reg[15]_i_1__2_n_0 ),
        .CO({\diff2_reg[19]_i_1__2_n_0 ,\diff2_reg[19]_i_1__2_n_1 ,\diff2_reg[19]_i_1__2_n_2 ,\diff2_reg[19]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[19:16]),
        .O(diff201_out[19:16]),
        .S({\diff2[19]_i_2__2_n_0 ,\diff2[19]_i_3__2_n_0 ,\diff2[19]_i_4__2_n_0 ,\diff2[19]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[1]),
        .Q(diff2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[20]),
        .Q(diff2[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[21]),
        .Q(diff2[21]),
        .R(1'b0));
  CARRY4 \diff2_reg[21]_i_1__2 
       (.CI(\diff2_reg[19]_i_1__2_n_0 ),
        .CO({\NLW_diff2_reg[21]_i_1__2_CO_UNCONNECTED [3:1],\diff2_reg[21]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,diff1[20]}),
        .O({\NLW_diff2_reg[21]_i_1__2_O_UNCONNECTED [3:2],diff201_out[21:20]}),
        .S({1'b0,1'b0,\diff2[21]_i_2__2_n_0 ,\diff2[21]_i_3__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[2]),
        .Q(diff2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[3]),
        .Q(diff2[3]),
        .R(1'b0));
  CARRY4 \diff2_reg[3]_i_1__2 
       (.CI(1'b0),
        .CO({\diff2_reg[3]_i_1__2_n_0 ,\diff2_reg[3]_i_1__2_n_1 ,\diff2_reg[3]_i_1__2_n_2 ,\diff2_reg[3]_i_1__2_n_3 }),
        .CYINIT(1'b1),
        .DI(diff1[3:0]),
        .O(diff201_out[3:0]),
        .S({\diff2[3]_i_2__2_n_0 ,\diff2[3]_i_3__2_n_0 ,\diff2[3]_i_4__2_n_0 ,\diff2[3]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[4]),
        .Q(diff2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[5]),
        .Q(diff2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[6]),
        .Q(diff2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[7]),
        .Q(diff2[7]),
        .R(1'b0));
  CARRY4 \diff2_reg[7]_i_1__2 
       (.CI(\diff2_reg[3]_i_1__2_n_0 ),
        .CO({\diff2_reg[7]_i_1__2_n_0 ,\diff2_reg[7]_i_1__2_n_1 ,\diff2_reg[7]_i_1__2_n_2 ,\diff2_reg[7]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(diff1[7:4]),
        .O(diff201_out[7:4]),
        .S({\diff2[7]_i_2__2_n_0 ,\diff2[7]_i_3__2_n_0 ,\diff2[7]_i_4__2_n_0 ,\diff2[7]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[8]),
        .Q(diff2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff2_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff201_out[9]),
        .Q(diff2[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_2__2 
       (.I0(diff2[11]),
        .I1(diff2_d[11]),
        .O(\diff3[11]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_3__2 
       (.I0(diff2[10]),
        .I1(diff2_d[10]),
        .O(\diff3[11]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_4__2 
       (.I0(diff2[9]),
        .I1(diff2_d[9]),
        .O(\diff3[11]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[11]_i_5__2 
       (.I0(diff2[8]),
        .I1(diff2_d[8]),
        .O(\diff3[11]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_2__2 
       (.I0(diff2[15]),
        .I1(diff2_d[15]),
        .O(\diff3[15]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_3__2 
       (.I0(diff2[14]),
        .I1(diff2_d[14]),
        .O(\diff3[15]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_4__2 
       (.I0(diff2[13]),
        .I1(diff2_d[13]),
        .O(\diff3[15]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[15]_i_5__2 
       (.I0(diff2[12]),
        .I1(diff2_d[12]),
        .O(\diff3[15]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_2__2 
       (.I0(diff2[19]),
        .I1(diff2_d[19]),
        .O(\diff3[19]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_3__2 
       (.I0(diff2[18]),
        .I1(diff2_d[18]),
        .O(\diff3[19]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_4__2 
       (.I0(diff2[17]),
        .I1(diff2_d[17]),
        .O(\diff3[19]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[19]_i_5__2 
       (.I0(diff2[16]),
        .I1(diff2_d[16]),
        .O(\diff3[19]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[21]_i_2__2 
       (.I0(diff2[21]),
        .I1(diff2_d[21]),
        .O(\diff3[21]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[21]_i_3__2 
       (.I0(diff2[20]),
        .I1(diff2_d[20]),
        .O(\diff3[21]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_10__2 
       (.I0(diff2[0]),
        .I1(diff2_d[0]),
        .O(\diff3[7]_i_10__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_3__2 
       (.I0(diff2[7]),
        .I1(diff2_d[7]),
        .O(\diff3[7]_i_3__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_4__2 
       (.I0(diff2[6]),
        .I1(diff2_d[6]),
        .O(\diff3[7]_i_4__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_5__2 
       (.I0(diff2[5]),
        .I1(diff2_d[5]),
        .O(\diff3[7]_i_5__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_6__2 
       (.I0(diff2[4]),
        .I1(diff2_d[4]),
        .O(\diff3[7]_i_6__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_7__2 
       (.I0(diff2[3]),
        .I1(diff2_d[3]),
        .O(\diff3[7]_i_7__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_8__2 
       (.I0(diff2[2]),
        .I1(diff2_d[2]),
        .O(\diff3[7]_i_8__2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \diff3[7]_i_9__2 
       (.I0(diff2[1]),
        .I1(diff2_d[1]),
        .O(\diff3[7]_i_9__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[10]),
        .Q(data0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[11]),
        .Q(data0[3]),
        .R(1'b0));
  CARRY4 \diff3_reg[11]_i_1__2 
       (.CI(\diff3_reg[7]_i_1__2_n_0 ),
        .CO({\diff3_reg[11]_i_1__2_n_0 ,\diff3_reg[11]_i_1__2_n_1 ,\diff3_reg[11]_i_1__2_n_2 ,\diff3_reg[11]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[11:8]),
        .O(diff300_out[11:8]),
        .S({\diff3[11]_i_2__2_n_0 ,\diff3[11]_i_3__2_n_0 ,\diff3[11]_i_4__2_n_0 ,\diff3[11]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[12]),
        .Q(data0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[13]),
        .Q(data0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[14]),
        .Q(data0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[15]),
        .Q(data0[7]),
        .R(1'b0));
  CARRY4 \diff3_reg[15]_i_1__2 
       (.CI(\diff3_reg[11]_i_1__2_n_0 ),
        .CO({\diff3_reg[15]_i_1__2_n_0 ,\diff3_reg[15]_i_1__2_n_1 ,\diff3_reg[15]_i_1__2_n_2 ,\diff3_reg[15]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[15:12]),
        .O(diff300_out[15:12]),
        .S({\diff3[15]_i_2__2_n_0 ,\diff3[15]_i_3__2_n_0 ,\diff3[15]_i_4__2_n_0 ,\diff3[15]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[16] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[16]),
        .Q(data0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[17] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[17]),
        .Q(data0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[18] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[18]),
        .Q(data0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[19] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[19]),
        .Q(data0[11]),
        .R(1'b0));
  CARRY4 \diff3_reg[19]_i_1__2 
       (.CI(\diff3_reg[15]_i_1__2_n_0 ),
        .CO({\diff3_reg[19]_i_1__2_n_0 ,\diff3_reg[19]_i_1__2_n_1 ,\diff3_reg[19]_i_1__2_n_2 ,\diff3_reg[19]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[19:16]),
        .O(diff300_out[19:16]),
        .S({\diff3[19]_i_2__2_n_0 ,\diff3[19]_i_3__2_n_0 ,\diff3[19]_i_4__2_n_0 ,\diff3[19]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[20] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[20]),
        .Q(data0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[21] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[21]),
        .Q(data0[13]),
        .R(1'b0));
  CARRY4 \diff3_reg[21]_i_1__2 
       (.CI(\diff3_reg[19]_i_1__2_n_0 ),
        .CO({\NLW_diff3_reg[21]_i_1__2_CO_UNCONNECTED [3:1],\diff3_reg[21]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,diff2[20]}),
        .O({\NLW_diff3_reg[21]_i_1__2_O_UNCONNECTED [3:2],diff300_out[21:20]}),
        .S({1'b0,1'b0,\diff3[21]_i_2__2_n_0 ,\diff3[21]_i_3__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[5]),
        .Q(\diff3_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[6]),
        .Q(\diff3_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[7]),
        .Q(\diff3_reg_n_0_[7] ),
        .R(1'b0));
  CARRY4 \diff3_reg[7]_i_1__2 
       (.CI(\diff3_reg[7]_i_2__2_n_0 ),
        .CO({\diff3_reg[7]_i_1__2_n_0 ,\diff3_reg[7]_i_1__2_n_1 ,\diff3_reg[7]_i_1__2_n_2 ,\diff3_reg[7]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI(diff2[7:4]),
        .O({diff300_out[7:5],\NLW_diff3_reg[7]_i_1__2_O_UNCONNECTED [0]}),
        .S({\diff3[7]_i_3__2_n_0 ,\diff3[7]_i_4__2_n_0 ,\diff3[7]_i_5__2_n_0 ,\diff3[7]_i_6__2_n_0 }));
  CARRY4 \diff3_reg[7]_i_2__2 
       (.CI(1'b0),
        .CO({\diff3_reg[7]_i_2__2_n_0 ,\diff3_reg[7]_i_2__2_n_1 ,\diff3_reg[7]_i_2__2_n_2 ,\diff3_reg[7]_i_2__2_n_3 }),
        .CYINIT(1'b1),
        .DI(diff2[3:0]),
        .O(\NLW_diff3_reg[7]_i_2__2_O_UNCONNECTED [3:0]),
        .S({\diff3[7]_i_7__2_n_0 ,\diff3[7]_i_8__2_n_0 ,\diff3[7]_i_9__2_n_0 ,\diff3[7]_i_10__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[8]),
        .Q(data0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \diff3_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(diff300_out[9]),
        .Q(data0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mdat_i_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(din),
        .Q(mdat_i),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \signed_gen[3].ch_s_data[3][15]_i_1 
       (.I0(\ch_data[3]_3 ),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    \tdata[0]_i_1__2 
       (.I0(\diff3_reg_n_0_[5] ),
        .I1(\tdata[0]_i_2__2_n_0 ),
        .I2(\tdata[0]_i_3__2_n_0 ),
        .I3(\tdata[0]_i_4__2_n_0 ),
        .I4(\tdata[0]_i_5__2_n_0 ),
        .O(p_1_in));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \tdata[0]_i_2__2 
       (.I0(data0[11]),
        .I1(data0[10]),
        .I2(data0[13]),
        .I3(data0[12]),
        .O(\tdata[0]_i_2__2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tdata[0]_i_3__2 
       (.I0(data0[1]),
        .I1(\diff3_reg_n_0_[6] ),
        .I2(data0[3]),
        .I3(data0[4]),
        .O(\tdata[0]_i_3__2_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \tdata[0]_i_4__2 
       (.I0(data0[9]),
        .I1(data0[6]),
        .I2(data0[8]),
        .I3(data0[7]),
        .O(\tdata[0]_i_4__2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tdata[0]_i_5__2 
       (.I0(data0[0]),
        .I1(\diff3_reg_n_0_[7] ),
        .I2(data0[2]),
        .I3(data0[5]),
        .O(\tdata[0]_i_5__2_n_0 ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \tdata[15]_i_1__2 
       (.I0(\diff3_reg_n_0_[5] ),
        .I1(\tdata[0]_i_5__2_n_0 ),
        .I2(\tdata[0]_i_4__2_n_0 ),
        .I3(\tdata[0]_i_3__2_n_0 ),
        .I4(\tdata[0]_i_2__2_n_0 ),
        .I5(word_clk),
        .O(\tdata[15]_i_1__2_n_0 ));
  FDRE \tdata_reg[0] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(p_1_in),
        .Q(D[0]),
        .R(1'b0));
  FDSE \tdata_reg[10] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[7]),
        .Q(D[10]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[11] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[8]),
        .Q(D[11]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[12] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[9]),
        .Q(D[12]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[13] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[10]),
        .Q(D[13]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[14] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[11]),
        .Q(D[14]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[15] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[12]),
        .Q(\ch_data[3]_3 ),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[1] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(\diff3_reg_n_0_[6] ),
        .Q(D[1]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[2] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(\diff3_reg_n_0_[7] ),
        .Q(D[2]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[3] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[0]),
        .Q(D[3]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[4] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[1]),
        .Q(D[4]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[5] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[2]),
        .Q(D[5]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[6] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[3]),
        .Q(D[6]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[7] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[4]),
        .Q(D[7]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[8] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[5]),
        .Q(D[8]),
        .S(\tdata[15]_i_1__2_n_0 ));
  FDSE \tdata_reg[9] 
       (.C(m_axis_aclk),
        .CE(word_clk),
        .D(data0[6]),
        .Q(D[9]),
        .S(\tdata[15]_i_1__2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    word_clk_i_3__2
       (.I0(word_count_reg[15]),
        .O(word_clk_i_3__2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_4__2
       (.I0(word_count_reg[13]),
        .I1(word_count_reg[14]),
        .I2(word_count_reg[12]),
        .O(word_clk_i_4__2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_5__2
       (.I0(word_count_reg[10]),
        .I1(word_count_reg[11]),
        .I2(word_count_reg[9]),
        .O(word_clk_i_5__2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    word_clk_i_6__2
       (.I0(word_count_reg[6]),
        .I1(word_count_reg[7]),
        .I2(word_count_reg[8]),
        .O(word_clk_i_6__2_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    word_clk_i_7__2
       (.I0(word_count_reg[3]),
        .I1(word_count_reg[4]),
        .I2(word_count_reg[5]),
        .O(word_clk_i_7__2_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    word_clk_i_8__2
       (.I0(word_count_reg[1]),
        .I1(word_count_reg[2]),
        .I2(word_count_reg[0]),
        .O(word_clk_i_8__2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    word_clk_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(word_clk0),
        .Q(word_clk),
        .R(1'b0));
  CARRY4 word_clk_reg_i_1__2
       (.CI(word_clk_reg_i_2__2_n_0),
        .CO({NLW_word_clk_reg_i_1__2_CO_UNCONNECTED[3:2],word_clk0,word_clk_reg_i_1__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_word_clk_reg_i_1__2_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,word_clk_i_3__2_n_0,word_clk_i_4__2_n_0}));
  CARRY4 word_clk_reg_i_2__2
       (.CI(1'b0),
        .CO({word_clk_reg_i_2__2_n_0,word_clk_reg_i_2__2_n_1,word_clk_reg_i_2__2_n_2,word_clk_reg_i_2__2_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_word_clk_reg_i_2__2_O_UNCONNECTED[3:0]),
        .S({word_clk_i_5__2_n_0,word_clk_i_6__2_n_0,word_clk_i_7__2_n_0,word_clk_i_8__2_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    \word_count[0]_i_10__2 
       (.I0(word_count_reg[10]),
        .I1(word_count_reg[11]),
        .I2(word_count_reg[9]),
        .O(\word_count[0]_i_10__2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \word_count[0]_i_11__2 
       (.I0(word_count_reg[6]),
        .I1(word_count_reg[7]),
        .I2(word_count_reg[8]),
        .O(\word_count[0]_i_11__2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \word_count[0]_i_12__2 
       (.I0(word_count_reg[3]),
        .I1(word_count_reg[4]),
        .I2(word_count_reg[5]),
        .O(\word_count[0]_i_12__2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \word_count[0]_i_13__2 
       (.I0(word_count_reg[1]),
        .I1(word_count_reg[2]),
        .I2(word_count_reg[0]),
        .O(\word_count[0]_i_13__2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \word_count[0]_i_4__2 
       (.I0(word_count_reg[15]),
        .O(\word_count[0]_i_4__2_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \word_count[0]_i_5__2 
       (.I0(word_count_reg[13]),
        .I1(word_count_reg[14]),
        .I2(word_count_reg[12]),
        .O(\word_count[0]_i_5__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_6__2 
       (.I0(word_count_reg[3]),
        .O(\word_count[0]_i_6__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_7__2 
       (.I0(word_count_reg[2]),
        .O(\word_count[0]_i_7__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[0]_i_8__2 
       (.I0(word_count_reg[1]),
        .O(\word_count[0]_i_8__2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \word_count[0]_i_9__2 
       (.I0(word_count_reg[0]),
        .O(\word_count[0]_i_9__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_2__2 
       (.I0(word_count_reg[15]),
        .O(\word_count[12]_i_2__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_3__2 
       (.I0(word_count_reg[14]),
        .O(\word_count[12]_i_3__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_4__2 
       (.I0(word_count_reg[13]),
        .O(\word_count[12]_i_4__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[12]_i_5__2 
       (.I0(word_count_reg[12]),
        .O(\word_count[12]_i_5__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_2__2 
       (.I0(word_count_reg[7]),
        .O(\word_count[4]_i_2__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_3__2 
       (.I0(word_count_reg[6]),
        .O(\word_count[4]_i_3__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_4__2 
       (.I0(word_count_reg[5]),
        .O(\word_count[4]_i_4__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[4]_i_5__2 
       (.I0(word_count_reg[4]),
        .O(\word_count[4]_i_5__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_2__2 
       (.I0(word_count_reg[11]),
        .O(\word_count[8]_i_2__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_3__2 
       (.I0(word_count_reg[10]),
        .O(\word_count[8]_i_3__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_4__2 
       (.I0(word_count_reg[9]),
        .O(\word_count[8]_i_4__2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \word_count[8]_i_5__2 
       (.I0(word_count_reg[8]),
        .O(\word_count[8]_i_5__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__2_n_7 ),
        .Q(word_count_reg[0]),
        .R(word_count0));
  CARRY4 \word_count_reg[0]_i_1__2 
       (.CI(\word_count_reg[0]_i_3__2_n_0 ),
        .CO({\NLW_word_count_reg[0]_i_1__2_CO_UNCONNECTED [3:2],word_count0,\word_count_reg[0]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_word_count_reg[0]_i_1__2_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,\word_count[0]_i_4__2_n_0 ,\word_count[0]_i_5__2_n_0 }));
  CARRY4 \word_count_reg[0]_i_2__2 
       (.CI(1'b0),
        .CO({\word_count_reg[0]_i_2__2_n_0 ,\word_count_reg[0]_i_2__2_n_1 ,\word_count_reg[0]_i_2__2_n_2 ,\word_count_reg[0]_i_2__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\word_count_reg[0]_i_2__2_n_4 ,\word_count_reg[0]_i_2__2_n_5 ,\word_count_reg[0]_i_2__2_n_6 ,\word_count_reg[0]_i_2__2_n_7 }),
        .S({\word_count[0]_i_6__2_n_0 ,\word_count[0]_i_7__2_n_0 ,\word_count[0]_i_8__2_n_0 ,\word_count[0]_i_9__2_n_0 }));
  CARRY4 \word_count_reg[0]_i_3__2 
       (.CI(1'b0),
        .CO({\word_count_reg[0]_i_3__2_n_0 ,\word_count_reg[0]_i_3__2_n_1 ,\word_count_reg[0]_i_3__2_n_2 ,\word_count_reg[0]_i_3__2_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_word_count_reg[0]_i_3__2_O_UNCONNECTED [3:0]),
        .S({\word_count[0]_i_10__2_n_0 ,\word_count[0]_i_11__2_n_0 ,\word_count[0]_i_12__2_n_0 ,\word_count[0]_i_13__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[10] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__2_n_5 ),
        .Q(word_count_reg[10]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[11] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__2_n_4 ),
        .Q(word_count_reg[11]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[12] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__2_n_7 ),
        .Q(word_count_reg[12]),
        .R(word_count0));
  CARRY4 \word_count_reg[12]_i_1__2 
       (.CI(\word_count_reg[8]_i_1__2_n_0 ),
        .CO({\NLW_word_count_reg[12]_i_1__2_CO_UNCONNECTED [3],\word_count_reg[12]_i_1__2_n_1 ,\word_count_reg[12]_i_1__2_n_2 ,\word_count_reg[12]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[12]_i_1__2_n_4 ,\word_count_reg[12]_i_1__2_n_5 ,\word_count_reg[12]_i_1__2_n_6 ,\word_count_reg[12]_i_1__2_n_7 }),
        .S({\word_count[12]_i_2__2_n_0 ,\word_count[12]_i_3__2_n_0 ,\word_count[12]_i_4__2_n_0 ,\word_count[12]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[13] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__2_n_6 ),
        .Q(word_count_reg[13]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[14] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__2_n_5 ),
        .Q(word_count_reg[14]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[15] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[12]_i_1__2_n_4 ),
        .Q(word_count_reg[15]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__2_n_6 ),
        .Q(word_count_reg[1]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__2_n_5 ),
        .Q(word_count_reg[2]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[0]_i_2__2_n_4 ),
        .Q(word_count_reg[3]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[4] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__2_n_7 ),
        .Q(word_count_reg[4]),
        .R(word_count0));
  CARRY4 \word_count_reg[4]_i_1__2 
       (.CI(\word_count_reg[0]_i_2__2_n_0 ),
        .CO({\word_count_reg[4]_i_1__2_n_0 ,\word_count_reg[4]_i_1__2_n_1 ,\word_count_reg[4]_i_1__2_n_2 ,\word_count_reg[4]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[4]_i_1__2_n_4 ,\word_count_reg[4]_i_1__2_n_5 ,\word_count_reg[4]_i_1__2_n_6 ,\word_count_reg[4]_i_1__2_n_7 }),
        .S({\word_count[4]_i_2__2_n_0 ,\word_count[4]_i_3__2_n_0 ,\word_count[4]_i_4__2_n_0 ,\word_count[4]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[5] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__2_n_6 ),
        .Q(word_count_reg[5]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[6] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__2_n_5 ),
        .Q(word_count_reg[6]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[7] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[4]_i_1__2_n_4 ),
        .Q(word_count_reg[7]),
        .R(word_count0));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[8] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__2_n_7 ),
        .Q(word_count_reg[8]),
        .R(word_count0));
  CARRY4 \word_count_reg[8]_i_1__2 
       (.CI(\word_count_reg[4]_i_1__2_n_0 ),
        .CO({\word_count_reg[8]_i_1__2_n_0 ,\word_count_reg[8]_i_1__2_n_1 ,\word_count_reg[8]_i_1__2_n_2 ,\word_count_reg[8]_i_1__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_count_reg[8]_i_1__2_n_4 ,\word_count_reg[8]_i_1__2_n_5 ,\word_count_reg[8]_i_1__2_n_6 ,\word_count_reg[8]_i_1__2_n_7 }),
        .S({\word_count[8]_i_2__2_n_0 ,\word_count[8]_i_3__2_n_0 ,\word_count[8]_i_4__2_n_0 ,\word_count[8]_i_5__2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \word_count_reg[9] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\word_count_reg[8]_i_1__2_n_6 ),
        .Q(word_count_reg[9]),
        .R(word_count0));
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

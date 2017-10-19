// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
// Date        : Fri Oct  6 12:13:13 2017
// Host        : W7-64-12 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               B:/SVN/cores/2017.1/design/TEC0053/platforms/arty_z7_20_foc/hw/vivado/arty_z7_20_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_concat_0_0/zsys_axis_concat_0_0_sim_netlist.v
// Design      : zsys_axis_concat_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "zsys_axis_concat_0_0,axis_concat_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axis_concat_v1_0,Vivado 2017.1_sdx" *) 
(* NotValidForBitStream *)
module zsys_axis_concat_0_0
   (s_axis_aclk,
    s_axis_aresetn,
    sa_axis_tready,
    sa_axis_tdata,
    sa_axis_tvalid,
    sb_axis_tready,
    sb_axis_tdata,
    sb_axis_tvalid,
    sc_axis_tready,
    sc_axis_tdata,
    sc_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tvalid);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 s_axis_aclk CLK" *) input s_axis_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 s_axis_aresetn RST" *) input s_axis_aresetn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 sa_axis TREADY" *) output sa_axis_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 sa_axis TDATA" *) input [31:0]sa_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 sa_axis TVALID" *) input sa_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 sb_axis TREADY" *) output sb_axis_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 sb_axis TDATA" *) input [15:0]sb_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 sb_axis TVALID" *) input sb_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 sc_axis TREADY" *) output sc_axis_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 sc_axis TDATA" *) input [15:0]sc_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 sc_axis TVALID" *) input sc_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) output [63:0]m_axis_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;

  wire m_axis_tready;
  wire [31:0]sa_axis_tdata;
  wire sa_axis_tvalid;
  wire [15:0]sb_axis_tdata;
  wire [15:0]sc_axis_tdata;

  assign m_axis_tdata[63:48] = sc_axis_tdata;
  assign m_axis_tdata[47:32] = sb_axis_tdata;
  assign m_axis_tdata[31:0] = sa_axis_tdata;
  assign m_axis_tvalid = sa_axis_tvalid;
  assign sa_axis_tready = m_axis_tready;
  assign sb_axis_tready = m_axis_tready;
  assign sc_axis_tready = m_axis_tready;
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

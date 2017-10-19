--------------------------------------------------------------------------------
-- Company: 		Trenz Electronic
-- Engineer: 		Oleksandr Kiyenko
--------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------------------------------
entity axis_split_v1_0 is
generic (
    C_USE_TRIG              : boolean   := TRUE;
	C_S_AXIS_TDATA_WIDTH	: integer	:= 32;
	C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
	C_M01_AXIS_TDATA_WIDTH	: integer	:= 32
);
port (
	axis_aclk			: in  STD_LOGIC;
	axis_aresetn		: in  STD_LOGIC;
		
	s_axis_tready		: out STD_LOGIC;
	s_axis_tdata		: in  STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH-1 downto 0);
	s_axis_tvalid		: in  STD_LOGIC;
	
	m00_axis_tready		: in  STD_LOGIC;
	m00_axis_tdata		: out STD_LOGIC_VECTOR(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
	m00_axis_tvalid		: out STD_LOGIC;
	
	m01_axis_tready		: in  STD_LOGIC;
	m01_axis_tdata		: out STD_LOGIC_VECTOR(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
	m01_axis_tvalid		: out STD_LOGIC
);
end axis_split_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of axis_split_v1_0 is
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
no_trig_gen: if C_USE_TRIG = FALSE generate
begin
    s_axis_tready		<= m00_axis_tready;
    m00_axis_tvalid		<= s_axis_tvalid;
    m01_axis_tvalid		<= s_axis_tvalid;
    m00_axis_tdata		<= s_axis_tdata(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    m01_axis_tdata		<= s_axis_tdata(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
end generate;

trig_gen: if C_USE_TRIG = TRUE generate
begin
    s_axis_tready		<= m00_axis_tready;
    process(axis_aclk)
    begin
        if(axis_aclk = '1' and axis_aclk'event)then
            m00_axis_tvalid		<= s_axis_tvalid;
            m01_axis_tvalid		<= s_axis_tvalid;
            m00_axis_tdata		<= s_axis_tdata(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
            m01_axis_tdata		<= s_axis_tdata(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
        end if;
    end process;
end generate;
--------------------------------------------------------------------------------
end arch_imp;

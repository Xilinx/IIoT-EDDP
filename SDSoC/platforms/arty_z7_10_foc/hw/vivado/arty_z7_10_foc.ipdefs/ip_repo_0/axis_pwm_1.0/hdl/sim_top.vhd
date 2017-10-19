--------------------------------------------------------------------------------
-- Company: 		Trenz Electronic
-- Engineer: 		Oleksandr Kiyenko
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.MATH_REAL.ALL;
--------------------------------------------------------------------------------
entity sim_top is
--  Port ( );
end sim_top;
--------------------------------------------------------------------------------
architecture Behavioral of sim_top is
--------------------------------------------------------------------------------
component axis_pwm_v1_0 is
generic (
	C_IN_TYPE				: integer range 0 to 1	:= 0;	-- 0 - Serial, 1 - Parallel
	C_TYPE					: integer range 0 to 1	:= 1;	-- 0 - Unipolar, 1 - Bipolar
	C_DEADTIME_SYCLES		: integer	:= 0;
	C_CHANNELS				: integer	:= 4;
	C_CLK_FREQ				: integer	:= 100000000;
	C_PWM_FREQ				: integer	:= 20000;
	C_S_AXIS_TDEST_WIDTH	: integer	:= 2;
	C_S_AXIS_TDATA_WIDTH	: integer	:= 32
);
port (
	-- Output
	pwm					: out STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
	pwm_l				: out STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
	pwm_h				: out STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
	-- AXIS
	s_axis_aclk			: in  STD_LOGIC;
	s_axis_aresetn		: in  STD_LOGIC;
	s_axis_tready		: out STD_LOGIC;
	s_axis_tdata		: in  STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH-1 downto 0);
	s_axis_tdest		: in  STD_LOGIC_VECTOR(C_S_AXIS_TDEST_WIDTH-1 downto 0);
	s_axis_tvalid		: in  STD_LOGIC
	-- Debug
	--dbg_data			: out STD_LOGIC_VECTOR(31 downto 0)
);
end component;

constant clk_period			: time := 10 ns;	-- 100 MHz

constant C_IN_TYPE				: integer range 0 to 1	:= 1;	-- 0 - Serial, 1 - Parallel
constant C_TYPE					: integer	:= 1;	-- 0 - Unipolar, 1 - Bipolar
constant C_DEADTIME_SYCLES		: integer	:= 100;
constant C_CHANNELS				: integer	:= 1;
constant C_CLK_FREQ				: integer	:= 100000000;
constant C_PWM_FREQ				: integer	:= 20000;
constant C_S_AXIS_TDEST_WIDTH	: integer	:= 2;
constant C_S_AXIS_TDATA_WIDTH	: integer	:= 16;

signal pwm					: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal pwm_l				: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal pwm_h				: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal s_axis_aclk			: STD_LOGIC;
signal s_axis_aresetn		: STD_LOGIC;
signal s_axis_tready		: STD_LOGIC;
signal s_axis_tdata			: STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH-1 downto 0);
signal s_axis_tdest			: STD_LOGIC_VECTOR(C_S_AXIS_TDEST_WIDTH-1 downto 0);
signal s_axis_tvalid		: STD_LOGIC;
signal dbg_data				: STD_LOGIC_VECTOR(31 downto 0);

constant C_CPR					: integer	:= 64;
constant C_DATA_BITS			: integer	:= 16;
constant C_IN_DATA_PERIOD		: integer	:= 5000;
constant C_MAX_VALUE			: integer 	:= (2**(C_DATA_BITS-1))-1;
signal Ib, Ia					: SIGNED(C_DATA_BITS-1 downto 0);
signal deadtime, pwml, pwmh		: STD_LOGIC;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
clk_generation: process 
begin  
	s_axis_aclk		<= '0';
	wait for clk_period/2;
	s_axis_aclk		<= '1';
	wait for clk_period/2;
end process;

UUT: axis_pwm_v1_0
generic map(
	C_IN_TYPE				=> C_IN_TYPE,
	C_TYPE					=> C_TYPE,	-- 0 - Unipolar, 1 - Bipolar
	C_DEADTIME_SYCLES		=> C_DEADTIME_SYCLES,
	C_CHANNELS				=> C_CHANNELS,
	C_CLK_FREQ				=> C_CLK_FREQ,
	C_PWM_FREQ				=> C_PWM_FREQ,
	C_S_AXIS_TDEST_WIDTH	=> C_S_AXIS_TDEST_WIDTH,
	C_S_AXIS_TDATA_WIDTH	=> C_S_AXIS_TDATA_WIDTH
)
port map(
	pwm						=> pwm,
	pwm_l					=> pwm_l,
	pwm_h					=> pwm_h,
	s_axis_aclk				=> s_axis_aclk,
	s_axis_aresetn			=> s_axis_aresetn,
	s_axis_tready			=> s_axis_tready,
	s_axis_tdata			=> s_axis_tdata,
	s_axis_tdest			=> s_axis_tdest,
	s_axis_tvalid			=> s_axis_tvalid
	--dbg_data				=> dbg_data
);

s_axis_aresetn	<= '1';
deadtime		<= not (pwm_l(0) or pwm_h(0));
pwml			<= pwm_l(0);
pwmh			<= pwm_h(0);
-- report_clrl: process is
-- begin	
	-- s_axis_tvalid		<= '1';
	-- s_axis_tdest		<= (others => '0');
	-- s_axis_tdata		<= STD_LOGIC_VECTOR(TO_UNSIGNED(((C_CLK_FREQ/C_PWM_FREQ)/2),C_S_AXIS_TDATA_WIDTH));		-- 50 %
	-- wait for clk_period;
	-- s_axis_tvalid		<= '0';
	-- wait;
-- end process  report_clrl;

data_clrl: process is
begin	
	s_axis_tvalid			<= '0';
	s_axis_tdata			<= (others => '0');
	Ia						<= TO_SIGNED(5000,C_DATA_BITS);
	wait for clk_period*10;
	for i in 0 to C_CPR-1 loop
		s_axis_tdata		<= (others => '0');
		Ia					<= TO_SIGNED(INTEGER(ROUND(cos(REAL(i)*(MATH_2_PI/REAL(C_CPR)))*REAL(C_MAX_VALUE))),C_DATA_BITS);
		s_axis_tdata		<= STD_LOGIC_VECTOR(Ia);
		s_axis_tvalid		<= '1';
		wait for clk_period;
		s_axis_tvalid		<= '0';
		wait for clk_period*(C_IN_DATA_PERIOD-1);
	end loop;
		s_axis_tdata		<= STD_LOGIC_VECTOR(TO_SIGNED(C_MAX_VALUE,C_DATA_BITS));
		s_axis_tvalid		<= '1';
		wait for clk_period;
		s_axis_tvalid		<= '0';
	
	wait;
end process  data_clrl;

--------------------------------------------------------------------------------
end Behavioral;

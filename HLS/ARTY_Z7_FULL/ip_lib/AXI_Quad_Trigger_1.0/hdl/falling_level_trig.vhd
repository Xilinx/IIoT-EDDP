-------------------------------------------------------------------------------
-- Company			: Trenz Electronic
-- Engineer			: Oleksandr Kiyenko
-------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
-------------------------------------------------------------------------------
entity falling_level_trig is
generic(
	C_WIDTH				: integer	:= 16
);
port (
	s_axis_aclk			: in  STD_LOGIC;
	s_axis_aresetn		: in  STD_LOGIC;
	s_axis_tvalid		: in  STD_LOGIC;
	s_axis_tready		: out STD_LOGIC;
	s_axis_tdata		: in  STD_LOGIC_VECTOR(C_WIDTH-1 downto 0);
	
	level				: in  STD_LOGIC_VECTOR(C_WIDTH-1 downto 0);
	trig_out			: out STD_LOGIC
);
end falling_level_trig;
-------------------------------------------------------------------------------
architecture Behavioral of falling_level_trig is
-------------------------------------------------------------------------------
signal data_i	: SIGNED(C_WIDTH-1 downto 0);
signal edge_sr	: STD_LOGIC_VECTOR(1 downto 0);
-------------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------
process(s_axis_aclk)
begin
	if(s_axis_aclk = '1' and s_axis_aclk'event)then
		data_i	<= SIGNED(s_axis_tdata);
		if(data_i > SIGNED(level))then
			edge_sr	<= edge_sr(0) & '1';
		else
			edge_sr	<= edge_sr(0) & '0';
		end if;
		if(edge_sr = "01")then
			trig_out	<= '1';
		else
			trig_out	<= '0';
		end if;
	end if;
end process;

end Behavioral;

--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
entity ext_trig is
port ( 
	clk			: in  STD_LOGIC;
	trig_in		: in  STD_LOGIC;
	trig_out	: out STD_LOGIC
);
end ext_trig;

architecture Behavioral of ext_trig is
--------------------------------------------------------------------------------
signal sr	: STD_LOGIC_VECTOR(1 downto 0);
attribute ASYNC_REG			: string;
attribute ASYNC_REG of sr	: signal is "true";
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
process(clk)
begin
	if(clk = '1' and clk'event)then
		sr	<= sr(0) & trig_in;
		if(sr = "01")then
			trig_out	<= '1';
		else
			trig_out	<= '0';
		end if;
	end if;
end process;
--------------------------------------------------------------------------------
end Behavioral;

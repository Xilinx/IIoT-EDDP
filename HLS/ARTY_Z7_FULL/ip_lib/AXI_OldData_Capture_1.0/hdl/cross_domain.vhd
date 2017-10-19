-------------------------------------------------------------------------------
-- Company: 		Trenz Electronic
-- Engineer: 		Oleksandr Kiyenko
-------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
-------------------------------------------------------------------------------
entity cross_domain is
generic(
	C_FREQ_RATE		: integer	:= 4
);
port ( 
	src_clk			: in  STD_LOGIC;
	dst_clk			: in  STD_LOGIC;
	src_d			: in  STD_LOGIC;
	dst_d			: out STD_LOGIC
);
end cross_domain;
-------------------------------------------------------------------------------
architecture Behavioral of cross_domain is
-------------------------------------------------------------------------------
signal src_sr					: STD_LOGIC_VECTOR(C_FREQ_RATE - 1 downto 0);
signal dst_sr					: STD_LOGIC_VECTOR(1 downto 0);
attribute ASYNC_REG				: string;
attribute ASYNC_REG of dst_sr	: signal is "true";
-------------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------
process(src_clk)
begin
	if(src_clk = '1' and src_clk'event)then
		if(src_d = '1')then
			src_sr	<= (others => '1');
		else	
			src_sr(C_FREQ_RATE-1 downto 1) <= src_sr(C_FREQ_RATE-2 downto 0);
			src_sr(0)	<= '0';
		end if;
	end if;
end process;

process(dst_clk)
begin
	if(dst_clk = '1' and dst_clk'event)then
		dst_sr(0)	<= src_sr(C_FREQ_RATE - 1);
		dst_sr(1)	<= dst_sr(0);
		if(dst_sr = "01")then
			dst_d	<= '1';
		else
			dst_d	<= '0';
		end if;
	end if;
end process;
-------------------------------------------------------------------------------
end Behavioral;

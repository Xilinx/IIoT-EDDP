library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axis_sink_v1_0 is
	generic (
	   C_DATA_TYPE                : integer range 0 to 1 := 0; -- 0 = Signed, 1 = Unsigned
		C_S00_AXIS_TDATA_WIDTH   : integer	:= 32;
		C_OUT_DATA_WIDTH	     : integer	:= 32
	);
	port (
	   data_out        : out STD_LOGIC_VECTOR(C_OUT_DATA_WIDTH-1 downto 0);
		s00_axis_aclk	  : in std_logic;
		s00_axis_aresetn  : in std_logic;
		s00_axis_tready	  : out std_logic;
		s00_axis_tdata	  : in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
		s00_axis_tstrb	  : in std_logic_vector((C_S00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s00_axis_tlast	  : in std_logic;
		s00_axis_tvalid	  : in std_logic
	);
end axis_sink_v1_0;

architecture arch_imp of axis_sink_v1_0 is
begin

s00_axis_tready <= '1';

process(s00_axis_aclk)
begin
    if(s00_axis_aclk = '1' and s00_axis_aclk'event)then
        if(s00_axis_tvalid = '1')then
            if(C_DATA_TYPE = 0)then
                data_out    <= STD_LOGIC_VECTOR(resize(SIGNED(s00_axis_tdata),C_OUT_DATA_WIDTH));
            else
                data_out    <= STD_LOGIC_VECTOR(resize(UNSIGNED(s00_axis_tdata),C_OUT_DATA_WIDTH));
            end if;
        end if;
    end if;
end process;

end arch_imp;

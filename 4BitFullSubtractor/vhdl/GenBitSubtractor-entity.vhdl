library ieee;
use ieee.std_logic_1164.all;

entity GenBitSubtractor is
	generic(
		VECTOR_WIDTH : integer := 4	
	);
	port(
		MinxDI, SubxDI	: in std_logic_vector(VECTOR_WIDTH - 1 downto 0);
    	-- CIxDI			: in std_logic;
    	DifxDO				: out std_logic_vector(VECTOR_WIDTH - 1 downto 0);
    	BOxDO				: out std_logic
	);
end GenBitSubtractor;

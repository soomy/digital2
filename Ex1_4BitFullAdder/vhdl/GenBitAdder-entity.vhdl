library ieee;
use ieee.std_logic_1164.all;

entity GenBitAdder is
	generic(
		VECTOR_WIDTH : integer := 4	
	);
	port(
		Ope1xDI, Ope2xDI	: in std_logic_vector(VECTOR_WIDTH - 1 downto 0);
    	-- CIxDI			: in std_logic;
    	SumxDO				: out std_logic_vector(VECTOR_WIDTH - 1 downto 0);
    	COxDO				: out std_logic
	);
end GenBitAdder;

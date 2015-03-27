library ieee;
use ieee.std_logic_1164.all;

entity FullSubtractor is
	port (
		MinxDI	: in std_logic;
		SubxDI	: in std_logic;
    	BIxDI	: in std_logic;
    	DifxDO	: out std_logic;
    	BOxDO	: out std_logic
	);
end FullSubtractor;

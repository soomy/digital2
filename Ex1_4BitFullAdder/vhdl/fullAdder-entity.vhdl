library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
  port (Ope1xDI         : in std_logic;
	Ope2xDI         : in std_logic;
        CIxDI           : in std_logic;
        SumxDO          : out std_logic;
        COxDO           : out std_logic;);
end fullAdder;

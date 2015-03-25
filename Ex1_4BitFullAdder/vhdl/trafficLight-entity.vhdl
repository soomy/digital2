LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY trafficLight IS
   PORT ( ClkxCI        : IN  std_logic;
          RstxRI        : IN  std_logic;
          BtnxDI        : IN  std_logic;
          MainRedxDO    : OUT std_logic;
          MainOrangexDO : OUT std_logic;
          MainGreenxDO  : OUT std_logic);
END trafficLight;

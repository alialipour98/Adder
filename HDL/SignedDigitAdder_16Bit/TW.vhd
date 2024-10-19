LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TW is
    port (


        w, t : OUT std_logic_vector(1 downto 0);
        x, y : IN std_logic_vector(1 downto 0); 
        x_1, y_1 : IN std_logic_vector(1 downto 0)
    );
END TW;


architecture behavioral of TW is

    signal p : std_logic;

begin

    p <=    '0' WHEN ((x_1 /= "10") AND (y_1 /= "10")) else -- xi-1,yi-1>=0
            '1';

    t <=    "01" WHEN ((x AND y) = "01") else               --xi+yi=2 => ti+1=1
            "01" WHEN (((x OR y) = "01") AND p = '0') ELSE  --xi+yi=1 and pi-1=0 => ti+1=1
            "10" WHEN ((x AND y) = "10") ELSE               --xi+yi=-2 => ti+1=-1
            "10" WHEN (((x OR y) = "10") AND p = '1') else  --xi+yi=-1 and pi-1=1 => ti+1=-1
            "00";                                           --others t=0

    w <=    "00" WHEN ((x AND y) = "10" OR (x AND y) = "01" OR (x OR y) = "00") else --w=0
            "01" WHEN ((((x OR y) = "10") OR ((x OR y) = "01")) AND p = '1') ELSE    --w=1
            "10";                                                                    --w=-1


end behavioral ;
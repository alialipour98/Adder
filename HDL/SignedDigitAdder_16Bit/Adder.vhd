LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Adder is
    port (
        s : OUT std_logic_vector(1 downto 0);
        w, t : IN std_logic_vector(1 downto 0) 
    );
END Adder;

architecture behavioral of Adder is

begin

    s <=    "00" WHEN (((w OR t) = "00") OR ((w OR t) = "11")) ELSE
            "01" WHEN ((w OR t) = "01") ELSE
            "10";
end behavioral ; 


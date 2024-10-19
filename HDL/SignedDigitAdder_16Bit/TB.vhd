LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

package types is

    type arr16 is array (15 downto 0) of std_logic_vector(1 downto 0);
    type arr16_1 is array (16 downto 0) of std_logic_vector(1 downto 0);

end package types;



LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
use work.types.all;

entity TB is
end TB;

architecture SD_Adder of TB is

    signal sum : arr16;
    signal cout : std_logic_vector(1 downto 0);
    signal in1, in2 : arr16;
    signal cin : std_logic_vector(1 downto 0);

    signal  w, t : std_logic_vector(1 downto 0);
    signal x, y : std_logic_vector(1 downto 0); 
    signal x_1, y_1 : std_logic_vector(1 downto 0);

begin

    U1 : entity work.SD_Adder port map(
        sum,
        cout,
        in1, in2,
        cin
    );

   

    sd_adder : process
    begin
        in1 <= (("01"), ("01"), ("10"),("01"),("00"),("10"), ("01"),("00"),
                ("01") , ("01"), ("01"), ("10"),("01"),("00"),("10"), ("01"));
        in2 <= ("01","00","10","00","01","00","01","00",
                "01","01","00","10","00","01","00","01");
        cin <= "00";
        wait for 20 ns;
        in1 <= ("01", "00" , "01", "01", "01", "00" , "01","10",
                "01", "00" , "01", "01", "01", "00" , "01","10");
        in2 <= ("01", "00" , "01", "01", "01", "00" , "01","10",
                "01", "00" , "01", "01", "01", "00" , "01","10");
       wait for 20 ns;
        wait;
    end process ; 

end SD_Adder ; -- SD_Adder


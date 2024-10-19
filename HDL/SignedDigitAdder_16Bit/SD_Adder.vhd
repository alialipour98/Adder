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
USE work.types.all;

entity SD_Adder is
  
  
  port (
    sum         : OUT arr16;
    cout        : OUT std_logic_vector(1 downto 0);
    in1, in2    : IN arr16;
    cin         : IN std_logic_vector(1 downto 0)
  ) ;
end SD_Adder;


architecture behavioral of SD_Adder is

    signal w : arr16;
    signal t : arr16_1;
    
    begin
 
    TW0TO7 : FOR i IN 0 TO 15 GENERATE
        TW0 : IF i = 0 GENERATE
            ADD1 : ENTITY work.Adder port map (sum(i), w(i), cin);
            TW1 : ENTITY work.TW port map (w(i), t(i), in1(0), in2(0), "00", "00");
        END GENERATE;
        TW1TO7 : IF i /= 0 GENERATE
            TWi : ENTITY work.TW port map (w(i), t(i), in1(i), in2(i), in1(i - 1), in2(i - 1));
            ADDi : ENTITY work.Adder port map (sum(i), w(i), t(i - 1));
        END GENERATE;
    END GENERATE;

    cout <= t(16);
end behavioral ; 

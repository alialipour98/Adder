LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY LadnerFischerAdder_16Bit_tb IS
END LadnerFischerAdder_16Bit_tb;
 
ARCHITECTURE behavior OF LadnerFischerAdder_16Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LadnerFischerAdder_16Bit
    PORT(
         Cin 		: IN  std_logic;
         Cout 		: OUT std_logic;
         INPUT_1 	: IN  unsigned(15 downto 0);
         INPUT_2 	: IN  unsigned(15 downto 0);
         Sum 		: OUT	unsigned(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   Signal Cin 		: std_logic 							:= '0';
   Signal INPUT_1 : unsigned(15 downto 0) 	:= (others => '0');
   Signal INPUT_2 : unsigned(15 downto 0) 	:= (others => '0');

 	--Outputs
   Signal Cout 	: std_logic;
   Signal Sum 		: unsigned(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LadnerFischerAdder_16Bit PORT MAP (
          Cin 		=> Cin,
          Cout 	=> Cout,
          INPUT_1 => INPUT_1,
          INPUT_2 => INPUT_2,
          Sum 		=> Sum
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 

		INPUT_1	<=	to_unsigned(12, 16);
		INPUT_2	<=	to_unsigned(4, 16);
		Cin		<=	'1';

      wait;
   end process;

END;

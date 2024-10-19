library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity a_g_p_Creator is

	PORT
	(
		Xi	:	IN		STD_LOGIC;
		Yi	:	IN		STD_LOGIC;
		ai	:	OUT	STD_LOGIC;
		gi	:	OUT	STD_LOGIC;
		pi	:	OUT	STD_LOGIC
	);

end a_g_p_Creator;

architecture Behavioral of a_g_p_Creator is

begin

	ai <= Xi OR  Yi ;
	gi <= Xi AND Yi ;
	pi <= Xi XOR Yi ;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g_a_OUT is

	PORT
	(
		aL		:	IN		STD_LOGIC;
		aR		:	IN		STD_LOGIC;
		gL		:	IN		STD_LOGIC;
		gR		:	IN		STD_LOGIC;
		a_OUT	:	OUT	STD_LOGIC;	
		g_OUT	:	OUT	STD_LOGIC	
	);

end g_a_OUT;

architecture Behavioral of g_a_OUT is

begin

	a_OUT	<=	aL AND aR;
	g_OUT	<=	gL OR (gR AND aL);

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LadnerFischerAdder_16Bit is

	PORT
	(
		Cin		:	IN		STD_LOGIC;
		Cout	:	OUT		STD_LOGIC;
		INPUT_1	:	IN		unsigned(15 DOWNTO 0);
		INPUT_2	:	IN		unsigned(15 DOWNTO 0);
		Sum		:	OUT		unsigned(15 DOWNTO 0)
	);

end LadnerFischerAdder_16Bit;

architecture Behavioral of LadnerFischerAdder_16Bit is

	Signal a	:	unsigned(15 DOWNTO 0)	:=	(others=>'0');
	Signal g	:	unsigned(15 DOWNTO 0)	:=	(others=>'0');
	Signal p	:	unsigned(15 DOWNTO 0)	:=	(others=>'0');
	Signal c	:	unsigned(15 DOWNTO 0)	:=	(others=>'0');
	-----------------------------------------------------
	Signal a_out0		:	STD_LOGIC	:=	'0';
	Signal a_out2		:	STD_LOGIC	:=	'0';
	Signal g_out2		:	STD_LOGIC	:=	'0';
	Signal a_out4		:	STD_LOGIC	:=	'0';
	Signal g_out4		:	STD_LOGIC	:=	'0';
	Signal a_out6		:	STD_LOGIC	:=	'0';
	Signal g_out6		:	STD_LOGIC	:=	'0';
	Signal a_out8		:	STD_LOGIC	:=	'0';
	Signal g_out8		:	STD_LOGIC	:=	'0';
	Signal a_out10		:	STD_LOGIC	:=	'0';
	Signal g_out10		:	STD_LOGIC	:=	'0';
	Signal a_out12		:	STD_LOGIC	:=	'0';
	Signal g_out12		:	STD_LOGIC	:=	'0';
	Signal a_out14		:	STD_LOGIC	:=	'0';
	Signal g_out14		:	STD_LOGIC	:=	'0';
	Signal a_out1_0		:	STD_LOGIC	:=	'0';
	Signal a_out1_2		:	STD_LOGIC	:=	'0';
	Signal a_out1_4		:	STD_LOGIC	:=	'0';
	Signal g_out1_4		:	STD_LOGIC	:=	'0';
	Signal a_out1_6		:	STD_LOGIC	:=	'0';
	Signal g_out1_6		:	STD_LOGIC	:=	'0';
	Signal a_out1_8		:	STD_LOGIC	:=	'0';
	Signal g_out1_8		:	STD_LOGIC	:=	'0';
	Signal a_out1_10	:	STD_LOGIC	:=	'0';
	Signal g_out1_10	:	STD_LOGIC	:=	'0';
	Signal a_out1_12	:	STD_LOGIC	:=	'0';
	Signal g_out1_12	:	STD_LOGIC	:=	'0';
	Signal a_out1_14	:	STD_LOGIC	:=	'0';
	Signal g_out1_14	:	STD_LOGIC	:=	'0';
	Signal a_out2_0		:	STD_LOGIC	:=	'0';
	Signal a_out2_2		:	STD_LOGIC	:=	'0';
	Signal a_out2_4		:	STD_LOGIC	:=	'0';
	Signal a_out2_6		:	STD_LOGIC	:=	'0';
	Signal a_out2_8		:	STD_LOGIC	:=	'0';
	Signal g_out2_8		:	STD_LOGIC	:=	'0';
	Signal a_out2_10	:	STD_LOGIC	:=	'0';
	Signal g_out2_10	:	STD_LOGIC	:=	'0';
	Signal a_out2_12	:	STD_LOGIC	:=	'0';
	Signal g_out2_12	:	STD_LOGIC	:=	'0';
	Signal a_out2_14	:	STD_LOGIC	:=	'0';
	Signal g_out2_14	: 	STD_LOGIC	:=	'0';
	Signal a_out3_0		:	STD_LOGIC	:=	'0';
	Signal a_out3_2		:	STD_LOGIC	:=	'0';
	Signal a_out3_4		:	STD_LOGIC	:=	'0';
	Signal a_out3_6		:	STD_LOGIC	:=	'0';
	Signal a_out3_8		:	STD_LOGIC	:=	'0';
	Signal a_out3_10	:	STD_LOGIC	:=	'0';
	Signal a_out3_12	:	STD_LOGIC	:=	'0';
	Signal a_out3_14	:	STD_LOGIC	:=	'0';
	Signal a_out4_0		:	STD_LOGIC	:=	'0';
	Signal c_out		:	STD_LOGIC	:=	'0';
	-----------------------------------------------------

begin
	----------------------------------------
	c(0)<= Cin;
	----------------------------------------
	GENERATE_1 : FOR I IN 0 TO 15 GENERATE
						GEN_Inst	: ENTITY WORK.a_g_p_Creator 
						PORT MAP
						(
							Xi => INPUT_1(I),
							Yi => INPUT_2(I),
							ai => a(I),
							gi => g(I),
							pi => p(I)
						);
					END GENERATE; 
	----------------------------------------
	GENERATE_SUM : FOR I IN 0 TO 15 GENERATE
		Sum(i) <= p(i) XOR c(i) ;
	end generate ;
	----------------------------------------
	-- STAGE I
	GA_0: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(0),
		aR 	=> '0',
		gL 	=> g(0),
		gR 	=> Cin,
		a_OUT => a_out0,
		g_OUT => c(1)
	);
	----------------------------------------
	GA_1: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(2),
		aR 	=> a(1),
		gL 	=> g(2),
		gR 	=> g(1),
		a_OUT => a_out2,
		g_OUT => g_out2
	);
	----------------------------------------
	GA_2: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(4),
		aR 	=> a(3),
		gL 	=> g(4),
		gR 	=> g(3),
		a_OUT => a_out4,
		g_OUT => g_out4
	);
	----------------------------------------
	GA_3: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(6),
		aR 	=> a(5),
		gL 	=> g(6),
		gR 	=> g(5),
		a_OUT => a_out6,
		g_OUT => g_out6
	);
	----------------------------------------
	GA_4: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(8),
		aR 	=> a(7),
		gL 	=> g(8),
		gR 	=> g(7),
		a_OUT => a_out8,
		g_OUT => g_out8
	);
	----------------------------------------
	GA_5: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(10),
		aR 	=> a(9),
		gL 	=> g(10),
		gR 	=> g(9),
		a_OUT => a_out10,
		g_OUT => g_out10
	);
	----------------------------------------
	GA_6: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(12),
		aR 	=> a(11),
		gL 	=> g(12),
		gR 	=> g(11),
		a_OUT => a_out12,
		g_OUT => g_out12
	);
	----------------------------------------
	GA_7: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(14),
		aR 	=> a(13),
		gL 	=> g(14),
		gR 	=> g(13),
		a_OUT => a_out14,
		g_OUT => g_out14
	);
	-----------------------------------------------------------------------------------
	-- STAGE II
	GA_8: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(1),
		aR 	=> a_out0,
		gL 	=> g(1),
		gR 	=> c(1),
		a_OUT => a_out1_0,
		g_OUT => c(2)
	);
	----------------------------------------
	GA_9: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a_out2,
		aR 	=> a_out0,
		gL 	=> g_out2,
		gR 	=> c(1),
		a_OUT => a_out1_2,
		g_OUT => c(3)
	);
	----------------------------------------
	GA_10: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(5),
		aR 	=> a_out4,
		gL 	=> g(5),
		gR 	=> g_out4,
		a_OUT => a_out1_4,
		g_OUT => g_out1_4
	);
	----------------------------------------
	GA_11: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a_out6,
		aR 	=> a_out4,
		gL 	=> g_out6,
		gR 	=> g_out4,
		a_OUT => a_out1_6,
		g_OUT => g_out1_6
	);
	----------------------------------------
	GA_12: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(9),
		aR 	=> a_out8,
		gL 	=> g(9),
		gR 	=> g_out8,
		a_OUT => a_out1_8,
		g_OUT => g_out1_8
	);
	----------------------------------------
	GA_13: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a_out10,
		aR 	=> a_out8,
		gL 	=> g_out10,
		gR 	=> g_out8,
		a_OUT => a_out1_10,
		g_OUT => g_out1_10
	);
	----------------------------------------
	GA_14: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(13),
		aR 	=> a_out12,
		gL 	=> g(13),
		gR 	=> g_out12,
		a_OUT => a_out1_12,
		g_OUT => g_out1_12
	);
	----------------------------------------
	GA_15: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a_out14,
		aR 	=> a_out12,
		gL 	=> g_out14,
		gR 	=> g_out12,
		a_OUT => a_out1_14,
		g_OUT => g_out1_14
	);
	-----------------------------------------------------------------------------------
	-- STAGE III
	GA_16: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a(3),
		aR 	=> a_out1_2,
		gL 	=>	g(3),
		gR 	=> c(3),
		a_OUT => a_out2_0,
		g_OUT => c(4)
	);
	----------------------------------------
	GA_17: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a_out4,
		aR 	=> a_out1_2,
		gL 	=>	g_out4,
		gR 	=> c(3), 
		a_OUT => a_out2_2,
		g_OUT => c(5)
	);
	----------------------------------------
	GA_18: ENTITY WORK.g_a_OUT PORT MAP( 
		aL 	=> a_out1_4,
		aR 	=> a_out1_2,
		gL 	=>	g_out1_4,
		gR 	=> c(3),
		a_OUT => a_out2_4,
		g_OUT => c(6)
	);
	----------------------------------------
	GA_19: ENTITY WORK.g_a_OUT PORT MAP(
		aL 	=> a_out1_6,
		aR 	=> a_out1_2, 
		gL 	=>	g_out1_6,
		gR 	=> c(3),
		a_OUT => a_out2_6,
		g_OUT => c(7)
	);
	----------------------------------------
	GA_20: ENTITY WORK.g_a_OUT PORT MAP( 
		aL 	=> a(11), 
		aR 	=> a_out1_10,
		gL 	=>	g(11),
		gR 	=> g_out1_10,
		a_OUT => a_out2_8,
		g_OUT => g_out2_8 
	);
	----------------------------------------
	GA_21: ENTITY WORK.g_a_OUT PORT MAP( 
		aL 	=> a_out12,
		aR 	=> a_out1_10, 
		gL 	=>	g_out12, 
		gR 	=> g_out1_10, 
		a_OUT => a_out2_10, 
		g_OUT => g_out2_10 
	);
	----------------------------------------
	GA_22: ENTITY WORK.g_a_OUT PORT MAP( 
		aL 	=> a_out1_12, 
		aR 	=> a_out1_10, 
		gL 	=>	g_out1_12, 
		gR 	=> g_out1_10, 
		a_OUT => a_out2_12, 
		g_OUT => g_out2_12 
	);
	----------------------------------------
	GA_23: ENTITY WORK.g_a_OUT PORT MAP( 
		aL 	=> a_out1_14,
		aR 	=> a_out1_10, 
		gL 	=>	g_out1_14, 
		gR 	=> g_out1_10, 
		a_OUT => a_out2_14, 
		g_OUT => g_out2_14 
	);
	-----------------------------------------------------------------------------------
	-- STAGE IV
	GA_24: ENTITY WORK.g_a_out PORT MAP(
		aL 	=> a(7), 
		aR 	=> a_out2_6,
		gL 	=>	g(7), 
		gR 	=> c(7), 
		a_OUT => a_out3_0, 
		g_OUT => c(8)
	);
	GA_25: ENTITY WORK.g_a_out PORT MAP( 
		aL 	=> a_out8, 
		aR 	=> a_out2_6, 
		gL 	=>	g_out8, 
		gR 	=> c(7), 
		a_OUT => a_out3_2, 
		g_OUT => c(9)
	);
	GA_26: ENTITY WORK.g_a_out PORT MAP(
		aL 	=> a_out1_8,
		aR 	=> a_out2_6, 
		gL 	=>	g_out1_8, 
		gR 	=> c(7), 
		a_OUT => a_out3_4, 
		g_OUT => c(10)
	);
	GA_27: ENTITY WORK.g_a_out PORT MAP(
		aL 	=> a_out1_10,
		aR 	=> a_out2_6, 
		gL 	=>	g_out1_10, 
		gR 	=> c(7), 
		a_OUT => a_out3_6, 
		g_OUT => c(11)
	);
	GA_28: ENTITY WORK.g_a_out PORT MAP( 
		aL 	=> a_out2_8,
		aR 	=> a_out2_6, 
		gL 	=>	g_out2_8, 
		gR 	=> c(7), 
		a_OUT => a_out3_8, 
		g_OUT => c(12)
	);
	GA_29: ENTITY WORK.g_a_out PORT MAP(
		aL 	=> a_out2_10,
		aR 	=> a_out2_6, 
		gL 	=>	g_out2_10, 
		gR 	=> c(7), 
		a_OUT => a_out3_10, 
		g_OUT => c(13)
	);
	GA_30: ENTITY WORK.g_a_out PORT MAP( 
		aL 	=> a_out2_12, 
		aR 	=> a_out2_6, 
		gL 	=>	g_out2_12, 
		gR 	=> c(7), 
		a_OUT => a_out3_12, 
		g_OUT => c(14)
	);
	GA_31: ENTITY WORK.g_a_out PORT MAP( 
		aL 	=> a_out2_14, 
		aR 	=> a_out2_6, 
		gL 	=>	g_out2_14, 
		gR 	=> c(7), 
		a_OUT => a_out3_14, 
		g_OUT => c(15)
	);
	-----------------------------------------------------------------------------------
	GA_32: ENTITY WORK.g_a_out PORT MAP(
		aL 	=> a(15),
		aR 	=> '0',
		gL 	=>	g(15),
		gR 	=> c(15),
		a_OUT => a_out4_0,
		g_OUT => Cout
	);
	-----------------------------------------------------------------------------------
end Behavioral;












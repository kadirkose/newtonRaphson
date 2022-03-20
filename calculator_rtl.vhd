library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	
use ieee.std_logic_unsigned.all;	

entity calculator_rtl is
	port(
		ledg								: out std_logic_vector(7 downto 0):= (others => '0');
		clk								: in 	std_logic;
		reset								: in 	std_logic;
		start_op							: in 	std_logic;
		degree							: in 	integer;
		degree_min						: in 	integer;
		variable_value					: in	std_logic_vector(31 downto 0):= (others => '0');
		calculator_result				: out	std_logic_vector(31 downto 0):= (others => '0');
		accuracy							: out std_logic_vector(31 downto 0):= (others => '0');
		complete_op						: out	std_logic:= '0';
		coefficient0        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient1        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient2        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient3        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient4        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient5        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient6        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient7        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient8        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient9        			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient10					: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient11       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient12       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient13       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient14       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient15       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient16       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient17       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient18       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient19       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient20       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient21       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient22       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient23       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient24       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient25       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient26       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient27       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient28       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient29       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient30       			: in 	std_logic_vector(31 downto 0):= (others => '0');
		coefficient31       			: in 	std_logic_vector(31 downto 0):= (others => '0')
	);
end calculator_rtl;

architecture logic of calculator_rtl is

	component fp_substractor
		port (
			a 						: in std_logic_vector(31 downto 0);  -- float32_m23
			b 						: in std_logic_vector(31 downto 0);  -- float32_m23
			q 						: out std_logic_vector(31 downto 0);  -- float32_m23
			clk 					: in std_logic;
			areset 				: in std_logic
		);
	end component;	

	component fp_mult
		port(
			clk    				: in  std_logic                     := '0';             	--    clk.clk
			areset 				: in  std_logic                     := '0';             	-- areset.reset
			a      				: in  std_logic_vector(31 downto 0) := (others => '0'); 	--      a.a
			b      				: in  std_logic_vector(31 downto 0) := (others => '0'); 	--      b.b
			q      				: out std_logic_vector(31 downto 0)                     	--      q.q
		);
	end component;
	
	component fp_add
		port(
			clk    				: in  std_logic                     := '0';             --    clk.clk
			areset 				: in  std_logic                     := '0';             -- areset.reset
			a      				: in  std_logic_vector(31 downto 0) := (others => '0'); --      a.a
			b      				: in  std_logic_vector(31 downto 0) := (others => '0'); --      b.b
			q      				: out std_logic_vector(31 downto 0)                     --      q.q
		);
	end component;
	
	component fp_divider
		port (
			a 						: in	std_logic_vector(31 downto 0);  -- float32_m23
			b						: in	std_logic_vector(31 downto 0);  -- float32_m23
			q 						: out	std_logic_vector(31 downto 0);  -- float32_m23
			clk 					: in	std_logic;
			areset 				: in	std_logic
		);
	end component;	
	
	-- single precision floating point numbers that using in calculations
	type float61 is array(0 to 61) of std_logic_vector(31 downto 0);
	signal fp_const: float61:= (
		"00000000000000000000000000000000",		-- 0
		"00111111100000000000000000000000",
		"01000000000000000000000000000000",
		"01000000010000000000000000000000",
		"01000000100000000000000000000000",
		"01000000101000000000000000000000",
		"01000000110000000000000000000000",
		"01000000111000000000000000000000",
		"01000001000000000000000000000000",
		"01000001000100000000000000000000",
		"01000001001000000000000000000000",
		"01000001001100000000000000000000",
		"01000001010000000000000000000000",
		"01000001010100000000000000000000",
		"01000001011000000000000000000000",
		"01000001011100000000000000000000",
		"01000001100000000000000000000000",
		"01000001100010000000000000000000",
		"01000001100100000000000000000000",
		"01000001100110000000000000000000",
		"01000001101000000000000000000000",
		"01000001101010000000000000000000",
		"01000001101100000000000000000000",
		"01000001101110000000000000000000",
		"01000001110000000000000000000000",
		"01000001110010000000000000000000",
		"01000001110100000000000000000000",
		"01000001110110000000000000000000",
		"01000001111000000000000000000000",
		"01000001111010000000000000000000",
		"01000001111100000000000000000000",
		"01000001111110000000000000000000",		-- +31
		"01000010000000000000000000000000",
		"01000010000001000000000000000000",
		"01000010000010000000000000000000",
		"01000010000011000000000000000000",
		"01000010000100000000000000000000",
		"01000010000101000000000000000000",
		"01000010000110000000000000000000",
		"01000010000111000000000000000000",
		"01000010001000000000000000000000",
		"01000010001001000000000000000000",
		"01000010001010000000000000000000",
		"01000010001011000000000000000000",
		"01000010001100000000000000000000",
		"01000010001101000000000000000000",
		"01000010001110000000000000000000",
		"01000010001111000000000000000000",
		"01000010010000000000000000000000",
		"01000010010001000000000000000000",
		"01000010010010000000000000000000",
		"01000010010011000000000000000000",
		"01000010010100000000000000000000",
		"01000010010101000000000000000000",
		"01000010010110000000000000000000",
		"01000010010111000000000000000000",
		"01000010011000000000000000000000",
		"01000010011001000000000000000000",
		"01000010011010000000000000000000",
		"01000010011011000000000000000000",
		"01000010011100000000000000000000",
		"01000010011101000000000000000000"
	);
	
	type float32 is array(31 downto 0) of std_logic_vector(31 downto 0);
	signal float_mult_in1, float_mult_in2, float_mult_out, mult_degree_coef, derivative_mult_result : float32:= (others => "00000000000000000000000000000000");
	signal variable_power_array : float32:= (others => "00000000000000000000000000000000");
	
	signal float_div_in1, float_div_in2, float_div_out : std_logic_vector(31 downto 0):= (others => '0');
	signal float_add_in1, float_add_in2, float_add_out: float32:= (others => "00000000000000000000000000000000");
	signal coefficient : float32:= (others => "00000000000000000000000000000000");
	signal float_substractor_in1	: std_logic_vector(31 downto 0):= (others => '0');
	signal float_substractor_in2	: std_logic_vector(31 downto 0):= (others => '0');
	signal float_substractor_out	: std_logic_vector(31 downto 0):= (others => '0');
	
	signal der_subs_result			: std_logic_vector(31 downto 0):= (others => '0');
	signal subs_result				: std_logic_vector(31 downto 0):= (others => '0');
	signal variable_value_int		: std_logic_vector(31 downto 0):= (others => '0');
	signal cnt							: integer range 0 to 100:= 0;
	
	constant ADDER_DELAY 		: integer := 2;
	constant MUlTIPLIER_DELAY  : integer := 2;
	constant DIVIDER_DELAY 		: integer := 11;

	type state_machine is(
		idle,
		initialize_derivative,		
		wait_mult_op,		
		mult1_op,	
		wait_mult1_op,				
		mult2_op,			
		wait_mult2_op,			
		mult3_op,		
		wait_mult3_op,				
		mult4_op,
		wait_mult4_op,
		mult5_op,
		wait_mult5_op,
		derivative_multiply,
		wait_derivative_multiply,
		substitution_multiply,
		wait_substitution_multiply,
		initialize_subs_add1,
		wait_subs_add1,
		initialize_subs_add2,
		wait_subs_add2,
		initialize_subs_add3,
		wait_subs_add3,
		initialize_subs_add4,
		wait_subs_add4,
		initialize_subs_add5,
		wait_addition_result,
		initialize_division,
		wait_division,
		initialize_substractor,
		wait_substractor,
		complete_operation,
		reset_operation
	);
	signal state: state_machine := idle;
	
	begin		
	
	float_substractor_block: fp_substractor
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_substractor_in1,
		b      => float_substractor_in2,
		q      => float_substractor_out
	);
	
	float_div_block0: fp_divider
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_div_in1,
		b      => float_div_in2,
		q      => float_div_out
	);
	

	float_add_block1: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(0),
		b      => float_add_in2(0),
		q      => float_add_out(0)
	);
	
	float_add_block2: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(1),
		b      => float_add_in2(1),
		q      => float_add_out(1)
	);
	
	float_add_block3: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(2),
		b      => float_add_in2(2),
		q      => float_add_out(2)
	);
	
	float_add_block4: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(3),
		b      => float_add_in2(3),
		q      => float_add_out(3)
	);
	
	float_add_block5: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(4),
		b      => float_add_in2(4),
		q      => float_add_out(4)
	);
	
	float_add_block6: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(5),
		b      => float_add_in2(5),
		q      => float_add_out(5)
	);
	
	float_add_block7: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(6),
		b      => float_add_in2(6),
		q      => float_add_out(6)
	);
	
	float_add_block8: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(7),
		b      => float_add_in2(7),
		q      => float_add_out(7)
	);
	
	float_add_block9: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(8),
		b      => float_add_in2(8),
		q      => float_add_out(8)
	);
	
	float_add_block10: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(9),
		b      => float_add_in2(9),
		q      => float_add_out(9)
	);
	
	float_add_block11: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(10),
		b      => float_add_in2(10),
		q      => float_add_out(10)
	);
	
	float_add_block12: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(11),
		b      => float_add_in2(11),
		q      => float_add_out(11)
	);
	
	float_add_block13: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(12),
		b      => float_add_in2(12),
		q      => float_add_out(12)
	);
	
	float_add_block14: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(13),
		b      => float_add_in2(13),
		q      => float_add_out(13)
	);
	
	float_add_block15: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(14),
		b      => float_add_in2(14),
		q      => float_add_out(14)
	);
	
	float_add_block16: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(15),
		b      => float_add_in2(15),
		q      => float_add_out(15)
	);
	
	float_add_block17: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(16),
		b      => float_add_in2(16),
		q      => float_add_out(16)
	);
	
	float_add_block18: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(17),
		b      => float_add_in2(17),
		q      => float_add_out(17)
	);
	
	float_add_block19: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(18),
		b      => float_add_in2(18),
		q      => float_add_out(18)
	);
	
	float_add_block20: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(19),
		b      => float_add_in2(19),
		q      => float_add_out(19)
	);
	
	float_add_block21: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(20),
		b      => float_add_in2(20),
		q      => float_add_out(20)
	);
	
	float_add_block22: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(21),
		b      => float_add_in2(21),
		q      => float_add_out(21)
	);
	
	float_add_block23: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(22),
		b      => float_add_in2(22),
		q      => float_add_out(22)
	);
	
	float_add_block24: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(23),
		b      => float_add_in2(23),
		q      => float_add_out(23)
	);
	
	float_add_block25: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(24),
		b      => float_add_in2(24),
		q      => float_add_out(24)
	);
	
	float_add_block26: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(25),
		b      => float_add_in2(25),
		q      => float_add_out(25)
	);
	
	float_add_block27: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(26),
		b      => float_add_in2(26),
		q      => float_add_out(26)
	);
	
	float_add_block28: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(27),
		b      => float_add_in2(27),
		q      => float_add_out(27)
	);
	
	float_add_block29: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(28),
		b      => float_add_in2(28),
		q      => float_add_out(28)
	);
	
	float_add_block30: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(29),
		b      => float_add_in2(29),
		q      => float_add_out(29)
	);
	
	float_add_block31: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(30),
		b      => float_add_in2(30),
		q      => float_add_out(30)
	);
	
	float_add_block32: fp_add
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_add_in1(31),
		b      => float_add_in2(31),
		q      => float_add_out(31)
	);
	
	float_multiply_block1: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(0),
		b      => float_mult_in2(0),
		q      => float_mult_out(0)
	);
	
	float_multiply_block2: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(1),
		b      => float_mult_in2(1),
		q      => float_mult_out(1)
	);
	
	float_multiply_block3: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(2),
		b      => float_mult_in2(2),
		q      => float_mult_out(2)
	);
	
	float_multiply_block4: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(3),
		b      => float_mult_in2(3),
		q      => float_mult_out(3)
	);
	
	float_multiply_block5: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(4),
		b      => float_mult_in2(4),
		q      => float_mult_out(4)
	);
	
	float_multiply_block6: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(5),
		b      => float_mult_in2(5),
		q      => float_mult_out(5)
	);
	
	float_multiply_block7: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(6),
		b      => float_mult_in2(6),
		q      => float_mult_out(6)
	);
	
	float_multiply_block8: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(7),
		b      => float_mult_in2(7),
		q      => float_mult_out(7)
	);
	
	float_multiply_block9: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(8),
		b      => float_mult_in2(8),
		q      => float_mult_out(8)
	);
	
	float_multiply_block10: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(9),
		b      => float_mult_in2(9),
		q      => float_mult_out(9)
	);
	
	float_multiply_block11: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(10),
		b      => float_mult_in2(10),
		q      => float_mult_out(10)
	);
	
	float_multiply_block12: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(11),
		b      => float_mult_in2(11),
		q      => float_mult_out(11)
	);
	
	float_multiply_block13: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(12),
		b      => float_mult_in2(12),
		q      => float_mult_out(12)
	);
	
	float_multiply_block14: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(13),
		b      => float_mult_in2(13),
		q      => float_mult_out(13)
	);
	
	float_multiply_block15: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(14),
		b      => float_mult_in2(14),
		q      => float_mult_out(14)
	);
	
	float_multiply_block16: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(15),
		b      => float_mult_in2(15),
		q      => float_mult_out(15)
	);
	
	float_multiply_block17: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(16),
		b      => float_mult_in2(16),
		q      => float_mult_out(16)
	);
	
	float_multiply_block18: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(17),
		b      => float_mult_in2(17),
		q      => float_mult_out(17)
	);
	
	float_multiply_block19: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(18),
		b      => float_mult_in2(18),
		q      => float_mult_out(18)
	);
	
	float_multiply_block20: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(19),
		b      => float_mult_in2(19),
		q      => float_mult_out(19)
	);
	
	float_multiply_block21: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(20),
		b      => float_mult_in2(20),
		q      => float_mult_out(20)
	);
	
	float_multiply_block22: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(21),
		b      => float_mult_in2(21),
		q      => float_mult_out(21)
	);
	
	float_multiply_block23: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(22),
		b      => float_mult_in2(22),
		q      => float_mult_out(22)
	);
	
	float_multiply_block24: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(23),
		b      => float_mult_in2(23),
		q      => float_mult_out(23)
	);
	
	float_multiply_block25: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(24),
		b      => float_mult_in2(24),
		q      => float_mult_out(24)
	);
	
	float_multiply_block26: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(25),
		b      => float_mult_in2(25),
		q      => float_mult_out(25)
	);
	
	float_multiply_block27: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(26),
		b      => float_mult_in2(26),
		q      => float_mult_out(26)
	);
	
	float_multiply_block28: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(27),
		b      => float_mult_in2(27),
		q      => float_mult_out(27)
	);
	
	float_multiply_block29: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(28),
		b      => float_mult_in2(28),
		q      => float_mult_out(28)
	);
	
	float_multiply_block30: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(29),
		b      => float_mult_in2(29),
		q      => float_mult_out(29)
	);
	
	float_multiply_block31: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(30),
		b      => float_mult_in2(30),
		q      => float_mult_out(30)
	);
	
	float_multiply_block32: fp_mult
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_mult_in1(31),
		b      => float_mult_in2(31),
		q      => float_mult_out(31)
	);
		
	process(clk, reset)
	begin
		if(reset = '0') then
			float_add_in1(0)  		<= (others => '0');
			float_add_in1(1)  		<= (others => '0');
			float_add_in1(2)  		<= (others => '0');
			float_add_in1(3)  		<= (others => '0');
			float_add_in1(4)  		<= (others => '0');
			float_add_in1(5)  		<= (others => '0');
			float_add_in1(6) 			<= (others => '0');
			float_add_in1(7)  		<= (others => '0');
			float_add_in1(8)  		<= (others => '0');
			float_add_in1(9)  		<= (others => '0');
			float_add_in1(10)  		<= (others => '0');
			float_add_in1(11)  		<= (others => '0');
			float_add_in1(12)  		<= (others => '0');
			float_add_in1(13)  		<= (others => '0');
			float_add_in1(14)  		<= (others => '0');
			float_add_in1(15)  		<= (others => '0');
			float_add_in1(16)  		<= (others => '0');
			float_add_in1(17)  		<= (others => '0');
			float_add_in1(18)  		<= (others => '0');
			float_add_in1(19)  		<= (others => '0');
			float_add_in1(20)  		<= (others => '0');
			float_add_in1(21)  		<= (others => '0');
			float_add_in1(22) 		<= (others => '0');
			float_add_in1(23)  		<= (others => '0');
			float_add_in1(24)  		<= (others => '0');
			float_add_in1(25)  		<= (others => '0');
			float_add_in1(26)  		<= (others => '0');
			float_add_in1(27)  		<= (others => '0');
			float_add_in1(28)  		<= (others => '0');
			float_add_in1(29)  		<= (others => '0');
			float_add_in1(30)  		<= (others => '0');
			float_add_in1(31)  		<= (others => '0');
			float_add_in2(0)  		<= (others => '0');
			float_add_in2(1)  		<= (others => '0');
			float_add_in2(2)  		<= (others => '0');
			float_add_in2(3)  		<= (others => '0');
			float_add_in2(4)  		<= (others => '0');
			float_add_in2(5)  		<= (others => '0');
			float_add_in2(6)  		<= (others => '0');
			float_add_in2(7)  		<= (others => '0');
			float_add_in2(8)  		<= (others => '0');
			float_add_in2(9)  		<= (others => '0');
			float_add_in2(10)  		<= (others => '0');
			float_add_in2(11)  		<= (others => '0');
			float_add_in2(12)  		<= (others => '0');
			float_add_in2(13)  		<= (others => '0');
			float_add_in2(14)  		<= (others => '0');
			float_add_in2(15)  		<= (others => '0');
			float_add_in2(16)  		<= (others => '0');
			float_add_in2(17)  		<= (others => '0');
			float_add_in2(18)  		<= (others => '0');
			float_add_in2(19)  		<= (others => '0');
			float_add_in2(20)  		<= (others => '0');
			float_add_in2(21)  		<= (others => '0');
			float_add_in2(22)  		<= (others => '0');
			float_add_in2(23)  		<= (others => '0');
			float_add_in2(24)  		<= (others => '0');
			float_add_in2(25)  		<= (others => '0');
			float_add_in2(26)  		<= (others => '0');
			float_add_in2(27)  		<= (others => '0');
			float_add_in2(28)  		<= (others => '0');
			float_add_in2(29)  		<= (others => '0');
			float_add_in2(30)  		<= (others => '0');
			float_add_in2(31)  		<= (others => '0');
			float_mult_in1(0)  		<= (others => '0');
			float_mult_in1(1)  		<= (others => '0');
			float_mult_in1(2)  		<= (others => '0');
			float_mult_in1(3)  		<= (others => '0');
			float_mult_in1(4)  		<= (others => '0');
			float_mult_in1(5)  		<= (others => '0');
			float_mult_in1(6) 		<= (others => '0');
			float_mult_in1(7)  		<= (others => '0');
			float_mult_in1(8)  		<= (others => '0');
			float_mult_in1(9)  		<= (others => '0');
			float_mult_in1(10)  		<= (others => '0');
			float_mult_in1(11)  		<= (others => '0');
			float_mult_in1(11)  		<= (others => '0');
			float_mult_in1(12)  		<= (others => '0');
			float_mult_in1(13)  		<= (others => '0');
			float_mult_in1(14)  		<= (others => '0');
			float_mult_in1(15)  		<= (others => '0');
			float_mult_in1(16)  		<= (others => '0');
			float_mult_in1(17)  		<= (others => '0');
			float_mult_in1(18) 		<= (others => '0');
			float_mult_in1(19)  		<= (others => '0');
			float_mult_in1(20)  		<= (others => '0');
			float_mult_in1(21)  		<= (others => '0');
			float_mult_in1(22)  		<= (others => '0');
			float_mult_in1(23)  		<= (others => '0');
			float_mult_in1(24)  		<= (others => '0');
			float_mult_in1(25)  		<= (others => '0');
			float_mult_in1(26)  		<= (others => '0');
			float_mult_in1(27)  		<= (others => '0');
			float_mult_in1(28)  		<= (others => '0');
			float_mult_in1(29)  		<= (others => '0');
			float_mult_in1(30)  		<= (others => '0');
			float_mult_in1(31)  		<= (others => '0');
			float_mult_in2(0)  		<= (others => '0');
			float_mult_in2(1)  		<= (others => '0');
			float_mult_in2(2)  		<= (others => '0');
			float_mult_in2(3)  		<= (others => '0');
			float_mult_in2(4)  		<= (others => '0');
			float_mult_in2(5)  		<= (others => '0');
			float_mult_in2(6)  		<= (others => '0');
			float_mult_in2(7)  		<= (others => '0');
			float_mult_in2(8)  		<= (others => '0');
			float_mult_in2(9)  		<= (others => '0');
			float_mult_in2(10)  		<= (others => '0');
			float_mult_in2(11)  		<= (others => '0');
			float_mult_in2(11)  		<= (others => '0');
			float_mult_in2(12)  		<= (others => '0');
			float_mult_in2(13)  		<= (others => '0');
			float_mult_in2(14)  		<= (others => '0');
			float_mult_in2(15)  		<= (others => '0');
			float_mult_in2(16)  		<= (others => '0');
			float_mult_in2(17)  		<= (others => '0');
			float_mult_in2(18)  		<= (others => '0');
			float_mult_in2(19)  		<= (others => '0');
			float_mult_in2(20)  		<= (others => '0');
			float_mult_in2(21)  		<= (others => '0');
			float_mult_in2(22)  		<= (others => '0');
			float_mult_in2(23)  		<= (others => '0');
			float_mult_in2(24)  		<= (others => '0');
			float_mult_in2(25)  		<= (others => '0');
			float_mult_in2(26)  		<= (others => '0');
			float_mult_in2(27)  		<= (others => '0');
			float_mult_in2(28)  		<= (others => '0');
			float_mult_in2(29)  		<= (others => '0');
			float_mult_in2(30)  		<= (others => '0');
			float_mult_in2(31)  		<= (others => '0');
			mult_degree_coef(0) 	<= (others => '0');
			mult_degree_coef(1) 	<= (others => '0');
			mult_degree_coef(2) 	<= (others => '0');
			mult_degree_coef(3) 	<= (others => '0');
			mult_degree_coef(4) 	<= (others => '0');
			mult_degree_coef(5) 	<= (others => '0');
			mult_degree_coef(6) 	<= (others => '0');
			mult_degree_coef(7) 	<= (others => '0');
			mult_degree_coef(8) 	<= (others => '0');
			mult_degree_coef(9) 	<= (others => '0');
			mult_degree_coef(10) <= (others => '0');
			mult_degree_coef(11) <= (others => '0');
			mult_degree_coef(12) <= (others => '0');
			mult_degree_coef(13) <= (others => '0');
			mult_degree_coef(14) <= (others => '0');
			mult_degree_coef(15) <= (others => '0');
			mult_degree_coef(16) <= (others => '0');
			mult_degree_coef(17) <= (others => '0');
			mult_degree_coef(18) <= (others => '0');
			mult_degree_coef(19) <= (others => '0');
			mult_degree_coef(20) <= (others => '0');
			mult_degree_coef(21) <= (others => '0');
			mult_degree_coef(22) <= (others => '0');
			mult_degree_coef(23) <= (others => '0');
			mult_degree_coef(24) <= (others => '0');
			mult_degree_coef(25) <= (others => '0');
			mult_degree_coef(26) <= (others => '0');
			mult_degree_coef(27) <= (others => '0');
			mult_degree_coef(28) <= (others => '0');
			mult_degree_coef(29) <= (others => '0');
			mult_degree_coef(30) <= (others => '0');
			mult_degree_coef(31) <= (others => '0');
			variable_power_array(0) <= (others => '0');
			variable_power_array(1) <= (others => '0');
			variable_power_array(2) <= (others => '0');
			variable_power_array(3) <= (others => '0');
			variable_power_array(4) <= (others => '0');
			variable_power_array(5) <= (others => '0');
			variable_power_array(6) <= (others => '0');
			variable_power_array(7) <= (others => '0');
			variable_power_array(8) <= (others => '0');
			variable_power_array(9)	 <= (others => '0');
			variable_power_array(10) <= (others => '0');
			variable_power_array(11) <= (others => '0');
			variable_power_array(12) <= (others => '0');
			variable_power_array(13) <= (others => '0');
			variable_power_array(14) <= (others => '0');
			variable_power_array(15) <= (others => '0');
			variable_power_array(16) <= (others => '0');
			variable_power_array(17) <= (others => '0');
			variable_power_array(18) <= (others => '0');
			variable_power_array(19) <= (others => '0');
			variable_power_array(20) <= (others => '0');
			variable_power_array(21) <= (others => '0');
			variable_power_array(22) <= (others => '0');
			variable_power_array(23) <= (others => '0');
			variable_power_array(24) <= (others => '0');
			variable_power_array(25) <= (others => '0');
			variable_power_array(26) <= (others => '0');
			variable_power_array(27) <= (others => '0');
			variable_power_array(28) <= (others => '0');
			variable_power_array(29) <= (others => '0');
			variable_power_array(30) <= (others => '0');
			variable_power_array(31) <= (others => '0');
			complete_op		 				<= '0';
			variable_value_int					<= (others => '0');
			calculator_result						<= (others => '0');
			der_subs_result						<= (others => '0');
			subs_result								<= (others => '0');
			cnt 										<= 0;
			state										<= idle;
		elsif(rising_edge(clk)) then
			
			case state is
				
				when idle =>
					if(start_op = '1') then
						variable_value_int	<= variable_value;
						coefficient(0) 	<= coefficient0;
						coefficient(1) 	<= coefficient1;
						coefficient(2) 	<= coefficient2; 
						coefficient(3) 	<= coefficient3;
						coefficient(4) 	<= coefficient4;
						coefficient(5) 	<= coefficient5;
						coefficient(6) 	<= coefficient6;
						coefficient(7) 	<= coefficient7;
						coefficient(8) 	<= coefficient8;
						coefficient(9) 	<= coefficient9;
						coefficient(10) 	<= coefficient10;
						coefficient(11) 	<= coefficient11;
						coefficient(12) 	<= coefficient12;
						coefficient(13) 	<= coefficient13;
						coefficient(14) 	<= coefficient14;
						coefficient(15) 	<= coefficient15;
						coefficient(16) 	<= coefficient16;
						coefficient(17) 	<= coefficient17;
						coefficient(18) 	<= coefficient18;
						coefficient(19) 	<= coefficient19;
						coefficient(20) 	<= coefficient20;
						coefficient(21) 	<= coefficient21;
						coefficient(22) 	<= coefficient22;
						coefficient(23) 	<= coefficient23;
						coefficient(24) 	<= coefficient24;
						coefficient(25) 	<= coefficient25;
						coefficient(26) 	<= coefficient26;
						coefficient(27) 	<= coefficient27;
						coefficient(28) 	<= coefficient28;
						coefficient(29) 	<= coefficient29;
						coefficient(30) 	<= coefficient30;
						coefficient(31) 	<= coefficient31;
						state 				<= initialize_derivative;
						complete_op		 	<= '0';
					end if;
					
				when initialize_derivative=>
					cnt <= 0;
					float_mult_in1(0)  <= fp_const(degree_min);
					float_mult_in2(0)  <= coefficient(0);						
					float_mult_in1(1)  <= fp_const(degree_min + 1);
					float_mult_in2(1)  <= coefficient(1);						
					float_mult_in1(2)  <= fp_const(degree_min + 2);
					float_mult_in2(2)  <= coefficient(2);						
					float_mult_in1(3)  <= fp_const(degree_min + 3);
					float_mult_in2(3)  <= coefficient(3);						
					float_mult_in1(4)  <= fp_const(degree_min + 4);
					float_mult_in2(4)  <= coefficient(4);						
					float_mult_in1(5)  <= fp_const(degree_min + 5);
					float_mult_in2(5)  <= coefficient(5);						
					float_mult_in1(6)  <= fp_const(degree_min + 6);
					float_mult_in2(6)  <= coefficient(6);						
					float_mult_in1(7)  <= fp_const(degree_min + 7);
					float_mult_in2(7)  <= coefficient(7);						
					float_mult_in1(8)  <= fp_const(degree_min + 8);
					float_mult_in2(8)  <= coefficient(8);						
					float_mult_in1(9)  <= fp_const(degree_min + 9);
					float_mult_in2(9)  <= coefficient(9);						
					float_mult_in1(10) <= fp_const(degree_min + 10);
					float_mult_in2(10) <= coefficient(10);						
					float_mult_in1(11) <= fp_const(degree_min + 11);
					float_mult_in2(11) <= coefficient(11);						
					float_mult_in1(12) <= fp_const(degree_min + 12);
					float_mult_in2(12) <= coefficient(12);						
					float_mult_in1(13) <= fp_const(degree_min + 13);
					float_mult_in2(13) <= coefficient(13);						
					float_mult_in1(14) <= fp_const(degree_min + 14);
					float_mult_in2(14) <= coefficient(14);						
					float_mult_in1(15) <= fp_const(degree_min + 15);
					float_mult_in2(15) <= coefficient(15);		
					float_mult_in1(16) <= fp_const(degree_min + 16);
					float_mult_in2(16) <= coefficient(16);	
					float_mult_in1(17) <= fp_const(degree_min + 17);
					float_mult_in2(17) <= coefficient(17);	
					float_mult_in1(18) <= fp_const(degree_min + 18);
					float_mult_in2(18) <= coefficient(18);	
					float_mult_in1(19) <= fp_const(degree_min + 19);
					float_mult_in2(19) <= coefficient(19);	
					float_mult_in1(20) <= fp_const(degree_min + 20);
					float_mult_in2(20) <= coefficient(20);	
					float_mult_in1(21) <= fp_const(degree_min + 21);
					float_mult_in2(21) <= coefficient(21);	
					float_mult_in1(22) <= fp_const(degree_min + 22);
					float_mult_in2(22) <= coefficient(22);
					float_mult_in1(23) <= fp_const(degree_min + 23);
					float_mult_in2(23) <= coefficient(23);
					float_mult_in1(24) <= fp_const(degree_min + 24);
					float_mult_in2(24) <= coefficient(24);
					float_mult_in1(25) <= fp_const(degree_min + 25);
					float_mult_in2(25) <= coefficient(25);
					float_mult_in1(26) <= fp_const(degree_min + 26);
					float_mult_in2(26) <= coefficient(26);
					float_mult_in1(27) <= fp_const(degree_min + 27);
					float_mult_in2(27) <= coefficient(27);
					float_mult_in1(28) <= fp_const(degree_min + 28);
					float_mult_in2(28) <= coefficient(28);
					float_mult_in1(29) <= fp_const(degree_min + 29);
					float_mult_in2(29) <= coefficient(29);
					float_mult_in1(30) <= fp_const(degree_min + 30);
					float_mult_in2(30) <= coefficient(30);
					float_mult_in1(31) <= fp_const(degree_min + 31);
					float_mult_in2(31) <= coefficient(31);				
					variable_power_array(0)	<= "00111111100000000000000000000000"; -- float '1'
					variable_power_array(1) <= variable_value_int(31 downto 0); 
					state <= wait_mult_op;
					
				when wait_mult_op =>
					if(cnt = MULTIPLIER_DELAY) then
						cnt <= 0;
						mult_degree_coef(0) 	<= float_mult_out(0);
						mult_degree_coef(1) 	<= float_mult_out(1);
						mult_degree_coef(2) 	<= float_mult_out(2);
						mult_degree_coef(3) 	<= float_mult_out(3);
						mult_degree_coef(4) 	<= float_mult_out(4);
						mult_degree_coef(5) 	<= float_mult_out(5);
						mult_degree_coef(6) 	<= float_mult_out(6);
						mult_degree_coef(7) 	<= float_mult_out(7);
						mult_degree_coef(8) 	<= float_mult_out(8);
						mult_degree_coef(9) 	<= float_mult_out(9);
						mult_degree_coef(10) <= float_mult_out(10);
						mult_degree_coef(11) <= float_mult_out(11);
						mult_degree_coef(12) <= float_mult_out(12);
						mult_degree_coef(13) <= float_mult_out(13);
						mult_degree_coef(14) <= float_mult_out(14);
						mult_degree_coef(15) <= float_mult_out(15);
						mult_degree_coef(16) <= float_mult_out(16);
						mult_degree_coef(17) <= float_mult_out(17);
						mult_degree_coef(18) <= float_mult_out(18);
						mult_degree_coef(19) <= float_mult_out(19);
						mult_degree_coef(20) <= float_mult_out(20);
						mult_degree_coef(21) <= float_mult_out(21);
						mult_degree_coef(22) <= float_mult_out(22);
						mult_degree_coef(23) <= float_mult_out(23);
						mult_degree_coef(24) <= float_mult_out(24);
						mult_degree_coef(25) <= float_mult_out(25);
						mult_degree_coef(26) <= float_mult_out(26);
						mult_degree_coef(27) <= float_mult_out(27);
						mult_degree_coef(28) <= float_mult_out(28);
						mult_degree_coef(29) <= float_mult_out(29);
						mult_degree_coef(30) <= float_mult_out(30);
						mult_degree_coef(31) <= float_mult_out(31);
						if(degree > 1) then
							state <= mult1_op;
						else
							state <= derivative_multiply;
						end if;
					else
						cnt <= cnt + 1;
					end if;
					
				when mult1_op =>
					cnt <= 0;
					float_mult_in1(0) <= variable_value_int(31 downto 0);
					float_mult_in2(0) <= variable_value_int(31 downto 0);
					state <= wait_mult1_op;
				
				when wait_mult1_op =>
					if(cnt = MULTIPLIER_DELAY) then
						cnt <= 0;
						if(degree > 2) then
							state <= mult2_op;
						else
							state <= derivative_multiply;
						end if;
						variable_power_array(2)	<= float_mult_out(0);
					else
						cnt <= cnt + 1;
					end if;
					
					
				when mult2_op =>
					cnt <= 0;
					float_mult_in1(0) 	<= variable_power_array(1);
					float_mult_in2(0) 	<= variable_power_array(2);
					float_mult_in1(1) 	<= variable_power_array(2);
					float_mult_in2(1) 	<= variable_power_array(2);
					state <= wait_mult2_op;
				
				when wait_mult2_op =>
					if(cnt = MULTIPLIER_DELAY) then
						cnt <= 0;
						variable_power_array(3)	<= float_mult_out(0);
						if(degree > 3) then
							variable_power_array(4)	<= float_mult_out(1);
						end if;
						if(degree > 4) then
							state <= mult3_op;
						else
							state <= derivative_multiply;
						end if;
					else
						cnt <= cnt + 1;
					end if;
					
				when mult3_op =>
					cnt <= 0;
					float_mult_in1(0) 	<= variable_power_array(2);
					float_mult_in2(0) 	<= variable_power_array(3);
					float_mult_in1(1) 	<= variable_power_array(3);
					float_mult_in2(1) 	<= variable_power_array(3);
					float_mult_in1(2) 	<= variable_power_array(3);
					float_mult_in2(2) 	<= variable_power_array(4);
					float_mult_in1(3) 	<= variable_power_array(4);
					float_mult_in2(3) 	<= variable_power_array(4);
					state <= wait_mult3_op;
				
				when wait_mult3_op =>
					if(cnt = MULTIPLIER_DELAY) then
						cnt <= 0;
						variable_power_array(5)	<= float_mult_out(0);
						variable_power_array(6)	<= float_mult_out(1);
						variable_power_array(7)	<= float_mult_out(2);
						variable_power_array(8)	<= float_mult_out(3);
						if(degree > 8) then
							state <= mult4_op;
						else
							state <= derivative_multiply;
						end if;
					else
						cnt <= cnt + 1;
					end if;
					
				when mult4_op =>
					cnt <= 0;
					float_mult_in1(0) 		<= variable_power_array(4);
					float_mult_in2(0) 		<= variable_power_array(5);
					float_mult_in1(1) 		<= variable_power_array(5);
					float_mult_in2(1) 		<= variable_power_array(5);
					float_mult_in1(2) 		<= variable_power_array(5);
					float_mult_in2(2) 		<= variable_power_array(6);
					float_mult_in1(3) 		<= variable_power_array(6);
					float_mult_in2(3) 		<= variable_power_array(6);
					float_mult_in1(4) 		<= variable_power_array(6);
					float_mult_in2(4) 		<= variable_power_array(7);
					float_mult_in1(5) 		<= variable_power_array(7);
					float_mult_in2(5) 		<= variable_power_array(7);
					float_mult_in1(6) 		<= variable_power_array(7);
					float_mult_in2(6) 		<= variable_power_array(8);
					float_mult_in1(7) 		<= variable_power_array(8);
					float_mult_in2(7) 		<= variable_power_array(8);
					state <= wait_mult4_op;
				
				when wait_mult4_op =>
					if(cnt = MULTIPLIER_DELAY) then
						cnt <= 0;
						variable_power_array(9)					   <= float_mult_out(0);
						if(degree > 9) then
							variable_power_array(10)					<= float_mult_out(1);
						end if;
						if(degree > 10) then
							variable_power_array(11)					<= float_mult_out(2);
						end if;
						if(degree > 11) then
							variable_power_array(12)					<= float_mult_out(3);
						end if;
						if(degree > 12) then
							variable_power_array(13)					<= float_mult_out(4);
						end if;
						if(degree > 13) then
							variable_power_array(14)					<= float_mult_out(5);
						end if;
						if(degree > 14) then
							variable_power_array(15)					<= float_mult_out(6);
						end if;
						if(degree > 15) then
							variable_power_array(16)					<= float_mult_out(7);
						end if;
						if(degree > 16) then
							state <= mult5_op;
						else
							state <= derivative_multiply;
						end if;
					else
						cnt <= cnt + 1;
					end if;
					
				when mult5_op =>
					cnt <= 0;
					float_mult_in1(0) 		<= variable_power_array(8);
					float_mult_in2(0) 		<= variable_power_array(9);
					float_mult_in1(1) 		<= variable_power_array(9);
					float_mult_in2(1) 		<= variable_power_array(9);
					float_mult_in1(2) 		<= variable_power_array(9);
					float_mult_in2(2) 		<= variable_power_array(10);
					float_mult_in1(3) 		<= variable_power_array(10);
					float_mult_in2(3) 		<= variable_power_array(10);
					float_mult_in1(4) 		<= variable_power_array(10);
					float_mult_in2(4) 		<= variable_power_array(11);
					float_mult_in1(5) 		<= variable_power_array(11);
					float_mult_in2(5) 		<= variable_power_array(11);
					float_mult_in1(6) 		<= variable_power_array(11);
					float_mult_in2(6) 		<= variable_power_array(12);
					float_mult_in1(7) 		<= variable_power_array(12);
					float_mult_in2(7) 		<= variable_power_array(12);
					float_mult_in1(8) 		<= variable_power_array(12);
					float_mult_in2(8) 		<= variable_power_array(13);
					float_mult_in1(9) 		<= variable_power_array(13);
					float_mult_in2(9) 		<= variable_power_array(13);
					float_mult_in1(10) 		<= variable_power_array(13);
					float_mult_in2(10) 		<= variable_power_array(14);
					float_mult_in1(11) 		<= variable_power_array(14);
					float_mult_in2(11) 		<= variable_power_array(14);
					float_mult_in1(12) 		<= variable_power_array(14);
					float_mult_in2(12) 		<= variable_power_array(15);
					float_mult_in1(13) 		<= variable_power_array(15);
					float_mult_in2(13) 		<= variable_power_array(15);
					float_mult_in1(14) 		<= variable_power_array(15);
					float_mult_in2(14) 		<= variable_power_array(16);
					state <= wait_mult5_op;
				
				when wait_mult5_op =>
					if(cnt = MULTIPLIER_DELAY) then
						cnt <= 0;
						variable_power_array(17)					<= float_mult_out(0);
						if(degree > 17) then
							variable_power_array(18)					<= float_mult_out(1);
						end if;
						if(degree > 18) then
							variable_power_array(19)					<= float_mult_out(2);
						end if;
						if(degree > 19) then
							variable_power_array(20)					<= float_mult_out(3);
						end if;
						if(degree > 20) then
							variable_power_array(21)					<= float_mult_out(4);
						end if;
						if(degree > 21) then
							variable_power_array(22)					<= float_mult_out(5);
						end if;
						if(degree > 22) then
							variable_power_array(23)					<= float_mult_out(6);
						end if;
						if(degree > 23) then
							variable_power_array(24)					<= float_mult_out(7);
						end if;
						if(degree > 24) then
							variable_power_array(25)					<= float_mult_out(8);
						end if;
						if(degree > 25) then
							variable_power_array(26)					<= float_mult_out(9);
						end if;
						if(degree > 26) then
							variable_power_array(27)					<= float_mult_out(10);
						end if;
						if(degree > 27) then
							variable_power_array(28)					<= float_mult_out(11);
						end if;
						if(degree > 28) then
							variable_power_array(29)					<= float_mult_out(12);
						end if;
						if(degree > 29) then
							variable_power_array(30)					<= float_mult_out(13);
						end if;
						if(degree > 30) then
							variable_power_array(31)					<= float_mult_out(14);
						end if;
						state 	<= derivative_multiply;
					else
						cnt <= cnt + 1;
					end if;
					
				when derivative_multiply =>
					state <= wait_derivative_multiply;
					cnt <= 0;
					float_mult_in1(0)  <= variable_power_array(degree_min - 1);
					float_mult_in2(0)  <= mult_degree_coef(0);						
					float_mult_in1(1)  <= variable_power_array(degree_min);
					float_mult_in2(1)  <= mult_degree_coef(1);						
					float_mult_in1(2)  <= variable_power_array(degree_min + 1);
					float_mult_in2(2)  <= mult_degree_coef(2);						
					float_mult_in1(3)  <= variable_power_array(degree_min + 2);
					float_mult_in2(3)  <= mult_degree_coef(3);						
					float_mult_in1(4)  <= variable_power_array(degree_min + 3);
					float_mult_in2(4)  <= mult_degree_coef(4);						
					float_mult_in1(5)  <= variable_power_array(degree_min + 4);
					float_mult_in2(5)  <= mult_degree_coef(5);						
					float_mult_in1(6)  <= variable_power_array(degree_min + 5);
					float_mult_in2(6)  <= mult_degree_coef(6);						
					float_mult_in1(7)  <= variable_power_array(degree_min + 6);
					float_mult_in2(7)  <= mult_degree_coef(7);						
					float_mult_in1(8)  <= variable_power_array(degree_min + 7);
					float_mult_in2(8)  <= mult_degree_coef(8);						
					float_mult_in1(9)  <= variable_power_array(degree_min + 8);
					float_mult_in2(9)  <= mult_degree_coef(9);						
					float_mult_in1(10) <= variable_power_array(degree_min + 9);
					float_mult_in2(10) <= mult_degree_coef(10);						
					float_mult_in1(11) <= variable_power_array(degree_min + 10);
					float_mult_in2(11) <= mult_degree_coef(11);						
					float_mult_in1(12) <= variable_power_array(degree_min + 11);
					float_mult_in2(12) <= mult_degree_coef(12);						
					float_mult_in1(13) <= variable_power_array(degree_min + 12);
					float_mult_in2(13) <= mult_degree_coef(13);						
					float_mult_in1(14) <= variable_power_array(degree_min + 13);
					float_mult_in2(14) <= mult_degree_coef(14);						
					float_mult_in1(15) <= variable_power_array(degree_min + 14);
					float_mult_in2(15) <= mult_degree_coef(15);		
					float_mult_in1(16) <= variable_power_array(degree_min + 15);
					float_mult_in2(16) <= mult_degree_coef(16);	
					float_mult_in1(17) <= variable_power_array(degree_min + 16);
					float_mult_in2(17) <= mult_degree_coef(17);	
					float_mult_in1(18) <= variable_power_array(degree_min + 17);
					float_mult_in2(18) <= mult_degree_coef(18);	
					float_mult_in1(19) <= variable_power_array(degree_min + 18);
					float_mult_in2(19) <= mult_degree_coef(19);	
					float_mult_in1(20) <= variable_power_array(degree_min + 19);
					float_mult_in2(20) <= mult_degree_coef(20);	
					float_mult_in1(21) <= variable_power_array(degree_min + 20);
					float_mult_in2(21) <= mult_degree_coef(21);	
					float_mult_in1(22) <= variable_power_array(degree_min + 21);
					float_mult_in2(22) <= mult_degree_coef(22);
					float_mult_in1(23) <= variable_power_array(degree_min + 22);
					float_mult_in2(23) <= mult_degree_coef(23);
					float_mult_in1(24) <= variable_power_array(degree_min + 23);
					float_mult_in2(24) <= mult_degree_coef(24);
					float_mult_in1(25) <= variable_power_array(degree_min + 24);
					float_mult_in2(25) <= mult_degree_coef(25);
					float_mult_in1(26) <= variable_power_array(degree_min + 25);
					float_mult_in2(26) <= mult_degree_coef(26);
					float_mult_in1(27) <= variable_power_array(degree_min + 26);
					float_mult_in2(27) <= mult_degree_coef(27);
					float_mult_in1(28) <= variable_power_array(degree_min + 27);
					float_mult_in2(28) <= mult_degree_coef(28);
					float_mult_in1(29) <= variable_power_array(degree_min + 28);
					float_mult_in2(29) <= mult_degree_coef(29);
					float_mult_in1(30) <= variable_power_array(degree_min + 29);
					float_mult_in2(30) <= mult_degree_coef(30);
					float_mult_in1(31) <= variable_power_array(degree_min + 30);
					float_mult_in2(31) <= mult_degree_coef(31);	
					
				when wait_derivative_multiply =>
					if(cnt = MULTIPLIER_DELAY) then
						cnt <= 0;
						state <= substitution_multiply;
					else
						cnt <= cnt + 1;
					end if;
					
				when substitution_multiply =>
					cnt <= 0;
					state <= wait_substitution_multiply;
					/* register derivative mult result */
					derivative_mult_result(0) 	 <= float_mult_out(0);
					derivative_mult_result(1) 	 <= float_mult_out(1);
					derivative_mult_result(2) 	 <= float_mult_out(2);
					derivative_mult_result(3) 	 <= float_mult_out(3);
					derivative_mult_result(4) 	 <= float_mult_out(4);
					derivative_mult_result(5) 	 <= float_mult_out(5);
					derivative_mult_result(6) 	 <= float_mult_out(6);
					derivative_mult_result(7) 	 <= float_mult_out(7);
					derivative_mult_result(8) 	 <= float_mult_out(8);
					derivative_mult_result(9) 	 <= float_mult_out(9);
					derivative_mult_result(10)  <= float_mult_out(10);
					derivative_mult_result(11)  <= float_mult_out(11);
					derivative_mult_result(12)  <= float_mult_out(12);
					derivative_mult_result(13)  <= float_mult_out(13);
					derivative_mult_result(14)  <= float_mult_out(14);
					derivative_mult_result(15)  <= float_mult_out(15);
					derivative_mult_result(16)  <= float_mult_out(16);
					derivative_mult_result(17)  <= float_mult_out(17);
					derivative_mult_result(18)  <= float_mult_out(18);
					derivative_mult_result(19)  <= float_mult_out(19);
					derivative_mult_result(20)  <= float_mult_out(20);
					derivative_mult_result(21)  <= float_mult_out(21);
					derivative_mult_result(22)  <= float_mult_out(22);
					derivative_mult_result(23)  <= float_mult_out(23);
					derivative_mult_result(24)  <= float_mult_out(24);
					derivative_mult_result(25)  <= float_mult_out(25);
					derivative_mult_result(26)  <= float_mult_out(26);
					derivative_mult_result(27)  <= float_mult_out(27);
					derivative_mult_result(28)  <= float_mult_out(28);
					derivative_mult_result(29)  <= float_mult_out(29);
					derivative_mult_result(30)  <= float_mult_out(30);
					derivative_mult_result(31)  <= float_mult_out(31);
					/* initialize multipliers */
					float_mult_in1(0)  <= variable_power_array(degree_min);
					float_mult_in2(0)  <= coefficient(0);						
					float_mult_in1(1)  <= variable_power_array(degree_min + 1);
					float_mult_in2(1)  <= coefficient(1);						
					float_mult_in1(2)  <= variable_power_array(degree_min + 2);
					float_mult_in2(2)  <= coefficient(2);						
					float_mult_in1(3)  <= variable_power_array(degree_min + 3);
					float_mult_in2(3)  <= coefficient(3);						
					float_mult_in1(4)  <= variable_power_array(degree_min + 4);
					float_mult_in2(4)  <= coefficient(4);						
					float_mult_in1(5)  <= variable_power_array(degree_min + 5);
					float_mult_in2(5)  <= coefficient(5);						
					float_mult_in1(6)  <= variable_power_array(degree_min + 6);
					float_mult_in2(6)  <= coefficient(6);						
					float_mult_in1(7)  <= variable_power_array(degree_min + 7);
					float_mult_in2(7)  <= coefficient(7);						
					float_mult_in1(8)  <= variable_power_array(degree_min + 8);
					float_mult_in2(8)  <= coefficient(8);						
					float_mult_in1(9)  <= variable_power_array(degree_min + 9);
					float_mult_in2(9)  <= coefficient(9);						
					float_mult_in1(10) <= variable_power_array(degree_min + 10);
					float_mult_in2(10) <= coefficient(10);						
					float_mult_in1(11) <= variable_power_array(degree_min + 11);
					float_mult_in2(11) <= coefficient(11);						
					float_mult_in1(12) <= variable_power_array(degree_min + 12);
					float_mult_in2(12) <= coefficient(12);						
					float_mult_in1(13) <= variable_power_array(degree_min + 13);
					float_mult_in2(13) <= coefficient(13);						
					float_mult_in1(14) <= variable_power_array(degree_min + 14);
					float_mult_in2(14) <= coefficient(14);						
					float_mult_in1(15) <= variable_power_array(degree_min + 15);
					float_mult_in2(15) <= coefficient(15);		
					float_mult_in1(16) <= variable_power_array(degree_min + 16);
					float_mult_in2(16) <= coefficient(16);	
					float_mult_in1(17) <= variable_power_array(degree_min + 17);
					float_mult_in2(17) <= coefficient(17);	
					float_mult_in1(18) <= variable_power_array(degree_min + 18);
					float_mult_in2(18) <= coefficient(18);	
					float_mult_in1(19) <= variable_power_array(degree_min + 19);
					float_mult_in2(19) <= coefficient(19);	
					float_mult_in1(20) <= variable_power_array(degree_min + 20);
					float_mult_in2(20) <= coefficient(20);	
					float_mult_in1(21) <= variable_power_array(degree_min + 21);
					float_mult_in2(21) <= coefficient(21);	
					float_mult_in1(22) <= variable_power_array(degree_min + 22);
					float_mult_in2(22) <= coefficient(22);
					float_mult_in1(23) <= variable_power_array(degree_min + 23);
					float_mult_in2(23) <= coefficient(23);
					float_mult_in1(24) <= variable_power_array(degree_min + 24);
					float_mult_in2(24) <= coefficient(24);
					float_mult_in1(25) <= variable_power_array(degree_min + 25);
					float_mult_in2(25) <= coefficient(25);
					float_mult_in1(26) <= variable_power_array(degree_min + 26);
					float_mult_in2(26) <= coefficient(26);
					float_mult_in1(27) <= variable_power_array(degree_min + 27);
					float_mult_in2(27) <= coefficient(27);
					float_mult_in1(28) <= variable_power_array(degree_min + 28);
					float_mult_in2(28) <= coefficient(28);
					float_mult_in1(29) <= variable_power_array(degree_min + 29);
					float_mult_in2(29) <= coefficient(29);
					float_mult_in1(30) <= variable_power_array(degree_min + 30);
					float_mult_in2(30) <= coefficient(30);
					float_mult_in1(31) <= variable_power_array(degree_min + 31);
					float_mult_in2(31) <= coefficient(31);
					
		
				when wait_substitution_multiply =>
					if(cnt = MULTIPLIER_DELAY) then
						cnt <= 0;
						state <= initialize_subs_add1;
					else
						cnt <= cnt + 1;
					end if;
					
				when initialize_subs_add1 =>
					cnt <= 0;
					float_add_in1(0)	<= derivative_mult_result(0);
					float_add_in2(0)	<= derivative_mult_result(1);
					float_add_in1(1)	<= derivative_mult_result(2);
					float_add_in2(1)	<= derivative_mult_result(3);
					float_add_in1(2)	<= derivative_mult_result(4);
					float_add_in2(2)	<= derivative_mult_result(5);
					float_add_in1(3)	<= derivative_mult_result(6);
					float_add_in2(3)	<= derivative_mult_result(7);
					float_add_in1(4)	<= derivative_mult_result(8);
					float_add_in2(4)	<= derivative_mult_result(9);
					float_add_in1(5)	<= derivative_mult_result(10);
					float_add_in2(5)	<= derivative_mult_result(11);
					float_add_in1(6)	<= derivative_mult_result(12);
					float_add_in2(6)	<= derivative_mult_result(13);
					float_add_in1(7)	<= derivative_mult_result(14);
					float_add_in2(7)	<= derivative_mult_result(15);
					float_add_in1(8)	<= derivative_mult_result(16);
					float_add_in2(8)	<= derivative_mult_result(17);
					float_add_in1(9)	<= derivative_mult_result(18);
					float_add_in2(9)	<= derivative_mult_result(19);
					float_add_in1(10)	<= derivative_mult_result(20);
					float_add_in2(10)	<= derivative_mult_result(21);
					float_add_in1(11)	<= derivative_mult_result(22);
					float_add_in2(11)	<= derivative_mult_result(23);
					float_add_in1(12)	<= derivative_mult_result(24);
					float_add_in2(12)	<= derivative_mult_result(25);
					float_add_in1(13)	<= derivative_mult_result(26);
					float_add_in2(13)	<= derivative_mult_result(27);
					float_add_in1(14)	<= derivative_mult_result(28);
					float_add_in2(14)	<= derivative_mult_result(29);
					float_add_in1(15)	<= derivative_mult_result(30);
					float_add_in2(15)	<= derivative_mult_result(31);
					float_add_in1(16)	<= float_mult_out(0);
					float_add_in2(16)	<= float_mult_out(1);
					float_add_in1(17)	<= float_mult_out(2);
					float_add_in2(17)	<= float_mult_out(3);
					float_add_in1(18)	<= float_mult_out(4);
					float_add_in2(18)	<= float_mult_out(5);
					float_add_in1(19)	<= float_mult_out(6);
					float_add_in2(19)	<= float_mult_out(7);
					float_add_in1(20)	<= float_mult_out(8);
					float_add_in2(20)	<= float_mult_out(9);
					float_add_in1(21)	<= float_mult_out(10);
					float_add_in2(21)	<= float_mult_out(11);
					float_add_in1(22)	<= float_mult_out(12);
					float_add_in2(22)	<= float_mult_out(13);
					float_add_in1(23)	<= float_mult_out(14);
					float_add_in2(23)	<= float_mult_out(15);
					float_add_in1(24)	<= float_mult_out(16);
					float_add_in2(24)	<= float_mult_out(17);
					float_add_in1(25)	<= float_mult_out(18);
					float_add_in2(25)	<= float_mult_out(19);
					float_add_in1(26)	<= float_mult_out(20);
					float_add_in2(26)	<= float_mult_out(21);
					float_add_in1(27)	<= float_mult_out(22);
					float_add_in2(27)	<= float_mult_out(23);
					float_add_in1(28)	<= float_mult_out(24);
					float_add_in2(28)	<= float_mult_out(25);
					float_add_in1(29)	<= float_mult_out(26);
					float_add_in2(29)	<= float_mult_out(27);
					float_add_in1(30)	<= float_mult_out(28);
					float_add_in2(30)	<= float_mult_out(29);
					float_add_in1(31)	<= float_mult_out(30);
					float_add_in2(31)	<= float_mult_out(31);
					state <= wait_subs_add1;
				
				when wait_subs_add1 =>
					if(cnt = ADDER_DELAY) then
						cnt <= 0;
						state <= initialize_subs_add2;
					else
						cnt <= cnt + 1;
					end if;
				
				when initialize_subs_add2 =>
					cnt <= 0;
					float_add_in1(0)	<= float_add_out(0);
					float_add_in2(0)	<= float_add_out(1);
					float_add_in1(1)	<= float_add_out(2);
					float_add_in2(1)	<= float_add_out(3);
					float_add_in1(2)	<= float_add_out(4);
					float_add_in2(2)	<= float_add_out(5);
					float_add_in1(3)	<= float_add_out(6);
					float_add_in2(3)	<= float_add_out(7);
					float_add_in1(4)	<= float_add_out(8);
					float_add_in2(4)	<= float_add_out(9);
					float_add_in1(5)	<= float_add_out(10);
					float_add_in2(5)	<= float_add_out(11);
					float_add_in1(6)	<= float_add_out(12);
					float_add_in2(6)	<= float_add_out(13);
					float_add_in1(7)	<= float_add_out(14);
					float_add_in2(7)	<= float_add_out(15);
					float_add_in1(8)	<= float_add_out(16);
					float_add_in2(8)	<= float_add_out(17);
					float_add_in1(9)	<= float_add_out(18);
					float_add_in2(9)	<= float_add_out(19);
					float_add_in1(10)	<= float_add_out(20);
					float_add_in2(10)	<= float_add_out(21);
					float_add_in1(11)	<= float_add_out(22);
					float_add_in2(11)	<= float_add_out(23);
					float_add_in1(12)	<= float_add_out(24);
					float_add_in2(12)	<= float_add_out(25);
					float_add_in1(13)	<= float_add_out(26);
					float_add_in2(13)	<= float_add_out(27);
					float_add_in1(14)	<= float_add_out(28);
					float_add_in2(14)	<= float_add_out(29);
					float_add_in1(15)	<= float_add_out(30);
					float_add_in2(15)	<= float_add_out(31);
					state <= wait_subs_add2;
				
				when wait_subs_add2 =>
					if(cnt = ADDER_DELAY) then
						cnt <= 0;
						state <= initialize_subs_add3;
					else
						cnt <= cnt + 1;
					end if;
					
				when initialize_subs_add3 =>
					cnt <= 0;
					float_add_in1(0)	<= float_add_out(0);
					float_add_in2(0)	<= float_add_out(1);
					float_add_in1(1)	<= float_add_out(2);
					float_add_in2(1)	<= float_add_out(3);
					float_add_in1(2)	<= float_add_out(4);
					float_add_in2(2)	<= float_add_out(5);
					float_add_in1(3)	<= float_add_out(6);
					float_add_in2(3)	<= float_add_out(7);
					float_add_in1(4)	<= float_add_out(8);
					float_add_in2(4)	<= float_add_out(9);
					float_add_in1(5)	<= float_add_out(10);
					float_add_in2(5)	<= float_add_out(11);
					float_add_in1(6)	<= float_add_out(12);
					float_add_in2(6)	<= float_add_out(13);
					float_add_in1(7)	<= float_add_out(14);
					float_add_in2(7)	<= float_add_out(15);
					state <= wait_subs_add3;
					
				
				when wait_subs_add3 =>
					if(cnt = ADDER_DELAY) then
						cnt <= 0;
						state <= initialize_subs_add4;
					else
						cnt <= cnt + 1;
					end if;
					
					
				when initialize_subs_add4 =>
					cnt <= 0;
					float_add_in1(0)	<= float_add_out(0);
					float_add_in2(0)	<= float_add_out(1);
					float_add_in1(1)	<= float_add_out(2);
					float_add_in2(1)	<= float_add_out(3);
					float_add_in1(2)	<= float_add_out(4);
					float_add_in2(2)	<= float_add_out(5);
					float_add_in1(3)	<= float_add_out(6);
					float_add_in2(3)	<= float_add_out(7);
					state <= wait_subs_add4;
		
				
				when wait_subs_add4 =>
					if(cnt = ADDER_DELAY) then
						cnt <= 0;
						state <= initialize_subs_add5;
					else
						cnt <= cnt + 1;
					end if;
					
					
				when initialize_subs_add5 =>
					cnt <= 0;
					float_add_in1(0)	<= float_add_out(0);
					float_add_in2(0)	<= float_add_out(1);	
					float_add_in1(1)	<= float_add_out(2);
					float_add_in2(1)	<= float_add_out(3);	
					state <= wait_addition_result;
				
				when wait_addition_result =>
					if(cnt = ADDER_DELAY) then
						cnt <= 0;
						der_subs_result <= float_add_out(0);
						subs_result <= float_add_out(1);
						state <= initialize_division;
					else
						cnt <= cnt + 1;
					end if;
					
				when initialize_division =>
					cnt <= 0;
					if(der_subs_result = "00000000000000000000000000000000") then
						state <= initialize_substractor;
						accuracy <= (others => '0');
					else
						float_div_in1 <= subs_result;
						float_div_in2 <= der_subs_result;
						state <= wait_division;
					end if;
					
				when wait_division =>
					if(cnt = DIVIDER_DELAY) then
						cnt <= 0;
						state 	<= initialize_substractor;	
						accuracy <= float_div_out;
					else
						cnt <= cnt + 1;
					end if;
					
				when initialize_substractor =>
					cnt <= 0;
					float_substractor_in2 	<= accuracy;
					float_substractor_in1 	<= variable_value_int;
					state <= wait_substractor;
				
				when wait_substractor =>
					if(cnt = ADDER_DELAY) then
						cnt <= 0;
						state <= complete_operation;
					else
						cnt <= cnt + 1;
					end if;
					
				when complete_operation =>
					complete_op 	<= '1';
					calculator_result <= float_substractor_out;
					state <= reset_operation;
				
				when	reset_operation =>
					complete_op 	<= '0';
					state <= idle;
				
			end case;
		end if;
	end process;
end architecture;
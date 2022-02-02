library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	

entity calculator_rtl is
	port(
		ledg								: out std_logic_vector(7 downto 0):= (others => '0');
		clk								: in 	std_logic;
		reset								: in 	std_logic;
		start_op							: in 	std_logic;
		degree							: in 	integer;
		degree_min						: in 	integer;
		variable_value					: in	std_logic_vector(31 downto 0):= (others => '0');
		op_result						: out	std_logic_vector(31 downto 0):= (others => '0');
		error_value						: out std_logic_vector(31 downto 0):= (others => '0');
		complete_op_flag				: out	std_logic:= '0';
		float_in0        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in1        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in2        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in3        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in4        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in5        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in6        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in7        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in8        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in9        				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in10						: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in11       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in12       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in13       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in14       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in15       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in16       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in17       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in18       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in19       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in20       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in21       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in22       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in23       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in24       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in25       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in26       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in27       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in28       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in29       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in30       				: in 	std_logic_vector(31 downto 0):= (others => '0');
		float_in31       				: in 	std_logic_vector(31 downto 0):= (others => '0')
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
	
	component fp_pow
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
	
	component ip_core_operation_wait is
		port(
			clk					: in 	std_logic;
			ip_wait_reset		: in 	std_logic;
			ip_op_wait_ok		: out std_logic;
			ip_op_wait			: in	std_logic_vector(2 downto 0):= "000"
		);
	end component;

	-- single precision floating point numbers that using in calculations
	type float63 is array(0 to 62) of std_logic_vector(31 downto 0);
	signal fp_const: float63:= (
		"11000001111110000000000000000000",		-- -31
		"11000001111100000000000000000000",
		"11000001111010000000000000000000",
		"11000001111000000000000000000000",
		"11000001110110000000000000000000",
		"11000001110100000000000000000000",
		"11000001110010000000000000000000",
		"11000001110000000000000000000000",
		"11000001101110000000000000000000",
		"11000001101100000000000000000000",
		"11000001101010000000000000000000",
		"11000001101000000000000000000000",
		"11000001100110000000000000000000",
		"11000001100100000000000000000000",
		"11000001100010000000000000000000",
		"11000001100000000000000000000000",
		"11000001011100000000000000000000",
		"11000001011000000000000000000000",
		"11000001010100000000000000000000",
		"11000001010000000000000000000000",
		"11000001001100000000000000000000",
		"11000001001000000000000000000000",
		"11000001000100000000000000000000",
		"11000001000000000000000000000000",
		"11000000111000000000000000000000",
		"11000000110000000000000000000000",
		"11000000101000000000000000000000",
		"11000000100000000000000000000000",
		"11000000010000000000000000000000",
		"11000000000000000000000000000000",
		"10111111100000000000000000000000",
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
		"01000001111110000000000000000000"		-- +31
	);
	
	type float16 is array(15 downto 0) of std_logic_vector(31 downto 0);
	signal float_add_in1, float_add_in2, float_add_out: float16:= (others => "00000000000000000000000000000000");
	
	type float32 is array(32 downto 0) of std_logic_vector(31 downto 0);
	signal float_mult_in1, float_mult_in2, float_mult_out, float_in	: float32:= (others => "00000000000000000000000000000000");
	
	signal float_pow_in1				: std_logic_vector(31 downto 0):= (others => '0');
	signal float_pow_in2				: std_logic_vector(31 downto 0):= (others => '0');
	signal float_pow_out				: std_logic_vector(31 downto 0):= (others => '0');
	
	signal float_div_out				: std_logic_vector(31 downto 0):= (others => '0');
	signal float_div_in1				: std_logic_vector(31 downto 0):= (others => '0');
	signal float_div_in2				: std_logic_vector(31 downto 0):= (others => '0');
	
	signal float_substractor_in1	: std_logic_vector(31 downto 0):= (others => '0');
	signal float_substractor_in2	: std_logic_vector(31 downto 0):= (others => '0');
	signal float_substractor_out	: std_logic_vector(31 downto 0):= (others => '0');
	
	signal der_subs_result			: std_logic_vector(31 downto 0):= (others => '0');
	signal subs_result				: std_logic_vector(31 downto 0):= (others => '0');
	
	signal ip_wait_reset				: std_logic;
	signal ip_op_wait_ok				: std_logic;
	signal ip_op_wait					: std_logic_vector(2 downto 0):= "000";
	
	signal sel_derivative_substitute: std_logic;
	
	signal cnt							: integer range 0 to 10000000:= 0;
	
	signal variable_value_pos		: std_logic_vector(31 downto 0):= (others => '0');
	signal variable_value_int		: std_logic_vector(31 downto 0):= (others => '0');
	
	type machine is(
		initialize_deriv_subs_calculator,
		initialize_subs_calculator,
		idle, 
		initialize_derivative, 
		complete_derivative, 
		initialize_der_power,
		complete_der_power,
		initialize_power,
		complete_power,
		convert_sign,
		select_substitute,
		initialize_der_subs,
		initialize_subs,
		initialize_subs_add1,
		initialize_subs_add2,
		initialize_subs_add3,
		initialize_subs_add4,
		initialize_subs_add5,
		complete_der_subs,
		complete_subs,
		initialize_division,
		complete_division,
		initialize_substractor,
		complete_substractor,
		complete_op
	);
	signal state: machine:= initialize_deriv_subs_calculator;
	
	begin
	
	ip_core_wait_block: ip_core_operation_wait
	port map(
		clk				=> clk,
		ip_wait_reset	=> ip_wait_reset,
		ip_op_wait_ok	=> ip_op_wait_ok,
		ip_op_wait		=> ip_op_wait
	);		
	
	float_substractor_block: fp_substractor
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_substractor_in1,
		b      => float_substractor_in2,
		q      => float_substractor_out
	);
	
	float_div_block: fp_divider
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_div_in1,
		b      => float_div_in2,
		q      => float_div_out
	);
	
	float_pow_block: fp_pow
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_pow_in1,
		b      => float_pow_in2,
		q      => float_pow_out
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
	
	
	process(all)
	begin
		if(reset = '0') then
		ledg <= "00000000";
			float_pow_in1 				<= (others => '0');
			float_pow_in2 				<= (others => '0');
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
			float_add_in1(11)  		<= (others => '0');
			float_add_in1(12)  		<= (others => '0');
			float_add_in1(13)  		<= (others => '0');
			float_add_in1(14)  		<= (others => '0');
			float_add_in1(15)  		<= (others => '0');
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
			float_add_in2(11)  		<= (others => '0');
			float_add_in2(12)  		<= (others => '0');
			float_add_in2(13)  		<= (others => '0');
			float_add_in2(14)  		<= (others => '0');
			float_add_in2(15)  		<= (others => '0');
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
			float_div_in1				<= (others => '0');
			float_div_in2				<= (others => '0');
			cnt 							<= 0;
			complete_op_flag		 	<= '0';
			ip_wait_reset				<= '0';
			sel_derivative_substitute<= '0';
			ip_op_wait					<= "000";
			variable_value_pos		<= (others => '0');
			variable_value_int		<= (others => '0');
			op_result					<= (others => '0');
			der_subs_result			<= (others => '0');
			subs_result					<= (others => '0');
			state							<= initialize_deriv_subs_calculator;
		elsif(rising_edge(clk)) then
			
			case state is
				
				when initialize_deriv_subs_calculator =>
					sel_derivative_substitute 		<= '1';
					state 								<= idle;
					complete_op_flag 	<= '0';
					
				when initialize_subs_calculator =>
					sel_derivative_substitute 		<= '0';
					state 								<= idle;
					
				when idle => 
					if(start_op = '1') then
						variable_value_int			<= variable_value;
						ip_wait_reset					<= '0';
						ip_op_wait						<= "000";
						cnt								<= 0;
						ledg(0) <= '1';
						if(sel_derivative_substitute= '1') then
							state 						<= initialize_derivative;
						else
							state 						<= initialize_power;	
						end if;
					end if;
					
				when initialize_derivative=>
						ledg(1) <= '1';
					float_mult_in1(0) 	<= fp_const(31-degree_min);
					float_mult_in2(0) 	<= float_in0;
					float_mult_in1(1) 	<= fp_const((31-degree_min)+1);
					float_mult_in2(1) 	<= float_in1;
					float_mult_in1(2) 	<= fp_const((31-degree_min)+2);
					float_mult_in2(2) 	<= float_in2; 
					float_mult_in1(3) 	<= fp_const((31-degree_min)+3);
					float_mult_in2(3) 	<= float_in3;
					float_mult_in1(4) 	<= fp_const((31-degree_min)+4);
					float_mult_in2(4) 	<= float_in4;
					float_mult_in1(5) 	<= fp_const((31-degree_min)+5);
					float_mult_in2(5) 	<= float_in5;
					float_mult_in1(6) 	<= fp_const((31-degree_min)+6);
					float_mult_in2(6) 	<= float_in6;
					float_mult_in1(7) 	<= fp_const((31-degree_min)+7);
					float_mult_in2(7) 	<= float_in7;
					float_mult_in1(8) 	<= fp_const((31-degree_min)+8);
					float_mult_in2(8) 	<= float_in8;
					float_mult_in1(9) 	<= fp_const((31-degree_min)+9);
					float_mult_in2(9) 	<= float_in9;
					float_mult_in1(10) 	<= fp_const((31-degree_min)+10);
					float_mult_in2(10) 	<= float_in10;
					float_mult_in1(11) 	<= fp_const((31-degree_min)+11);
					float_mult_in2(11) 	<= float_in11;
					float_mult_in1(12) 	<= fp_const((31-degree_min)+12);
					float_mult_in2(12) 	<= float_in12;
					float_mult_in1(13) 	<= fp_const((31-degree_min)+13);
					float_mult_in2(13) 	<= float_in13;
					float_mult_in1(14) 	<= fp_const((31-degree_min)+14);
					float_mult_in2(14) 	<= float_in14;
					float_mult_in1(15) 	<= fp_const((31-degree_min)+15);
					float_mult_in2(15) 	<= float_in15;
					float_mult_in1(16) 	<= fp_const((31-degree_min)+16);
					float_mult_in2(16) 	<= float_in16;
					float_mult_in1(17) 	<= fp_const((31-degree_min)+17);
					float_mult_in2(17) 	<= float_in17;
					float_mult_in1(18) 	<= fp_const((31-degree_min)+18);
					float_mult_in2(18) 	<= float_in18;
					float_mult_in1(19) 	<= fp_const((31-degree_min)+19);
					float_mult_in2(19) 	<= float_in19;
					float_mult_in1(20) 	<= fp_const((31-degree_min)+20);
					float_mult_in2(20) 	<= float_in20;
					float_mult_in1(21) 	<= fp_const((31-degree_min)+21);
					float_mult_in2(21) 	<= float_in21;
					float_mult_in1(22) 	<= fp_const((31-degree_min)+22);
					float_mult_in2(22) 	<= float_in22;
					float_mult_in1(23) 	<= fp_const((31-degree_min)+23);
					float_mult_in2(23) 	<= float_in23;
					float_mult_in1(24) 	<= fp_const((31-degree_min)+24);
					float_mult_in2(24) 	<= float_in24;
					float_mult_in1(25) 	<= fp_const((31-degree_min)+25);
					float_mult_in2(25) 	<= float_in25;
					float_mult_in1(26) 	<= fp_const((31-degree_min)+26);
					float_mult_in2(26) 	<= float_in26;
					float_mult_in1(27) 	<= fp_const((31-degree_min)+27);
					float_mult_in2(27) 	<= float_in27;
					float_mult_in1(28) 	<= fp_const((31-degree_min)+28);
					float_mult_in2(28) 	<= float_in28;
					float_mult_in1(29) 	<= fp_const((31-degree_min)+29);
					float_mult_in2(29) 	<= float_in29;
					float_mult_in1(30) 	<= fp_const((31-degree_min)+30);
					float_mult_in2(30) 	<= float_in30;
					float_mult_in1(31) 	<= fp_const((31-degree_min)+31);
					float_mult_in2(31) 	<= float_in31;
					
					ip_op_wait				<= "010";										-- çarpma bekleme kodu
					ip_wait_reset			<= '1';
					if(ip_op_wait_ok= '1') then
						ip_op_wait			<= "000";
						ip_wait_reset		<= '0';
						state 				<= complete_derivative;
					end if;
					
				when complete_derivative=>
						ledg(2) <= '1';
					if(cnt = 32) then
						cnt 	<= 0;
						state <= initialize_der_power;
						variable_value_pos <= '0' & variable_value_int(30 downto 0); -- convert all variable values to positive
					else
						cnt 	<= cnt + 1;
						float_mult_in2(cnt) <= float_mult_out(cnt);					-- türevli yerine koyma state i için hazırlık
					end if;
					
				when initialize_der_power=> -- türevlide -31.derece için kontrol koy!!!!!
						ledg(3) <= '1';
					if(cnt < (degree_min + 1)) then
						float_pow_in1 	<= variable_value_pos;
						float_pow_in2 	<= '0' & fp_const((31-degree_min-1)+cnt)(30 downto 0);	-- convert all negative constants to positive
					elsif(cnt = (degree_min + 1)) then
						-- x^0 işlemini core yapamıyor!
					elsif(cnt < degree) then
						float_pow_in1 	<= variable_value_pos;
						float_pow_in2 	<= fp_const((31-degree_min-1)+cnt);
					end if;	
					
					ip_op_wait		<= "011";													-- power bekleme kodu
					ip_wait_reset	<= '1';
					if(ip_op_wait_ok= '1') then
						ip_op_wait		<= "000";
						ip_wait_reset	<= '0';
						state 			<= complete_der_power;
					end if;
					
					
				when complete_der_power =>
						ledg(4) <= '1';
					if(cnt < (degree_min + 1)) then											-- eksi dereceleri terimleri '1' ile bölme
						float_div_in1 <= fp_const(32);										-- float '1'
						float_div_in2 <= float_pow_out;										-- artı dereceli power sonucu
						ip_op_wait		<= "100";												-- bölme bekleme kodu
						ip_wait_reset	<= '1';
						if(ip_op_wait_ok= '1') then
							ip_op_wait		<= "000";
							ip_wait_reset	<= '0';
							state 			<= convert_sign;
							float_mult_in1(cnt) <= float_div_out;
						end if;
					elsif(cnt = (degree_min + 1)) then										-- (x^0) = '1' olduğundan ve IP bu işlemi yapamadığından sonuca elle '1' verildi
						float_mult_in1(cnt) 	<= fp_const(32);								-- float '1'
						state 					<= convert_sign;
					elsif(cnt < degree) then
						float_mult_in1(cnt) 	<= float_pow_out; 							-- yerine koyma stateleri için hazırlık
						state 					<= convert_sign;
					end if;
					
					
				when initialize_power=>
						ledg(5) <= '1';
					if(cnt < degree_min) then
						float_pow_in1 	<= variable_value_pos;
						float_pow_in2 	<= '0' & fp_const((31-degree_min)+cnt)(30 downto 0);	-- convert all negative constants to positive
					elsif(cnt = degree_min) then
						-- x^0 işlemini core yapamıyor!
					elsif(cnt < degree) then
						float_pow_in1 	<= variable_value_pos;
						float_pow_in2 	<= fp_const((31-degree_min)+cnt);
					end if;	
					
					ip_op_wait		<= "011";													-- power bekleme kodu
					ip_wait_reset	<= '1';
					if(ip_op_wait_ok= '1') then
						ip_op_wait		<= "000";
						ip_wait_reset	<= '0';
						state 			<= complete_power;
					end if;		
					
					
				when complete_power =>
						ledg(6) <= '1';
					if(cnt < degree_min) then													-- eksi dereceleri terimleri '1' ile bölme
						float_div_in1 <= fp_const(32);										-- float '1'
						float_div_in2 <= float_pow_out;										-- artı dereceli power sonucu
						ip_op_wait		<= "100";												-- bölme bekleme kodu
						ip_wait_reset	<= '1';
						if(ip_op_wait_ok= '1') then
							ip_op_wait		<= "000";
							ip_wait_reset	<= '0';
							state 			<= convert_sign;
							float_mult_in1(cnt) <= float_div_out;
						end if;
					elsif(cnt = degree_min) then												-- (x^0) = '1' olduğundan ve IP bu işlemi yapamadığından sonuca elle '1' verildi
						float_mult_in1(cnt) 	<= fp_const(32);								-- float '1'
						state 					<= convert_sign;
					elsif(cnt < degree) then
						float_mult_in1(cnt) 	<= float_pow_out; 							-- yerine koyma stateleri için hazırlık
						state 					<= convert_sign;
					end if;
					
					
				when convert_sign =>
						ledg(7) <= '1';
					cnt 					<= cnt + 1;
					if(sel_derivative_substitute= '1') then
						state 				<= initialize_der_power;
						if(variable_value_int(31) = '1') then
							if((degree_min + cnt + 1) rem 2 /= 0) then
								float_mult_in1(cnt)(31) <= '1';
							end if;
						end if;
						if(cnt = (degree - 1)) then
							state 				<= select_substitute;
							cnt 					<= 0;
						end if;
					else
						state 				<= initialize_power;
						if(variable_value_int(31) = '1') then
							if((degree_min + cnt) rem 2 /= 0) then
								float_mult_in1(cnt)(31) <= '1';
							end if;
						end if;
						if(cnt = (degree - 1)) then
							state 				<= select_substitute;
							cnt 					<= 0;
						end if;
					end if;
					
					
				when select_substitute =>
					if(sel_derivative_substitute= '1') then
						state <= initialize_der_subs;
					else
						state <= initialize_subs;
					end if;
					
					
				when initialize_der_subs =>												-- (değişken^derece) x (türev alındıktan sonraki katsayı)
--					float_mult_in1(cnt) <= 					 								-- (değişken^derece) power kısmında atandı
--					float_mult_in2(cnt) <= 													-- (türev alındıktan sonraki katsayı) derivative kısmında atandı
					ip_op_wait				<= "010";	
					ip_wait_reset			<= '1';
					if(ip_op_wait_ok= '1') then
						ip_op_wait			<= "000";
						ip_wait_reset		<= '0';	
						state 				<= initialize_subs_add1;
					end if;
					
					
				when initialize_subs =>											-- (değişken^derece) x (katsayı)
--					float_mult_in1(cnt)	<= 												-- (değişken^derece) power kısmında atandı
					float_mult_in2(0) 	<= float_in0;									-- (katsayı) ataması
					float_mult_in2(1) 	<= float_in1;
					float_mult_in2(2) 	<= float_in2;
					float_mult_in2(3) 	<= float_in3;
					float_mult_in2(4) 	<= float_in4;
					float_mult_in2(5) 	<= float_in5;
					float_mult_in2(6) 	<= float_in6;
					float_mult_in2(7) 	<= float_in7;
					float_mult_in2(8) 	<= float_in8;
					float_mult_in2(9) 	<= float_in9;
					float_mult_in2(10) 	<= float_in10;
					float_mult_in2(11) 	<= float_in11;
					float_mult_in2(12) 	<= float_in12;
					float_mult_in2(13) 	<= float_in13;
					float_mult_in2(14) 	<= float_in14;
					float_mult_in2(15) 	<= float_in15;
					float_mult_in2(16) 	<= float_in16;
					float_mult_in2(17) 	<= float_in17;
					float_mult_in2(18) 	<= float_in18;
					float_mult_in2(19) 	<= float_in19;
					float_mult_in2(20) 	<= float_in20;
					float_mult_in2(21) 	<= float_in21;
					float_mult_in2(22) 	<= float_in22;
					float_mult_in2(23) 	<= float_in23;
					float_mult_in2(24) 	<= float_in24;
					float_mult_in2(25) 	<= float_in25;
					float_mult_in2(26) 	<= float_in26;
					float_mult_in2(27) 	<= float_in27;
					float_mult_in2(28) 	<= float_in28;
					float_mult_in2(29) 	<= float_in29;
					float_mult_in2(30) 	<= float_in30;
					float_mult_in2(31) 	<= float_in31;
					ip_op_wait				<= "010";											-- çarpma bekleme kodu
					ip_wait_reset			<= '1';
					if(ip_op_wait_ok= '1') then
						ip_op_wait			<= "000";
						ip_wait_reset		<= '0';
						state 				<= initialize_subs_add1;
					end if;
					
					
				when initialize_subs_add1 =>
					float_add_in1(0)	<= float_mult_out(0);
					float_add_in2(0)	<= float_mult_out(1);
					float_add_in1(1)	<= float_mult_out(2);
					float_add_in2(1)	<= float_mult_out(3);
					float_add_in1(2)	<= float_mult_out(4);
					float_add_in2(2)	<= float_mult_out(5);
					float_add_in1(3)	<= float_mult_out(6);
					float_add_in2(3)	<= float_mult_out(7);
					float_add_in1(4)	<= float_mult_out(8);
					float_add_in2(4)	<= float_mult_out(9);
					float_add_in1(5)	<= float_mult_out(10);
					float_add_in2(5)	<= float_mult_out(11);
					float_add_in1(6)	<= float_mult_out(12);
					float_add_in2(6)	<= float_mult_out(13);
					float_add_in1(7)	<= float_mult_out(14);
					float_add_in2(7)	<= float_mult_out(15);
					float_add_in1(8)	<= float_mult_out(16);
					float_add_in2(8)	<= float_mult_out(17);
					float_add_in1(9)	<= float_mult_out(18);
					float_add_in2(9)	<= float_mult_out(19);
					float_add_in1(10)	<= float_mult_out(20);
					float_add_in2(10)	<= float_mult_out(21);
					float_add_in1(11)	<= float_mult_out(22);
					float_add_in2(11)	<= float_mult_out(23);
					float_add_in1(12)	<= float_mult_out(24);
					float_add_in2(12)	<= float_mult_out(25);
					float_add_in1(13)	<= float_mult_out(26);
					float_add_in2(13)	<= float_mult_out(27);
					float_add_in1(14)	<= float_mult_out(28);
					float_add_in2(14)	<= float_mult_out(29);
					float_add_in1(15)	<= float_mult_out(30);
					float_add_in2(15)	<= float_mult_out(31);
					ip_op_wait			<= "001";												-- toplama bekleme kodu
					ip_wait_reset		<= '1';
					if(ip_op_wait_ok= '1') then
						state 			<= initialize_subs_add2;
						ip_op_wait		<= "000";
						ip_wait_reset	<= '0';
					end if;
					
					
				when initialize_subs_add2 =>
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
					ip_op_wait			<= "001";
					ip_wait_reset		<= '1';
					if(ip_op_wait_ok= '1') then
						state 			<= initialize_subs_add3;
						ip_op_wait		<= "000";
						ip_wait_reset	<= '0';
					end if;
					
					
				when initialize_subs_add3 =>
					float_add_in1(0)	<= float_add_out(0);
					float_add_in2(0)	<= float_add_out(1);
					float_add_in1(1)	<= float_add_out(2);
					float_add_in2(1)	<= float_add_out(3);
					float_add_in1(2)	<= float_add_out(4);
					float_add_in2(2)	<= float_add_out(5);
					float_add_in1(3)	<= float_add_out(6);
					float_add_in2(3)	<= float_add_out(7);
					ip_op_wait			<= "001";
					ip_wait_reset		<= '1';
					if(ip_op_wait_ok= '1') then
						state 			<= initialize_subs_add4;
						ip_op_wait		<= "000";
						ip_wait_reset	<= '0';
					end if;
					
					
				when initialize_subs_add4 =>
					float_add_in1(0)	<= float_add_out(0);
					float_add_in2(0)	<= float_add_out(1);
					float_add_in1(1)	<= float_add_out(2);
					float_add_in2(1)	<= float_add_out(3);
					ip_op_wait			<= "001";
					ip_wait_reset		<= '1';
					if(ip_op_wait_ok= '1') then
						state 			<= initialize_subs_add5;
						ip_op_wait		<= "000";
						ip_wait_reset	<= '0';
					end if;
					
					
				when initialize_subs_add5 =>
					float_add_in1(0)	<= float_add_out(0);
					float_add_in2(0)	<= float_add_out(1);	
					ip_op_wait			<= "001";
					ip_wait_reset		<= '1';
					if(ip_op_wait_ok= '1') then
						if(sel_derivative_substitute= '1') then
							state 		<= complete_der_subs;
						else
							state 		<= complete_subs;
						end if;	
						ip_op_wait		<= "000";
						ip_wait_reset	<= '0';
					end if;
					
					
				when complete_der_subs =>	
					der_subs_result 		<= float_add_out(0);
					state						<= initialize_subs_calculator;						-- türevsiz operasyon için başa geri dön
					
					
				when complete_subs =>
					subs_result 			<= float_add_out(0);
					state 					<= initialize_division;
					
					
				when initialize_division =>
					float_div_in1 			<= subs_result;
					float_div_in2 			<= der_subs_result;
					ip_op_wait				<= "100";
					ip_wait_reset			<= '1';
					if(ip_op_wait_ok= '1') then
						state 				<= complete_division;
						ip_op_wait			<= "000";
						ip_wait_reset		<= '0';
					end if;
					
					
				when complete_division =>
					state 				<= initialize_substractor;	
					error_value 		<= float_div_out;
					
				when initialize_substractor =>
					float_substractor_in2 	<= float_div_out;
					float_substractor_in1 	<= variable_value_int;
					ip_op_wait					<= "001";
					ip_wait_reset				<= '1';
					if(ip_op_wait_ok= '1') then
						state 			<= complete_substractor;
						ip_op_wait		<= "000";
						ip_wait_reset	<= '0';
					end if;
					
				when complete_substractor =>
					variable_value_int	<= float_substractor_out;
					state 					<= complete_op;
					
				when complete_op =>
					complete_op_flag 	<= '1';
					op_result 			<= float_substractor_out;
					state <= initialize_deriv_subs_calculator;
					
			end case;
		end if;
	end process;
end architecture;
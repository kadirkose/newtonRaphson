library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	
use ieee.std_logic_unsigned.all;	

entity newton_raphson is
	generic(	
		DATA_WIDTH 				: in 	natural := 32;												 	-- RAM dimensions
		ADDR_WIDTH 				: in 	natural := 128;								
		CLK_FREQ      			: in 	integer := 125e6;   											-- set system clock frequency in Hz
		BAUD_RATE     			: in 	integer := 115200;   										-- baud rate value
		PARITY_BIT    			: in 	string  := "none"; 											-- legal values: "none", "even", "odd", "mark", "space"
		USE_DEBOUNCER 			: in 	boolean := false   											-- enable/disable debouncer		
	);
	port(
		clk						: in 		std_logic;
		reset						: in 		std_logic;
		UART_TXD   				: out 	std_logic;
		UART_RXD   				: in  	std_logic;
		leds						: out 	std_logic_vector(9 downto 0):= (others => '0');	-- these connected to terasIC DE10-Lite LED pins
		ledg						: out 	std_logic_vector(7 downto 0):= (others => '0')
	);
end newton_raphson;

architecture logic of newton_raphson is
	
	component calculator_rtl
		port(
			ledg								: out std_logic_vector(7 downto 0):= (others => '0');
			clk								: in 	std_logic;
			reset								: in 	std_logic;
			start_op							: in 	std_logic;
			degree							: in 	integer;
			degree_min						: in 	integer;
			variable_value					: in	std_logic_vector(31 downto 0):= (others => '0');
			calculator_result						: out	std_logic_vector(31 downto 0):= (others => '0');
			complete_op						: out	std_logic:= '0';
			accuracy							: out std_logic_vector(31 downto 0):= (others => '0');
			coefficient0        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient1        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient2        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient3        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient4        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient5        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient6        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient7        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient8        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient9        				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient10						: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient11       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient12       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient13       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient14       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient15       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient16       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient17       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient18       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient19       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient20       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient21       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient22       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient23       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient24       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient25       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient26       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient27       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient28       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient29       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient30       				: in 	std_logic_vector(31 downto 0):= (others => '0');
			coefficient31       				: in 	std_logic_vector(31 downto 0):= (others => '0')
		);
	end component;
	
	component uart
		generic(
			CLK_FREQ      				: in 	integer := 125e6;   									-- system clock frequency in Hz
			BAUD_RATE     				: in 	integer := 115200; 									-- baud rate value
			PARITY_BIT    				: in 	string  := "none"; 									-- type of parity: "none", "even", "odd", "mark", "space"
			USE_DEBOUNCER 				: in 	boolean := FALSE   									-- enable/disable debouncer
		);
		port(
			-- CLOCK AND RESET
			CLK         				: in  std_logic; 												-- system clock
			RST         				: in  std_logic; 												-- high active synchronous reset
			-- UART INTERFACE
			UART_TXD    				: out std_logic; 												-- serial transmit data
			UART_RXD    				: in  std_logic; 												-- serial receive data
			-- USER DATA INPUT INTERFACE
			DIN         				: in  std_logic_vector(7 downto 0); 					-- input data to be transmitted over UART
			DIN_VLD     				: in  std_logic; 												-- when DIN_VLD = 1, input data (DIN) are valid
			DIN_RDY     				: out std_logic; 												-- when DIN_RDY = 1, transmitter is ready and valid input data will be accepted for transmiting
			-- USER DATA OUTPUT INTERFACE
			DOUT        				: out std_logic_vector(7 downto 0); 					-- output data received via UART
			DOUT_VLD    				: out std_logic; 												-- when v = 1, output data (DOUT) are valid (is assert only for one clock cycle)
			FRAME_ERROR 				: out std_logic;  											-- when FRAME_ERROR = 1, stop bit was invalid (is assert only for one clock cycle)
			PARITY_ERROR 				: out std_logic  												-- when PARITY_ERROR = 1, parity bit was invalid (is assert only for one clock cycl
		);
	end component;
	
	component fp_comparator
		port (
			a 						: in std_logic_vector(31 downto 0);  -- float32_m23
			b 						: in std_logic_vector(31 downto 0);  -- float32_m23
			q 						: out std_logic_vector(0 downto 0);  -- ufix1
			clk 					: in std_logic;
			areset 				: in std_logic
		);
	end component;

	signal cnt									: integer range 0 to 100:= 0;
	signal count								: integer:= 0;
	signal cycle_count						: std_logic_vector(31 downto 0):= (others => '0');
	signal total_cycle_count				: std_logic_vector(31 downto 0):= (others => '0');

	
	signal u_data_in, u_data_out			: std_logic_vector(7 downto 0);					-- internal UART signals 
	signal u_valid_out, u_valid_in		: std_logic:='0';
	signal u_data_in_ready 					: std_logic:='1';
	signal u_data_in_ready_prev			: std_logic:='1';
	
	signal variable_value					: std_logic_vector(31 downto 0):= (others => '0');

	signal degree_min, degree_max, degree	: integer:= 0;
	
	signal start_opr							: std_logic:= '0';
	signal complete_op		: std_logic:= '0';
	signal calculator_result				: std_logic_vector(31 downto 0);
	
	type float32 is array(31 downto 0) of std_logic_vector(31 downto 0);
	signal coefficient		: float32:= (others => "00000000000000000000000000000000");
	
	signal float_comp_in1			: std_logic_vector(31 downto 0):= (others => '0');
	signal accuracy					: std_logic_vector(31 downto 0):= (others => '0');
	signal comparator_result		: std_logic_vector(0 downto 0) := (others => '0');
	signal iteration_count			: std_logic_vector(31 downto 0):= (others => '0');
	signal error_const_value		: std_logic_vector(31 downto 0):= (others => '0');
	signal float_comp_in2			: std_logic_vector(31 downto 0):= (others => '0');
	signal interation_limit			: std_logic_vector(31 downto 0):= (others => '0');
	
	type machine is(
		get_min_degree, 
		get_max_degree,
		degree_range_control,
		get_var_val, 
		get_error_val,
		get_iteration_val,
		get_coefficients, 
		initialize_calculator,
		complete_calculator, 
		wait_compare,
		complete_compare,
		send_result,
		power_off,
		reset_all_variable,
		idle
	);
	signal state: machine:= get_min_degree;																-- state machine instruction
	
	begin
	
	calculator_block: calculator_rtl
	port map(
		ledg => ledg,
		clk								=> clk,
		reset								=> reset,
		start_op							=> start_opr,
		degree							=> degree,
		degree_min						=> degree_min,
		variable_value					=> variable_value,
		calculator_result						=> calculator_result,
		accuracy						=> accuracy,
		complete_op							=> complete_op,
		coefficient0        				=> coefficient(0),  
		coefficient1        				=> coefficient(1),    
		coefficient2        				=> coefficient(2),    
		coefficient3        				=> coefficient(3),    
		coefficient4        				=> coefficient(4),    
		coefficient5        				=> coefficient(5),     
		coefficient6        				=> coefficient(6),    
		coefficient7        				=> coefficient(7),    
		coefficient8        				=> coefficient(8),    
		coefficient9        				=> coefficient(9),    
		coefficient10						=> coefficient(10),	
		coefficient11       				=> coefficient(11),   
		coefficient12       				=> coefficient(12),   
		coefficient13       				=> coefficient(13),   
		coefficient14       				=> coefficient(14),   
		coefficient15       				=> coefficient(15),   
		coefficient16       				=> coefficient(16),   
		coefficient17       				=> coefficient(17),   
		coefficient18       				=> coefficient(18),   
		coefficient19       				=> coefficient(19),   
		coefficient20       				=> coefficient(20),   
		coefficient21       				=> coefficient(21),   
		coefficient22       				=> coefficient(22),   
		coefficient23       				=> coefficient(23),   
		coefficient24       				=> coefficient(24),   
		coefficient25       				=> coefficient(25),   
		coefficient26       				=> coefficient(26),   
		coefficient27       				=> coefficient(27),   
		coefficient28       				=> coefficient(28),   
		coefficient29       				=> coefficient(29),   
		coefficient30       				=> coefficient(30),   
		coefficient31       				=> coefficient(31)
	);
	
	uart_block: uart
   generic map(
       CLK_FREQ      => CLK_FREQ,
       BAUD_RATE     => BAUD_RATE,
       PARITY_BIT    => PARITY_BIT,
       USE_DEBOUNCER => USE_DEBOUNCER
   )
   port map(
       CLK         	=> clk,
       RST         	=> not reset,																	-- UART module reset is reverse
       -- UART INTERFACE
       UART_TXD    	=> UART_TXD,
       UART_RXD    	=> UART_RXD,
       -- USER DATA OUTPUT INTERFACE
       DOUT        	=> u_data_out,
       DOUT_VLD    	=> u_valid_out,
       FRAME_ERROR 	=> open,
		 PARITY_ERROR	=> open,
       -- USER DATA INPUT INTERFACE
       DIN         	=> u_data_in,
       DIN_VLD     	=> u_valid_in,
       DIN_RDY     	=> u_data_in_ready
   );
	
	float_comparator_block: fp_comparator
	port map(
		clk    => clk,
		areset => not reset,
		a      => float_comp_in1,
		b      => float_comp_in2,
		q      => comparator_result
	);
	
	process(clk, reset)
	begin
		if(reset = '0') then
			u_valid_in 					<= '0';
			u_data_in 					<= "01010010";														-- ASCII 'R'
			cnt 							<= 0;
			count							<= 0;
			cycle_count					<= (others => '0');
			total_cycle_count			<= (others => '0');
			state 						<= idle;
			degree_min					<= 0;	
			degree_max					<= 0;	
			degree						<= 0;	
			start_opr					<= '0';			
			leds 							<= "0000000000";
			variable_value		  		<= (others => '0');
			coefficient(0)  				<= (others => '0');
			coefficient(1)  				<= (others => '0');
			coefficient(2)  				<= (others => '0');
			coefficient(3)  				<= (others => '0');
			coefficient(4)  				<= (others => '0');
			coefficient(5)  				<= (others => '0');
			coefficient(6) 				<= (others => '0');
			coefficient(7)  				<= (others => '0');
			coefficient(8)  				<= (others => '0');
			coefficient(9)  				<= (others => '0');
			coefficient(10)  				<= (others => '0');
			coefficient(11)				<= (others => '0');
			coefficient(12)  				<= (others => '0');
			coefficient(13)  				<= (others => '0');
			coefficient(14)  				<= (others => '0');
			coefficient(15)  				<= (others => '0');
			coefficient(16)  				<= (others => '0');
			coefficient(17)  				<= (others => '0');
			coefficient(18) 				<= (others => '0');
			coefficient(19)  				<= (others => '0');
			coefficient(20)  				<= (others => '0');
			coefficient(21)  				<= (others => '0');
			coefficient(22)  				<= (others => '0');
			coefficient(23)  				<= (others => '0');
			coefficient(24)  				<= (others => '0');
			coefficient(25)  				<= (others => '0');
			coefficient(26)  				<= (others => '0');
			coefficient(27)  				<= (others => '0');
			coefficient(28)  				<= (others => '0');
			coefficient(29)  				<= (others => '0');
			coefficient(30)  				<= (others => '0');
			coefficient(31)  				<= (others => '0');
			iteration_count			<= (others => '0');
			error_const_value			<= (others => '0');
			interation_limit			<= (others => '0');
			float_comp_in1				<= (others => '0');
		elsif(rising_edge(clk)) then
			u_data_in_ready_prev <= u_data_in_ready;
			case state is
			
				when idle =>
					u_valid_in 					<= '0';
					u_data_in 					<= "01010010";														-- ASCII 'R'
					cnt 							<= 0;
					count							<= 0;
					cycle_count					<= (others => '0');
					total_cycle_count			<= (others => '0');
					state 						<= idle;
					degree_min					<= 0;	
					degree_max					<= 0;	
					degree						<= 0;	
					start_opr					<= '0';			
					variable_value		  		<= (others => '0');
					coefficient(0)  				<= (others => '0');
					coefficient(1)  				<= (others => '0');
					coefficient(2)  				<= (others => '0');
					coefficient(3)  				<= (others => '0');
					coefficient(4)  				<= (others => '0');
					coefficient(5)  				<= (others => '0');
					coefficient(6) 				<= (others => '0');
					coefficient(7)  				<= (others => '0');
					coefficient(8)  				<= (others => '0');
					coefficient(9)  				<= (others => '0');
					coefficient(10)  				<= (others => '0');
					coefficient(11)				<= (others => '0');
					coefficient(12)  				<= (others => '0');
					coefficient(13)  				<= (others => '0');
					coefficient(14)  				<= (others => '0');
					coefficient(15)  				<= (others => '0');
					coefficient(16)  				<= (others => '0');
					coefficient(17)  				<= (others => '0');
					coefficient(18) 				<= (others => '0');
					coefficient(19)  				<= (others => '0');
					coefficient(20)  				<= (others => '0');
					coefficient(21)  				<= (others => '0');
					coefficient(22)  				<= (others => '0');
					coefficient(23)  				<= (others => '0');
					coefficient(24)  				<= (others => '0');
					coefficient(25)  				<= (others => '0');
					coefficient(26)  				<= (others => '0');
					coefficient(27)  				<= (others => '0');
					coefficient(28)  				<= (others => '0');
					coefficient(29)  				<= (others => '0');
					coefficient(30)  				<= (others => '0');
					coefficient(31)  				<= (others => '0');
					iteration_count			<= (others => '0');
					error_const_value			<= (others => '0');
					interation_limit			<= (others => '0');
					float_comp_in1				<= (others => '0');
					start_opr	<= '0';
					if(u_valid_out = '1') then																-- if data came from UART
						state 	<= get_min_degree;
					end if;
			
				when get_min_degree =>
					total_cycle_count <= total_cycle_count + 1;
					degree_min 	<= to_integer(unsigned(u_data_out));
					if(to_integer(unsigned(u_data_out)) > 31) then
						state 	<= idle;
					else
						state 	<= get_max_degree;
					end if;
					
				when get_max_degree =>
					total_cycle_count <= total_cycle_count + 1;
					if(u_valid_out = '1') then																-- if data came from UART
						degree_max 	<= to_integer(unsigned(u_data_out));
						if(to_integer(unsigned(u_data_out)) > 31) then
							state 	<= idle;
						else
							state 	<= degree_range_control;
						end if;
					end if;	
					
				when degree_range_control =>
					total_cycle_count <= total_cycle_count + 1;
					if(degree_min + degree_max > 31) then												-- degree must be in range [-31,31] with maximum 32 coefficients
						state 	<= idle;
					else
						state 	<= get_var_val;
						degree 	<= degree_max + degree_min + 1;
					end if;
					
					
				when get_var_val =>
					total_cycle_count <= total_cycle_count + 1;
					if(u_valid_out = '1') then																-- if data came from UART	
						cnt 		<= (cnt + 1);
						if(cnt = 3) then
							cnt 			<= 0;
							state 		<= get_error_val;
							variable_value(31 downto 24) <= u_data_out;
						elsif(cnt = 2) then
							variable_value(23 downto 16) <= u_data_out;
						elsif(cnt = 1) then
							variable_value(15 downto 8) <= u_data_out;
						else
							variable_value(7 downto 0) <= u_data_out;
						end if;
					end if;
					
				when get_error_val =>
					total_cycle_count <= total_cycle_count + 1;
					if(u_valid_out = '1') then																-- if data came from UART	
						cnt 		<= (cnt + 1);
						if(cnt = 3) then
							cnt 			<= 0;
							state 		<= get_iteration_val;
							error_const_value(31 downto 24) <= u_data_out;
						elsif(cnt = 2) then
							error_const_value(23 downto 16) <= u_data_out;
						elsif(cnt = 1) then
							error_const_value(15 downto 8) <= u_data_out;
						else
							error_const_value(7 downto 0) <= u_data_out;
						end if;
					end if;
					
				when get_iteration_val =>
					total_cycle_count <= total_cycle_count + 1;
					if(u_valid_out = '1') then																-- if data came from UART	
						cnt 		<= (cnt + 1);
						if(cnt = 3) then
							cnt 			<= 0;
							state 		<= get_coefficients;
							interation_limit(31 downto 24) <= u_data_out;
						elsif(cnt = 2) then
							interation_limit(23 downto 16) <= u_data_out;
						elsif(cnt = 1) then
							interation_limit(15 downto 8) <= u_data_out;
						else
							interation_limit(7 downto 0) <= u_data_out;
						end if;
					end if;
					
				when get_coefficients =>
					total_cycle_count <= total_cycle_count + 1;
					if(cnt = 4) then
						count 		<= (count + 1);
						cnt 			<= 0;
						if(count = degree - 1) then														-- end of given degree
							state 	<= initialize_calculator;
							count 	<= 0;
						end if;
					end if;
					
					if(u_valid_out = '1') then																-- if data came from UART	
						cnt 			<= (cnt + 1);
						if(cnt = 3)  then
							coefficient(count)(31 downto 24) <= u_data_out;
						elsif(cnt = 2) then
							coefficient(count)(23 downto 16) <= u_data_out;
						elsif(cnt = 1) then
							coefficient(count)(15 downto 8) <= u_data_out;
						else
							coefficient(count)(7 downto 0) <= u_data_out;
						end if;
					end if;
					
				when initialize_calculator =>
					iteration_count <= iteration_count + 1;
					cycle_count <= cycle_count + 1;
					total_cycle_count <= total_cycle_count + 1;
					start_opr 	<= '1';
					state 		<= complete_calculator;
					
				when complete_calculator =>
					total_cycle_count <= total_cycle_count + 1;
					cycle_count <= cycle_count + 1;
					start_opr <= '0';
					if(complete_op = '1') then
						cnt <= 0;
						float_comp_in1(30 downto 0) <= accuracy(30 downto 0);
						float_comp_in2 <= error_const_value;
						state <= wait_compare;
					end if;
	
				when wait_compare =>
					total_cycle_count <= total_cycle_count + 1;
					cycle_count <= cycle_count + 1;
					if(cnt = 2) then
						cnt <= 0;
						state <= complete_compare;
					else
						cnt <= cnt + 1;
					end if;
					
				when complete_compare =>
					cycle_count <= cycle_count + 1;
					total_cycle_count <= total_cycle_count + 1;
					leds <= accuracy(30 downto 21);
					if(iteration_count < (interation_limit + 1)) then 
						if(comparator_result = "0" ) then 
							state <= initialize_calculator; 
							variable_value <= calculator_result; 
						else
							state <= send_result; 
						end if; 
					else
						state <= send_result; 
					end if; 
					
				when send_result =>
					total_cycle_count <= total_cycle_count + 1;
					u_valid_in 	<= '0';
					if(u_data_in_ready = '0' and u_data_in_ready_prev = '1') then
						cnt <= (cnt + 1);
					end if;
		
					if(cnt < 4) then
						u_valid_in 	<= '1';
						u_data_in 	<= calculator_result((31 - (3-cnt)*8) downto (24 - (3-cnt)*8));
					elsif(cnt < 8) then
						u_valid_in 	<= '1';
						u_data_in 	<= cycle_count((31 - (7-cnt)*8) downto (24 - (7-cnt)*8));
					elsif(cnt < 12) then
						u_valid_in 	<= '1';
						u_data_in 	<= iteration_count((31 - (11-cnt)*8) downto (24 - (11-cnt)*8));
					elsif(cnt < 16) then
						u_valid_in 	<= '1';
						u_data_in 	<= total_cycle_count((31 - (15-cnt)*8) downto (24 - (15-cnt)*8));
					else
						cnt 			<= 0;
						start_opr 	<= '0';
						state			<= power_off;
					end if;
					
				when power_off =>
					state <= reset_all_variable;
					
				when reset_all_variable =>
					state <= idle;
					u_valid_in 					<= '0';
					u_data_in 					<= "01010010";														-- ASCII 'R'
					cnt 							<= 0;
					count							<= 0;
					cycle_count					<= (others => '0');
					total_cycle_count			<= (others => '0');
					degree_min					<= 0;	
					degree_max					<= 0;	
					degree						<= 0;	
					start_opr					<= '0';			
					variable_value		  		<= (others => '0');
					coefficient(0)  			<= (others => '0');
					coefficient(1)  			<= (others => '0');
					coefficient(2)  			<= (others => '0');
					coefficient(3)  			<= (others => '0');
					coefficient(4)  			<= (others => '0');
					coefficient(5)  			<= (others => '0');
					coefficient(6) 			<= (others => '0');
					coefficient(7)  			<= (others => '0');
					coefficient(8)  			<= (others => '0');
					coefficient(9)  			<= (others => '0');
					coefficient(10)  			<= (others => '0');
					coefficient(11)			<= (others => '0');
					coefficient(12)  			<= (others => '0');
					coefficient(13)  			<= (others => '0');
					coefficient(14)  			<= (others => '0');
					coefficient(15)  			<= (others => '0');
					coefficient(16)  			<= (others => '0');
					coefficient(17)  			<= (others => '0');
					coefficient(18) 			<= (others => '0');
					coefficient(19)  			<= (others => '0');
					coefficient(20)  			<= (others => '0');
					coefficient(21)  			<= (others => '0');
					coefficient(22)  			<= (others => '0');
					coefficient(23)  			<= (others => '0');
					coefficient(24)  			<= (others => '0');
					coefficient(25)  			<= (others => '0');
					coefficient(26)  			<= (others => '0');
					coefficient(27)  			<= (others => '0');
					coefficient(28)  			<= (others => '0');
					coefficient(29)  			<= (others => '0');
					coefficient(30)  			<= (others => '0');
					coefficient(31)  			<= (others => '0');
					iteration_count			<= (others => '0');
					error_const_value			<= (others => '0');	
			
				when others =>
					state <= idle;
					
			end case;	
		end if;
	end process;
end logic;	
library ieee;
use ieee.std_logic_1164.all;

entity ip_core_operation_wait is
	port(
		clk					: in 	std_logic;
		ip_wait_reset		: in 	std_logic;
		ip_op_wait_ok		: out std_logic;
		ip_op_wait			: in	std_logic_vector(2 downto 0):= "000"
	);
end ip_core_operation_wait;

architecture logic of ip_core_operation_wait is

signal cnt					: integer range 0 to 60:= 0;

type machine is(idle, add_wait, mult_wait, pow_wait, div_wait, comp_wait);
signal state: machine:= idle;

begin

	process(all)
	begin
		
		if(ip_wait_reset= '0')then
			cnt 	<= 0;
			state <= idle;
		elsif(rising_edge(clk))then
			
			case state is
				
				when idle =>
					ip_op_wait_ok 	<= '0';
					cnt 				<= 0;
					if(ip_op_wait = "000") then				-- no wait operation
						state <= idle;
					elsif(ip_op_wait = "001") then			-- add/subt operations max 2 cycle
						state <= add_wait;
					elsif(ip_op_wait = "010") then			-- multiply operation 3 cycle
						state <= mult_wait;
					elsif(ip_op_wait = "011") then			-- power operation 26 cycle
						state <= pow_wait;
					elsif(ip_op_wait = "100") then			-- division operation 10 cycle
						state <= div_wait;
					elsif(ip_op_wait = "101") then			-- compare operation 10 cycle
						state <= comp_wait;
					end if;
					
					
				when add_wait =>
					cnt <= cnt + 1;
					if(cnt = 10) then
						ip_op_wait_ok 	<= '1';
						cnt 				<= 0;
						state 			<= idle;
					end if;	
					
					
				when mult_wait =>
					cnt <= cnt + 1;
					if(cnt = 6) then
						ip_op_wait_ok 	<= '1';
						cnt 				<= 0;
						state 			<= idle;
					end if;	
					
					
				when pow_wait =>
					cnt <= cnt + 1;
					if(cnt = 50) then
						ip_op_wait_ok 	<= '1';
						cnt 				<= 0;
						state 			<= idle;
					end if;		
					
					
				when div_wait =>
					cnt <= cnt + 1;
					if(cnt = 18) then
						ip_op_wait_ok 	<= '1';
						cnt 				<= 0;
						state 			<= idle;
					end if;		
					
				when comp_wait =>
					cnt <= cnt + 1;
					if(cnt = 4) then
						ip_op_wait_ok 	<= '1';
						cnt 				<= 0;
						state 			<= idle;
					end if;	

					
				when others =>
					state <= idle;
					
			end case;	
		end if;
	end process;
end architecture;
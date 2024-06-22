Library ieee;
use ieee.std_logic_1164.all;
entity FSM is
	port
	(
		clk :in std_logic;
		data_in : in std_logic;
		reset : in std_logic;
		student_id1 : out std_logic_vector (3 downto 0);
		current_state: out std_logic_vector(3 downto 0)
		);
end entity;
architecture fsm of FSM is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
	signal yfsm : state_type;
begin
	process (clk, reset)
	begin	
		if reset = '1' then
			yfsm<= s0;
			current_state <= "0000";
		elsif (clk'EVENT AND clk = '1') then 
			case yfsm is
				when s0=>
					if data_in= '1' then 
                        yfsm<=s1;
								current_state <= "0001";
               else 
                        yfsm<= s0;
               end if;
				
				when s1=>
					if data_in= '1' then 
                        yfsm<=s2;
								current_state <= "0010";
               else 
                        yfsm<= s1;
               end if;

				when s2=>
					if data_in= '1' then 
                        yfsm<=s3;
								current_state <= "0011";
               else 
                        yfsm<= s2;
               end if;

				when s3=>
					if data_in= '1' then 
                        yfsm<=s4;
								current_state <= "0100";
               else 
                        yfsm<= s3;
               end if;

				when s4=>
					if data_in= '1' then 
                        yfsm<=s5;
								current_state <= "0101";
               else 
                        yfsm<= s4;
               end if;

				when s5=>
					if data_in= '1' then 
                        yfsm<=s6;
								current_state <= "0110";
               else 
                        yfsm<= s5;
               end if;

				when s6=>
					if data_in= '1' then 
                        yfsm<=s7;
								current_state <= "0111";
               else 
                        yfsm<= s6;
               end if;

				when s7=>
					if data_in= '1' then 
                        yfsm<=s8;
								current_state <= "1000";
               else 
                        yfsm<= s7;
               end if;

				when s8=>
					if data_in= '1' then 
                        yfsm<=s0;
								current_state <= "0000";
               else
                        yfsm<= s8;
               end if;
			end case;
		end if;
	end process;
	process (yfsm, data_in)
	begin
		case yfsm is
				when s0=>
					student_id1 <= "0101";--5
				
				when s1=>
					student_id1 <= "0000";--0

				when s2=>
					student_id1 <= "0001";--1

				when s3=>
					student_id1 <= "0001";--1

				when s4=>
					student_id1 <= "0101";--5

				when s5=>
					student_id1 <= "0011";--3

				when s6=>
					student_id1 <= "1001";--9
					
				when s7=>
					student_id1 <= "0110";--6
					
				when s8=>
					student_id1 <= "0101";--5
					
			end case;
	end process;
end fsm;


			
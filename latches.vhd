Library ieee;
use ieee.std_logic_1164.all;
entity latches is
	port
	(
		clk :in std_logic;
		reset : in std_logic;
		A : in std_logic_vector (7 downto 0);
		Q: out std_logic_vector(7 downto 0)
		);
end latches;
architecture Behaviour of latches is
	begin
		process (clk, reset)
		begin	
			if reset = '1' then
				Q <= "00000000";
			elsif (clk'EVENT AND clk = '1') then 
				Q <= A;
			end if;
		end process;

end Behaviour;


			
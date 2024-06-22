LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY seg7 IS
PORT (
neg : IN STD_LOGIC;
bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
leds, leds2 : OUT STD_LOGIC_VECTOR(0 TO 6));
END seg7;

ARCHITECTURE Behavior OF seg7 IS
BEGIN
PROCESS (neg, bcd)
BEGIN

IF neg = '0' THEN
leds2 <= "1111111";

CASE bcd IS

WHEN "0000" => leds <= "0000001";
WHEN "0001" => leds <= "1001111";
WHEN "0010" => leds <= "0010010";
WHEN "0011" => leds <= "0000110";
WHEN "0100" => leds <= "1001100";
WHEN "0101" => leds <= "0100100";
WHEN "0110" => leds <= "0100000";
WHEN "0111" => leds <= "0001111";
WHEN "1000" => leds <= "0000000";
WHEN "1001" => leds <= "0001100";
WHEN "1010" => leds <= "0001000";--1
WHEN "1011" => leds <= "1100000";--B
WHEN "1100" => leds <= "0110001";--C
WHEN "1101" => leds <= "1000010";--D
WHEN "1110" => leds <= "0110000";--E
WHEN "1111" => leds <= "0111000";--F
WHEN OTHERS => leds <= "-------";
END CASE;

ELSIF neg = '1' THEN
leds2 <= "1111110";

CASE bcd IS

WHEN "0000" => leds <= "0000001";
WHEN "1111" => leds <= "1001111";
WHEN "1110" => leds <= "0010010";
WHEN "1101" => leds <= "0000110";
WHEN "1100" => leds <= "1001100";
WHEN "1011" => leds <= "0100100";
WHEN "1010" => leds <= "0100000";
WHEN "1001" => leds <= "0001111";
WHEN "1000" => leds <= "0000000";
WHEN "0111" => leds <= "0001100";
WHEN "0110" => leds <= "0001000";
WHEN "0101" => leds <= "1100000";
WHEN "0100" => leds <= "0110001";
WHEN "0011" => leds <= "1000010";
WHEN "0010" => leds <= "0110000";
WHEN "0001" => leds <= "0111000";
WHEN OTHERS => leds <= "-------";
END CASE;
END IF;
END PROCESS;
END Behavior;
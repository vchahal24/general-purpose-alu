library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    port(
        Clock : in std_logic;              -- input clock signal
        A, B : in unsigned(7 downto 0);    -- 8-bit inputs from latches A and B
        OP : in unsigned(15 downto 0);     -- 16-bit selector for Operation from Decoder
        Neg : out std_logic;
        R1 : out unsigned(3 downto 0);
        R2 : out unsigned(3 downto 0)
    );
end ALU;

architecture calculation of ALU is
    -- temporary signal declarations.
    signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others => '0');
begin
    Reg1 <= A; -- temporarily store A in Reg1 local variable
    Reg2 <= B; -- temporarily store B in Reg2 local variable

    process(Clock, OP)
    begin
        if rising_edge(Clock) then -- Do the calculation @ positive edge of clock cycle
				Neg <= '0';
            case OP is
                when "1000000000000000" =>
                    -- Do Addition for Reg1 and Reg2
                    Result <= Reg1 + Reg2;
                when "0100000000000000" =>
                    -- Do Subtraction
                    Result <= Reg1 - Reg2;
                    if Reg1 < Reg2 then
                        Neg <= '1'; -- Set Neg bit if result is negative
                    else
                        Neg <= '0';
                    end if;
                when "0010000000000000" =>
                    -- Do Inverse (Negation)
                    Result <= not Reg1;
                when "0001000000000000" =>
                    -- Do Boolean NAND
                    Result <= not (Reg1 and Reg2);
                when "0000100000000000" =>
                    -- Do Boolean NOR
                    Result <= not (Reg1 or Reg2);
                when "0000010000000000" =>
                    -- Do Boolean AND
                    Result <= (Reg1 and Reg2);
                when "0000001000000000" =>
                    -- Do Boolean XOR
                    Result <= (Reg1 xor Reg2);
                when "0000000100000000" =>
                    -- Do Boolean OR
                    Result <= (Reg1 or Reg2);
					 when "0000000010000000" =>
                    -- Do Boolean XNOR
                    Result <= (Reg1 xnor Reg2);
                when others =>
                    -- Don't care, do nothing
                    Result <= (others => '0');
            end case;
        end if;
    end process;

    -- Since the output seven segments can only display 4-bits, split the 8-bit result into two 4-bit values
    R2 <= Result(3 downto 0);
    R1 <= Result(7 downto 4);

end calculation;
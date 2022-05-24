-- Tori Weber
-- December 2016
--
-- display7seg
-- One input to each 7 segment display.
--
-- INPUTS:
-- input0 - input for display 0
-- input1 - input for display 1
-- input2 - input for display 2
-- input3 - input for display 3
-- clk3ms - 3ms clock to help with rotating between the 4 displays.
--
-- OUTPUTS:
-- seg - segments on the 7 segment displays
-- an - the 7 segment diplays

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display7seg is
    Port ( input0 : in  STD_LOGIC_VECTOR (7 downto 0);
           input1 : in  STD_LOGIC_VECTOR (7 downto 0);
           input2 : in  STD_LOGIC_VECTOR (7 downto 0);
           input3 : in  STD_LOGIC_VECTOR (7 downto 0);
           clk3ms : in  STD_LOGIC;
           seg : out  STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR(3 downto 0) );
end display7seg;

architecture Behavioral of display7seg is

	signal output : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
	signal state : integer range 0 to 3 := 0;

begin

    seg <= output;

    process (clk3ms)
    begin
        if RISING_EDGE(clk3ms) then
            case state is
                when 0 =>
                    -- Turn off diplay before moving to the next one to avoid
                    -- displaying previous input on next segment
                    output <= "11111111";
                    an <= "0111";
                    output <= input3;
                    state <= 1;
                when 1 =>
                    output <= "11111111";
                    an <= "1011";
                    output <= input2;
                    state <= 2;
                when 2 =>
                    output <= "11111111";
                    an <= "1101";
                    output <= input1;
                    state <= 3;
                when 3 =>
                    output <= "11111111";
                    an <= "1110";
                    output <= input0;
                    state <= 0;
                when others =>
                    output <= "11111111";
                    an <= "1111";
                    state <= 0;
            end case;

        end if;
    end process;

end Behavioral;
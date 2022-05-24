library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Generic ( constant zero : STD_LOGIC_VECTOR(7 downto 0) := "11000000";
              constant one : STD_LOGIC_VECTOR(7 downto 0) := "11111001";
              constant two : STD_LOGIC_VECTOR(7 downto 0) := "10100100";
              constant three : STD_LOGIC_VECTOR(7 downto 0) := "10110000";
              constant four : STD_LOGIC_VECTOR(7 downto 0) := "10011001";
              constant five : STD_LOGIC_VECTOR(7 downto 0) := "10010010";
              constant six : STD_LOGIC_VECTOR(7 downto 0) := "10000010";
              constant seven : STD_LOGIC_VECTOR(7 downto 0) := "11111000";
              constant eight : STD_LOGIC_VECTOR(7 downto 0) := "10000000";
              constant nine : STD_LOGIC_VECTOR(7 downto 0) := "10010000";
              constant off : STD_LOGIC_VECTOR(7 downto 0) := "11111111");
              
    Port ( clk : in STD_LOGIC;
           btnC : in STD_LOGIC;
           btnR : in STD_LOGIC;
           dp : out STD_LOGIC;
           an : out STD_LOGIC_VECTOR(3 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR(15 downto 0);
           seg : out STD_LOGIC_VECTOR(6 downto 0));
end top;

architecture Behavioral of top is
    signal output7 : STD_LOGIC := '0';
    signal output6 : STD_LOGIC := '0';
    signal output5 : STD_LOGIC := '0';
    signal output4 : STD_LOGIC := '0';
    signal output3 : STD_LOGIC := '0';
    signal output2 : STD_LOGIC := '0';
    signal output1 : STD_LOGIC := '0';
    signal output0 : STD_LOGIC := '0';
    
    signal clk_counter : natural range 0 to 50000000 := 0;
    signal counter : natural range 0 to 9 := 0;
    
    type display is array(3 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    signal segments : display := (off, off, off, off);
    
    type state_type is (none, one_1, two_2, three_3, four_4, five_5, six_6, seven_7, eight_8, nine_9, zero_0);
    signal state : state_type := none;
    
    signal slowClk : STD_LOGIC;
    
begin

    P1: process(clk)
    begin
        if btnR = '1' then
            counter <= 0;
        else if RISING_EDGE(clk) AND sw(1) = '0' then
            clk_counter <= clk_counter + 1;
            if clk_counter >= 50000000 then
                clk_counter <= 0;
                -- 500ms delay
                counter <= counter + 1;
                if counter > 9 then
                    counter <= 0;
                end if;
            end if;
        end if;
        end if;
    end process;
    
    E1: entity work.clkDiv(Behavioral)
    port map ( clk => clk,
               led => led,
               clk_out => slowClk );
    
    E2: entity work.display7seg(Behavioral)
    port map ( clk3ms => slowClk,
               input0 => segments(0),
               input1 => segments(1),
               input2 => segments(2),
               input3 => segments(3),
               seg(6 downto 0) => seg,
               seg(7) => dp,
               an => an);
                 
    P2:process(counter, sw(3))
    begin
        if sw(3) = '1' then
            case counter is
                when 0 => segments <= (off,off,off, zero);
                when 1 => segments <= (off,off,off, one);
                when 2 => segments <= (off,off,off, two);
                when 3 => segments <= (off,off,off, three);
                when 4 => segments <= (off,off,off, four);
                when 5 => segments <= (off,off,off, five);
                when 6 => segments <= (off,off,off, six);
                when 7 => segments <= (off,off,off, seven);
                when 8 => segments <= (off,off,off, eight);
                when 9 => segments <= (off,off,off, nine);
                when others => segments <= (off,off,off, off);
            end case;
        end if;
    -- SW(0) --> SW(A)
    -- SW(1) --> SW(B)
    -- SW(2) --> SW(C)
    -- SW(3) --> SW(D)
    -- btnC --> btn2
    output0 <= sw(0) OR sw(3); -- A OR D
    led(0) <= output0;
    
    output1 <= sw(1) AND sw(3); -- B AND D
    led(1) <= output1;
    
    output2 <= NOT sw(0) AND NOT sw(2); -- notA AND notC
    led(2) <= output2;
    
    output3 <= NOT sw(1) AND NOT sw(2); --notB AND notC
    led(3) <= output3;
    
    output4 <= sw(2) OR (NOT sw(0) AND sw(3)) OR (NOT sw(1) AND sw(3)); -- C OR notA AND D OR notB AND D
    led(4) <= output4;
    
    output5 <= (NOT sw(0) AND NOT sw(1)) OR (NOT sw(0) AND sw(3)) OR (NOT sw(1) AND sw(2)); --notA AND notB OR notA AND D OR notB AND C
    led(5) <= output5;
    
    output6 <= (sw(0) AND sw(1)) OR (NOT sw(0)) OR (NOT sw(1)); --A AND B OR notA OR notB
    led(6) <= output6;
    
    output7 <= NOT btnC OR NOT sw(2) OR NOT sw(3); --notB AND notC
    led(7) <= output7;
    

    end process;
        
end Behavioral;

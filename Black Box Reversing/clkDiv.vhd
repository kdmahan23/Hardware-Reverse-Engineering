----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2020 02:21:36 PM
-- Design Name: 
-- Module Name: clkDiv - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clkDiv is
    Generic ( T : integer := 5);
    
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR(15 downto 0);
           clk_out : out STD_LOGIC);
end clkDiv;

architecture Behavioral of clkDiv is
    signal count : integer := 0;
    type state_type is (clkHigh, clkLow);
    signal state : state_type := clkHigh;
begin
    P1: process (state)
    begin
    if RISING_EDGE (clk) then
        case state is
            when clkHigh =>
                led(15) <= '1';
                clk_out <= '1';
                count <= count + 1;
                if count = (T/2)*100000 then
                     state <= clkLow;
                     count <= 0;
                end if;
             when clkLow =>
                led(15) <= '0';
                clk_out <= '0';
                count <= count + 1;
                if count = (T/2)*100000 then
                    state <= clkHigh;
                    count <= 0;
                end if;
            when others =>
                led(15) <= '0';
                state <= clkHigh;
          end case;
      end if;
      end process;
end Behavioral;

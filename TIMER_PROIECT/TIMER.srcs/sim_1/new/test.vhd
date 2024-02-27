----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.06.2023 20:39:48
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
--  Port ( );
end test;

architecture Behavioral of test is
signal CLK, RESET, DIR :  STD_LOGIC;
signal TIMP, TIMP_RAMAS :  STD_LOGIC_VECTOR (15 downto 0);

begin
    l1: entity work.COUNTER_TIME port map (CLK=>CLK, TIMP=>TIMP, RESET=>RESET, TIMP_RAMAS=>TIMP_RAMAS, DIR=>DIR);
    
    process
    begin
        clk <= '0';
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
    end process;
    
    
    process
    begin
        reset <= '0';
        dir <= '0';
        timp <= x"0000";
        wait for 2 ns;
         reset <= '0';
        dir <= '0';
        timp <= x"0000";
        wait;
    end process;

end Behavioral;

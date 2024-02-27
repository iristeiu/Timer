----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.06.2023 18:47:12
-- Design Name: 
-- Module Name: BUTTON_VALUE - Behavioral
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

entity BUTTON_VALUE is
    Port ( BUTON : in STD_LOGIC;
           BUTON_SETARE : in STD_LOGIC;
    	   RESET : in STD_LOGIC;
           VALUE : out STD_LOGIC);
end BUTTON_VALUE;

architecture Behavioral of BUTTON_VALUE is
signal value_out : std_logic;
begin
    process(BUTON, RESET, BUTON_SETARE)
    begin
    	  if (RESET = '1') then 
    		value_out <= '0';
       elsif (BUTON_SETARE = '1') then
       	    value_out <= '0';
       elsif (rising_edge(BUTON)) then 
            value_out <= not (value_out);
       end if;
    end process;
value <= value_out;
end Behavioral;

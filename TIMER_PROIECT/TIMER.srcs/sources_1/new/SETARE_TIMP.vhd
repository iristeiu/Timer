----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.06.2023 19:46:48
-- Design Name: 
-- Module Name: SETARE_TIMP - Behavioral
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

entity SETARE_TIMP is
    Port ( RESET : in STD_LOGIC;
           BT_MIN : in STD_LOGIC;
           BT_SEC : in STD_LOGIC;
           TIMP : out STD_LOGIC_VECTOR (15 downto 0));
end SETARE_TIMP;

architecture Behavioral of SETARE_TIMP is
signal 
begin


end Behavioral;

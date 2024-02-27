----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.06.2023 20:16:36
-- Design Name: 
-- Module Name: COUNTER_TIME - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER_TIME is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           BUTON_MIN : in STD_LOGIC;
           BUTON_SEC : in STD_LOGIC;
           SS_BUTON : in STD_LOGIC; --START/STOP BUTTON
           EXP_TIMP : out STD_LOGIC;
           TIMP_RAMAS : out STD_LOGIC_VECTOR (15 downto 0)
          );-- DIR=0 CRESCATOR; DIR=1 DESCRESCATOR
end COUNTER_TIME;

architecture Behavioral of COUNTER_TIME is
    signal min_zec : std_logic_vector(3 downto 0):= "0000";
    signal min_unit: std_logic_vector(3 downto 0):= "0000";
    signal sec_zec : std_logic_vector(3 downto 0):= "0000";
    signal sec_unit : std_logic_vector(3 downto 0):= "0000";
    signal dir : std_logic := '0';
    signal sound : std_logic := '0';
begin
    
    process(RESET, CLK)
    begin
        if(RESET = '1') then 
            min_zec <= "0000";    
            min_unit <= "0000";    
            sec_zec <= "0000";    
            sec_unit <= "0000";   
            dir <= '0';
            sound <= '0';
                  
         elsif(CLK'EVENT and CLK = '1') then 
            if(BUTON_MIN = '1' ) then 
                 dir <= '1';
                 if( min_zec&min_unit = X"99") then
                        min_zec <= "0000";    
                        min_unit <= "0000";     
                 elsif(min_unit =X"9") then 
                        min_zec <= min_zec+1;
                        min_unit <= "0000";    
                 else 
                    min_unit <= min_unit+1;
                 end if;             
           elsif( BUTON_SEC = '1' ) then
                if(sec_zec&sec_unit =X"59") then 
                        sec_zec <= "0000";    
                        sec_unit <= "0000";
                 elsif(sec_unit =X"9") then
                        sec_zec <= sec_zec+1;
                        sec_unit <= "0000";
                 else
                        sec_unit <= sec_unit+1;
                 end if; 
            elsif(SS_BUTON = '1') then 
                if(DIR = '0') then
                --crescator
                    if( min_zec&min_unit&sec_zec&sec_unit = X"9959") then
                        min_zec <= "0000";    
                        min_unit <= "0000";    
                        sec_zec <= "0000";    
                        sec_unit <= "0000";  
                    elsif(min_unit&sec_zec&sec_unit =X"959") then 
                        min_zec <= min_zec+1;
                        min_unit <= "0000";    
                        sec_zec <= "0000";    
                        sec_unit <= "0000"; 
                    elsif(sec_zec&sec_unit =X"59") then 
                        min_unit <= min_unit+1;
                        sec_zec <= "0000";    
                        sec_unit <= "0000";
                    elsif(sec_unit =X"9") then
                        sec_zec <= sec_zec+1;
                        sec_unit <= "0000";
                    else
                        sec_unit <= sec_unit+1;
                    end if;
                elsif( sound = '0') then 
                    --descrecator
                    if( min_zec&min_unit&sec_zec&sec_unit =X"0000") then
                        sound <= '1'; 
                    elsif(min_unit&sec_zec&sec_unit =X"000") then 
                        min_zec <= min_zec-1;
                        min_unit <= x"9";    
                        sec_zec <=  x"5";    
                        sec_unit <=  x"9"; 
                    elsif(sec_zec&sec_unit =X"00") then 
                        min_unit <= min_unit-1;
                        sec_zec <=  x"5";    
                        sec_unit <=  x"9";
                    elsif(sec_unit =X"0") then
                        sec_zec <= sec_zec-1;
                        sec_unit <=  x"9";
                    else
                        sec_unit <= sec_unit-1;
                    end if;
                end if;               
            end if;
            end if;
    end process;
   timp_ramas <= min_zec&min_unit&sec_zec&sec_unit;
   EXP_TIMP <= sound;
end Behavioral;

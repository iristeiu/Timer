----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.06.2023 20:42:19
-- Design Name: 
-- Module Name: TIMER - Behavioral
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

entity TIMER is
    Port ( BUTON_MIN : in STD_LOGIC;
           BUTON_SEC : in STD_LOGIC;
           SS_BUTON : in STD_LOGIC;
           SUNET : out STD_LOGIC;
           CLK : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0)
           );
end TIMER;

architecture Behavioral of TIMER is
signal RESET,ENABLE_SETARE, VALUE, DIVCLOCK: std_logic;
signal but_min_sig, but_sec_sig, but_ss_sig : std_logic;
signal count : integer := 1;
signal TIMP : STD_LOGIC_VECTOR (15 downto 0):= x"0000";
begin
    debouncer_min : entity work.debouncer port map (CLK=>CLK, BTN=>BUTON_MIN, ENABLE=>but_min_sig);
    debouncer_sec : entity work.debouncer port map (CLK=>CLK, BTN=>BUTON_SEC, ENABLE=>but_sec_sig);
    debouncer_ss  : entity work.debouncer port map (CLK=>CLK, BTN=>SS_BUTON , ENABLE=>but_ss_sig );
    
    process( but_min_sig, but_sec_sig)
    begin
        if(but_min_sig='1' and but_sec_sig = '1') then
            RESET <= '1';
        else
            RESET <= '0';
        end if;
        
        if( but_min_sig = '1' or but_sec_sig = '1') then 
            ENABLE_SETARE <= '1';
        else
            ENABLE_SETARE <= '0';
        end if;
    end process;
    
    process(CLK)
        begin
            if(RESET = '1')then
                count <= 1;
            elsif (CLK'event and CLK = '1') then
                count<= count+1;
                if (count = 9999999) then 
                       DIVCLOCK <= NOT DIVCLOCK;
                       count <= 1;
                 end if;
            end if;    
    end process;
    but_val: entity work.BUTTON_VALUE port map (BUTON=>but_ss_sig, BUTON_SETARE=>ENABLE_SETARE, RESET=>RESET, VALUE=>VALUE);
    counter: entity work.COUNTER_TIME port map (CLK=>DIVCLOCK, RESET=>RESET, BUTON_MIN => but_min_sig, BUTON_SEC => but_sec_sig, SS_BUTON=>value, EXP_TIMP=>SUNET, TIMP_RAMAS=>TIMP);
    ssd    : entity work.SSD port map(CLK=>CLK, D0=>TIMP(3 DOWNTO 0), D1=>TIMP(7 DOWNTO 4), D2=>TIMP(11 DOWNTO 8), D3=>TIMP(15 DOWNTO 12), an=>an, cat=>cat);
end Behavioral;

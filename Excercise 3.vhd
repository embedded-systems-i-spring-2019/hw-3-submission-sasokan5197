----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 02:57:38 PM
-- Design Name: 
-- Module Name: Excercise 3 - Behavioral
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



entity Excercise_3 is
port(X,Y,RA : in std_logic_vector(7 downto 0);
    LDA,LDB,CLK,S1,S0 : in std_logic;
    RB: inout std_logic_vector(7 downto 0));

end Excercise_3;

architecture behavioral of Excercise_3 is
signal mux_output1: std_logic_vector(7 downto 0);
signal mux_output2: std_logic_vector(7 downto 0);
signal RB_output: std_logic_vector(7 downto 0);
signal RA_MUX2: std_logic_vector(7 downto 0);

begin

    with S1 select
    mux_output1 <= X when '1', RB_output when '0', (others => '0') when others;

    with S0 select
    mux_output2 <= RA_MUX2 when '1', Y when '0', (others => '0') when others;
    
        

     R_A: process(CLK)
     begin
     if(rising_edge(CLK)) then
     if (LDA ='1') then
        RA_MUX2 <= mux_output1;
        end if;
        end if;
        end process;
        
   
             R_B: process(CLK)
             begin
             if(rising_edge(CLK)) then
             if (LDA ='1') then
                RB <= mux_output2;
                end if;
                end if;
                end process;
                
                
    RB_output <= RB;                 
        
        
        
        
        
        
        
        
    



end Behavioral;

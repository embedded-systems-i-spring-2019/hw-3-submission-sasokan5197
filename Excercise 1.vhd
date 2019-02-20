----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 02:52:51 PM
-- Design Name: 
-- Module Name: Excercise 1 - Behavioral
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



entity Excercise_1 is
port(A,B : in std_logic_vector(7 downto 0);
    LDA,SEL,CLK : in std_logic;
    F : out std_logic_vector(7 downto 0));

end Excercise_1;

architecture Behavioral of Excercise_1 is
    signal output : std_logic_vector(7 downto 0);
    
begin
     ra: process(CLK)
     begin
     if(rising_edge(CLK)) then
     if (LDA ='1') then
        F <= output;
        end if;
        end if;
        end process;


    with SEL select
    output <= A when '0', B when '1', (others => '0') when others;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 02:54:28 PM
-- Design Name: 
-- Module Name: Excercise 4 - Behavioral
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

entity Excercise_4 is
port(X,Y : in std_logic_vector(7 downto 0);
    LDA,LDB,CLK,S1,S0,RD : in std_logic;
    RB: inout std_logic_vector(7 downto 0);
    RA: out std_logic_vector(7 downto 0));
end Excercise_4;

architecture Behavioral of Excercise_4 is

signal mux1_regb: std_logic_vector(7 downto 0);
signal mux2_rega: std_logic_vector(7 downto 0);
signal RB_output: std_logic_vector(7 downto 0);
signal RA_output: std_logic_vector(7 downto 0);
signal rd_ldb: std_logic;
signal rd_lda: std_logic;
signal RB_final: std_logic_vector(7 downto 0);

--initialize and gate
begin

rd_ldb<= (LDB and not(RD));
rd_lda<= (LDA and RD);
RB_final <= RB;
RB<= RB_output;
RA<= RA_output;

 with S1 select
    mux1_regb <= X when '1', Y when '0', (others => '0') when others;

    with S0 select
    mux2_rega <= RB_final when '1', Y when '0', (others => '0') when others;
    
        

     R_A: process(CLK)
     begin
     if(falling_edge(CLK)) then
     if (rd_lda ='1') then
        RA_output <= mux2_rega;
        end if;
        end if;
        end process;
        
   
             R_B: process(CLK)
             begin
             if(falling_edge(CLK)) then
             if (rd_ldb ='1') then
                RB_output <= mux1_regb;
                end if;
                end if;
                end process;
                
                











end Behavioral;

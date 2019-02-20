----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 02:58:12 PM
-- Design Name: 
-- Module Name: Excercise 6 - Behavioral
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

--entity declaration mux2-1
entity mux2 is
port( A,B :in std_logic_vector(7 downto 0);
      SEL1 :in std_logic;
     mux_out : out std_logic_vector(7 downto 0));
end mux2;

--architecture declaration mux2-1
architecture MUX_2 of mux2 is
begin
   with SEL1 select
        mux_out <= A when '1', B when '0', (others => '0') when others;
end MUX_2;

--entity declaration for decoder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity dec is
port(SL2 :in std_logic;
    LD1 :out std_logic;
    LD2 :out std_logic);
    
end entity dec;

architecture dec_arc of dec is
begin 
process(SL2) 
    begin
       case SL2 is
        when '0' => 
            LD1 <='1';
            LD2 <='0';
            
        when '1' =>
            LD1<='0';
            LD2<='1';
        when others =>
         LD1 <='0';
         LD2 <='1';
         
         end case;
         end process;
         
 end dec_arc;
 
 
--entity declaration for register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity reg is
port( R_input : in std_logic_vector(7 downto 0);
    CLK: in std_logic;
    LD: in std_logic;
    R_output : out std_logic_vector(7 downto 0));
    end reg;
--architecture for register
architecture register_arc of reg is
begin
reg_prc: process(CLK) 
    begin 
    if (falling_edge(CLK)) then
    if (LD ='1') then
    R_output <= R_input;
end if;
end if;
end process reg_prc;
    end register_arc;    
    
 
 --entity declaration for re circuit
library IEEE;
 use IEEE.STD_LOGIC_1164.ALL; 
entity entire is
port( A,B,C : in std_logic_vector(7 downto 0);
 CLK, SEL1,SL2 : in std_logic;
 RBP, RAP : out std_logic_vector(7 downto 0));
end entire;

architecture entire_circuit of entire is

-- component declaration for seperate parts
component mux2 is
port( A,B :in std_logic_vector(7 downto 0);
      SEL1 :in std_logic;
     mux_out : out std_logic_vector(7 downto 0));
end component;

component dec is
port(SL2 :in std_logic;
    LD1 :out std_logic;
    LD2 :out std_logic);
    
    
end component;
component reg is
port( R_input : in std_logic_vector(7 downto 0);
    CLK: in std_logic;
    LD: in std_logic;
    R_output : out std_logic_vector(7 downto 0));
    end  component;

signal mux_output: std_logic_vector(7 downto 0);
signal RA_output: std_logic;
signal RB_output: std_logic;





begin
  DECODER: dec
  port map (SL2 => SL2,
          LD1 => RA_output,
          LD2 => RB_output);
  MX: mux2
  port map (A => A,
          B => B,
          SEL1 => SEL1,
          mux_out => mux_output);       
  
  RegA: reg
  port map (LD => RA_output,
          CLK => CLK,
          R_input => mux_output,
          R_output =>RAP);
   RegB: reg
  port map (LD => RB_output,
          CLK => CLK,
          R_input => C,    
          R_output =>RBP);


end entire_circuit;

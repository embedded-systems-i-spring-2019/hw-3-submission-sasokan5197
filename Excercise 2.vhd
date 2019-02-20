----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 02:53:29 PM
-- Design Name: 
-- Module Name: Excercise 2 - Behavioral
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

--entity declaration mux4-1
entity mux4 is
port( RB,X,Y,Z :in std_logic_vector(7 downto 0);
     MS :in std_logic_vector(1 downto 0);
     mux_out : out std_logic_vector(7 downto 0));
end mux4;

--architecture declaration mux4-1
architecture MUX_4 of mux4 is
begin
   with MS select
    mux_out <= RB when "00",
               X when "01",
               Y when "10",
               Z when "11",
               (others => '0') when others; 
end MUX_4;

--entity declaration for decoder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity dec is
port(DS :in std_logic;
    LD1 :out std_logic;
    LD2 :out std_logic);
    
end entity dec;

architecture dec_arc of dec is
begin 
process(DS) 
    begin
       case DS is
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
port( X,Y,Z : in std_logic_vector(7 downto 0);
 MS : in std_logic_vector( 1 downto 0);
 CLK, DS : in std_logic;
 RB, RA : out std_logic_vector(7 downto 0));
end entire;

architecture entire_circuit of entire is

-- component declaration for seperate parts
component mux4 is
port( RB,X,Y,Z :in std_logic_vector(7 downto 0);
     MS :in std_logic_vector(1 downto 0);
     mux_out : out std_logic_vector(7 downto 0));
end component;

component dec is
port(DS :in std_logic;
    LD1 :out std_logic;
    LD2 :out std_logic);
    
end component;
component reg is
port( R_input : in std_logic_vector(7 downto 0);
    CLK: in std_logic;
    LD: in std_logic;
    R_output : out std_logic_vector(7 downto 0));
    end component;

signal mux_output: std_logic_vector(7 downto 0);
signal RA_output: std_logic_vector(7 downto 0);
signal RB_output: std_logic_vector(7 downto 0);
signal LD_A: std_logic;
signal LD_B: std_logic;




begin
  DECODER: dec
  port map (DS => DS,
          LD1 => LD_A,
          LD2 => LD_B);
  MX: mux4
  port map (X => X,
          Y => Y,
          Z => Z,
          RB => RB_output,
          MS => MS,
          mux_out => mux_output);       
  
  RegA: reg
  port map (R_input => mux_output,
          LD => LD_A,
          CLK => CLK,
          R_output => RA_output);
   RegB: reg
  port map (R_input => RA_output,
          LD => LD_B,
          CLK => CLK,
          R_output => RB_output);    
  RB <= RB_output;
  RA <= RA_output;   

end entire_circuit;








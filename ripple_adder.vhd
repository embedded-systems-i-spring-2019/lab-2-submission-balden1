----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 01:14:19 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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


entity ripple_adder is
    Port ( A0,B0,A1,B1,A2,B2,A3,B3 : in std_logic;
            C0 : in std_logic;
            S0, S1, S2, S3 : out std_logic;
            C4 : out std_logic);
end ripple_adder;

architecture Behavioral of ripple_adder is

    component adder is
    Port ( A, B, Cin : in std_logic;
            S, Cout  : out std_logic );
    end component;   

    signal C1, C2, C3 : std_logic;

begin

    adder0 : adder port map (A => A0, B => B0, Cin => C0, S => S0, Cout => C1);
    
    adder1 : adder port map (A => A1, B => B1, Cin => C1, S => S1, Cout => C2);

    adder2 : adder port map (A => A2, B => B2, Cin => C2, S => S2, Cout => C3);
    
    adder3 : adder port map (A => A3, B => B3, Cin => C3, S => S3, Cout => C4);
    
end Behavioral;

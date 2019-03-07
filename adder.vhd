----------------------------------------------------------------------------------
-- Company: Rutgers
-- Engineer: Brian Alden
-- 
-- Create Date: 03/06/2019 12:37:28 PM
-- Design Name: 
-- Module Name: adder - Behavioral
-- Project Name: Lab2 Adders
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


entity adder is
    Port ( A, B, Cin : in std_logic;
            S, Cout  : out std_logic );
end adder;

architecture Behavioral of adder is
        
begin
          S <= (A xor B) xor Cin;
          Cout <= (A and B) or ((A xor B) and Cin);

end Behavioral;

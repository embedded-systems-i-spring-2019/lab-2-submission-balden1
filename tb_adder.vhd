----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 01:32:07 PM
-- Design Name: 
-- Module Name: tb_adder - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity tb_adder is
end tb_adder;

architecture Behavioral of tb_adder is
    --Components
    component ripple_adder is
        Port ( A0,B0,A1,B1,A2,B2,A3,B3 : in std_logic;
               C0 : in std_logic;
               S0, S1, S2, S3 : out std_logic;
               C4 : out std_logic);
    end component;
    
    --Signals
    signal A_test, B_test : std_logic_vector(3 downto 0);
    signal carry_in_test : std_logic_vector(0 downto 0);
    signal output_test : std_logic_vector(3 downto 0);
    signal carry_out_test : std_logic;

    
begin

    --Create my adder
    my_adder : ripple_adder port map  -- port mapping 
    (A_test(0), B_test(0),
     A_test(1), B_test(1),
     A_test(2), B_test(2),
     A_test(3), B_test(3), 
     carry_in_test(0),
     output_test(0), output_test(1), output_test(2), output_test(3),
     carry_out_test);

                     
     
     main : process  -- test logic
     begin
        carry_in_test <= "0";  -- start with carry in "0".
        
        for A_values in 0 to 15 loop  -- all values of A tested
            for B_values in 0 to 15 loop  -- all values of B tested
            
                A_test <= std_logic_vector(to_unsigned(A_values, 4));
                B_test <= std_logic_vector(to_unsigned(B_values, 4));      
            
                wait for 10 ns;  --compensation for ripple adder propagation delay
            end loop;
        end loop;
        
        carry_in_test <= "1";  -- start with carry in "1".
        
        for A_values in 0 to 15 loop  -- all values of A tested
            for B_values in 0 to 15 loop  -- all values of B tested
            
                A_test <= std_logic_vector(to_unsigned(A_values, 4));
                B_test <= std_logic_vector(to_unsigned(B_values, 4));      
            
                wait for 10 ns;  -- wait for ripple adder to count
            end loop;
        end loop;
     
     end process;

end Behavioral;

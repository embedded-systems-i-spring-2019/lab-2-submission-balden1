----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 11:16:21 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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


entity my_alu is
    Port ( A, B, Opcode : in std_logic_vector ( 3 downto 0);
            Output : out std_logic_vector ( 3 downto 0) );
end my_alu;

architecture Behavioral of my_alu is

begin
    
    myOpcode : process ( A, B, Opcode) 
    begin 
        if Opcode = "0000" then
            Output <= std_logic_vector(Unsigned(A) + Unsigned(B));
            
        elsif Opcode = "0001" then
            Output <= std_logic_vector(Unsigned(A) - Unsigned(B));
            
        elsif Opcode = "0010" then
            Output <= std_logic_vector(Unsigned(A) + 1);
        
        elsif Opcode = "0011" then
            Output <= std_logic_vector(Unsigned(A) - 1);  
            
        elsif Opcode = "0100" then
            Output <= std_logic_vector(0 - Unsigned(A));
            
        elsif Opcode = "0101" then
            if Unsigned(A) > Unsigned(B) then
                Output <= "0001";
            else 
                Output <= "0000";
            end if;    
                
        elsif Opcode = "0110" then
            Output <= std_logic_vector ( unsigned(A) sll 1 );
            
        elsif Opcode = "0111" then
            Output <= std_logic_vector ( unsigned(A) srl 1);
            
        elsif Opcode = "1000" then
            if(A(3) = '1') then
                Output <= std_logic_vector ( (unsigned(A) srl 1) + 8);
            else
                Output <= std_logic_vector ( unsigned(A) srl 1);
            end if;
            
        elsif Opcode = "1001" then
            Output <= not A;
            
        elsif Opcode = "1010" then
            Output <= A and B;
            
        elsif Opcode = "1011" then
            Output <= A or B;
            
        elsif Opcode = "1100" then
            Output <= A xor B;
            
        elsif Opcode = "1101" then
            Output <= A xnor B;
            
        elsif Opcode = "1110" then
            Output <= A nand B;
            
        elsif Opcode = "1111" then
            Output <= A nor B;
        
        end if;

    end process;

end Behavioral;

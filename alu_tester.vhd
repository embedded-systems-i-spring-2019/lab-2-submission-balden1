----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 12:07:10 AM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
    Port ( clk : in std_logic;
           btn, sw : in std_logic_vector (3 downto 0);
           led : out std_logic_vector (3 downto 0)
            );
end alu_tester;

architecture Behavioral of alu_tester is

    --components
    component debounce is 
        Port ( btn, clk : in  std_logic;
               dbnc     : out std_logic);
    end component;
    
    component my_alu is
        Port ( A, B, Opcode : in std_logic_vector ( 3 downto 0);
                Output : out std_logic_vector ( 3 downto 0) );
    end component;

    --signals
    signal A_in, B_in, Opcode_in, Button_in, ALU_Output, ALU_Buff : std_logic_vector (3 downto 0)
        := (others => '0');

begin
    
    --connections
    led <= ALU_Output;
    
    --instantiation
    debounce0 : debounce port map(btn(0), clk, Button_in(0));
    debounce1 : debounce port map(btn(1), clk, Button_in(1));
    debounce2 : debounce port map(btn(2), clk, Button_in(2));
    debounce3 : debounce port map(btn(3), clk, Button_in(3));
    alu : my_alu port map(A_in, B_in, Opcode_in, ALU_Buff);
    
    --process
    main : process (clk)
    begin 
        if (rising_edge(clk)) then
        
            if(Button_in(0) = '1') then  --input A
                A_in <= sw;
            end if;
        
            if(Button_in(1) = '1') then  --input B
                B_in <= sw;
            end if;
            
            if(Button_in(2) = '1') then  --input Opcode
                Opcode_in <= sw;
            end if;
    
            if(Button_in(3) = '1') then  --clear all
                A_in <= "0000";
                B_in <= "0000";
                Opcode_in <= (others => '0');
            end if;

            ALU_Output <= ALU_Buff;  --Show Output
         end if;
     end process;
        
end Behavioral;

----------------------------------------------------------------------------------
-- Company: Rutgers
-- Engineer: Brian Alden
-- 
-- Create Date: 02/27/2019 06:44:53 AM
-- Design Name: 
-- Module Name: debounce - Behavioral
-- Project Name: Lab_1
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


entity debounce is
    Port ( btn, clk : in  std_logic;
           dbnc     : out std_logic);
end debounce;

architecture Behavioral of debounce is
    signal counter         : std_logic_vector(23 downto 0) := (others => '0');
    signal shift_input     : std_logic;
    signal output          : std_logic := '0';
    signal shift_reg_2bit  : std_logic_vector (1 downto 0) := "00";
    signal sample_butt_val : std_logic := '0'; 
begin
    dbnc <= output;
    sample_butt_val <= shift_reg_2bit(1);
    
    butt_sample : process(clk) --button sample
    begin
        if(rising_edge(clk)) then
        shift_reg_2bit(1) <= shift_reg_2bit(0);
        
            if(btn = '1') then
                shift_input <= '1'; --button pressed
            else
             shift_input <= '0'; --button not pressed
            end if;
      
        shift_reg_2bit(0) <= shift_input;
        end if;
    end process;
    
debounce : process (clk, sample_butt_val)
begin
    if (rising_edge(clk)) then      -- this increments the counter
        if (sample_butt_val = '1') then
            if (output = '0') then  -- if counter is high stop incrementing it
                counter <= std_logic_vector (unsigned(counter) + 1);
            end if;
        else
            counter <= (others => '0');
        end if;
    end if;
end process;

counter_increment : process(counter)
begin
    if (unsigned(counter) > 249999) then
        output <= '1';
    else
        output <= '0';
    end if;
end process;            
    
     
        

end Behavioral;

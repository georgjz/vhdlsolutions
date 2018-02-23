-- solution for exercise 20, chapter 5
-- async negative-edge-triggered counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    port ( clk, load_en : in std_ulogic;
           d : in std_ulogic_vector(3 downto 0);
           q : out std_ulogic_vector(3 downto 0) );
end entity counter;

-- behavioral body
architecture behav of counter is
    signal temp : std_ulogic_vector(3 downto 0) := "0000";
begin
    count : temp <= std_ulogic_vector(unsigned(temp) + 1) when falling_edge(clk) else
                    d when load_en = '1';
    q <= temp;
end architecture behav;

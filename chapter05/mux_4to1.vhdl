-- solution to exercise 19, chapter 5
-- 4-to-1 multiplexer

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1 is
    port ( a0, a1, a2, a3 : in std_ulogic;
           s0, s1 : in std_ulogic;
           z : out std_ulogic );
end entity mux_4to1;

-- behavioral body
architecture behav of mux_4to1 is
    signal sel : std_ulogic_vector(1 downto 0);
    constant prop_delay : delay_length := 4.5 ns;
begin

    sel <= s1 & s0;
    mux: with sel select
        z <= a0 after prop_delay when "00",
             a1 after prop_delay when "01",
             a2 after prop_delay when "10",
             a3 after prop_delay when "11",
             'X' after prop_delay when others;

end architecture behav;

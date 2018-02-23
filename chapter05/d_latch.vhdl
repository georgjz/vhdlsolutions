-- solution to exercise 21, chapter 5
-- D-Latch

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_latch is
    port ( d, en : in std_ulogic;
           q, q_n : out std_ulogic );
end entity d_latch;

-- behavioral body
architecture behav of d_latch is
    signal intern : std_ulogic;
begin
    latch :
        intern <= d when rising_edge(en) else
                    unaffected;
    update :
        q <= intern after 4 ns when rising_edge(intern) else
             intern after 3 ns;
        q_n <= not intern;

end architecture behav;

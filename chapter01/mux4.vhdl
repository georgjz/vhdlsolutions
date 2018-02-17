-- solution to exercise 11, chapter 1
-- a four-input multiplexer described by a structural body

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- entity declaraction
entity mux4 is
    port ( a0, a1, a2, a3, b0, b1, b2, b3, sel : in std_ulogic;
           z0, z1, z2, z3 : out std_ulogic );
end entity mux4;

-- structural body
architecture struct of mux4 is
begin
    -- use four two-input multiplexer
    mux_1 : entity work.mux(behav)
        port map ( a0, b0, sel, z0 );
    mux_2 : entity work.mux(behav)
        port map ( a1, b1, sel, z1 );
    mux_3 : entity work.mux(behav)
        port map ( a2, b2, sel, z2 );
    mux_4 : entity work.mux(behav)
        port map ( a3, b3, sel, z3 );

end architecture struct;

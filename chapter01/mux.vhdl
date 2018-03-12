-- solution to exercise 10, chapter 1
-- a two-input multiplexer described by a behavioral body

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- entity declaraction
entity mux is
    port ( a, b, sel : in std_ulogic;
           q : out std_ulogic );
end entity mux;

-- behavioral body
architecture behav of mux is
begin

    process is
    begin
        if sel = '0' then
            q <= a;
        else
            q <= b;
        end if;
    -- suspend process and wait until one input changes
    wait on a, b, sel;
    end process;
    
end architecture behav;

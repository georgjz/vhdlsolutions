-- test bench for the solution to exercise 11, chapter 1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_test_bench is
end entity mux4_test_bench;

architecture test_mux4 of mux4_test_bench is
    signal a0, a1, a2, a3,                  -- input a
           b0, b1, b2, b3,                  -- input b
           sel,                             -- selection signal
           z0, z1, z2, z3 : std_ulogic;     -- output
begin
    
    mux4_dut : entity work.mux4(struct)
        port map ( a0, a1, a2, a3, b0, b1, b2, b3, sel, z0, z1, z2, z3 );

    stimulus : process is
    begin
        -- test 10 random config
        a0 <= '0'; a1 <= '1'; a2 <= '0'; a3 <= '0';
        b0 <= '0'; b1 <= '1'; b2 <= '1'; b3 <= '0';
        sel <= '0'; wait for 100 ns;
        a0 <= '1'; a1 <= '0'; a2 <= '1'; a3 <= '0';
        b0 <= '1'; b1 <= '1'; b2 <= '0'; b3 <= '0';
        sel <= '1'; wait for 100 ns;
        a0 <= '0'; a1 <= '1'; a2 <= '0'; a3 <= '1';
        b0 <= '1'; b1 <= '0'; b2 <= '1'; b3 <= '0';
        sel <= '0'; wait for 100 ns;
        a0 <= '1'; a1 <= '1'; a2 <= '0'; a3 <= '0';
        b0 <= '0'; b1 <= '1'; b2 <= '0'; b3 <= '1';
        sel <= '1'; wait for 100 ns;
        a0 <= '0'; a1 <= '1'; a2 <= '1'; a3 <= '0';
        b0 <= '1'; b1 <= '1'; b2 <= '1'; b3 <= '1';
        sel <= '0'; wait for 100 ns;
        a0 <= '0'; a1 <= '1'; a2 <= '1'; a3 <= '1';
        b0 <= '1'; b1 <= '0'; b2 <= '0'; b3 <= '0';
        sel <= '1'; wait for 100 ns;
        a0 <= '0'; a1 <= '1'; a2 <= '1'; a3 <= '0';
        b0 <= '0'; b1 <= '1'; b2 <= '1'; b3 <= '0';
        sel <= '0'; wait for 100 ns;
        a0 <= '0'; a1 <= '0'; a2 <= '1'; a3 <= '0';
        b0 <= '1'; b1 <= '1'; b2 <= '0'; b3 <= '0';
        sel <= '1'; wait for 100 ns;
        a0 <= '1'; a1 <= '1'; a2 <= '0'; a3 <= '0';
        b0 <= '0'; b1 <= '0'; b2 <= '1'; b3 <= '1';
        sel <= '0'; wait for 100 ns;
        a0 <= '1'; a1 <= '1'; a2 <= '1'; a3 <= '1';
        b0 <= '1'; b1 <= '1'; b2 <= '1'; b3 <= '1';
        sel <= '1'; wait for 100 ns;
        wait;   -- suspend process indefinitely
    end process stimulus;
end architecture test_mux4;

-- test bench for the solution to exercise 10, chapter 1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_test_bench is
end entity mux_test_bench;

architecture test_mux of mux_test_bench is
    signal a, b, sel : std_ulogic;
begin
    mux_dut : entity work.mux(behav)
        port map ( a, b, sel );

    stimulus : process is
    begin
        a <= '0'; b <= '0'; sel <= '0'; wait for 20 ns;
        a <= '0'; b <= '0'; sel <= '1'; wait for 20 ns;
        a <= '0'; b <= '1'; sel <= '0'; wait for 20 ns;
        a <= '0'; b <= '1'; sel <= '1'; wait for 20 ns;
        a <= '1'; b <= '0'; sel <= '0'; wait for 20 ns;
        a <= '1'; b <= '0'; sel <= '1'; wait for 20 ns;
        a <= '1'; b <= '1'; sel <= '0'; wait for 20 ns;
        a <= '1'; b <= '1'; sel <= '1'; wait for 20 ns;
        wait;   -- suspend process indefinitely
    end process stimulus;
end architecture test_mux;

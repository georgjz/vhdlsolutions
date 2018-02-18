-- test bench for the solution of exercise 12, chapter 3

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_test_bench is
end entity counter_test_bench;

architecture test_counter of counter_test_bench is
    signal clk : std_ulogic := '0';
    signal result : natural := 0;
begin
    counter_dut : entity work.counter(behav)
        port map ( clk, result );

    stimulus : process is
    begin
        -- count down 20 times
        for i in 0 to 20 loop
            clk <= '1'; wait for 10 ns;
            clk <= '0'; wait for 10 ns;
        end loop;
        wait;       -- suspend indefinetly
    end process stimulus;
end architecture test_counter;

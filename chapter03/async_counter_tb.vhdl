-- test bench for the solution of exercise 12, chapter 3

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity async_counter_test_bench is
end entity async_counter_test_bench;

architecture test_counter of async_counter_test_bench is
    signal clk, load_en : std_ulogic := '0';
    signal data_in, result : natural := 0;
begin
    counter_dut : entity work.async_counter(behav)
        port map ( clk, data_in, load_en, result );

    stimulus : process is
    begin
        wait for 20 ns;
        -- count down 10 times
        for i in 0 to 10 loop
            clk <= '1'; wait for 10 ns;
            clk <= '0'; wait for 10 ns;
        end loop;
        -- reset asynchronous to 13
        load_en <= '1'; data_in <= 13; wait for 10 ns;
        load_en <= '0'; wait for 5 ns;
        -- count down another 10 times
        for i in 0 to 10 loop
            clk <= '1'; wait for 10 ns;
            clk <= '0'; wait for 10 ns;
        end loop;
        wait;       -- suspend indefinetly
    end process stimulus;
end architecture test_counter;

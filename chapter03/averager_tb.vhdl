-- test bench for the solution to exercise 14, chapter 3

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity averager_test_bench is
end entity averager_test_bench;

architecture test_averager of averager_test_bench is
    signal clk : std_ulogic := '0';
    signal data_in : real := 0.0;
    signal data_out : real;
begin
    averager_dut : entity work.averager(behav)
        port map ( clk, data_in, data_out );

    stimulus : process is
        variable test_value : real := 2.0;
    begin
        -- sum of squares
        for i in 0 to 31 loop
            data_in <= test_value * test_value;
            clk <= '1'; wait for 10 ns;
            clk <= '0'; wait for 10 ns;
            test_value := test_value + 1.0;
        end loop;
        wait;    -- suspend indefinetly
    end process stimulus;
end architecture test_averager;

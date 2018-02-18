-- test bench for the solution of exercise 10, chapter 3

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity limiter_test_bench is
end entity limiter_test_bench;

architecture test_limiter of limiter_test_bench is
    signal data_in, lower, upper, data_out : integer := 0;
    signal out_of_limits : std_ulogic := 'U';
begin
    limiter_dut : entity work.limiter(behav)
        port map ( data_in, lower, upper, data_out, out_of_limits );

    stimulus : process is
    begin
        -- test 10 values
        data_in <= 6; lower <= 0; upper <= 10; wait for 10 ns;
        data_in <= 6; lower <= 0; upper <=  5; wait for 10 ns;
        data_in <= 3; lower <= 0; upper <=  5; wait for 10 ns;
        data_in <= 3; lower <= 4; upper <= 10; wait for 10 ns;
        data_in <= 4; lower <= 4; upper <=  6; wait for 10 ns;
        data_in <= 4; lower <= 0; upper <=  3; wait for 10 ns;
        data_in <= 8; lower <= 0; upper <=  7; wait for 10 ns;
        data_in <= 8; lower <= 9; upper <= 10; wait for 10 ns;
        data_in <= 1; lower <= 0; upper <=  2; wait for 10 ns;
        data_in <= 1; lower <= 0; upper <=  1; wait for 10 ns;
        wait;   -- suspend indefinetly
    end process stimulus;
end architecture test_limiter;

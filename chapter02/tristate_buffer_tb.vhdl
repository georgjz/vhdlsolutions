-- test bench for the solution of exercise 13, chapter 2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tristate_buffer_test_bench is
end entity tristate_buffer_test_bench;

architecture test_tristate_buffer of tristate_buffer_test_bench is
    -- make sure all signals have a defined state
    signal data_in, en, data_out : std_ulogic := 'Z';
begin

    tristate_buffer_dut : entity work.tristate_buffer(behav)
        port map ( data_in, en, data_out );

    stimulus : process is
    begin
        -- test normal operation
        data_in <= 'L'; en <= '0'; wait for 10 ns;
        data_in <= '0'; en <= '1'; wait for 10 ns;
        data_in <= 'H'; en <= 'L'; wait for 10 ns;
        data_in <= '1'; en <= 'H'; wait for 10 ns;
        -- test for "invalid" input
        data_in <= 'U'; en <= '1'; wait for 10 ns;
        data_in <= 'Z'; en <= 'H'; wait for 10 ns;
        wait;
    end process stimulus;
    
end architecture test_tristate_buffer;

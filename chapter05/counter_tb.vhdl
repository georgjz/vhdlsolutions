-- test bench for the solution of exercise 20, chapter 5

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_test_bench is
end entity counter_test_bench;

architecture test_counter of counter_test_bench is
    signal clk, load_en : std_ulogic := '0';
    signal data_in, result : std_ulogic_vector(3 downto 0);
begin
    counter_dut : entity work.counter(behav)
        port map ( clk, load_en, data_in, result );

    stimulus : process is
    begin
        -- count down 20 times
        for i in 0 to 20 loop
            clk <= '1'; wait for 10 ns;
            clk <= '0'; wait for 10 ns;
        end loop;
        -- test async load
        data_in <= "1010";
        load_en <= '1'; wait for 10 ns;
        load_en <= '0';
        -- count down 20 times
        for i in 0 to 20 loop
            clk <= '1'; wait for 10 ns;
            clk <= '0'; wait for 10 ns;
        end loop;
        wait;       -- suspend indefinetly
    end process stimulus;
end architecture test_counter;

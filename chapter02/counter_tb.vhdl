-- test bench for the solution of exercise 9, chapter 2

entity counter_test_bench is
end entity counter_test_bench;

architecture test_counter of counter_test_bench is
    signal clk : bit;
    signal q : integer := 0;
begin
    counter_dut : entity work.counter(behav)
        port map ( clk, q );

    stimulus : process is
    begin
        -- run 10 test clock cycles
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 10 ns;
        wait;
    end process stimulus;
end architecture test_counter;

-- test bench for the solution of exercise 11, chapter 2

entity integrator_test_bench is
end entity integrator_test_bench;

architecture test_integrator of integrator_test_bench is
    signal clk : bit;
    signal data_in, data_out : real;
begin
    integrator_dut : entity work.integrator(behav)
        port map ( clk, data_in, data_out );

    stimulus : process is
    begin
        -- test with five number
        data_in <= 3.5; clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 5 ns;
        data_in <= 6.7; clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 5 ns;
        data_in <= -4.9; clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 5 ns;
        data_in <= 1.1; clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 5 ns;
        data_in <= 8.3; clk <= '1'; wait for 10 ns;
        clk <= '0'; wait for 5 ns;
        wait;
    end process stimulus;
end architecture test_integrator;

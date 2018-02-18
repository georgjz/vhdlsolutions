-- test bench for the solution of exercise 11, chapter 3

entity floatALU_test_bench is
end entity floatALU_test_bench;

architecture test_floatALU of floatALU_test_bench is
    signal x, y, z : real := 0.0;
    signal f1, f0 : bit := '0';
begin
    floatALU_dut : entity work.floatALU(behav)
        port map ( x, y, f1, f0, z );

    stimulus : process is
    begin
        -- perform 2 caculations per operation
        x <= 2.5; y <= 7.6; f1 <= '0'; f0 <= '0'; wait for 10 ns;
        x <= 6.7; y <= 8.1; f1 <= '0'; f0 <= '0'; wait for 10 ns;
        x <= 3.4; y <= 1.9; f1 <= '0'; f0 <= '1'; wait for 10 ns;
        x <= 0.9; y <= 3.8; f1 <= '0'; f0 <= '1'; wait for 10 ns;
        x <= 9.1; y <= 2.7; f1 <= '1'; f0 <= '0'; wait for 10 ns;
        x <= 2.4; y <= 3.5; f1 <= '1'; f0 <= '0'; wait for 10 ns;
        x <= 4.9; y <= 1.2; f1 <= '1'; f0 <= '1'; wait for 10 ns;
        x <= 2.2; y <= 6.9; f1 <= '1'; f0 <= '1'; wait for 10 ns;
        wait;
    end process stimulus;
end architecture test_floatALU;

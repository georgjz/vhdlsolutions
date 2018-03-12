-- test bench for the solution of exercise 10, chapter 2

entity simpleALU_test_bench is
end entity simpleALU_test_bench;

architecture test_simpleALU of simpleALU_test_bench is
    signal x, y, result : integer;
    signal f : bit;
begin

    simpleALU_dut : entity work.simpleALU(behav)
        port map ( x, y, f, result );

    stimulus : process is
    begin
        x <= 5; y <= 1; f <= '0'; wait for 5 ns;
        x <= 6; y <= 1; f <= '1'; wait for 5 ns;
        x <= 7; y <= 2; f <= '0'; wait for 5 ns;
        x <= 8; y <= 2; f <= '1'; wait for 5 ns;
        x <= 9; y <= 3; f <= '0'; wait for 5 ns;
        x <= 1; y <= 3; f <= '1'; wait for 5 ns;
        x <= 2; y <= 4; f <= '0'; wait for 5 ns;
        x <= 3; y <= 4; f <= '1'; wait for 5 ns;
        x <= 4; y <= 5; f <= '0'; wait for 5 ns;
        x <= 5; y <= 5; f <= '1'; wait for 5 ns;
        x <= 6; y <= 6; f <= '0'; wait for 5 ns;
        x <= 7; y <= 6; f <= '1'; wait for 5 ns;
        x <= 8; y <= 7; f <= '0'; wait for 5 ns;
        x <= 9; y <= 7; f <= '1'; wait for 5 ns;
        x <= 0; y <= 8; f <= '0'; wait for 5 ns;
        x <= 1; y <= 8; f <= '1'; wait for 5 ns;
        x <= 2; y <= 9; f <= '0'; wait for 5 ns;
        x <= 3; y <= 9; f <= '1'; wait for 5 ns;
        x <= 4; y <= 0; f <= '0'; wait for 5 ns;
        x <= 5; y <= 0; f <= '1'; wait for 5 ns;
        wait;
    end process stimulus;
    
end architecture test_simpleALU;

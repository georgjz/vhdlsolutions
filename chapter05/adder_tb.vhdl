-- test bench for the solution of exercise 23, chapter 5

entity adder_tb is
end entity adder_tb;

architecture test_adder of adder_tb is
    signal a, b, s : integer := 0;
begin

    dut : entity work.adder(behav)
        port map ( a, b, s );

    stimulus : process is
    begin
        a <= 3; b <= 6; wait for 5 ns;
        a <= 4; b <= 5; wait for 5 ns;
        a <= 5; b <= 8; wait for 5 ns;
        a <= 6; wait for 5 ns;
        a <= 3; wait for 5 ns;
        a <= 1; wait for 5 ns;
        b <= 6; wait for 5 ns;
        a <= 1; b <= 2; wait for 5 ns;
        a <= 2; b <= 1; wait for 5 ns;
        a <= 9; b <= 9; wait for 5 ns;
        wait;
    end process stimulus;

end architecture test_adder;

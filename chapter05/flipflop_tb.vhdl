-- test bench for the solution of exercise 22, chapter 5

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop_tb is
end entity flipflop_tb;

architecture test_flipflop of flipflop_tb is
    signal d, clk, q : std_ulogic;
begin
    dut : entity work.flipflop(behav)
        port map ( d, clk, q );

    stimulus : process is
    begin
        -- check pulse width alone
        d <= '0';
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        d <= '1'; wait for 3 ns;
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        d <= '0'; wait for 3 ns;
        clk <= '0'; wait for 10 ns;

        -- set flip flop
        d <= '1'; wait for 3 ns;    -- setup for 3 ns
        clk <= '1'; wait for 2 ns;  -- clock impulse and wait for 2 ns
        d <= '0'; wait for 3 ns;
        clk <= '0'; wait for 10 ns;

        -- reset flip flop
        d <= '0'; wait for 3 ns;    -- setup for 3 ns
        clk <= '1'; wait for 2 ns;  -- clock impulse and wait for 2 ns
        d <= '1'; wait for 3 ns;
        clk <= '0'; wait for 10 ns;

        wait for 10 ns;

        -- ERRORS! Uncomment the lines below to test with your simulator
        -- for timing/metastability violations

        -- setup time violation
        -- d <= '0'; wait for 2 ns;
        -- clk <= '1'; wait for 2 ns;

        -- hold time violation
        -- d <= '0'; wait for 3 ns;
        -- clk <= '1'; wait for 1 ns;
        -- d <= '1'; wait for 4 ns;

        -- clock pulse width violation
        -- d <= '0'; wait for 3 ns;
        -- clk <= '1'; wait for 2 ns;
        -- d <= '1'; wait for 2 ns;
        -- clk <= '0'; wait for 1 ns;

        wait;
    end process stimulus;

end architecture test_flipflop;

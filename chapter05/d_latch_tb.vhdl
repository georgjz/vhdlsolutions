-- test bench for the solution of exercise 21, chapter 5
-- NOTE: use the argument --stop-time=100ns with GHDL

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_latch_tb is
end entity d_latch_tb;

architecture test_d_latch of d_latch_tb is
    signal d, en, q, q_n : std_ulogic := '0';
    constant T_pw : delay_length := 10 ns;
begin
    dut : entity work.d_latch(behav)
        port map ( d, en, q, q_n );

    clock_gen : process is
    begin
        en <= '1' after T_pw, '0' after 2*T_pw;
        wait until en = '0';
    end process clock_gen;

    stimulus : process is
    begin
        d <= '1'; wait for 5 ns;
        d <= '0'; wait for 7 ns;
        d <= '1'; wait for 12 ns;
        d <= '0'; wait for 4 ns;
        d <= '1'; wait for 20 ns;
        d <= '0'; wait;
    end process stimulus;

end architecture test_d_latch;

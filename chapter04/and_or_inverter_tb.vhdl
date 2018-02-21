-- test bench to the solution to exercise 12, chapter 4
-- this will test the module for 8- and 16-bit inputs

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_or_inverter_tb is
end entity and_or_inverter_tb;

architecture test_and_or_inverter of and_or_inverter_tb is
    signal a_8, b_8 : std_ulogic_vector(7 downto 0);
    signal a_16, b_16 : std_ulogic_vector(15 downto 0);
    signal y_8, y_16 : std_ulogic;
begin
    dut_8 : entity work.and_or_inverter(behav)
        port map ( a_8, b_8, y_8 );

    dut_16 : entity work.and_or_inverter(behav)
        port map ( a_16, b_16, y_16 );

    stimulus : process is
    begin
        a_8 <= X"00"; b_8 <= X"00";
        a_16 <= X"0000"; b_16 <= X"0000";
        wait for 10 ns;

        a_8 <= X"ff"; b_8 <= X"ff";
        a_16 <= X"ffff"; b_16 <= X"ffff";
        wait for 10 ns;

        a_8 <= X"0f"; b_8 <= X"f0";
        a_16 <= X"ff0f"; b_16 <= X"fff0";
        wait for 10 ns;

        a_8 <= X"ab"; b_8 <= X"cd";
        a_16 <= X"abef"; b_16 <= X"cd12";
        wait for 10 ns;

        a_8 <= X"45"; b_8 <= X"e3";
        a_16 <= X"fe01"; b_16 <= X"efdc";
        wait for 10 ns;
        wait;
    end process stimulus;
end architecture test_and_or_inverter;

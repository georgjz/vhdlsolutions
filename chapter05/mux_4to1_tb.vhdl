-- test bench for the solution of exercise 19, chapter 5

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1_tb is
end entity mux_4to1_tb;

architecture test_mux_4to1 of mux_4to1_tb is
    signal data_in : std_ulogic_vector(3 downto 0);
    signal sel : std_ulogic_vector(1 downto 0);
    signal z : std_ulogic;
begin
    mux_4to1_dut : entity work.mux_4to1(behav)
        port map ( a0 => data_in(0),
                   a1 => data_in(1),
                   a2 => data_in(2),
                   a3 => data_in(3),
                   s0 => sel(0), s1 => sel(1),
                   z => z );

    stimulus : process is
    begin
        data_in <= "0101";
        sel <= "00"; wait for 10 ns;
        sel <= "01"; wait for 10 ns;
        sel <= "10"; wait for 10 ns;
        sel <= "11"; wait for 10 ns;

        data_in <= "0110";
        sel <= "00"; wait for 10 ns;
        sel <= "01"; wait for 10 ns;
        sel <= "10"; wait for 10 ns;
        sel <= "11"; wait for 10 ns;

        wait;
    end process stimulus;
end architecture test_mux_4to1;

-- test bench for the solution of exercise 10, chapter 4

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_test_bench is
end entity encoder_test_bench;

architecture test_encoder of encoder_test_bench is
    signal data_in : std_ulogic_vector(15 downto 0) := X"0000";
    signal index : natural range 0 to 15 := 0;
    signal bit_set : std_ulogic := '0';
begin
    encoder_dut : entity work.encoder(behav)
        port map ( data_in, index, bit_set );

    stimulus : process is
    begin
        -- test 10 values
        data_in <= X"0001"; wait for 10 ns;
        data_in <= X"000f"; wait for 10 ns;
        data_in <= X"001d"; wait for 10 ns;
        data_in <= X"f000"; wait for 10 ns;
        data_in <= X"ffff"; wait for 10 ns;
        data_in <= X"aaaa"; wait for 10 ns;
        data_in <= X"3da0"; wait for 10 ns;
        data_in <= X"0000"; wait for 10 ns;
        data_in <= X"0004"; wait for 10 ns;
        data_in <= X"0000"; wait for 10 ns;
        wait;
    end process stimulus;
end architecture test_encoder;

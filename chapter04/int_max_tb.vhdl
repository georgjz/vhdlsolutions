-- test bench for the solution of exercise 11, chapter 4

library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.int_package.ALL;

entity int_max_tb is
end entity int_max_tb;

architecture test_int_max of int_max_tb is
    signal data_in : int_set(0 to 4);
    signal data_out : integer;
    signal valid_in : std_ulogic;
    signal data_empty : int_set(1 to 0);
    signal data_out_empty : integer;
    signal valid_empty : std_ulogic;
begin
    max_dut : entity work.maximum(behav)
        port map ( data_in, data_out, valid_in );

    empty_dut : entity work.maximum(behav)
        port map ( data_empty, data_out_empty, valid_empty );


    stimulus : process is
        -- test arrays/sets
        constant set1 : int_set := (4, 5, 6, 5, 3);
        constant set2 : int_set := (7, 6, 5, 10, 4);
        constant set3 : int_set := (-7, -6, -5, -10, -4);
        constant set4 : int_set(1 to 0) := (others => 0);
    begin
        data_in <= set1; wait for 10 ns;
        data_in <= set2; wait for 10 ns;
        data_in <= set3; wait for 10 ns;
        data_empty <= set4; wait for 10 ns;
        wait;
    end process stimulus;
end architecture test_int_max;

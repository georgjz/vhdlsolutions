-- test bench for solution to exercise 13, chapter 4
-- 3 to 8 decoder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_3to8_tb is
end entity decoder_3to8_tb;

architecture test_decoder of decoder_3to8_tb is
    signal sel : std_ulogic_vector(2 downto 0);
    signal Tpd : time := 1.5 ns;
    signal d_out, expected_out : std_ulogic_vector(7 downto 0);
    -- record with test data
    type test_stimulus is record
        stimulus : std_ulogic_vector(2 downto 0);
        prop_delay : time;
        result : std_ulogic_vector(7 downto 0);
    end record test_stimulus;
    -- array declaration
    type test_array is array(integer range <>) of test_stimulus;
    constant tests : test_array(0 to 7) := (
        ("000", 1.6 ns, "00000001"),
        ("001", 1.6 ns, "00000010"),
        ("010", 1.7 ns, "00000100"),
        ("011", 1.8 ns, "00001000"),
        ("100", 1.9 ns, "00010000"),
        ("101", 2.5 ns, "00100000"),
        ("110", 2.6 ns, "01000000"),
        ("111", 2.7 ns, "10000000")
    );

begin
    decoder_dut : entity work.decoder_3to8(behav)
        port map ( sel, d_out, Tpd );

    stimulus : process is
    begin
        for i in 0 to 7 loop
            Tpd <= tests(i).prop_delay;
            sel <= tests(i).stimulus;
            expected_out <= tests(i).result;
            wait for 10 ns;
        end loop;
        wait;
    end process stimulus;
end architecture test_decoder;

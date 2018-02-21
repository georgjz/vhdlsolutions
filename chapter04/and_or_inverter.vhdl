-- solution to exercise 12, chapter 4
-- NOTE: GHDL does not seem to support the logical unitary operators defined
--       in VHDL-2008 yet, so I used Xilinx Vivado to test this, thus the
--       different waveform file. 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_or_inverter is
    port ( a, b : in std_ulogic_vector;
           y : out std_ulogic );
end entity and_or_inverter;

-- behavioral body
architecture behav of and_or_inverter is
    signal result : std_ulogic;
begin
    behavioral : process ( a, b ) is
    begin
        result <= not (or (a and b));
        y <= result;
    end process behavioral;
end architecture behav;

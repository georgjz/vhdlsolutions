-- solution to exercise 13, chapter 4
-- 3 to 8 decoder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_3to8 is
    port ( sel : in std_ulogic_vector(2 downto 0);
           d_out : out std_ulogic_vector(7 downto 0);
           prop_delay : in time );
end entity decoder_3to8;

-- behavioral body
architecture behav of decoder_3to8 is
    signal temp : std_ulogic_vector(7 downto 0);
begin
    behavioral : process (sel) is
    begin
        case sel is
            when "000" => temp <= "00000001";
            when "001" => temp <= "00000010";
            when "010" => temp <= "00000100";
            when "011" => temp <= "00001000";
            when "100" => temp <= "00010000";
            when "101" => temp <= "00100000";
            when "110" => temp <= "01000000";
            when "111" => temp <= "10000000";
            when others => temp <= "11111111";
        end case;
        d_out <= temp after prop_delay;
    end process behavioral;
end architecture behav;

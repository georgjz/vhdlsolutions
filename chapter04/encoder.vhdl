-- solution to exercise 10, chapter 4
-- 16-element encoder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder is
    port ( data_in : in std_ulogic_vector(15 downto 0);
           index_out : out natural range 0 to 15;
           bit_set : out std_ulogic );
end entity encoder;

-- behavioral body
architecture behav of encoder is
begin
    encoder_behavioral : process ( data_in ) is
    begin
        -- reset output
        index_out <= 15;
        bit_set <= '0';
        -- look for set bit
        for i in 0 to 15 loop
            if data_in(i) = '1' or data_in(i) = 'H' then
                index_out <= i;
                bit_set <= '1';
                exit;
            end if;
        end loop;
    end process encoder_behavioral;
end architecture behav;

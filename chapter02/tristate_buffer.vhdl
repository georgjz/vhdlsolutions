-- solution for exercise 13, chapter 2
-- a simple tristate buffer

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tristate_buffer is
    port ( data_in, en : in std_ulogic;
           data_out : out std_ulogic );
end entity tristate_buffer;

architecture behav of tristate_buffer is
begin
    buff : process is
    begin
        if en = '1' or en = 'H' then
            if data_in = '0' or data_in = 'L' then
                data_out <= '0';
            elsif data_in = '1' or data_in = 'H' then
                data_out <= '1';
            else
                data_out <= 'X';
            end if;
        elsif en = '0' or en = 'L' then
            data_out <= 'Z';
        else
            data_out <= 'X';
        end if;
        wait on data_in, en;
    end process buff;
end architecture behav;

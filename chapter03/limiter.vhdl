-- solution to exercise 10, chapter 3
-- a limiter for integer input numbers

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity limiter is
    port ( data_in, lower, upper : in integer;
           data_out : out integer;
           out_of_limits : out std_ulogic );
end entity limiter;

-- behavioral body
architecture behav of limiter is
begin
    limit : process ( data_in, lower, upper ) is
    begin
        -- check lower limit
        if data_in < lower then
            data_out <= lower;      -- limit to lower boundry
            out_of_limits <= '1';   -- signal limited output
        -- check upper limit
        elsif data_in > upper then
            data_out <= upper;      -- limit to upper boundry
            out_of_limits <= '1';   -- signal limited output
        else
            data_out <= data_in;    -- value within boundry
            out_of_limits <= '0';
        end if;
    end process limit;
end architecture behav;

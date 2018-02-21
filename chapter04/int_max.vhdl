-- part of the solution of exercise 11, chapter 4

library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.int_package.ALL;

entity maximum is
    port ( vector_in : in int_set;
           data_out : out integer;
           valid_in : out std_ulogic ); -- will be false, when vector_in is empty
end entity maximum;

-- behavioral body
architecture behav of maximum is
begin
    maximum_behavioral : process ( vector_in ) is
        variable temp_max : integer := integer'low;
    begin
        -- reset temp variable
        temp_max := integer'low;
        -- test for empty array
        if vector_in'length = 0 then
            valid_in <= '0';
        else
            for i in vector_in'range loop
                if vector_in(i) > temp_max then
                    temp_max := vector_in(i);
                end if;
            end loop;
            data_out <= temp_max;
            valid_in <= '1';
        end if;
    end process maximum_behavioral;
end architecture behav;

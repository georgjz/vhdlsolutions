-- solution to exercise 14, chapter 3
-- real averager

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity averager is
    port ( clk : in std_ulogic;
           data_in : in real;
           data_out : out real );
end entity averager;

-- behavioral body
architecture behav of averager is
begin
    average : process ( clk ) is
        variable temp_sum, result : real := 0.0;
        variable count : integer := 0;
    begin
        if rising_edge(clk) then
            temp_sum := temp_sum + data_in;
            count := count + 1;
            if count = 16 then
                result := temp_sum / 16.0;
                count := 0;
                temp_sum := 0.0;
            end if;
        end if;
        data_out <= result;
    end process average;
end architecture behav;

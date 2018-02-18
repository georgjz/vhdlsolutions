-- solution to exercise 12, chapter 3
-- a 15 to 0 down-counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
    port ( clk : in std_ulogic;
           q : out natural );
end entity counter;

-- behavioral body
architecture behav of counter is
begin
    count : process ( clk ) is
        variable temp_count : natural := 15;
    begin
        if rising_edge(clk) then
            case temp_count is
                when 0 => temp_count := 15;
                when others => temp_count := temp_count - 1;
            end case;
        end if;
        q <= temp_count;
    end process count;
end architecture behav;

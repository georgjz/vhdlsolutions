-- solution to exercise 12, chapter 3
-- a 15 to 0 asynchronous down-counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity async_counter is
    port ( clk : in std_ulogic;
           data_in : in natural;
           load_en : in std_ulogic;
           q : out natural );
end entity async_counter;

-- behavioral body
architecture behav of async_counter is
begin
    count : process ( clk, load_en ) is
        variable temp_count : natural := 15;
    begin
        if rising_edge(load_en) then
            -- reject inputs greater than 15
            temp_count := data_in;
            -- if data_in < 16 then
            --     temp_count := data_in;
            -- end if;
        elsif rising_edge(clk) then
            case temp_count is
                when 0 => temp_count := 15;
                when others => temp_count := temp_count - 1;
            end case;
        end if;
        q <= temp_count;
    end process count;
end architecture behav;

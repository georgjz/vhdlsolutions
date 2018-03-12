-- solution to exercise 9, chapter 2
-- a simple clock-triggered counter

entity counter is
    port ( clk : in bit;
           q : out integer );
end entity counter;

-- behavioral body
architecture behav of counter is
begin

    count_up : process is
        variable temp_count : integer := 0;
    begin
        if clk = '1' then
            temp_count := temp_count + 1;
        end if;
        q <= temp_count;
        wait on clk;
    end process count_up;
    
end architecture behav;

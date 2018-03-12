-- solution to exercise 11, chapter 2
-- a integrator, maintains the sum of inputs

entity integrator is
    port ( clk : in bit;
           data_in : in real;
           data_out : out real );
end entity integrator;

-- behavioral body
architecture behav of integrator is
begin

    integrate : process is
        variable temp_sum : real := 0.0;
    begin
        if clk = '1' then
            temp_sum := temp_sum + data_in;
        end if;
        data_out <= temp_sum;
        wait on clk;
    end process integrate;
    
end architecture behav;

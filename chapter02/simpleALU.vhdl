-- solution to exercise 10, chapter 2
-- simple ALU-ish thing to perform basic arithmetic operations

entity simpleALU is
    port ( x, y : in integer;
           opcode : in bit;
           result : out integer );
end entity simpleALU;

-- behavioral body
architecture behav of simpleALU is
begin
    calculate : process is
    begin
        if opcode = '0' then
            result <= x + y;
        else
            result <= x - y;
        end if;
        wait on x, y, opcode;
    end process calculate;
end architecture behav;

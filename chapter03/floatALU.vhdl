-- solution to exercise 11, chapter 3
-- a simple ALU, that operates on floating-point inputs

entity floatALU is
    port ( x, y : in real;
           f1, f0 : in bit;
           z : out real );
end entity floatALU;

-- behavrioal body
architecture behav of floatALU is
begin
    calculate : process ( x, y, f1, f0 ) is
    begin
        -- I combine if and case statements on purpose here
        if f1 = '0' then
            case f0 is
                when '0' => z <= x + y;
                when '1' => z <= x - y;
            end case;
        else
            case f0 is
                when '0' => z <= x * y;
                when '1' => z <= x / y;
            end case;
        end if;
    end process calculate;
end architecture behav;

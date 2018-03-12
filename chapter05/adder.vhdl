-- solution to exercise 23, chapter 5
-- integer adder

entity adder is
    port ( a, b : in integer; s : out integer );
end entity adder;

-- behavioral body
architecture behav of adder is
begin
    
    add : process (a, b) is
        variable a_ready, b_ready : boolean := false;    -- will keep track if a input is ready
    begin
        if a'event then     -- a changed
            a_ready := true;
        end if;
        if b'event then     -- b changed
            b_ready := true;
        end if;
        if a_ready and b_ready then     -- both inputs ready
            s <= a + b;                 -- update output
            a_ready := false;
            b_ready := false;
        end if;
    end process add;

end architecture behav;

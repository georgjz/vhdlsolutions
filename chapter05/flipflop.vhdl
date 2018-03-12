-- solution to exercise 22, chapter 5
-- model for RS-Flipflop

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop is
    port ( d, clk : in std_ulogic;
           q : out std_ulogic );
end entity flipflop;

-- behavioral body
architecture behav of flipflop is
    signal intern : std_ulogic;
    constant T_w : delay_length := 5 ns;    -- minimum clock width
    constant T_su : delay_length := 3 ns;   -- setup time
    constant T_h : delay_length := 2 ns;    -- hold time
begin
    -- update the intern signal from d
    intern <= d;

    checkMetaStability : process is
    begin
        -- wait for clk to change
        wait on clk;
        
        -- check setup time
        assert intern'delayed'stable(T_su)
            report "Input signal changed during setup time!"
            severity failure;

        -- check hold time
        wait for T_h;
        assert intern'stable(T_h)
            report "Input signal changed during hold time!"
            severity failure;

        -- update output
        q <= intern;

        -- check pulse width
        wait for (T_w - T_h);
        assert clk'delayed'stable(T_w)
            report "Clock pulse width too short!"
            severity failure;

    end process checkMetaStability;

end architecture behav;

-- test bench to the solution of exercise 9, chapter 4

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity register_file_tb is
end register_file_tb;

architecture test_register_file of register_file_tb is
    signal data_in, data_out : std_ulogic_vector(31 downto 0);
    signal read_adr, write_adr : integer range 0 to 15 := 0;
    signal write_en : std_ulogic;
begin
    register_dut : entity work.register_file(behav)
        port map ( data_in, read_adr, write_adr, write_en, data_out );

    stimulus : process is
    begin
        data_in <= X"0a0aa0a0";
        write_adr <= 1;
        write_en <= '1'; wait for 10 ns;
        write_en <= '0'; wait for 10 ns;

        read_adr <= 1; wait for 10 ns;
        wait;
    end process stimulus;

end test_register_file;

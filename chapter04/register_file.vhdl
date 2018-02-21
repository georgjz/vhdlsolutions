-- solution to exercise 9, chapter 4

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file is
    port ( data_in : in std_ulogic_vector(31 downto 0);
           read_adr, write_adr : in integer range 0 to 15;
           write_en : in std_ulogic;
           data_out : out std_ulogic_vector(31 downto 0) );
end register_file;

-- behavioral body
architecture behav of register_file is
begin
    find_file : process ( read_adr, write_adr, write_en ) is
        subtype word is std_ulogic_vector(31 downto 0);
        -- array initialized to zero
        type register_data is array (0 to 15) of word;
        variable data : register_data :=
            ( X"0000_0000", X"0000_0000", X"0000_0000", X"0000_0000",
              X"0000_0000", X"0000_0000", X"0000_0000", X"0000_0000",
              X"0000_0000", X"0000_0000", X"0000_0000", X"0000_0000",
              X"0000_0000", X"0000_0000", X"0000_0000", X"0000_0000" );
    begin
        if write_en = '1' or write_en = 'H' then
            data(write_adr) := data_in;
        else
            data_out <= data(read_adr);
        end if;
    end process find_file;
end architecture behav;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity seven is --AMR HAMMAM 
	port(
		bcd : in std_logic_vector(3 downto 0);
		neg : in std_logic;
		minus : out std_logic;
		LED : out std_logic_vector(6 downto 0)
		);
end seven;

architecture arch of seven is

begin
	process(bcd)
	begin
		if(neg = '1') then
			minus <= '0';
		else
			minus <= '1';
		end if;
		case bcd is
		---if it doesn't work, mirror bits
		when "0000" =>
			LED <= "0000001";
		when "0001" =>
			LED <= "1001111";
		when "0010" =>
			LED <= "0010010";
		when "0011" =>
			LED <= "0000110";
		when "0100" =>
			LED <= "1001100";
		when "0101" =>
			LED <= "0100100";
		when "0110" =>
			LED <= "0100000";
		when "0111" =>
			LED <= "0001111";
		when "1000" =>
			LED <= "0000000";
		when "1001" =>
			LED <= "0000100";
		when others =>
			LED <= "1111111";
		end case;
	end process;
end arch;
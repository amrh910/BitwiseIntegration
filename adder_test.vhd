library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addertestbench is --AMR HAMMAM
end addertestbench;

architecture behav of addertestbench is
	signal a, b, cout : std_logic_vector(5 downto 0);
	signal op : std_logic_vector(0 downto 0);
	signal overflow : std_logic;

begin
	uut: entity work.adder
	port map(a, b, op(0), cout, overflow);

	test: process
	begin
		for op_o in 0 to 1 loop
			op <= std_logic_vector(to_signed(op_o, 1));
			for a_o in -32 to 31 loop
				a <= std_logic_vector(to_signed(a_o, 6));
				for b_o in -32 to 31 loop
					b <= std_logic_vector(to_signed(b_o, 6));
					wait for 1 ns;
				end loop;
			end loop;
		end loop;
		wait;
	end process;
end behav;
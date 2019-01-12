library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_intg is --AMR HAMMAM
end test_intg;

architecture arch_test of test_intg is
	component integration
	port(
		a,b : in std_logic_vector (5 downto 0);
		operation: in std_logic_vector(3 downto 0);
		power: in std_logic;
		overflow : out std_logic;
		negative : out std_logic;
		result: out std_logic_vector(5 downto 0)
		);
	end component;

	signal p0, p1 : std_logic_vector(5 downto 0);
	signal opOp : std_logic_vector(3 downto 0);
	signal powPow : std_logic;
	signal pout : std_logic_vector(5 downto 0);
	signal negNeg : std_logic;
	signal ovOv : std_logic;

begin

xx: integration port map(a => p0, b => p1, operation => opOp, power => powPow, overflow => ovOv, negative => negNeg, result => pout);

process
begin

p0 <= "000000";
p1 <= "000000";
opOp <= "0000";
powPow <= '0';

for I in 0 to 63 loop
	wait for 10 ns;
	for J in 0 to 63 loop
		wait for 10 ns;
		for K in 0 to 15 loop
			wait for 1 ns;
			powPow <= (not powPow);
			opOp <= opOp + "0001";
			wait for 1 ns;
			powPow <= (not powPow);
		end loop;
		powPow <= (not powPow);
		p1 <= p1 + "000001";
	end loop;
		p0 <= p0 + "000001";	
end loop;
report "Test done!" severity failure;
wait; 
end process;
end arch_test;
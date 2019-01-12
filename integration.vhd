library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity integration is --AMR HAMMAM
	port(
		a, b: in std_logic_vector(5 downto 0);
		operation: in std_logic_vector(3 downto 0);
		power: in std_logic;
		overflow : out std_logic;
		negative : out std_logic;
		result: out std_logic_vector(5 downto 0)
		);
end integration;

architecture arch of integration is

	component adder
		port(
			a, b : in std_logic_vector(5 downto 0);
            op : in std_logic;
            cout : out std_logic_vector(5 downto 0);
            overflow : out std_logic;
            signflipped : out std_logic_vector(5 downto 0)
			);
	end component;

	signal i0, i1 : std_logic_vector(5 downto 0);
	signal sub : std_logic_vector(5 downto 0);
	signal sum : std_logic_vector(5 downto 0);
	signal OV : std_logic;
	signal OV2 : std_logic;
	signal flippedover : std_logic_vector(5 downto 0);
begin
	i0 <= a;
	i1 <= b;
	addsub : adder port map(i0, i1, '0', sum, OV, flippedover);
	subadd : adder port map(i0, i1, '1', sub, OV2, flippedover);	

process(power)
	begin
	if(power = '1') then
		case operation is
			when "0000" =>
				result <= a and b;
				overflow <= '0';
				negative <= '0';
			when "0001" =>
				result <= a or b;
				overflow <= '0';
				negative <= '0';
			when "0010" =>
				result <= a xor b;
				overflow <= '0';
				negative <= '0';
			when "0011" =>
				result <= not a;
			when "0100" =>
				result <= to_stdlogicvector(to_bitvector(a) sll 1);
				overflow <= '0';
				negative <= '0';
			when "0101" =>
				result <= to_stdlogicvector(to_bitvector(a) srl 1);
				overflow <= '0';
				negative <= '0';
			when "0110" =>
				result <= to_stdlogicvector(to_bitvector(a) rol 1);
				overflow <= '0';
				negative <= '0';
			when "0111" =>
				result <= to_stdlogicvector(to_bitvector(a) ror 1);
				overflow <= '0';
				negative <= '0';
			when "1000" =>
				result <= sum;
				overflow <= ov;
				negative <= '0';
			when "1001" =>
				if(a<b) then
					result <= sub;
					negative <= '1';
					overflow <= '0';
				else
					result <= sub;
					negative <= '0';
				end if;
			when "1011" =>
				if(a<b) then
					result <= "000001";
				else
					result <= "000000";
				end if;
			when others => NULL;
		end case;
	--	wait on operation;
	end if;
end process;
end arch;
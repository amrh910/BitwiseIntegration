library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is --AMR HAMMAM
    port(
            a, b : in std_logic_vector(5 downto 0);
            op : in std_logic;
            cout : out std_logic_vector(5 downto 0);
            overflow : out std_logic;
            signflipped: out std_logic_vector(5 downto 0)
        );
end adder;

architecture arch of adder is
signal OV : std_logic;
signal i0, i1, temp2 : unsigned(6 downto 0);
signal pout : std_logic_vector(5 downto 0);
signal temp : unsigned(6 downto 0);

begin
    i0 <= resize(unsigned(a), 7);
    i1 <= resize(unsigned(b), 7);
    temp2 <= i0 + i1 when op = '0' else i0 - i1;
    ov <= std_logic(temp2(6));
    pout <= std_logic_vector(temp2(5 downto 0));
    cout <= pout;
    temp <= not(temp2 - "0000001");
    signflipped <= std_logic_vector(temp(5 downto 0));
    overflow <= OV;
end arch;
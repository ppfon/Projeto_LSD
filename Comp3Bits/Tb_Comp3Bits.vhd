library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_Comp3Bits is
end tb_Comp3Bits;

architecture teste of tb_Comp3Bits is

component Comp3Bits is 

	port 
	(
		a, b: in std_logic_vector(2 downto 0);
		maior, menor, igual: out std_logic
	);

end component;

signal fio_A, fio_B: std_logic_vector(2 downto 0);
signal fio_maior, fio_menor, fio_igual: std_logic;

begin

instancia_Comp3Bits: Comp3Bits port map(a=>fio_A,b=>fio_B,maior=>fio_maior, menor=>fio_menor,igual=>fio_igual);

-- Dados de entrada de 4 bits sÃ£o expressos em "hexadecimal" usando "x":
fio_A <= "000", "001" after 2 ns, "010" after 4 ns, "011" after 12 ns;
fio_B <= "001", "010" after 6 ns, "100" after 10 ns, "011" after 14 ns;
end teste;
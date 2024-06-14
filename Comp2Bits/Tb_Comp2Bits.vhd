library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_Comp2Bits is
end tb_Comp2Bits;

architecture teste of tb_Comp2Bits is

component Comp2Bits is 

	port 
	(
		a, b: in std_logic_vector(1 downto 0);
		maior, menor, igual: out std_logic
	);

end component;

signal fio_A, fio_B: std_logic_vector(1 downto 0);
signal fio_maior, fio_menor, fio_igual: std_logic;

begin

-- Note que o componente é instanciado com apenas 4 bits nas entradas para facilitar a simulação:
instancia_Comp2Bits: Comp2Bits port map(a=>fio_A,b=>fio_B,maior=>fio_maior, menor=>fio_menor,igual=>fio_igual);

-- Dados de entrada de 4 bits são expressos em "hexadecimal" usando "x":
fio_A <= "00", "10" after 4 ns, "01" after 8 ns, "11" after 12 ns;
fio_B <= "00", "01" after 2 ns, "10" after 6 ns, "01" after 10 ns;
end teste;
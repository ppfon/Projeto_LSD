-- Quartus II VHDL Template
-- Comparador 3 Bits

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Comp3Bits is

	port 
	(
		a, b: in std_logic_vector(2 downto 0);
		maior, menor, igual: out std_logic
	);

end Comp3Bits;

architecture Behavior of Comp3Bits is
begin
	
	maior <= '1' when A > B else '0'; -- andar_desejado > posição -> descendo
	menor <= '1' when A < B else '0'; -- andar_desejado < posição -> subindo
	igual <= '1' when A = B else '0'; -- andar_desejado = posição -> parado

-- ordem de saída: menor + igual + maior
-- 100 -> menor = subindo
-- 010 -> igual = parado
-- 001 -> maior = descendo


end Behavior;

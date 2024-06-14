library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Tb_BCD_7seg is
end Tb_BCD_7seg;

architecture teste of Tb_BCD_7seg is

	-- Declaração do componente a ser simulado:
	component BCD_7seg is

   port (
		entrada: in std_logic_vector (1 downto 0);
		saida:	out std_logic_vector (6 downto 0)
	);

	end component;

	-- Declaração dos "fios" internos necessários para injetar no componente os estímulos de simulação:
	signal fio_entrada: std_logic_vector(1 downto 0);
	signal fio_saida: std_logic_vector (6 downto 0);
 
begin
	-- Instancie o componente "BCD_7seg" declarado acima para simula��o, conectando-o aos "fios" com os estímulos:
	instancia_BCD_7seg : BCD_7seg
		port map(entrada => fio_entrada, saida => fio_saida);

		-- As próximas linhas criam os estímulos da simulação,
		-- A letra x"0" indica que os valores a seguir estão expressos em base hexadecimal
		
		fio_entrada <= "00", "01" after 2 ns, "10" after 4 ns, "11" after 6 ns;
		
end teste;









library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Tb_Decod4Bits is
end Tb_Decod4Bits;

architecture teste of Tb_Decod4Bits is

	-- Declaração do componente a ser simulado:
	component Decod4Bits is

   port (
		entrada: in std_logic_vector (3 downto 0);
		saida:	out std_logic_vector (1 downto 0)
	);

	end component;

	-- Declaração dos "fios" internos necessários para injetar no componente os estímulos de simulação:
	signal fio_entrada: std_logic_vector(3 downto 0);
	signal fio_saida: std_logic_vector (1 downto 0);
 
begin
	-- Instancie o componente "BCD_7seg" declarado acima para simulação, conectando-o aos "fios" com os estímulos:
	instancia_Decod4Bits : Decod4Bits
		port map(entrada => fio_entrada, saida => fio_saida);

		-- As próximas linhas criam os estímulos da simulação,
		-- A letra x"0" indica que os valores a seguir estão expressos em base hexadecimal
		
		fio_entrada <= "0000", "0100" after 2 ns, "1001" after 4 ns, "1100" after 6 ns, "1010" after 8 ns;
		
end teste;









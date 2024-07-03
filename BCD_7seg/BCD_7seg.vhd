-- Quartus II VHDL Template
-- BCD 7 seg

LIBRARY IEEE;
use ieee.std_logic_1164.all;


-- Testado e fornecido com pinagem para Kit Terasic Altera DE2:
Entity Bcd_7seg is
   port (
		entrada: in std_logic_vector (2 downto 0);
		saida:	out std_logic_vector (6 downto 0)
	);
end Bcd_7seg;

architecture with_select_bcd7seg of Bcd_7seg is
begin
  with entrada select
  saida <=  "1111110" when "001", --0
	    "0110000" when "010", --1
	    "1101101" when "011", --2
	    "1111001" when "100", --3
	    "0000000" when others;
				
end with_select_bcd7seg;

-- entrada: (001 = andar 0) ; (010 = andar 1) ; (011 = andar 2) ; (100 = andar 3)
				
				
		
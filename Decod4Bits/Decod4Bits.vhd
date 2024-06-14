-- Quartus II VHDL Template
-- Decodificador 4 Bits

LIBRARY IEEE;
use ieee.std_logic_1164.all;

Entity Decod4Bits is
   port (
		entrada: in std_logic_vector (3 downto 0);
		saida:	out std_logic_vector (1 downto 0)
	);
end Decod4Bits;

architecture with_select_BCD of Decod4Bits is
begin
  with entrada select
  saida <=  "00" when "0000", -- parado
	    "00" when "0100", -- parado
		 "10" when "1001", -- descendo
	    "01" when "1100", -- subindo
		 "00" when others;
end with_select_BCD;
		 
-- saída: (00 = parado) ; (01 = subindo) ; (10 = descendo)
-- bit(3) -> pino_parado (0 = parado ; 1 = movimento)
-- bit(2) -> maior (0 = menor/igual ; 1 = maior)
-- bit(1) -> igual (0 = maior/igual ; 1 = igual)
-- bit(0) -> menor (0 = maior/igual ; 1 = menor
				

-- Quartus II VHDL Template
-- Comparador 2 Bits

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Comp2Bits is

	port 
	(
		a, b: in std_logic_vector(1 downto 0);
		maior, menor, igual: out std_logic
	);

end Comp2Bits;

architecture Behavior of Comp2Bits is
begin
	
	maior <= '1' when A > B else '0';
	menor <= '1' when A < B else '0';
	igual <= '1' when A = B else '0';


end Behavior;

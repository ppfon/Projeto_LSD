LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RegW IS

	GENERIC (
		W : NATURAL := 4 -- Comprimento em bits do registrador
	);

	PORT (
		clock : IN STD_LOGIC; -- clock
		D : IN STD_LOGIC_VECTOR (W - 1 DOWNTO 0); -- entrada de dado D
		reset : IN STD_LOGIC; -- reset Q = '0'
		load : IN STD_LOGIC; -- permissão de carga
		Q : OUT STD_LOGIC_VECTOR (W - 1 DOWNTO 0) -- saída de dado armazenado Q
	);
END RegW;

ARCHITECTURE RTL OF RegW IS

BEGIN
	Q <= (OTHERS => '0') WHEN (reset = '1') ELSE
		D WHEN (rising_edge(clock) AND load = '1');
END RTL;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Controladora IS

	PORT (
	clock, reset, flag_presenca, desejado_igual_0, estado_emergencia: IN STD_LOGIC;
	andar_desejado : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	comp_desejado_posicao : IN STD_LOGIC_VECTOR(2 DOWNTO 0);

	load_andar_desejado, parado : OUT STD_LOGIC;
	ordem_leds : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END Controladora;

ARCHITECTURE arch OF Controladora IS

	TYPE estado IS (terreo, inicia_subindo, subindo, parado_andar, inicia_descendo, descendo);
	SIGNAL estado_atual, proximo_estado : estado;

BEGIN
	sequencial :
	PROCESS (reset, clock) IS
	BEGIN
		IF (RESET = '1') THEN
			estado_atual <= terreo;
		ELSIF (rising_edge(CLOCK)) THEN
			estado_atual <= proximo_estado;
		END IF;
	END PROCESS;

	combinacional :
	PROCESS (flag_presenca, desejado_igual_0, andar_desejado, comp_desejado_posicao, estado_emergencia, estado_atual) IS
	BEGIN
		--- Inicializando as variÃ¡veis
		ordem_leds <= "000";
		load_andar_desejado <= '0';
		parado <= '0';

		CASE estado_atual IS
			WHEN terreo => -- TÃ©rreo
				ordem_leds <= "100";
				load_andar_desejado <= '1';
				parado <= '1';

				IF (desejado_igual_0 = '0' AND estado_emergencia = '0') THEN
					proximo_estado <= inicia_subindo;
				elsif  (estado_emergencia = '0') then
					proximo_estado <= terreo;
				else
					proximo_estado <= terreo;
				end if;

			WHEN inicia_subindo => -- inicia subindo 
					ordem_leds <= '0' & andar_desejado;
					load_andar_desejado <= '0';
					parado <= '1';

				IF (flag_presenca = '0' AND estado_emergencia = '0') THEN
					proximo_estado <= subindo;
				elsif  (estado_emergencia = '0') then
					proximo_estado <= inicia_subindo;
				else
					proximo_estado <= inicia_subindo;
				end if;
					

			WHEN subindo => --  Subindo
					ordem_leds <= '0' & andar_desejado;
					load_andar_desejado <= '0';
					parado <= '0';

				IF (comp_desejado_posicao = "010" AND flag_presenca = '0' AND estado_emergencia = '0') THEN
					proximo_estado <= parado_andar;
				ELSIF (comp_desejado_posicao = "100" AND flag_presenca = '0' AND estado_emergencia = '0') THEN
					proximo_estado <= subindo;
				else
					proximo_estado <= subindo;
				end if;
			
			WHEN parado_andar => -- Parado (andar desejado)
					ordem_leds <= "100";
					load_andar_desejado <= '1';
					parado <= '1';

				IF (desejado_igual_0 = '1') THEN
					proximo_estado <= parado_andar;
				ELSIF (comp_desejado_posicao = "100" AND desejado_igual_0 = '0' AND estado_emergencia = '0') THEN
					proximo_estado <= inicia_subindo;
				ELSIF (comp_desejado_posicao = "001" AND desejado_igual_0 = '0' AND estado_emergencia = '0') THEN
					proximo_estado <= inicia_descendo;
				ELSE
					proximo_estado <= parado_andar;
				end if;

			WHEN inicia_descendo => -- inicia descendo
				ordem_leds <= '0' & andar_desejado;
				load_andar_desejado <= '0';
				parado <= '0';
			
			if (flag_presenca = '1' AND estado_emergencia = '0') then
				proximo_estado <= inicia_descendo;
			else
				proximo_estado <= descendo;
			end if;
			
			WHEN descendo => -- Descendo
				ordem_leds <= '0' & andar_desejado;
				load_andar_desejado <= '0';
				parado <= '0';
			
			if (comp_desejado_posicao = "010" AND flag_presenca = '0' AND estado_emergencia = '0') then
				proximo_estado <= parado_andar;
			elsif (comp_desejado_posicao = "001" AND estado_emergencia = '0') then
				proximo_estado <= descendo;
			else 
				proximo_estado <= descendo;
			end if;
		END CASE;
	END PROCESS;
END arch;
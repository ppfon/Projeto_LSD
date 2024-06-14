-- Quartus II VHDL Template
-- Controladora

library ieee;
use ieee.std_logic_1164.all;

entity Controladora is
    port (
		--lista de sensibilidade
        Reset, Clock, flag_falha, botao_emergencia   : in    std_logic; -- reset input
        flag_peso : in std_logic_vector (1 downto 0);
		--saídas do datapath  
		  andar_desejado : in std_logic_vector (1 downto 0);
		  flag_presença, desejado_igual_0 : in    std_logic;
		  comp_desejado_posicao : in std_logic_vector (2 downto 0);
		--saídas controladora
		  load_andar_desejado, parado, aciona_alarme : out std_logic;
		  ordem_LEDs : out std_logic_vector (2 downto 0); 
			z-- ordem LEDs:
			--000: andar 0 aceso
			--001: andar 1 aceso
			--010: andar 2 aceso
			--011: andar 3 aceso 
			--100: parado

    );
end Controladora;


architecture arch of controladora is

	type estado is (S0, S1, S2, S3, S4);
	signal estado_atual, proximo_estado: estado;

	begin
		sequencial: -- tem flip flop 
		process(RESET, CLOCK) is
		begin
			if(RESET = '1') then 
				estado_atual <= S0;
			elsif(rising_edge(CLOCK)) then
				estado_atual <= proximo_estado;
			end if;
		end process;
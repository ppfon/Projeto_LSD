-- Quartus II VHDL Template
-- Datapath
library ieee;
use ieee.std_logic_1164.all;


entity Datapath is

	port 
	(
		-- entradas externas
		presenca_porta: in std_logic;
		botao_andar_desejado, posicao_elevador: in std_logic_vector(3 downto 0);
		-- entradas fsm
		pino_load_andar_desejado, pino_parado, pino_aciona_alarme
		: in std_logic;
		pino_ordem_luz_painel_botoes: in std_logic_vector(2 downto 0); 
		
		-- saídas externas
		abre_fecha_porta, alarme_acionado, display_posicao 
		: out std_logic;
		luz_direcao, direcao_motor, luz_painel_botoes
		: out std_logic_vector(3 downto 0);
		-- saídas fsm
		pino_andar_desejado: out std_logic_vector(1 downto 0);
		pino_flag_presença, pino_desejado_igual_0
		: out std_logic;
		pino_comp_desejado_posicao: in std_logic_vector(2 downto 0);
	);

end Datapath;
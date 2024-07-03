-- Quartus II VHDL Template
-- Controladora

library ieee;
use ieee.std_logic_1164.all;

entity Controladora_alarme is
    port (
		-- Entradas
			clock, reset: in std_logic;
        flag_falha, botao_emergencia, flag_peso: in std_logic;
		-- Saídas
		  alarme_acionado, estado_emergencia: out std_logic
    );
end Controladora_alarme;

architecture arch of Controladora_alarme is

	type estado is (verifica_falha, emergencia);
	signal estado_atual, proximo_estado: estado;

	begin
		sequencial: 
		process(reset, clock) is
		begin
			if(RESET = '1') then 
				estado_atual <= verifica_falha;
			elsif(rising_edge(CLOCK)) then
				estado_atual <= proximo_estado;
			end if;
		end process;

	combinacional:
	process(flag_falha, flag_peso, botao_emergencia, estado_atual) is
	begin

	-- Inicialização das variáveis
	alarme_acionado <= '0';
	estado_emergencia <= '0';
	
	case estado_atual is
		when verifica_falha =>
			alarme_acionado <= '0';
			estado_emergencia <= '0';
			
			if(flag_peso = '1' OR flag_falha = '1' OR botao_emergencia = '1') then 
				proximo_estado <= emergencia;
			elsif(flag_peso = '0' AND flag_falha = '0' AND botao_emergencia = '0') then
				proximo_estado <= estado_atual;
			else
			    proximo_estado <= verifica_falha;
			end if;
		
		when others =>
			alarme_acionado <= '1';
			estado_emergencia <= '1';
			
			if(flag_peso = '1' OR flag_falha = '1' OR botao_emergencia = '1') then 
				proximo_estado <= emergencia;
			elsif (flag_peso = '0' AND flag_falha = '0' AND botao_emergencia = '0') then
				proximo_estado <= verifica_falha;
			else 
				proximo_estado <= emergencia;
			end if;
	end case;
end process;
end arch;
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY Sinalizadora_controle IS
    PORT (
        reset, clock : IN STD_LOGIC;
        flag_falha, botao_emergencia, flag_peso : IN STD_LOGIC;
        flag_presenca, desejado_igual_0, estado_emergencia : IN STD_LOGIC;
        andar_desejado : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        comp_desejado_posicao : IN STD_LOGIC_VECTOR(2 DOWNTO 0);

        aciona_alarme, load_andar_desejado, parado : OUT STD_LOGIC;
        ordem_leds : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END Sinalizadora_controle;

ARCHITECTURE RTL OF Sinalizadora_controle IS

    COMPONENT Controladora_alarme IS
        PORT (
            clock, reset : IN STD_LOGIC;
            flag_falha, botao_emergencia, flag_peso : IN STD_LOGIC;
            alarme_acionado, estado_emergencia : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT Controladora IS
        PORT (
            clock, reset, flag_presenca, desejado_igual_0, estado_emergencia : IN STD_LOGIC;
            andar_desejado : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            comp_desejado_posicao : IN STD_LOGIC_VECTOR(2 DOWNTO 0);

            load_andar_desejado, parado : OUT STD_LOGIC;
            ordem_leds : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL sig_estado_emergencia : STD_LOGIC;

BEGIN
    instancia_controladora_alarme : Controladora_alarme
    PORT MAP(
        clock => clock, reset => reset, flag_falha => flag_falha, botao_emergencia => botao_emergencia, flag_peso => flag_peso,
        alarme_acionado => aciona_alarme, estado_emergencia => sig_estado_emergencia
    );

    instancia_controladora : Controladora
    PORT MAP(
        clock => clock, reset => reset, flag_presenca => flag_presenca, desejado_igual_0 => desejado_igual_0,
        estado_emergencia => sig_estado_emergencia, andar_desejado => andar_desejado, comp_desejado_posicao => comp_desejado_posicao,
        load_andar_desejado => load_andar_desejado, parado => parado, ordem_leds => ordem_leds
    );

END RTL;
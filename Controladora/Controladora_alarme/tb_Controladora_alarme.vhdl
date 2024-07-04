LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY tb_Controladora_alarme IS
END tb_Controladora_alarme;

ARCHITECTURE Behavioral OF tb_Controladora_alarme IS

    -- Declaração do componente para a Unidade Sob Teste (UUT)
    COMPONENT Controladora_alarme
        PORT (
            clock : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            flag_falha : IN STD_LOGIC;
            botao_emergencia : IN STD_LOGIC;
            flag_peso : IN STD_LOGIC;
            alarme_acionado : OUT STD_LOGIC;
            estado_emergencia : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Sinais do testbench
    SIGNAL tb_clock : STD_LOGIC := '0';
    SIGNAL tb_reset : STD_LOGIC := '0';
    SIGNAL tb_flag_falha : STD_LOGIC := '0';
    SIGNAL tb_botao_emergencia : STD_LOGIC := '0';
    SIGNAL tb_flag_peso : STD_LOGIC := '0';
    SIGNAL tb_alarme_acionado : STD_LOGIC;
    SIGNAL tb_estado_emergencia : STD_LOGIC;

    -- Definição do período do clock
    CONSTANT clk_period : TIME := 10 ns;
BEGIN

    clk_process : PROCESS
    BEGIN
        WHILE TRUE LOOP
            tb_clock <= '0';
            WAIT FOR clk_period/2;
            tb_clock <= '1';
            WAIT FOR clk_period/2;
        END LOOP;
    END PROCESS;
    -- Instanciação da Unidade Sob Teste (UUT)
    uut : Controladora_alarme
    PORT MAP(
        clock => tb_clock,
        reset => tb_reset,
        flag_falha => tb_flag_falha,
        botao_emergencia => tb_botao_emergencia,
        flag_peso => tb_flag_peso,
        alarme_acionado => tb_alarme_acionado,
        estado_emergencia => tb_estado_emergencia
    );

    -- Processo de estímulo para aplicar vetores de teste
    stimulus_process : PROCESS
    BEGIN
        tb_reset <= '1';
        WAIT FOR 20 ns;
        tb_reset <= '0';

        -- Teste 1
        WAIT FOR clk_period * 2;

        -- Teste 2
        tb_flag_peso <= '1';
        WAIT FOR clk_period * 2;

        -- Teste 3
        tb_flag_peso <= '0';
        WAIT FOR clk_period * 2;

        -- Teste 4
        tb_botao_emergencia <= '1';
        WAIT FOR clk_period * 2;

        -- Teste 5
        tb_botao_emergencia <= '0';
        WAIT FOR clk_period * 2;

        -- Teste 6
        tb_flag_falha <= '1';
        WAIT FOR clk_period * 2;

        -- Teste 7
        tb_flag_falha <= '0';
        tb_botao_emergencia <= '1';
        WAIT FOR clk_period * 4;

        WAIT FOR 180 ns;

        -- Parar a simulação
        WAIT;
    END PROCESS;

END Behavioral;
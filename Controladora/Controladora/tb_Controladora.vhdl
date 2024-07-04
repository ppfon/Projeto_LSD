LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_Controladora IS
END tb_Controladora;

ARCHITECTURE Behavioral OF tb_Controladora IS

    -- Declaração do componente para a Unidade Sob Teste (UUT)
    COMPONENT Controladora
        PORT (
            clock : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            flag_presenca : IN STD_LOGIC;
            desejado_igual_0 : IN STD_LOGIC;
            estado_emergencia : IN STD_LOGIC;
            andar_desejado : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            comp_desejado_posicao : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            load_andar_desejado : OUT STD_LOGIC;
            parado : OUT STD_LOGIC;
            ordem_leds : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            estado_teste: out std_logic_vector(2 downto 0)
        );
    END COMPONENT;

    -- Sinais do testbench
    SIGNAL tb_clock : STD_LOGIC := '0';
    SIGNAL tb_reset : STD_LOGIC := '0';
    SIGNAL tb_flag_presenca : STD_LOGIC := '0';
    SIGNAL tb_desejado_igual_0 : STD_LOGIC := '0';
    SIGNAL tb_estado_emergencia : STD_LOGIC := '0';
    SIGNAL tb_andar_desejado : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL tb_comp_desejado_posicao : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    SIGNAL tb_load_andar_desejado : STD_LOGIC;
    SIGNAL tb_parado : STD_LOGIC;
    SIGNAL tb_ordem_leds : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL tb_estado_teste : STD_LOGIC_VECTOR(2 DOWNTO 0);

    -- Definição do período do clock
    CONSTANT clk_period : TIME := 10 ns;

BEGIN

    -- Instanciação da Unidade Sob Teste (UUT)
    uut : Controladora
    PORT MAP(
        clock => tb_clock,
        reset => tb_reset,
        flag_presenca => tb_flag_presenca,
        desejado_igual_0 => tb_desejado_igual_0,
        estado_emergencia => tb_estado_emergencia,
        andar_desejado => tb_andar_desejado,
        comp_desejado_posicao => tb_comp_desejado_posicao,
        load_andar_desejado => tb_load_andar_desejado,
        parado => tb_parado,
        ordem_leds => tb_ordem_leds,
        estado_teste => tb_estado_teste
    );

    -- Processo de clock
    clk_process : PROCESS
    BEGIN
        WHILE TRUE LOOP
            tb_clock <= '0';
            WAIT FOR clk_period / 2;
            tb_clock <= '1';
            WAIT FOR clk_period / 2;
        END LOOP;
    END PROCESS;

    -- Processo de estímulo para aplicar vetores de teste
    stimulus_process : PROCESS
    BEGIN
        -- Inicialização do reset
        tb_reset <= '1';
        WAIT FOR 20 ns;
        tb_reset <= '0';
        -- tb_desejado_igual_0 <= '1';
        -- WAIT FOR clk_period;

        -- Teste 1: Simulação do estado inicial (térreo)
        tb_desejado_igual_0 <= '1';
        WAIT FOR clk_period;

        -- Teste 2: Mudança para o estado "inicia_subindo"
        tb_desejado_igual_0 <= '0';
        tb_andar_desejado <= "01";
        tb_estado_emergencia <= '0';
        tb_flag_presenca <= '1';
        WAIT FOR clk_period*2;
        tb_flag_presenca <= '0';
        WAIT FOR clk_period;

        -- Teste 3: Mudança para o estado "subindo"
        tb_flag_presenca <= '0';
        tb_comp_desejado_posicao <= "100";
        WAIT FOR clk_period * 2;

        -- Teste 4: Chegada ao andar desejado
        tb_comp_desejado_posicao <= "010";
        WAIT FOR clk_period * 2;

        -- Teste 5: Mudança para o estado "parado_andar"
        tb_desejado_igual_0 <= '1';
        WAIT FOR clk_period * 2;

        -- Teste 6: Mudança para "inicia_descendo"
        tb_desejado_igual_0 <= '0';
        tb_comp_desejado_posicao <= "001";
        tb_flag_presenca <= '1';
        WAIT FOR clk_period * 2;

        -- Teste 7: Mudança para "descendo"
        tb_flag_presenca <= '0';
        tb_comp_desejado_posicao <= "001";
        WAIT FOR clk_period * 2;

        -- Teste 8: Chegada ao andar desejado descendo
        tb_comp_desejado_posicao <= "010";
        WAIT FOR clk_period * 2;

        -- Espera para que todos os testes sejam concluídos
        WAIT FOR 200 ns;

        -- Parar a simulação
        WAIT;
    END PROCESS;

END Behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_RegDeslocamento IS
END tb_RegDeslocamento;

ARCHITECTURE behavior OF tb_RegDeslocamento IS

    -- Declaração do componente para a Unidade Sob Teste (UUT)
    COMPONENT RegDeslocamento
    GENERIC (
        W : natural := 4  -- Largura de bits do registrador de deslocamento
    );
    PORT(
        clock   : IN std_logic;
        reset   : IN std_logic;
        load    : IN std_logic;
        shift   : IN std_logic;  -- 0 para deslocar à esquerda, 1 para deslocar à direita
        D       : IN std_logic_vector(W-1 DOWNTO 0);
        Q       : OUT std_logic_vector(W-1 DOWNTO 0)
    );
    END COMPONENT;

    -- Sinais do testbench
    SIGNAL fio_clock : std_logic := '0';
    SIGNAL fio_D     : std_logic_vector(3 DOWNTO 0) := (others => '0');
    SIGNAL fio_reset : std_logic := '0';
    SIGNAL fio_load  : std_logic := '0';
    SIGNAL fio_shift : std_logic := '0';  -- 0 para deslocar à esquerda, 1 para deslocar à direita
    SIGNAL fio_Q     : std_logic_vector(3 DOWNTO 0);

    -- Definição do período do clock
    CONSTANT clk_period : time := 10 ns;

BEGIN

    -- Instancia a Unidade Sob Teste (UUT)
    uut: RegDeslocamento
    GENERIC MAP (
        W => 4
    )
    PORT MAP (
        clock => fio_clock,
        D     => fio_D,
        reset => fio_reset,
        load  => fio_load,
        shift => fio_shift,
        Q     => fio_Q
    );

    -- Definição do processo do clock
    clock_process : PROCESS
    BEGIN
        fio_clock <= '0';
        WAIT FOR clk_period/2;
        fio_clock <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;

    -- Processo de estímulo
    stim_proc: PROCESS
    BEGIN
        -- Inicializa os sinais de entrada
        fio_reset <= '1';
        fio_load <= '0';
        fio_shift <= '0';
        fio_D <= "0000";
        WAIT FOR clk_period*2;

        -- Aplica reset e verifica se Q é resetado para 0
        fio_reset <= '1';
        WAIT FOR clk_period;

        -- Libera o reset e verifica se Q permanece 0
        fio_reset <= '0';
        WAIT FOR clk_period;

        -- Carrega um valor no registrador de deslocamento
        fio_D <= "1010";
        fio_load <= '1';
        WAIT FOR clk_period;
        
        -- Verifica se o valor foi carregado corretamente
        fio_load <= '0';
        WAIT FOR clk_period;

        -- Desloca à esquerda
        fio_shift <= '0';  -- Deslocar à esquerda
        WAIT FOR clk_period;

        -- Verifica se o deslocamento à esquerda foi realizado corretamente
        WAIT FOR clk_period;

        -- Desloca à direita
        fio_shift <= '1';  -- Deslocar à direita
        WAIT FOR clk_period;

        -- Verifica se o deslocamento à direita foi realizado corretamente
        WAIT FOR clk_period;

        -- Carrega outro valor no registrador de deslocamento
        fio_D <= "1100";
        fio_load <= '1';
        WAIT FOR clk_period;
        
        -- Verifica se o valor foi carregado corretamente
        fio_load <= '0';
        WAIT FOR clk_period;

        -- Testa reset enquanto load está ativo
        fio_reset <= '1';
        WAIT FOR clk_period;

        -- Libera reset e garante que Q permanece 0
        fio_reset <= '0';
        WAIT FOR clk_period;

        -- Testa o comportamento do clock sem load ou reset
        fio_load <= '0';
        fio_D <= "1111";
        WAIT FOR clk_period;

        -- Espera um pouco antes de finalizar a simulação
        WAIT FOR clk_period;

        -- Finaliza a simulação
        WAIT;
    END PROCESS;

END behavior;

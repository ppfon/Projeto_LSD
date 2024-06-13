LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_RegW IS
END tb_RegW;

ARCHITECTURE behavior OF tb_RegW IS

    -- Declaração do componente para a Unidade Sob Teste (UUT)
    COMPONENT RegW
        GENERIC (
            W : NATURAL := 4
        );
        PORT (
            clock : IN STD_LOGIC;
            D : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
            reset : IN STD_LOGIC;
            load : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR(W - 1 DOWNTO 0)
        );
    END COMPONENT;

    -- Sinais do testbench
    SIGNAL fio_clock : STD_LOGIC := '0';
    SIGNAL fio_D : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL fio_reset : STD_LOGIC := '0';
    SIGNAL fio_load : STD_LOGIC := '0';
    SIGNAL fio_Q : STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- Definição do período do clock
    CONSTANT clk_period : TIME := 10 ns;

BEGIN

    -- Instancia a Unidade Sob Teste (UUT)
    uut : RegW
    GENERIC MAP(
        W => 4
    )
    PORT MAP(
        clock => fio_clock,
        D => fio_D,
        reset => fio_reset,
        load => fio_load,
        Q => fio_Q
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
    stim_proc : PROCESS
    BEGIN
        -- Inicializa os sinais de entrada
        fio_reset <= '1';
        fio_load <= '0';
        fio_D <= "0000";
        WAIT FOR clk_period * 2;

        -- Aplica reset e verifica se Q é resetado para 0
        fio_reset <= '1';
        WAIT FOR clk_period;

        -- Libera o reset e verifica se Q permanece 0
        fio_reset <= '0';
        WAIT FOR clk_period;

        -- Carrega um valor no registrador
        fio_D <= "1010";
        fio_load <= '1';
        WAIT FOR clk_period;

        -- Muda D e verifica se Q mantém seu valor quando load está baixo
        fio_load <= '0';
        fio_D <= "0101";
        WAIT FOR clk_period;

        -- Carrega outro valor no registrador
        fio_load <= '1';
        fio_D <= "1100";
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
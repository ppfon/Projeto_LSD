LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY tb_Deco_3bits IS
END tb_Deco_3bits;

ARCHITECTURE Behavioral OF tb_Deco_3bits IS

    -- Declaração do componente para a Unidade Sob Teste (UUT)
    COMPONENT Deco_3bits
        PORT (
            input : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;

    -- Sinais do testbench
    SIGNAL tb_input : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
    SIGNAL tb_output : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

    -- Instanciação da Unidade Sob Teste (UUT)
    uut : Deco_3bits
    PORT MAP(
        input => tb_input,
        output => tb_output
    );

    -- Processo de estímulo para aplicar vetores de teste
    stimulus_process : PROCESS
    BEGIN
        -- Aplicar cada entrada possível e aguardar um curto período
        tb_input <= "000";
        WAIT FOR 10 ns;
        tb_input <= "001";
        WAIT FOR 10 ns;
        tb_input <= "010";
        WAIT FOR 10 ns;
        tb_input <= "011";
        WAIT FOR 10 ns;
        tb_input <= "100";
        WAIT FOR 10 ns;
        tb_input <= "101";
        WAIT FOR 10 ns;
        tb_input <= "110";
        WAIT FOR 10 ns;
        tb_input <= "111";
        WAIT FOR 10 ns;

        -- Parar a simulação
        WAIT;
    END PROCESS;

END Behavioral;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY RegDeslocamento IS
    GENERIC (
        W : NATURAL := 4 -- Largura de bits do registrador de deslocamento
    );
    PORT (
        clock : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        load : IN STD_LOGIC;
        shift : IN STD_LOGIC; -- 0 para deslocar à esquerda, 1 para deslocar à direita
        D : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        Q : OUT STD_LOGIC_VECTOR(W - 1 DOWNTO 0)
    );
END RegDeslocamento;

ARCHITECTURE RTL OF RegDeslocamento IS

    -- Sinal interno para armazenar o estado atual do registrador de deslocamento
    SIGNAL fio_data : STD_LOGIC_VECTOR(W - 1 DOWNTO 0);

BEGIN

    PROCESS (clock, reset)
    BEGIN
        IF reset = '1' THEN
            -- Quando o reset está ativo, limpa o registrador de deslocamento
            fio_data <= (OTHERS => '0');
        ELSIF rising_edge(clock) THEN
            IF load = '1' THEN
                -- Carrega os dados de entrada 'D' no registrador de deslocamento
                fio_data <= D;
            ELSE
                IF shift = '0' THEN -- Deslocar à esquerda
                    -- Desloca os dados para a esquerda e preenche o bit da direita com '0'
                    fio_data <= fio_data(W - 2 DOWNTO 0) & '0';
                ELSE -- Deslocar à direita
                    -- Desloca os dados para a direita e preenche o bit da esquerda com '0'
                    fio_data <= '0' & fio_data(W - 1 DOWNTO 1);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- Atribui o estado atual do registrador de deslocamento à saída 'Q'
    Q <= fio_data;

END RTL;
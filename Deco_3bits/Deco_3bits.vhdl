LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY Deco_3bits IS
    PORT (
        input : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END Deco_3bits;

ARCHITECTURE Behavioral OF Deco_3bits IS
BEGIN
    PROCESS (input)
    BEGIN
        CASE input IS
            WHEN "000" =>
                output <= "0000"; -- Nenhum LED aceso
            WHEN "001" =>
                output <= "0001"; -- LED 1 aceso
            WHEN "010" =>
                output <= "0010"; -- LED 2 aceso
            WHEN "011" =>
                output <= "0100"; -- LED 3 aceso
            WHEN "100" =>
                output <= "1000"; -- LED 4 aceso
            WHEN OTHERS =>
                output <= "0000"; -- Nenhum LED aceso para entradas 101, 110, 111
        END CASE;
    END PROCESS;
END Behavioral;
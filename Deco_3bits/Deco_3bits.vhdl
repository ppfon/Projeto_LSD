LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY Deco_3bits IS
    PORT (
        input : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		  Q0, Q1, Q2, Q3: OUT STD_LOGIC
        -- output : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END Deco_3bits;

ARCHITECTURE Behavioral OF Deco_3bits IS
BEGIN
    PROCESS (input)
    BEGIN
        CASE input IS
            WHEN "000" =>
               -- Nenhum LED aceso 
					 Q0 <= '0'; 
					 Q1 <= '0'; 
					 Q2 <= '0'; 
					 Q3 <= '0'; 
            WHEN "001" =>
					-- LED 1 aceso
					 Q0 <= '1'; 
					 Q1 <= '0'; 
					 Q2 <= '0'; 
					 Q3 <= '0'; 
            WHEN "010" =>
					-- LED 2 aceso
					 Q0 <= '0'; 
					 Q1 <= '1'; 
					 Q2 <= '0'; 
					 Q3 <= '0'; 
            WHEN "011" =>
					-- LED 3 aceso
					 Q0 <= '0'; 
					 Q1 <= '0'; 
					 Q2 <= '1'; 
					 Q3 <= '0';
            WHEN "100" =>
            -- LED 4 aceso
					 Q0 <= '0'; 
					 Q1 <= '0'; 
					 Q2 <= '0'; 
					 Q3 <= '1';
            WHEN OTHERS =>
            -- Nenhum LED aceso para entradas 101, 110, 111
					Q0 <= '0'; 
					Q1 <= '0'; 
					Q2 <= '0'; 
					Q3 <= '0'; 
        END CASE;
    END PROCESS;
END Behavioral;

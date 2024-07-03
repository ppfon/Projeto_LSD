-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "07/02/2024 23:53:19"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Sinalizadora_controle IS
    PORT (
	reset : IN std_logic;
	clock : IN std_logic;
	flag_falha : IN std_logic;
	botao_emergencia : IN std_logic;
	flag_peso : IN std_logic;
	flag_presenca : IN std_logic;
	desejado_igual_0 : IN std_logic;
	estado_emergencia : IN std_logic;
	andar_desejado : IN std_logic_vector(1 DOWNTO 0);
	comp_desejado_posicao : IN std_logic_vector(2 DOWNTO 0);
	aciona_alarme : OUT std_logic;
	load_andar_desejado : OUT std_logic;
	parado : OUT std_logic;
	ordem_leds : OUT std_logic_vector(2 DOWNTO 0)
	);
END Sinalizadora_controle;

-- Design Ports Information
-- estado_emergencia	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- aciona_alarme	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- load_andar_desejado	=>  Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- parado	=>  Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ordem_leds[0]	=>  Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ordem_leds[1]	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ordem_leds[2]	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- andar_desejado[0]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- andar_desejado[1]	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- flag_falha	=>  Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- botao_emergencia	=>  Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- flag_peso	=>  Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clock	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- desejado_igual_0	=>  Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- comp_desejado_posicao[2]	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- comp_desejado_posicao[0]	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- comp_desejado_posicao[1]	=>  Location: PIN_G1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- flag_presenca	=>  Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Sinalizadora_controle IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_flag_falha : std_logic;
SIGNAL ww_botao_emergencia : std_logic;
SIGNAL ww_flag_peso : std_logic;
SIGNAL ww_flag_presenca : std_logic;
SIGNAL ww_desejado_igual_0 : std_logic;
SIGNAL ww_estado_emergencia : std_logic;
SIGNAL ww_andar_desejado : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_comp_desejado_posicao : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_aciona_alarme : std_logic;
SIGNAL ww_load_andar_desejado : std_logic;
SIGNAL ww_parado : std_logic;
SIGNAL ww_ordem_leds : std_logic_vector(2 DOWNTO 0);
SIGNAL \clock~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \botao_emergencia~combout\ : std_logic;
SIGNAL \clock~combout\ : std_logic;
SIGNAL \clock~clkctrl_outclk\ : std_logic;
SIGNAL \flag_peso~combout\ : std_logic;
SIGNAL \flag_falha~combout\ : std_logic;
SIGNAL \instancia_controladora_alarme|combinacional~0_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \instancia_controladora_alarme|estado_atual~regout\ : std_logic;
SIGNAL \desejado_igual_0~combout\ : std_logic;
SIGNAL \instancia_controladora|estado_atual.terreo~0_combout\ : std_logic;
SIGNAL \instancia_controladora|estado_atual.terreo~regout\ : std_logic;
SIGNAL \flag_presenca~combout\ : std_logic;
SIGNAL \instancia_controladora|combinacional~2_combout\ : std_logic;
SIGNAL \instancia_controladora|combinacional~0_combout\ : std_logic;
SIGNAL \instancia_controladora|combinacional~1_combout\ : std_logic;
SIGNAL \instancia_controladora|Selector2~0_combout\ : std_logic;
SIGNAL \instancia_controladora|Selector3~0_combout\ : std_logic;
SIGNAL \instancia_controladora|Selector3~1_combout\ : std_logic;
SIGNAL \instancia_controladora|estado_atual.inicia_descendo~regout\ : std_logic;
SIGNAL \instancia_controladora|Selector4~0_combout\ : std_logic;
SIGNAL \instancia_controladora|Selector4~1_combout\ : std_logic;
SIGNAL \instancia_controladora|estado_atual.descendo~regout\ : std_logic;
SIGNAL \instancia_controladora|Selector0~0_combout\ : std_logic;
SIGNAL \instancia_controladora|Selector0~1_combout\ : std_logic;
SIGNAL \instancia_controladora|Selector0~2_combout\ : std_logic;
SIGNAL \instancia_controladora|estado_atual.inicia_subindo~regout\ : std_logic;
SIGNAL \instancia_controladora|Selector1~0_combout\ : std_logic;
SIGNAL \instancia_controladora|Selector1~1_combout\ : std_logic;
SIGNAL \instancia_controladora|estado_atual.subindo~regout\ : std_logic;
SIGNAL \instancia_controladora|Selector2~1_combout\ : std_logic;
SIGNAL \instancia_controladora|Selector2~2_combout\ : std_logic;
SIGNAL \instancia_controladora|estado_atual.parado_andar~regout\ : std_logic;
SIGNAL \instancia_controladora|load_andar_desejado~0_combout\ : std_logic;
SIGNAL \instancia_controladora|WideOr0~combout\ : std_logic;
SIGNAL \instancia_controladora|ordem_leds[0]~2_combout\ : std_logic;
SIGNAL \instancia_controladora|ordem_leds[1]~3_combout\ : std_logic;
SIGNAL \comp_desejado_posicao~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \andar_desejado~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \instancia_controladora|ALT_INV_load_andar_desejado~0_combout\ : std_logic;

BEGIN

ww_reset <= reset;
ww_clock <= clock;
ww_flag_falha <= flag_falha;
ww_botao_emergencia <= botao_emergencia;
ww_flag_peso <= flag_peso;
ww_flag_presenca <= flag_presenca;
ww_desejado_igual_0 <= desejado_igual_0;
ww_estado_emergencia <= estado_emergencia;
ww_andar_desejado <= andar_desejado;
ww_comp_desejado_posicao <= comp_desejado_posicao;
aciona_alarme <= ww_aciona_alarme;
load_andar_desejado <= ww_load_andar_desejado;
parado <= ww_parado;
ordem_leds <= ww_ordem_leds;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clock~combout\);

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~combout\);
\instancia_controladora|ALT_INV_load_andar_desejado~0_combout\ <= NOT \instancia_controladora|load_andar_desejado~0_combout\;

-- Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\botao_emergencia~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_botao_emergencia,
	combout => \botao_emergencia~combout\);

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\comp_desejado_posicao[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_comp_desejado_posicao(2),
	combout => \comp_desejado_posicao~combout\(2));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clock~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clock,
	combout => \clock~combout\);

-- Location: CLKCTRL_G3
\clock~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~clkctrl_outclk\);

-- Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\flag_peso~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_flag_peso,
	combout => \flag_peso~combout\);

-- Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\flag_falha~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_flag_falha,
	combout => \flag_falha~combout\);

-- Location: LCCOMB_X1_Y29_N16
\instancia_controladora_alarme|combinacional~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora_alarme|combinacional~0_combout\ = (\botao_emergencia~combout\) # ((\flag_peso~combout\) # (\flag_falha~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \botao_emergencia~combout\,
	datac => \flag_peso~combout\,
	datad => \flag_falha~combout\,
	combout => \instancia_controladora_alarme|combinacional~0_combout\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: CLKCTRL_G1
\reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~clkctrl_outclk\);

-- Location: LCFF_X1_Y28_N13
\instancia_controladora_alarme|estado_atual\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \instancia_controladora_alarme|combinacional~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \instancia_controladora_alarme|estado_atual~regout\);

-- Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\desejado_igual_0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_desejado_igual_0,
	combout => \desejado_igual_0~combout\);

-- Location: LCCOMB_X1_Y28_N14
\instancia_controladora|estado_atual.terreo~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|estado_atual.terreo~0_combout\ = (\instancia_controladora|estado_atual.terreo~regout\) # ((!\instancia_controladora_alarme|estado_atual~regout\ & !\desejado_igual_0~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instancia_controladora_alarme|estado_atual~regout\,
	datac => \instancia_controladora|estado_atual.terreo~regout\,
	datad => \desejado_igual_0~combout\,
	combout => \instancia_controladora|estado_atual.terreo~0_combout\);

-- Location: LCFF_X1_Y28_N15
\instancia_controladora|estado_atual.terreo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \instancia_controladora|estado_atual.terreo~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \instancia_controladora|estado_atual.terreo~regout\);

-- Location: PIN_G1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\comp_desejado_posicao[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_comp_desejado_posicao(1),
	combout => \comp_desejado_posicao~combout\(1));

-- Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\flag_presenca~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_flag_presenca,
	combout => \flag_presenca~combout\);

-- Location: LCCOMB_X1_Y28_N12
\instancia_controladora|combinacional~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|combinacional~2_combout\ = (!\comp_desejado_posicao~combout\(0) & (\comp_desejado_posicao~combout\(1) & (!\instancia_controladora_alarme|estado_atual~regout\ & !\flag_presenca~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(0),
	datab => \comp_desejado_posicao~combout\(1),
	datac => \instancia_controladora_alarme|estado_atual~regout\,
	datad => \flag_presenca~combout\,
	combout => \instancia_controladora|combinacional~2_combout\);

-- Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\comp_desejado_posicao[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_comp_desejado_posicao(0),
	combout => \comp_desejado_posicao~combout\(0));

-- Location: LCCOMB_X1_Y28_N20
\instancia_controladora|combinacional~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|combinacional~0_combout\ = (!\comp_desejado_posicao~combout\(1) & (!\desejado_igual_0~combout\ & (\comp_desejado_posicao~combout\(0) & !\instancia_controladora_alarme|estado_atual~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(1),
	datab => \desejado_igual_0~combout\,
	datac => \comp_desejado_posicao~combout\(0),
	datad => \instancia_controladora_alarme|estado_atual~regout\,
	combout => \instancia_controladora|combinacional~0_combout\);

-- Location: LCCOMB_X1_Y28_N22
\instancia_controladora|combinacional~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|combinacional~1_combout\ = (!\comp_desejado_posicao~combout\(1) & (!\desejado_igual_0~combout\ & (!\comp_desejado_posicao~combout\(0) & !\instancia_controladora_alarme|estado_atual~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(1),
	datab => \desejado_igual_0~combout\,
	datac => \comp_desejado_posicao~combout\(0),
	datad => \instancia_controladora_alarme|estado_atual~regout\,
	combout => \instancia_controladora|combinacional~1_combout\);

-- Location: LCCOMB_X1_Y28_N24
\instancia_controladora|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector2~0_combout\ = (\instancia_controladora|estado_atual.parado_andar~regout\ & ((\comp_desejado_posicao~combout\(2) & ((!\instancia_controladora|combinacional~1_combout\))) # (!\comp_desejado_posicao~combout\(2) & 
-- (!\instancia_controladora|combinacional~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \instancia_controladora|estado_atual.parado_andar~regout\,
	datac => \instancia_controladora|combinacional~0_combout\,
	datad => \instancia_controladora|combinacional~1_combout\,
	combout => \instancia_controladora|Selector2~0_combout\);

-- Location: LCCOMB_X1_Y28_N6
\instancia_controladora|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector3~0_combout\ = (!\instancia_controladora_alarme|estado_atual~regout\ & (\flag_presenca~combout\ & \instancia_controladora|estado_atual.inicia_descendo~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instancia_controladora_alarme|estado_atual~regout\,
	datab => \flag_presenca~combout\,
	datad => \instancia_controladora|estado_atual.inicia_descendo~regout\,
	combout => \instancia_controladora|Selector3~0_combout\);

-- Location: LCCOMB_X1_Y28_N30
\instancia_controladora|Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector3~1_combout\ = (\instancia_controladora|Selector3~0_combout\) # ((!\comp_desejado_posicao~combout\(2) & (\instancia_controladora|estado_atual.parado_andar~regout\ & \instancia_controladora|combinacional~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \instancia_controladora|estado_atual.parado_andar~regout\,
	datac => \instancia_controladora|combinacional~0_combout\,
	datad => \instancia_controladora|Selector3~0_combout\,
	combout => \instancia_controladora|Selector3~1_combout\);

-- Location: LCFF_X1_Y28_N31
\instancia_controladora|estado_atual.inicia_descendo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \instancia_controladora|Selector3~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \instancia_controladora|estado_atual.inicia_descendo~regout\);

-- Location: LCCOMB_X1_Y28_N16
\instancia_controladora|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector4~0_combout\ = (\instancia_controladora|estado_atual.inicia_descendo~regout\ & ((\instancia_controladora_alarme|estado_atual~regout\) # (!\flag_presenca~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instancia_controladora_alarme|estado_atual~regout\,
	datab => \flag_presenca~combout\,
	datad => \instancia_controladora|estado_atual.inicia_descendo~regout\,
	combout => \instancia_controladora|Selector4~0_combout\);

-- Location: LCCOMB_X1_Y28_N4
\instancia_controladora|Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector4~1_combout\ = (\instancia_controladora|Selector4~0_combout\) # ((\instancia_controladora|estado_atual.descendo~regout\ & ((\comp_desejado_posicao~combout\(2)) # (!\instancia_controladora|combinacional~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \instancia_controladora|combinacional~2_combout\,
	datac => \instancia_controladora|estado_atual.descendo~regout\,
	datad => \instancia_controladora|Selector4~0_combout\,
	combout => \instancia_controladora|Selector4~1_combout\);

-- Location: LCFF_X1_Y28_N5
\instancia_controladora|estado_atual.descendo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \instancia_controladora|Selector4~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \instancia_controladora|estado_atual.descendo~regout\);

-- Location: LCCOMB_X1_Y28_N28
\instancia_controladora|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector0~0_combout\ = (\comp_desejado_posicao~combout\(2) & (!\comp_desejado_posicao~combout\(1) & (!\comp_desejado_posicao~combout\(0) & \instancia_controladora|estado_atual.parado_andar~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \comp_desejado_posicao~combout\(1),
	datac => \comp_desejado_posicao~combout\(0),
	datad => \instancia_controladora|estado_atual.parado_andar~regout\,
	combout => \instancia_controladora|Selector0~0_combout\);

-- Location: LCCOMB_X1_Y28_N26
\instancia_controladora|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector0~1_combout\ = (!\instancia_controladora_alarme|estado_atual~regout\ & (!\desejado_igual_0~combout\ & ((\instancia_controladora|Selector0~0_combout\) # (!\instancia_controladora|estado_atual.terreo~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instancia_controladora_alarme|estado_atual~regout\,
	datab => \desejado_igual_0~combout\,
	datac => \instancia_controladora|estado_atual.terreo~regout\,
	datad => \instancia_controladora|Selector0~0_combout\,
	combout => \instancia_controladora|Selector0~1_combout\);

-- Location: LCCOMB_X1_Y28_N2
\instancia_controladora|Selector0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector0~2_combout\ = (\instancia_controladora|Selector0~1_combout\) # ((\instancia_controladora|estado_atual.inicia_subindo~regout\ & ((\instancia_controladora_alarme|estado_atual~regout\) # (\flag_presenca~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instancia_controladora_alarme|estado_atual~regout\,
	datab => \flag_presenca~combout\,
	datac => \instancia_controladora|estado_atual.inicia_subindo~regout\,
	datad => \instancia_controladora|Selector0~1_combout\,
	combout => \instancia_controladora|Selector0~2_combout\);

-- Location: LCFF_X1_Y28_N3
\instancia_controladora|estado_atual.inicia_subindo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \instancia_controladora|Selector0~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \instancia_controladora|estado_atual.inicia_subindo~regout\);

-- Location: LCCOMB_X1_Y28_N8
\instancia_controladora|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector1~0_combout\ = (!\instancia_controladora_alarme|estado_atual~regout\ & (!\flag_presenca~combout\ & \instancia_controladora|estado_atual.inicia_subindo~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instancia_controladora_alarme|estado_atual~regout\,
	datab => \flag_presenca~combout\,
	datad => \instancia_controladora|estado_atual.inicia_subindo~regout\,
	combout => \instancia_controladora|Selector1~0_combout\);

-- Location: LCCOMB_X1_Y28_N10
\instancia_controladora|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector1~1_combout\ = (\instancia_controladora|Selector1~0_combout\) # ((\instancia_controladora|estado_atual.subindo~regout\ & ((\comp_desejado_posicao~combout\(2)) # (!\instancia_controladora|combinacional~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \instancia_controladora|combinacional~2_combout\,
	datac => \instancia_controladora|estado_atual.subindo~regout\,
	datad => \instancia_controladora|Selector1~0_combout\,
	combout => \instancia_controladora|Selector1~1_combout\);

-- Location: LCFF_X1_Y28_N11
\instancia_controladora|estado_atual.subindo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \instancia_controladora|Selector1~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \instancia_controladora|estado_atual.subindo~regout\);

-- Location: LCCOMB_X1_Y28_N18
\instancia_controladora|Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector2~1_combout\ = (\instancia_controladora|estado_atual.descendo~regout\) # (\instancia_controladora|estado_atual.subindo~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \instancia_controladora|estado_atual.descendo~regout\,
	datad => \instancia_controladora|estado_atual.subindo~regout\,
	combout => \instancia_controladora|Selector2~1_combout\);

-- Location: LCCOMB_X1_Y28_N0
\instancia_controladora|Selector2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|Selector2~2_combout\ = (\instancia_controladora|Selector2~0_combout\) # ((!\comp_desejado_posicao~combout\(2) & (\instancia_controladora|combinacional~2_combout\ & \instancia_controladora|Selector2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \instancia_controladora|combinacional~2_combout\,
	datac => \instancia_controladora|Selector2~0_combout\,
	datad => \instancia_controladora|Selector2~1_combout\,
	combout => \instancia_controladora|Selector2~2_combout\);

-- Location: LCFF_X1_Y28_N1
\instancia_controladora|estado_atual.parado_andar\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \instancia_controladora|Selector2~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \instancia_controladora|estado_atual.parado_andar~regout\);

-- Location: LCCOMB_X1_Y32_N28
\instancia_controladora|load_andar_desejado~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|load_andar_desejado~0_combout\ = (\instancia_controladora|estado_atual.terreo~regout\ & !\instancia_controladora|estado_atual.parado_andar~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instancia_controladora|estado_atual.terreo~regout\,
	datac => \instancia_controladora|estado_atual.parado_andar~regout\,
	combout => \instancia_controladora|load_andar_desejado~0_combout\);

-- Location: LCCOMB_X1_Y32_N30
\instancia_controladora|WideOr0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|WideOr0~combout\ = ((\instancia_controladora|estado_atual.parado_andar~regout\) # (\instancia_controladora|estado_atual.inicia_subindo~regout\)) # (!\instancia_controladora|estado_atual.terreo~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instancia_controladora|estado_atual.terreo~regout\,
	datac => \instancia_controladora|estado_atual.parado_andar~regout\,
	datad => \instancia_controladora|estado_atual.inicia_subindo~regout\,
	combout => \instancia_controladora|WideOr0~combout\);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\andar_desejado[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_andar_desejado(0),
	combout => \andar_desejado~combout\(0));

-- Location: LCCOMB_X1_Y32_N0
\instancia_controladora|ordem_leds[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|ordem_leds[0]~2_combout\ = (\instancia_controladora|estado_atual.terreo~regout\ & (!\instancia_controladora|estado_atual.parado_andar~regout\ & \andar_desejado~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instancia_controladora|estado_atual.terreo~regout\,
	datac => \instancia_controladora|estado_atual.parado_andar~regout\,
	datad => \andar_desejado~combout\(0),
	combout => \instancia_controladora|ordem_leds[0]~2_combout\);

-- Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\andar_desejado[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_andar_desejado(1),
	combout => \andar_desejado~combout\(1));

-- Location: LCCOMB_X1_Y32_N14
\instancia_controladora|ordem_leds[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \instancia_controladora|ordem_leds[1]~3_combout\ = (!\instancia_controladora|estado_atual.parado_andar~regout\ & (\instancia_controladora|estado_atual.terreo~regout\ & \andar_desejado~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instancia_controladora|estado_atual.parado_andar~regout\,
	datac => \instancia_controladora|estado_atual.terreo~regout\,
	datad => \andar_desejado~combout\(1),
	combout => \instancia_controladora|ordem_leds[1]~3_combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\estado_emergencia~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_estado_emergencia);

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\aciona_alarme~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \instancia_controladora_alarme|estado_atual~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_aciona_alarme);

-- Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\load_andar_desejado~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \instancia_controladora|ALT_INV_load_andar_desejado~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_load_andar_desejado);

-- Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\parado~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \instancia_controladora|WideOr0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_parado);

-- Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ordem_leds[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \instancia_controladora|ordem_leds[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ordem_leds(0));

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ordem_leds[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \instancia_controladora|ordem_leds[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ordem_leds(1));

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ordem_leds[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \instancia_controladora|ALT_INV_load_andar_desejado~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ordem_leds(2));
END structure;



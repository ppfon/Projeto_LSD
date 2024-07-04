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

-- DATE "07/04/2024 09:52:08"

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

ENTITY 	Controladora IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	flag_presenca : IN std_logic;
	desejado_igual_0 : IN std_logic;
	estado_emergencia : IN std_logic;
	andar_desejado : IN std_logic_vector(1 DOWNTO 0);
	comp_desejado_posicao : IN std_logic_vector(2 DOWNTO 0);
	load_andar_desejado : OUT std_logic;
	parado : OUT std_logic;
	ordem_leds : OUT std_logic_vector(2 DOWNTO 0);
	estado_teste : OUT std_logic_vector(2 DOWNTO 0)
	);
END Controladora;

-- Design Ports Information
-- load_andar_desejado	=>  Location: PIN_E23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- parado	=>  Location: PIN_C25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ordem_leds[0]	=>  Location: PIN_B24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ordem_leds[1]	=>  Location: PIN_G22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ordem_leds[2]	=>  Location: PIN_G21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- estado_teste[0]	=>  Location: PIN_C24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- estado_teste[1]	=>  Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- estado_teste[2]	=>  Location: PIN_J20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- andar_desejado[0]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- andar_desejado[1]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- desejado_igual_0	=>  Location: PIN_J22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- estado_emergencia	=>  Location: PIN_E25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clock	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- comp_desejado_posicao[2]	=>  Location: PIN_E26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- comp_desejado_posicao[0]	=>  Location: PIN_D26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- comp_desejado_posicao[1]	=>  Location: PIN_D25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- flag_presenca	=>  Location: PIN_H21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Controladora IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_flag_presenca : std_logic;
SIGNAL ww_desejado_igual_0 : std_logic;
SIGNAL ww_estado_emergencia : std_logic;
SIGNAL ww_andar_desejado : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_comp_desejado_posicao : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_load_andar_desejado : std_logic;
SIGNAL ww_parado : std_logic;
SIGNAL ww_ordem_leds : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_estado_teste : std_logic_vector(2 DOWNTO 0);
SIGNAL \clock~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \combinacional~0_combout\ : std_logic;
SIGNAL \clock~combout\ : std_logic;
SIGNAL \clock~clkctrl_outclk\ : std_logic;
SIGNAL \flag_presenca~combout\ : std_logic;
SIGNAL \combinacional~2_combout\ : std_logic;
SIGNAL \estado_emergencia~combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \estado_atual.inicia_descendo~regout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \estado_atual.descendo~regout\ : std_logic;
SIGNAL \desejado_igual_0~combout\ : std_logic;
SIGNAL \estado_atual.terreo~0_combout\ : std_logic;
SIGNAL \estado_atual.terreo~regout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \Selector0~2_combout\ : std_logic;
SIGNAL \estado_atual.inicia_subindo~regout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \estado_atual.subindo~regout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \combinacional~1_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~2_combout\ : std_logic;
SIGNAL \estado_atual.parado_andar~regout\ : std_logic;
SIGNAL \load_andar_desejado~0_combout\ : std_logic;
SIGNAL \WideOr0~combout\ : std_logic;
SIGNAL \ordem_leds~2_combout\ : std_logic;
SIGNAL \ordem_leds~3_combout\ : std_logic;
SIGNAL \WideOr3~combout\ : std_logic;
SIGNAL \WideOr2~combout\ : std_logic;
SIGNAL \WideOr1~combout\ : std_logic;
SIGNAL \comp_desejado_posicao~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \andar_desejado~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_WideOr1~combout\ : std_logic;
SIGNAL \ALT_INV_WideOr2~combout\ : std_logic;
SIGNAL \ALT_INV_load_andar_desejado~0_combout\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_flag_presenca <= flag_presenca;
ww_desejado_igual_0 <= desejado_igual_0;
ww_estado_emergencia <= estado_emergencia;
ww_andar_desejado <= andar_desejado;
ww_comp_desejado_posicao <= comp_desejado_posicao;
load_andar_desejado <= ww_load_andar_desejado;
parado <= ww_parado;
ordem_leds <= ww_ordem_leds;
estado_teste <= ww_estado_teste;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clock~combout\);

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~combout\);
\ALT_INV_WideOr1~combout\ <= NOT \WideOr1~combout\;
\ALT_INV_WideOr2~combout\ <= NOT \WideOr2~combout\;
\ALT_INV_load_andar_desejado~0_combout\ <= NOT \load_andar_desejado~0_combout\;

-- Location: LCCOMB_X64_Y31_N10
\combinacional~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \combinacional~0_combout\ = (!\estado_emergencia~combout\ & (!\comp_desejado_posicao~combout\(1) & (\comp_desejado_posicao~combout\(0) & !\desejado_igual_0~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_emergencia~combout\,
	datab => \comp_desejado_posicao~combout\(1),
	datac => \comp_desejado_posicao~combout\(0),
	datad => \desejado_igual_0~combout\,
	combout => \combinacional~0_combout\);

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

-- Location: PIN_D25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_D26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_H21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: LCCOMB_X64_Y31_N4
\combinacional~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \combinacional~2_combout\ = (!\estado_emergencia~combout\ & (\comp_desejado_posicao~combout\(1) & (!\comp_desejado_posicao~combout\(0) & !\flag_presenca~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_emergencia~combout\,
	datab => \comp_desejado_posicao~combout\(1),
	datac => \comp_desejado_posicao~combout\(0),
	datad => \flag_presenca~combout\,
	combout => \combinacional~2_combout\);

-- Location: PIN_E25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
	padio => ww_estado_emergencia,
	combout => \estado_emergencia~combout\);

-- Location: PIN_E26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: LCCOMB_X64_Y31_N18
\Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\flag_presenca~combout\ & (!\estado_emergencia~combout\ & \estado_atual.inicia_descendo~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \flag_presenca~combout\,
	datac => \estado_emergencia~combout\,
	datad => \estado_atual.inicia_descendo~regout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X64_Y31_N2
\Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\Selector3~0_combout\) # ((\combinacional~0_combout\ & (\estado_atual.parado_andar~regout\ & !\comp_desejado_posicao~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \combinacional~0_combout\,
	datab => \estado_atual.parado_andar~regout\,
	datac => \comp_desejado_posicao~combout\(2),
	datad => \Selector3~0_combout\,
	combout => \Selector3~1_combout\);

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

-- Location: LCFF_X64_Y31_N3
\estado_atual.inicia_descendo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \Selector3~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_atual.inicia_descendo~regout\);

-- Location: LCCOMB_X64_Y31_N26
\Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\estado_atual.inicia_descendo~regout\ & ((\estado_emergencia~combout\) # (!\flag_presenca~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \flag_presenca~combout\,
	datac => \estado_emergencia~combout\,
	datad => \estado_atual.inicia_descendo~regout\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X64_Y31_N24
\Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\Selector4~0_combout\) # ((\estado_atual.descendo~regout\ & ((\comp_desejado_posicao~combout\(2)) # (!\combinacional~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \combinacional~2_combout\,
	datac => \estado_atual.descendo~regout\,
	datad => \Selector4~0_combout\,
	combout => \Selector4~1_combout\);

-- Location: LCFF_X64_Y31_N25
\estado_atual.descendo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \Selector4~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_atual.descendo~regout\);

-- Location: PIN_J22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: LCCOMB_X64_Y31_N16
\estado_atual.terreo~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_atual.terreo~0_combout\ = (\estado_atual.terreo~regout\) # ((!\estado_emergencia~combout\ & !\desejado_igual_0~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_emergencia~combout\,
	datab => \desejado_igual_0~combout\,
	datac => \estado_atual.terreo~regout\,
	combout => \estado_atual.terreo~0_combout\);

-- Location: LCFF_X64_Y31_N17
\estado_atual.terreo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \estado_atual.terreo~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_atual.terreo~regout\);

-- Location: LCCOMB_X64_Y31_N22
\Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\comp_desejado_posicao~combout\(2) & (!\comp_desejado_posicao~combout\(1) & (!\comp_desejado_posicao~combout\(0) & \estado_atual.parado_andar~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \comp_desejado_posicao~combout\(1),
	datac => \comp_desejado_posicao~combout\(0),
	datad => \estado_atual.parado_andar~regout\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X64_Y31_N28
\Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (!\estado_emergencia~combout\ & (!\desejado_igual_0~combout\ & ((\Selector0~0_combout\) # (!\estado_atual.terreo~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_emergencia~combout\,
	datab => \desejado_igual_0~combout\,
	datac => \estado_atual.terreo~regout\,
	datad => \Selector0~0_combout\,
	combout => \Selector0~1_combout\);

-- Location: LCCOMB_X64_Y31_N0
\Selector0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~2_combout\ = (\Selector0~1_combout\) # ((\estado_atual.inicia_subindo~regout\ & ((\estado_emergencia~combout\) # (\flag_presenca~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_emergencia~combout\,
	datab => \flag_presenca~combout\,
	datac => \estado_atual.inicia_subindo~regout\,
	datad => \Selector0~1_combout\,
	combout => \Selector0~2_combout\);

-- Location: LCFF_X64_Y31_N1
\estado_atual.inicia_subindo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \Selector0~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_atual.inicia_subindo~regout\);

-- Location: LCCOMB_X64_Y31_N20
\Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (!\flag_presenca~combout\ & (!\estado_emergencia~combout\ & \estado_atual.inicia_subindo~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \flag_presenca~combout\,
	datac => \estado_emergencia~combout\,
	datad => \estado_atual.inicia_subindo~regout\,
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X64_Y31_N12
\Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (\Selector1~0_combout\) # ((\estado_atual.subindo~regout\ & ((\comp_desejado_posicao~combout\(2)) # (!\combinacional~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \combinacional~2_combout\,
	datac => \estado_atual.subindo~regout\,
	datad => \Selector1~0_combout\,
	combout => \Selector1~1_combout\);

-- Location: LCFF_X64_Y31_N13
\estado_atual.subindo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \Selector1~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_atual.subindo~regout\);

-- Location: LCCOMB_X64_Y31_N14
\Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\estado_atual.descendo~regout\) # (\estado_atual.subindo~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_atual.descendo~regout\,
	datad => \estado_atual.subindo~regout\,
	combout => \Selector2~1_combout\);

-- Location: LCCOMB_X64_Y31_N8
\combinacional~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \combinacional~1_combout\ = (!\estado_emergencia~combout\ & (!\comp_desejado_posicao~combout\(1) & (!\comp_desejado_posicao~combout\(0) & !\desejado_igual_0~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_emergencia~combout\,
	datab => \comp_desejado_posicao~combout\(1),
	datac => \comp_desejado_posicao~combout\(0),
	datad => \desejado_igual_0~combout\,
	combout => \combinacional~1_combout\);

-- Location: LCCOMB_X64_Y31_N6
\Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\estado_atual.parado_andar~regout\ & ((\comp_desejado_posicao~combout\(2) & ((!\combinacional~1_combout\))) # (!\comp_desejado_posicao~combout\(2) & (!\combinacional~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \combinacional~0_combout\,
	datab => \combinacional~1_combout\,
	datac => \comp_desejado_posicao~combout\(2),
	datad => \estado_atual.parado_andar~regout\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X64_Y31_N30
\Selector2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~2_combout\ = (\Selector2~0_combout\) # ((!\comp_desejado_posicao~combout\(2) & (\combinacional~2_combout\ & \Selector2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_desejado_posicao~combout\(2),
	datab => \combinacional~2_combout\,
	datac => \Selector2~1_combout\,
	datad => \Selector2~0_combout\,
	combout => \Selector2~2_combout\);

-- Location: LCFF_X64_Y31_N31
\estado_atual.parado_andar\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \Selector2~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_atual.parado_andar~regout\);

-- Location: LCCOMB_X64_Y32_N0
\load_andar_desejado~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \load_andar_desejado~0_combout\ = (!\estado_atual.parado_andar~regout\ & \estado_atual.terreo~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_atual.parado_andar~regout\,
	datad => \estado_atual.terreo~regout\,
	combout => \load_andar_desejado~0_combout\);

-- Location: LCCOMB_X64_Y32_N30
WideOr0 : cycloneii_lcell_comb
-- Equation(s):
-- \WideOr0~combout\ = ((\estado_atual.parado_andar~regout\) # (\estado_atual.inicia_subindo~regout\)) # (!\estado_atual.terreo~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado_atual.terreo~regout\,
	datac => \estado_atual.parado_andar~regout\,
	datad => \estado_atual.inicia_subindo~regout\,
	combout => \WideOr0~combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: LCCOMB_X64_Y32_N12
\ordem_leds~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \ordem_leds~2_combout\ = (\andar_desejado~combout\(0) & (!\estado_atual.parado_andar~regout\ & \estado_atual.terreo~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \andar_desejado~combout\(0),
	datac => \estado_atual.parado_andar~regout\,
	datad => \estado_atual.terreo~regout\,
	combout => \ordem_leds~2_combout\);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: LCCOMB_X64_Y32_N2
\ordem_leds~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \ordem_leds~3_combout\ = (\andar_desejado~combout\(1) & (!\estado_atual.parado_andar~regout\ & \estado_atual.terreo~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \andar_desejado~combout\(1),
	datac => \estado_atual.parado_andar~regout\,
	datad => \estado_atual.terreo~regout\,
	combout => \ordem_leds~3_combout\);

-- Location: LCCOMB_X64_Y32_N16
WideOr3 : cycloneii_lcell_comb
-- Equation(s):
-- \WideOr3~combout\ = ((\estado_atual.subindo~regout\) # (\estado_atual.inicia_descendo~regout\)) # (!\estado_atual.terreo~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado_atual.terreo~regout\,
	datac => \estado_atual.subindo~regout\,
	datad => \estado_atual.inicia_descendo~regout\,
	combout => \WideOr3~combout\);

-- Location: LCCOMB_X64_Y32_N14
WideOr2 : cycloneii_lcell_comb
-- Equation(s):
-- \WideOr2~combout\ = (\estado_atual.inicia_descendo~regout\) # ((\estado_atual.parado_andar~regout\) # (!\estado_atual.terreo~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual.inicia_descendo~regout\,
	datac => \estado_atual.parado_andar~regout\,
	datad => \estado_atual.terreo~regout\,
	combout => \WideOr2~combout\);

-- Location: LCCOMB_X64_Y32_N4
WideOr1 : cycloneii_lcell_comb
-- Equation(s):
-- \WideOr1~combout\ = ((\estado_atual.subindo~regout\) # (\estado_atual.inicia_subindo~regout\)) # (!\estado_atual.terreo~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado_atual.terreo~regout\,
	datac => \estado_atual.subindo~regout\,
	datad => \estado_atual.inicia_subindo~regout\,
	combout => \WideOr1~combout\);

-- Location: PIN_E23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => \ALT_INV_load_andar_desejado~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_load_andar_desejado);

-- Location: PIN_C25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => \WideOr0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_parado);

-- Location: PIN_B24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => \ordem_leds~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ordem_leds(0));

-- Location: PIN_G22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => \ordem_leds~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ordem_leds(1));

-- Location: PIN_G21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => \ALT_INV_load_andar_desejado~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ordem_leds(2));

-- Location: PIN_C24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\estado_teste[0]~I\ : cycloneii_io
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
	datain => \WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_estado_teste(0));

-- Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\estado_teste[1]~I\ : cycloneii_io
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
	datain => \ALT_INV_WideOr2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_estado_teste(1));

-- Location: PIN_J20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\estado_teste[2]~I\ : cycloneii_io
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
	datain => \ALT_INV_WideOr1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_estado_teste(2));
END structure;



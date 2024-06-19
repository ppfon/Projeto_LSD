transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/maria/OneDrive/Documentos/MMS/Maria/Github/Projeto_LSD/Deco_3bits/Deco_3bits.vhdl}

vcom -93 -work work {C:/Users/maria/OneDrive/Documentos/MMS/Maria/Github/Projeto_LSD/Deco_3bits/tb_Deco_3bits.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  tb_Deco_3bits

add wave *
view structure
view signals
run 80 ns

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/maria/OneDrive/Documentos/MMS/Maria/Github/Projeto_LSD/Comp2Bits/Comp2Bits.vhd}

vcom -93 -work work {C:/Users/maria/OneDrive/Documentos/MMS/Maria/Github/Projeto_LSD/Comp2Bits/Tb_Comp2Bits.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  Tb_Comp2Bits

add wave *
view structure
view signals
run 14 ns

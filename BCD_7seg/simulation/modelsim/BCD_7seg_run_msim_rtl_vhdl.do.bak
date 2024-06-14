transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/maria/OneDrive/Documentos/MMS/Maria/Github/Projeto_LSD/BCD_7seg/BCD_7seg.vhd}

vcom -93 -work work {C:/Users/maria/OneDrive/Documentos/MMS/Maria/Github/Projeto_LSD/BCD_7seg/Tb_BCD_7seg.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  Tb_BCD_7seg

add wave *
view structure
view signals
run 14 ns

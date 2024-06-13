transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/unknow/Documents/GitHub/Projeto_LSD/RegW/RegW.vhd}

vcom -93 -work work {C:/Users/unknow/Documents/GitHub/Projeto_LSD/RegW/Tb_RegW.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  Tb_RegW

add wave *
view structure
view signals
run 200 ns

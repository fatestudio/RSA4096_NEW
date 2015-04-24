set top_level	work.MonPro_tb

set wave_radices {
	hexadecimal {data -r *}
}

vlog MonPro_tb.v
vsim -L altera_mf_ver -L lpm_ver -L cycloneiii_ver -L cycloneii_ver work.MonPro_tb
add wave -hex /MonPro_tb/state
add wave -hex -internal /MonPro_tb/MonPro0/x
add wave -hex -internal /MonPro_tb/MonPro0/y
add wave -hex -internal /MonPro_tb/MonPro0/v
add wave -hex -internal /MonPro_tb/MonPro0/n
add wave -hex -internal /MonPro_tb/MonPro0/*

run 70000

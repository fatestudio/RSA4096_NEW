set top_level	work.ModExp_tb

set wave_radices {
	hexadecimal {data -r *}
}

vlog ModExp_tb.v
vsim -L altera_mf_ver -L lpm_ver -L cycloneiii_ver -L cycloneii_ver work.ModExp_tb
add wave -hex -internal /ModExp_tb/ModExp0/d_in
add wave -hex -internal /ModExp_tb/ModExp0/m_bar
add wave -hex -internal /ModExp_tb/ModExp0/c_bar
add wave -hex -internal /ModExp_tb/ModExp0/c_in
add wave -hex -internal /ModExp_tb/ModExp0/MonPro0/x
add wave -hex -internal /ModExp_tb/ModExp0/MonPro0/y
add wave -hex -internal /ModExp_tb/ModExp0/MonPro0/v
add wave -hex -internal /ModExp_tb/ModExp0/MonPro0/n
add wave -hex -r *
add wave -hex -internal /ModExp_tb/ModExp0/*

run 14294967295

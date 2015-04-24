transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/MonPro {E:/ms project/!Clean Folder/MonPro/_parameter.v}
vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/MonPro {E:/ms project/!Clean Folder/MonPro/MulAdd.v}
vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/MonPro {E:/ms project/!Clean Folder/MonPro/MonPro.v}

do "E:/ms project/!Clean Folder/MonPro/MonProSimulation.tcl"

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/ModExpBlinding {E:/ms project/!Clean Folder/ModExpBlinding/_parameter.v}
vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/ModExpBlinding {E:/ms project/!Clean Folder/ModExpBlinding/MulAdd.v}
vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/ModExpBlinding {E:/ms project/!Clean Folder/ModExpBlinding/MonPro.v}
vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/ModExpBlinding {E:/ms project/!Clean Folder/ModExpBlinding/ModExp.v}


transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/ModExp64 {E:/ms project/!Clean Folder/ModExp64/_parameter.v}
vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/ModExp64 {E:/ms project/!Clean Folder/ModExp64/MulAdd.v}
vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/ModExp64 {E:/ms project/!Clean Folder/ModExp64/MonPro.v}
vlog -vlog01compat -work work +incdir+E:/ms\ project/!Clean\ Folder/ModExp64 {E:/ms project/!Clean Folder/ModExp64/ModExp.v}


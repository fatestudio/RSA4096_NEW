// common header file
`ifndef __parameter_
`define __parameter_

`define DATA_WIDTH 128 
`define ADDR_WIDTH 5
`define TOTAL_ADDR (2 ** `ADDR_WIDTH)

`define TOTAL_BITS `DATA_WIDTH * `TOTAL_ADDR
`define ZERO 128'h00000000000000000000000000000000	// no use, please define it clearly in your modules, otherwise your simulation doesn't work

`define DATA_WIDTH64 64 
`define ADDR_WIDTH64 6
`define TOTAL_ADDR64 (2 ** `ADDR_WIDTH64)
`define ZERO64 64'h0000000000000000

`define DATA_WIDTH32 32
`define ADDR_WIDTH32 7
`define TOTAL_ADDR32 (2 ** `ADDR_WIDTH32)
`define ZERO32 32'h00000000


// Define states for ModExp
`define NONE 1
`define LOADC 2
`define WAIT_COMPUTE 3
`define CALC_CPRIME_1 4
`define CALC_CPRIME_2 5
`define CALC_C_BAR 6
`define GET_K_D 7
`define BIGLOOP 8
`define CALC_M_BAR_C_BAR 9
`define CALC_M_BAR_1 10
`define CALC_MPRIME_1 11
`define CALC_MPRIME_2 12 
`define COMPLETE 13
`define OUTPUT_RESULT 14
`define TERMINAL 15

// Define sub-states to communicate with MonPro module
`define NOTASK 0
`define INP1 1
`define INP2 2
`define WAIT 3
`define OUTPINS 4
// 		INP: dump values into MonPro		WAIT: wait for result	OUTPINS: dump values out from monPro	
				
// Define states for MonPro,	 stateMonPro
`define NONEMONPRO 0
`define READINX 1
`define READINY 2
`define STEP1 3
`define STEP2 4
`define STEP3AND4 5
`define STEP3AND4LASTV 6
`define STEP5SUBCOND 7
`define STEP5SUBTRACTION 8
`define WRITEOUT 9	


`endif
// MonPro module
// follow this algorithm: http://cs.ucsb.edu/~koc/cs290g/docs/w01/mon1.pdf
// ModExp follows my Master project slides
`include "_parameter.v"

module ModExp	// c ^ d % n		c is the number, d is exponent, n is modulor
(
	input clk,
	input reset,
	input startInput,	// tell FPGA to start input 
	input startCompute,	// tell FPGA to start compute
	input getResult,	// tell FPGA to output result
	input [`DATA_WIDTH - 1 : 0] inp,
	output reg [4 : 0] stateModExp,	//	for MonExp
	output reg [2 : 0] stateModExpSub,
	output reg [`DATA_WIDTH - 1 : 0] outp
);

	reg [`DATA_WIDTH - 1 : 0] c_in [`TOTAL_ADDR - 1 : 0];	// for c input
	reg [`DATA_WIDTH - 1 : 0] r_in [`TOTAL_ADDR - 1 : 0];	// for r input
	reg [`DATA_WIDTH - 1 : 0] t_in [`TOTAL_ADDR - 1 : 0];	// for t input
	reg [`DATA_WIDTH - 1 : 0] d_in [`TOTAL_ADDR - 1 : 0];	// for d input
	
	reg [`DATA_WIDTH - 1 : 0] c_bar [`TOTAL_ADDR - 1 : 0];	// multiple usage, to save regs
	reg [`DATA_WIDTH - 1 : 0] m_bar [`TOTAL_ADDR - 1 : 0];	// multiple usage, to save regs
	
	integer i;	// big loop i
	integer k_d1;
	integer k_d2;
	
	reg startMonPro;
	reg [`DATA_WIDTH - 1 : 0] inpMonPro;
	wire [4 : 0] stateMonPro;
	wire [`DATA_WIDTH - 1 : 0] outpMonPro;
	MonPro MonPro0 (.clk(clk), .reset(reset), .start(startMonPro), .inp(inpMonPro), .state(stateMonPro), .outp(outpMonPro));
	
	initial begin	// set to 0 
		$readmemh("r.txt", r_in);
		$readmemh("t.txt", t_in);
		$readmemh("d.txt", d_in);
		
		i = 0;
		stateModExpSub = `NOTASK;
		stateModExp = `NONE;
		k_d1 = `TOTAL_ADDR - 1;
		k_d2 = `DATA_WIDTH - 1;
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin	// reset all...
			i = 0;

			stateModExpSub = `NOTASK;
			stateModExp = `NONE;
			k_d1 = `TOTAL_ADDR - 1;
			k_d2 = `DATA_WIDTH - 1;
		end
		else begin
			case (stateModExp)
				`NONE: // initial state
				begin
					if(startInput)
						stateModExp = `LOADC;
				end
			
				`LOADC:	// read in and initialize c
				begin
					if(i <= `TOTAL_ADDR) begin
						c_in[i] = inp;
						
						i = i + 1;
					end
					else begin
						i = 0;
						stateModExp = `WAIT_COMPUTE;
					end
				end
							
				`WAIT_COMPUTE:
				begin
					if(startCompute) begin
						stateModExp = `CALC_C_BAR;
					end					
				end
				
				`CALC_C_BAR:	// calculate c_bar = MonPro(c, t) and copy: m_bar = r
				begin
					case (stateModExpSub)
						`NOTASK: 
						begin	
							startMonPro <= 1;
							stateModExpSub = `INP1;
						end
						
						`INP1 :
						begin
							inpMonPro <= c_in[i];
							i = i + 1;
							if(i == `TOTAL_ADDR) begin
								i = 0;
								stateModExpSub = `INP2;
							end
						end
						
						`INP2:
						begin
							if(i <= 0) begin		// need some delay here...
								i = i + 1;
							end
							else begin
								inpMonPro <= t_in[i - 1];
								i = i + 1;
								if(i > `TOTAL_ADDR) begin
									i = 0;
									stateModExpSub = `WAIT;
								end
							end
						end
						
						`WAIT:
						begin
							if(stateMonPro == `WRITEOUT) begin
								stateModExpSub = `OUTPINS;
							end
						end
						
						`OUTPINS:
						begin
							c_bar[i] <= outpMonPro;
							m_bar[i] <= r_in[i];
							i = i + 1;
							if(i == `TOTAL_ADDR) begin
								inpMonPro <= 128'h00000000000000000000000000000000;
								i = 0;
								stateModExpSub = `NOTASK;
								stateModExp = `GET_K_D;
								startMonPro <= 0;
							end
						end
					endcase
				end
			
				`GET_K_D:	// a clock to initial the leftmost 1 in d = k_d
				begin
					if(d_in[k_d1][k_d2] == 1) begin
						$display("d_in[%d][%d] = %d", k_d1, k_d2, d_in[k_d1][k_d2]);
						stateModExp = `BIGLOOP;
					end
					else begin
						if(k_d2 == 0) begin
							k_d1 = k_d1 - 1;
							k_d2 = `DATA_WIDTH - 1;
						end
						else begin
							k_d2 = k_d2 - 1;
						end
					end
				end
			
				`BIGLOOP:	// for i = k_d1 * `DATA_WIDTH + k_d2 downto 0
				begin
					case (stateModExpSub)	// m_bar = MonPro(m_bar, m_bar)
						`NOTASK: 
						begin	
							startMonPro <= 1;
							stateModExpSub = `INP1;
						end
						
						`INP1:
						begin
							inpMonPro <= m_bar[i];
							i = i + 1;
							if(i == `TOTAL_ADDR) begin
								i = 0;
								stateModExpSub = `INP2;
							end
						end
						
						`INP2:
						begin
							if(i <= 0) begin		// need some delay here...
								i = i + 1;
							end
							else begin
								inpMonPro <= m_bar[i - 1];
								i = i + 1;
								if(i > `TOTAL_ADDR) begin
									i = 0;
									stateModExpSub = `WAIT;
								end
							end
						end
						
						`WAIT:
						begin
							if(stateMonPro == `WRITEOUT) begin
								stateModExpSub = `OUTPINS;
							end
						end
						
						`OUTPINS:
						begin
							m_bar[i] <= outpMonPro;
							i = i + 1;
							if(i == `TOTAL_ADDR) begin
								i = 0;
								inpMonPro <= 128'h00000000000000000000000000000000;
								stateModExpSub = `NOTASK;
								startMonPro <= 0;
								$display("k_d1: %d, k_d2: %d", k_d1, k_d2);
								if(d_in[k_d1][k_d2] == 1) begin
									stateModExp = `CALC_M_BAR_C_BAR;	// go to m_bar = MonPro(m_bar, c_bar)
								end
								else begin
									if(k_d1 <= 0 && k_d2 <= 0)
										stateModExp = `CALC_M_BAR_1;
									else if(k_d2 == 0) begin	// down 1 of d
										k_d1 = k_d1 - 1;
										k_d2 = `DATA_WIDTH - 1;
									end 
									else begin
										k_d2 = k_d2 - 1;
									end
								end
							end
						end
					endcase
				end
				
				`CALC_M_BAR_C_BAR:	// m_bar = MonPro(m_bar, c_bar)
				begin
					case (stateModExpSub)	
						`NOTASK: 
						begin
							startMonPro = 1;
							stateModExpSub = `INP1;
							i = 0;
						end
						
						`INP1:
						begin
							inpMonPro <= m_bar[i];
							i = i + 1;
							if(i == `TOTAL_ADDR) begin
								i = 0;
								stateModExpSub = `INP2;
							end
						end
						
						`INP2:
						begin
							if(i <= 0) begin		// need some delay here...
								i = i + 1;
							end
							else begin
								inpMonPro <= c_bar[i - 1];
								i = i + 1;
								if(i > `TOTAL_ADDR) begin
									i = 0;
									stateModExpSub = `WAIT;
								end
							end
						end
						
						`WAIT:
						begin
							if(stateMonPro == `WRITEOUT) begin
								stateModExpSub = `OUTPINS;
							end
						end
						
						`OUTPINS:
						begin
							m_bar[i] <= outpMonPro;
							i = i + 1;
							if(i == `TOTAL_ADDR) begin
								i = 0;
								inpMonPro <= 128'h00000000000000000000000000000000;
								stateModExpSub = `NOTASK;
								startMonPro <= 0;
								$display("k_d1: %d, k_d2: %d", k_d1, k_d2);
								if(k_d1 <= 0 && k_d2 <= 0)
									stateModExp = `CALC_M_BAR_1;
								else if(k_d2 == 0) begin	// down 1 of d
									k_d1 = k_d1 - 1;
									k_d2 = `DATA_WIDTH - 1;
									stateModExp = `BIGLOOP;
								end 
								else begin
									k_d2 = k_d2 - 1;
									stateModExp = `BIGLOOP;
								end
							end
						end
					endcase
				end		
	
				
				`CALC_M_BAR_1:	// m = MonPro(1, m_bar)
				begin
					case (stateModExpSub)	
						`NOTASK: 
						begin	
							startMonPro = 1;
							stateModExpSub = `INP1;
							i = 0;
						end
						
						`INP1:
						begin
							inpMonPro <= m_bar[i];
							i = i + 1;
							if(i == `TOTAL_ADDR) begin
								i = 0;
								stateModExpSub = `INP2;
							end
						end
						
						`INP2:
						begin
							if(i <= 0) begin		// need some delay here...
								i = i + 1;
							end
							else begin
								if(i == 1) begin
									inpMonPro <= 128'h00000000000000000000000000000001;
								end
								else begin
									inpMonPro <= 128'h00000000000000000000000000000000;
								end
								i = i + 1;
								if(i > `TOTAL_ADDR) begin
									i = 0;
									stateModExpSub = `WAIT;
								end
							end
						end
						
						`WAIT:
						begin
							if(stateMonPro == `WRITEOUT) begin
								stateModExpSub = `OUTPINS;
							end
						end
						
						`OUTPINS:
						begin
							m_bar[i] <= outpMonPro;
							i = i + 1;
							if(i == `TOTAL_ADDR) begin
								i = 0;
								inpMonPro <= 128'h00000000000000000000000000000000;
								stateModExpSub = `NOTASK;
								stateModExp = `COMPLETE;
								startMonPro <= 0;
							end
						end
					endcase	
				end
				
				`COMPLETE:	// Use a getResult signal to start this output
				begin
					if(getResult) begin
						stateModExp = `OUTPUT_RESULT;
					end				
				end
				
				`OUTPUT_RESULT:	// output 4096 bits result (m_bar) to output buffer!
				begin
					outp = m_bar[i];
					$display("outp[%d]: %h", i, outp);
					i = i + 1;
					if(i == `TOTAL_ADDR) begin
						i = 0;
						stateModExp = `TERMINAL;
					end
				end
				
				`TERMINAL:
				begin
					outp = 128'h00000000000000000000000000000000;
				end
			endcase
		end
	end
	
endmodule
	
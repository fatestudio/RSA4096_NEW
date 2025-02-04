`include "_parameter.v"

module ModExp_tb();
	reg clk;
	reg reset;
	reg startInput;	// tell FPGA to start input 
	reg startCompute;	// tell FPGA to start compute
	reg getResult;	// tell FPGA to output result
	reg [`DATA_WIDTH - 1 : 0] inp;
	wire [4 : 0] stateModExp;	//	for MonExp
	wire [2 : 0] stateModExpSub;
	wire [`DATA_WIDTH - 1 : 0] outp;
	
	ModExp ModExp0(
		.clk(clk), .reset(reset), .startInput(startInput), .startCompute(startCompute), .getResult(getResult), .inp(inp), .stateModExp(stateModExp), .stateModExpSub(stateModExpSub), .outp(outp)
	);
	
	initial begin
		clk = 0;
		reset = 0;
		startInput = 0;
		startCompute = 0;
		getResult = 0;
		#100 startInput = 1;
// inp  is  c 
#10	inp = 32'hc8803b31;
startInput = 0;  // start is just a pulse.

#10	inp = 32'h322d1d34;
#10	inp = 32'hc02ece6d;
#10	inp = 32'hf480c319;
#10	inp = 32'h1c94c914;
#10	inp = 32'h6d440d09;
#10	inp = 32'hd4d3e5c6;
#10	inp = 32'h34729732;
#10	inp = 32'h8d169bb3;
#10	inp = 32'h44ccf6f1;
#10	inp = 32'h9943cb32;
#10	inp = 32'hd6fc5e99;
#10	inp = 32'hdd890f3e;
#10	inp = 32'h73df8d9a;
#10	inp = 32'h50b7f604;
#10	inp = 32'h9b67099a;
#10	inp = 32'hb19761e9;
#10	inp = 32'h91e661bc;
#10	inp = 32'hd4b5fe09;
#10	inp = 32'h2c5430e1;
#10	inp = 32'h651d2b83;
#10	inp = 32'h44acbd39;
#10	inp = 32'h02efa620;
#10	inp = 32'h75ebc302;
#10	inp = 32'hcfee357f;
#10	inp = 32'hec9fa2f1;
#10	inp = 32'ha452dcec;
#10	inp = 32'h730dafa7;
#10	inp = 32'h78ba0bf0;
#10	inp = 32'h8c7e5cd0;
#10	inp = 32'h0a2ec677;
#10	inp = 32'h21d32b3e;
#10	inp = 32'hb1334234;
#10	inp = 32'h2d78e72c;
#10	inp = 32'hdae7c8d8;
#10	inp = 32'hc34500d6;
#10	inp = 32'h75e022c3;
#10	inp = 32'hea8fc9b9;
#10	inp = 32'h7b22c81d;
#10	inp = 32'h65029aaf;
#10	inp = 32'h39beba30;
#10	inp = 32'h54ca7988;
#10	inp = 32'hac39272b;
#10	inp = 32'hf75a6a11;
#10	inp = 32'hc9f338fe;
#10	inp = 32'h9eb6caf5;
#10	inp = 32'ha70dcd74;
#10	inp = 32'h48c8ffee;
#10	inp = 32'h8a37e212;
#10	inp = 32'hb9ec1d2f;
#10	inp = 32'haa8e0889;
#10	inp = 32'hf727c4fe;
#10	inp = 32'h4023e0c0;
#10	inp = 32'h2ae0ed66;
#10	inp = 32'hfb71b931;
#10	inp = 32'h6cc3242d;
#10	inp = 32'h3b0cd369;
#10	inp = 32'h844c9456;
#10	inp = 32'h7748828d;
#10	inp = 32'h7379588a;
#10	inp = 32'h703a0a7a;
#10	inp = 32'h909fb2e8;
#10	inp = 32'he20954eb;
#10	inp = 32'hd40926c7;
#10	inp = 32'h1cb9d1aa;
#10	inp = 32'hbed0e983;
#10	inp = 32'h99f181c8;
#10	inp = 32'h72cdd434;
#10	inp = 32'h70a6de39;
#10	inp = 32'h9e859d08;
#10	inp = 32'hc0476c5c;
#10	inp = 32'h7a5e0b90;
#10	inp = 32'h0037e536;
#10	inp = 32'h1a41708e;
#10	inp = 32'h5a354b66;
#10	inp = 32'hff58cfbf;
#10	inp = 32'h342f5603;
#10	inp = 32'h692eb69a;
#10	inp = 32'h882e6f0f;
#10	inp = 32'h0fedb548;
#10	inp = 32'hf0f53506;
#10	inp = 32'hc69349f2;
#10	inp = 32'h99e58842;
#10	inp = 32'hd3066e27;
#10	inp = 32'hd092b87e;
#10	inp = 32'h7ebc1ff7;
#10	inp = 32'hfb0096eb;
#10	inp = 32'h2372c824;
#10	inp = 32'hb6385cbe;
#10	inp = 32'he371494f;
#10	inp = 32'h3b0c6513;
#10	inp = 32'h1e6eec43;
#10	inp = 32'h4773cc02;
#10	inp = 32'hf4b770a5;
#10	inp = 32'hb5670d1f;
#10	inp = 32'h5da62ebc;
#10	inp = 32'h118185a9;
#10	inp = 32'ha90c8c8d;
#10	inp = 32'h68457ff2;
#10	inp = 32'h8c35b687;
#10	inp = 32'h3931428d;
#10	inp = 32'h4c9b2980;
#10	inp = 32'h75f4aebe;
#10	inp = 32'hf52e8cf1;
#10	inp = 32'h5e2240f6;
#10	inp = 32'ha450c918;
#10	inp = 32'hce682a17;
#10	inp = 32'h6af9db8b;
#10	inp = 32'h02e3306b;
#10	inp = 32'hffc13bee;
#10	inp = 32'hf2d81eb9;
#10	inp = 32'heede6622;
#10	inp = 32'he5568cbd;
#10	inp = 32'h48758d60;
#10	inp = 32'haad7923a;
#10	inp = 32'h636b8ea5;
#10	inp = 32'h5dfab1f2;
#10	inp = 32'h0ab165e0;
#10	inp = 32'h2c91e81e;
#10	inp = 32'hdb4cf556;
#10	inp = 32'h0d0b2a57;
#10	inp = 32'hb2ed901b;
#10	inp = 32'h245993c6;
#10	inp = 32'hbe73f866;
#10	inp = 32'hfe38fefe;
#10	inp = 32'h654f5220;
#10	inp = 32'hfadbeb4f;
#10	inp = 32'h25f49f66;

#10;    // a full clock delay between inputs since we want to switch the state
#10;
#10	startCompute = 1;
	
	#1000
	getResult = 1;

		
		#4294967295;
		#4294967295  $stop;
	end
	
	always begin
	   #5 clk = ~clk;
	end
endmodule

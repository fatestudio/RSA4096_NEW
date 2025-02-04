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
#10	inp = 128'hf480c319c02ece6d322d1d34c8803b31;
startInput = 0;  // start is just a pulse.
#10	inp = 128'h34729732d4d3e5c66d440d091c94c914;
#10	inp = 128'hd6fc5e999943cb3244ccf6f18d169bb3;
#10	inp = 128'h9b67099a50b7f60473df8d9add890f3e;
#10	inp = 128'h2c5430e1d4b5fe0991e661bcb19761e9;
#10	inp = 128'h75ebc30202efa62044acbd39651d2b83;
#10	inp = 128'h730dafa7a452dcecec9fa2f1cfee357f;
#10	inp = 128'h21d32b3e0a2ec6778c7e5cd078ba0bf0;
#10	inp = 128'hc34500d6dae7c8d82d78e72cb1334234;
#10	inp = 128'h65029aaf7b22c81dea8fc9b975e022c3;
#10	inp = 128'hf75a6a11ac39272b54ca798839beba30;
#10	inp = 128'h48c8ffeea70dcd749eb6caf5c9f338fe;
#10	inp = 128'hf727c4feaa8e0889b9ec1d2f8a37e212;
#10	inp = 128'h6cc3242dfb71b9312ae0ed664023e0c0;
#10	inp = 128'h7379588a7748828d844c94563b0cd369;
#10	inp = 128'hd40926c7e20954eb909fb2e8703a0a7a;
#10	inp = 128'h72cdd43499f181c8bed0e9831cb9d1aa;
#10	inp = 128'h7a5e0b90c0476c5c9e859d0870a6de39;
#10	inp = 128'hff58cfbf5a354b661a41708e0037e536;
#10	inp = 128'h0fedb548882e6f0f692eb69a342f5603;
#10	inp = 128'hd3066e2799e58842c69349f2f0f53506;
#10	inp = 128'h2372c824fb0096eb7ebc1ff7d092b87e;
#10	inp = 128'h1e6eec433b0c6513e371494fb6385cbe;
#10	inp = 128'h5da62ebcb5670d1ff4b770a54773cc02;
#10	inp = 128'h8c35b68768457ff2a90c8c8d118185a9;
#10	inp = 128'hf52e8cf175f4aebe4c9b29803931428d;
#10	inp = 128'h6af9db8bce682a17a450c9185e2240f6;
#10	inp = 128'heede6622f2d81eb9ffc13bee02e3306b;
#10	inp = 128'h636b8ea5aad7923a48758d60e5568cbd;
#10	inp = 128'hdb4cf5562c91e81e0ab165e05dfab1f2;
#10	inp = 128'hbe73f866245993c6b2ed901b0d0b2a57;
#10	inp = 128'h25f49f66fadbeb4f654f5220fe38fefe;
#10;    // a full clock delay between inputs since we want to switch the state
#10 inp = 128'h00000000000000000000000000000000;
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

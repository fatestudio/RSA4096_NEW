`include "_parameter.v"

module MonPro_tb();
	reg clk;
	reg reset;
	reg start;
	reg [`DATA_WIDTH - 1 : 0] inp;
	wire [4 : 0] state;
	wire [`DATA_WIDTH - 1 : 0] outp;	// data output pins
	
	MonPro MonPro0(
		.clk(clk), .reset(reset), .start(start), .inp(inp), .state(state), .outp(outp)
	);
	
	initial begin
		clk = 0;
		reset = 0;
		#100 start = 1;
// x
#10	inp = 128'h9ec25c0c7c03478ebe9824fc1b36fd9c;
start = 0;  // start is just a pulse.
#10	inp = 128'h1aff4fa292cfa3eec6260f329eda29d8;
#10	inp = 128'h56711527a2aa1be854d22f3ffede86f2;
#10	inp = 128'h79a90603846c4ce9791151127f410afb;
#10	inp = 128'h23bcdfd51de18a49cf6a12b7a7ba6cb0;
#10	inp = 128'h2c1707cf1603eecfdcbbff34ed193859;
#10	inp = 128'h7ef207b99ae0e650b737deb3a1a40964;
#10	inp = 128'h83aba1f64882b78746c2b474b3ec4438;
#10	inp = 128'h506f02396c32f363766926ca5fc8469d;
#10	inp = 128'hb4c849ed3b86200718e6090c2e39edd6;
#10	inp = 128'haad871a7e7f86f12f410267865e5dbde;
#10	inp = 128'h4f46b2f303e37f54413aa9b4a749c786;
#10	inp = 128'hf153f810cefa9a24b3d26358901bd969;
#10	inp = 128'he58200bfaa73734a36d9f210f2bcc548;
#10	inp = 128'he07926434e4f301466aa8c97c71aedcf;
#10	inp = 128'h7d41d8075d90786a79c0bee236b3a471;
#10	inp = 128'hf0f6e90cffd0736c886fe1375961aaeb;
#10	inp = 128'h5c0002d13fd8abc9c2f362b170ab1acf;
#10	inp = 128'hb79f1aa3658f233a759358b1252f1a3e;
#10	inp = 128'hd734fa473f8388d4f018e8c63e294854;
#10	inp = 128'hd5ad24b9cb505666ae9ecc4db7ab7977;
#10	inp = 128'hc373d15b0fae83fbe1630a5ecb66d31c;
#10	inp = 128'h780e18376106d3e46053144617a22635;
#10	inp = 128'he7a23ff2dbc958e111752fbd04264989;
#10	inp = 128'h5d87ae8b2745d936ec9abebfae1785aa;
#10	inp = 128'h0cb7a6bec02707b89d883d7e5421f79f;
#10	inp = 128'h3c10f85cb37ec67966dd0b72ed415dd0;
#10	inp = 128'hf03cef093bb59568d6aa35231d3f4adf;
#10	inp = 128'ha7f98bc2834875efcac4af23fddf6b7c;
#10	inp = 128'h7ec12aea82e70a564e024d4f1ae1fd7e;
#10	inp = 128'hfedb388703440439995f5b743a03a345;
#10	inp = 128'h85c6fbd7a14b29e9a0c43b9079af1efd;


#10 inp = 128'h00000000000000000000000000000000;    // a full clock delay between inputs since we want to switch the state
// y
#10	inp = 128'h9ec25c0c7c03478ebe9824fc1b36fd9c;
#10	inp = 128'h1aff4fa292cfa3eec6260f329eda29d8;
#10	inp = 128'h56711527a2aa1be854d22f3ffede86f2;
#10	inp = 128'h79a90603846c4ce9791151127f410afb;
#10	inp = 128'h23bcdfd51de18a49cf6a12b7a7ba6cb0;
#10	inp = 128'h2c1707cf1603eecfdcbbff34ed193859;
#10	inp = 128'h7ef207b99ae0e650b737deb3a1a40964;
#10	inp = 128'h83aba1f64882b78746c2b474b3ec4438;
#10	inp = 128'h506f02396c32f363766926ca5fc8469d;
#10	inp = 128'hb4c849ed3b86200718e6090c2e39edd6;
#10	inp = 128'haad871a7e7f86f12f410267865e5dbde;
#10	inp = 128'h4f46b2f303e37f54413aa9b4a749c786;
#10	inp = 128'hf153f810cefa9a24b3d26358901bd969;
#10	inp = 128'he58200bfaa73734a36d9f210f2bcc548;
#10	inp = 128'he07926434e4f301466aa8c97c71aedcf;
#10	inp = 128'h7d41d8075d90786a79c0bee236b3a471;
#10	inp = 128'hf0f6e90cffd0736c886fe1375961aaeb;
#10	inp = 128'h5c0002d13fd8abc9c2f362b170ab1acf;
#10	inp = 128'hb79f1aa3658f233a759358b1252f1a3e;
#10	inp = 128'hd734fa473f8388d4f018e8c63e294854;
#10	inp = 128'hd5ad24b9cb505666ae9ecc4db7ab7977;
#10	inp = 128'hc373d15b0fae83fbe1630a5ecb66d31c;
#10	inp = 128'h780e18376106d3e46053144617a22635;
#10	inp = 128'he7a23ff2dbc958e111752fbd04264989;
#10	inp = 128'h5d87ae8b2745d936ec9abebfae1785aa;
#10	inp = 128'h0cb7a6bec02707b89d883d7e5421f79f;
#10	inp = 128'h3c10f85cb37ec67966dd0b72ed415dd0;
#10	inp = 128'hf03cef093bb59568d6aa35231d3f4adf;
#10	inp = 128'ha7f98bc2834875efcac4af23fddf6b7c;
#10	inp = 128'h7ec12aea82e70a564e024d4f1ae1fd7e;
#10	inp = 128'hfedb388703440439995f5b743a03a345;
#10	inp = 128'h85c6fbd7a14b29e9a0c43b9079af1efd;


#10 inp = 128'h00000000000000000000000000000000;    // set inp to all zeros to make the simulation looks better



		
		
		#1000000  $stop;
	end
	
	always begin
	   #5 clk = ~clk;
	end
endmodule



`timescale 1ns/1ns
/*
	256-bits
*/
module Parity #(
	parameter DATA_WIDTH = 256
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1: 0] p_in,
	output [DATA_WIDTH-1: 0] p_out
);

genvar i;

wire [31:0] w_32,w_64,w_96,w_128,w_160,w_192,w_224,w_256;

generate for( i = 0; i < DATA_WIDTH; i = i + 32)
	begin : loop
		wire [7:0] t1,t2,t3,t4;
		Parity_8bit inst1(.clk(clk),.enable(enable), .a(p_in[i+7:i]), .out(t1));
		Parity_8bit inst2(.clk(clk),.enable(enable), .a(p_in[i+15:i+8]), .out(t2));
		Parity_8bit inst3(.clk(clk), .enable(enable), .a(p_in[i+23:i+16]), .out(t3));
		Parity_8bit inst4(.clk(clk), .enable(enable), .a(p_in[i+31:i+24]), .out(t4));
		
		if(i == 0) assign w_32 = t1 ^ t2 ^ t3 ^ t4; // 32-bits
		if(i == 32) assign w_64 = t1 ^ t2 ^ t3 ^ t4; // 32-bits
		if(i == 64) assign w_96 = t1 ^ t2 ^ t3 ^ t4; // 32-bits
		if(i == 96) assign w_128 = t1 ^ t2 ^ t3 ^ t4; // 32-bits
		if(i == 128) assign w_160 = t1 ^ t2 ^ t3 ^ t4; // 32-bits
		if(i == 160) assign w_192 = t1 ^ t2 ^ t3 ^ t4; // 32-bits
		if(i == 192) assign w_224 = t1 ^ t2 ^ t3 ^ t4; // 32-bits
		if(i == 224) assign w_256 = t1 ^ t2 ^ t3 ^ t4; // 32-bits
	end
endgenerate

assign p_out = w_32 ^ w_64 ^ w_96 ^ w_128 ^ w_160 ^ w_192 ^ w_224 ^ w_256;

endmodule

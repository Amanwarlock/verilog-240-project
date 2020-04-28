`timescale 1ns/1ns
module Popcount#(
	parameter DATA_WIDTH = 256
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1:0] pop_in,
	output [DATA_WIDTH-1:0] pop_out
);

wire [31:0] w1, w2, w3, w4, w5, w6, w7, w8;

Popcount_32bit popcount1(.clk(clk),.enable(enable),.p_in(pop_in[31:0]), .p_out(w1));
Popcount_32bit popcount2(.clk(clk),.enable(enable),.p_in(pop_in[63:32]), .p_out(w2));
Popcount_32bit popcount3(.clk(clk),.enable(enable),.p_in(pop_in[95:64]), .p_out(w3));
Popcount_32bit popcount4(.clk(clk),.enable(enable),.p_in(pop_in[127:96]), .p_out(w4));
Popcount_32bit popcount5(.clk(clk),.enable(enable),.p_in(pop_in[159:128]), .p_out(w5));
Popcount_32bit popcount6(.clk(clk),.enable(enable),.p_in(pop_in[191:160]), .p_out(w6));
Popcount_32bit popcount7(.clk(clk),.enable(enable),.p_in(pop_in[223:192]), .p_out(w7));
Popcount_32bit popcount8(.clk(clk),.enable(enable),.p_in(pop_in[255:224]), .p_out(w8));

assign pop_out = w1 + w2 + w3 + w4 + w5 + w6 + w7 + w8;

endmodule

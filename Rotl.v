`timescale 1ns/1ns

module Rotl #(
	parameter DATA_WIDTH = 256
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1:0] a_in,
	input [DATA_WIDTH-1:0] shift_in,
	output [DATA_WIDTH-1:0] a_out
);

parameter WIDTH = DATA_WIDTH - 1;

wire [DATA_WIDTH-1:0] a_rev;

genvar i;

assign a_out = a_in << shift_in;

//Rotr #(.DATA_WIDTH(DATA_WIDTH)) rotr (.clk(clk), .enable(enable), .a_in(a_rev), .shift_in(shift_in), .a_out(a_rev));

//assign a_out = {a_rev[255:192], a_rev[191:128], a_rev[127:64], a_rev[63:0]};
//assign a_out = {a_in[255:192], a_in[191:128], a_in[127:64], a_in[63:0]};

/*Bitreverse #(.DATA_WIDTH(DATA_WIDTH)) bitrev (.clk(clk), .enable(enable), .a_in(a_in), .a_rev(a_rev));
Rotr #(.DATA_WIDTH(DATA_WIDTH)) rotr (.clk(clk), .enable(enable), .a_in(a_rev), .shift_in(shift_in), .a_out(a_out));*/

/*
Mux_256x1  mux_1(.clk(clk), .sel(WIDTH - shift_in[7:0]), .a_in(a_in), .out(a_out[DATA_WIDTH-1]));
Mux_256x1  mux_2(.clk(clk), .sel(WIDTH - shift_in[7:0]), .a_in({a_in[DATA_WIDTH-2:0],a_in[DATA_WIDTH-1]}), .out(a_out[DATA_WIDTH-2]));


generate for(i = 3; i <= DATA_WIDTH; i = i + 1) begin : loop
	
	Mux_256x1  mux_3(.clk(clk), .sel(WIDTH - shift_in[7:0]), .a_in({a_in[DATA_WIDTH-i:0],a_in[DATA_WIDTH-1: DATA_WIDTH-i+1]}), .out(a_out[DATA_WIDTH-i]));

end

endgenerate
*/

endmodule

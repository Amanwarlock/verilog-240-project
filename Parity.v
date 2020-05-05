

`timescale 1ns/1ns
/*
	256-bits
*/
module Parity #(
	parameter DATA_WIDTH = 1024
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1: 0] p_in,
	output [DATA_WIDTH-1: 0] p_out
);

genvar i;

reg [DATA_WIDTH-1: 0] p_in_reg;

wire [63:0] w [0:15];

always @(posedge clk) begin
	p_in_reg <= #1 p_in;
end


Parity_64 pa_1(.clk(clk), .enable(enable), .a(p_in_reg[63:0]), .out(w[0]));
Parity_64 pa_2(.clk(clk), .enable(enable), .a(p_in_reg[127:64]), .out(w[1]));
Parity_64 pa_3(.clk(clk), .enable(enable), .a(p_in_reg[191:128]), .out(w[2]));
Parity_64 pa_4(.clk(clk), .enable(enable), .a(p_in_reg[255:192]), .out(w[3]));
Parity_64 pa_5(.clk(clk), .enable(enable), .a(p_in_reg[319:256]), .out(w[4]));
Parity_64 pa_6(.clk(clk), .enable(enable), .a(p_in_reg[383:320]), .out(w[5]));
Parity_64 pa_7(.clk(clk), .enable(enable), .a(p_in_reg[447:384]), .out(w[6]));
Parity_64 pa_8(.clk(clk), .enable(enable), .a(p_in_reg[511:448]), .out(w[7]));
Parity_64 pa_9(.clk(clk), .enable(enable), .a(p_in_reg[575:512]), .out(w[8]));
Parity_64 pa_10(.clk(clk), .enable(enable), .a(p_in_reg[639:576]), .out(w[9]));
Parity_64 pa_11(.clk(clk), .enable(enable), .a(p_in_reg[703:640]), .out(w[10]));
Parity_64 pa_12(.clk(clk), .enable(enable), .a(p_in_reg[767:704]), .out(w[11]));
Parity_64 pa_13(.clk(clk), .enable(enable), .a(p_in_reg[831:768]), .out(w[12]));
Parity_64 pa_14(.clk(clk), .enable(enable), .a(p_in_reg[895:832]), .out(w[13]));
Parity_64 pa_15(.clk(clk), .enable(enable), .a(p_in_reg[959:896]), .out(w[14]));
Parity_64 pa_16(.clk(clk), .enable(enable), .a(p_in_reg[1023:960]), .out(w[15]));


assign p_out = w[0] ^ w[1];

endmodule

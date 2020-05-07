

`timescale 1ns/1ns
/*
	256-bits
*/
module Parity #(
	parameter DATA_WIDTH = 512
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1: 0] p_in,
	output [DATA_WIDTH-1: 0] p_out
);

reg enable_reg;
reg [DATA_WIDTH-1: 0] p_in_reg;

wire [63:0] w [0:7];

always @(posedge clk) begin
	p_in_reg <= p_in;
	enable_reg <= enable;
end


Parity_64 pa_1(.clk(clk), .enable(enable_reg), .a(p_in_reg[63:0]), .out(w[0]));
Parity_64 pa_2(.clk(clk), .enable(enable_reg), .a(p_in_reg[127:64]), .out(w[1]));
Parity_64 pa_3(.clk(clk), .enable(enable_reg), .a(p_in_reg[191:128]), .out(w[2]));
Parity_64 pa_4(.clk(clk), .enable(enable_reg), .a(p_in_reg[255:192]), .out(w[3]));
Parity_64 pa_5(.clk(clk), .enable(enable_reg), .a(p_in_reg[319:256]), .out(w[4]));
Parity_64 pa_6(.clk(clk), .enable(enable_reg), .a(p_in_reg[383:320]), .out(w[5]));
Parity_64 pa_7(.clk(clk), .enable(enable_reg), .a(p_in_reg[447:384]), .out(w[6]));
Parity_64 pa_8(.clk(clk), .enable(enable_reg), .a(p_in_reg[511:448]), .out(w[7]));

assign p_out = w[0] ^ w[1] ^ w[2] ^ w[3] ^ w[4] ^ w[5] ^ w[6] ^ w[7];

endmodule

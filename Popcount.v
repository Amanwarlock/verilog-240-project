module Popcount #(
	parameter DATA_WIDTH = 1024
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1:0] pop_in,
	output reg [DATA_WIDTH-1:0] pop_out
);

reg enable_reg;
reg [DATA_WIDTH-1:0] pop_in_reg;

wire [63:0] t [15:0];

always @(posedge clk) begin
	enable_reg <= enable;
	pop_in_reg <= pop_in;
end

Popcount_64 pop_1(.clk(clk), .enable(enable), .a(pop_in_reg[63:0]), .out(t[0]));
Popcount_64 pop_2(.clk(clk), .enable(enable), .a(pop_in_reg[127:64]), .out(t[1]));
Popcount_64 pop_3(.clk(clk), .enable(enable), .a(pop_in_reg[191:128]), .out(t[2]));
Popcount_64 pop_4(.clk(clk), .enable(enable), .a(pop_in_reg[255:192]), .out(t[3]));
Popcount_64 pop_5(.clk(clk), .enable(enable), .a(pop_in_reg[319:256]), .out(t[4]));
Popcount_64 pop_6(.clk(clk), .enable(enable), .a(pop_in_reg[383:320]), .out(t[5]));
Popcount_64 pop_7(.clk(clk), .enable(enable), .a(pop_in_reg[447:384]), .out(t[6]));
Popcount_64 pop_8(.clk(clk), .enable(enable), .a(pop_in_reg[511:448]), .out(t[7]));
Popcount_64 pop_9(.clk(clk), .enable(enable), .a(pop_in_reg[575:512]), .out(t[8]));
Popcount_64 pop_10(.clk(clk), .enable(enable), .a(pop_in_reg[639:576]), .out(t[9]));
Popcount_64 pop_11(.clk(clk), .enable(enable), .a(pop_in_reg[703:640]), .out(t[10]));
Popcount_64 pop_12(.clk(clk), .enable(enable), .a(pop_in_reg[767:704]), .out(t[11]));
Popcount_64 pop_13(.clk(clk), .enable(enable), .a(pop_in_reg[831:768]), .out(t[12]));
Popcount_64 pop_14(.clk(clk), .enable(enable), .a(pop_in_reg[895:832]), .out(t[13]));
Popcount_64 pop_15(.clk(clk), .enable(enable), .a(pop_in_reg[959:896]), .out(t[14]));
Popcount_64 pop_16(.clk(clk), .enable(enable), .a(pop_in_reg[1023:960]), .out(t[15]));

always @(posedge clk) begin
	pop_out <= t[0] + t[1] + t[2] + t[3] + t[4] + t[5] + t[6] + t[7] + 
		 t[8] + t[9] + t[10] + t[11] + t[12] + t[13] + t[14] + t[15];
end

/*
assign pop_out = t[0] + t[1] + t[2] + t[3] + t[4] + t[5] + t[6] + t[7] + 
		 t[8] + t[9] + t[10] + t[11] + t[12] + t[13] + t[14] + t[15];
*/
endmodule

module Popcount #(
	parameter DATA_WIDTH = 512
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1:0] pop_in,
	output [DATA_WIDTH-1:0] pop_out
);

reg enable_reg;
reg [DATA_WIDTH-1:0] pop_in_reg;

wire [63:0] t [0:7];

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

assign pop_out = t[0] + t[1] + t[2] + t[3] + t[4] + t[5] + t[6] + t[7];

endmodule

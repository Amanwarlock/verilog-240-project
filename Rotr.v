module Rotr #(
	parameter DATA_WIDTH = 512
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1:0] a,
	input [DATA_WIDTH-1:0] shift_mag,
	output [DATA_WIDTH-1:0] out
);

reg enable_reg;
reg [DATA_WIDTH-1:0] a_reg, out_reg,t,shift_mag_reg;

always @(posedge clk) begin
	enable_reg <= enable;
	a_reg <= a;
	shift_mag_reg <= shift_mag;
end

always @(posedge clk) 
	 out_reg = a_reg >> shift_mag_reg;

assign out = out_reg;

endmodule

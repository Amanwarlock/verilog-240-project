`timescale 1ns/1ns
module Mux #(
	parameter DATA_WIDTH = 512
)(
	input clk,
	input [2:0] opcode,
	input [DATA_WIDTH-1:0] parity_out,
	input [DATA_WIDTH-1:0] popcount_out,
	input [DATA_WIDTH-1:0] rotr_out,
	input [DATA_WIDTH-1:0] rotl_out,
	output[DATA_WIDTH-1:0] alu_out
);

parameter PARITY = 3'b000, //0
	  POPCOUNT = 3'b001, //1
	  ROTR = 3'b010, //2
	  ROTL = 3'b011; // 3 

reg [2:0] op_reg;

reg [DATA_WIDTH-1:0]	parity_out_reg,
			popcount_out_reg,
			rotr_out_reg,
			rotl_out_reg,
			result_reg;

always @(posedge clk) begin
	op_reg <= opcode;
	parity_out_reg <= parity_out;
	popcount_out_reg <= popcount_out;
	rotr_out_reg <= rotr_out;
	rotl_out_reg <= rotl_out;
end

always @(negedge clk) begin
	case(op_reg)
		PARITY: result_reg <= parity_out_reg;
		POPCOUNT: result_reg <= popcount_out_reg;
		ROTR: result_reg <= rotr_out_reg;
		ROTL: result_reg <= rotl_out_reg;
		default: result_reg <= 512'b0;
	endcase
end

assign alu_out = result_reg;

endmodule

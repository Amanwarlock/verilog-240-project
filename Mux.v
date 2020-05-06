`timescale 1ns/1ns
module Mux #(
	parameter DATA_WIDTH = 1024
)(
	input clk,
	input [2:0] opcode,
	input [DATA_WIDTH-1:0] parity_out,
	input [DATA_WIDTH-1:0] popcount_out,
	input [DATA_WIDTH-1:0] rotr_out,
	input [DATA_WIDTH-1:0] rotl_out,
	output reg [DATA_WIDTH-1:0] alu_out
);

parameter PARITY = 3'b000, //0
	  POPCOUNT = 3'b001, //1
	  ROTR = 3'b010, //2
	  ROTL = 3'b011; // 3 

always @(parity_out,popcount_out,rotr_out,rotl_out) begin
	case(opcode) 
		PARITY: alu_out =  parity_out;
		POPCOUNT: alu_out = popcount_out;
		ROTR: alu_out =  rotr_out;
		ROTL: alu_out = rotl_out;
		default: alu_out = 0;
	endcase
end

endmodule

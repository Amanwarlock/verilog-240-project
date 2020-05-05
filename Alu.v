
`timescale 1ns/1ns
/*
	256-bits
*/
module Alu #(
	parameter DATA_WIDTH = 1024
)(
	input clk,
	input [2:0] opcode,
	input [DATA_WIDTH-1: 0] A_in,
	input [DATA_WIDTH-1: 0] B_in,
	output[DATA_WIDTH-1: 0] Alu_out
);

parameter PARITY = 3'b000, //0
	  POPCOUNT = 3'b001, //1
	  ROTR = 3'b010, //2
	  ROTL = 3'b011; // 3 

reg [DATA_WIDTH-1: 0]	parity_in,
			popcount_in;

reg	parity_enable,
	popcount_enable;

wire [DATA_WIDTH-1: 0]	parity_out,
			popcount_out;
	 
always @(posedge clk) begin
	
	case (opcode)
		PARITY: begin
			parity_enable <= #1 1'b1;
			parity_in <= #1 A_in;
		end
		POPCOUNT: begin
			popcount_enable <= #1 1'b1;
			popcount_in <= #1 A_in;
		end
		default: begin
			parity_enable <= 1'b0;
			popcount_enable <= 1'b0;
		end
	endcase

end

Parity #(.DATA_WIDTH(DATA_WIDTH)) parity_module(.clk(clk), .enable(parity_enable), .p_in(parity_in), .p_out(parity_out));

Popcount #(.DATA_WIDTH(DATA_WIDTH)) popcount_module(.clk(clk), .enable(popcount_enable), .pop_in(popcount_in), .pop_out(popcount_out));

Mux #(.DATA_WIDTH(DATA_WIDTH)) mux_module(.clk(clk), .opcode(opcode), .parity_out(parity_out), .popcount_out(popcount_out), .alu_out(Alu_out));

endmodule
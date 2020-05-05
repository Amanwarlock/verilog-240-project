
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
			popcount_in,
			rotr_in,
			rotl_in,
			shift_mag;

reg	parity_enable,
	popcount_enable,
	rotr_enable,
	rotl_enable;

wire [DATA_WIDTH-1: 0]	parity_out,
			popcount_out,
			rotr_out,
			rotl_out;

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
		ROTR: begin
			rotr_enable <= 1'b1;
			rotr_in <= A_in;
			shift_mag <= B_in;
		end
		ROTL: begin
			rotl_enable <= 1'b1;
			rotl_in <= A_in;
			shift_mag <= B_in;
		end
		default: begin
			parity_enable <= 1'b0;
			popcount_enable <= 1'b0;
		end
	endcase

end

Parity #(.DATA_WIDTH(DATA_WIDTH)) parity_module(.clk(clk), .enable(parity_enable), .p_in(parity_in), .p_out(parity_out));

Popcount #(.DATA_WIDTH(DATA_WIDTH)) popcount_module(.clk(clk), .enable(popcount_enable), .pop_in(popcount_in), .pop_out(popcount_out));

Rotr #(.DATA_WIDTH(DATA_WIDTH)) rotr_module(.clk(clk), .enable(rotr_enable), .a(rotr_in), .shift_mag(shift_mag), .out(rotr_out));

Rotl #(.DATA_WIDTH(DATA_WIDTH)) rotl_module(.clk(clk), .enable(rotl_enable), .a(rotl_in), .shift_mag(shift_mag), .out(rotl_out));

Mux #(.DATA_WIDTH(DATA_WIDTH)) mux_module(.clk(clk), .opcode(opcode), .parity_out(parity_out), .popcount_out(popcount_out), .rotr_out(rotr_out), .rotl_out(rotl_out), .alu_out(Alu_out));

endmodule
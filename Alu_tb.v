
`timescale 1ns/1ns
module Alu_tb();

parameter DATA_WIDTH = 1024;

parameter PARITY = 3'b000, //0
	  POPCOUNT = 3'b001, //1
	  ROTR = 3'b010, //2
	  ROTL = 3'b011; // 3 
reg clk;
reg [2:0] opcode;
reg [DATA_WIDTH-1:0] a_in, b_in;
wire [DATA_WIDTH-1:0] alu_out;

Alu #(.DATA_WIDTH(DATA_WIDTH)) alu(
	.clk(clk),
	.opcode(opcode),
	.A_in(a_in),
	.B_in(b_in),
	.Alu_out(alu_out)
);

always #5 clk = ~clk;

initial begin

clk = 0;

$monitor($time , " Opcode = %b, A = %b, B = %b, Alu Out = %b, Alu Out = %d",opcode,a_in[7:0],b_in[7:0],alu_out,alu_out);

//$monitor($time , " Opcode = %b, A = %b, B = %b, parity Out = %b , Popcount = %b, Rotr = %b, Rotl = %b ",opcode,a_in[7:0],b_in[7:0],parity_out, popcount_out, rotr_out, rotl_out);


#5 opcode = PARITY; a_in = 256'b10101100; b_in = 256'b10101100; // Parity operation, even 1's , result = 0;
#5 opcode = PARITY; a_in = 256'b10101101; b_in = 256'b10101101; // Parity operation, odd 1's , result = 1;

#5 opcode = POPCOUNT; a_in = 256'b10101101; b_in = 256'b10101101; // Popcount operation,result = 5;
#5 opcode = POPCOUNT; a_in = 256'b11101101; b_in = 256'b11101101; // Popcount operation,result = 6;  


#5 opcode = ROTR; a_in = 256'b10101101; b_in = 256'b00000011; // ROTR operation, ShiftBy = 3; 
#5 opcode = ROTL; a_in = {8'b10101101, {248{1'b0}}}; b_in = 256'b00000011; // ROTL operation 

#200 $finish;

end

endmodule
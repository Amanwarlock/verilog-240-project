module Parity_64(
	input clk,
	input enable,
	input [63:0] a,
	output [63:0]out
);

reg enable_reg;
reg [63:0] a_in_reg;
reg [31:0] t;

always @(posedge clk) begin
	a_in_reg <= a;
	enable_reg <= enable;
end

always @(*) begin
	if(enable_reg == 1'b1) begin
		t[0] = a_in_reg[0] ^ a_in_reg[1];
		t[1] = a_in_reg[2] ^ a_in_reg[3];
		t[2] = a_in_reg[4] ^ a_in_reg[5];
		t[3] = a_in_reg[6] ^ a_in_reg[7];
		t[4] = a_in_reg[8] ^ a_in_reg[9];
		t[5] = a_in_reg[10] ^ a_in_reg[11];
		t[6] = a_in_reg[12] ^ a_in_reg[13];
		t[7] = a_in_reg[14] ^ a_in_reg[15];
		t[8] = a_in_reg[16] ^ a_in_reg[17];
		t[9] = a_in_reg[18] ^ a_in_reg[19];
		t[10] = a_in_reg[20] ^ a_in_reg[21];
		t[11] = a_in_reg[22] ^ a_in_reg[23];
		t[12] = a_in_reg[24] ^ a_in_reg[25];
		t[13] = a_in_reg[26] ^ a_in_reg[27];
		t[14] = a_in_reg[28] ^ a_in_reg[29];
		t[15] = a_in_reg[30] ^ a_in_reg[31];
		t[16] = a_in_reg[32] ^ a_in_reg[33];
		t[17] = a_in_reg[34] ^ a_in_reg[35];
		t[18] = a_in_reg[36] ^ a_in_reg[37];
		t[19] = a_in_reg[38] ^ a_in_reg[39];
		t[20] = a_in_reg[40] ^ a_in_reg[41];
		t[21] = a_in_reg[42] ^ a_in_reg[43];
		t[22] = a_in_reg[44] ^ a_in_reg[45];
		t[23] = a_in_reg[46] ^ a_in_reg[47];
		t[24] = a_in_reg[48] ^ a_in_reg[49];
		t[25] = a_in_reg[50] ^ a_in_reg[51];
		t[26] = a_in_reg[52] ^ a_in_reg[53];
		t[27] = a_in_reg[54] ^ a_in_reg[55];
		t[28] = a_in_reg[56] ^ a_in_reg[57];
		t[29] = a_in_reg[58] ^ a_in_reg[59];
		t[30] = a_in_reg[60] ^ a_in_reg[61];
		t[31] = a_in_reg[62] ^ a_in_reg[63];
	end
end

assign out =  	t[0] ^ t[1] ^ t[2] ^ t[3] ^ t[4] ^ t[5] ^ t[6] ^ t[7] ^ t[8] ^
		t[9] ^ t[10] ^ t[11] ^ t[12] ^ t[13] ^ t[14] ^ t[15] ^ t[16] ^
		t[17] ^ t[18] ^ t[19] ^ t[20] ^ t[21] ^ t[22] ^ t[23] ^ t[24] ^
		t[25] ^ t[26] ^ t[27] ^ t[28] ^ t[29] ^ t[30] ^ t[31]; 

endmodule

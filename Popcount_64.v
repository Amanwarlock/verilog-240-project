module Popcount_64(
	input clk,
	input enable,
	input [63:0] a,
	output[63:0] out
);

reg [63:0] a_reg;
reg enable_reg;

reg [7:0] t [0:7];

always @(posedge clk) begin
	a_reg <= a;
	enable_reg <= enable;
end

always @(posedge clk) begin
	if(enable_reg == 1'b1) begin
		t[0] <= a_reg[0] + a_reg[1] + a_reg[2] + a_reg[3] + a_reg[4] + a_reg[5] + a_reg[6] + a_reg[7];
		t[1] <= a_reg[8] + a_reg[9] + a_reg[10] + a_reg[11] + a_reg[12] + a_reg[13] + a_reg[14] + a_reg[15];
		t[2] <= a_reg[16] + a_reg[17] + a_reg[18] + a_reg[19] + a_reg[20] + a_reg[21] + a_reg[22] + a_reg[23];
		t[3] <= a_reg[24] + a_reg[25] + a_reg[26] + a_reg[27] + a_reg[28] + a_reg[29] + a_reg[30] + a_reg[31];
		t[4] <= a_reg[32] + a_reg[33] + a_reg[34] + a_reg[35] + a_reg[36] + a_reg[37] + a_reg[38] + a_reg[39];
		t[5] <= a_reg[40] + a_reg[41] + a_reg[42] + a_reg[43] + a_reg[44] + a_reg[45] + a_reg[46] + a_reg[47];
		t[6] <= a_reg[48] + a_reg[49] + a_reg[50] + a_reg[51] + a_reg[52] + a_reg[53] + a_reg[54] + a_reg[55];
		t[7] <= a_reg[56] + a_reg[57] + a_reg[58] + a_reg[59] + a_reg[60] + a_reg[61] + a_reg[62] + a_reg[63];
	end
end

assign out = t[0] + t[1] + t[2] + t[3] + t[4] + t[5] + t[6] + t[7];

endmodule
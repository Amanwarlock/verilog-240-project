module Popcount_32bit(
	input clk,
	input enable,
	input [31:0] p_in,
	output reg [31:0] p_out
);

reg [7:0] r1, r2, r3, r4;

always @(clk or enable or p_in) begin

if(enable == 1'b1) begin 
	r1 = p_in[0] + p_in[1] + p_in[2] + p_in[3] + p_in[4] + p_in[5] + p_in[6] + p_in[7];
	r2 = p_in[8] + p_in[9] + p_in[10] + p_in[11] + p_in[12] + p_in[13] + p_in[14] + p_in[15];
	r3 = p_in[16] + p_in[17] + p_in[18] + p_in[19] + p_in[20] + p_in[21] + p_in[22] + p_in[23];
	r4 = p_in[24] + p_in[25] + p_in[26] + p_in[27] + p_in[28] + p_in[29] + p_in[30] + p_in[31];

	p_out = r1 + r2 + r3 + r4;
end

end


endmodule

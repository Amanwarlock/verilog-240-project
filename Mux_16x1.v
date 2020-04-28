module Mux_16x1(
	input clk,
	input [15:0] a,
	input [3:0] sel,
	output reg out
);

always @(clk) begin
	case(sel)
		0000: out = a[0];
		0001: out = a[1];
		0010: out = a[2];
		0011: out = a[3];
		0100: out = a[4];
		0101: out = a[5];
		0110: out = a[6];
		0111: out = a[7];
		1000: out = a[8];
		1001: out = a[9];
		1010: out = a[10];
		1011: out = a[11];
		1100: out = a[12];
		1101: out = a[13];
		1110: out = a[14];
		1111: out = a[15];	
	endcase
end

endmodule

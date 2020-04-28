module Mux_256x1(
	input clk,
	input [255:0] a,
	input [7:0] sel,
	output out
);

wire [15:0] w;

Mux_16x1 mux1(.clk(clk), .sel(sel[3:0]), .a(a[15:0]), .out(w[0]));
Mux_16x1 mux2(.clk(clk), .sel(sel[3:0]), .a(a[31:16]), .out(w[1]));
Mux_16x1 mux3(.clk(clk), .sel(sel[3:0]), .a(a[47:32]), .out(w[2]));
Mux_16x1 mux4(.clk(clk), .sel(sel[3:0]), .a(a[63:48]), .out(w[3]));

Mux_16x1 mux5(.clk(clk), .sel(sel[3:0]), .a(a[79:64]), .out(w[4]));
Mux_16x1 mux6(.clk(clk), .sel(sel[3:0]), .a(a[95:80]), .out(w[5]));
Mux_16x1 mux7(.clk(clk), .sel(sel[3:0]), .a(a[111:96]), .out(w[6]));
Mux_16x1 mux8(.clk(clk), .sel(sel[3:0]), .a(a[127:112]), .out(w[7]));

Mux_16x1 mux9(.clk(clk), .sel(sel[3:0]), .a(a[143:128]), .out(w[8]));
Mux_16x1 mux10(.clk(clk), .sel(sel[3:0]), .a(a[159:144]), .out(w[9]));
Mux_16x1 mux11(.clk(clk), .sel(sel[3:0]), .a(a[175:160]), .out(w[10]));
Mux_16x1 mux12(.clk(clk), .sel(sel[3:0]), .a(a[191:176]), .out(w[11]));

Mux_16x1 mux13(.clk(clk), .sel(sel[3:0]), .a(a[207:192]), .out(w[12]));
Mux_16x1 mux14(.clk(clk), .sel(sel[3:0]), .a(a[223:208]), .out(w[13]));
Mux_16x1 mux15(.clk(clk), .sel(sel[3:0]), .a(a[239:224]), .out(w[14]));
Mux_16x1 mux16(.clk(clk), .sel(sel[3:0]), .a(a[255:240]), .out(w[15]));

Mux_16x1 mux17(.clk(clk), .sel(sel[7:4]), .a(w), .out(out));

endmodule

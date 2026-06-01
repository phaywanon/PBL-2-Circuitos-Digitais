module registrador8bits(
	input [7:0] ENT,
	input clk,
	input en,
	output [7:0] S
);
	flipflop_D_descida flip0(
	.d(ENT[0]), .clk(clk),	.rst_n(1'b1),	.en(en),	.q(S[0])
);
	flipflop_D_descida flip1(
	.d(ENT[1]), .clk(clk), .rst_n(1'b1), .en(en), .q(S[1])
);
	flipflop_D_descida flip2(
	.d(ENT[2]), .clk(clk), .rst_n(1'b1), .en(en), .q(S[2])
);
	flipflop_D_descida flip3(
	.d(ENT[3]), .clk(clk), .rst_n(1'b1), .en(en), .q(S[3])
);
	flipflop_D_descida flip4(
	.d(ENT[4]), .clk(clk), .rst_n(1'b1), .en(en), .q(S[4])
);
	flipflop_D_descida flip5(
	.d(ENT[5]), .clk(clk), .rst_n(1'b1), .en(en), .q(S[5])
);
	flipflop_D_descida flip6(
	.d(ENT[6]), .clk(clk), .rst_n(1'b1), .en(en), .q(S[6])
);
	flipflop_D_descida flip7(
	.d(ENT[7]), .clk(clk), .rst_n(1'b1), .en(en), .q(S[7])
);
endmodule
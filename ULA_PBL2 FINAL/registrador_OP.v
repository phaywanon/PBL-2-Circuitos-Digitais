module registrador_OP(
	input [2:0] OP,
	input clk,
	input en,
	output [2:0] S
);
	flipflop_D_descida flip0(
	.d(OP[0]), .clk(clk),	.rst_n(1'b1),	.en(en),	.q(S[0])
);
	
	flipflop_D_descida flip1(
	.d(OP[1]), .clk(clk), .rst_n(1'b1), .en(en), .q(S[1])
);
	flipflop_D_descida flip2(
	.d(OP[2]), .clk(clk), .rst_n(1'b1), .en(en), .q(S[2])
);

endmodule
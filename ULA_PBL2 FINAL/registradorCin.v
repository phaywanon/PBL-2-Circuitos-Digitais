module registradorCin(
	input Cin,
	input clk,
	input en,
	output S
);

	flipflop_D_descida flip0(
	.d(Cin), .clk(clk),	.rst_n(1'b1),	.en(en),	.q(S)
);
endmodule
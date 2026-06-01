module subtrator_8bits(
    input [7:0] A,
    input [7:0] B,
    input Bin,
    output [7:0] Dif,
    output Bout
);	
wire bout0_bin1, bout1_bin2, bout2_bin3, bout3_bin4, bout4_bin5, bout5_bin6, bout6_bin7;

	subtrator_1bit subtrator1(
	.A(A[0]),
	.B(B[0]),
	.Bin(Bin),
	.Dif(Dif[0]),
	.Bout(bout0_bin1)
);
	subtrator_1bit subtrator2(
	.A(A[1]),
	.B(B[1]),
	.Bin(bout0_bin1),
	.Dif(Dif[1]),
	.Bout(bout1_bin2)
);
	subtrator_1bit subtrator3(
	.A(A[2]),
	.B(B[2]),
	.Bin(bout1_bin2),
	.Dif(Dif[2]),
	.Bout(bout2_bin3)
);
	subtrator_1bit subtrator4(
	.A(A[3]),
	.B(B[3]),
	.Bin(bout2_bin3),
	.Dif(Dif[3]),
	.Bout(bout3_bin4)
);

	subtrator_1bit subtrator5(
	.A(A[4]),
	.B(B[4]),
	.Bin(bout3_bin4),
	.Dif(Dif[4]),
	.Bout(bout4_bin5)
);
	subtrator_1bit subtrator6(
	.A(A[5]),
	.B(B[5]),
	.Bin(bout4_bin5),
	.Dif(Dif[5]),
	.Bout(bout5_bin6)
);
	subtrator_1bit subtrator7(
	.A(A[6]),
	.B(B[6]),
	.Bin(bout5_bin6),
	.Dif(Dif[6]),
	.Bout(bout6_bin7)
);
	subtrator_1bit subtrator8(
	.A(A[7]),
	.B(B[7]),
	.Bin(bout6_bin7),
	.Dif(Dif[7]),
	.Bout(Bout)
);

endmodule

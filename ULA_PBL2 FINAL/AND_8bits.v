module AND_8bits (
	input [7:0] A,
	input [7:0] B,
	output [7:0] S
);
	PortaAnd And1(
	.A(A[0]),
	.B(B[0]),
	.S(S[0])
);
	PortaAnd And2(
	.A(A[1]),
	.B(B[1]),
	.S(S[1])
);
	PortaAnd And3(
	.A(A[2]),
	.B(B[2]),
	.S(S[2])
);
	PortaAnd And4(
	.A(A[3]),
	.B(B[3]),
	.S(S[3])
);
	PortaAnd And5(
	.A(A[4]),
	.B(B[4]),
	.S(S[4])
);
	PortaAnd And6(
	.A(A[5]),
	.B(B[5]),
	.S(S[5])
);
	PortaAnd And7(
	.A(A[6]),
	.B(B[6]),
	.S(S[6])
);
	PortaAnd And8(
	.A(A[7]),
	.B(B[7]),
	.S(S[7])
);

endmodule

module OR_8bits (
	input [7:0] A,
	input [7:0] B,
	output [7:0] S
);
	PortaOR Or1(
	.A(A[0]),
	.B(B[0]),
	.S(S[0])
);
	PortaOR Or2(
	.A(A[1]),
	.B(B[1]),
	.S(S[1])
);
	PortaOR Or3(
	.A(A[2]),
	.B(B[2]),
	.S(S[2])
);
	PortaOR Or4(
	.A(A[3]),
	.B(B[3]),
	.S(S[3])
);
	PortaOR Or5(
	.A(A[4]),
	.B(B[4]),
	.S(S[4])
);
	PortaOR Or6(
	.A(A[5]),
	.B(B[5]),
	.S(S[5])
);
	PortaOR Or7(
	.A(A[6]),
	.B(B[6]),
	.S(S[6])
);
	PortaOR Or8(
	.A(A[7]),
	.B(B[7]),
	.S(S[7])
);

endmodule

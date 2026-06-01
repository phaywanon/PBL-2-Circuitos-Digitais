module NOT_8bits (
	input [7:0] A,
	output [7:0] nA
);
	PortaNOT Not1(
	.A(A[0]),
	.nA(nA[0])
);
	PortaNOT Not2(
	.A(A[1]),
	.nA(nA[1])
);
	PortaNOT Not3(
	.A(A[2]),
	.nA(nA[2])
);
	PortaNOT Not4(
	.A(A[3]),
	.nA(nA[3])
);
	PortaNOT Not5(
	.A(A[4]),
	.nA(nA[4])
);
	PortaNOT Not6(
	.A(A[5]),
	.nA(nA[5])
);
	PortaNOT Not7(
	.A(A[6]),
	.nA(nA[6])
);
	PortaNOT Not8(
	.A(A[7]),
	.nA(nA[7])
);

endmodule

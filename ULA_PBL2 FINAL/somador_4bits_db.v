module somador_4bits_db (A0, B0, A1, B1, A2, B2, A3, B3, Cin, Cout, S0, S1, S2, S3);
	input A0, B0, A1, B1, A2, B2, A3, B3, Cin;
	output S0, S1, S2, S3, Cout;
	wire cout0_cin1, cout1_cin2, cout2_cin3;
	
	somador_1bit somador1(
	.A(A0),
	.B(B0),
	.Cin(Cin),
	.S(S0),
	.Cout(cout0_cin1)
);
	somador_1bit somador2(
	.A(A1),
	.B(B1),
	.Cin(cout0_cin1),
	.S(S1),
	.Cout(cout1_cin2)
);
	somador_1bit somador3(
	.A(A2),
	.B(B2),
	.Cin(cout1_cin2),
	.S(S2),
	.Cout(cout2_cin3)
);
	somador_1bit somador4(
	.A(A3),
	.B(B3),
	.Cin(cout2_cin3),
	.S(S3),
	.Cout(Cout)
);
endmodule

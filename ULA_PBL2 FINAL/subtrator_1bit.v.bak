module subtrator_1bit(A, B, Bin, Dif, Bout);
	input A, B, Bin;
	output Dif, Bout;
	wire T1, T2, T3, T4;
	wire nA;

	xor Xor0(T1, A, B);
	xor Xor1(Dif, T1, Bin);

	not not0 (nA, A);


	and And0(T2, nA, B);
	and And1(T3, B, Bin);
	and And2(T4, nA, Bin);
	or Or0(Bout, T2, T3, T4);
endmodule

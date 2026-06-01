module somador_8bits(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] S,
    output Cout
);
    wire cout0_cin1, cout1_cin2, cout2_cin3, cout3_cin4, cout4_cin5, cout5_cin6, cout6_cin7;

    somador_1bit somador1(
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .S(S[0]),
        .Cout(cout0_cin1)
    );

    somador_1bit somador2(
        .A(A[1]),
        .B(B[1]),
        .Cin(cout0_cin1),
        .S(S[1]),
        .Cout(cout1_cin2)
    );

    somador_1bit somador3(
        .A(A[2]),
        .B(B[2]),
        .Cin(cout1_cin2),
        .S(S[2]),
        .Cout(cout2_cin3)
    );

    somador_1bit somador4(
        .A(A[3]),
        .B(B[3]),
        .Cin(cout2_cin3),
        .S(S[3]),
        .Cout(cout3_cin4)
    );

    somador_1bit somador5(
        .A(A[4]),
        .B(B[4]),
        .Cin(cout3_cin4),
        .S(S[4]),
        .Cout(cout4_cin5)
    );

    somador_1bit somador6(
        .A(A[5]),
        .B(B[5]),
        .Cin(cout4_cin5),
        .S(S[5]),
        .Cout(cout5_cin6)
    );

    somador_1bit somador7(
        .A(A[6]),
        .B(B[6]),
        .Cin(cout5_cin6),
        .S(S[6]),
        .Cout(cout6_cin7)
    );

    somador_1bit somador8(
        .A(A[7]),
        .B(B[7]),
        .Cin(cout6_cin7),
        .S(S[7]),
        .Cout(Cout)
    );

endmodule
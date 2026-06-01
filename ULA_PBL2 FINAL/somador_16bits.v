module somador_16bits(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] S,
    output Cout
);
    wire [14:0] carry;  // Carries entre os bits

    // Bit 0
    somador_1bit add0(
        .A(A[0]), .B(B[0]), .Cin(Cin),
        .S(S[0]), .Cout(carry[0])
    );
    
    // Bit 1
    somador_1bit add1(
        .A(A[1]), .B(B[1]), .Cin(carry[0]),
        .S(S[1]), .Cout(carry[1])
    );
    
    // Bit 2
    somador_1bit add2(
        .A(A[2]), .B(B[2]), .Cin(carry[1]),
        .S(S[2]), .Cout(carry[2])
    );
    
    // Bit 3
    somador_1bit add3(
        .A(A[3]), .B(B[3]), .Cin(carry[2]),
        .S(S[3]), .Cout(carry[3])
    );
    
    // Bit 4
    somador_1bit add4(
        .A(A[4]), .B(B[4]), .Cin(carry[3]),
        .S(S[4]), .Cout(carry[4])
    );
    
    // Bit 5
    somador_1bit add5(
        .A(A[5]), .B(B[5]), .Cin(carry[4]),
        .S(S[5]), .Cout(carry[5])
    );
    
    // Bit 6
    somador_1bit add6(
        .A(A[6]), .B(B[6]), .Cin(carry[5]),
        .S(S[6]), .Cout(carry[6])
    );
    
    // Bit 7
    somador_1bit add7(
        .A(A[7]), .B(B[7]), .Cin(carry[6]),
        .S(S[7]), .Cout(carry[7])
    );
    
    // Bit 8
    somador_1bit add8(
        .A(A[8]), .B(B[8]), .Cin(carry[7]),
        .S(S[8]), .Cout(carry[8])
    );
    
    // Bit 9
    somador_1bit add9(
        .A(A[9]), .B(B[9]), .Cin(carry[8]),
        .S(S[9]), .Cout(carry[9])
    );
    
    // Bit 10
    somador_1bit add10(
        .A(A[10]), .B(B[10]), .Cin(carry[9]),
        .S(S[10]), .Cout(carry[10])
    );
    
    // Bit 11
    somador_1bit add11(
        .A(A[11]), .B(B[11]), .Cin(carry[10]),
        .S(S[11]), .Cout(carry[11])
    );
    
    // Bit 12
    somador_1bit add12(
        .A(A[12]), .B(B[12]), .Cin(carry[11]),
        .S(S[12]), .Cout(carry[12])
    );
    
    // Bit 13
    somador_1bit add13(
        .A(A[13]), .B(B[13]), .Cin(carry[12]),
        .S(S[13]), .Cout(carry[13])
    );
    
    // Bit 14
    somador_1bit add14(
        .A(A[14]), .B(B[14]), .Cin(carry[13]),
        .S(S[14]), .Cout(carry[14])
    );
    
    // Bit 15
    somador_1bit add15(
        .A(A[15]), .B(B[15]), .Cin(carry[14]),
        .S(S[15]), .Cout(Cout)
    );

endmodule


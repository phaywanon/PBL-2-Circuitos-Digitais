module add3_cond_structural(
    input Q3, Q2, Q1, Q0, // registrador
    input add3,            // sinal se >=5
    output Y3, Y2, Y1, Y0 // saída
);
    wire S0, S1, S2, S3;   // soma Q+3
    wire Cout;

    // soma Q + 3 (3 = 0011)
    somador_4bits_db sum(
        .A0(Q0), .B0(1'b1),
        .A1(Q1), .B1(1'b1),
        .A2(Q2), .B2(1'b0),
        .A3(Q3), .B3(1'b0),
        .Cin(1'b0),
        .Cout(Cout),
        .S0(S0), .S1(S1), .S2(S2), .S3(S3)
    );

    // MUX 4 bits para escolher entre Q e Q+3
    mux2_1_4bits mux(
        .S(add3),
        .A0(Q0), .A1(Q1), .A2(Q2), .A3(Q3),
        .B0(S0), .B1(S1), .B2(S2), .B3(S3),
        .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3)
    );
endmodule

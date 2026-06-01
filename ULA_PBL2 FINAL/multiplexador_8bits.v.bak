module multiplexador_8bits(
    input S0, S1, S2, S3, Cout,
    input Dif0, Dif1, Dif2, Dif3, Bout,
    input P0, P1, P2, P3, P4, P5, P6, P7,
    input Q0, Q1, Q2, Q3,
    input And0, And1, And2, And3, 
    input Or0, Or1, Or2, Or3, 
    input Xor0, Xor1, Xor2, Xor3, 
    input E0, E1, E2,
    output R0, R1, R2, R3, R4, R5, R6, R7
);

    multiplexador_1bit mux0(
    .S(S0),
    .Dif(Dif0),
    .P(P0),
    .Q(Q0),
    .And(And0),
    .Or(Or0),
    .Xor(Xor0),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R0)
    );

    multiplexador_1bit mux1(
    .S(S1),
    .Dif(Dif1),
    .P(P1),
    .Q(Q1),
    .And(And1),
    .Or(Or1),
    .Xor(Xor1),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R1)
    );
    multiplexador_1bit mux2(
    .S(S2),
    .Dif(Dif2),
    .P(P2),
    .Q(Q2),
    .And(And2),
    .Or(Or2),
    .Xor(Xor2),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R2)
    );
    multiplexador_1bit mux3(
    .S(S3),
    .Dif(Dif3),
    .P(P3),
    .Q(Q3),
    .And(And3),
    .Or(Or3),
    .Xor(Xor3),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R3)
    );
    multiplexador_1bit mux4(
    .S(Cout),
    .Dif(Bout),
    .P(P4),
    .Q(1'b0),
    .And(1'b0),
    .Or(1'b0),
    .Xor(1'b0),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R4)
    );
    
      multiplexador_1bit mux5(
    .S(1'b0),
    .Dif(1'b0),
    .P(P5),
    .Q(1'b0),
    .And(1'b0),
    .Or(1'b0),
    .Xor(1'b0),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R5)
    );
    multiplexador_1bit mux6(
    .S(1'b0),
    .Dif(1'b0),
    .P(P6),
    .Q(1'b0),
    .And(1'b0),
    .Or(1'b0),
    .Xor(1'b0),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R6)
    );
    multiplexador_1bit mux7(
    .S(1'b0),
    .Dif(1'b0),
    .P(P7),
    .Q(1'b0),
    .And(1'b0),
    .Or(1'b0),
    .Xor(1'b0),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R7)
    );

endmodule

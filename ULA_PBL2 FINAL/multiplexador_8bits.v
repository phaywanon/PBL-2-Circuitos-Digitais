module multiplexador_8bits(
    input [7:0] S, 
    input [7:0] Dif, 
    input [7:0] P,
    input [7:0] Q,
    input [7:0] And, 
    input [7:0] Or, 
    input [7:0] Xor,
	 input [7:0] Not,
    input E0, E1, E2,
    output [7:0] R
);

    multiplexador_1bit mux0(
    .S(S[0]),
    .Dif(Dif[0]),
    .P(P[0]),
    .Q(Q[0]),
    .And(And[0]),
    .Or(Or[0]),
    .Xor(Xor[0]),
	 .Not(Not[0]),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R[0])
    );

    multiplexador_1bit mux1(
    .S(S[1]),
    .Dif(Dif[1]),
    .P(P[1]),
    .Q(Q[1]),
    .And(And[1]),
    .Or(Or[1]),
    .Xor(Xor[1]),
	 .Not(Not[1]),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R[1])
    );
    multiplexador_1bit mux2(
    .S(S[2]),
    .Dif(Dif[2]),
    .P(P[2]),
    .Q(Q[2]),
    .And(And[2]),
    .Or(Or[2]),
    .Xor(Xor[2]),
	 .Not(Not[2]),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R[2])
    );
    multiplexador_1bit mux3(
    .S(S[3]),
    .Dif(Dif[3]),
    .P(P[3]),
    .Q(Q[3]),
    .And(And[3]),
    .Or(Or[3]),
    .Xor(Xor[3]),
	 .Not(Not[3]),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R[3])
    );
    multiplexador_1bit mux4(
    .S(S[4]),
    .Dif(Dif[4]),
    .P(P[4]),
    .Q(Q[4]),
    .And(And[4]),
    .Or(Or[4]),
    .Xor(Xor[4]),
	 .Not(Not[4]),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R[4])
    );
    
      multiplexador_1bit mux5(
    .S(S[5]),
    .Dif(Dif[5]),
    .P(P[5]),
    .Q(Q[5]),
    .And(And[5]),
    .Or(Or[5]),
    .Xor(Xor[5]),
	 .Not(Not[5]),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R[5])
    );
    multiplexador_1bit mux6(
    .S(S[6]),
    .Dif(Dif[6]),
    .P(P[6]),
    .Q(Q[6]),
    .And(And[6]),
    .Or(Or[6]),
    .Xor(Xor[6]),
	 .Not(Not[6]),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R[6])
    );
    multiplexador_1bit mux7(
    .S(S[7]),
    .Dif(Dif[7]),
    .P(P[7]),
    .Q(Q[7]),
    .And(And[7]),
    .Or(Or[7]),
    .Xor(Xor[7]),
	 .Not(Not[7]),
    .E0(E0),
    .E1(E1),
    .E2(E2),
    .R(R[7])
    );

endmodule

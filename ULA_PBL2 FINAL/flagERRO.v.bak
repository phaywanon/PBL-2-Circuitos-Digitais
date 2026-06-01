module flagERRO (
	input E0, E1, E2,
	input B0, B1, B2, B3,
	input Q_q0, Q_q1, Q_q2, Q_q3,
	output flagerro, Q0, Q1, Q2, Q3
);
	wire opdiv, bzero;
	wire nE0, nE1, nE2, nflagerro;
 
	not not0(nE0, E0);
   not not1(nE1, E1);
   not not2(nE2, E2);
	not not3(nflagerro, flagerro);
	
	and(opdiv, E0, E1, nE2);
	
	nor(bzero, B0, B1, B2, B3);
	
	and(flagerro, opdiv, bzero);
	
	 
endmodule
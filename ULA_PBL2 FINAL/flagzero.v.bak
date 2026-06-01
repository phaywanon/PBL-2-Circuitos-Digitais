module flagzero (
	input S_soma0, S_soma1, S_soma2, S_soma3,
	input D_sub0, D_sub1, D_sub2, D_sub3,
	input AND0, AND1, AND2, AND3,
	input OR0, OR1, OR2, OR3,
	input XOR0, XOR1, XOR2, XOR3,
	input Q_q0, Q_q1, Q_q2, Q_q3,
	input P_p0, P_p1, P_p2, P_p3, P_p4, P_p5, P_p6, P_p7,
	input E0, E1, E2,
	output ZEROFLAG
);
	
	wire Z_soma, Z_sub, Z_and, Z_or, Z_xor, Z_div, Z_multi;
	wire Z_somamux, Z_submux, Z_andmux, Z_ormux, Z_xormux, Z_divmux, Z_multimux;
	wire nE0, nE1, nE2;
	
	not not0(nE0, E0);
   not not1(nE1, E1);
   not not2(nE2, E2);
	 
	nor(Z_soma, S_soma0, S_soma1, S_soma2, S_soma3);
	nor(Z_sub, D_sub0, D_sub1, D_sub2, D_sub3);
	nor(Z_and, AND0, AND1, AND2, AND3);
	nor(Z_or, OR0, OR1, OR2, OR3);
	nor(Z_xor, XOR0, XOR1, XOR2, XOR3);
	nor(Z_div, Q_q0, Q_q1, Q_q2, Q_q3);
	nor(Z_multi, P_p0, P_p1, P_p2, P_p3, P_p4, P_p5, P_p6, P_p7) ;
		
	and(Z_somamux, Z_soma, nE0, nE1, nE2);
	and(Z_submux, Z_sub, E0, nE1, nE2);
	and(Z_andmux, Z_and, nE0, nE1,E2);
	and(Z_ormux, Z_or, E0, nE1,E2);
	and(Z_xormux, Z_xor,nE0, E1,E2);
	and(Z_divmux, Z_div, E0, E1, nE2);
	and(Z_multimux, Z_multi, nE0, E1, nE2);
		
	or(ZEROFLAG, Z_somamux, Z_submux, Z_andmux, Z_ormux, Z_xormux, Z_divmux, Z_multimux);
		
endmodule
module flagzero (
	input [7:0] S_soma,
	input [7:0] D_sub,
	input [7:0] AND,
	input [7:0] OR,
	input [7:0] XOR,
	input [7:0] Q_q,
	input [7:0] P_p,
	input [7:0] NOT,
	input E0, E1, E2,
	output ZEROFLAG
);
	
	wire Z_soma, Z_sub, Z_and, Z_or, Z_xor, Z_div, Z_multi, Z_not;
	wire Z_somamux, Z_submux, Z_andmux, Z_ormux, Z_xormux, Z_divmux, Z_multimux, Z_notmux;
	wire nE0, nE1, nE2;
	
	not not0(nE0, E0);
   not not1(nE1, E1);
   not not2(nE2, E2);
	 
	nor(Z_soma, S_soma[0], S_soma[1], S_soma[2], S_soma[3], S_soma[4], S_soma[5], S_soma[6], S_soma[7]);
	nor(Z_sub, D_sub[0], D_sub[1], D_sub[2], D_sub[3], D_sub[4], D_sub[5], D_sub[6], D_sub[7]);
	nor(Z_and, AND[0], AND[1], AND[2], AND[3], AND[4], AND[5], AND[6], AND[7]);
	nor(Z_or, OR[0], OR[1], OR[2], OR[3], OR[4], OR[5], OR[6], OR[7]);
	nor(Z_xor, XOR[0], XOR[1], XOR[2], XOR[3], XOR[4], XOR[5], XOR[6], XOR[7]);
	nor(Z_div, Q_q[0], Q_q[1], Q_q[2], Q_q[3], Q_q[4], Q_q[5], Q_q[6], Q_q[7]);
	nor(Z_multi, P_p[0], P_p[1], P_p[2], P_p[3], P_p[4], P_p[5], P_p[6], P_p[7]);
	nor(Z_not, NOT[0], NOT[1], NOT[2], NOT[3], NOT[4], NOT[5], NOT[6], NOT[7]);
		
	and(Z_somamux, Z_soma, nE0, nE1, nE2);
	and(Z_submux, Z_sub, E0, nE1, nE2);
	and(Z_andmux, Z_and, nE0, nE1,E2);
	and(Z_ormux, Z_or, E0, nE1,E2);
	and(Z_xormux, Z_xor,nE0, E1,E2);
	and(Z_divmux, Z_div, E0, E1, nE2);
	and(Z_multimux, Z_multi, nE0, E1, nE2);
	and(Z_notmux, Z_not, E0, E1, E2);
		
	or(ZEROFLAG, Z_somamux, Z_submux, Z_andmux, Z_ormux, Z_xormux, Z_divmux, Z_multimux, Z_notmux);
		
endmodule
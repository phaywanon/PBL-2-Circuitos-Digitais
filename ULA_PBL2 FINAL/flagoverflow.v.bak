module flagoverflow(
	input S_soma4, 
	input D_sub_neg, 
	input P_p4, P_p5, P_p6, P_p7,
	input E0, E1, E2, 
	output OVFflag 
	);
	wire OVF_soma, OVF_sub, OVF_multi;
	wire OVF_somamux, OVF_submux, OVF_multimux;
	wire nE0, nE1, nE2;

	not inv0(nE0, E0);
	not inv1(nE1, E1);
	not inv2(nE2, E2);

	or o0(OVF_soma, S_soma4, 1'b0);

	or o1(OVF_sub, D_sub_neg, 1'b0);

	or o2(OVF_multi, P_p4, P_p5, P_p6, P_p7);

	and a0(OVF_somamux, OVF_soma, nE0, nE1, nE2); // soma 0 0 0
	and a1(OVF_submux, OVF_sub, E0, nE1, nE2); // sub  1 0 0
	and a2(OVF_multimux,OVF_multi, nE0, E1, nE2); // mult 0 1 0

	or o3(OVFflag, OVF_somamux, OVF_submux, OVF_multimux);
endmodule
module flagRESTO(
	input E0, E1, E2,
	input [7:0] RES,
	output flagresto
);

	wire opdiv, restos;
	wire nE2;
 
   not not0(nE2, E2);
	
	and(opdiv, E0, E1, nE2);
	
	or(restos, RES[0], RES[1], RES[2], RES[3], RES[4], RES[5], RES[6], RES[7]);
	
	and(flagresto, opdiv, restos);

endmodule
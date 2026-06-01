module flagERRO (
	input E0, E1, E2,
	input [7:0] B,
	output flagerro
);
	wire opdiv, bzero;
	wire nE0, nE1, nE2, nflagerro;
 
	not not0(nE0, E0);
   not not1(nE1, E1);
   not not2(nE2, E2);
	not not3(nflagerro, flagerro);
	
	and(opdiv, E0, E1, nE2);
	
	nor(bzero, B[0], B[1], B[2], B[3], B[4], B[5], B[6], B[7]);
	
	and(flagerro, opdiv, bzero);
	
	 
endmodule
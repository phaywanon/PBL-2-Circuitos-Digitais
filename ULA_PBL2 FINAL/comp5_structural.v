module comp5_structural(
    input Q3, Q2, Q1, Q0,
    output ge5
);
    wire b1_or_b0;
    wire b2_and_or;
    
    or  u1(b1_or_b0, Q1, Q0);          // b1 | b0
    and u2(b2_and_or, Q2, b1_or_b0);   // b2 & (b1|b0)
    or  u3(ge5, Q3, b2_and_or);        // b3 | (b2 & (b1|b0))
	 
endmodule
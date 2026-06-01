module flagoverflow(
    input E0, E1, E2,       
    input C_soma,           
    input B_sub,            
    input OV_mult,          
    output OVflag           
);

    wire op_add, op_sub, op_mult;

    wire nE0, nE1, nE2;
    not(nE0, E0);
    not(nE1, E1);
    not(nE2, E2);


    and(op_add, nE2, nE1, nE0); 
    and(op_sub, nE2, nE1, E0); 
    and(op_mult, nE2, E1, nE0);


    wire OV_add, OV_sub;
    and(OV_add, C_soma, op_add);
    and(OV_sub, B_sub, op_sub);

    or(OVflag, OV_add, OV_sub, OV_mult);

endmodule

module flagCarryOut(
    input C_soma,    // Carry out do somador
    input B_sub,     // Borrow out do subtrator
    input E0, E1, E2,
    output COUTflag
);
    wire COUT_somamux, COUT_submux;
    wire nE0, nE1, nE2;

    not inv0(nE0, E0);
    not inv1(nE1, E1);
    not inv2(nE2, E2);

    // Carry out é relevante apenas para SOMA (000) e SUBTRAÇÃO (001)
    // SOMA: E2=0, E1=0, E0=0
    and a0(COUT_somamux, C_soma, nE0, nE1, nE2);
    
    // SUBTRAÇÃO: E2=0, E1=0, E0=1 (usa borrow como carry out)
    and a1(COUT_submux, B_sub, E0, nE1, nE2);
    
    // Saída final
    or o0(COUTflag, COUT_somamux, COUT_submux);

endmodule
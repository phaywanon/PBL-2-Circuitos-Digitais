module mux_4x1_bit(
    input [1:0] S,
    input I0, I1, I2, I3,
    output Y
);
    // Lógica do MUX 4:1: Y = S1'S0'I0 + S1'S0I1 + S1S0'I2 + S1S0I3
    
    wire notS1, notS0;
    wire and0, and1, and2, and3;
    
    // Portas NOT para os seletores
    not n1(notS1, S[1]);
    not n0(notS0, S[0]);
    
    // Termos AND
    and a0(and0, notS1, notS0, I0);  // S1'S0'I0
    and a1(and1, notS1, S[0], I1);   // S1'S0I1
    and a2(and2, S[1], notS0, I2);   // S1S0'I2
    and a3(and3, S[1], S[0], I3);    // S1S0I3
    
    // Porta OR final
    or o1(Y, and0, and1, and2, and3);
    
endmodule
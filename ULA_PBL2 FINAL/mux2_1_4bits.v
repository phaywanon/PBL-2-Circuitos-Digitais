module mux2_1_4bits(
    input S,          // seletor
    input A0, A1, A2, A3, // entrada 0
    input B0, B1, B2, B3, // entrada 1
    output Y0, Y1, Y2, Y3 // saída
);
    // Saída i: Y = (~S & Ai) | (S & Bi)
    wire nS;
    not u0(nS, S);

    and u1(Y0a, nS, A0);
    and u2(Y0b, S, B0);
    or  u3(Y0, Y0a, Y0b);

    and u4(Y1a, nS, A1);
    and u5(Y1b, S, B1);
    or  u6(Y1, Y1a, Y1b);

    and u7(Y2a, nS, A2);
    and u8(Y2b, S, B2);
    or  u9(Y2, Y2a, Y2b);

    and u10(Y3a, nS, A3);
    and u11(Y3b, S, B3);
    or  u12(Y3, Y3a, Y3b);
endmodule

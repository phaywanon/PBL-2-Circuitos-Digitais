module bin2seg_structural(
    input A, B, C, D, 
    output a, b, c, d, e, f, g  
);

    wire nA, nB, nC, nD;
    not (nA, A);
    not (nB, B);
    not (nC, C);
    not (nD, D);

    // Segmento a
    wire a1, a2;
    and (a1, nA, nB, nC, D);
    and (a2, B, nC, nD);
    or  (a, a1, a2);

    // Segmento b
    wire b1, b2;
    and (b1, B, nC, D);
    and (b2, B, C, nD);
    or  (b, b1, b2);

    // Segmento c
    and (c, nB, C, nD);

    // Segmento d
    wire d1, d2, d3;
    and (d1, nB, nC, D);
    and (d2, B, nC, nD);
    and (d3, B, C, D);
    or  (d, d1, d2, d3);

    // Segmento e
    wire e1;
    and (e1, B, nC);
    or  (e, e1, D);

    // Segmento f
    wire f1, f2, f3;
    and (f1, nA, nB, D);
    and (f2, nB, C);
    and (f3, C, D);
    or  (f, f1, f2, f3);

    // Segmento g
    wire g1, g2;
    and (g1, nA, nB, nC);
    and (g2, B, C, D);
    or  (g, g1, g2);

endmodule

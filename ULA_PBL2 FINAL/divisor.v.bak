module divisor(
    input A0, A1, A2, A3,
    input B0, B1, B2, B3,
    output Q0, Q1, Q2, Q3,
    output RES0, RES1, RES2, RES3
);
    
    // rp -> resto parcial
    wire rp0_0, rp0_1, rp0_2, rp0_3;
    wire rp1_0, rp1_1, rp1_2, rp1_3;
    wire rp2_0, rp2_1, rp2_2, rp2_3;
    wire rp3_0, rp3_1, rp3_2, rp3_3;
    
    // fios do quociente
    wire quo3, quo2, quo1, quo0;
    
    // fios do resultado do subtrator
    wire dif0_0, dif0_1, dif0_2, dif0_3;
    wire dif1_0, dif1_1, dif1_2, dif1_3;
    wire dif2_0, dif2_1, dif2_2, dif2_3;
    wire dif3_0, dif3_1, dif3_2, dif3_3;
    
    wire bout_0, bout_1, bout_2, bout_3;
    
    // Passo 1: Subtração do dividendo parcial (000A3) pelo divisor B
    subtrator_4bits sub0(
        .A0(A3), .A1(1'b0), .A2(1'b0), .A3(1'b0),
        .B0(B0), .B1(B1), .B2(B2), .B3(B3),
        .Bin(1'b0),
        .Bout(bout_0),
        .Dif0(dif0_0), .Dif1(dif0_1), .Dif2(dif0_2), .Dif3(dif0_3)
    );

    // CORREÇÃO: gerar rp0 com mux (resto parcial após A3)
    mux_4bits_divisor mux_inicio(
        .dif0(dif0_0), .dif1(dif0_1), .dif2(dif0_2), .dif3(dif0_3),
        .antigo_rp0(A3), .antigo_rp1(1'b0), .antigo_rp2(1'b0), .antigo_rp3(1'b0),
        .novo_rp0(rp0_0), .novo_rp1(rp0_1), .novo_rp2(rp0_2), .novo_rp3(rp0_3),
        .bout_sel(bout_0)
    );

    not notquo3 (quo3, bout_0);

    // Passo 2: Subtração com A2 e resto parcial anterior
    subtrator_4bits sub1(
        .A0(A2), .A1(rp0_0), .A2(rp0_1), .A3(rp0_2),
        .B0(B0), .B1(B1), .B2(B2), .B3(B3),
        .Bin(1'b0),
        .Bout(bout_1),
        .Dif0(dif1_0), .Dif1(dif1_1), .Dif2(dif1_2), .Dif3(dif1_3)
    );

    mux_4bits_divisor mux1(
        .dif0(dif1_0), .dif1(dif1_1), .dif2(dif1_2), .dif3(dif1_3),
        .antigo_rp0(A2), .antigo_rp1(rp0_0), .antigo_rp2(rp0_1), .antigo_rp3(rp0_2),
        .novo_rp0(rp1_0), .novo_rp1(rp1_1), .novo_rp2(rp1_2), .novo_rp3(rp1_3),
        .bout_sel(bout_1)
    );

    not notquo2 (quo2, bout_1);

    // Passo 3: Subtração com A1 e resto parcial anterior
    subtrator_4bits sub2(
        .A0(A1), .A1(rp1_0), .A2(rp1_1), .A3(rp1_2),
        .B0(B0), .B1(B1), .B2(B2), .B3(B3),
        .Bin(1'b0),
        .Bout(bout_2),
        .Dif0(dif2_0), .Dif1(dif2_1), .Dif2(dif2_2), .Dif3(dif2_3)
    );

    mux_4bits_divisor mux2(
        .dif0(dif2_0), .dif1(dif2_1), .dif2(dif2_2), .dif3(dif2_3),
        .antigo_rp0(A1), .antigo_rp1(rp1_0), .antigo_rp2(rp1_1), .antigo_rp3(rp1_2),
        .novo_rp0(rp2_0), .novo_rp1(rp2_1), .novo_rp2(rp2_2), .novo_rp3(rp2_3),
        .bout_sel(bout_2)
    );

    not notquo1 (quo1, bout_2);

    // Passo 4: Subtração com A0 e resto parcial anterior
    subtrator_4bits sub3(
        .A0(A0), .A1(rp2_0), .A2(rp2_1), .A3(rp2_2),
        .B0(B0), .B1(B1), .B2(B2), .B3(B3),
        .Bin(1'b0),
        .Bout(bout_3),
        .Dif0(dif3_0), .Dif1(dif3_1), .Dif2(dif3_2), .Dif3(dif3_3)
    );

    mux_4bits_divisor mux3(
        .dif0(dif3_0), .dif1(dif3_1), .dif2(dif3_2), .dif3(dif3_3),
        .antigo_rp0(A0), .antigo_rp1(rp2_0), .antigo_rp2(rp2_1), .antigo_rp3(rp2_2),
        .novo_rp0(rp3_0), .novo_rp1(rp3_1), .novo_rp2(rp3_2), .novo_rp3(rp3_3),
        .bout_sel(bout_3)
    );

    not notquo0 (quo0, bout_3);

    // Quociente final
    or or_q3(Q3, quo3, 1'b0);
    or or_q2(Q2, quo2, 1'b0);
    or or_q1(Q1, quo1, 1'b0);
    or or_q0(Q0, quo0, 1'b0);

    // Resto final
    or or_r3(RES3, rp3_3, 1'b0);
    or or_r2(RES2, rp3_2, 1'b0);
    or or_r1(RES1, rp3_1, 1'b0);
    or or_r0(RES0, rp3_0, 1'b0);

endmodule

module divisor(
    input [7:0] A,
    input [7:0] B,
    output [7:0] Q,
    output [7:0] RES
);
    
    // rp -> resto parcial
    wire rp0_0, rp0_1, rp0_2, rp0_3, rp0_4, rp0_5, rp0_6, rp0_7;
    wire rp1_0, rp1_1, rp1_2, rp1_3, rp1_4, rp1_5, rp1_6, rp1_7;
    wire rp2_0, rp2_1, rp2_2, rp2_3, rp2_4, rp2_5, rp2_6, rp2_7;
    wire rp3_0, rp3_1, rp3_2, rp3_3, rp3_4, rp3_5, rp3_6, rp3_7;
	 
	 wire rp4_0, rp4_1, rp4_2, rp4_3, rp4_4, rp4_5, rp4_6, rp4_7;
	 wire rp5_0, rp5_1, rp5_2, rp5_3, rp5_4, rp5_5, rp5_6, rp5_7;
	 wire rp6_0, rp6_1, rp6_2, rp6_3, rp6_4, rp6_5, rp6_6, rp6_7;
	 wire rp7_0, rp7_1, rp7_2, rp7_3, rp7_4, rp7_5, rp7_6, rp7_7;
	 
	 
    
    // fios do quociente
    wire quo7, quo6, quo5, quo4, quo3, quo2, quo1, quo0;
    
    // fios do resultado do subtrator
    wire dif0_0, dif0_1, dif0_2, dif0_3, dif0_4, dif0_5, dif0_6, dif0_7;
    wire dif1_0, dif1_1, dif1_2, dif1_3, dif1_4, dif1_5, dif1_6, dif1_7;
    wire dif2_0, dif2_1, dif2_2, dif2_3, dif2_4, dif2_5, dif2_6, dif2_7;
    wire dif3_0, dif3_1, dif3_2, dif3_3, dif3_4, dif3_5, dif3_6, dif3_7;
	 
	 wire dif4_0, dif4_1, dif4_2, dif4_3, dif4_4, dif4_5, dif4_6, dif4_7;
	 wire dif5_0, dif5_1, dif5_2, dif5_3, dif5_4, dif5_5, dif5_6, dif5_7;
	 wire dif6_0, dif6_1, dif6_2, dif6_3, dif6_4, dif6_5, dif6_6, dif6_7;
	 wire dif7_0, dif7_1, dif7_2, dif7_3, dif7_4, dif7_5, dif7_6, dif7_7;
    
    wire bout_0, bout_1, bout_2, bout_3, bout_4, bout_5,bout_6, bout_7;
    
	 
	 
	 
	 
	 
	 
	 
	 
	 // Passo 1: Subtração do dividendo parcial (000A7) pelo divisor B
    subtrator_8bits sub0(
        .A({7'b0000000, A[7]}),
        .B(B),
        .Bin(1'b0),
        .Bout(bout_0),
        .Dif({dif0_7, dif0_6, dif0_5, dif0_4,  dif0_3, dif0_2, dif0_1, dif0_0})
    );

	 
	 mux_8bits_divisor mux_inicio(
        .dif0(dif0_0), .dif1(dif0_1), .dif2(dif0_2), .dif3(dif0_3), .dif4(dif0_4), .dif5(dif0_5), .dif6(dif0_6), .dif7(dif0_7),
        .antigo_rp0(A[7]), .antigo_rp1(1'b0), .antigo_rp2(1'b0), .antigo_rp3(1'b0), .antigo_rp4(1'b0), .antigo_rp5(1'b0), .antigo_rp6(1'b0), .antigo_rp7(1'b0),
        .novo_rp0(rp0_0), .novo_rp1(rp0_1), .novo_rp2(rp0_2), .novo_rp3(rp0_3), .novo_rp4(rp0_4), .novo_rp5(rp0_5), .novo_rp6(rp0_6), .novo_rp7(rp0_7),
        .bout_sel(bout_0)
    );	 
	

    not notquo7 (quo7, bout_0);



	 // Passo 2: Subtração com A6 e resto parcial anterior
    subtrator_8bits sub1(
        .A({rp0_6, rp0_5, rp0_4, rp0_3, rp0_2, rp0_1, rp0_0, A[6]}),
        .B(B),
        .Bin(1'b0),
        .Bout(bout_1),
        .Dif({dif1_7, dif1_6,dif1_5, dif1_4, dif1_3, dif1_2, dif1_1, dif1_0})
    );

	     mux_8bits_divisor mux1(
        .dif0(dif1_0), .dif1(dif1_1), .dif2(dif1_2), .dif3(dif1_3), .dif4(dif1_4), .dif5(dif1_5), .dif6(dif1_6), .dif7(dif1_7),
        .antigo_rp0(A[6]), .antigo_rp1(rp0_0), .antigo_rp2(rp0_1), .antigo_rp3(rp0_2), .antigo_rp4(rp0_3), .antigo_rp5(rp0_4), .antigo_rp6(rp0_5), .antigo_rp7(rp0_6),
        .novo_rp0(rp1_0), .novo_rp1(rp1_1), .novo_rp2(rp1_2), .novo_rp3(rp1_3), .novo_rp4(rp1_4), .novo_rp5(rp1_5), .novo_rp6(rp1_6), .novo_rp7(rp1_7),
        .bout_sel(bout_1)
    );	 
	     not notquo6 (quo6, bout_1);

	 
	 
		 
	 
	 
    // Passo 3: Subtração com A5 e resto parcial anterior
	 subtrator_8bits sub2(
        .A({rp1_6, rp1_5, rp1_4, rp1_3, rp1_2, rp1_1, rp1_0, A[5]}),
        .B(B),
        .Bin(1'b0),
        .Bout(bout_2),
        .Dif({dif2_7, dif2_6,dif2_5, dif2_4, dif2_3, dif2_2, dif2_1, dif2_0})
    );

	 mux_8bits_divisor mux2(
        .dif0(dif2_0), .dif1(dif2_1), .dif2(dif2_2), .dif3(dif2_3), .dif4(dif2_4), .dif5(dif2_5), .dif6(dif2_6), .dif7(dif2_7),
        .antigo_rp0(A[5]), .antigo_rp1(rp1_0), .antigo_rp2(rp1_1), .antigo_rp3(rp1_2), .antigo_rp4(rp1_3), .antigo_rp5(rp1_4), .antigo_rp6(rp1_5), .antigo_rp7(rp1_6),
        .novo_rp0(rp2_0), .novo_rp1(rp2_1), .novo_rp2(rp2_2), .novo_rp3(rp2_3), .novo_rp4(rp2_4), .novo_rp5(rp2_5), .novo_rp6(rp2_6), .novo_rp7(rp2_7),
        .bout_sel(bout_2)
    );	 

    not notquo5 (quo5, bout_2);
	 
	 
	 
	 
    // Passo 4: Subtração com A4 e resto parcial anterior
	 subtrator_8bits sub3(
        .A({rp2_6, rp2_5, rp2_4, rp2_3, rp2_2, rp2_1, rp2_0, A[4]}),
        .B(B),
        .Bin(1'b0),
        .Bout(bout_3),
        .Dif({dif3_7, dif3_6, dif3_5, dif3_4, dif3_3, dif3_2, dif3_1, dif3_0})
    );

	 
	 mux_8bits_divisor mux3(
        .dif0(dif3_0), .dif1(dif3_1), .dif2(dif3_2), .dif3(dif3_3), .dif4(dif3_4), .dif5(dif3_5), .dif6(dif3_6), .dif7(dif3_7),
        .antigo_rp0(A[4]), .antigo_rp1(rp2_0), .antigo_rp2(rp2_1), .antigo_rp3(rp2_2), .antigo_rp4(rp2_3), .antigo_rp5(rp2_4), .antigo_rp6(rp2_5), .antigo_rp7(rp2_6),
        .novo_rp0(rp3_0), .novo_rp1(rp3_1), .novo_rp2(rp3_2), .novo_rp3(rp3_3), .novo_rp4(rp3_4), .novo_rp5(rp3_5), .novo_rp6(rp3_6), .novo_rp7(rp3_7),
        .bout_sel(bout_3)
    );	 

    not notquo4 (quo4, bout_3);

	 

	 // Passo 5: Subtração com A3 e resto parcial anterior
	 subtrator_8bits sub4(
        .A({rp3_6, rp3_5, rp3_4, rp3_3, rp3_2, rp3_1, rp3_0, A[3]}),
        .B(B),
        .Bin(1'b0),
        .Bout(bout_4),
        .Dif({dif4_7, dif4_6, dif4_5, dif4_4, dif4_3, dif4_2, dif4_1, dif4_0})
    );
	 
	 mux_8bits_divisor mux4(
        .dif0(dif4_0), .dif1(dif4_1), .dif2(dif4_2), .dif3(dif4_3), .dif4(dif4_4), .dif5(dif4_5), .dif6(dif4_6), .dif7(dif4_7),
        .antigo_rp0(A[3]), .antigo_rp1(rp3_0), .antigo_rp2(rp3_1), .antigo_rp3(rp3_2), .antigo_rp4(rp3_3), .antigo_rp5(rp3_4), .antigo_rp6(rp3_5), .antigo_rp7(rp3_6),
        .novo_rp0(rp4_0), .novo_rp1(rp4_1), .novo_rp2(rp4_2), .novo_rp3(rp4_3), .novo_rp4(rp4_4), .novo_rp5(rp4_5), .novo_rp6(rp4_6), .novo_rp7(rp4_7),
        .bout_sel(bout_4)
    );	 
	 
	 not notquo3 (quo3, bout_4);
	 
	 
	 
	 
	 // Passo 6: Subtração com A2 e resto parcial anterior
	 subtrator_8bits sub5(
        .A({rp4_6, rp4_5, rp4_4, rp4_3, rp4_2, rp4_1, rp4_0, A[2]}),
        .B(B),
        .Bin(1'b0),
        .Bout(bout_5),
        .Dif({dif5_7, dif5_6, dif5_5, dif5_4, dif5_3, dif5_2, dif5_1, dif5_0})
    );
	 
	 mux_8bits_divisor mux5(
        .dif0(dif5_0), .dif1(dif5_1), .dif2(dif5_2), .dif3(dif5_3), .dif4(dif5_4), .dif5(dif5_5), .dif6(dif5_6), .dif7(dif5_7),
        .antigo_rp0(A[2]), .antigo_rp1(rp4_0), .antigo_rp2(rp4_1), .antigo_rp3(rp4_2), .antigo_rp4(rp4_3), .antigo_rp5(rp4_4), .antigo_rp6(rp4_5), .antigo_rp7(rp4_6),
        .novo_rp0(rp5_0), .novo_rp1(rp5_1), .novo_rp2(rp5_2), .novo_rp3(rp5_3), .novo_rp4(rp5_4), .novo_rp5(rp5_5), .novo_rp6(rp5_6), .novo_rp7(rp5_7),
        .bout_sel(bout_5)
    );	 
	 
	 
	 not notquo2 (quo2, bout_5);
	 
	  
	 // Passo 7: Subtração com A1 e resto parcial anterior
	 subtrator_8bits sub6(
        .A({rp5_6, rp5_5, rp5_4, rp5_3, rp5_2, rp5_1, rp5_0, A[1]}),
        .B(B),
        .Bin(1'b0),
        .Bout(bout_6),
        .Dif({dif6_7, dif6_6, dif6_5, dif6_4, dif6_3, dif6_2, dif6_1, dif6_0})
    );

	 mux_8bits_divisor mux6(
        .dif0(dif6_0), .dif1(dif6_1), .dif2(dif6_2), .dif3(dif6_3), .dif4(dif6_4), .dif5(dif6_5), .dif6(dif6_6), .dif7(dif6_7),
        .antigo_rp0(A[1]), .antigo_rp1(rp5_0), .antigo_rp2(rp5_1), .antigo_rp3(rp5_2), .antigo_rp4(rp5_3), .antigo_rp5(rp5_4), .antigo_rp6(rp5_5), .antigo_rp7(rp5_6),
        .novo_rp0(rp6_0), .novo_rp1(rp6_1), .novo_rp2(rp6_2), .novo_rp3(rp6_3), .novo_rp4(rp6_4), .novo_rp5(rp6_5), .novo_rp6(rp6_6), .novo_rp7(rp6_7),
        .bout_sel(bout_6)
    );	 
	 
	 not notquo1 (quo1, bout_6);
	 
	 
	 
	 // Passo 8: Subtração com A0 e resto parcial anterior
	 subtrator_8bits sub7(
        .A({rp6_6, rp6_5, rp6_4, rp6_3, rp6_2, rp6_1, rp6_0, A[0]}),
        .B(B),
        .Bin(1'b0),
        .Bout(bout_7),
        .Dif({dif7_7, dif7_6, dif7_5, dif7_4, dif7_3, dif7_2, dif7_1, dif7_0})
    );

	 
	 	 mux_8bits_divisor mux7(
        .dif0(dif7_0), .dif1(dif7_1), .dif2(dif7_2), .dif3(dif7_3), .dif4(dif7_4), .dif5(dif7_5), .dif6(dif7_6), .dif7(dif7_7),
        .antigo_rp0(A[0]), .antigo_rp1(rp6_0), .antigo_rp2(rp6_1), .antigo_rp3(rp6_2), .antigo_rp4(rp6_3), .antigo_rp5(rp6_4), .antigo_rp6(rp6_5), .antigo_rp7(rp6_6),
        .novo_rp0(rp7_0), .novo_rp1(rp7_1), .novo_rp2(rp7_2), .novo_rp3(rp7_3), .novo_rp4(rp7_4), .novo_rp5(rp7_5), .novo_rp6(rp7_6), .novo_rp7(rp7_7),
        .bout_sel(bout_7)
    );	 
	 
	 
	 not notquo0 (quo0, bout_7);
	 
	 
	 
	 
    // Quociente final
	 or or_q7(Q[7], quo7, 1'b0);
	 or or_q6(Q[6], quo6, 1'b0);
	 or or_q5(Q[5], quo5, 1'b0);
	 or or_q4(Q[4], quo4, 1'b0);
	 
    or or_q3(Q[3], quo3, 1'b0);
    or or_q2(Q[2], quo2, 1'b0);
    or or_q1(Q[1], quo1, 1'b0);
    or or_q0(Q[0], quo0, 1'b0);

    // Resto final
	 or or_r7(RES[7], rp7_7, 1'b0);
	 or or_r6(RES[6], rp7_6, 1'b0);
	 or or_r5(RES[5], rp7_5, 1'b0);
	 or or_r4(RES[4], rp7_4, 1'b0);
	 
    or or_r3(RES[3], rp7_3, 1'b0);
    or or_r2(RES[2], rp7_2, 1'b0);
    or or_r1(RES[1], rp7_1, 1'b0);
    or or_r0(RES[0], rp7_0, 1'b0);

endmodule

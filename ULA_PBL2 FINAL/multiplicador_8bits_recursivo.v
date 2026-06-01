
	// MÓDULO 2: MÁQUINA DE ESTADOS
	module maquina_estados_mult(
		 input clk,
		 input rst,
		 input start,
		 input [3:0] contador,
		 output state_idle,
		 output state_multiply,
		 output state_done
	);
		 wire [1:0] state, next_state;
		 
		 flipflop_D_descida ff_state0(
			  .d(next_state[0]),
			  .clk(clk),
			  .rst_n(~rst),
			  .en(1'b1),
			  .q(state[0])
		 );
		 
		 flipflop_D_descida ff_state1(
			  .d(next_state[1]),
			  .clk(clk),
			  .rst_n(~rst),
			  .en(1'b1),
			  .q(state[1])
		 );
		 
		 wire n_state0, n_state1;
		 not Not0(n_state0, state[0]);
		 not Not1(n_state1, state[1]);
		 
		 and And_idle(state_idle, n_state1, n_state0);
		 and And_mult(state_multiply, n_state1, state[0]);
		 and And_done(state_done, state[1], n_state0);
		 
		 // Contador == 7 (0111)
		 wire contador_7;
		 wire nc3, w0, w1;
		 not Not_c3(nc3, contador[3]);
		 and And_c7_0(w0, nc3, contador[2]);
		 and And_c7_1(w1, contador[1], contador[0]);
		 and And_c7(contador_7, w0, w1);
		 
		 wire idle_to_mult, mult_to_done, mult_continue, n_contador_7;
		 and And_idle_mult(idle_to_mult, state_idle, start);
		 and And_mult_done(mult_to_done, state_multiply, contador_7);
		 not Not_cont7(n_contador_7, contador_7);
		 and And_mult_cont(mult_continue, state_multiply, n_contador_7);
		 or Or_ns0(next_state[0], idle_to_mult, mult_continue);
		 buf Buf_ns1(next_state[1], mult_to_done);
	endmodule

	// MÓDULO 3: CONTADOR 4 BITS
	// 
	module contador_4bits(
		 input clk,
		 input rst,
		 input en,
		 output [3:0] Q
	);
		 wire [3:0] Q_next, carry;
		 
		 xor Xor0(Q_next[0], Q[0], en);
		 flipflop_D_descida ff0(.d(Q_next[0]), .clk(clk), .rst_n(~rst), .en(1'b1), .q(Q[0]));
		 
		 and And_c0(carry[0], Q[0], en);
		 xor Xor1(Q_next[1], Q[1], carry[0]);
		 flipflop_D_descida ff1(.d(Q_next[1]), .clk(clk), .rst_n(~rst), .en(1'b1), .q(Q[1]));
		 
		 and And_c1(carry[1], Q[1], carry[0]);
		 xor Xor2(Q_next[2], Q[2], carry[1]);
		 flipflop_D_descida ff2(.d(Q_next[2]), .clk(clk), .rst_n(~rst), .en(1'b1), .q(Q[2]));
		 
		 and And_c2(carry[2], Q[2], carry[1]);
		 xor Xor3(Q_next[3], Q[3], carry[2]);
		 flipflop_D_descida ff3(.d(Q_next[3]), .clk(clk), .rst_n(~rst), .en(1'b1), .q(Q[3]));
	endmodule

	// MÓDULO 4: DESLOCADOR VARIÁVEL
module deslocador_variavel(
    input [7:0] A,
    input [2:0] shift_amount,
    output [15:0] Y 
);
    wire [15:0] shift0, shift1, shift2, shift3, shift4, shift5, shift6, shift7;
    
    // Shift 0: {8'b0, A}
    or Or0_0(shift0[0], A[0], 1'b0);
    or Or0_1(shift0[1], A[1], 1'b0);
    or Or0_2(shift0[2], A[2], 1'b0);
    or Or0_3(shift0[3], A[3], 1'b0);
    or Or0_4(shift0[4], A[4], 1'b0);
    or Or0_5(shift0[5], A[5], 1'b0);
    or Or0_6(shift0[6], A[6], 1'b0);
    or Or0_7(shift0[7], A[7], 1'b0);
    or Or0_8(shift0[8], 1'b0, 1'b0);
    or Or0_9(shift0[9], 1'b0, 1'b0);
    or Or0_10(shift0[10], 1'b0, 1'b0);
    or Or0_11(shift0[11], 1'b0, 1'b0);
    or Or0_12(shift0[12], 1'b0, 1'b0);
    or Or0_13(shift0[13], 1'b0, 1'b0);
    or Or0_14(shift0[14], 1'b0, 1'b0);
    or Or0_15(shift0[15], 1'b0, 1'b0);
    
    // Shift 1: {7'b0, A, 1'b0}
    or Or1_0(shift1[0], 1'b0, 1'b0);
    or Or1_1(shift1[1], A[0], 1'b0);
    or Or1_2(shift1[2], A[1], 1'b0);
    or Or1_3(shift1[3], A[2], 1'b0);
    or Or1_4(shift1[4], A[3], 1'b0);
    or Or1_5(shift1[5], A[4], 1'b0);
    or Or1_6(shift1[6], A[5], 1'b0);
    or Or1_7(shift1[7], A[6], 1'b0);
    or Or1_8(shift1[8], A[7], 1'b0);
    or Or1_9(shift1[9], 1'b0, 1'b0);
    or Or1_10(shift1[10], 1'b0, 1'b0);
    or Or1_11(shift1[11], 1'b0, 1'b0);
    or Or1_12(shift1[12], 1'b0, 1'b0);
    or Or1_13(shift1[13], 1'b0, 1'b0);
    or Or1_14(shift1[14], 1'b0, 1'b0);
    or Or1_15(shift1[15], 1'b0, 1'b0);
    
    // Shift 2: {6'b0, A, 2'b0}
    or Or2_0(shift2[0], 1'b0, 1'b0);
    or Or2_1(shift2[1], 1'b0, 1'b0);
    or Or2_2(shift2[2], A[0], 1'b0);
    or Or2_3(shift2[3], A[1], 1'b0);
    or Or2_4(shift2[4], A[2], 1'b0);
    or Or2_5(shift2[5], A[3], 1'b0);
    or Or2_6(shift2[6], A[4], 1'b0);
    or Or2_7(shift2[7], A[5], 1'b0);
    or Or2_8(shift2[8], A[6], 1'b0);
    or Or2_9(shift2[9], A[7], 1'b0);
    or Or2_10(shift2[10], 1'b0, 1'b0);
    or Or2_11(shift2[11], 1'b0, 1'b0);
    or Or2_12(shift2[12], 1'b0, 1'b0);
    or Or2_13(shift2[13], 1'b0, 1'b0);
    or Or2_14(shift2[14], 1'b0, 1'b0);
    or Or2_15(shift2[15], 1'b0, 1'b0);
    
    // Shift 3: {5'b0, A, 3'b0}
    or Or3_0(shift3[0], 1'b0, 1'b0);
    or Or3_1(shift3[1], 1'b0, 1'b0);
    or Or3_2(shift3[2], 1'b0, 1'b0);
    or Or3_3(shift3[3], A[0], 1'b0);
    or Or3_4(shift3[4], A[1], 1'b0);
    or Or3_5(shift3[5], A[2], 1'b0);
    or Or3_6(shift3[6], A[3], 1'b0);
    or Or3_7(shift3[7], A[4], 1'b0);
    or Or3_8(shift3[8], A[5], 1'b0);
    or Or3_9(shift3[9], A[6], 1'b0);
    or Or3_10(shift3[10], A[7], 1'b0);
    or Or3_11(shift3[11], 1'b0, 1'b0);
    or Or3_12(shift3[12], 1'b0, 1'b0);
    or Or3_13(shift3[13], 1'b0, 1'b0);
    or Or3_14(shift3[14], 1'b0, 1'b0);
    or Or3_15(shift3[15], 1'b0, 1'b0);
    
    // Shift 4: {4'b0, A, 4'b0}
    or Or4_0(shift4[0], 1'b0, 1'b0);
    or Or4_1(shift4[1], 1'b0, 1'b0);
    or Or4_2(shift4[2], 1'b0, 1'b0);
    or Or4_3(shift4[3], 1'b0, 1'b0);
    or Or4_4(shift4[4], A[0], 1'b0);
    or Or4_5(shift4[5], A[1], 1'b0);
    or Or4_6(shift4[6], A[2], 1'b0);
    or Or4_7(shift4[7], A[3], 1'b0);
    or Or4_8(shift4[8], A[4], 1'b0);
    or Or4_9(shift4[9], A[5], 1'b0);
    or Or4_10(shift4[10], A[6], 1'b0);
    or Or4_11(shift4[11], A[7], 1'b0);
    or Or4_12(shift4[12], 1'b0, 1'b0);
    or Or4_13(shift4[13], 1'b0, 1'b0);
    or Or4_14(shift4[14], 1'b0, 1'b0);
    or Or4_15(shift4[15], 1'b0, 1'b0);
    
    // Shift 5: {3'b0, A, 5'b0}
    or Or5_0(shift5[0], 1'b0, 1'b0);
    or Or5_1(shift5[1], 1'b0, 1'b0);
    or Or5_2(shift5[2], 1'b0, 1'b0);
    or Or5_3(shift5[3], 1'b0, 1'b0);
    or Or5_4(shift5[4], 1'b0, 1'b0);
    or Or5_5(shift5[5], A[0], 1'b0);
    or Or5_6(shift5[6], A[1], 1'b0);
    or Or5_7(shift5[7], A[2], 1'b0);
    or Or5_8(shift5[8], A[3], 1'b0);
    or Or5_9(shift5[9], A[4], 1'b0);
    or Or5_10(shift5[10], A[5], 1'b0);
    or Or5_11(shift5[11], A[6], 1'b0);
    or Or5_12(shift5[12], A[7], 1'b0);
    or Or5_13(shift5[13], 1'b0, 1'b0);
    or Or5_14(shift5[14], 1'b0, 1'b0);
    or Or5_15(shift5[15], 1'b0, 1'b0);
    
    // Shift 6: {2'b0, A, 6'b0}
    or Or6_0(shift6[0], 1'b0, 1'b0);
    or Or6_1(shift6[1], 1'b0, 1'b0);
    or Or6_2(shift6[2], 1'b0, 1'b0);
    or Or6_3(shift6[3], 1'b0, 1'b0);
    or Or6_4(shift6[4], 1'b0, 1'b0);
    or Or6_5(shift6[5], 1'b0, 1'b0);
    or Or6_6(shift6[6], A[0], 1'b0);
    or Or6_7(shift6[7], A[1], 1'b0);
    or Or6_8(shift6[8], A[2], 1'b0);
    or Or6_9(shift6[9], A[3], 1'b0);
    or Or6_10(shift6[10], A[4], 1'b0);
    or Or6_11(shift6[11], A[5], 1'b0);
    or Or6_12(shift6[12], A[6], 1'b0);
    or Or6_13(shift6[13], A[7], 1'b0);
    or Or6_14(shift6[14], 1'b0, 1'b0);
    or Or6_15(shift6[15], 1'b0, 1'b0);
    
    // Shift 7: {1'b0, A, 7'b0}
    or Or7_0(shift7[0], 1'b0, 1'b0);
    or Or7_1(shift7[1], 1'b0, 1'b0);
    or Or7_2(shift7[2], 1'b0, 1'b0);
    or Or7_3(shift7[3], 1'b0, 1'b0);
    or Or7_4(shift7[4], 1'b0, 1'b0);
    or Or7_5(shift7[5], 1'b0, 1'b0);
    or Or7_6(shift7[6], 1'b0, 1'b0);
    or Or7_7(shift7[7], A[0], 1'b0);
    or Or7_8(shift7[8], A[1], 1'b0);
    or Or7_9(shift7[9], A[2], 1'b0);
    or Or7_10(shift7[10], A[3], 1'b0);
    or Or7_11(shift7[11], A[4], 1'b0);
    or Or7_12(shift7[12], A[5], 1'b0);
    or Or7_13(shift7[13], A[6], 1'b0);
    or Or7_14(shift7[14], A[7], 1'b0);
    or Or7_15(shift7[15], 1'b0, 1'b0);
    
    mux_16bits_8x1 mux_shift(
        .in0(shift0), .in1(shift1), .in2(shift2), .in3(shift3),
        .in4(shift4), .in5(shift5), .in6(shift6), .in7(shift7),
        .sel(shift_amount),
        .out(Y)
    );
endmodule

	// MÓDULO 5: MUX 16 BITS 8:1
	module mux_16bits_8x1(
		 input [15:0] in0, in1, in2, in3, in4, in5, in6, in7,
		 input [2:0] sel,
		 output [15:0] out
	);
		 mux_1bit_8x1 mux0(.in0(in0[0]), .in1(in1[0]), .in2(in2[0]), .in3(in3[0]), .in4(in4[0]), .in5(in5[0]), .in6(in6[0]), .in7(in7[0]), .sel(sel), .out(out[0]));
		 mux_1bit_8x1 mux1(.in0(in0[1]), .in1(in1[1]), .in2(in2[1]), .in3(in3[1]), .in4(in4[1]), .in5(in5[1]), .in6(in6[1]), .in7(in7[1]), .sel(sel), .out(out[1]));
		 mux_1bit_8x1 mux2(.in0(in0[2]), .in1(in1[2]), .in2(in2[2]), .in3(in3[2]), .in4(in4[2]), .in5(in5[2]), .in6(in6[2]), .in7(in7[2]), .sel(sel), .out(out[2]));
		 mux_1bit_8x1 mux3(.in0(in0[3]), .in1(in1[3]), .in2(in2[3]), .in3(in3[3]), .in4(in4[3]), .in5(in5[3]), .in6(in6[3]), .in7(in7[3]), .sel(sel), .out(out[3]));
		 mux_1bit_8x1 mux4(.in0(in0[4]), .in1(in1[4]), .in2(in2[4]), .in3(in3[4]), .in4(in4[4]), .in5(in5[4]), .in6(in6[4]), .in7(in7[4]), .sel(sel), .out(out[4]));
		 mux_1bit_8x1 mux5(.in0(in0[5]), .in1(in1[5]), .in2(in2[5]), .in3(in3[5]), .in4(in4[5]), .in5(in5[5]), .in6(in6[5]), .in7(in7[5]), .sel(sel), .out(out[5]));
		 mux_1bit_8x1 mux6(.in0(in0[6]), .in1(in1[6]), .in2(in2[6]), .in3(in3[6]), .in4(in4[6]), .in5(in5[6]), .in6(in6[6]), .in7(in7[6]), .sel(sel), .out(out[6]));
		 mux_1bit_8x1 mux7(.in0(in0[7]), .in1(in1[7]), .in2(in2[7]), .in3(in3[7]), .in4(in4[7]), .in5(in5[7]), .in6(in6[7]), .in7(in7[7]), .sel(sel), .out(out[7]));
		 mux_1bit_8x1 mux8(.in0(in0[8]), .in1(in1[8]), .in2(in2[8]), .in3(in3[8]), .in4(in4[8]), .in5(in5[8]), .in6(in6[8]), .in7(in7[8]), .sel(sel), .out(out[8]));
		 mux_1bit_8x1 mux9(.in0(in0[9]), .in1(in1[9]), .in2(in2[9]), .in3(in3[9]), .in4(in4[9]), .in5(in5[9]), .in6(in6[9]), .in7(in7[9]), .sel(sel), .out(out[9]));
		 mux_1bit_8x1 mux10(.in0(in0[10]), .in1(in1[10]), .in2(in2[10]), .in3(in3[10]), .in4(in4[10]), .in5(in5[10]), .in6(in6[10]), .in7(in7[10]), .sel(sel), .out(out[10]));
		 mux_1bit_8x1 mux11(.in0(in0[11]), .in1(in1[11]), .in2(in2[11]), .in3(in3[11]), .in4(in4[11]), .in5(in5[11]), .in6(in6[11]), .in7(in7[11]), .sel(sel), .out(out[11]));
		 mux_1bit_8x1 mux12(.in0(in0[12]), .in1(in1[12]), .in2(in2[12]), .in3(in3[12]), .in4(in4[12]), .in5(in5[12]), .in6(in6[12]), .in7(in7[12]), .sel(sel), .out(out[12]));
		 mux_1bit_8x1 mux13(.in0(in0[13]), .in1(in1[13]), .in2(in2[13]), .in3(in3[13]), .in4(in4[13]), .in5(in5[13]), .in6(in6[13]), .in7(in7[13]), .sel(sel), .out(out[13]));
		 mux_1bit_8x1 mux14(.in0(in0[14]), .in1(in1[14]), .in2(in2[14]), .in3(in3[14]), .in4(in4[14]), .in5(in5[14]), .in6(in6[14]), .in7(in7[14]), .sel(sel), .out(out[14]));
		 mux_1bit_8x1 mux15(.in0(in0[15]), .in1(in1[15]), .in2(in2[15]), .in3(in3[15]), .in4(in4[15]), .in5(in5[15]), .in6(in6[15]), .in7(in7[15]), .sel(sel), .out(out[15]));  // ✅ CORRIGIDO
	endmodule

	// MUX 1 bit 8:1
	module mux_1bit_8x1(
		 input in0, in1, in2, in3, in4, in5, in6, in7,
		 input [2:0] sel,
		 output out
	);
		 wire n_sel0, n_sel1, n_sel2;
		 wire and0, and1, and2, and3, and4, and5, and6, and7;
		 
		 not Not0(n_sel0, sel[0]);
		 not Not1(n_sel1, sel[1]);
		 not Not2(n_sel2, sel[2]);
		 
		 wire [7:0] decode;
		 and And0(decode[0], n_sel2, n_sel1, n_sel0);
		 and And1(decode[1], n_sel2, n_sel1, sel[0]);
		 and And2(decode[2], n_sel2, sel[1], n_sel0);
		 and And3(decode[3], n_sel2, sel[1], sel[0]);
		 and And4(decode[4], sel[2], n_sel1, n_sel0);
		 and And5(decode[5], sel[2], n_sel1, sel[0]);
		 and And6(decode[6], sel[2], sel[1], n_sel0);
		 and And7(decode[7], sel[2], sel[1], sel[0]);
		 
		 and And_0(and0, in0, decode[0]);
		 and And_1(and1, in1, decode[1]);
		 and And_2(and2, in2, decode[2]);
		 and And_3(and3, in3, decode[3]);
		 and And_4(and4, in4, decode[4]);
		 and And_5(and5, in5, decode[5]);
		 and And_6(and6, in6, decode[6]);
		 and And_7(and7, in7, decode[7]);
		 
		 wire or01, or23, or45, or67, or0123, or4567;
		 or Or01(or01, and0, and1);
		 or Or23(or23, and2, and3);
		 or Or45(or45, and4, and5);
		 or Or67(or67, and6, and7);
		 or Or0123(or0123, or01, or23);
		 or Or4567(or4567, or45, or67);
		 or Or_final(out, or0123, or4567);
	endmodule


	// MÓDULO 6: MUX 16 BITS 2:1
	module mux_16bits_2x1(
		 input [15:0] in0,
		 input [15:0] in1,
		 input sel,
		 output [15:0] out
	);
		 wire n_sel;
		 not Not_sel(n_sel, sel);
		 
		 wire and00, and01;
		 and And00(and00, in0[0], n_sel);
		 and And01(and01, in1[0], sel);
		 or Or0(out[0], and00, and01);
		 
		 wire and10, and11;
		 and And10(and10, in0[1], n_sel);
		 and And11(and11, in1[1], sel);
		 or Or1(out[1], and10, and11);
		 
		 wire and20, and21;
		 and And20(and20, in0[2], n_sel);
		 and And21(and21, in1[2], sel);
		 or Or2(out[2], and20, and21);
		 
		 wire and30, and31;
		 and And30(and30, in0[3], n_sel);
		 and And31(and31, in1[3], sel);
		 or Or3(out[3], and30, and31);
		 
		 wire and40, and41;
		 and And40(and40, in0[4], n_sel);
		 and And41(and41, in1[4], sel);
		 or Or4(out[4], and40, and41);
		 
		 wire and50, and51;
		 and And50(and50, in0[5], n_sel);
		 and And51(and51, in1[5], sel);
		 or Or5(out[5], and50, and51);
		 
		 wire and60, and61;
		 and And60(and60, in0[6], n_sel);
		 and And61(and61, in1[6], sel);
		 or Or6(out[6], and60, and61);
		 
		 wire and70, and71;
		 and And70(and70, in0[7], n_sel);
		 and And71(and71, in1[7], sel);
		 or Or7(out[7], and70, and71);
		 
		 wire and80, and81;
		 and And80(and80, in0[8], n_sel);
		 and And81(and81, in1[8], sel);
		 or Or8(out[8], and80, and81);
		 
		 wire and90, and91;
		 and And90(and90, in0[9], n_sel);
		 and And91(and91, in1[9], sel);
		 or Or9(out[9], and90, and91);
		 
		 wire and100, and101;
		 and And100(and100, in0[10], n_sel);
		 and And101(and101, in1[10], sel);
		 or Or10(out[10], and100, and101);
		 
		 wire and110, and111;
		 and And110(and110, in0[11], n_sel);
		 and And111(and111, in1[11], sel);
		 or Or11(out[11], and110, and111);
		 
		 wire and120, and121;
		 and And120(and120, in0[12], n_sel);
		 and And121(and121, in1[12], sel);
		 or Or12(out[12], and120, and121);
		 
		 wire and130, and131;
		 and And130(and130, in0[13], n_sel);
		 and And131(and131, in1[13], sel);
		 or Or13(out[13], and130, and131);
		 
		 wire and140, and141;
		 and And140(and140, in0[14], n_sel);
		 and And141(and141, in1[14], sel);
		 or Or14(out[14], and140, and141);
		 
		 wire and150, and151;
		 and And150(and150, in0[15], n_sel);
		 and And151(and151, in1[15], sel);
		 or Or15(out[15], and150, and151);
	endmodule

	// MÓDULO 7: MUX 8 BITS 2:1
	module mux_8bits_2x1(
		 input [7:0] in0,
		 input [7:0] in1,
		 input sel,
		 output [7:0] out
	);
		 wire n_sel;
		 not Not_sel(n_sel, sel);
		 
		 wire and00, and01;
		 and And00(and00, in0[0], n_sel);
		 and And01(and01, in1[0], sel);
		 or Or0(out[0], and00, and01);
		 
		 wire and10, and11;
		 and And10(and10, in0[1], n_sel);
		 and And11(and11, in1[1], sel);
		 or Or1(out[1], and10, and11);
		 
		 wire and20, and21;
		 and And20(and20, in0[2], n_sel);
		 and And21(and21, in1[2], sel);
		 or Or2(out[2], and20, and21);
		 
		 wire and30, and31;
		 and And30(and30, in0[3], n_sel);
		 and And31(and31, in1[3], sel);
		 or Or3(out[3], and30, and31);
		 
		 wire and40, and41;
		 and And40(and40, in0[4], n_sel);
		 and And41(and41, in1[4], sel);
		 or Or4(out[4], and40, and41);
		 
		 wire and50, and51;
		 and And50(and50, in0[5], n_sel);
		 and And51(and51, in1[5], sel);
		 or Or5(out[5], and50, and51);
		 
		 wire and60, and61;
		 and And60(and60, in0[6], n_sel);
		 and And61(and61, in1[6], sel);
		 or Or6(out[6], and60, and61);
		 
		 wire and70, and71;
		 and And70(and70, in0[7], n_sel);
		 and And71(and71, in1[7], sel);
		 or Or7(out[7], and70, and71);
	endmodule

	// MÓDULO 7: SHIFT RIGHT 8 BITS
	module shift_right_8bits(
		 input [7:0] D,
		 output [7:0] Q
	);
		 buf Buf0(Q[0], D[1]);
		 buf Buf1(Q[1], D[2]);
		 buf Buf2(Q[2], D[3]);
		 buf Buf3(Q[3], D[4]);
		 buf Buf4(Q[4], D[5]);
		 buf Buf5(Q[5], D[6]);
		 buf Buf6(Q[6], D[7]);
		 buf Buf7(Q[7], 1'b0);
	endmodule

	// MÓDULO 8: MULTIPLICADOR RECURSIVO PRINCIPAL
	module multiplicador_8bits_recursivo(
		 input [7:0] A,
		 input [7:0] B,
		 input clk,
		 input start,
		 input rst,
		 output [7:0] P,
		 output done,
		 output overflow_flag
	);
		 wire [15:0] acumulador_in, acumulador_out;
		 wire load_acumulador;
		 
		 registrador_16bits reg_acumulador(
			  .D(acumulador_in),
			  .clk(clk),
			  .rst(rst),
			  .en(load_acumulador),
			  .Q(acumulador_out)
		 );
		 
		 wire [7:0] multiplicando_out;
		 wire load_multiplicando;
		 
		 registrador8bits reg_multiplicando(
			  .ENT(A),
			  .clk(clk),
			  .en(load_multiplicando),
			  .S(multiplicando_out)
		 );
		 
		 wire [7:0] multiplicador_in, multiplicador_out;
		 wire load_multiplicador;
		 
		 registrador8bits reg_multiplicador(
			  .ENT(multiplicador_in),
			  .clk(clk),
			  .en(load_multiplicador),
			  .S(multiplicador_out)
		 );
		 
		 wire [3:0] contador_out;
		 wire inc_contador, rst_contador;
		 
		 contador_4bits cont(
			  .clk(clk),
			  .rst(rst_contador),
			  .en(inc_contador),
			  .Q(contador_out)
		 );
		 
		 wire state_idle, state_multiply, state_done;
		 
		 maquina_estados_mult fsm(
			  .clk(clk),
			  .rst(rst),
			  .start(start),
			  .contador(contador_out),
			  .state_idle(state_idle),
			  .state_multiply(state_multiply),
			  .state_done(state_done)
		 );
		 
		 wire [15:0] A_shifted;
		 
		 deslocador_variavel shift_A(
			  .A(multiplicando_out),
			  .shift_amount(contador_out[2:0]),
			  .Y(A_shifted)
		 );
		 
		 wire bit_B_atual;
		 buf Buf_bit(bit_B_atual, multiplicador_out[0]);
		 
		 wire [15:0] valor_a_somar;
		 mux_16bits_2x1 mux_soma(
			  .sel(bit_B_atual),
			  .in0(16'b0),
			  .in1(A_shifted),
			  .out(valor_a_somar)
		 );
		 
		 wire [15:0] soma_result;
		 wire cout_unused;
		 
		 somador_16bits somador_unico(
			  .A(acumulador_out),
			  .B(valor_a_somar),
			  .Cin(1'b0),
			  .S(soma_result),
			  .Cout(cout_unused)
		 );
		 
		 wire [7:0] multiplicador_shifted;
		 
		 shift_right_8bits shift_B(
			  .D(multiplicador_out),
			  .Q(multiplicador_shifted)
		 );
		 
		 wire load_acum_start, load_acum_multiply;
		 and And_load_start(load_acum_start, state_idle, start);
		 buf Buf_load_mult(load_acum_multiply, state_multiply);
		 or Or_load_acum(load_acumulador, load_acum_start, load_acum_multiply);
		 
		 mux_16bits_2x1 mux_acum_in(
			  .sel(state_multiply),
			  .in0(16'b0),
			  .in1(soma_result),
			  .out(acumulador_in)
		 );
		 
		 and And_load_mand(load_multiplicando, state_idle, start);
		 or Or_load_mdor(load_multiplicador, load_acum_start, load_acum_multiply);
		 
		 mux_8bits_2x1 mux_mdor_in(
			  .sel(state_multiply),
			  .in0(B),
			  .in1(multiplicador_shifted),
			  .out(multiplicador_in)
		 );
		 
		 buf Buf_inc_cont(inc_contador, state_multiply);
		 
		 wire rst_cont_start;
		 and And_rst_cont(rst_cont_start, state_idle, start);
		 or Or_rst_cont_global(rst_contador, rst_cont_start, rst);
		 
		 // SATURAÇÃO
		 wire overflow;
		 wire w_ovf0, w_ovf1, w_ovf2, w_ovf3, w_ovf4, w_ovf5;
		 or Or_ovf0(w_ovf0, acumulador_out[8], acumulador_out[9]);
		 or Or_ovf1(w_ovf1, acumulador_out[10], acumulador_out[11]);
		 or Or_ovf2(w_ovf2, acumulador_out[12], acumulador_out[13]);
		 or Or_ovf3(w_ovf3, acumulador_out[14], acumulador_out[15]);
		 or Or_ovf4(w_ovf4, w_ovf0, w_ovf1);
		 or Or_ovf5(w_ovf5, w_ovf2, w_ovf3);
		 or Or_ovf(overflow, w_ovf4, w_ovf5);
		 buf Buf_overflow(overflow_flag, overflow);
		 
		 // Saída: saturado ou normal
		 mux_8bits_2x1 mux_output(
			  .sel(overflow),
			  .in0(acumulador_out[7:0]),
			  .in1(8'b11111111),
			  .out(P)
		 );
		 
		 // Done
		 buf Buf_done(done, state_done);
	endmodule
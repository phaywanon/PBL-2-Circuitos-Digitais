module main (
		 input [7:0] ENT,
		 input Cin,
		 input clk,
		 input rst,
		 input botao,
		 input MuxAR,
		 output LEDZ, LEDE, LEDOV, LEDCARRY, LEDRES,
		 output [6:0] SEG0, SEG1, SEG2,
		 output [1:0] LEDc,
		 output LED_MULT_DONE  // LED para indicar que multiplicação terminou
	);
		 
		 //fios de saida dos registradores
		 wire [7:0]registradorA;
		 wire [7:0]registradorB;
		 wire [2:0]registradorOP;
		 wire wireCIN;
		 wire [7:0]registradorR; 
		 wire [7:0] R; 
		 wire Cout;
		 // Saída de carry do somador
		 
		 //permissoes do contador para registrar o estado correto
		 wire enableA, enableB, enableOP, enableR;
		 wire ns1, ns0;

		 not Not0(ns1, s1);
		 not Not1(ns0, s0);
		 
		 and And0(enableA, ns1, ns0);
		 and And1(enableB, ns1, s0);
		 and And2(enableOP, s1, ns0);
		 and And3(enableR, s1, s0);
		 
		 wire mult_done;
		 // Sinal de done do multiplicador

		 // Start quando: estado = enableR (s1=1, s0=1) E operação = 010 (multiplicação)
		 wire is_mult_op;
		 wire n_op0, n_op2;
		 not Not_op0(n_op0, registradorOP[0]);
		 not Not_op2(n_op2, registradorOP[2]);
		 and And_is_mult(is_mult_op, n_op2, registradorOP[1], n_op0);  // OP = 010

		 wire start_mult;
		 and And_start_mult(start_mult, enableR, is_mult_op);
		 
		 //mux para decidir se ira usar o reg A ou o reg R
		 wire [7:0] entrada_mux_A;
		 mux_8_2 seletor_A (
		 .ENT(ENT), .R(R), .controle(MuxAR), .decisao(entrada_mux_A)
		 );
		 
		 //bloco dos registradores
		 //registrador do A
		 registrador8bits registrador_A (
		 .ENT(entrada_mux_A), .clk(clk), .en(enableA), .S(registradorA)
		 );
		 //registrador do Carry-in
		 registradorCin registrador_do_CIN (
		 .Cin(Cin), .clk(clk), .en(enableA), .S(wireCIN)
		 );
		 //registrador do B
		 registrador8bits registrador_B (
		 .ENT(ENT), .clk(clk), .en(enableB), .S(registradorB)
		 );
		 //registrador da Operaçao
		 registrador_OP regOP (
		 .OP(ENT[2:0]), .clk(clk), .en(enableOP), .S(registradorOP)
		 );
		 //registrador do resultado da ULA (R)
		 registrador8bits registrador_R (
		 .ENT(registradorR), .clk(clk), .en(enableR), .S(R)
		 );
		 //registrador da selecaoo de base
		 wire [1:0] base_selecao_reg;
		 
		 registrador_base base_reg(
		 .base_in(ENT[6:5]), .clk(clk), .en(enableOP), .base_out(base_selecao_reg)
		 );
		 
		 //ULA 
		 ULA_8bits ULA (
		 .A(registradorA), .B(registradorB), .Cin(wireCIN),.clk(clk), .rst(rst),              
		 .start_mult(start_mult), .E0(registradorOP[0]), .E1(registradorOP[1]), 
		 .E2(registradorOP[2]),.R(registradorR), .ZEROflag(LEDZ), .ERRflag(LEDE), 
		 .OVflag(LEDOV), .COUT_flag(LEDCARRY), .mult_done(mult_done),.RESflag(LEDRES)
		 );
		 
		 //modulos dos displays
		 display_manager displays (
        .byte_in(R),
        .base_selecao(base_selecao_reg),
        .SEG0(SEG0),
        .SEG1(SEG1),
        .SEG2(SEG2)
		 );
		 
		 //contador
		 contador contador1 (
		 .rst(rst),
		 .clk(btn_db),
		 .controle(MuxAR),
		 .s1(s1), 
		 .s0(s0)
		 );
		 
		 //debounce
		 debounce debouncer (
		 .clock(clk), .button(botao), .out(btn_db)
		 );
		 
		 wire fio_s1, fio_s0;
		 or or10(LEDc[1], s1, 1'b0);
		 or or11(LEDc[0], s0, 1'b0);
		 		 
		 buf Buf_mult_done(LED_MULT_DONE, mult_done);
endmodule
module display_manager(
    input [7:0] byte_in,
    input [1:0] base_selecao,  // 00=Dec, 01=Hex, 10=Oct, 11=Bin
    output [6:0] SEG0, SEG1, SEG2
);
    
    // ===== DECODIFICADORES PARALELOS =====
    
    // 1. DECIMAL
    wire [3:0] centena_dec, dezena_dec, unidade_dec;
    wire [6:0] seg0_dec, seg1_dec, seg2_dec;
	 
    double_dabble_8bits_structural dec_decoder(
        .byte_in(byte_in),
        .centena(centena_dec), 
        .dezena(dezena_dec), 
        .unidade(unidade_dec)
    );
    bin2seg_structural seg_centena(.A(centena_dec[3]), .B(centena_dec[2]), .C(centena_dec[1]), .D(centena_dec[0]), .a(seg0_dec[0]), .b(seg0_dec[1]), .c(seg0_dec[2]), .d(seg0_dec[3]), .e(seg0_dec[4]), .f(seg0_dec[5]), .g(seg0_dec[6]));
    bin2seg_structural seg_dezena(.A(dezena_dec[3]), .B(dezena_dec[2]), .C(dezena_dec[1]), .D(dezena_dec[0]), .a(seg1_dec[0]), .b(seg1_dec[1]), .c(seg1_dec[2]), .d(seg1_dec[3]), .e(seg1_dec[4]), .f(seg1_dec[5]), .g(seg1_dec[6]));
    bin2seg_structural seg_unidade(.A(unidade_dec[3]), .B(unidade_dec[2]), .C(unidade_dec[1]), .D(unidade_dec[0]), .a(seg2_dec[0]), .b(seg2_dec[1]), .c(seg2_dec[2]), .d(seg2_dec[3]), .e(seg2_dec[4]), .f(seg2_dec[5]), .g(seg2_dec[6]));

    // 2. HEXADECIMAL 
    wire [6:0] seg0_hex, seg1_hex, seg2_hex;
    byte2hex_display hex_decoder(
        .byte_in(byte_in),
        .seg0(seg0_hex),
        .seg1(seg1_hex), 
        .seg2(seg2_hex)
    );

    // 3. OCTAL
    wire [6:0] seg0_oct, seg1_oct, seg2_oct;
    byte2oct_display oct_decoder(
        .byte_in(byte_in),
        .seg0(seg0_oct),
        .seg1(seg1_oct),
        .seg2(seg2_oct)
    );

	 wire [6:0] seg_off;
    // Todos segmentos apagados (7'b1111111)
    or(seg_off[0], 1'b1, 1'b0);
    or(seg_off[1], 1'b1, 1'b0);
    or(seg_off[2], 1'b1, 1'b0);
    or(seg_off[3], 1'b1, 1'b0);
    or(seg_off[4], 1'b1, 1'b0);
    or(seg_off[5], 1'b1, 1'b0);
    or(seg_off[6], 1'b1, 1'b0);
	 
	 
    // ===== MUX DE SELEÇÃO DE BASE =====
    mux_4x1_7bits mux_seg0(
        .S(base_selecao),
        .I0(seg0_dec), .I1(seg0_hex), .I2(seg0_oct), .I3(seg_off),
        .Y(SEG2)
    );
    
    mux_4x1_7bits mux_seg1(
        .S(base_selecao),
        .I0(seg1_dec), .I1(seg1_hex), .I2(seg1_oct), .I3(seg_off),
        .Y(SEG1)
    );
    
    mux_4x1_7bits mux_seg2(
        .S(base_selecao),
        .I0(seg2_dec), .I1(seg2_hex), .I2(seg2_oct), .I3(seg_off),
        .Y(SEG0)
    );

endmodule
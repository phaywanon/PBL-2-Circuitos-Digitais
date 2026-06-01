module mux_4x1_7bits(
    input [1:0] S,          // Seletor de base
    input [6:0] I0, I1, I2, I3,  // Entradas
    output [6:0] Y          // Saída
);
    // MUX 4:1 para CADA BIT dos 7 segmentos
    
    // Bit 0 (segmento a)
    mux_4x1_bit mux_bit0(.S(S), .I0(I0[0]), .I1(I1[0]), .I2(I2[0]), .I3(I3[0]), .Y(Y[0]));
    
    // Bit 1 (segmento b)
    mux_4x1_bit mux_bit1(.S(S), .I0(I0[1]), .I1(I1[1]), .I2(I2[1]), .I3(I3[1]), .Y(Y[1]));
    
    // Bit 2 (segmento c)
    mux_4x1_bit mux_bit2(.S(S), .I0(I0[2]), .I1(I1[2]), .I2(I2[2]), .I3(I3[2]), .Y(Y[2]));
    
    // Bit 3 (segmento d)
    mux_4x1_bit mux_bit3(.S(S), .I0(I0[3]), .I1(I1[3]), .I2(I2[3]), .I3(I3[3]), .Y(Y[3]));
    
    // Bit 4 (segmento e)
    mux_4x1_bit mux_bit4(.S(S), .I0(I0[4]), .I1(I1[4]), .I2(I2[4]), .I3(I3[4]), .Y(Y[4]));
    
    // Bit 5 (segmento f)
    mux_4x1_bit mux_bit5(.S(S), .I0(I0[5]), .I1(I1[5]), .I2(I2[5]), .I3(I3[5]), .Y(Y[5]));
    
    // Bit 6 (segmento g)
    mux_4x1_bit mux_bit6(.S(S), .I0(I0[6]), .I1(I1[6]), .I2(I2[6]), .I3(I3[6]), .Y(Y[6]));

endmodule
module multiplicador_8bits(
    input [7:0] A,
    input [7:0] B,
    output [7:0] P,
	 output overflow_flag
);

    // Resultados parciais (16 bits para evitar overflow durante cálculo)
    wire [15:0] parcial0, parcial1, parcial2, parcial3;
    wire [15:0] parcial4, parcial5, parcial6, parcial7;
    
    // A deslocado para cada posição (multiplicado por potências de 2)
    wire [15:0] A_shift0, A_shift1, A_shift2, A_shift3;
    wire [15:0] A_shift4, A_shift5, A_shift6, A_shift7;
    
    // Carries entre as somas
    wire cout0, cout1, cout2, cout3, cout4, cout5, cout6;
    
    // ==============================================
    // ETAPA 0: Se B[0]=1, adiciona A×1
    // ==============================================
    assign A_shift0 = {8'b0, A};  // A × 2^0 = A
    
    mux_16bits_2x1 mux0(
        .sel(B[0]),
        .in0(16'b0),
        .in1(A_shift0),
        .out(parcial0)
    );
    
    // ==============================================
    // ETAPA 1: Se B[1]=1, adiciona A×2
    // ==============================================
    assign A_shift1 = {7'b0, A, 1'b0};  // A × 2^1 = A << 1
    
    wire [15:0] add_in1;
    mux_16bits_2x1 mux1(
        .sel(B[1]),
        .in0(16'b0),
        .in1(A_shift1),
        .out(add_in1)
    );
    
    somador_16bits soma1(
        .A(parcial0),
        .B(add_in1),
        .Cin(1'b0),
        .S(parcial1),
        .Cout(cout0)
    );
    
    // ==============================================
    // ETAPA 2: Se B[2]=1, adiciona A×4
    // ==============================================
    assign A_shift2 = {6'b0, A, 2'b0};  // A × 2^2 = A << 2
    
    wire [15:0] add_in2;
    mux_16bits_2x1 mux2(
        .sel(B[2]),
        .in0(16'b0),
        .in1(A_shift2),
        .out(add_in2)
    );
    
    somador_16bits soma2(
        .A(parcial1),
        .B(add_in2),
        .Cin(1'b0),
        .S(parcial2),
        .Cout(cout1)
    );
    
    // ==============================================
    // ETAPA 3: Se B[3]=1, adiciona A×8
    // ==============================================
    assign A_shift3 = {5'b0, A, 3'b0};  // A × 2^3 = A << 3
    
    wire [15:0] add_in3;
    mux_16bits_2x1 mux3(
        .sel(B[3]),
        .in0(16'b0),
        .in1(A_shift3),
        .out(add_in3)
    );
    
    somador_16bits soma3(
        .A(parcial2),
        .B(add_in3),
        .Cin(1'b0),
        .S(parcial3),
        .Cout(cout2)
    );
    
    // ==============================================
    // ETAPA 4: Se B[4]=1, adiciona A×16
    // ==============================================
    assign A_shift4 = {4'b0, A, 4'b0};  // A × 2^4 = A << 4
    
    wire [15:0] add_in4;
    mux_16bits_2x1 mux4(
        .sel(B[4]),
        .in0(16'b0),
        .in1(A_shift4),
        .out(add_in4)
    );
    
    somador_16bits soma4(
        .A(parcial3),
        .B(add_in4),
        .Cin(1'b0),
        .S(parcial4),
        .Cout(cout3)
    );
    
    // ==============================================
    // ETAPA 5: Se B[5]=1, adiciona A×32
    // ==============================================
    assign A_shift5 = {3'b0, A, 5'b0};  // A × 2^5 = A << 5
    
    wire [15:0] add_in5;
    mux_16bits_2x1 mux5(
        .sel(B[5]),
        .in0(16'b0),
        .in1(A_shift5),
        .out(add_in5)
    );
    
    somador_16bits soma5(
        .A(parcial4),
        .B(add_in5),
        .Cin(1'b0),
        .S(parcial5),
        .Cout(cout4)
    );
    
    // ==============================================
    // ETAPA 6: Se B[6]=1, adiciona A×64
    // ==============================================
    assign A_shift6 = {2'b0, A, 6'b0};  // A × 2^6 = A << 6
    
    wire [15:0] add_in6;
    mux_16bits_2x1 mux6(
        .sel(B[6]),
        .in0(16'b0),
        .in1(A_shift6),
        .out(add_in6)
    );
    
    somador_16bits soma6(
        .A(parcial5),
        .B(add_in6),
        .Cin(1'b0),
        .S(parcial6),
        .Cout(cout5)
    );
    
    // ==============================================
    // ETAPA 7: Se B[7]=1, adiciona A×128
    // ==============================================
    assign A_shift7 = {1'b0, A, 7'b0};  // A × 2^7 = A << 7
    
    wire [15:0] add_in7;
    mux_16bits_2x1 mux7(
        .sel(B[7]),
        .in0(16'b0),
        .in1(A_shift7),
        .out(add_in7)
    );
    
    somador_16bits soma7(
        .A(parcial6),
        .B(add_in7),
        .Cin(1'b0),
        .S(parcial7),
        .Cout(cout6)
    );
    
    // ==============================================
    // SATURAÇÃO: Se resultado > 255, retorna 255
    // ==============================================
    // Overflow se algum dos 8 bits superiores for 1
	 
    or Or_overflow(overflow, 
        parcial7[8], parcial7[9], parcial7[10], parcial7[11],
        parcial7[12], parcial7[13], parcial7[14], parcial7[15]
    );

    // MUX para decidir entre parcial7[7:0] e 8'b11111111
    mux_8bits_2x1 mux_saturacao(
        .sel(overflow),
        .in0(parcial7[7:0]),
        .in1(8'b11111111),
        .out(P)
    );

    mux_1bit_2x1 mux_flag_overflow(
        .sel(overflow),
        .in0(1'b0),
        .in1(1'b1),
        .out(overflow_flag)
    );

endmodule


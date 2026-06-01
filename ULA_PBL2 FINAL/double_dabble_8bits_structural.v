module double_dabble_8bits_structural(
    input [7:0] byte_in,
    output [3:0] centena,
    output [3:0] dezena,
    output [3:0] unidade
);
    
    // ===== Fios para os estágios do algoritmo =====
    wire [3:0] stage0_c, stage0_d, stage0_u;
    wire [3:0] stage1_c, stage1_d, stage1_u;
    wire [3:0] stage2_c, stage2_d, stage2_u;
    wire [3:0] stage3_c, stage3_d, stage3_u;
    wire [3:0] stage4_c, stage4_d, stage4_u;
    wire [3:0] stage5_c, stage5_d, stage5_u;
    wire [3:0] stage6_c, stage6_d, stage6_u;
    wire [3:0] stage7_c, stage7_d, stage7_u;
    
    // ===== Estágio 0: Inicialização =====
    // Modificação: Substituímos assign por portas OR redundantes
    or(stage0_c[0], 1'b0, 1'b0);
    or(stage0_c[1], 1'b0, 1'b0);
    or(stage0_c[2], 1'b0, 1'b0);
    or(stage0_c[3], 1'b0, 1'b0);

    or(stage0_d[0], 1'b0, 1'b0);
    or(stage0_d[1], 1'b0, 1'b0);
    or(stage0_d[2], 1'b0, 1'b0);
    or(stage0_d[3], 1'b0, 1'b0);

    or(stage0_u[0], 1'b0, 1'b0);
    or(stage0_u[1], 1'b0, 1'b0);
    or(stage0_u[2], 1'b0, 1'b0);
    or(stage0_u[3], 1'b0, 1'b0);

    // ===== Estágios 1 a 8 =====
    // Cada estágio processa 1 bit do byte, de MSB para LSB
    double_dabble_stage_structural stage1(
        .c_in(stage0_c), .d_in(stage0_d), .u_in(stage0_u),
        .bit_in(byte_in[7]),
        .c_out(stage1_c), .d_out(stage1_d), .u_out(stage1_u)
    );
    double_dabble_stage_structural stage2(
        .c_in(stage1_c), .d_in(stage1_d), .u_in(stage1_u),
        .bit_in(byte_in[6]),
        .c_out(stage2_c), .d_out(stage2_d), .u_out(stage2_u)
    );
    double_dabble_stage_structural stage3(
        .c_in(stage2_c), .d_in(stage2_d), .u_in(stage2_u),
        .bit_in(byte_in[5]),
        .c_out(stage3_c), .d_out(stage3_d), .u_out(stage3_u)
    );
    double_dabble_stage_structural stage4(
        .c_in(stage3_c), .d_in(stage3_d), .u_in(stage3_u),
        .bit_in(byte_in[4]),
        .c_out(stage4_c), .d_out(stage4_d), .u_out(stage4_u)
    );
    double_dabble_stage_structural stage5(
        .c_in(stage4_c), .d_in(stage4_d), .u_in(stage4_u),
        .bit_in(byte_in[3]),
        .c_out(stage5_c), .d_out(stage5_d), .u_out(stage5_u)
    );
    double_dabble_stage_structural stage6(
        .c_in(stage5_c), .d_in(stage5_d), .u_in(stage5_u),
        .bit_in(byte_in[2]),
        .c_out(stage6_c), .d_out(stage6_d), .u_out(stage6_u)
    );
    double_dabble_stage_structural stage7(
        .c_in(stage6_c), .d_in(stage6_d), .u_in(stage6_u),
        .bit_in(byte_in[1]),
        .c_out(stage7_c), .d_out(stage7_d), .u_out(stage7_u)
    );
    double_dabble_stage_structural stage8(
        .c_in(stage7_c), .d_in(stage7_d), .u_in(stage7_u),
        .bit_in(byte_in[0]),
        .c_out(centena), .d_out(dezena), .u_out(unidade)
    );

endmodule

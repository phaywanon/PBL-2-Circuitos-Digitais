// ===== Stage totalmente estrutural =====
module double_dabble_stage_structural(
    input [3:0] c_in, d_in, u_in,
    input bit_in,
    output [3:0] c_out, d_out, u_out
);
    wire add3_c, add3_d, add3_u;
    wire [3:0] c_add3, d_add3, u_add3;

    // Comparadores ≥5
    comp5_structural comp_c(.Q3(c_in[3]), .Q2(c_in[2]), .Q1(c_in[1]), .Q0(c_in[0]), .ge5(add3_c));
    comp5_structural comp_d(.Q3(d_in[3]), .Q2(d_in[2]), .Q1(d_in[1]), .Q0(d_in[0]), .ge5(add3_d));
    comp5_structural comp_u(.Q3(u_in[3]), .Q2(u_in[2]), .Q1(u_in[1]), .Q0(u_in[0]), .ge5(add3_u));

    // Add-3 condicional
    add3_cond_structural add3_circuit_c(.Q3(c_in[3]), .Q2(c_in[2]), .Q1(c_in[1]), .Q0(c_in[0]), .add3(add3_c),
                                        .Y3(c_add3[3]), .Y2(c_add3[2]), .Y1(c_add3[1]), .Y0(c_add3[0]));
    add3_cond_structural add3_circuit_d(.Q3(d_in[3]), .Q2(d_in[2]), .Q1(d_in[1]), .Q0(d_in[0]), .add3(add3_d),
                                        .Y3(d_add3[3]), .Y2(d_add3[2]), .Y1(d_add3[1]), .Y0(d_add3[0]));
    add3_cond_structural add3_circuit_u(.Q3(u_in[3]), .Q2(u_in[2]), .Q1(u_in[1]), .Q0(u_in[0]), .add3(add3_u),
                                        .Y3(u_add3[3]), .Y2(u_add3[2]), .Y1(u_add3[1]), .Y0(u_add3[0]));

    // ===== Shift totalmente estrutural =====
    or(c_out[3], 1'b0, c_add3[2]);  // bit 2 vai para MSB
    or(c_out[2], 1'b0, c_add3[1]);  // bit 1
    or(c_out[1], 1'b0, c_add3[0]);  // bit 0
    or(c_out[0], 1'b0, d_add3[3]);  // MSB da dezena vai para LSB da centena

    // d_out: shift left e pega o MSB da unidade
    or(d_out[3], 1'b0, d_add3[2]);  // bit 2
    or(d_out[2], 1'b0, d_add3[1]);  // bit 1
    or(d_out[1], 1'b0, d_add3[0]);  // bit 0
    or(d_out[0], 1'b0, u_add3[3]);  // MSB da unidade vai para LSB da dezena

    // u_out: shift left e recebe o bit do byte
    or(u_out[3], 1'b0, u_add3[2]);  // bit 2
    or(u_out[2], 1'b0, u_add3[1]);  // bit 1
    or(u_out[1], 1'b0, u_add3[0]);  // bit 0
    or(u_out[0], 1'b0, bit_in);     // bit do byte entra no LSB da unidade
endmodule
module mux_8bits_2x1(input sel, input [7:0] in0, in1, output [7:0] out);
    mux_1bit_2x1 m0(sel, in0[0], in1[0], out[0]);
    mux_1bit_2x1 m1(sel, in0[1], in1[1], out[1]);
    mux_1bit_2x1 m2(sel, in0[2], in1[2], out[2]);
    mux_1bit_2x1 m3(sel, in0[3], in1[3], out[3]);
    mux_1bit_2x1 m4(sel, in0[4], in1[4], out[4]);
    mux_1bit_2x1 m5(sel, in0[5], in1[5], out[5]);
    mux_1bit_2x1 m6(sel, in0[6], in1[6], out[6]);
    mux_1bit_2x1 m7(sel, in0[7], in1[7], out[7]);
endmodule
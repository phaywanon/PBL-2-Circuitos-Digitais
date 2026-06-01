module mux_1bit_2x1(input sel, input in0, in1, output out);
    wire nsel, a, b;
    not(nsel, sel);
    and(a, in0, nsel);
    and(b, in1, sel);
    or(out, a, b);
endmodule
module byte2oct_display(
    input [7:0] byte_in,
    output [6:0] seg0, // centena
    output [6:0] seg1, // dezena
    output [6:0] seg2  // unidade
);
    // Display da centena
    bin2seg_oct d0(.A(1'b0), .B(byte_in[7]), .C(byte_in[6]),
                           .a(seg0[0]), .b(seg0[1]), .c(seg0[2]), 
                           .d(seg0[3]), .e(seg0[4]), .f(seg0[5]), .g(seg0[6]));

    // Display da dezena
    bin2seg_oct d1(.A(byte_in[5]), .B(byte_in[4]), .C(byte_in[3]), 
                           .a(seg1[0]), .b(seg1[1]), .c(seg1[2]), 
                           .d(seg1[3]), .e(seg1[4]), .f(seg1[5]), .g(seg1[6]));

    // Display da unidade
    bin2seg_oct d2(.A(byte_in[2]), .B(byte_in[1]), .C(byte_in[0]), 
                           .a(seg2[0]), .b(seg2[1]), .c(seg2[2]), 
                           .d(seg2[3]), .e(seg2[4]), .f(seg2[5]), .g(seg2[6]));
endmodule

module registrador_base(
    input [1:0] base_in, // ENT[6:5]
    input clk,
    input en,
    output [1:0] base_out
);
    flipflop_D_descida f0(.d(base_in[0]), .clk(clk), .rst_n(1'b1), .en(en), .q(base_out[0]));
    flipflop_D_descida f1(.d(base_in[1]), .clk(clk), .rst_n(1'b1), .en(en), .q(base_out[1]));
endmodule

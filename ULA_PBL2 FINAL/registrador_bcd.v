module registrador_bcd(
    input clk,
    input rst_n,
    input en,
    input [3:0] D,
    output [3:0] Q
);
    flipflop_D ff0(.clk(clk), .rst_n(rst_n), .en(en), .d(D[0]), .q(Q[0]));
    flipflop_D ff1(.clk(clk), .rst_n(rst_n), .en(en), .d(D[1]), .q(Q[1]));
    flipflop_D ff2(.clk(clk), .rst_n(rst_n), .en(en), .d(D[2]), .q(Q[2]));
    flipflop_D ff3(.clk(clk), .rst_n(rst_n), .en(en), .d(D[3]), .q(Q[3]));
	 
endmodule
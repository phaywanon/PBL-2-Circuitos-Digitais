module registrador_16bits(
    input [15:0] D,
    input clk,
    input rst, 
    input en,
    output [15:0] Q
);
  
		
    flipflop_D_descida ff0(.d(D[0]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[0]));
    flipflop_D_descida ff1(.d(D[1]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[1]));
    flipflop_D_descida ff2(.d(D[2]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[2]));
    flipflop_D_descida ff3(.d(D[3]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[3]));
    flipflop_D_descida ff4(.d(D[4]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[4]));
    flipflop_D_descida ff5(.d(D[5]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[5]));
    flipflop_D_descida ff6(.d(D[6]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[6]));
    flipflop_D_descida ff7(.d(D[7]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[7]));
    flipflop_D_descida ff8(.d(D[8]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[8]));
    flipflop_D_descida ff9(.d(D[9]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[9]));
    flipflop_D_descida ff10(.d(D[10]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[10]));
    flipflop_D_descida ff11(.d(D[11]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[11]));
    flipflop_D_descida ff12(.d(D[12]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[12]));
    flipflop_D_descida ff13(.d(D[13]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[13]));
    flipflop_D_descida ff14(.d(D[14]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[14]));
    flipflop_D_descida ff15(.d(D[15]), .clk(clk), .rst_n(~rst), .en(en), .q(Q[15]));
endmodule
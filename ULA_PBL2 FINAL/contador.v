module contador (
	 input rst,
    input clk,
	 input controle,
    output s1, s0
);

    wire not_s1, not_s0;
    wire s0p, s1p;

    not(not_s1, s1);
    not(not_s0, s0);

    // Expressoes retiradas do mapa K para s1
    xor Xor0 (s1p, s1, s0); 
    
	 
	 // Flip-flop para o bit s1
    flipflop_D ff_s1 (
        .d(s1p), 
        .clk(clk), 
        .rst_n(rst), 
        .en(1'b1),
        .q(s1)
    );
	 
	 // Expressoes retiradas do mapa K para s0
//	 //assign s0c = (~s0) | (controle & s1);
//	 wire f1;
//	 and and0(f1, controle, s1);
//	 or or0(s0p, not_s0, f1);

	 or or0(s0p, not_s0, 1'b0); 

    // Flip-flop para o bit s0
    flipflop_D ff_s0 (
        .d(s0p), 
        .clk(clk), 
        .rst_n(rst), 
        .en(1'b1), 
        .q(s0)
    );
    
endmodule


module debounce (
    input clock, 
    input button,
    output out
);
    wire Q0, Q1; // Faremos as conexões para o debounce

    // Flip-flop 1
    flipflop_D ff1 (
        .d(button), 
        .clk(clock), 
        .rst_n(1'b1), 
        .en(1'b1), 
        .q(Q0)
    );
    
    // Flip-flop 2
    flipflop_D ff2 (
        .d(Q0), 
        .clk(clock), 
        .rst_n(1'b1), 
        .en(1'b1), 
        .q(Q1)
    );

    // Lógica para debouncing (out será a diferença entre os dois flip-flops)
	 wire nQ1;
	 not not0(nQ1, Q1);
    and (out, Q0, nQ1);
    
endmodule

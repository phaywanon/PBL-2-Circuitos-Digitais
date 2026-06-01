module edge_detector (
    input clk,
    input btn,
    output pulso
);

    wire btn_sync0, btn_sync1;
    wire pulso_int;

	flipflop_D flipflop(
		.d(btn), .clk(clk),	.rst_n(1'b1),	.en(1'b1),	.q(btn_sync0)
	);
	
	flipflop_D flipflop(
		.d(btn_sync0), .clk(clk),	.rst_n(1'b1),	.en(1'b1),	.q(btn_sync1)
	);
    // Detecção de borda: pulso é gerado quando btn_sync0 e btn_sync1 são diferentes
	 wire nbtn_sync1;
	 not not0 (nbtn_sync1, btn_sync1);
	 and And0 (pulso_int, btn_sync0, nbtn_sync1);

    // Atribuição do sinal final
	 and and10(pulso, pulso_int, 1'b1);
	 
endmodule
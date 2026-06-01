//module edge_detector (
//    input clk,
//    input btn,
//    output pulso
//);
//
//    wire btn_sync0, btn_sync1;
//
//    // Flip-flops para o sincronismo
//    flipflop_D ff_sync0 (
//        .d(btn), 
//        .clk(clk), 
//        .rst_n(1'b1), 
//        .en(1'b1), 
//        .q(btn_sync0)
//    );
//    
//    flipflop_D ff_sync1 (
//        .d(btn_sync0), 
//        .clk(clk), 
//        .rst_n(1'b1), 
//        .en(1'b1), 
//        .q(btn_sync1)
//    );
//
//    // Detecção de borda positiva
//    assign pulso = btn_sync0 & ~btn_sync1;
//
//endmodule

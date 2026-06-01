module mux_16bits_2x1(
    input sel,
    input [15:0] in0,
    input [15:0] in1,
    output [15:0] out
);

    // Se sel=0, saída=in0; se sel=1, saída=in1
    wire [15:0] fio_in0, fio_in1;
    wire nsel;
    
    not Not0(nsel, sel);
    
    // Bit 0
    and And00(fio_in0[0], in0[0], nsel);
    and And01(fio_in1[0], in1[0], sel);
    or Or0(out[0], fio_in0[0], fio_in1[0]);
    
    // Bit 1
    and And10(fio_in0[1], in0[1], nsel);
    and And11(fio_in1[1], in1[1], sel);
    or Or1(out[1], fio_in0[1], fio_in1[1]);
    
    // Bit 2
    and And20(fio_in0[2], in0[2], nsel);
    and And21(fio_in1[2], in1[2], sel);
    or Or2(out[2], fio_in0[2], fio_in1[2]);
    
    // Bit 3
    and And30(fio_in0[3], in0[3], nsel);
    and And31(fio_in1[3], in1[3], sel);
    or Or3(out[3], fio_in0[3], fio_in1[3]);
    
    // Bit 4
    and And40(fio_in0[4], in0[4], nsel);
    and And41(fio_in1[4], in1[4], sel);
    or Or4(out[4], fio_in0[4], fio_in1[4]);
    
    // Bit 5
    and And50(fio_in0[5], in0[5], nsel);
    and And51(fio_in1[5], in1[5], sel);
    or Or5(out[5], fio_in0[5], fio_in1[5]);
    
    // Bit 6
    and And60(fio_in0[6], in0[6], nsel);
    and And61(fio_in1[6], in1[6], sel);
    or Or6(out[6], fio_in0[6], fio_in1[6]);
    
    // Bit 7
    and And70(fio_in0[7], in0[7], nsel);
    and And71(fio_in1[7], in1[7], sel);
    or Or7(out[7], fio_in0[7], fio_in1[7]);
    
    // Bit 8
    and And80(fio_in0[8], in0[8], nsel);
    and And81(fio_in1[8], in1[8], sel);
    or Or8(out[8], fio_in0[8], fio_in1[8]);
    
    // Bit 9
    and And90(fio_in0[9], in0[9], nsel);
    and And91(fio_in1[9], in1[9], sel);
    or Or9(out[9], fio_in0[9], fio_in1[9]);
    
    // Bit 10
    and And100(fio_in0[10], in0[10], nsel);
    and And101(fio_in1[10], in1[10], sel);
    or Or10(out[10], fio_in0[10], fio_in1[10]);
    
    // Bit 11
    and And110(fio_in0[11], in0[11], nsel);
    and And111(fio_in1[11], in1[11], sel);
    or Or11(out[11], fio_in0[11], fio_in1[11]);
    
    // Bit 12
    and And120(fio_in0[12], in0[12], nsel);
    and And121(fio_in1[12], in1[12], sel);
    or Or12(out[12], fio_in0[12], fio_in1[12]);
    
    // Bit 13
    and And130(fio_in0[13], in0[13], nsel);
    and And131(fio_in1[13], in1[13], sel);
    or Or13(out[13], fio_in0[13], fio_in1[13]);
    
    // Bit 14
    and And140(fio_in0[14], in0[14], nsel);
    and And141(fio_in1[14], in1[14], sel);
    or Or14(out[14], fio_in0[14], fio_in1[14]);
    
    // Bit 15
    and And150(fio_in0[15], in0[15], nsel);
    and And151(fio_in1[15], in1[15], sel);
    or Or15(out[15], fio_in0[15], fio_in1[15]);

endmodule


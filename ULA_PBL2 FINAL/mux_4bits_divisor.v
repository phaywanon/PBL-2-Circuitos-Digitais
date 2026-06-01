module mux_4bits_divisor(
    input dif0, dif1, dif2, dif3,
    input antigo_rp0, antigo_rp1, antigo_rp2, antigo_rp3,
    output novo_rp0, novo_rp1, novo_rp2, novo_rp3,
    input bout_sel
);
    wire nbout_sel;
    not n0(nbout_sel, bout_sel);

    wire fio_dif0, fio_dif1, fio_dif2, fio_dif3;
    wire fio_antigo_rp0, fio_antigo_rp1, fio_antigo_rp2, fio_antigo_rp3;
    
    // Logica para cada um dos 4 bits
    and And0_0(fio_dif0, nbout_sel, dif0);
    and And0_1(fio_dif1, nbout_sel, dif1);
    and And0_2(fio_dif2, nbout_sel, dif2);
    and And0_3(fio_dif3, nbout_sel, dif3);
    
    and And1_0(fio_antigo_rp0, bout_sel, antigo_rp0);
    and And1_1(fio_antigo_rp1, bout_sel, antigo_rp1);
    and And1_2(fio_antigo_rp2, bout_sel, antigo_rp2);
    and And1_3(fio_antigo_rp3, bout_sel, antigo_rp3);
    
    or Or0_0(novo_rp0, fio_dif0, fio_antigo_rp0);
    or Or0_1(novo_rp1, fio_dif1, fio_antigo_rp1);
    or Or0_2(novo_rp2, fio_dif2, fio_antigo_rp2);
    or Or0_3(novo_rp3, fio_dif3, fio_antigo_rp3);

endmodule
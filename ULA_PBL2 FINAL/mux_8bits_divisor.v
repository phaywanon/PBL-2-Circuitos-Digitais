module mux_8bits_divisor(
    input dif0, dif1, dif2, dif3, dif4, dif5, dif6, dif7,
    input antigo_rp0, antigo_rp1, antigo_rp2, antigo_rp3, antigo_rp4, antigo_rp5, antigo_rp6, antigo_rp7,
    output novo_rp0, novo_rp1, novo_rp2, novo_rp3, novo_rp4, novo_rp5, novo_rp6, novo_rp7,
    input bout_sel
);
    wire nbout_sel;
    not n0(nbout_sel, bout_sel);

    wire fio_dif0, fio_dif1, fio_dif2, fio_dif3, fio_dif4, fio_dif5, fio_dif6, fio_dif7;
    wire fio_antigo_rp0, fio_antigo_rp1, fio_antigo_rp2, fio_antigo_rp3, fio_antigo_rp4, fio_antigo_rp5, fio_antigo_rp6, fio_antigo_rp7;
    
    // Logica para cada um dos 8 bits
    and And0_0(fio_dif0, nbout_sel, dif0);
    and And0_1(fio_dif1, nbout_sel, dif1);
    and And0_2(fio_dif2, nbout_sel, dif2);
    and And0_3(fio_dif3, nbout_sel, dif3);
	 and And0_4(fio_dif4, nbout_sel, dif4);
	 and And0_5(fio_dif5, nbout_sel, dif5);
    and And0_6(fio_dif6, nbout_sel, dif6);
	 and And0_7(fio_dif7, nbout_sel, dif7);
	 
	 
    and And1_0(fio_antigo_rp0, bout_sel, antigo_rp0);
    and And1_1(fio_antigo_rp1, bout_sel, antigo_rp1);
    and And1_2(fio_antigo_rp2, bout_sel, antigo_rp2);
    and And1_3(fio_antigo_rp3, bout_sel, antigo_rp3);
	 and And1_4(fio_antigo_rp4, bout_sel, antigo_rp4);
	 and And1_5(fio_antigo_rp5, bout_sel, antigo_rp5);
	 and And1_6(fio_antigo_rp6, bout_sel, antigo_rp6);
	 and And1_7(fio_antigo_rp7, bout_sel, antigo_rp7);
	 
	 
    or Or0_0(novo_rp0, fio_dif0, fio_antigo_rp0);
    or Or0_1(novo_rp1, fio_dif1, fio_antigo_rp1);
    or Or0_2(novo_rp2, fio_dif2, fio_antigo_rp2);
    or Or0_3(novo_rp3, fio_dif3, fio_antigo_rp3);
	 or Or0_4(novo_rp4, fio_dif4, fio_antigo_rp4);
	 or Or0_5(novo_rp5, fio_dif5, fio_antigo_rp5);
	 or Or0_6(novo_rp6, fio_dif6, fio_antigo_rp6);
	 or Or0_7(novo_rp7, fio_dif7, fio_antigo_rp7);
	 
	 
	 
endmodule
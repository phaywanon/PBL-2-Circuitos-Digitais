module multiplexador_1bit (
    input S, Dif, P, Q, And, Or, Xor, Not,
    input E0, E1, E2,
    output R
);

    wire fio_S, fio_Dif, fio_P, fio_Q, fio_And, fio_Or, fio_Xor, fio_Not; 
    wire nE0, nE1, nE2;
    
    not not0(nE0, E0);
    not not1(nE1, E1);
    not not2(nE2, E2);
	 
	 //E0 -> LSB
	 //E2 -> MSB
	                                          // E2 E1 E0
    and And0(fio_S, nE0, nE1, nE2, S); 		// 0  0  0 SOMADOR
    and And1(fio_Dif, E0, nE1, nE2, Dif);		// 0  0  1 SUBTRATOR
    and And2(fio_P, nE0, E1, nE2, P);			// 0  1  0 MULTIPLICADOR
    and And3(fio_Q, E0, E1, nE2, Q);			// 0  1  1 DIVISOR 
    and And4(fio_And, nE0, nE1,E2, And);		// 1  0  0 AND
    and And5(fio_Or, E0, nE1,E2, Or);			// 1  0  1 OR
    and And6(fio_Xor, nE0, E1,E2, Xor);		// 1  1  0 XOR
	 and And7(fio_Not, E0, E1, E2, Not);      // 1  1  1 NOT
	
    or Or0(R, fio_S, fio_Dif, fio_P, fio_Q, fio_And, fio_Or, fio_Xor, fio_Not);

endmodule

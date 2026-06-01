module ULA_8bits(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    input clk,          
    input rst,          
    input start_mult,   
    input E0, E1, E2,
    output [7:0] R,
    output ZEROflag,
    output ERRflag,
    output OVflag,
    output COUT_flag,
    output mult_done,    
    output RESflag
);

    wire [7:0] S_soma;
    wire C_soma;
    wire [7:0] D_sub;
    wire B_sub;
    wire [7:0] AND;
    wire [7:0] OR;
    wire [7:0] XOR;
    wire [7:0] NOT;
    wire [7:0] P_p;
    wire [7:0] Q_q;
    wire [7:0] RESTOS;
    wire OV_mult;
    
    // SOMADOR
    somador_8bits soma(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(C_soma),
        .S(S_soma)
    );
    // SUBTRATOR
    subtrator_8bits sub(
        .A(A),
        .B(B),
        .Bin(Cin),
        .Bout(B_sub),
        .Dif(D_sub)
    );
    // MULTIPLICADOR RECURSISO
    multiplicador_8bits_recursivo mult(
        .A(A),
        .B(B),
        .clk(clk),
        .start(start_mult),
        .rst(rst),
        .P(P_p),
        .done(mult_done),
        .overflow_flag(OV_mult) 
    );
    // DIVISOR
    divisor div(
        .A(A),
        .B(B),
        .Q(Q_q),
        .RES(RESTOS) 
    );
    // PORTAS LÓGICAS
    AND_8bits porta_and(
        .A(A),
        .B(B),
        .S(AND)
    );
    OR_8bits porta_or(
        .A(A),
        .B(B),
        .S(OR)
    );
    XOR_8bits porta_xor(
        .A(A),
        .B(B),
        .S(XOR)
    );
    NOT_8bits porta_not(
        .A(A),
        .nA(NOT)
    );
    // MUX DA ULA
    multiplexador_8bits mux_principal(
        .S(S_soma),
        .Dif(D_sub),
        .P(P_p),
        .Q(Q_q),
        .And(AND),
        .Or(OR),
        .Xor(XOR),
        .Not(NOT), 
        .E0(E0), .E1(E1), .E2(E2),
        .R(R)
    );
    
    // FLAGS

    // FLAG ZERO
    flagzero fz(
        .S_soma(S_soma),
        .D_sub(D_sub),
        .AND(AND),
        .OR(OR),
        .XOR(XOR),
        .Q_q(Q_q),
        .P_p(P_p),
        .NOT(NOT), 
        .E0(E0), .E1(E1), .E2(E2),
        .ZEROFLAG(ZEROflag)
    );
    // FLAG ERRO
    flagERRO fe(
        .E0(E0), .E1(E1), .E2(E2),
        .B(B),
        .flagerro(ERRflag)
    );
    
    // FLAG OVERFLOW
    flagoverflow fof(
        .E0(E0), .E1(E1), .E2(E2),       
        .C_soma(C_soma),                
        .B_sub(B_sub),                
        .OV_mult(OV_mult),            
        .OVflag(OVflag)       
    );

    // FLAG CARRY OUT
    flagCarryOut fcout(
        .C_soma(C_soma),
        .B_sub(B_sub),
        .E0(E0),
        .E1(E1),
        .E2(E2),
        .COUTflag(COUT_flag)
    );

    // FLAG RESTO
    flagRESTO fres(
        .E0(E0), .E1(E1), .E2(E2),
        .RES(RESTOS),
        .flagresto(RESflag)
    );

endmodule
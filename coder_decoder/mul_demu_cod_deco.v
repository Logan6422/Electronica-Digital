module mul_demu_cod_deco(
    input wire [3:0] in_dec,
    output reg [3:0] out_dec,
    input wire s0_dec,s1_dec
);

//temporal reg
wire temp_out;
reg[3:0] temp_out_reg;


mul_4ent MUL_4ENT(
    .in(in_dec),
    .out(temp_out),
    .s0(s0_dec),
    .s1(s1_dec)
);


demul_4sal DEMUL_4SAL(
    .in(temp_out),
    .s0(s0_dec),
    .s1(s1_dec),
    .out(out_dec)
);


endmodule
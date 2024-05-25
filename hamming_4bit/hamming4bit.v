module hamming4bit(
    input wire [3:0] bdatos,
    output wire [2:0] bpar
);

//Genera los bits de paridad
assign bpar[0] = bdatos[3] & bdatos[2] & bdatos[0];
assign bpar[1] = bdatos[3] & bdatos[1] & bdatos[0];
assign bpar[2] = bdatos[2] & bdatos[1] & bdatos[0];
endmodule;
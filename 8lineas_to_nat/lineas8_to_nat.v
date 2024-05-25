module lineas8_to_nat(
    input wire [6:0] input_8lineas,
    output wire [2:0] nat_out
);


assign nat_out[0] = input_8lineas[4] | input_8lineas[5] | input_8lineas[6] | input_8lineas[7];
assign nat_out[1] = input_8lineas[2] | input_8lineas[3] | input_8lineas[6] | input_8lineas[7];
assign nat_out[2] = input_8lineas[1] | input_8lineas[3] | input_8lineas[5] | input_8lineas[7];   
 
endmodule;
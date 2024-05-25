module hamming4bit_decoder(
    input wire[6:0] msg,
    output wire [2:0] error
);

assign error[0] = msg[6] & msg[5] & msg[2] & msg[0]; 
assign error[1] = msg[6] & msg[4] & msg[2] & msg[1];
assign error[2] = msg[5] & msg[4] & msg[2] & msg[3];

endmodule;
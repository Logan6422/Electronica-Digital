module bcd_to_dec(
    input wire bcd0,bcd1,bcd2,bcd3,
    output reg [3:0] dec_out
);

always @(*) begin
    dec_out = (1*bcd0) +(2*bcd1)+(4*bcd2)+(8*bcd3);
end

 
endmodule;
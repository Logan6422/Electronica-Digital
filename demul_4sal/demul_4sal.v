module demul_4sal(
    input wire in,s0,s1,
    output reg [3:0] out
);


always @(*) begin
    if(~s0 & ~s1)
        out[0] = 1'b1;
    else if(~s0 & s1)
        out[1] = 1'b1;
    else if(s0 & ~s1)
        out[2] = 1'b1;
    else
        out[3] = 1'b1;
end
endmodule
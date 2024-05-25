module mul_4ent(
    input wire[3:0] in,
    output reg out,
    input wire s0,s1
);

always @(*) begin
    if(~s0 & ~s1)
        out = in[0];
    else if(~s0 & s1)
        out = in[1];
    else if(s0 & ~s1)
        out = in[2];
    else
        out = in[3];
end

endmodule
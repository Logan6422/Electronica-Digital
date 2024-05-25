module bmat_to_gray(
    input wire[3:0] bnat,
    output reg[3:0] gray
);

always @(*) begin
    case (bnat)
        0: gray = 4'b0000;
        1: gray = 4'b0001;
        2: gray = 4'b0011;
        3: gray = 4'b0010;
        4: gray = 4'b0110;
        5: gray = 4'b0111;
        6: gray = 4'b0101;
        7: gray = 4'b1000;
        8: gray = 4'b1100; 
        default: gray = 4'b0000;
    endcase
end

endmodule;
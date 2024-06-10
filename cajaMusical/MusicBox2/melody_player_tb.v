`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module melody_player_tb();
    parameter DURATION = 1000;

    reg clk = 0;
    always #1 clk = ~clk;

    wire speaker;

    melody_player UUT (
        .clk(clk),
        .speaker(speaker)
    );

    initial begin
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, melody_player_tb);

        #(DURATION) $display("End of simulation");
        $finish;
    end    
endmodule

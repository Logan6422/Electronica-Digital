module melody_player(
    input wire clk,
    output wire speaker
);
    reg [2:0] note = 0;
    reg [31:0] note_duration = 0;
    reg [31:0] counter = 0;
    wire square_wave;

    signal_generator sg (
        .clk(clk),
        .note(note),
        .square_wave(square_wave)
    );

    assign speaker = square_wave;

    always @(posedge clk) begin
        if (counter >= note_duration) begin
            counter <= 0;
            case (note)
                0: begin note <= 1; note_duration <= 12000000; end // Do
                1: begin note <= 2; note_duration <= 12000000; end // Re
                2: begin note <= 3; note_duration <= 12000000; end // Mi
                3: begin note <= 4; note_duration <= 12000000; end // Fa
                4: begin note <= 5; note_duration <= 12000000; end // Sol
                5: begin note <= 6; note_duration <= 12000000; end // La
                6: begin note <= 7; note_duration <= 12000000; end // Si
                7: begin note <= 0; note_duration <= 12000000; end // +Do
                default: begin note <= 0; note_duration <= 12000000; end // Default to Do
            endcase
        end else begin
            counter <= counter + 1;
        end
    end
endmodule


/// Módulo de Generación de Señales Cuadradas
module signal_generator(
    input wire clk,
    input wire [2:0] note,
    output reg square_wave
);
    reg [31:0] counter = 0;
    reg [31:0] threshold;

    always @(*) begin
        case (note)
            3'd0: threshold = 12000000 / 261.63 / 2; // Do
            3'd1: threshold = 12000000 / 293.66 / 2; // Re
            3'd2: threshold = 12000000 / 329.63 / 2; // Mi
            3'd3: threshold = 12000000 / 349.23 / 2; // Fa
            3'd4: threshold = 12000000 / 392.00 / 2; // Sol
            3'd5: threshold = 12000000 / 440.00 / 2; // La
            3'd6: threshold = 12000000 / 493.88 / 2; // Si
            3'd7: threshold = 12000000 / 523.25 / 2; // +Do
            default: threshold = 12000000 / 261.63 / 2; // Default to Do
        endcase
    end

    always @(posedge clk) begin
        if (counter >= threshold) begin
            counter <= 0;
            square_wave <= ~square_wave;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule

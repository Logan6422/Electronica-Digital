module music_box(
    input wire clk, // Clock de 12MHz
    output reg speaker // Salida del parlante
);

// Frecuencia de las notas en base a 12MHz

parameter NOTE_DO_P = 22933;
parameter NOTE_DO = 47866;
parameter NOTE_RE = 40863;
parameter NOTE_MI = 36404;
parameter NOTE_FA = 34391;
parameter NOTE_SOL = 30612;
parameter NOTE_LA = 27272;
parameter NOTE_SI = 24297;
parameter NOTE_LA_S = 25742;

// Array de notas
reg [14:0] melody [0:24];

initial begin 
    melody[0] = NOTE_DO;
    melody[1] = NOTE_DO;
    melody[2] = NOTE_RE;
    melody[3] = NOTE_DO;
    melody[4] = NOTE_FA;
    melody[5] = NOTE_MI;

    // Las notas restantes se han omitido por brevedad...
end

reg [4:0] note_index = 5'd0; // Índice de la nota actual

reg [14:0] counter = 15'd0;
reg [14:0] divisor;

initial begin
    speaker = 1'b0; // Establecer speaker en 0 inicialmente
end

always @(posedge clk) begin
    divisor <= melody[note_index];
    if (counter >= divisor) begin
        counter <= 15'd0;
        speaker <= ~speaker;
    end else begin
        counter <= counter + 1'b1;
    end

    // Cambiar de nota después de un tiempo (1 segundo)
    if (counter == 12_000_000) begin
        note_index <= note_index + 1;
        if (note_index == 24) begin
            note_index <= 5'd0;
        end
    end
end

endmodule

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module music_box_tb();
    parameter DURATION = 24 * 12_000_000; // Duración de la simulación suficiente para recorrer toda la melodía

    reg clk = 0;
    reg speaker = 1'b0; // Establecer speaker en 0 inicialmente
    wire speaker_out; // Salida del parlante del módulo bajo prueba

    // Reloj de 12MHz para reflejar la frecuencia de la FPGA
    always #5 clk = ~clk; // Cambio de valor del reloj cada 5 unidades de tiempo (aproximadamente 12MHz)

    music_box UUT (
        .clk(clk),
        .speaker(speaker_out)
    );

    initial begin
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, music_box_tb);

        // Simulación
        #10; // Esperar un poco antes de comenzar
        // Cambiar el valor de speaker después de un pequeño retardo para garantizar que se detecten cambios en GTKWave
        #10 speaker = ~speaker;

        // Esperar hasta que la simulación termine
        #(DURATION) $finish;
    end    
endmodule


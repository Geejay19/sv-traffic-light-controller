/*
Name: JAGB Jayasekara
SKF Number: SKF2400233
Email: geethika.j19@gmail.com
*/


module down_counter #(
    parameter int N = 10 // Default count value if not specified
)(
    input logic clk,       // Clock signal
    input logic rstn,      // Active-low reset
    output logic done,     // Output goes high when count reaches 0
    output logic [$clog2(N):0] count  // Current count value
);

    // Sequential logic for the down counter with auto-reset
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            count <= N;
            done <= 0;
        end
        else if (count == 0) begin
            count <= N;  // Restart from N once it reaches 0
            done <= 1;
        end
        else begin
            count <= count - 1;
            done <= 0;
        end
    end

endmodule
`timescale 1ns/1ps
module data_feeder(
    input  logic        clk, 
    input  logic [55:0] data_in,   // 7 × 8 bits
    input  logic        enable,
    input  logic        reset,
    output logic [7:0]  data_out
);

    logic [55:0] shift_reg;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= data_in;  // Load all 56 bits
        end else if (enable) begin
            shift_reg <= shift_reg << 8;  // Shift left by 8 bits each enable
        end
    end

    assign data_out = shift_reg[55:48];  // Always output highest 8 bits

endmodule

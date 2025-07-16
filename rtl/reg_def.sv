module reg_def #(
    parameter int WIDTH = 8 // Default to 8 bits
)(
    input  logic [WIDTH-1:0] x,
    input  logic             enable,
    input  logic             clk,
    input  logic             clear,
    output logic [WIDTH-1:0] y
);
    always_ff @(posedge clk) begin
        if (clear) begin
            y <= {WIDTH{1'b0}}; // Reset to all zeros
        end else if (enable) begin
            y <= x;  // Register update logic
        end
    end
endmodule



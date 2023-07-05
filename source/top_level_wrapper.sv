`default_nettype none
module top_level_wrapper (
    // HW
    input logic clk, nrst,
    
    // Wrapper
    input logic ncs, // Chip Select (Active Low)
    input logic [33:0] gpio_in, // Breakout Board Pins
    output logic [33:0] gpio_out, // Breakout Board Pins
    output logic [33:0] gpio_oe // Active Low Output Enable
);

    logic block_reset, block_reset_int, gated_reset;
    assign gated_reset = ~ncs & nrst;

    // Reset Synchronizer
    always_ff @ (posedge clk, negedge gated_reset) begin : RESET_SYNCHRONIZER
        block_reset_int <= 1'b1;
        block_reset <= block_reset_int;
    end

    design_module_name inst_name ();

endmodule
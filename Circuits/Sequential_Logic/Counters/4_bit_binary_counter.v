// Build a 4-bit binary counter that counts from 0 through 15, inclusive, with a period of 16. 
// The reset input is synchronous, and should reset the counter to 0.

module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q);
    
    always @ (posedge clk)
    begin
        if (reset) begin
            q <= 4'b0000;
        end else begin
            q <= (q == 4'd15) ? 0 : q + 1'b1;
        end
    end


endmodule

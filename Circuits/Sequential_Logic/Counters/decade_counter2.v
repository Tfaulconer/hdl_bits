// Make a decade counter that counts 1 through 10, inclusive. 
// The reset input is synchronous, and should reset the counter to 1.

module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q);

    always @ (posedge clk)
    begin
        if (reset) begin
            q <= 4'b0001;
        end else begin
            q <= (q == 4'd10) ? 1 : q + 1'b1;
        end
    end


endmodule

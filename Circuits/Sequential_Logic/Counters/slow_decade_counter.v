// Build a decade counter that counts from 0 through 9, inclusive, with a period of 10. 
// The reset input is synchronous, and should reset the counter to 0. 
// We want to be able to pause the counter rather than always incrementing every clock cycle, 
// so the slowena input indicates when the counter should

module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always @ (posedge clk)
    begin
        if (reset) begin
            q <= 4'b0000;
        end else if (slowena) begin
            q <= (q == 4'd9) ? 0 : q + 1'b1;
        end else begin
            q <= q;
        end
    end
    
endmodule

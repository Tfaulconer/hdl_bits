module top_module (
    input clk,
    input resetn,   // synchronous reset, active-low
    input in,
    output out);
    
    reg [3:0] q;
    
    assign out = q[0];
    
    always @ (posedge clk)
    begin
        if (!resetn) begin
            q <= 4'b0;
        end else begin
            q <= {in, q[3:1]};
        end
    end


endmodule

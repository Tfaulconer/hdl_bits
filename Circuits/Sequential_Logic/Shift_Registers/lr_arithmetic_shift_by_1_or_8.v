/*
Build a 64-bit arithmetic shift register, with synchronous load. 
The shifter can shift both left and right, and by 1 or 8 bit positions, selected by amount.

An arithmetic right shift shifts in the sign bit of the number in the shift register (q[63] in this case) 
		instead of zero as done by a logical right shift. 
Another way of thinking about an arithmetic right shift is that it assumes the number being shifted is signed 
		and preserves the sign, so that arithmetic right shift divides a signed number by a power of two.
*/
module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    always @ (posedge clk) 
    begin
        if (load) begin
            q <= data;
        end else if (ena) begin
            case(amount)
                // arithmetic shift left by 1 bit
                2'b00: q <= {q[62:0], 1'b0}; 
                   
                // arithmetic shift left by 8 bits
                2'b01: q <= {q[55:0], 8'b0}; 
                  
                // arithmetic shift right by 1 bit
                2'b10: q <= {q[63], q[63:1]}; 
                    
                // arithmetic shift right by 8 bits
                2'b11: q <= {q[63], {8{q[63]}}, q[62:8]};
           endcase
       end else begin
           q <= q;
       end
   end    
    
endmodule

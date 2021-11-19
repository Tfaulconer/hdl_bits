/*
Scancode [15:0]	    Arrow key
  16'he06b	        left arrow
  16'he072	        down arrow
  16'he074	        right arrow
  16'he075          up arrow
  Anything else	    none


To avoid creating latches, all outputs must be assigned a value in all possible conditions. 
Simply having a default case is not enough. You must assign a value to all four outputs in all four cases 
and the default case. This can involve a lot of unnecessary typing. 
One easy way around this is to assign a "default value" to the outputs before the case statement

*/
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    
    always @ (*)
    begin
        up    = 1'b0;
        down  = 1'b0;
        left  = 1'b0;
        right = 1'b0;
        casez(scancode)
            16'he06b: left  = 1'b1;
            16'he072: down  = 1'b1;
            16'he074: right = 1'b1;
            16'he075: up    = 1'b1;
        endcase
    end
            

endmodule


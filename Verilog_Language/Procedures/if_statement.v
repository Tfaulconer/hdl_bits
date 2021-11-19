/*
sel_b1	sel_b2	out_assign
                out_always
0	      0	         a
0	      1	         a
1	      0	         a
1	      1          b
*/
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    
    assign out_assign = (sel_b1 & sel_b2) ? b : a;
    
    always @ (*) 
    begin
        if (sel_b1 & sel_b2) begin
            out_always = b;
        end else begin
            out_always = a;
        end
    end
        

endmodule


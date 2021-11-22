
/*
Use the conditional operator to make two-way min circuits, then compose a few of them to create a 4-way min circuit.
*/

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    
    wire [7:0] a_b_intermediate;
    wire [7:0] c_d_intermediate;
    
    assign a_b_intermediate = (a < b) ? a : b;
    assign c_d_intermediate = (c < d) ? c : d;
    assign min 				= (a_b_intermediate < c_d_intermediate) ? a_b_intermediate : c_d_intermediate;

endmodule


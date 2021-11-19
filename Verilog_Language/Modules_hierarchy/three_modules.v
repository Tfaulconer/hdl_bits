/*
You are given a module my_dff with two inputs and one output (that implements a D flip-flop). Instantiate three of them, then chain them together to make a shift register of length 3. 
The clk port needs to be connected to all instances.
*/

module top_module ( input clk, input d, output q );
    
    wire q_to_d_1_2;
    wire q_to_d_2_3;
    
    my_dff inst1 (.clk(clk), .d(d), .q(q_to_d_1_2));
    my_dff inst2 (.clk(clk), .d(q_to_d_1_2), .q(q_to_d_2_3));
    my_dff inst3 (.clk(clk), .d(q_to_d_2_3), .q(q));
    

endmodule



module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
   
    wire lower_to_upper;
    
    add16 lower16 (.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(lower_to_upper));
    add16 upper16 (.a(a[31:16]), .b(b[31:16]), .cin(lower_to_upper), .sum(sum[31:16]), .cout(/* OPEN */));
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign {cout, sum} = a + b + cin; 

endmodule


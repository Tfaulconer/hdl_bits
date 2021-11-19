module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire lower_to_upper;
    
    add16 lower_16 (.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(lower_to_upper), .sum(sum[15:0]));
    add16 upper_16 (.a(a[31:16]), .b(b[31:16]), .cin(lower_to_upper), .cout(/* OPEN */), .sum(sum[31:16]));
    
endmodule



module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire lower_to_upper;
    wire [31:0] b_xor_sub;
    
    always @ (*)
    begin
        b_xor_sub = b ^ {32{sub}};
    end
    
    add16 lower16 (.a(a[15:0]), .b(b_xor_sub[15:0]), .cin(sub), .sum(sum[15:0]), .cout(lower_to_upper));
    add16 upper16 (.a(a[31:16]), .b(b_xor_sub[31:16]), .cin(lower_to_upper), .sum(sum[31:16]), .cout(/* OPEN */));
    
endmodule


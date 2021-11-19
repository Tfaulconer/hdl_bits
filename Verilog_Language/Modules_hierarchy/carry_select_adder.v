module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire cout_select;
    
    add16 lower16 (.a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cin(0), .cout(cout_select) );
    
    wire [15:0] sum_cin0;
    wire [15:0] sum_cin1;
    
    add16 upper16_0 (.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sum_cin0), .cout(/* OPEN */) );
    add16 upper16_1 (.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(sum_cin1), .cout(/* OPEN */) ); 
    
    
    always @ (*)
    begin
       case(cout_select)
           1'b0: sum[31:16] = sum_cin0;
           1'b1: sum[31:16] = sum_cin1;
       endcase
    end

endmodule


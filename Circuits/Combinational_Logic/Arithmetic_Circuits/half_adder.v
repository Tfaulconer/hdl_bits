// Create a half adder. A half adder adds two bits (with no carry-in) and produces a sum and carry-out.

// Half adder truth table
// two-bit input | sum  c_out
// -----------------------------
//    0     0    |  0     0
//    0     1    |  1     0
//    1     0    |  1     0
//    1     1    |  0     1
// sum is just a XOR gate
// c_out is an AND gate

module top_module( 
    input a, b,
    output cout, sum );
    
    assign sum = a ^ b;
    assign cout = a & b;

endmodule

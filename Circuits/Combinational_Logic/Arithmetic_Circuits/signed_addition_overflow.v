// Assume that you have two 8-bit 2's complement numbers, a[7:0] and b[7:0]. These numbers are added to produce s[7:0]. 
// Also compute whether a (signed) overflow has occurred.


// We know that a signed overflow occurs when adding two POSITIVE numbers produces a negative result, or
// adding two NEGATIVE numbers produces a positive result

// ALTERNATIVE WAY:
// If I had instantiated a full-adder I probably would have calculated overflow by
// taking the carry-out of the b[6] adder and XOR'ing the carry-out of the b[7] adder

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    assign s = a + b;
    
    // POSITIVE case: overflow occurs when a[7] = 0, b[7] = 0 and s[7] = 1
    //    That is to say: (s[7] & ~a[7] & b[7])
    
    // NEGATIVE case: overflow occurs when a[7] = 1, b[7] = 1 and s[7] = 0
    //    That is to say: (~s[7] & a[7] & b[7])
    assign overflow = ( ~s[7] & a[7] & b[7] ) | ( s[7] & (~a[7]) & (~b[7]) );


endmodule

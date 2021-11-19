
/*
when given an input bit vector, outputs the position of the first 1 bit in the vector.
For example, an 8-bit priority encoder given the input 8'b10010000 would output 3'd4,
because bit[4] is first bit that is high.

Build a 4-bit priority encoder. For this problem, if none of the input bits are high (i.e., input is zero),
output zero. Note that a 4-bit number has 16 possible combinations
*/

// Easy way using "casez"
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always @ (*)
    begin
        casez(in) 
            4'b0000: pos = 0;
            4'bzzz1: pos = 0;
            4'bzz1z: pos = 1;
            4'bz1zz: pos = 2;
            4'b1zzz: pos = 3;
            default: pos = 0;
        endcase
    end
endmodule

// HARDER WAY
/*
when given an input bit vector, outputs the position of the first 1 bit in the vector.
For example, an 8-bit priority encoder given the input 8'b10010000 would output 3'd4,
because bit[4] is first bit that is high.

Build a 4-bit priority encoder. For this problem, if none of the input bits are high (i.e., input is zero),
output zero. Note that a 4-bit number has 16 possible combinations

module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always @ (*)
    begin
        case(in)
            4'b0000: pos = 0;
            4'b0001: pos = 0;
            4'b0010: pos = 1;
            4'b0011: pos = 0;
            4'b0100: pos = 2;
            4'b0101: pos = 0;
            4'b0110: pos = 1;
            4'b0111: pos = 0;
            4'b1000: pos = 3;
            4'b1001: pos = 0;
            4'b1010: pos = 1;
            4'b1011: pos = 0;
            4'b1100: pos = 2;
            4'b1101: pos = 0;
            4'b1110: pos = 1;
            4'b1111: pos = 0;
            default: pos = 0;
        endcase
    end
endmodule
*/


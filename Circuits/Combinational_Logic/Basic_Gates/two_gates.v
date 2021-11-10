// In1 and In2 into an XNOR
// Output of XNOR xor'd with in3 gives output

module top_module (
    input in1,
    input in2,
    input in3,
    output out);

    assign out = !(in1 ^ in2) ^ in3;
    
endmodule

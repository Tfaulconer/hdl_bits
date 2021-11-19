
/* 
Sequence 111110 -> Discard
Sequence 1111110 -> Flag (correct SOF)
Sequence 1111111+...0 -> Error (error should be held high as long as 1's are coming in)

*/

module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    typedef enum {
        ZERO,
        ONE,
        TWO,
        THREE,
        FOUR,
        FIVE,
        SIX,
        DISCARD,
        FLAG,
        ERROR
    } e_state;
    
    e_state state, next = ZERO;
        
    always @ (*)
    begin
        case(state)
            ZERO: 	 next = (in) ? ONE 		: ZERO;
            ONE: 	 next = (in) ? TWO 		: ZERO;
            TWO: 	 next = (in) ? THREE 	: ZERO;
            THREE:	 next = (in) ? FOUR 	: ZERO;
            FOUR:	 next = (in) ? FIVE 	: ZERO;
            FIVE:    next = (in) ? SIX 		: DISCARD;
            SIX:     next = (in) ? ERROR 	: FLAG;
            DISCARD: next = (in) ? ONE 		: ZERO;
            FLAG:    next = (in) ? ONE 		: ZERO;
            ERROR:   next = (in) ? ERROR 	: ZERO;
        endcase
    end
       
    always @ (posedge clk)
    begin
        if (reset) begin
            state <= ZERO;
        end else begin
            state <= next;
        end
    end
    
    assign disc = (state == DISCARD);
    assign flag = (state == FLAG);
    assign err  = (state == ERROR);
    
endmodule


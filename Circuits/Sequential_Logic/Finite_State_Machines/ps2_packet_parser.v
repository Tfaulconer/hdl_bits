
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    // State declaration
    typedef enum {
        IDLE,
        READ,
        DONE
    } e_state;    
    e_state state;
    e_state next_state;
    
    integer byte_count;
    
    // State transition logic (combinational)
    always@(*)
    begin
        case(state)
            IDLE: next_state = (in[3]) ? READ : IDLE;
            READ: next_state = (byte_count == 3) ? DONE : READ;
            DONE: next_state = (in[3]) ? READ : IDLE;
        endcase
    end        
                
    // State flip-flops (sequential)
    always @ (posedge clk)
    begin
        if (reset) begin
            state <= IDLE;
            byte_count <= 1;
        end else begin
            state <= next_state;
            if (next_state == READ) begin
                byte_count <= byte_count + 1;
            end else if (next_state == DONE) begin
                byte_count <= 1;
            end
        end
    end
    // Output logic
    assign done = (state == DONE); 

endmodule


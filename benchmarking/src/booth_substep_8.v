module booth_substep (
    // In signals
    input wire signed [7:0] acc,          // current value of accumulator
    input wire signed [7:0] Q,            // current value of Q (initially the multiplier)
    input wire signed q0,                 // current value of q-1 th bit
    input wire signed [7:0] B, // the multiplicand
    
    // Out signals
    output reg signed [7:0] next_acc,     // next accumulator value || value of 8 MSB's of 16 bit output [15:8]
    output reg signed [7:0] next_Q,       // next value of Q || value of 8 LSB's of 16 bit output [7:0]
    output reg q0_next                    // next value of q-1 th bit
);

    wire [7:0] addsub_temp;

    eight_bit_adder_subtractor myadd (
        .cin(Q[0]),
        .i0(acc),
        .i1(B),
        .sum(addsub_temp)
    ); // Module

    always @(*) begin    
        if (Q[0] == q0) begin
            q0_next = Q[0];
            next_Q = Q >> 1;
            next_Q[7] = acc[0];
            // right shift
            next_acc = acc >> 1;
            // with sign extension
            if (acc[7] == 1)
                next_acc[7] = 1;
        end else begin  // if Q[0] != q0 (that is, q-1 bit)
            q0_next = Q[0];
            next_Q = Q >> 1;
            next_Q[7] = addsub_temp[0];
            // right shift
            next_acc = addsub_temp >> 1;
            // with sign extension
            if (addsub_temp[7] == 1)
                next_acc[7] = 1;
        end            
    end
endmodule 
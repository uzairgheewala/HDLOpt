module booth_substep #(parameter N = 8) (
    input wire signed [N-1:0] acc,       // current value of accumulator
    input wire signed [N-1:0] Q,         // current value of Q (initially the multiplier)
    input wire q0,                       // current value of q-1 th bit
    input wire signed [N-1:0] B,         // the multiplicand

    output reg signed [N-1:0] next_acc,  // next accumulator value || value of N MSB's of 2N bit output [2N-1:N]
    output reg signed [N-1:0] next_Q,    // next value of Q || value of N LSB's of 2N bit output [N-1:0]
    output reg q0_next                   // next value of q-1 th bit
);

    wire [N-1:0] addsub_temp;

    adder_subtractor #(N) myadd (
        .cin(Q[0]),
        .i0(acc),
        .i1(B),
        .sum(addsub_temp)
    ); // Module

    always @(*) begin    
        if (Q[0] == q0) begin
            q0_next = Q[0];
            next_Q = Q >> 1;
            next_Q[N-1] = acc[0];
            // right shift
            next_acc = acc >> 1;
            // with sign extension
            if (acc[N-1] == 1)
                next_acc[N-1] = 1;
        end else begin  // if Q[0] != q0 (that is, q-1 bit)
            q0_next = Q[0];
            next_Q = Q >> 1;
            next_Q[N-1] = addsub_temp[0];
            // right shift
            next_acc = addsub_temp >> 1;
            // with sign extension
            if (addsub_temp[N-1] == 1)
                next_acc[N-1] = 1;
        end            
    end
endmodule 
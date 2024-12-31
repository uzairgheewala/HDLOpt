// Carry Save Adder 
module carry_save_adder #(parameter N = 8) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire [N-1:0] c,
    output wire [N:0] result
);
    wire [N-1:0] sum1, carry1;
    wire [N:0] sum2;

    // First stage CSA
    carry_save_adder_l2 #(N) csa1 (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum1),
        .carry(carry1)
    ); // Module

    // Second stage adder using ripple_carry_adder to combine sum1 and carry1
    ripple_carry_adder #(N+1) rca (
        .a({1'b0, sum1}),
        .b({carry1, 1'b0}),
        .cin(1'b0),
        .sum(sum2),
        .cout() // Not used
    ); // Module

    assign result = sum2;
endmodule
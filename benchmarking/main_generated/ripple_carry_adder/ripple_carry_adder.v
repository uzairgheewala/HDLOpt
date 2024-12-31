// Ripple Carry Adder -> N full adders connected by cout to cin
module ripple_carry_adder #(parameter N = 2) (
    input wire [N-1:0] a, 
    input wire [N-1:0] b, 
    input wire cin,
    output wire [N-1:0] sum, 
    output wire cout
);
    wire [N-1:0] carry; // Internal carry signals

    full_adder f0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(carry[0])
    ); // Module

    genvar i;
    generate
        for (i = 1; i < N; i=i+1) begin : gen_adder
            full_adder f (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i-1]),
                .sum(sum[i]),
                .cout(carry[i])
            ); // Module
        end
    endgenerate

    assign cout = carry[N-1];
endmodule
module carry_save_adder_l2 #(parameter N = 8) (
    input wire [N-1:0] a,     // in operand a
    input wire [N-1:0] b,     // in operand b
    input wire [N-1:0] c,     // in operand c
    
    output wire [N-1:0] sum,  // out sum
    output wire [N-1:0] carry // out carry
);

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_adder_gen
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(carry[i])
            ); // Module
        end
    endgenerate
endmodule
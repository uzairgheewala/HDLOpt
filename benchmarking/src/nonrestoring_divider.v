module non_restoring_divider #(parameter N = 2) (
    input wire [N-1:0] Q,   // in operand Q
    input wire [N-1:0] M,   // in operand M
    
    output wire [N-1:0] quo, // out quotient
    output wire [N-1:0] r    // out remainder
);

    wire [N-1:0] r [0:N-1];

    csa_16bit #(N) csa_16bit_inst0 (.M(M), .T({N{1'b0}}), .D(Q[N-1]), .ctrl(1'b1), .Q(quo[N-1]), .R(r[0])); // Module
    generate
        genvar i;
        for (i = 1; i < N; i = i + 1) begin : csa_16bit_gen
            csa_16bit #(N) csa_16bit_inst (
                .M(M),
                .T(r[i-1]),
                .D(Q[N-1-i]),
                .ctrl(quo[N-i]),
                .Q(quo[N-1-i]),
                .R(r[i])
            ); // Module
        end
    endgenerate

    assign r = r[N-1];

endmodule
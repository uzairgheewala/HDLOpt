module carry_skip_block #(parameter WIDTH = 1) (
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    input wire cin,
    output wire [WIDTH-1:0] sum,
    output wire cout,
    output wire block_carry_out
);
    wire [WIDTH-1:0] g, p;
    wire [WIDTH:0] carry;

    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : full_adder_block
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            ); // Module
            assign g[i] = a[i] & b[i];
            assign p[i] = a[i] | b[i];
        end
    endgenerate

    assign block_carry_out = g[WIDTH-1] | (p[WIDTH-1] & carry[WIDTH-1]);
    assign cout = carry[WIDTH];
endmodule
// Manchester Carry Chain Adder / Mirror Adder
module mcc_adder #(parameter N = 1) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire cin,
    output wire [N-1:0] sum,
    output wire cout
);
    wire [N:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_adder_gen
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            ); // Module
        end
    endgenerate

    assign cout = carry[N];
endmodule
// Carry Select Adder 
module carry_select_adder #(parameter N = 1) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire cin,
    output wire [N-1:0] sum,
    output wire cout
);
    wire [N:0] carry0, carry1; // Carry chains for cin=0 and cin=1
    wire [N-1:0] sum0, sum1;   // Sum outs for cin=0 and cin=1

    assign carry0[0] = 0;
    assign carry1[0] = 1;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_adder_gen
            full_adder fa0 (
                .a(a[i]),
                .b(b[i]),
                .cin(carry0[i]),
                .sum(sum0[i]),
                .cout(carry0[i+1])
            ); // Module
            full_adder fa1 (
                .a(a[i]),
                .b(b[i]),
                .cin(carry1[i]),
                .sum(sum1[i]),
                .cout(carry1[i+1])
            ); // Module
        end
    endgenerate

    // Select the correct sum and carry based on cin
    assign sum = cin ? sum1 : sum0;
    assign cout = cin ? carry1[N] : carry0[N];
endmodule
// Carry Look Ahead Adder 
module carry_lookahead_adder #(parameter N = 1) (
    input wire [N-1:0] a, 
    input wire [N-1:0] b, 
    input wire cin,
    output wire [N-1:0] sum, 
    output wire cout
);
    wire [N-1:0] p, g; // Propagate, Generate signals
    wire [N:0] carry; // Carry signals
    assign carry[0] = cin;
    assign p = a ^ b;
    assign g = a & b;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : carry_lookahead_adder_gen
            assign carry[i+1] = g[i] | (p[i] & carry[i]);
            assign sum[i] = p[i] ^ carry[i];
        end
    endgenerate

    assign cout = carry[N];
endmodule
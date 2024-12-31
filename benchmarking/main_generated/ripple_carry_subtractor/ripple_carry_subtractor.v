// Ripple Carry -> N full subtractors connected by cout to cin
module ripple_carry_subtractor #(parameter N = 2) (
    input wire [N-1:0] a, 
    input wire [N-1:0] b, 
    input wire bin,
    output wire [N-1:0] diff, 
    output wire bout
);
    wire [N:0] carry; // Internal carry signals

    assign carry[0] = bin;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_subtractor_gen
            full_subtractor fa (
                .a(a[i]),
                .b(b[i]),
                .bin(carry[i]),
                .diff(diff[i]),
                .bout(carry[i+1])
            ); // Module
        end
    endgenerate

    assign bout = carry[N];
endmodule
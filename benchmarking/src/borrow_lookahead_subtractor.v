module borrow_lookahead_subtractor #(parameter N = 1) (
    input wire [N-1:0] a, 
    input wire [N-1:0] b, 
    input wire bin,
    output wire [N-1:0] diff, 
    output wire bout
);

    wire [N-1:0] g, p; // Generate and propagate signals
    wire [N:0] c;      // Carry (borrow) signals

    assign c[0] = bin;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_subtractor_gen
            assign g[i] = ~a[i] & b[i];
            assign p[i] = ~a[i] | b[i];
            assign c[i+1] = g[i] | (p[i] & c[i]);

            full_subtractor fs (
                .a(a[i]),
                .b(b[i]),
                .bin(c[i]),
                .diff(diff[i]),
                .bout()
            ); // Module
        end
    endgenerate

    assign bout = c[N];
endmodule
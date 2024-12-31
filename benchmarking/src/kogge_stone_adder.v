// Kogge-Stone Adder 
module kogge_stone_adder #(parameter N = 8) (
    output [N-1:0] sum, 
    output cout, 
    input [N-1:0] a, 
    input [N-1:0] b
);
    wire cin = 1'b0;
    wire [N-1:0] c;
    wire [N-1:0] g, p;
    
    square sq [N-1:0] (a, b, g, p); // Module

    // Intermediate wires for each stage
    genvar i, j, k;

    // Lines of circles
    generate
        for (i = 0; i < $clog2(N); i = i + 1) begin : stages
            wire [N-1:0] g_next, p_next;
            
            if (i == 0) begin
                small_circle sc0_0(c[0], g[0]); // Module
                for (j = 1; j < N; j = j + 1) begin : first_line
                    big_circle bc0 (g[j], p[j], g[j-1], p[j-1], g_next[j], p_next[j]); // Module
                end
            end else begin
                localparam STEP = 2 ** i;
                for (j = 0; j < N; j = j + STEP) begin : small_circles
                    for (k = 0; k < STEP && (j + k) < N; k = k + 1) begin : small_circle_loop
                        small_circle sc(c[j + k], g[j + k]); // Module
                    end
                end
                for (j = STEP; j < N; j = j + STEP) begin : big_circles
                    if (j + STEP - 1 < N) begin
                        big_circle bc(g[j], p[j], g[j-STEP], p[j-STEP], g_next[j], p_next[j]); // Module
                    end
                end
            end
        end
    endgenerate

    // Last line - triangles
    triangle tr0(p[0], cin, sum[0]); // Module
    generate
        for (i = 1; i < N; i = i + 1) begin : triangles
            triangle tr(p[i], c[i-1], sum[i]); // Module
        end
    endgenerate

    // Generate cout
    buf #(1) (cout, c[N-1]);

endmodule
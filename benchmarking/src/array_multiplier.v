module array_multiplier #(parameter N = 1) (
    input wire [N-1:0] A,     // in operand A
    input wire [N-1:0] B,     // in operand B
    output wire [(N == 1 ? 0 : 2*N-1):0] P    // out product P
);

    wire [N-1:0] pp [N-1:0];    // Matrix of partial products
    wire [(N * (N - 1))-1:0] c;   // Carries
    wire [(N * (N - 1))-1:0] s;   // Sums
    reg num_layers = N - 1;

    //2 bit: 2S, 2C
    //3 bit: 6C, 6S
    //4 bit: 12C, 12S
    //Therefore size of s = size of c = N (N-1)

    // p[i][j] = Ai Bj
    // N bit multiplication requires N^2 AND gates, N half adders, N(N-2) Full adders
    // Layer formatting:
    // No. Layers = N - 1
    // 1. HA, N - 2 FA, HA
    // 2. HA, N - 1 FA
    // 3. HA, N - 1 FA ... for subsequent layers
    // P[0] = p[0][0]
    // P[1:2*N-2] = s
    // P[2*N - 1] = c[(N * (N - 1))-1]

    // Generate partial products
    genvar p, q;
    generate
        for (p = 0; p < N; p = p + 1) begin: pp_gen
            for (q = 0; q < N; q = q + 1) begin: bit_gen
                assign pp[p][q] = A[p] & B[q];
            end
        end
    endgenerate

    // Subsequent layers
    genvar i, j;
    generate
        for (i = 0; i < N - 1; i = i + 1) begin : gen_adders
            if (i == 0) begin
                half_adder ha0 (
                    .a(pp[0][1]),
                    .b(pp[1][0]),
                    .sum(s[0]),
                    .cout(c[0])
                ); // Module

                for (j = 0; j < N - 2; j = j + 1) begin : gen_full_adders
                    full_adder fa0 (
                        .a(pp[2+j][0]),
                        .b(pp[j+1][1]),
                        .cin(c[j]),
                        .sum(s[j+1]),
                        .cout(c[j+1])
                    ); // Module
                end

                half_adder ha1 (
                    .a(pp[N-1][1]),
                    .b(c[N-2]),
                    .sum(s[N-1]),
                    .cout(c[N-1])
                ); // Module

            end else begin
                half_adder ha (
                    .a(pp[0][i+1]),
                    .b(s[((i-1) * N) + 1]),
                    .sum(s[N * i]),
                    .cout(c[N * i])
                ); // Module

                for (j = 1; j <= N - 2; j = j + 1) begin : gen_full_adders
                    full_adder fan (
                        .a(s[(N * i) - (N-1-j)]),
                        .b(pp[j][i+1]),
                        .cin(c[(N * i) + j-1]),
                        .sum(s[(N * i) + j]),
                        .cout(c[(N * i) + j])
                    ); // Module
                end

                full_adder fa (
                    .a(pp[N-1][i+1]),
                    .b(c[(N * i) - 1]),
                    .cin(c[(N * i) + (N-2)]),
                    .sum(s[(N * (i + 1)) - 1]),
                    .cout(c[(N * (i + 1)) - 1])
                ); // Module
            end
        end
    endgenerate

    // Handle final summation
    assign P[0] = pp[0][0];

    genvar idx, l;
    generate
        if (N > 1) begin
            for (idx = 0; idx < (N * (N - 1)); idx = idx + N) begin : gen_s_assign
                assign P[idx/N + 1] = s[idx];
            end
            
            // Assign the remaining values of s
            assign P[2*N-2:N] = s[(N * (N - 1))-1:((N * (N - 1)) - N + 1)];
            assign P[2*N - 1] = c[(N * (N - 1))-1];
        end
    endgenerate

endmodule
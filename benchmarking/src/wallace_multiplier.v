`default_nettype none
`timescale 1ns/1ps

module wallaceTreeMultiplier #(parameter N = 8) (
    output [(2*N)-1:0] result,
    input [N-1:0] a,
    input [N-1:0] b
);
    // 2D array for partial products
    reg [N-1:0] partialProducts [N-1:0];
    integer i, j;

    always @(a, b) begin
        // Generate all partial products using AND gates
        for (i = 0; i < N; i = i + 1) begin
            for (j = 0; j < N; j = j + 1) begin
                partialProducts[i][j] = a[i] & b[j];
            end
        end
    end

    // Wires for sums and carries
    wire [(N-1)*(N-1)-1:0] sum;
    wire [(N-1)*(N-1)-1:0] carry;

    // Generate block to create full adders and half adders for Wallace Tree reduction
    generate
        genvar x, y;
        for (x = 0; x < N-1; x = x + 1) begin
            for (y = 0; y < N-1; y = y + 1) begin
                if (x == 0) begin
                    half_adder ha1(.sum(sum[y]), .cout(carry[y]), .a(partialProducts[0][y+1]), .b(partialProducts[1][y]));
                end else begin
                    full_adder fa1(.sum(sum[x*N+y]), .cout(carry[x*N+y]), .a(partialProducts[x][y+1]), .b(partialProducts[x+1][y]), .cin(carry[(x-1)*N+y]));
                end
            end
        end
    endgenerate

    // Assign the final result
    assign result[0] = partialProducts[0][0];  // First bit is the result of a[0] & b[0]

    // Handle the rest of the result bits
    assign result[1] = sum[0];  // Second bit from the first half-adder

    genvar idx;
    // Carry propagate through the remaining bits
    generate
        for (idx = 2; idx < N; idx = idx + 1) begin
            assign result[idx] = sum[idx-1] ^ carry[idx-2];  // Sum XOR Carry for each bit
        end
    endgenerate

    // Assign the remaining bits for higher results
    assign result[N] = carry[N-2];  // Final carry from last stage

    // Generate remaining result bits from sums and carries
    generate
        for (idx = N+1; idx < 2*N; idx = idx + 1) begin
            assign result[idx] = sum[idx-N] ^ carry[idx-N-1];
        end
    endgenerate

endmodule
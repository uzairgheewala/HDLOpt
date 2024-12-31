// Carry Skip Adder / Carry Bypass Adder
module carry_skip_adder #(parameter N = 8, parameter BLOCK_SIZE = 4) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire cin,
    output wire [N-1:0] sum,
    output wire cout
);
    localparam NUM_BLOCKS = (N + BLOCK_SIZE - 1) / BLOCK_SIZE;

    wire [NUM_BLOCKS-1:0] block_carry;
    wire [NUM_BLOCKS-1:0] block_skip_carry;

    ripple_carry_adder #(BLOCK_SIZE) rca (
        .a(a[BLOCK_SIZE-1:0]),
        .b(b[BLOCK_SIZE-1:0]),
        .cin(cin),
        .sum(sum[BLOCK_SIZE-1:0]),
        .cout(block_carry[0])
    ); // Module
    skip_logic #(BLOCK_SIZE) skip_logic (
        .cin_next(block_skip_carry[0]),
        .a(a[BLOCK_SIZE-1:0]),
        .b(b[BLOCK_SIZE-1:0]),
        .cin(cin),
        .cout(block_carry[0])
    ); // Module

    genvar i;
    generate
        for (i = 1; i < NUM_BLOCKS; i=i+1) begin : gen_blocks
            ripple_carry_adder #(BLOCK_SIZE) rca (
                .a(a[(i+1)*BLOCK_SIZE-1:i*BLOCK_SIZE]),
                .b(b[(i+1)*BLOCK_SIZE-1:i*BLOCK_SIZE]),
                .cin(block_skip_carry[i-1]),
                .sum(sum[(i+1)*BLOCK_SIZE-1:i*BLOCK_SIZE]),
                .cout(block_carry[i])
            ); // Module
            skip_logic #(BLOCK_SIZE) skip_logic (
                .cin_next(block_skip_carry[i]),
                .a(a[(i+1)*BLOCK_SIZE-1:i*BLOCK_SIZE]),
                .b(b[(i+1)*BLOCK_SIZE-1:i*BLOCK_SIZE]),
                .cin(block_skip_carry[i-1]),
                .cout(block_carry[i])
            ); // Module
        end
    endgenerate

    assign cout = block_skip_carry[NUM_BLOCKS-1];
endmodule
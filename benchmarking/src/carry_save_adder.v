// Carry Save Adder 
module carry_save_adder #(parameter N = 8) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire [N-1:0] c,
    output wire [N-1:0] sum,
    output wire [N-1:0] carry
);
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_adder_gen
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate
endmodule

module top_level_adder #(parameter N = 8) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire [N-1:0] c,
    output wire [N:0] result
);
    wire [N-1:0] sum1, carry1;
    wire [N:0] sum2;

    // First stage CSA
    carry_save_adder #(N) csa1 (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum1),
        .carry(carry1)
    );

    // Second stage adder (Ripple Carry Adder) to combine sum1 and carry1
    assign sum2 = {1'b0, sum1} + {carry1, 1'b0};

    assign result = sum2;
endmodule

// Testbench
/*
module carry_save_adder_tb;
    parameter N = 8;  // Test with 8-bit CSA
    reg [N-1:0] a;
    reg [N-1:0] b;
    reg [N-1:0] c;
    wire [N:0] result;

    // Instantiate the top-level adder
    top_level_adder #(N) uut (
        .a(a),
        .b(b),
        .c(c),
        .result(result)
    );

    initial begin
        // Initialize inputs
        a = 0; b = 0; c = 0;

        // Apply test vectors
        #10 a = 8'h01; b = 8'h02; c = 8'h03; // 1 + 2 + 3 = 6 -> 06
        #10 a = 8'hFF; b = 8'h01; c = 8'h01; // 255 + 1 + 1 = 257 -> 101
        #10 a = 8'hAA; b = 8'h55; c = 8'h33; // 170 + 85 + 51 = 306 -> 132
        #10 a = 8'h12; b = 8'h34; c = 8'h56; // 18 + 52 + 86 = 156 -> 9C

        // End simulation
        #10 $finish;
    end

    initial begin
        // Monitor the signals
        $monitor("At time %t, a = %h, b = %h, c = %h, result = %h",
                 $time, a, b, c, result);
    end
endmodule
*/
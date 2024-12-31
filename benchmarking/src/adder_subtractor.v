module adder_subtractor #(parameter N = 1) (
    input wire cin,                       // carry-in 1 means subtract, 0 means add
    input wire [N-1:0] i0,         // in operand i0
    input wire [N-1:0] i1,         // in operand i1

    output wire [N-1:0] sum        // put result sum
);

    wire [N:0] carry;
    assign carry[0] = cin;
    wire [N-1:0] int_ip;           // intermediate value processed from i1

    // Generate the XOR gates to determine whether to add or subtract
    genvar j;
    generate
        for (j = 0; j < N; j = j + 1) begin: xor_gen
            xor2 x (
                .i0(i1[j]), 
                .i1(cin), 
                .o(int_ip[j])
            ); // XOR gates for 1's complement if cin is 1
        end
    endgenerate

    // Generate the full adders
    generate
        for (j = 0; j < N; j = j + 1) begin: fa_gen
            full_adder fa (
                .a(i0[j]), 
                .b(int_ip[j]), 
                .cin(carry[j]), 
                .sum(sum[j]), 
                .cout(carry[j+1])
            ); // Module
        end
    endgenerate
endmodule
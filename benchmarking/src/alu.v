module alu #(parameter N = 2) (
    input [N-1:0] A, B,  // Operands
    input [3:0] opcode,      // Operation code
    input [2:0] sel,         // Selection signal for adder, subtractor, multiplier, etc.
    output reg [N-1:0] result, // Result
    output reg [2*N-1:0] mult_result, // Result
    output reg zero, carry, overflow, sign // Flags
);

    wire [N-1:0] adder_out, subtractor_out, shifter_out; // divider_out
    wire [2*N-1:0] multiplier_out;

    // Opcode decoding and result selection
    always @(*) begin
        case (opcode)
            4'b0000: result = adder_out;      // Addition
            4'b0001: result = subtractor_out; // Subtraction
            4'b0010: result = A & B;          // AND
            4'b0011: result = A | B;          // OR
            4'b0100: result = A ^ B;          // XOR
            4'b0101: result = ~A;             // NOT
            4'b0110: result = shifter_out;    // Shifter
            4'b1001: mult_result = multiplier_out; // Multiplication
            //4'b1010: result = divider_out;    // Division
            default: result = {N{1'b0}};  // Default case
        endcase

        // Flags
        zero = (result == {N{1'b0}});
        carry = 0; 
        overflow = 0; 
        sign = result[N-1];
    end
endmodule
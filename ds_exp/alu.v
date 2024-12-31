// Completely configurable ALU

module alu #(parameter WIDTH = 32) (
    input [WIDTH-1:0] A, B, // Operands
    input [3:0] opcode,     // Operation code
    input [1:0] adder_sel,  // Adder selection signal
    input [1:0] sub_sel,    // Subtractor selection signal
    input [1:0] mul_sel,    // Multiplier selection signal
    input [1:0] div_sel,    // Divider selection signal
    input [1:0] shifter_sel, // Shifter selection signal
    output reg [WIDTH-1:0] result, // Result
    output reg zero, carry, overflow, sign // Flags
);
    wire [WIDTH-1:0] sum_rca, sum_cla, sum_kogge_stone, sum_carry_skip, sum_carry_save;
    wire [WIDTH-1:0] diff_rca, diff_cla, diff_borrow_lookahead;
    wire [WIDTH-1:0] prod_wallace, prod_array, prod_booth, prod_dadda;
    wire [WIDTH-1:0] quot_restoring, quot_non_restoring, quot_srt, quot_goldschmidt;
    wire [WIDTH-1:0] shifter_out;

    // Instantiate adders
    ripple_carry_adder #(WIDTH) rca_adder (.A(A), .B(B), .sum(sum_rca));
    carry_lookahead_adder #(WIDTH) cla_adder (.A(A), .B(B), .sum(sum_cla));
    kogge_stone_adder #(WIDTH) ks_adder (.A(A), .B(B), .sum(sum_kogge_stone));
    carry_skip_adder #(WIDTH) cs_adder (.A(A), .B(B), .sum(sum_carry_skip));
    carry_save_adder #(WIDTH) csa_adder (.A(A), .B(B), .sum(sum_carry_save));

    // Instantiate subtractors
    ripple_carry_subtractor #(WIDTH) rca_subtractor (.A(A), .B(B), .diff(diff_rca));
    carry_lookahead_subtractor #(WIDTH) cla_subtractor (.A(A), .B(B), .diff(diff_cla));
    borrow_lookahead_subtractor #(WIDTH) bla_subtractor (.A(A), .B(B), .diff(diff_borrow_lookahead));

    // Instantiate multipliers
    wallace_tree_multiplier #(WIDTH) w_multiplier (.A(A), .B(B), .prod(prod_wallace));
    array_multiplier #(WIDTH) a_multiplier (.A(A), .B(B), .prod(prod_array));
    booth_multiplier #(WIDTH) b_multiplier (.A(A), .B(B), .prod(prod_booth));
    dadda_multiplier #(WIDTH) d_multiplier (.A(A), .B(B), .prod(prod_dadda));

    // Instantiate dividers
    restoring_divider #(WIDTH) r_divider (.A(A), .B(B), .quot(quot_restoring));
    non_restoring_divider #(WIDTH) nr_divider (.A(A), .B(B), .quot(quot_non_restoring));
    srt_divider #(WIDTH) srt_div (.A(A), .B(B), .quot(quot_srt));
    goldschmidt_divider #(WIDTH) g_div (.A(A), .B(B), .quot(quot_goldschmidt));

    // Instantiate shifters
    shifter #(WIDTH) shifter_inst (
        .A(A),
        .B(B),
        .shifter_sel(shifter_sel),
        .out(shifter_out)
    );

    // Opcode decoding and result selection
    always @(*) begin
        case (opcode)
            4'b0000: result = (adder_sel == 2'b00) ? sum_rca :
                              (adder_sel == 2'b01) ? sum_cla :
                              (adder_sel == 2'b10) ? sum_kogge_stone :
                              (adder_sel == 2'b11) ? sum_carry_skip : sum_carry_save; // Addition
            4'b0001: result = (sub_sel == 2'b00) ? diff_rca :
                              (sub_sel == 2'b01) ? diff_cla :
                              (sub_sel == 2'b10) ? diff_borrow_lookahead : diff_rca; // Subtraction
            4'b0010: result = and_out;   // AND
            4'b0011: result = or_out;    // OR
            4'b0100: result = xor_out;   // XOR
            4'b0101: result = not_out;   // NOT
            4'b0110: result = shifter_out; // Shifters
            4'b1001: result = (mul_sel == 2'b00) ? prod_wallace :
                              (mul_sel == 2'b01) ? prod_array :
                              (mul_sel == 2'b10) ? prod_booth : prod_dadda; // Multiplication
            4'b1010: result = (div_sel == 2'b00) ? quot_restoring :
                              (div_sel == 2'b01) ? quot_non_restoring :
                              (div_sel == 2'b02) ? quot_srt : quot_goldschmidt; // Division
            default: result = {WIDTH{1'b0}};
        endcase

        // Flags
        zero = (result == {WIDTH{1'b0}});
        carry = 0; // Example: Set carry flag logic
        overflow = 0; // Example: Set overflow flag logic
        sign = result[WIDTH-1];
    end
endmodule

module alu_tb;
    parameter WIDTH = 32;
    reg [WIDTH-1:0] A, B;
    reg [3:0] opcode;
    reg [1:0] adder_sel, sub_sel, mul_sel, div_sel, shifter_sel;
    wire [WIDTH-1:0] result;
    wire zero, carry, overflow, sign;

    alu #(WIDTH) uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .adder_sel(adder_sel),
        .sub_sel(sub_sel),
        .mul_sel(mul_sel),
        .div_sel(div_sel),
        .shifter_sel(shifter_sel),
        .result(result),
        .zero(zero),
        .carry(carry),
        .overflow(overflow),
        .sign(sign)
    );

    initial begin
        $monitor("At time %t, A = %h, B = %h, opcode = %b, result = %h, zero = %b, carry = %b, overflow = %b, sign = %b", 
                 $time, A, B, opcode, result, zero, carry, overflow, sign);

        // Initialize inputs
        A = 32'h00000000; B = 32'h00000000; opcode = 4'b0000; adder_sel = 2'b00; sub_sel = 2'b00; mul_sel = 2'b00; div_sel = 2'b00; shifter_sel = 2'b00;

        // Test Addition with different adders
        #10 A = 32'h0000000A; B = 32'h00000005; opcode = 4'b0000; adder_sel = 2'b00; // RCA
        #10 opcode = 4'b0000; adder_sel = 2'b01; // CLA
        #10 opcode = 4'b0000; adder_sel = 2'b10; // Kogge-Stone
        #10 opcode = 4'b0000; adder_sel = 2'b11; // Carry-Skip

        // Test Subtraction with different subtractors
        #10 opcode = 4'b0001; sub_sel = 2'b00; // RCA
        #10 opcode = 4'b0001; sub_sel = 2'b01; // CLA
        #10 opcode = 4'b0001; sub_sel = 2'b10; // Borrow Lookahead

        // Test Logical operations
        #10 opcode = 4'b0010; // AND
        #10 opcode = 4'b0011; // OR
        #10 opcode = 4'b0100; // XOR
        #10 opcode = 4'b0101; // NOT

        // Test Shifters
        #10 opcode = 4'b0110; shifter_sel = 2'b00; // Shifter
        #10 opcode = 4'b0110; shifter_sel = 2'b01; // Shifter
        #10 opcode = 4'b0110; shifter_sel = 2'b10; // Shifter
        #10 opcode = 4'b0110; shifter_sel = 2'b11; // Shifter

        // Test Multiplication with different multipliers
        #10 opcode = 4'b1001; mul_sel = 2'b00; // Wallace Tree
        #10 opcode = 4'b1001; mul_sel = 2'b01; // Array
        #10 opcode = 4'b1001; mul_sel = 2'b10; // Booth
        #10 opcode = 4'b1001; mul_sel = 2'b11; // Dadda

        // Test Division with different dividers
        #10 opcode = 4'b1010; div_sel = 2'b00; // Restoring
        #10 opcode = 4'b1010; div_sel = 2'b01; // Non-Restoring
        #10 opcode = 4'b1010; div_sel = 2'b10; // SRT
        #10 opcode = 4'b1010; div_sel = 2'b11; // Goldschmidt

        #10 $finish;
    end
endmodule
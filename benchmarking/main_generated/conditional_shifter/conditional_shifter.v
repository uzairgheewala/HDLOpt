module conditional_shifter #(parameter N = 2) (
    input wire signed [N-1:0] signed_data_in,  
    input wire [N-1:0] unsigned_data_in,      
    input wire [$clog2(N)-1:0] shift_amount,
    input wire shifter_sel,             // Control signal to select the shifter
    input wire direction,                     // 0 for left shift, 1 for right shift
    output reg [N-1:0] data_out
);

    wire [N-1:0] arith_out, logic_out;

    // Arithmetic shifter for signed data
    arithmetic_shifter #(N) arith_shifter (
        .data_in(signed_data_in),  
        .shift_amount(shift_amount),
        .direction(direction),
        .data_out(arith_out)
    ); // Module

    // Logical shifter for unsigned data
    logic_shifter #(N) logic_shifter (
        .data_in(unsigned_data_in), 
        .shift_amount(shift_amount),
        .direction(direction),
        .data_out(logic_out)
    ); // Module

    always @(*) begin
        case (shifter_sel)
            2'b00: data_out = arith_out;  
            2'b01: data_out = logic_out;  
            default: data_out = logic_out; 
        endcase
    end

endmodule
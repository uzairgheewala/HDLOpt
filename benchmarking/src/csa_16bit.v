module csa_16bit (
    input wire [15:0] M,   // in operand M
    input wire [15:0] T,   // in operand T
    input wire D,          // in signal D
    input wire ctrl,       // in control signal
    
    output wire Q,         // out signal Q
    output wire [15:0] R   // out signal R
);

    wire [14:0] temp;

    csa csa_inst0 (
        .a(M[0]),
        .b(D),
        .cin(ctrl),
        .ctrl(ctrl),
        .o(R[0]),
        .cout(temp[0])
    ); // Module

    generate
        genvar i;
        for (i = 1; i < 16; i = i + 1) begin : csa_gen
            csa csa_inst (
                .a(M[i]),
                .b(T[i-1]),
                .cin(temp[i-1]),
                .ctrl(ctrl),
                .o(R[i]),
                .cout(temp[i])
            ); // Module
        end
    endgenerate

    assign Q = temp[14];

endmodule
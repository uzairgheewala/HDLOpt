module xnor3 (
    input wire i0,       // in operand i0
    input wire i1,       // in operand i1
    input wire i2,       // in operand i2
    
    output wire o        // out signal o
);

    wire t;

    xor2 xor2_0 (
        .i0(i0),
        .i1(i1),
        .o(t)
    ); // Module

    xnor2 xnor2_0 (
        .i0(i2),
        .i1(t),
        .o(o)
    ); // Module

endmodule
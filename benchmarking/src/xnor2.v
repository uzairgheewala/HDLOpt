module xnor2 (
    input wire i0,       // in operand i0
    input wire i1,       // in operand i1
    
    output wire o        // out signal o
);

    wire t;

    xor2 xor2_0 (
        .i0(i0),
        .i1(i1),
        .o(t)
    ); // Module

    invert invert_0 (
        .i(t),
        .o(o)
    ); // Module

endmodule
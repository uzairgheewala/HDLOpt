module xor2 (
    // In signals
    input wire i0,         // in operand i0
    input wire i1,         // in operand i1
    
    // Out signals
    output wire o          // out o
);
    assign o = i0 ^ i1;
endmodule
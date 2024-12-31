module or2 (
    input wire i0,       // in operand i0
    input wire i1,       // in operand i1
    
    output wire o        // out signal o
);
    assign o = i0 | i1;
endmodule
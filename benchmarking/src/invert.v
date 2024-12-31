module invert (
    input wire i,        // in signal i
    
    output wire o        // out signal o
);
    assign o = !i;
endmodule
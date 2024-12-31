module carry_logic (
    input wire p,         // in propagate signal
    input wire g,         // in generate signal
    input wire c_in,      // in carry-in
    
    output wire c_out     // out carry-out
);
    assign c_out = g | (p & c_in);
endmodule
module csa (
    input wire a,          // in signal a
    input wire b,          // in signal b
    input wire cin,        // in carry-in
    input wire ctrl,       // in control signal
    
    output wire o,         // out signal o
    output wire cout       // out carry-out
);

    wire t;

    xor2 xor2_inst0 (
        .i0(a),
        .i1(ctrl),
        .o(j)
    ); // Module

    full_adder full_adder_inst0 (
        .a(j),
        .b(b),
        .cin(cin),
        .sum(o),
        .cout(cout)
    ); // Module

endmodule
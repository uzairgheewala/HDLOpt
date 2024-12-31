// D-FF with Reset and Load
module dfrl (
    input wire clk,         // in clock signal
    input wire reset,       // in reset signal
    input wire load,        // in load signal
    input wire in,          // in data signal
    
    output wire out         // out data signal
);

    wire _in;

    multiplexer_2_1 mux2_0 (
        .i0(out),
        .i1(in),
        .j(load),
        .o(_in)
    ); // Module

    dfr dfr_1 (
        .clk(clk),
        .reset(reset),
        .in(_in),
        .out(out)
    ); // Module

endmodule
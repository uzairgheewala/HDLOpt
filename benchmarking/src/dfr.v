// D-FF with Reset
module dfr (
    input wire clk,         // in clock signal
    input wire reset,       // in reset signal
    input wire in,          // in data signal
    
    output wire out         // out data signal
);

    wire reset_, df_in;

    invert invert_0 (
        .i(reset),
        .o(reset_)
    ); // Module

    and2 and2_0 (
        .i0(in),
        .i1(reset_),
        .o(df_in)
    ); // Module

    df df_0 (
        .clk(clk),
        .in(df_in),
        .out(out)
    ); // Module

endmodule
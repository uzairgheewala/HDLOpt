// 1x4 De-multiplexer
module demux_1x4 (
    input wire in,        // in signal in
    input wire [1:0] s,   // in select lines s
    
    output wire y0,       // out y0
    output wire y1,       // out y1
    output wire y2,       // out y2
    output wire y3        // out y3
);

    wire t0, t1;

    demux_1x2 demux2_0 (
        .i(in),
        .s(s[1]),
        .y0(t0),
        .y1(t1)
    ); // Module

    demux_1x2 demux2_1 (
        .i(t0),
        .s(s[0]),
        .y0(y0),
        .y1(y1)
    ); // Module

    demux_1x2 demux2_2 (
        .i(t1),
        .s(s[0]),
        .y0(y2),
        .y1(y3)
    ); // Module

endmodule

// Testbench
/*
module demux_1x4_tb;
    reg in;
    reg [1:0] s;
    wire y0, y1, y2, y3;

    demux_1x4 uut (
        .in(in),
        .s(s),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        $monitor("At time %t, in = %b, s = %b, y0 = %b, y1 = %b, y2 = %b, y3 = %b", $time, in, s, y0, y1, y2, y3);

        in = 1; s = 2'b00; #10;
        in = 1; s = 2'b01; #10;
        in = 1; s = 2'b10; #10;
        in = 1; s = 2'b11; #10;
        in = 0; s = 2'b00; #10;
        in = 0; s = 2'b01; #10;
        in = 0; s = 2'b10; #10;
        in = 0; s = 2'b11; #10;

        $finish;
    end
endmodule
*/
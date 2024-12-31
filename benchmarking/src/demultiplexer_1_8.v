// 1x8 De-multiplexer
module demux_1x8 (
    input wire in,        // in signal in
    input wire [2:0] s,   // in select lines s
    
    output wire y0,       // out y0
    output wire y1,       // out y1
    output wire y2,       // out y2
    output wire y3,       // out y3
    output wire y4,       // out y4
    output wire y5,       // out y5
    output wire y6,       // out y6
    output wire y7        // out y7
);

    wire t0, t1;

    demux_1x2 demux2_0 (
        .i(in),
        .s(s[2]),
        .y0(t0),
        .y1(t1)
    ); // Module

    demux_1x4 demux4_0 (
        .in(t0),
        .s(s[1:0]),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    ); // Module

    demux_1x4 demux4_1 (
        .in(t1),
        .s(s[1:0]),
        .y0(y4),
        .y1(y5),
        .y2(y6),
        .y3(y7)
    ); // Module

endmodule

// Testbench
/*
module demux_1x8_tb;
    reg in;
    reg [2:0] s;
    wire y0, y1, y2, y3, y4, y5, y6, y7;

    demux_1x8 uut (
        .in(in),
        .s(s),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .y4(y4),
        .y5(y5),
        .y6(y6),
        .y7(y7)
    );

    initial begin
        $monitor("At time %t, in = %b, s = %b, y0 = %b, y1 = %b, y2 = %b, y3 = %b, y4 = %b, y5 = %b, y6 = %b, y7 = %b", $time, in, s, y0, y1, y2, y3, y4, y5, y6, y7);

        in = 1; s = 3'b000; #10;
        in = 1; s = 3'b001; #10;
        in = 1; s = 3'b010; #10;
        in = 1; s = 3'b011; #10;
        in = 1; s = 3'b100; #10;
        in = 1; s = 3'b101; #10;
        in = 1; s = 3'b110; #10;
        in = 1; s = 3'b111; #10;
        in = 0; s = 3'b000; #10;
        in = 0; s = 3'b001; #10;
        in = 0; s = 3'b010; #10;
        in = 0; s = 3'b011; #10;
        in = 0; s = 3'b100; #10;
        in = 0; s = 3'b101; #10;
        in = 0; s = 3'b110; #10;
        in = 0; s = 3'b111; #10;

        $finish;
    end
endmodule
*/
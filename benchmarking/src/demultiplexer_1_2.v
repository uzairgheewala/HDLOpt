// 1x2 De-multiplexer
module demux_1x2 (
    input wire i,         // in signal i
    input wire s,         // in select line s
    
    output wire y0,       // out y0
    output wire y1        // out y1
);
    assign y0 = (s == 0) ? i : 0;
    assign y1 = (s == 1) ? i : 0;
endmodule

// Testbench
/*
module demux_1x2_tb;
    reg i, s;
    wire y0, y1;

    demux_1x2 uut (
        .i(i),
        .s(s),
        .y0(y0),
        .y1(y1)
    );

    initial begin
        $monitor("At time %t, i = %b, s = %b, y0 = %b, y1 = %b", $time, i, s, y0, y1);

        i = 1; s = 0; #10;
        i = 1; s = 1; #10;
        i = 0; s = 0; #10;
        i = 0; s = 1; #10;

        $finish;
    end
endmodule
*/
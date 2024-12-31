// 2x1 Multiplexer
module multiplexer_2_1 (
    input wire i0,
    input wire i1,
    input wire s0,
    output wire y
);
    assign y = s0 ? i1 : i0;
endmodule

// Testbench
/*
module multiplexer_2_1_tb;
    reg i0, i1, s0;
    wire y;

    multiplexer_2_1 uut(
        .i0(i0),
        .i1(i1),
        .s0(s0),
        .y(y)
    );

    initial begin
        $monitor("At time %t, i0 = %b, i1 = %b, s0 = %b, y = %b", $time, i0, i1, s0, y);
        i0 = 0; i1 = 0; s0 = 0; #10;
        i0 = 1; i1 = 1; s0 = 0; #10;
        i0 = 0; i1 = 0; s0 = 1; #10;
        i0 = 1; i1 = 1; s0 = 1; #10;
        $finish;
    end

endmodule
*/
// 8x1 Multiplexer
module multiplexer_8_1 (
    input wire i0,        // in operand i0
    input wire i1,        // in operand i1
    input wire i2,        // in operand i2
    input wire i3,        // in operand i3
    input wire i4,        // in operand i4
    input wire i5,        // in operand i5
    input wire i6,        // in operand i6
    input wire i7,        // in operand i7
    input wire s0,        // in select line s0
    input wire s1,        // in select line s1
    input wire s2,        // in select line s2
    
    output wire y         // out y
);

    wire l1, l2;

    multiplexer_4_1 mux0 (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s0(s0),
        .s1(s1),
        .f(l1)
    ); // Module

    multiplexer_4_1 mux1 (
        .i0(i4),
        .i1(i5),
        .i2(i6),
        .i3(i7),
        .s0(s0),
        .s1(s1),
        .f(l2)
    ); // Module

    multiplexer_2_1 mux2 (
        .i0(l1),
        .i1(l2),
        .s0(s2),
        .y(y)
    ); // Module

endmodule

// Testbench
/*
module multiplexer_8_1_tb;
    reg i0, i1, s0;
    wire y;

    multiplexer_8_1 uut(
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
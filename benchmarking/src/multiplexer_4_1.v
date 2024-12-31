// 4x1 Multiplexer
module multiplexer_4_1 (
    input wire i0,        // in operand i0
    input wire i1,        // in operand i1
    input wire i2,        // in operand i2
    input wire i3,        // in operand i3
    input wire s0,        // in select line s0
    input wire s1,        // in select line s1
    
    output wire f         // out f
);

    wire l1, l2;

    multiplexer_2_1 mux0 (
        .i0(i0),
        .i1(i1),
        .s0(s0),
        .y(l1)
    ); // Module

    multiplexer_2_1 mux1 (
        .i0(i2),
        .i1(i3),
        .s0(s0),
        .y(l2)
    ); // Module

    multiplexer_2_1 mux2 (
        .i0(l1),
        .i1(l2),
        .s0(s1),
        .y(f)
    ); // Module

endmodule

// Testbench
/*
module multiplexer_4_1_tb;
    reg i0, i1, i2, i3, s0, s1;
    wire f;

    multiplexer_4_1 uut(
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s0(s0),
        .s1(s1),
        .f(f)
    );

    initial begin
        $monitor("At time %t, i0 = %b, i1 = %b, i2 = %b, i3 = %b, s0 = %b, s1 = %b, f = %b", 
                 $time, i0, i1, i2, i3, s0, s1, f);
        
        i0 = 0; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0; #10;
        i0 = 1; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0; #10;
        i0 = 0; i1 = 1; i2 = 0; i3 = 0; s0 = 1; s1 = 0; #10;
        i0 = 0; i1 = 0; i2 = 1; i3 = 0; s0 = 0; s1 = 1; #10;
        i0 = 0; i1 = 0; i2 = 0; i3 = 1; s0 = 1; s1 = 1; #10;
        i0 = 1; i1 = 1; i2 = 1; i3 = 1; s0 = 0; s1 = 0; #10;
        i0 = 1; i1 = 1; i2 = 1; i3 = 1; s0 = 1; s1 = 0; #10;
        i0 = 1; i1 = 1; i2 = 1; i3 = 1; s0 = 0; s1 = 1; #10;
        i0 = 1; i1 = 1; i2 = 1; i3 = 1; s0 = 1; s1 = 1; #10;

        $finish;
    end

endmodule
*/
// Half Adder
module half_adder (
    input wire a,
    input wire b,
    output wire s, 
    output wire c
);
    assign c = a & b;
    assign s = a ^ b;
endmodule

// Testbench
/*
module half_adder_tb;
    reg a;
    reg b;
    wire s, c;

    half_adder uut(
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );

    initial begin
        $monitor("At time %t, a = %b, b = %b, s = %b, c = %b", $time, a, b, s, c);
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end

endmodule
*/
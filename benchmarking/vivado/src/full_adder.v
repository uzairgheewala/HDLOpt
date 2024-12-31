module full_adder (
    input wire a, 
    input wire b, 
    input wire cin,
    output wire sum, 
    output wire cout
);
    wire c1, s1, c2;
    
    half_adder u1 (
        .a(a),
        .b(b),
        .s(s1),
        .c(c1)
    );
    
    half_adder u2 (
        .a(s1),
        .b(cin),
        .s(sum),
        .c(c2)
    );

    assign cout = c1 | c2;
endmodule

// Testbench
/*
module full_adder_tb;
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;

    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        a = 0; b = 0; cin = 0;
        #10; a = 0; b = 0; cin = 1;
        #10; a = 0; b = 1; cin = 0;
        #10; a = 0; b = 1; cin = 1;
        #10; a = 1; b = 0; cin = 0;
        #10; a = 1; b = 0; cin = 1;
        #10; a = 1; b = 1; cin = 0;
        #10; a = 1; b = 1; cin = 1;
        #10; $finish;
    end

    initial begin
        // Monitor the signals
        $monitor("At time %t, a = %b, b = %b, cin = %b, sum = %b, cout = %b",
                 $time, a, b, cin, sum, cout);
    end
endmodule
*/
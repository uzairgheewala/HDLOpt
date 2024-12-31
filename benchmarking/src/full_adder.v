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
        .sum(s1),
        .cout(c1)
    ); // Module
    
    half_adder u2 (
        .a(s1),
        .b(cin),
        .sum(sum),
        .cout(c2)
    ); // Module

    assign cout = c1 | c2;
endmodule


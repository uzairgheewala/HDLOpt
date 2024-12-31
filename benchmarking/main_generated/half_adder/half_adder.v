// Half Adder

module half_adder (
    input wire a,
    input wire b,
    output wire sum, 
    output wire cout
);
    assign cout = a & b;
    assign sum = a ^ b;
endmodule
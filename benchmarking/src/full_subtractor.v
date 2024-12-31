// Full Subtractor
module full_subtractor (
    input wire a, 
    input wire b, 
    input wire bin,
    output wire diff, 
    output wire bout
);
    wire b1;
    wire d1;
    wire b2;
    half_subtractor u1(a, b, d1, b1); // Module
    half_subtractor u2(.a(d1), .b(bin), .diff(diff), .bout(b2)); // Module

    assign bout = b1 | b2;
endmodule


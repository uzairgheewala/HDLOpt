// Half Subtractor
module half_subtractor (
    input wire a,
    input wire b,
    output wire diff, 
    output wire bout
);
    assign bout = ~a & b;
    assign diff = a ^ b;
endmodule
module logic_shifter #(parameter N = 2 ) (
    input wire [N-1:0] data_in,
    input wire [$clog2(N)-1:0] shift_amount,
    input wire direction, // 0 for left shift, 1 for right shift
    output reg [N-1:0] data_out
);

wire [N-1:0] stage [$clog2(N):0];
assign stage[0] = data_in;

genvar i;
generate
    for (i = 0; i < $clog2(N); i = i + 1) begin : shift_stages
        wire [N-1:0] shifted_left, shifted_right;

        assign shifted_left = stage[i] << (1 << i);  // Shift left by 2^i
        assign shifted_right = stage[i] >> (1 << i); // Shift right by 2^i

        assign stage[i+1] = (direction == 0) ? 
                            (shift_amount[i] ? shifted_left : stage[i]) : 
                            (shift_amount[i] ? shifted_right : stage[i]);
    end
endgenerate

always @(*) begin
    data_out = stage[$clog2(N)];
end

endmodule

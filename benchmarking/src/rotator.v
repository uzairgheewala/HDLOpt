module Rotator #(parameter WIDTH = 32) (
    input wire [WIDTH-1:0] data_in,
    input wire [$clog2(WIDTH)-1:0] rotate_amount,
    input wire direction, // 0 for left rotate, 1 for right rotate
    output reg [WIDTH-1:0] data_out
);

always @(*) begin
    if (direction == 0) begin
        // Rotate Left
        data_out = (data_in << rotate_amount) | (data_in >> (WIDTH - rotate_amount));
    end else begin
        // Rotate Right
        data_out = (data_in >> rotate_amount) | (data_in << (WIDTH - rotate_amount));
    end
end

endmodule
/*
module tb_Rotator;
    parameter WIDTH = 32;
    reg [WIDTH-1:0] data_in;
    reg [$clog2(WIDTH)-1:0] rotate_amount;
    reg direction; // 0 for left rotate, 1 for right rotate
    wire [WIDTH-1:0] data_out;

    Rotator #(WIDTH) uut (
        .data_in(data_in),
        .rotate_amount(rotate_amount),
        .direction(direction),
        .data_out(data_out)
    );

    initial begin
        // Test cases
        data_in = 32'b00000000000000000000000000001111; rotate_amount = 3; direction = 0;
        #10;
        $display("Rotate Left: %b << %d = %b", data_in, rotate_amount, data_out);
        if (data_out !== 32'b00000000000000000000001111000000) begin
            $display("Test failed!");
            $finish;
        end

        data_in = 32'b11110000000000000000000000001111; rotate_amount = 4; direction = 1;
        #10;
        $display("Rotate Right: %b >> %d = %b", data_in, rotate_amount, data_out);
        if (data_out !== 32'b11110000111100000000000000000000) begin
            $display("Test failed!");
            $finish;
        end

        // Additional test cases
        data_in = 32'b10000000000000000000000000000001; rotate_amount = 1; direction = 0;
        #10;
        $display("Rotate Left: %b << %d = %b", data_in, rotate_amount, data_out);
        if (data_out !== 32'b00000000000000000000000000000011) begin
            $display("Test failed!");
            $finish;
        end

        data_in = 32'b10000000000000000000000000000001; rotate_amount = 1; direction = 1;
        #10;
        $display("Rotate Right: %b >> %d = %b", data_in, rotate_amount, data_out);
        if (data_out !== 32'b11000000000000000000000000000000) begin
            $display("Test failed!");
            $finish;
        end

        // End of simulation
        $display("All tests passed!");
        $finish;
    end
endmodule
*/
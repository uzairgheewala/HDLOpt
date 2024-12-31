// D-FF
module df (
    input wire clk,         // in clock signal
    input wire in,          // in data signal
    
    output wire out         // out data signal
);

    reg df_out;

    always @(posedge clk) begin
        df_out <= in;
    end

    assign out = df_out;

endmodule
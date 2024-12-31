module restoring_divider #(parameter N = 2) (
    input clk,
    input rst,
    input start,
    input [N-1:0] X, 
    input [N-1:0] Y,
    output [N-1:0] quot, 
    output [N-1:0] rem,
    output reg valid
);

reg [2*N-1:0] Z, next_Z, Z_temp, Z_temp1;
reg next_state, pres_state;
reg [$clog2(N)-1:0] count, next_count;
reg next_valid;

localparam IDLE = 1'b0;
localparam START = 1'b1;

assign rem = Z[2*N-1:N];
assign quot = Z[N-1:0];

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        Z <= {2*N{1'b0}};
        valid <= 1'b0;
        pres_state <= IDLE;
        count <= 0;
    end else begin
        Z <= next_Z;
        valid <= next_valid;
        pres_state <= next_state;
        count <= next_count;
    end
end

always @(*) begin
    case (pres_state)
        IDLE: begin
            next_count = 0;
            next_valid = 1'b0;
            if (start) begin
                next_state = START;
                next_Z = {{N{1'b0}}, X};
            end else begin
                next_state = pres_state;
                next_Z = {2*N{1'b0}};
            end
        end

        START: begin
            next_count = count + 1'b1;
            Z_temp = Z << 1;
            Z_temp1 = {Z_temp[2*N-1:N] - Y, Z_temp[N-1:0]};
            next_Z = Z_temp1[2*N-1] ? {Z_temp[2*N-1:N], Z_temp[N-1:1], 1'b0} :
                                      {Z_temp1[2*N-1:N], Z_temp[N-1:1], 1'b1};
            next_valid = (count == N-1) ? 1'b1 : 1'b0;
            next_state = (count == N-1) ? IDLE : pres_state;
        end
    endcase
end

endmodule
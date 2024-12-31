module SRTDivider
#(
    parameter N = 32
)
(
    input rst,
    input clk,
    input start,
    input signedInput,
    input [N - 1 : 0] x,
    input [N - 1 : 0] y,
    output [N - 1 : 0] q,
    output [N - 1 : 0] r,
    output done,
    output divByZeroEx
);

// State encoding for FSM
parameter RESET = 2'b00, START = 2'b01, RUN = 2'b10, DONE = 2'b11;
reg [1:0] state;
reg doneReg;
reg divByZeroExReg;
reg [N - 1 : 0] qnReg;
reg [N - 1 : 0] yReg;
reg [2 * N + 1 : 0] rxqReg;
reg [$clog2(N)-1 : 0] counter;
reg [$clog2(N)-1 : 0] shiftY;
reg [$clog2(N)-1 : 0] shiftYReg;
reg [N - 1 : 0] xAbs;
reg [N - 1 : 0] yAbs;
reg [N + 1 : 0] cReg;
reg [N + 1: 0] ca;
reg [N + 1: 0] sa;
reg [N + 1: 0] cs;
reg [N + 1: 0] ss;
reg [3 : 0] r4;
reg [2 * N + 1 : 0] rxVar;
reg [N : 0] sum;

reg oppositeSigns;

// outputs
assign q = signedInput & (x[N - 1] ^ y[N - 1]) ? -rxqReg[N - 1 : 0] : rxqReg[N - 1 : 0];
assign r = rxqReg[2 * N - 1 : N];
assign done = doneReg;
assign divByZeroEx = divByZeroExReg;

assign sum = rxqReg[2 * N : N] + {cReg[N : 0]};
assign r4 = rxqReg[2 * N + 1 : 2 * N - 2] + cReg[N + 1  : N - 2];
assign yAbs = (y[N - 1] & signedInput) ? -y : y;
assign xAbs = (x[N - 1] & signedInput) ? -x : x;

// Function to compute ceiling of log2 (to replace $clog2)
function integer clog2;
    input integer value;
    begin
        value = value - 1;
        for (clog2 = 0; value > 0; clog2 = clog2 + 1)
            value = value >> 1;
    end
endfunction

// Signed shift
always @* begin
    rxVar = xAbs << shiftY;
end

// FSM
always @(posedge clk or posedge rst) begin
    integer i;
    if (rst) begin
        state <= RESET;
        doneReg <= 1'b0;
    end else begin
        case (state)
            RESET: begin
                counter <= 0;
                rxqReg <= 0;
                yReg <= 0;
                qnReg <= 0;
                cReg <= 0;
                doneReg <= 1'b0;
                divByZeroExReg <= 1'b0;
                if (start)
                    state <= START;
                else 
                    state <= RESET;  
            end
            START: begin
                shiftYReg <= shiftY;
                yReg <= yAbs << shiftY;
                rxqReg <= rxVar;
                if (y == {N{1'b0}}) begin
                    doneReg <= 1'b1;
                    divByZeroExReg <= 1'b1;
                    state <= DONE;  
                end else begin
                    state <= RUN;
                end
            end
            DONE: begin
                state <= DONE;
            end
            RUN: begin
                if (counter == N) begin
                    if (sum[N]) begin
                        rxqReg[2 * N - 1 : N] <= (sum + yReg) >> shiftYReg; 
                    end else begin
                        rxqReg[2 * N - 1 : N] <= sum >> shiftYReg; 
                    end  
                    rxqReg[N - 1 : 0] <= rxqReg[N - 1 : 0] - sum[N];   
                    doneReg <= 1'b1;
                    counter <= 0;    
                    state <= DONE;
                end else begin
                    if (!r4[3]) begin
                        rxqReg <= {sa, rxqReg[N - 2 : 0], 1'b1};
                        cReg <= ca;                         
                        qnReg <= {rxqReg[N - 2 : 0], 1'b0};   
                    end else if (r4 != 4'b1111) begin
                        rxqReg <= {sa, qnReg[N - 2 : 0], 1'b1};
                        cReg <= ca;                      
                        qnReg <= {qnReg[N - 2 : 0], 1'b0};  
                    end else begin
                        rxqReg <= {rxqReg[2 * N : 0], 1'b0};  
                        cReg <= {cReg[N : 0], 1'b0};                     
                        qnReg <= {qnReg[N - 2 : 0], 1'b1}; 
                    end   
                    state <= RUN;
                    counter <= counter + 1'b1;                
                end
            end
        endcase
    end
end

endmodule
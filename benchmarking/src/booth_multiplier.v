module booth_multiplier #(parameter N = 2) (  // N is parameter for bit width
    input clk,
    input rst,
    input start,
    input signed [N-1:0] X,        // N-bit in X
    input signed [N-1:0] Y,        // N-bit in Y
    output reg signed [2*N-1:0] Z, // 2*N-bit out Z
    output reg valid
);

    reg signed [2*N-1:0] next_Z, Z_temp; // 2*N-bit for intermediate result
    reg next_state, pres_state;
    reg [1:0] temp, next_temp;
    reg [$clog2(N+1)-1:0] count, next_count; // Count width adjusted for N
    reg next_valid;

    localparam IDLE = 1'b0;
    localparam START = 1'b1;

    wire signed [N-1:0] Y_addsub_result;
    reg addsub_op; // 0 for addition, 1 for subtraction
    reg signed [N-1:0] lower_bound;
    initial begin
        lower_bound = -(1 << (N-1));
    end

    // Instantiate the adder_subtractor
    adder_subtractor #(.N(N)) addsub_inst (
        .cin(addsub_op),      // Control signal for add/subtract
        .i0(Z[2*N-1:N]),      // Operand from Z
        .i1(Y),               // Operand Y
        .sum(Y_addsub_result) // Output result
    ); // Module

    // Wires for the arithmetic shifter
    wire signed [2*N-1:0] shifted_Z_temp;
    reg [$clog2(2*N)-1:0] shift_amount;  // Shift amount for the shifter
    reg shift_direction;                 // Shift direction: 0 for left, 1 for right

    // Instantiate the arithmetic shifter
    arithmetic_shifter #(.N(2*N)) shift_inst (
        .data_in(Z_temp),
        .shift_amount(shift_amount),
        .direction(shift_direction),
        .data_out(shifted_Z_temp)
    ); // Module

    // Sequential block for state and register updates
    always @ (posedge clk or negedge rst) begin
        if(!rst) begin
            Z          <= {(2*N){1'b0}}; // Initialize Z to 0
            valid      <= 1'b0;
            pres_state <= IDLE;
            temp       <= 2'b0;
            count      <= 0;
        end else begin
            Z          <= next_Z;
            valid      <= next_valid;
            pres_state <= next_state;
            temp       <= next_temp;
            count      <= next_count;
        end
    end

    // Combinational block for state machine logic
    always @ (*) begin 
        case(pres_state)
        IDLE: begin
            next_count = 0;
            next_valid = 1'b0;
            if (start) begin
                next_state = START;
                next_temp  = {X[0], 1'b0};       // Initialize temp with first bit of X
                next_Z     = {{N{1'b0}}, X};     // Initialize Z with X, padded with 0's
            end else begin
                next_state = IDLE;
                next_temp  = 2'b0;
                next_Z     = {(2*N){1'b0}};      // Reset Z to 0
            end
        end

        START: begin

            case(temp)
                2'b10:   addsub_op = 1'b1; // Set to subtract
                2'b01:   addsub_op = 1'b0; // Set to add
                default: addsub_op = 1'bx; // No operation
            endcase

            // If addsub_op is valid (add or subtract)
            if (addsub_op !== 1'bx) begin
                Z_temp = {Y_addsub_result, Z[N-1:0]}; // Assign result of add/sub
            end else begin
                Z_temp = Z; // No change
            end

            shift_direction = 1'b1;  
            shift_amount = 1; 

            next_temp  = {X[count+1], X[count]};          // Update temp with next bits of X
            next_count = count + 1'b1;
            next_Z     = shifted_Z_temp;//Z_temp >>> 1;      
            next_valid = (count == N-1) ? 1'b1 : 1'b0;    // Valid when count reaches N
            next_state = (count == N-1) ? IDLE : START;   // Return to IDLE if done
        end
        endcase
    end

    always @ (*) begin
        if (valid && (X == lower_bound || Y == lower_bound)) begin
            Z <= -Z;  // Invert Z if either X or Y is the lower bound
            valid <= 0;
        end
    end
endmodule

`timescale 1ns / 1ps

module tb_N3_conditional_shifter;

    // Parameters
    
    parameter N = 3;
    
     
    // Inputs
    
    reg signed [2:0] signed_data_in;
    
    reg  [2:0] unsigned_data_in;
    
    reg  [1:0] shift_amount;
    
    reg   shifter_sel;
    
    reg   direction;
    
    
    // Outputs
    
    wire  [2:0] data_out;
    
    
    // Instantiate the Unit Under Test (UUT)
    conditional_shifter  #( N ) uut (
        
        .signed_data_in(signed_data_in),
        
        .unsigned_data_in(unsigned_data_in),
        
        .shift_amount(shift_amount),
        
        .shifter_sel(shifter_sel),
        
        .direction(direction),
        
        
        .data_out(data_out)
        
    );
    
    initial begin
        // Initialize Inputs
        
        signed_data_in = 0;
        
        unsigned_data_in = 0;
        
        shift_amount = 0;
        
        shifter_sel = 0;
        
        direction = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 0,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 2,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 3,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 4,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 5,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 6,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 7,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 8,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 9,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 10,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 11,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 12,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 13,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 14,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 15,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 16,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 17,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 18,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 19,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 20,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 21,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 22,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 23,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 24,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 25,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 26,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 27,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 28,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 29,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 30,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 31,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 32,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 33,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 34,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 35,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 36,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 37,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 38,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 39,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 40,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 41,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 42,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 43,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 44,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 45,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 46,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 47,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 48,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 49,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 50,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 51,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 52,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 53,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 54,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 55,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 56,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 57,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 58,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 59,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 60,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 61,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 62,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 63,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 64,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 65,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 66,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 67,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 68,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 69,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 70,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 71,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 72,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 73,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 74,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 75,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 76,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 77,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 78,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 79,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 80,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 81,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 82,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 83,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 84,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 85,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 86,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 87,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 88,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 89,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 90,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 91,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 92,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 93,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 94,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 95,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 96,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 97,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 98,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 99,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 100,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 101,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 102,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 103,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 104,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 105,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 106,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 107,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 108,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 109,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 110,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 111,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 112,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 113,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 114,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 115,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 116,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 117,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 118,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 119,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 120,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 121,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 122,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 123,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 124,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 125,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 126,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 127,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 128,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 129,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 130,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 131,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 132,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 133,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 134,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 135,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 136,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 137,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 138,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 139,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 140,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 141,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 142,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 143,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 144,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 145,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 146,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 147,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 148,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 149,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 150,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 151,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 152,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 153,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 154,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 155,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 156,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 157,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 158,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 159,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 160,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 161,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 162,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 163,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 164,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 165,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 166,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 167,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 168,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 169,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 170,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 171,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 172,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 173,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 174,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 175,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 176,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 177,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 178,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 179,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 180,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 181,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 182,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 183,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 184,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 185,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 186,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 187,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 188,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 189,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 190,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 191,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 192,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 193,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 194,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 195,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 196,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 197,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 198,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 199,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 200,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 201,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 202,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 203,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 204,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 205,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 206,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 207,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 208,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 209,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 210,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 211,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 212,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 213,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 214,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 215,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 216,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 217,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 218,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 219,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 220,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 221,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 222,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 223,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 224,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 225,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 226,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 227,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 228,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 229,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 230,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 231,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 232,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 233,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 234,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 235,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 236,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 237,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 238,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 239,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 240,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 241,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 242,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 243,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 244,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 245,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 246,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 247,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 248,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 249,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 250,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 251,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 252,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 253,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 254,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 255,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 256,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 257,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 258,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 259,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 260,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 261,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 262,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 263,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 264,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 265,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 266,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 267,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 268,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 269,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 270,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 271,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 272,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 273,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 274,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 275,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 276,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 277,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 278,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 279,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 280,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 281,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 282,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 283,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 284,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 285,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 286,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 287,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 288,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 289,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 290,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 291,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 292,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 293,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 294,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 295,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 296,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 297,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 298,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 299,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 300,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 301,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 302,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 303,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 304,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 305,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 306,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 307,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 308,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 309,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 310,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 311,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 312,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 313,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 314,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 315,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 316,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 317,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 318,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 319,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 320,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 321,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 322,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 323,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 324,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 325,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 326,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 327,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 328,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 329,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 330,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 331,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 332,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 333,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 334,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 335,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 336,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 337,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 338,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 339,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 340,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 341,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 342,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 343,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 344,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 345,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 346,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 347,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 348,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 349,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 350,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 351,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 352,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 353,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 354,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 355,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 356,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 357,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 358,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 359,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 360,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 361,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 362,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 363,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 364,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 365,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 366,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 367,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 368,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 369,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 370,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 371,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 372,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 373,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 374,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 375,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 376,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 377,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 378,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 379,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 380,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 381,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 382,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 383,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 384,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 385,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 386,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 387,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 388,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 389,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 390,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 391,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 392,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 393,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 394,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 395,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 396,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 397,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 398,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 399,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 400,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 401,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 402,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 403,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 404,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 405,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 406,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 407,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 408,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 409,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 410,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 411,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 412,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 413,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 414,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 415,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 416,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 417,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 418,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 419,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 420,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 421,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 422,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 423,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 424,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 425,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 426,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 427,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 428,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 429,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 430,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 431,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 432,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 433,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 434,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 435,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 436,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 437,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 438,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 439,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 440,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 441,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 442,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 443,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 444,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 445,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 446,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 447,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 448,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 449,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 450,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 451,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 452,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 453,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 454,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 455,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 456,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 457,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 458,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 459,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 460,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 461,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 462,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 463,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 464,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 465,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 466,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 467,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 468,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 469,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 470,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 471,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 472,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 473,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 474,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 475,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 476,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 477,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 478,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 479,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 480,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 481,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 482,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 483,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 484,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 485,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 486,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 487,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 488,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 489,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 490,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 491,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 492,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 493,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 494,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 495,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 496,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 497,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 498,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 499,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 500,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 501,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 502,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 503,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 504,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 505,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 506,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 507,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 508,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 509,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 510,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 511,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 512,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 513,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 514,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 515,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 516,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 517,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 518,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 519,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 520,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 521,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 522,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 523,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 524,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 525,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 526,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 527,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 528,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 529,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 530,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 531,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 532,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 533,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 534,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 535,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 536,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 537,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 538,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 539,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 540,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 541,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 542,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 543,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 544,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 545,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 546,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 547,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 548,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 549,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 550,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 551,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 552,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 553,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 554,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 555,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 556,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 557,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 558,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 559,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 560,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 561,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 562,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 563,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 564,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 565,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 566,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 567,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 568,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 569,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 570,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 571,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 572,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 573,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 574,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 575,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 576,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 577,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 578,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 579,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 580,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 581,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 582,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 583,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 584,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 585,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 586,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 587,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 588,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 589,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 590,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 591,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 592,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 593,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 594,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 595,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 596,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 597,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 598,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 599,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 600,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 601,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 602,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 603,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 604,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 605,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 606,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 607,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 608,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 609,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 610,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 611,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 612,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 613,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 614,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 615,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 616,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 617,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 618,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 619,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 620,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 621,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 622,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 623,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 624,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 625,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 626,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 627,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 628,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 629,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 630,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 631,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 632,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 633,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 634,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 635,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 636,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 637,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 638,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 639,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 640,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 641,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 642,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 643,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 644,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 645,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 646,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 647,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 648,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 649,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 650,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 651,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 652,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 653,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 654,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 655,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 656,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 657,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 658,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 659,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 660,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 661,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 662,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 663,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 664,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 665,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 666,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 667,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 668,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 669,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 670,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 671,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 672,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 673,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 674,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 675,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 676,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 677,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 678,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 679,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 680,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 681,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 682,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 683,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 684,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 685,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 686,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 687,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 688,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 689,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 690,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 691,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 692,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 693,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 694,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 695,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 696,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 697,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 698,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 699,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 700,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 701,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 702,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 703,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 704,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 705,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 706,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 707,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 708,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 709,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 710,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 711,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 712,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 713,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 714,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 715,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 716,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 717,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 718,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 719,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 720,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 721,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 722,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 723,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 724,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 725,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 726,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 727,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 728,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 729,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 730,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 731,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 732,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 733,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 734,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 735,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 736,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 737,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 738,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 739,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 740,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 741,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 742,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 743,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 744,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 745,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 746,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 747,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 748,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 749,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 750,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 751,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 752,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 753,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 754,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 755,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 756,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 757,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 758,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 759,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 760,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 761,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 762,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 763,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 764,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 765,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 766,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 767,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 768,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 769,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 770,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 771,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 772,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 773,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 774,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 775,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 776,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 777,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 778,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 779,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 780,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 781,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 782,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 783,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 784,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 785,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 786,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 787,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 788,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 789,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 790,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 791,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 792,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 793,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 794,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 795,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 796,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 797,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 798,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 799,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 800,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 801,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 802,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 803,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 804,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 805,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 806,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 807,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 808,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 809,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 810,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 811,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 812,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 813,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 814,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 815,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 816,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 817,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 818,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 819,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 820,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 821,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 822,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 823,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 824,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 825,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 826,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 827,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 828,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 829,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 830,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 831,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 832,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 833,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 834,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 835,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 836,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 837,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 838,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 839,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 840,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 841,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 842,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 843,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 844,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 845,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 846,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 847,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 848,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 849,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 850,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 851,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 852,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 853,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 854,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 855,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 856,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 857,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 858,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 859,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 860,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 861,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 862,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 863,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 864,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 865,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 866,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 867,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 868,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 869,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 870,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 871,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 872,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 873,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 874,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 875,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 876,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 877,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 878,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 879,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 880,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 881,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 882,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 883,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 884,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 885,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 886,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 887,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 888,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 889,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 890,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 891,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 892,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 893,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 894,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 895,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 896,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 897,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 898,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 899,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 900,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 901,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 902,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 903,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 904,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 905,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 906,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 907,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 908,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 909,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 910,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 911,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 912,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 913,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 914,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 915,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 916,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 917,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 918,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 919,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 920,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 921,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 922,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 923,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 924,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 925,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 926,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 927,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 32}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 928,
                 
                 data_out
                 , 
                 
                 32
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 929,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 930,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 931,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 932,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 933,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 934,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 935,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 936,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 937,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 938,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 939,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b110; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 940,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 941,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 942,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 943,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 944,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 945,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 946,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 947,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 948,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 949,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 950,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 951,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 952,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 953,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 954,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 955,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 956,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 957,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 958,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 959,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 960,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 961,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b000; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 962,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 963,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 964,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 965,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 966,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 967,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 968,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 969,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 970,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 971,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 972,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 973,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 974,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 975,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 976,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 977,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 978,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 979,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 980,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 981,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 982,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 983,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 984,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 985,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b011; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 986,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 987,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 40}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b101; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 988,
                 
                 data_out
                 , 
                 
                 40
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 989,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b001; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 990,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 991,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 992,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 993,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b010; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 994,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 995,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 996,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 997,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b101; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 998,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 999,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b000; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1000,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1001,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b100; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1002,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b001; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1003,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 48}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b110; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1004,
                 
                 data_out
                 , 
                 
                 48
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1005,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1006,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1007,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b100; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1008,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1009,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b010; unsigned_data_in = 3'b110; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1010,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b011; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1011,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b111; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1012,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1013,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b111; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1014,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b101; unsigned_data_in = 3'b000; shift_amount = 2'b01; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1015,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b010; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1016,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b101; shift_amount = 2'b00; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1017,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b010; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1018,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b011; unsigned_data_in = 3'b111; shift_amount = 2'b01; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1019,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 56}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b100; unsigned_data_in = 3'b111; shift_amount = 2'b11; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1020,
                 
                 data_out
                 , 
                 
                 56
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b000; unsigned_data_in = 3'b001; shift_amount = 2'b00; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1021,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b110; unsigned_data_in = 3'b001; shift_amount = 2'b10; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1022,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 3'b001; unsigned_data_in = 3'b000; shift_amount = 2'b11; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1023,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
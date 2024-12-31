
`timescale 1ns / 1ps

module tb_N3_logic_shifter;

    // Parameters
    
    parameter N = 3;
    
     
    // Inputs
    
    reg  [2:0] data_in;
    
    reg  [1:0] shift_amount;
    
    reg   direction;
    
    
    // Outputs
    
    wire  [2:0] data_out;
    
    
    // Instantiate the Unit Under Test (UUT)
    logic_shifter  #( N ) uut (
        
        .data_in(data_in),
        
        .shift_amount(shift_amount),
        
        .direction(direction),
        
        
        .data_out(data_out)
        
    );
    
    initial begin
        // Initialize Inputs
        
        data_in = 0;
        
        shift_amount = 0;
        
        direction = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        data_in = 3'b110; shift_amount = 2'b00; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b110; shift_amount = 2'b00; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 0,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b011; shift_amount = 2'b00; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b011; shift_amount = 2'b00; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b010; shift_amount = 2'b00; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b010; shift_amount = 2'b00; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 2,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b100; shift_amount = 2'b10; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b100; shift_amount = 2'b10; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 3,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b001; shift_amount = 2'b01; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b001; shift_amount = 2'b01; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 4,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b010; shift_amount = 2'b01; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b010; shift_amount = 2'b01; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 5,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b011; shift_amount = 2'b00; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b011; shift_amount = 2'b00; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 6,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b110; shift_amount = 2'b01; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b110; shift_amount = 2'b01; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 7,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b001; shift_amount = 2'b11; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b001; shift_amount = 2'b11; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 8,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b110; shift_amount = 2'b10; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b110; shift_amount = 2'b10; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 9,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b111; shift_amount = 2'b01; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b111; shift_amount = 2'b01; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 10,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b011; shift_amount = 2'b11; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b011; shift_amount = 2'b11; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 11,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b101; shift_amount = 2'b00; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b101; shift_amount = 2'b00; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 12,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b101; shift_amount = 2'b00; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b101; shift_amount = 2'b00; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 13,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b010; shift_amount = 2'b10; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b010; shift_amount = 2'b10; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 14,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b000; shift_amount = 2'b10; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b000; shift_amount = 2'b10; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 15,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b111; shift_amount = 2'b00; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b111; shift_amount = 2'b00; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 16,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b100; shift_amount = 2'b00; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b100; shift_amount = 2'b00; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 17,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b011; shift_amount = 2'b01; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b011; shift_amount = 2'b01; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 18,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b011; shift_amount = 2'b11; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b011; shift_amount = 2'b11; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 19,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b111; shift_amount = 2'b10; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b111; shift_amount = 2'b10; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 20,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b000; shift_amount = 2'b01; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b000; shift_amount = 2'b01; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 21,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b010; shift_amount = 2'b10; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b010; shift_amount = 2'b10; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 22,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b011; shift_amount = 2'b10; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b011; shift_amount = 2'b10; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 23,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b101; shift_amount = 2'b10; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b101; shift_amount = 2'b10; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 24,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b010; shift_amount = 2'b01; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b010; shift_amount = 2'b01; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 25,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b001; shift_amount = 2'b11; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b001; shift_amount = 2'b11; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 26,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b001; shift_amount = 2'b10; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b001; shift_amount = 2'b10; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 27,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b000; shift_amount = 2'b00; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b000; shift_amount = 2'b00; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 28,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b101; shift_amount = 2'b01; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b101; shift_amount = 2'b01; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 29,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b110; shift_amount = 2'b11; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b110; shift_amount = 2'b11; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 30,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b000; shift_amount = 2'b11; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b000; shift_amount = 2'b11; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 31,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b001; shift_amount = 2'b01; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b001; shift_amount = 2'b01; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 32,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b001; shift_amount = 2'b00; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b001; shift_amount = 2'b00; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 33,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b110; shift_amount = 2'b01; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b110; shift_amount = 2'b01; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 34,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b010; shift_amount = 2'b00; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b010; shift_amount = 2'b00; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 35,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b101; shift_amount = 2'b11; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b101; shift_amount = 2'b11; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 36,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b100; shift_amount = 2'b10; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b100; shift_amount = 2'b10; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 37,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b111; shift_amount = 2'b01; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b111; shift_amount = 2'b01; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 38,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b110; shift_amount = 2'b00; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b110; shift_amount = 2'b00; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 39,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b000; shift_amount = 2'b10; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b000; shift_amount = 2'b10; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 40,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b010; shift_amount = 2'b11; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b010; shift_amount = 2'b11; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 41,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b001; shift_amount = 2'b00; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b001; shift_amount = 2'b00; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 42,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b101; shift_amount = 2'b11; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b101; shift_amount = 2'b11; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 43,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b000; shift_amount = 2'b11; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b000; shift_amount = 2'b11; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 44,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b100; shift_amount = 2'b01; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b100; shift_amount = 2'b01; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 45,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b101; shift_amount = 2'b01; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b101; shift_amount = 2'b01; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 46,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b001; shift_amount = 2'b10; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b001; shift_amount = 2'b10; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 47,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b100; shift_amount = 2'b11; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b100; shift_amount = 2'b11; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 48,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b110; shift_amount = 2'b10; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b110; shift_amount = 2'b10; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 49,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b000; shift_amount = 2'b01; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b000; shift_amount = 2'b01; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 50,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b011; shift_amount = 2'b01; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b011; shift_amount = 2'b01; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 51,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b010; shift_amount = 2'b11; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b010; shift_amount = 2'b11; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 52,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b111; shift_amount = 2'b11; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b111; shift_amount = 2'b11; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 53,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b111; shift_amount = 2'b11; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b111; shift_amount = 2'b11; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 54,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b100; shift_amount = 2'b00; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b100; shift_amount = 2'b00; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 55,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b000; shift_amount = 2'b00; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b000; shift_amount = 2'b00; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 56,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b100; shift_amount = 2'b01; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b100; shift_amount = 2'b01; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 57,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b100; shift_amount = 2'b11; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b100; shift_amount = 2'b11; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 58,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b111; shift_amount = 2'b10; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b111; shift_amount = 2'b10; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 59,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b111; shift_amount = 2'b00; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b111; shift_amount = 2'b00; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 60,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b101; shift_amount = 2'b10; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b101; shift_amount = 2'b10; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 61,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b011; shift_amount = 2'b10; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b011; shift_amount = 2'b10; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 62,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 3'b110; shift_amount = 2'b11; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 3'b110; shift_amount = 2'b11; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 63,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
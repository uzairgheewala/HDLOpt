
`timescale 1ns / 1ps

module tb_N5_logic_shifter;

    // Parameters
    
    parameter N = 5;
    
     
    // Inputs
    
    reg  [4:0] data_in;
    
    reg  [2:0] shift_amount;
    
    reg   direction;
    
    
    // Outputs
    
    wire  [4:0] data_out;
    
    
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
        
        data_in = 5'b10010; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 0,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 2,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 3,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 4,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 5,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 6,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 7,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 8,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 9,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 10,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 11,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 12,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 26}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 13,
                 
                 data_out
                 , 
                 
                 26
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 14,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 22}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 15,
                 
                 data_out
                 , 
                 
                 22
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 16,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 17,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 18,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 19,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 20,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 21,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 19}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 22,
                 
                 data_out
                 , 
                 
                 19
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 23,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 30}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 24,
                 
                 data_out
                 , 
                 
                 30
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 25,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 26,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 27,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 28,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 29,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 30,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 31,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 32,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 33,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 34,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 35,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 36,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 15}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 37,
                 
                 data_out
                 , 
                 
                 15
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 38,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 39,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 40,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 41,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 42,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 43,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 44,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 45,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 46,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 47,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 48,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 49,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 50,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 51,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 52,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 53,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 54,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 55,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 56,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 13}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 57,
                 
                 data_out
                 , 
                 
                 13
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 58,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 59,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 60,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 61,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 62,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 63,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 64,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 65,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 66,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 67,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 68,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 69,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 13}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 70,
                 
                 data_out
                 , 
                 
                 13
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 71,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 72,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 73,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 11}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 74,
                 
                 data_out
                 , 
                 
                 11
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 75,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 76,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 26}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 77,
                 
                 data_out
                 , 
                 
                 26
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 78,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 29}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 79,
                 
                 data_out
                 , 
                 
                 29
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 80,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 81,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 82,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 83,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 84,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 85,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 86,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 87,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 88,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 89,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 90,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 91,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 11}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 92,
                 
                 data_out
                 , 
                 
                 11
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 93,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 23}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 94,
                 
                 data_out
                 , 
                 
                 23
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 13}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 95,
                 
                 data_out
                 , 
                 
                 13
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 96,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 97,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 98,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 99,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 100,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 101,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 102,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 103,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 18}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 104,
                 
                 data_out
                 , 
                 
                 18
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 105,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 106,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 107,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 108,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 109,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 26}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 110,
                 
                 data_out
                 , 
                 
                 26
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 111,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 15}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 112,
                 
                 data_out
                 , 
                 
                 15
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 113,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 114,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 115,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 116,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 117,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 118,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 119,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 120,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 121,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 122,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 123,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 124,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 125,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 30}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 126,
                 
                 data_out
                 , 
                 
                 30
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 127,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 128,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 129,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 130,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 131,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 132,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 133,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 22}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 134,
                 
                 data_out
                 , 
                 
                 22
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 135,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 9}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 136,
                 
                 data_out
                 , 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 137,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 138,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 139,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 140,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 141,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 142,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 143,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 144,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 145,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 146,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 147,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 148,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 149,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 150,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 151,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 152,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 153,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 154,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 155,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 156,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 21}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 157,
                 
                 data_out
                 , 
                 
                 21
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 158,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 159,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 160,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 161,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 162,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 163,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 164,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 165,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 166,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 167,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 168,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 169,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 170,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 171,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 172,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 173,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 174,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 175,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 176,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 21}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 177,
                 
                 data_out
                 , 
                 
                 21
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 178,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 179,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 180,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 181,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 182,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 183,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 184,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 185,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 186,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 187,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 188,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 189,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 190,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 27}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 191,
                 
                 data_out
                 , 
                 
                 27
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 192,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 193,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 194,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 195,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 196,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 197,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 198,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 199,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 200,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 201,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 202,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 203,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 204,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 205,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 206,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 207,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 208,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 209,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 210,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 211,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 212,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 27}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 213,
                 
                 data_out
                 , 
                 
                 27
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 18}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 214,
                 
                 data_out
                 , 
                 
                 18
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 215,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 216,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 217,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 29}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 218,
                 
                 data_out
                 , 
                 
                 29
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 219,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 220,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 221,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 222,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 223,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 224,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 225,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 226,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 227,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 228,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 229,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 15}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 230,
                 
                 data_out
                 , 
                 
                 15
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 231,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 232,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 233,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 234,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 235,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 236,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 237,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 238,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 18}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 239,
                 
                 data_out
                 , 
                 
                 18
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 240,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 241,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 242,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 243,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 244,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 245,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 246,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 247,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 248,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 9}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 249,
                 
                 data_out
                 , 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 250,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 251,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 252,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 253,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 254,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 255,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 256,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 257,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 258,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 259,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 260,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 30}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 261,
                 
                 data_out
                 , 
                 
                 30
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 262,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 25}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 263,
                 
                 data_out
                 , 
                 
                 25
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 264,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 265,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 266,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 267,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 268,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 30}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 269,
                 
                 data_out
                 , 
                 
                 30
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 270,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 25}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 271,
                 
                 data_out
                 , 
                 
                 25
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 272,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 273,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 274,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 275,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 17}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 276,
                 
                 data_out
                 , 
                 
                 17
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 277,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 278,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 279,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 9}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 280,
                 
                 data_out
                 , 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 281,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 282,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 283,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 284,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 285,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 286,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 287,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 288,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 289,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 290,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 291,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 292,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 293,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 294,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 295,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 296,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 297,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 298,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 299,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 300,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 301,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 302,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 303,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 304,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 305,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 306,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 307,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 308,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 309,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 310,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 311,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 312,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 313,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 314,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 315,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 18}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 316,
                 
                 data_out
                 , 
                 
                 18
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 317,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 318,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 319,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 320,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 321,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 322,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 323,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 324,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 325,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 326,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 327,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 328,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 329,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 330,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 331,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 332,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 333,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 334,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 335,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 336,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 337,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 338,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 339,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 340,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 341,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 31}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 342,
                 
                 data_out
                 , 
                 
                 31
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 343,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 344,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 345,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 346,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 347,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 348,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 349,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 350,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 351,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 352,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 353,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 354,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 355,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 356,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 15}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 357,
                 
                 data_out
                 , 
                 
                 15
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 358,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 359,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 360,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 361,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 362,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 363,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 364,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 365,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 366,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 11}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 367,
                 
                 data_out
                 , 
                 
                 11
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 368,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 369,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 370,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 371,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 372,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 373,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 374,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 375,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 376,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 377,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 378,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 379,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 380,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 381,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 382,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 383,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 384,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 28}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 385,
                 
                 data_out
                 , 
                 
                 28
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 386,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 387,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 388,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 389,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 390,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 391,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 392,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 13}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 393,
                 
                 data_out
                 , 
                 
                 13
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 394,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 395,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 17}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 396,
                 
                 data_out
                 , 
                 
                 17
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 397,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 398,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 399,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 400,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 401,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 402,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 31}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 403,
                 
                 data_out
                 , 
                 
                 31
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 404,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 405,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 406,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 407,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 408,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11101; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11101; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 409,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 410,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 26}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 411,
                 
                 data_out
                 , 
                 
                 26
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 412,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 413,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 414,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 415,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 416,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 417,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 418,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 419,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 420,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 421,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 422,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 423,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 424,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 425,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 426,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 9}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 427,
                 
                 data_out
                 , 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 428,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 429,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 430,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 19}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 431,
                 
                 data_out
                 , 
                 
                 19
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 432,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 433,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 434,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 435,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11011; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11011; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 436,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 5}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 437,
                 
                 data_out
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 438,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 439,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 440,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 441,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 442,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 443,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 444,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00011; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00011; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 445,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b101; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b101; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 446,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 447,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 448,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 449,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 450,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 451,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 11}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 452,
                 
                 data_out
                 , 
                 
                 11
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11010; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11010; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 453,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 454,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 455,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 456,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 457,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 458,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 459,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 460,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 461,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01101; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01101; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 462,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 463,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 464,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 465,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10001; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10001; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 466,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 467,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 468,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01010; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 20}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01010; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 469,
                 
                 data_out
                 , 
                 
                 20
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 470,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11000; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11000; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 471,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11110; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11110; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 472,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 473,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 474,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11100; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11100; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 475,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 476,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 477,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01001; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01001; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 478,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 479,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b010; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b010; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 480,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 481,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 482,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00000; shift_amount = 3'b110; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00000; shift_amount = 3'b110; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 483,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 484,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 7}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 485,
                 
                 data_out
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b101; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b101; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 486,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11111; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11111; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 487,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01100; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 12}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01100; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 488,
                 
                 data_out
                 , 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00001; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00001; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 489,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00101; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 8}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00101; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 490,
                 
                 data_out
                 , 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10011; shift_amount = 3'b011; direction = 1'b0; // Expected: {'data_out': 24}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10011; shift_amount = 3'b011; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 491,
                 
                 data_out
                 , 
                 
                 24
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 492,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10101; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10101; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 493,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b001; direction = 1'b1; // Expected: {'data_out': 10}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b001; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 494,
                 
                 data_out
                 , 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01111; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01111; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 495,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10110; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 22}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10110; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 496,
                 
                 data_out
                 , 
                 
                 22
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01011; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 22}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01011; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 497,
                 
                 data_out
                 , 
                 
                 22
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01000; shift_amount = 3'b010; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01000; shift_amount = 3'b010; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 498,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00100; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00100; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 499,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b01110; shift_amount = 3'b111; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b01110; shift_amount = 3'b111; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 500,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00010; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00010; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 501,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10000; shift_amount = 3'b000; direction = 1'b1; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10000; shift_amount = 3'b000; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 502,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b000; direction = 1'b0; // Expected: {'data_out': 23}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b000; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 503,
                 
                 data_out
                 , 
                 
                 23
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b11001; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 16}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b11001; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 504,
                 
                 data_out
                 , 
                 
                 16
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 505,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00111; shift_amount = 3'b001; direction = 1'b0; // Expected: {'data_out': 14}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00111; shift_amount = 3'b001; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 506,
                 
                 data_out
                 , 
                 
                 14
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b011; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b011; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 507,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10111; shift_amount = 3'b100; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10111; shift_amount = 3'b100; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 508,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10010; shift_amount = 3'b100; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10010; shift_amount = 3'b100; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 509,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b10100; shift_amount = 3'b111; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b10100; shift_amount = 3'b111; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 510,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 5'b00110; shift_amount = 3'b110; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 5'b00110; shift_amount = 3'b110; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 511,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule

`timescale 1ns / 1ps

module tb_N2_carry_save_adder;

    // Parameters
    
    parameter N = 2;
    
     
    // Inputs
    
    reg  [1:0] a;
    
    reg  [1:0] b;
    
    reg  [1:0] c;
    
    
    // Outputs
    
    wire  [2:0] result;
    
    
    // Instantiate the Unit Under Test (UUT)
    carry_save_adder  #( N ) uut (
        
        .a(a),
        
        .b(b),
        
        .c(c),
        
        
        .result(result)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        c = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 2'b01; b = 2'b11; c = 2'b11; // Expected: {'result': 7}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 0,
                 
                 result
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; c = 2'b00; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 1,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; c = 2'b10; // Expected: {'result': 7}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 2,
                 
                 result
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; c = 2'b11; // Expected: {'result': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 3,
                 
                 result
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; c = 2'b01; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 4,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; c = 2'b10; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 5,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; c = 2'b00; // Expected: {'result': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 6,
                 
                 result
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; c = 2'b00; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 7,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; c = 2'b11; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 8,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; c = 2'b10; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 9,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; c = 2'b01; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 10,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; c = 2'b10; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 11,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; c = 2'b01; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 12,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; c = 2'b11; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 13,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; c = 2'b01; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 14,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; c = 2'b11; // Expected: {'result': 7}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 15,
                 
                 result
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; c = 2'b00; // Expected: {'result': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 16,
                 
                 result
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; c = 2'b01; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 17,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; c = 2'b00; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 18,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; c = 2'b01; // Expected: {'result': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 19,
                 
                 result
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; c = 2'b10; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 20,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; c = 2'b10; // Expected: {'result': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 21,
                 
                 result
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; c = 2'b00; // Expected: {'result': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 22,
                 
                 result
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; c = 2'b01; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 23,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; c = 2'b11; // Expected: {'result': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 24,
                 
                 result
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; c = 2'b01; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 25,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; c = 2'b10; // Expected: {'result': 7}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 26,
                 
                 result
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; c = 2'b11; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 27,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; c = 2'b10; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 28,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; c = 2'b10; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 29,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; c = 2'b01; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 30,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; c = 2'b01; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 31,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; c = 2'b01; // Expected: {'result': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 32,
                 
                 result
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; c = 2'b10; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 33,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; c = 2'b00; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 34,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; c = 2'b00; // Expected: {'result': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 35,
                 
                 result
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; c = 2'b01; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 36,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; c = 2'b11; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 37,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; c = 2'b11; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 38,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; c = 2'b01; // Expected: {'result': 7}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 39,
                 
                 result
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; c = 2'b00; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 40,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; c = 2'b01; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 41,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; c = 2'b10; // Expected: {'result': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 42,
                 
                 result
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; c = 2'b10; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 43,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; c = 2'b00; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 44,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; c = 2'b11; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 45,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; c = 2'b11; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 46,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; c = 2'b10; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 47,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; c = 2'b11; // Expected: {'result': 7}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 48,
                 
                 result
                 , 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; c = 2'b11; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 49,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; c = 2'b10; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 50,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; c = 2'b00; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 51,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; c = 2'b00; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 52,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; c = 2'b00; // Expected: {'result': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 53,
                 
                 result
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; c = 2'b00; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 54,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; c = 2'b11; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 55,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; c = 2'b00; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 56,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; c = 2'b01; // Expected: {'result': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 57,
                 
                 result
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; c = 2'b11; // Expected: {'result': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 58,
                 
                 result
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; c = 2'b10; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 59,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; c = 2'b10; // Expected: {'result': 4}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; c = 2'b10; | Outputs: result=%b | Expected: result=%d",
                 60,
                 
                 result
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; c = 2'b01; // Expected: {'result': 6}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; c = 2'b01; | Outputs: result=%b | Expected: result=%d",
                 61,
                 
                 result
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; c = 2'b00; // Expected: {'result': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; c = 2'b00; | Outputs: result=%b | Expected: result=%d",
                 62,
                 
                 result
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; c = 2'b11; // Expected: {'result': 5}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; c = 2'b11; | Outputs: result=%b | Expected: result=%d",
                 63,
                 
                 result
                 , 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
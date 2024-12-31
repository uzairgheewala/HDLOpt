
`timescale 1ns / 1ps

module tb_N2_carry_save_adder_l2;

    // Parameters
    
    parameter N = 2;
    
     
    // Inputs
    
    reg  [1:0] a;
    
    reg  [1:0] b;
    
    reg  [1:0] c;
    
    
    // Outputs
    
    wire  [1:0] sum;
    
    wire  [1:0] carry;
    
    
    // Instantiate the Unit Under Test (UUT)
    carry_save_adder_l2  #( N ) uut (
        
        .a(a),
        
        .b(b),
        
        .c(c),
        
        
        .sum(sum),
        
        .carry(carry)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        c = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 2'b10; b = 2'b11; c = 2'b10; // Expected: {'sum': 3, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 0,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; c = 2'b00; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 1,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; c = 2'b11; // Expected: {'sum': 3, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 2,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; c = 2'b11; // Expected: {'sum': 2, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 3,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; c = 2'b01; // Expected: {'sum': 3, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 4,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; c = 2'b10; // Expected: {'sum': 2, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 5,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; c = 2'b11; // Expected: {'sum': 3, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 6,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; c = 2'b10; // Expected: {'sum': 0, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 7,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; c = 2'b00; // Expected: {'sum': 0, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 8,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; c = 2'b10; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 9,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; c = 2'b01; // Expected: {'sum': 3, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 10,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; c = 2'b00; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 11,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; c = 2'b01; // Expected: {'sum': 0, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 12,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; c = 2'b11; // Expected: {'sum': 1, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 13,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; c = 2'b10; // Expected: {'sum': 3, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 14,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; c = 2'b01; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 15,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; c = 2'b00; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 16,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; c = 2'b00; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 17,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; c = 2'b01; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 18,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; c = 2'b11; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 19,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; c = 2'b00; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 20,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; c = 2'b10; // Expected: {'sum': 0, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 21,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; c = 2'b01; // Expected: {'sum': 1, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 22,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; c = 2'b00; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 23,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; c = 2'b11; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 24,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; c = 2'b00; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 25,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; c = 2'b10; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 26,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; c = 2'b00; // Expected: {'sum': 2, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 27,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; c = 2'b11; // Expected: {'sum': 2, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 28,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; c = 2'b10; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 29,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; c = 2'b10; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 30,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; c = 2'b00; // Expected: {'sum': 1, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 31,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; c = 2'b11; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 32,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; c = 2'b00; // Expected: {'sum': 2, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 33,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; c = 2'b01; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 34,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; c = 2'b10; // Expected: {'sum': 2, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 35,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; c = 2'b11; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 36,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; c = 2'b01; // Expected: {'sum': 1, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 37,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; c = 2'b00; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 38,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; c = 2'b01; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 39,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; c = 2'b11; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 40,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; c = 2'b01; // Expected: {'sum': 0, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 41,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; c = 2'b11; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 42,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; c = 2'b10; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 43,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; c = 2'b01; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 44,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; c = 2'b10; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 45,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; c = 2'b01; // Expected: {'sum': 1, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 46,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; c = 2'b10; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 47,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; c = 2'b00; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 48,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; c = 2'b11; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 49,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; c = 2'b01; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 50,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; c = 2'b01; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 51,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; c = 2'b00; // Expected: {'sum': 1, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 52,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; c = 2'b01; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 53,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; c = 2'b11; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 54,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; c = 2'b10; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 55,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; c = 2'b11; // Expected: {'sum': 3, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 56,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; c = 2'b00; // Expected: {'sum': 0, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 57,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; c = 2'b10; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 58,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; c = 2'b01; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; c = 2'b01; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 59,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; c = 2'b10; // Expected: {'sum': 2, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; c = 2'b10; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 60,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; c = 2'b11; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 61,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; c = 2'b00; // Expected: {'sum': 0, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; c = 2'b00; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 62,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; c = 2'b11; // Expected: {'sum': 1, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; c = 2'b11; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 63,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
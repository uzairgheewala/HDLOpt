
`timescale 1ns / 1ps

module tb_N3_carry_save_adder_l2;

    // Parameters
    
    parameter N = 3;
    
     
    // Inputs
    
    reg  [2:0] a;
    
    reg  [2:0] b;
    
    reg  [2:0] c;
    
    
    // Outputs
    
    wire  [2:0] sum;
    
    wire  [2:0] carry;
    
    
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
        
        a = 3'b011; b = 3'b011; c = 3'b110; // Expected: {'sum': 6, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 0,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; c = 3'b101; // Expected: {'sum': 4, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 1,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; c = 3'b111; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 2,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; c = 3'b111; // Expected: {'sum': 2, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 3,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; c = 3'b100; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 4,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; c = 3'b000; // Expected: {'sum': 4, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 5,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; c = 3'b100; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 6,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; c = 3'b100; // Expected: {'sum': 5, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 7,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; c = 3'b000; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 8,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; c = 3'b001; // Expected: {'sum': 0, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 9,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; c = 3'b010; // Expected: {'sum': 6, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 10,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; c = 3'b100; // Expected: {'sum': 2, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 11,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; c = 3'b111; // Expected: {'sum': 5, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 12,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; c = 3'b111; // Expected: {'sum': 7, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 13,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; c = 3'b001; // Expected: {'sum': 0, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 14,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; c = 3'b111; // Expected: {'sum': 4, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 15,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; c = 3'b101; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 16,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; c = 3'b101; // Expected: {'sum': 3, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 17,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; c = 3'b001; // Expected: {'sum': 3, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 18,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; c = 3'b100; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 19,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; c = 3'b010; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 20,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; c = 3'b111; // Expected: {'sum': 1, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 21,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; c = 3'b010; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 22,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; c = 3'b110; // Expected: {'sum': 3, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 23,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; c = 3'b111; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 24,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; c = 3'b100; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 25,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; c = 3'b000; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 26,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; c = 3'b111; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 27,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; c = 3'b110; // Expected: {'sum': 0, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 28,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; c = 3'b000; // Expected: {'sum': 5, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 29,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; c = 3'b011; // Expected: {'sum': 3, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 30,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; c = 3'b011; // Expected: {'sum': 7, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 31,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; c = 3'b010; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 32,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; c = 3'b001; // Expected: {'sum': 3, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 33,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; c = 3'b100; // Expected: {'sum': 7, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 34,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; c = 3'b101; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 35,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; c = 3'b001; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 36,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; c = 3'b000; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 37,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; c = 3'b110; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 38,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; c = 3'b010; // Expected: {'sum': 6, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 39,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; c = 3'b000; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 40,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; c = 3'b000; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 41,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; c = 3'b000; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 42,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; c = 3'b110; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 43,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; c = 3'b010; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 44,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; c = 3'b000; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 45,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; c = 3'b100; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 46,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; c = 3'b001; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 47,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; c = 3'b101; // Expected: {'sum': 5, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 48,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; c = 3'b101; // Expected: {'sum': 7, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 49,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; c = 3'b100; // Expected: {'sum': 6, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 50,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; c = 3'b011; // Expected: {'sum': 2, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 51,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; c = 3'b010; // Expected: {'sum': 6, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 52,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; c = 3'b111; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 53,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; c = 3'b101; // Expected: {'sum': 0, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 54,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; c = 3'b010; // Expected: {'sum': 3, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 55,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; c = 3'b111; // Expected: {'sum': 4, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 56,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; c = 3'b001; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 57,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; c = 3'b000; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 58,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; c = 3'b111; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 59,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; c = 3'b110; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 60,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; c = 3'b111; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 61,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; c = 3'b010; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 62,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; c = 3'b001; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 63,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; c = 3'b010; // Expected: {'sum': 2, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 64,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; c = 3'b111; // Expected: {'sum': 3, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 65,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; c = 3'b010; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 66,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; c = 3'b000; // Expected: {'sum': 1, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 67,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; c = 3'b100; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 68,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; c = 3'b101; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 69,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; c = 3'b011; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 70,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; c = 3'b101; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 71,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; c = 3'b000; // Expected: {'sum': 2, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 72,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; c = 3'b101; // Expected: {'sum': 6, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 73,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; c = 3'b101; // Expected: {'sum': 5, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 74,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; c = 3'b001; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 75,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; c = 3'b111; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 76,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; c = 3'b101; // Expected: {'sum': 5, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 77,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; c = 3'b110; // Expected: {'sum': 4, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 78,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; c = 3'b110; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 79,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; c = 3'b001; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 80,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; c = 3'b100; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 81,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; c = 3'b010; // Expected: {'sum': 0, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 82,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; c = 3'b010; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 83,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; c = 3'b011; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 84,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; c = 3'b011; // Expected: {'sum': 5, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 85,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; c = 3'b111; // Expected: {'sum': 7, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 86,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; c = 3'b010; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 87,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; c = 3'b001; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 88,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; c = 3'b001; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 89,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; c = 3'b010; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 90,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; c = 3'b010; // Expected: {'sum': 4, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 91,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; c = 3'b001; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 92,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; c = 3'b010; // Expected: {'sum': 3, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 93,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; c = 3'b011; // Expected: {'sum': 2, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 94,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; c = 3'b111; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 95,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; c = 3'b001; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 96,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; c = 3'b000; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 97,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; c = 3'b010; // Expected: {'sum': 0, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 98,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; c = 3'b111; // Expected: {'sum': 6, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 99,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; c = 3'b111; // Expected: {'sum': 5, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 100,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; c = 3'b000; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 101,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; c = 3'b001; // Expected: {'sum': 7, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 102,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; c = 3'b110; // Expected: {'sum': 5, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 103,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; c = 3'b000; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 104,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; c = 3'b111; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 105,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; c = 3'b111; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 106,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; c = 3'b011; // Expected: {'sum': 7, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 107,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; c = 3'b000; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 108,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; c = 3'b001; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 109,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; c = 3'b101; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 110,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; c = 3'b111; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 111,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; c = 3'b110; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 112,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; c = 3'b010; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 113,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; c = 3'b101; // Expected: {'sum': 0, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 114,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; c = 3'b111; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 115,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; c = 3'b001; // Expected: {'sum': 5, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 116,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; c = 3'b000; // Expected: {'sum': 5, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 117,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; c = 3'b000; // Expected: {'sum': 5, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 118,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; c = 3'b111; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 119,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; c = 3'b110; // Expected: {'sum': 2, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 120,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; c = 3'b001; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 121,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; c = 3'b100; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 122,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; c = 3'b110; // Expected: {'sum': 7, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 123,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; c = 3'b100; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 124,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; c = 3'b011; // Expected: {'sum': 3, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 125,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; c = 3'b110; // Expected: {'sum': 2, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 126,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; c = 3'b110; // Expected: {'sum': 3, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 127,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; c = 3'b110; // Expected: {'sum': 4, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 128,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; c = 3'b011; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 129,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; c = 3'b011; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 130,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; c = 3'b010; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 131,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; c = 3'b110; // Expected: {'sum': 2, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 132,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; c = 3'b001; // Expected: {'sum': 1, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 133,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; c = 3'b100; // Expected: {'sum': 0, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 134,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; c = 3'b110; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 135,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; c = 3'b101; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 136,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; c = 3'b100; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 137,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; c = 3'b101; // Expected: {'sum': 5, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 138,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; c = 3'b100; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 139,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; c = 3'b011; // Expected: {'sum': 1, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 140,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; c = 3'b100; // Expected: {'sum': 6, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 141,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; c = 3'b100; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 142,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; c = 3'b011; // Expected: {'sum': 2, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 143,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; c = 3'b011; // Expected: {'sum': 7, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 144,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; c = 3'b111; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 145,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; c = 3'b000; // Expected: {'sum': 2, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 146,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; c = 3'b101; // Expected: {'sum': 3, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 147,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; c = 3'b001; // Expected: {'sum': 7, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 148,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; c = 3'b010; // Expected: {'sum': 4, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 149,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; c = 3'b000; // Expected: {'sum': 0, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 150,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; c = 3'b111; // Expected: {'sum': 6, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 151,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; c = 3'b100; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 152,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; c = 3'b011; // Expected: {'sum': 3, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 153,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; c = 3'b111; // Expected: {'sum': 5, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 154,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; c = 3'b111; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 155,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; c = 3'b000; // Expected: {'sum': 1, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 156,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; c = 3'b011; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 157,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; c = 3'b011; // Expected: {'sum': 1, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 158,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; c = 3'b010; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 159,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; c = 3'b101; // Expected: {'sum': 1, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 160,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; c = 3'b011; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 161,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; c = 3'b000; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 162,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; c = 3'b001; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 163,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; c = 3'b110; // Expected: {'sum': 6, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 164,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; c = 3'b011; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 165,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; c = 3'b110; // Expected: {'sum': 6, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 166,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; c = 3'b001; // Expected: {'sum': 5, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 167,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; c = 3'b010; // Expected: {'sum': 2, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 168,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; c = 3'b100; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 169,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; c = 3'b000; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 170,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; c = 3'b100; // Expected: {'sum': 0, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 171,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; c = 3'b000; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 172,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; c = 3'b010; // Expected: {'sum': 0, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 173,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; c = 3'b101; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 174,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; c = 3'b101; // Expected: {'sum': 1, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 175,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; c = 3'b001; // Expected: {'sum': 5, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 176,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; c = 3'b000; // Expected: {'sum': 4, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 177,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; c = 3'b100; // Expected: {'sum': 5, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 178,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; c = 3'b000; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 179,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; c = 3'b000; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 180,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; c = 3'b011; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 181,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; c = 3'b110; // Expected: {'sum': 3, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 182,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; c = 3'b100; // Expected: {'sum': 1, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 183,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; c = 3'b101; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 184,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; c = 3'b010; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 185,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; c = 3'b101; // Expected: {'sum': 4, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 186,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; c = 3'b011; // Expected: {'sum': 1, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 187,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; c = 3'b001; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 188,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; c = 3'b101; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 189,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; c = 3'b011; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 190,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; c = 3'b100; // Expected: {'sum': 4, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 191,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; c = 3'b111; // Expected: {'sum': 3, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 192,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; c = 3'b101; // Expected: {'sum': 5, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 193,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; c = 3'b011; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 194,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; c = 3'b111; // Expected: {'sum': 2, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 195,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; c = 3'b001; // Expected: {'sum': 4, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 196,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; c = 3'b100; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 197,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; c = 3'b010; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 198,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; c = 3'b010; // Expected: {'sum': 6, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 199,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; c = 3'b100; // Expected: {'sum': 4, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 200,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; c = 3'b100; // Expected: {'sum': 1, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 201,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; c = 3'b001; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 202,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; c = 3'b010; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 203,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; c = 3'b111; // Expected: {'sum': 5, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 204,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; c = 3'b110; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 205,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; c = 3'b010; // Expected: {'sum': 6, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 206,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; c = 3'b110; // Expected: {'sum': 2, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 207,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; c = 3'b010; // Expected: {'sum': 7, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 208,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; c = 3'b110; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 209,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; c = 3'b010; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 210,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; c = 3'b011; // Expected: {'sum': 7, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 211,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; c = 3'b100; // Expected: {'sum': 7, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 212,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; c = 3'b011; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 213,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; c = 3'b011; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 214,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; c = 3'b010; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 215,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; c = 3'b100; // Expected: {'sum': 6, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 216,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; c = 3'b101; // Expected: {'sum': 1, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 217,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; c = 3'b100; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 218,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; c = 3'b001; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 219,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; c = 3'b100; // Expected: {'sum': 2, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 220,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; c = 3'b101; // Expected: {'sum': 6, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 221,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; c = 3'b000; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 222,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; c = 3'b001; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 223,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; c = 3'b110; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 224,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; c = 3'b101; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 225,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; c = 3'b111; // Expected: {'sum': 7, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 226,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; c = 3'b100; // Expected: {'sum': 0, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 227,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; c = 3'b010; // Expected: {'sum': 6, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 228,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; c = 3'b001; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 229,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; c = 3'b101; // Expected: {'sum': 7, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 230,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; c = 3'b011; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 231,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; c = 3'b110; // Expected: {'sum': 6, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 232,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; c = 3'b001; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 233,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; c = 3'b011; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 234,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; c = 3'b100; // Expected: {'sum': 6, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 235,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; c = 3'b000; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 236,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; c = 3'b111; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 237,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; c = 3'b011; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 238,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; c = 3'b101; // Expected: {'sum': 5, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 239,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; c = 3'b111; // Expected: {'sum': 2, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 240,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; c = 3'b001; // Expected: {'sum': 5, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 241,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; c = 3'b100; // Expected: {'sum': 5, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 242,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; c = 3'b001; // Expected: {'sum': 1, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 243,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; c = 3'b100; // Expected: {'sum': 4, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 244,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; c = 3'b000; // Expected: {'sum': 0, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 245,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; c = 3'b100; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 246,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; c = 3'b110; // Expected: {'sum': 2, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 247,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; c = 3'b111; // Expected: {'sum': 1, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 248,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; c = 3'b001; // Expected: {'sum': 1, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 249,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; c = 3'b110; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 250,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; c = 3'b001; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 251,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; c = 3'b110; // Expected: {'sum': 7, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 252,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; c = 3'b011; // Expected: {'sum': 3, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 253,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; c = 3'b111; // Expected: {'sum': 1, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 254,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; c = 3'b110; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 255,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; c = 3'b110; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 256,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; c = 3'b000; // Expected: {'sum': 0, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 257,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; c = 3'b010; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 258,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; c = 3'b100; // Expected: {'sum': 4, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 259,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; c = 3'b000; // Expected: {'sum': 4, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 260,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; c = 3'b011; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 261,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; c = 3'b000; // Expected: {'sum': 6, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 262,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; c = 3'b110; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 263,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; c = 3'b000; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 264,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; c = 3'b110; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 265,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; c = 3'b010; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 266,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; c = 3'b000; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 267,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; c = 3'b000; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 268,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; c = 3'b100; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 269,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; c = 3'b100; // Expected: {'sum': 4, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 270,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; c = 3'b100; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 271,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; c = 3'b001; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 272,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; c = 3'b101; // Expected: {'sum': 3, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 273,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; c = 3'b011; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 274,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; c = 3'b010; // Expected: {'sum': 2, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 275,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; c = 3'b011; // Expected: {'sum': 1, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 276,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; c = 3'b010; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 277,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; c = 3'b001; // Expected: {'sum': 4, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 278,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; c = 3'b110; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 279,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; c = 3'b110; // Expected: {'sum': 7, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 280,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; c = 3'b011; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 281,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; c = 3'b000; // Expected: {'sum': 4, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 282,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; c = 3'b110; // Expected: {'sum': 0, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 283,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; c = 3'b111; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 284,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; c = 3'b111; // Expected: {'sum': 5, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 285,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; c = 3'b101; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 286,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; c = 3'b110; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 287,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; c = 3'b001; // Expected: {'sum': 0, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 288,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; c = 3'b011; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 289,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; c = 3'b100; // Expected: {'sum': 7, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 290,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; c = 3'b001; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 291,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; c = 3'b110; // Expected: {'sum': 5, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 292,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; c = 3'b000; // Expected: {'sum': 5, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 293,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; c = 3'b000; // Expected: {'sum': 0, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 294,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; c = 3'b100; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 295,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; c = 3'b100; // Expected: {'sum': 0, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 296,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; c = 3'b111; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 297,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; c = 3'b111; // Expected: {'sum': 6, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 298,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; c = 3'b110; // Expected: {'sum': 7, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 299,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; c = 3'b100; // Expected: {'sum': 4, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 300,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; c = 3'b100; // Expected: {'sum': 0, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 301,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; c = 3'b001; // Expected: {'sum': 7, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 302,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; c = 3'b111; // Expected: {'sum': 7, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 303,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; c = 3'b001; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 304,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; c = 3'b000; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 305,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; c = 3'b101; // Expected: {'sum': 3, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 306,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; c = 3'b111; // Expected: {'sum': 7, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 307,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; c = 3'b110; // Expected: {'sum': 0, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 308,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; c = 3'b011; // Expected: {'sum': 5, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 309,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; c = 3'b100; // Expected: {'sum': 5, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 310,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; c = 3'b000; // Expected: {'sum': 0, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 311,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; c = 3'b011; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 312,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; c = 3'b010; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 313,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; c = 3'b011; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 314,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; c = 3'b101; // Expected: {'sum': 1, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 315,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; c = 3'b111; // Expected: {'sum': 6, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 316,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; c = 3'b110; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 317,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; c = 3'b000; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 318,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; c = 3'b001; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 319,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; c = 3'b000; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 320,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; c = 3'b010; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 321,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; c = 3'b110; // Expected: {'sum': 5, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 322,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; c = 3'b010; // Expected: {'sum': 2, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 323,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; c = 3'b101; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 324,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; c = 3'b010; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 325,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; c = 3'b101; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 326,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; c = 3'b001; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 327,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; c = 3'b111; // Expected: {'sum': 6, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 328,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; c = 3'b100; // Expected: {'sum': 6, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 329,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; c = 3'b110; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 330,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; c = 3'b101; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 331,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; c = 3'b101; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 332,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; c = 3'b010; // Expected: {'sum': 7, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 333,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; c = 3'b110; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 334,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; c = 3'b110; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 335,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; c = 3'b010; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 336,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; c = 3'b001; // Expected: {'sum': 4, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 337,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; c = 3'b101; // Expected: {'sum': 4, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 338,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; c = 3'b111; // Expected: {'sum': 3, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 339,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; c = 3'b101; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 340,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; c = 3'b100; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 341,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; c = 3'b101; // Expected: {'sum': 0, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 342,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; c = 3'b111; // Expected: {'sum': 3, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 343,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; c = 3'b000; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 344,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; c = 3'b000; // Expected: {'sum': 2, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 345,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; c = 3'b011; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 346,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; c = 3'b110; // Expected: {'sum': 6, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 347,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; c = 3'b001; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 348,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; c = 3'b101; // Expected: {'sum': 7, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 349,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; c = 3'b001; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 350,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; c = 3'b100; // Expected: {'sum': 5, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 351,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; c = 3'b000; // Expected: {'sum': 4, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 352,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; c = 3'b111; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 353,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; c = 3'b011; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 354,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; c = 3'b010; // Expected: {'sum': 7, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 355,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; c = 3'b101; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 356,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; c = 3'b011; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 357,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; c = 3'b011; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 358,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; c = 3'b000; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 359,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; c = 3'b100; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 360,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; c = 3'b111; // Expected: {'sum': 2, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 361,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; c = 3'b001; // Expected: {'sum': 0, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 362,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; c = 3'b101; // Expected: {'sum': 4, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 363,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; c = 3'b101; // Expected: {'sum': 4, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 364,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; c = 3'b001; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 365,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; c = 3'b100; // Expected: {'sum': 1, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 366,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; c = 3'b000; // Expected: {'sum': 0, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 367,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; c = 3'b000; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 368,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; c = 3'b100; // Expected: {'sum': 6, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 369,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; c = 3'b110; // Expected: {'sum': 3, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 370,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; c = 3'b101; // Expected: {'sum': 0, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 371,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; c = 3'b100; // Expected: {'sum': 1, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 372,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; c = 3'b100; // Expected: {'sum': 2, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 373,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; c = 3'b100; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 374,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; c = 3'b011; // Expected: {'sum': 3, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 375,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; c = 3'b111; // Expected: {'sum': 7, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 376,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; c = 3'b001; // Expected: {'sum': 1, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 377,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; c = 3'b101; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 378,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; c = 3'b100; // Expected: {'sum': 0, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 379,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; c = 3'b010; // Expected: {'sum': 2, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 380,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; c = 3'b011; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 381,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; c = 3'b110; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 382,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; c = 3'b000; // Expected: {'sum': 6, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 383,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; c = 3'b000; // Expected: {'sum': 2, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 384,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; c = 3'b000; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 385,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; c = 3'b110; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 386,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; c = 3'b110; // Expected: {'sum': 4, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 387,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; c = 3'b011; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 388,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; c = 3'b111; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 389,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; c = 3'b001; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 390,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; c = 3'b110; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 391,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; c = 3'b010; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 392,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; c = 3'b011; // Expected: {'sum': 7, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 393,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; c = 3'b011; // Expected: {'sum': 6, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 394,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; c = 3'b001; // Expected: {'sum': 3, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 395,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; c = 3'b101; // Expected: {'sum': 7, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 396,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; c = 3'b110; // Expected: {'sum': 4, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 397,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; c = 3'b110; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 398,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; c = 3'b010; // Expected: {'sum': 2, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 399,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; c = 3'b000; // Expected: {'sum': 6, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 400,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; c = 3'b100; // Expected: {'sum': 5, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 401,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; c = 3'b001; // Expected: {'sum': 1, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 402,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; c = 3'b101; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 403,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; c = 3'b001; // Expected: {'sum': 5, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 404,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; c = 3'b011; // Expected: {'sum': 6, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 405,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; c = 3'b010; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 406,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; c = 3'b000; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 407,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; c = 3'b101; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 408,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; c = 3'b100; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 409,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; c = 3'b010; // Expected: {'sum': 7, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 410,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; c = 3'b100; // Expected: {'sum': 2, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 411,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; c = 3'b100; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 412,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; c = 3'b110; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 413,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; c = 3'b011; // Expected: {'sum': 3, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 414,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; c = 3'b001; // Expected: {'sum': 7, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 415,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; c = 3'b011; // Expected: {'sum': 6, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 416,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; c = 3'b110; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 417,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; c = 3'b000; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 418,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; c = 3'b111; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 419,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; c = 3'b001; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 420,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; c = 3'b000; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 421,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; c = 3'b000; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 422,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; c = 3'b011; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 423,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; c = 3'b101; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 424,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; c = 3'b001; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 425,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; c = 3'b110; // Expected: {'sum': 4, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 426,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; c = 3'b011; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 427,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; c = 3'b101; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 428,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; c = 3'b101; // Expected: {'sum': 6, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 429,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; c = 3'b110; // Expected: {'sum': 2, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 430,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; c = 3'b100; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 431,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; c = 3'b001; // Expected: {'sum': 2, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 432,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; c = 3'b011; // Expected: {'sum': 3, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 433,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; c = 3'b101; // Expected: {'sum': 7, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 434,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; c = 3'b111; // Expected: {'sum': 6, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 435,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; c = 3'b001; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 436,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; c = 3'b111; // Expected: {'sum': 4, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 437,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; c = 3'b010; // Expected: {'sum': 4, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 438,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; c = 3'b011; // Expected: {'sum': 0, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 439,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; c = 3'b110; // Expected: {'sum': 5, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 440,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; c = 3'b110; // Expected: {'sum': 4, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 441,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; c = 3'b010; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 442,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; c = 3'b101; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 443,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; c = 3'b010; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 444,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; c = 3'b011; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 445,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; c = 3'b011; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 446,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; c = 3'b111; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 447,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; c = 3'b001; // Expected: {'sum': 4, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 448,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; c = 3'b000; // Expected: {'sum': 4, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 449,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; c = 3'b011; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 450,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; c = 3'b001; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 451,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; c = 3'b001; // Expected: {'sum': 5, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 452,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; c = 3'b111; // Expected: {'sum': 4, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 453,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; c = 3'b001; // Expected: {'sum': 3, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 454,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; c = 3'b101; // Expected: {'sum': 1, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 455,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; c = 3'b100; // Expected: {'sum': 4, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 456,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; c = 3'b110; // Expected: {'sum': 6, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 457,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; c = 3'b111; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 458,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; c = 3'b000; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 459,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; c = 3'b000; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 460,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; c = 3'b111; // Expected: {'sum': 3, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 461,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; c = 3'b000; // Expected: {'sum': 1, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 462,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; c = 3'b011; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 463,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; c = 3'b101; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 464,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; c = 3'b111; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 465,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; c = 3'b110; // Expected: {'sum': 0, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 466,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; c = 3'b101; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 467,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; c = 3'b111; // Expected: {'sum': 3, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 468,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; c = 3'b010; // Expected: {'sum': 0, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 469,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; c = 3'b111; // Expected: {'sum': 1, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 470,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; c = 3'b100; // Expected: {'sum': 7, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 471,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; c = 3'b010; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 472,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; c = 3'b011; // Expected: {'sum': 5, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 473,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; c = 3'b101; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 474,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; c = 3'b001; // Expected: {'sum': 1, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 475,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; c = 3'b011; // Expected: {'sum': 2, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 476,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; c = 3'b111; // Expected: {'sum': 5, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 477,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; c = 3'b101; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 478,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; c = 3'b011; // Expected: {'sum': 7, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 479,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; c = 3'b111; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 480,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; c = 3'b011; // Expected: {'sum': 5, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 481,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; c = 3'b110; // Expected: {'sum': 6, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 482,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; c = 3'b101; // Expected: {'sum': 1, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 483,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; c = 3'b110; // Expected: {'sum': 7, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 484,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; c = 3'b101; // Expected: {'sum': 5, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 485,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; c = 3'b010; // Expected: {'sum': 4, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 486,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; c = 3'b010; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 487,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; c = 3'b111; // Expected: {'sum': 0, 'carry': 7}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 488,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; c = 3'b111; // Expected: {'sum': 7, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 489,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; c = 3'b010; // Expected: {'sum': 3, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 490,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; c = 3'b010; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 491,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; c = 3'b010; // Expected: {'sum': 1, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 492,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; c = 3'b101; // Expected: {'sum': 6, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 493,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; c = 3'b110; // Expected: {'sum': 5, 'carry': 2}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 494,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 5, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; c = 3'b101; // Expected: {'sum': 4, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 495,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; c = 3'b010; // Expected: {'sum': 3, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 496,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; c = 3'b010; // Expected: {'sum': 4, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 497,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 4, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; c = 3'b011; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 498,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; c = 3'b110; // Expected: {'sum': 7, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; c = 3'b110; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 499,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; c = 3'b111; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; c = 3'b111; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 500,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; c = 3'b101; // Expected: {'sum': 7, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; c = 3'b101; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 501,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; c = 3'b000; // Expected: {'sum': 3, 'carry': 4}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 502,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 3, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; c = 3'b010; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 503,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; c = 3'b011; // Expected: {'sum': 6, 'carry': 3}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; c = 3'b011; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 504,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; c = 3'b001; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 505,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; c = 3'b000; // Expected: {'sum': 1, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 506,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; c = 3'b000; // Expected: {'sum': 6, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; c = 3'b000; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 507,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; c = 3'b100; // Expected: {'sum': 1, 'carry': 6}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; c = 3'b100; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 508,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; c = 3'b010; // Expected: {'sum': 6, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 509,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; c = 3'b010; // Expected: {'sum': 7, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; c = 3'b010; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 510,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; c = 3'b001; // Expected: {'sum': 2, 'carry': 5}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; c = 3'b001; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 511,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 2, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
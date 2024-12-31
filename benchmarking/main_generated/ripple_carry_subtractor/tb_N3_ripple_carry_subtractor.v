
`timescale 1ns / 1ps

module tb_N3_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 3;
    
     
    // Inputs
    
    reg  [2:0] a;
    
    reg  [2:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [2:0] diff;
    
    wire   bout;
    
    
    // Instantiate the Unit Under Test (UUT)
    ripple_carry_subtractor  #( N ) uut (
        
        .a(a),
        
        .b(b),
        
        .bin(bin),
        
        
        .diff(diff),
        
        .bout(bout)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        bin = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 3'b101; b = 3'b110; bin = 1'b0; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; bin = 1'b1; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; bin = 1'b0; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; bin = 1'b1; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; bin = 1'b1; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; bin = 1'b1; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; bin = 1'b0; // Expected: {'diff': 1, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; bin = 1'b0; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; bin = 1'b0; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; bin = 1'b1; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; bin = 1'b0; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; bin = 1'b0; // Expected: {'diff': 4, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; bin = 1'b1; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; bin = 1'b0; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; bin = 1'b1; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; bin = 1'b1; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; bin = 1'b1; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; bin = 1'b1; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; bin = 1'b1; // Expected: {'diff': 1, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; bin = 1'b1; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; bin = 1'b0; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; bin = 1'b0; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; bin = 1'b1; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; bin = 1'b1; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; bin = 1'b0; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; bin = 1'b0; // Expected: {'diff': 4, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; bin = 1'b0; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; bin = 1'b1; // Expected: {'diff': 1, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; bin = 1'b0; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; bin = 1'b0; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; bin = 1'b1; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; bin = 1'b1; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; bin = 1'b0; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; bin = 1'b0; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; bin = 1'b1; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; bin = 1'b1; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; bin = 1'b0; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; bin = 1'b1; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; bin = 1'b1; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; bin = 1'b1; // Expected: {'diff': 0, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; bin = 1'b1; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; bin = 1'b0; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; bin = 1'b0; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; bin = 1'b1; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; bin = 1'b0; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; bin = 1'b1; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; bin = 1'b0; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; bin = 1'b1; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; bin = 1'b1; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; bin = 1'b0; // Expected: {'diff': 4, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; bin = 1'b0; // Expected: {'diff': 4, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; bin = 1'b1; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; bin = 1'b0; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; bin = 1'b1; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; bin = 1'b0; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; bin = 1'b1; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; bin = 1'b0; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; bin = 1'b0; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; bin = 1'b1; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; bin = 1'b1; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; bin = 1'b0; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; bin = 1'b1; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; bin = 1'b1; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; bin = 1'b0; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; bin = 1'b1; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; bin = 1'b0; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; bin = 1'b1; // Expected: {'diff': 4, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; bin = 1'b1; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; bin = 1'b1; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; bin = 1'b1; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; bin = 1'b1; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; bin = 1'b1; // Expected: {'diff': 4, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; bin = 1'b0; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; bin = 1'b1; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; bin = 1'b1; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; bin = 1'b0; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; bin = 1'b1; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; bin = 1'b1; // Expected: {'diff': 4, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; bin = 1'b0; // Expected: {'diff': 5, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; bin = 1'b1; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; bin = 1'b0; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; bin = 1'b0; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; bin = 1'b1; // Expected: {'diff': 4, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; bin = 1'b0; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; bin = 1'b0; // Expected: {'diff': 6, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; bin = 1'b1; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; bin = 1'b1; // Expected: {'diff': 4, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; bin = 1'b1; // Expected: {'diff': 7, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
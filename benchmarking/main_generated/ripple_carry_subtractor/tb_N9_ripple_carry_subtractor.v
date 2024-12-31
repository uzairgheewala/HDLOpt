
`timescale 1ns / 1ps

module tb_N9_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 9;
    
     
    // Inputs
    
    reg  [8:0] a;
    
    reg  [8:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [8:0] diff;
    
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
        
        a = 9'b111101110; b = 9'b001001101; bin = 1'b0; // Expected: {'diff': 417, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101110; b = 9'b001001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 417, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011111; b = 9'b111110111; bin = 1'b0; // Expected: {'diff': 296, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011111; b = 9'b111110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 296, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010111000; b = 9'b011111011; bin = 1'b0; // Expected: {'diff': 445, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010111000; b = 9'b011111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 445, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101100000; b = 9'b011111011; bin = 1'b0; // Expected: {'diff': 101, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101100000; b = 9'b011111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 101, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110101; b = 9'b000001101; bin = 1'b1; // Expected: {'diff': 231, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110101; b = 9'b000001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 231, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110100011; b = 9'b100100000; bin = 1'b0; // Expected: {'diff': 131, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110100011; b = 9'b100100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 131, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010001; b = 9'b001010110; bin = 1'b0; // Expected: {'diff': 507, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010001; b = 9'b001010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 507, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010101; b = 9'b000101100; bin = 1'b0; // Expected: {'diff': 233, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010101; b = 9'b000101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 233, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001100; b = 9'b000010011; bin = 1'b1; // Expected: {'diff': 504, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001100; b = 9'b000010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 504, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001011110; b = 9'b110000011; bin = 1'b0; // Expected: {'diff': 219, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001011110; b = 9'b110000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 219, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001001; b = 9'b101101110; bin = 1'b1; // Expected: {'diff': 346, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001001; b = 9'b101101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 346, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001001; b = 9'b011111111; bin = 1'b0; // Expected: {'diff': 394, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001001; b = 9'b011111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 394, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101110; b = 9'b101111101; bin = 1'b1; // Expected: {'diff': 48, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101110; b = 9'b101111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101110; b = 9'b100111111; bin = 1'b0; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101110; b = 9'b100111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001011; b = 9'b111000111; bin = 1'b0; // Expected: {'diff': 196, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001011; b = 9'b111000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 196, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101100; b = 9'b101010101; bin = 1'b0; // Expected: {'diff': 151, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101100; b = 9'b101010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 151, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001011101; b = 9'b011100111; bin = 1'b0; // Expected: {'diff': 374, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001011101; b = 9'b011100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 374, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011011; b = 9'b011010001; bin = 1'b1; // Expected: {'diff': 73, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011011; b = 9'b011010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 73, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001101; b = 9'b000010011; bin = 1'b0; // Expected: {'diff': 122, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001101; b = 9'b000010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101100100; b = 9'b110100110; bin = 1'b0; // Expected: {'diff': 446, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101100100; b = 9'b110100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 446, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001101; b = 9'b010011101; bin = 1'b0; // Expected: {'diff': 496, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001101; b = 9'b010011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 496, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110100100; b = 9'b110101001; bin = 1'b0; // Expected: {'diff': 507, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110100100; b = 9'b110101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 507, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110010; b = 9'b010101000; bin = 1'b0; // Expected: {'diff': 10, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110010; b = 9'b010101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011010100; b = 9'b010101111; bin = 1'b0; // Expected: {'diff': 37, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011010100; b = 9'b010101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101001111; b = 9'b110010101; bin = 1'b0; // Expected: {'diff': 442, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101001111; b = 9'b110010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 442, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001001; b = 9'b000000101; bin = 1'b1; // Expected: {'diff': 67, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001001; b = 9'b000000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000000111; b = 9'b000000000; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b000000111; b = 9'b000000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011110; b = 9'b101101011; bin = 1'b1; // Expected: {'diff': 434, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011110; b = 9'b101101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 434, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111111; b = 9'b010111010; bin = 1'b0; // Expected: {'diff': 325, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111111; b = 9'b010111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 325, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010010; b = 9'b100101111; bin = 1'b0; // Expected: {'diff': 291, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010010; b = 9'b100101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 291, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111010101; b = 9'b110011111; bin = 1'b0; // Expected: {'diff': 54, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111010101; b = 9'b110011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101000101; b = 9'b101001011; bin = 1'b0; // Expected: {'diff': 506, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101000101; b = 9'b101001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 506, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001001; b = 9'b010100110; bin = 1'b1; // Expected: {'diff': 34, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001001; b = 9'b010100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101001; b = 9'b010100000; bin = 1'b0; // Expected: {'diff': 201, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101001; b = 9'b010100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 201, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101000111; b = 9'b010111010; bin = 1'b1; // Expected: {'diff': 140, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101000111; b = 9'b010111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 140, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010101; b = 9'b101000011; bin = 1'b0; // Expected: {'diff': 466, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010101; b = 9'b101000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 466, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101100; b = 9'b101001110; bin = 1'b1; // Expected: {'diff': 93, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101100; b = 9'b101001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010101; b = 9'b101001101; bin = 1'b1; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010101; b = 9'b101001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010100; b = 9'b100101010; bin = 1'b1; // Expected: {'diff': 361, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010100; b = 9'b100101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 361, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101111100; b = 9'b110101011; bin = 1'b1; // Expected: {'diff': 464, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101111100; b = 9'b110101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 464, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010111; b = 9'b110100000; bin = 1'b1; // Expected: {'diff': 246, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010111; b = 9'b110100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 246, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101100; b = 9'b000100101; bin = 1'b1; // Expected: {'diff': 326, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101100; b = 9'b000100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 326, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100000010; b = 9'b101000000; bin = 1'b0; // Expected: {'diff': 450, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100000010; b = 9'b101000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 450, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001000101; b = 9'b111110000; bin = 1'b0; // Expected: {'diff': 85, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001000101; b = 9'b111110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 85, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101011; b = 9'b010011010; bin = 1'b0; // Expected: {'diff': 209, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101011; b = 9'b010011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 209, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100100000; b = 9'b010010110; bin = 1'b1; // Expected: {'diff': 137, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100100000; b = 9'b010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 137, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011110; b = 9'b110110101; bin = 1'b0; // Expected: {'diff': 489, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011110; b = 9'b110110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 489, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011111; b = 9'b011000011; bin = 1'b0; // Expected: {'diff': 220, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011111; b = 9'b011000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111100; b = 9'b110111101; bin = 1'b0; // Expected: {'diff': 191, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111100; b = 9'b110111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 191, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101111000; b = 9'b101010000; bin = 1'b0; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101111000; b = 9'b101010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111100111; b = 9'b000011001; bin = 1'b1; // Expected: {'diff': 461, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100111; b = 9'b000011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 461, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101101; b = 9'b010100000; bin = 1'b1; // Expected: {'diff': 204, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101101; b = 9'b010100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 204, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110111111; b = 9'b101100111; bin = 1'b0; // Expected: {'diff': 88, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110111111; b = 9'b101100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001000010; b = 9'b101011110; bin = 1'b0; // Expected: {'diff': 228, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001000010; b = 9'b101011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 228, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101001100; b = 9'b010110101; bin = 1'b0; // Expected: {'diff': 151, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101001100; b = 9'b010110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 151, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001011; b = 9'b101111010; bin = 1'b1; // Expected: {'diff': 208, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001011; b = 9'b101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 208, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101111011; b = 9'b110100110; bin = 1'b0; // Expected: {'diff': 469, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101111011; b = 9'b110100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 469, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111011011; b = 9'b100001100; bin = 1'b1; // Expected: {'diff': 206, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111011011; b = 9'b100001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 206, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010010; b = 9'b111111010; bin = 1'b1; // Expected: {'diff': 23, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010010; b = 9'b111111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101111010; b = 9'b011000100; bin = 1'b0; // Expected: {'diff': 182, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101111010; b = 9'b011000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 182, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100000001; b = 9'b110110010; bin = 1'b0; // Expected: {'diff': 335, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100000001; b = 9'b110110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 335, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010100; b = 9'b010000100; bin = 1'b1; // Expected: {'diff': 143, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010100; b = 9'b010000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 143, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100100010; b = 9'b100111111; bin = 1'b0; // Expected: {'diff': 483, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100100010; b = 9'b100111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 483, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110110000; b = 9'b110101000; bin = 1'b0; // Expected: {'diff': 8, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110110000; b = 9'b110101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001011; b = 9'b010011001; bin = 1'b0; // Expected: {'diff': 498, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001011; b = 9'b010011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 498, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111000011; b = 9'b101110111; bin = 1'b1; // Expected: {'diff': 75, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111000011; b = 9'b101110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110100000; b = 9'b100011011; bin = 1'b1; // Expected: {'diff': 132, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110100000; b = 9'b100011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 132, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010000; b = 9'b000110110; bin = 1'b0; // Expected: {'diff': 26, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010000; b = 9'b000110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110100011; b = 9'b011000001; bin = 1'b1; // Expected: {'diff': 225, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110100011; b = 9'b011000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 225, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100111111; b = 9'b011110111; bin = 1'b0; // Expected: {'diff': 72, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100111111; b = 9'b011110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 72, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111100001; b = 9'b110001110; bin = 1'b0; // Expected: {'diff': 83, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100001; b = 9'b110001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 83, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010011111; b = 9'b100111000; bin = 1'b0; // Expected: {'diff': 359, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010011111; b = 9'b100111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 359, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101000111; b = 9'b100011000; bin = 1'b0; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101000111; b = 9'b100011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010011; b = 9'b011010000; bin = 1'b1; // Expected: {'diff': 450, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010011; b = 9'b011010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 450, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010101111; b = 9'b100110001; bin = 1'b1; // Expected: {'diff': 381, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010101111; b = 9'b100110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 381, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110101; b = 9'b101001100; bin = 1'b0; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110101; b = 9'b101001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010100010; b = 9'b101010100; bin = 1'b0; // Expected: {'diff': 334, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010100010; b = 9'b101010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 334, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101111; b = 9'b001010111; bin = 1'b1; // Expected: {'diff': 279, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101111; b = 9'b001010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 279, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111100011; b = 9'b000110010; bin = 1'b0; // Expected: {'diff': 433, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100011; b = 9'b000110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 433, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111011; b = 9'b011111011; bin = 1'b1; // Expected: {'diff': 255, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111011; b = 9'b011111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 255, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010101100; b = 9'b110110111; bin = 1'b0; // Expected: {'diff': 245, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010101100; b = 9'b110110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 245, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001000; b = 9'b000100101; bin = 1'b0; // Expected: {'diff': 483, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001000; b = 9'b000100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 483, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000111111; b = 9'b100011010; bin = 1'b1; // Expected: {'diff': 292, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000111111; b = 9'b100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 292, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110111; b = 9'b011111110; bin = 1'b1; // Expected: {'diff': 376, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110111; b = 9'b011111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 376, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110000; b = 9'b000011011; bin = 1'b1; // Expected: {'diff': 468, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110000; b = 9'b000011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 468, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110111; b = 9'b111100010; bin = 1'b0; // Expected: {'diff': 85, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110111; b = 9'b111100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 85, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100010; b = 9'b001011110; bin = 1'b0; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100010; b = 9'b001011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110001; b = 9'b100101000; bin = 1'b1; // Expected: {'diff': 72, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110001; b = 9'b100101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 72, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110001; b = 9'b000101001; bin = 1'b1; // Expected: {'diff': 71, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110001; b = 9'b000101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 71, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011011100; b = 9'b110000011; bin = 1'b1; // Expected: {'diff': 344, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011011100; b = 9'b110000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 344, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101111110; b = 9'b100001000; bin = 1'b1; // Expected: {'diff': 117, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101111110; b = 9'b100001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 117, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111010111; b = 9'b011011000; bin = 1'b0; // Expected: {'diff': 255, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111010111; b = 9'b011011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 255, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010111000; b = 9'b001001110; bin = 1'b0; // Expected: {'diff': 106, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010111000; b = 9'b001001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 106, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001000101; b = 9'b101010000; bin = 1'b0; // Expected: {'diff': 245, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001000101; b = 9'b101010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 245, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111110; b = 9'b111000110; bin = 1'b1; // Expected: {'diff': 183, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111110; b = 9'b111000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 183, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011011; b = 9'b011110111; bin = 1'b0; // Expected: {'diff': 164, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011011; b = 9'b011110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 164, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101010; b = 9'b110111000; bin = 1'b1; // Expected: {'diff': 305, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101010; b = 9'b110111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 305, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100001; b = 9'b000001110; bin = 1'b1; // Expected: {'diff': 82, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100001; b = 9'b000001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100111; b = 9'b000100001; bin = 1'b0; // Expected: {'diff': 198, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100111; b = 9'b000100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 198, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000100110; b = 9'b011100001; bin = 1'b0; // Expected: {'diff': 325, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000100110; b = 9'b011100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 325, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100101010; b = 9'b110000010; bin = 1'b0; // Expected: {'diff': 424, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100101010; b = 9'b110000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 424, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100011; b = 9'b001001001; bin = 1'b1; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100011; b = 9'b001001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110100100; b = 9'b010101100; bin = 1'b1; // Expected: {'diff': 247, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110100100; b = 9'b010101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 247, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101010; b = 9'b101101111; bin = 1'b1; // Expected: {'diff': 122, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101010; b = 9'b101101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010101; b = 9'b111101011; bin = 1'b0; // Expected: {'diff': 362, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010101; b = 9'b111101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 362, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010000111; b = 9'b100110110; bin = 1'b1; // Expected: {'diff': 336, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010000111; b = 9'b100110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 336, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111010; b = 9'b010001100; bin = 1'b0; // Expected: {'diff': 366, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111010; b = 9'b010001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 366, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100110010; b = 9'b110001011; bin = 1'b0; // Expected: {'diff': 423, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100110010; b = 9'b110001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 423, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101111000; b = 9'b100010100; bin = 1'b0; // Expected: {'diff': 100, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101111000; b = 9'b100010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001011; b = 9'b110011000; bin = 1'b1; // Expected: {'diff': 178, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001011; b = 9'b110011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 178, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010101; b = 9'b001100110; bin = 1'b1; // Expected: {'diff': 494, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010101; b = 9'b001100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 494, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101100000; b = 9'b000110000; bin = 1'b0; // Expected: {'diff': 304, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101100000; b = 9'b000110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 304, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010111011; b = 9'b100101100; bin = 1'b1; // Expected: {'diff': 398, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010111011; b = 9'b100101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 398, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011011100; b = 9'b110011111; bin = 1'b1; // Expected: {'diff': 316, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011011100; b = 9'b110011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 316, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110111; b = 9'b110110011; bin = 1'b1; // Expected: {'diff': 323, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110111; b = 9'b110110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 323, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110101; b = 9'b110100100; bin = 1'b1; // Expected: {'diff': 208, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110101; b = 9'b110100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 208, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011010110; b = 9'b010101101; bin = 1'b0; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011010110; b = 9'b010101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010101101; b = 9'b101000100; bin = 1'b0; // Expected: {'diff': 361, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010101101; b = 9'b101000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 361, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010110; b = 9'b001000011; bin = 1'b0; // Expected: {'diff': 211, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010110; b = 9'b001000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 211, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110000; b = 9'b110101010; bin = 1'b1; // Expected: {'diff': 69, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110000; b = 9'b110101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 69, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101101; b = 9'b100010001; bin = 1'b1; // Expected: {'diff': 283, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101101; b = 9'b100010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 283, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000000101; b = 9'b110100101; bin = 1'b0; // Expected: {'diff': 96, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000000101; b = 9'b110100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011001; b = 9'b101010001; bin = 1'b1; // Expected: {'diff': 199, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011001; b = 9'b101010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 199, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100101; b = 9'b110010010; bin = 1'b1; // Expected: {'diff': 210, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100101; b = 9'b110010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 210, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110101; b = 9'b110110110; bin = 1'b0; // Expected: {'diff': 127, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110101; b = 9'b110110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 127, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111110; b = 9'b011100010; bin = 1'b1; // Expected: {'diff': 283, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111110; b = 9'b011100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 283, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110110110; b = 9'b100011010; bin = 1'b1; // Expected: {'diff': 155, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110110110; b = 9'b100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 155, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000100001; b = 9'b011001000; bin = 1'b1; // Expected: {'diff': 344, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000100001; b = 9'b011001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 344, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001101; b = 9'b000011100; bin = 1'b1; // Expected: {'diff': 496, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001101; b = 9'b000011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 496, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010111; b = 9'b010000111; bin = 1'b0; // Expected: {'diff': 208, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010111; b = 9'b010000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 208, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010011; b = 9'b000100011; bin = 1'b0; // Expected: {'diff': 112, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010011; b = 9'b000100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100010; b = 9'b000101111; bin = 1'b0; // Expected: {'diff': 179, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100010; b = 9'b000101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 179, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011000110; b = 9'b100100010; bin = 1'b1; // Expected: {'diff': 419, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011000110; b = 9'b100100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 419, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110110; b = 9'b011011101; bin = 1'b0; // Expected: {'diff': 345, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110110; b = 9'b011011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 345, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101010; b = 9'b010001111; bin = 1'b0; // Expected: {'diff': 411, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101010; b = 9'b010001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 411, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011111111; b = 9'b100101111; bin = 1'b1; // Expected: {'diff': 463, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011111111; b = 9'b100101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 463, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110111100; b = 9'b010111100; bin = 1'b1; // Expected: {'diff': 255, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110111100; b = 9'b010111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 255, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010100; b = 9'b101110000; bin = 1'b1; // Expected: {'diff': 163, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010100; b = 9'b101110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 163, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001000000; b = 9'b100111100; bin = 1'b1; // Expected: {'diff': 259, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001000000; b = 9'b100111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 259, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110011; b = 9'b101111110; bin = 1'b1; // Expected: {'diff': 180, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110011; b = 9'b101111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 180, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111001; b = 9'b100100101; bin = 1'b0; // Expected: {'diff': 212, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111001; b = 9'b100100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 212, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001110; b = 9'b010001001; bin = 1'b1; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001110; b = 9'b010001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101101; b = 9'b111110010; bin = 1'b1; // Expected: {'diff': 506, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101101; b = 9'b111110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 506, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000111010; b = 9'b010100010; bin = 1'b0; // Expected: {'diff': 408, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000111010; b = 9'b010100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 408, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011000011; b = 9'b100100011; bin = 1'b0; // Expected: {'diff': 416, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011000011; b = 9'b100100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 416, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011011; b = 9'b111011010; bin = 1'b1; // Expected: {'diff': 320, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011011; b = 9'b111011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 320, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100000110; b = 9'b100101010; bin = 1'b1; // Expected: {'diff': 475, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100000110; b = 9'b100101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 475, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001110; b = 9'b110010111; bin = 1'b1; // Expected: {'diff': 182, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001110; b = 9'b110010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 182, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011111; b = 9'b011100001; bin = 1'b1; // Expected: {'diff': 317, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011111; b = 9'b011100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 317, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011111110; b = 9'b010101111; bin = 1'b1; // Expected: {'diff': 78, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011111110; b = 9'b010101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 78, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110011; b = 9'b100100011; bin = 1'b0; // Expected: {'diff': 80, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110011; b = 9'b100100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 80, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010001; b = 9'b110000000; bin = 1'b0; // Expected: {'diff': 209, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010001; b = 9'b110000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 209, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001111; b = 9'b100111001; bin = 1'b1; // Expected: {'diff': 405, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001111; b = 9'b100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 405, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100000111; b = 9'b000001000; bin = 1'b0; // Expected: {'diff': 255, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100000111; b = 9'b000001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 255, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011011; b = 9'b101111101; bin = 1'b0; // Expected: {'diff': 30, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011011; b = 9'b101111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000111010; b = 9'b101100110; bin = 1'b0; // Expected: {'diff': 212, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000111010; b = 9'b101100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 212, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101011010; b = 9'b000011111; bin = 1'b1; // Expected: {'diff': 314, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101011010; b = 9'b000011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 314, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010110; b = 9'b100011010; bin = 1'b1; // Expected: {'diff': 379, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010110; b = 9'b100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 379, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100000100; b = 9'b111111010; bin = 1'b1; // Expected: {'diff': 265, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100000100; b = 9'b111111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 265, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010110; b = 9'b110100010; bin = 1'b1; // Expected: {'diff': 115, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010110; b = 9'b110100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 115, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101001101; b = 9'b001101010; bin = 1'b0; // Expected: {'diff': 227, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101001101; b = 9'b001101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 227, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001011; b = 9'b101000110; bin = 1'b1; // Expected: {'diff': 260, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001011; b = 9'b101000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 260, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110100011; b = 9'b001111011; bin = 1'b1; // Expected: {'diff': 295, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110100011; b = 9'b001111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 295, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010111000; b = 9'b001010100; bin = 1'b0; // Expected: {'diff': 100, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010111000; b = 9'b001010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001110; b = 9'b010011011; bin = 1'b0; // Expected: {'diff': 243, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001110; b = 9'b010011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 243, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101110; b = 9'b010010010; bin = 1'b1; // Expected: {'diff': 283, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101110; b = 9'b010010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 283, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100001; b = 9'b010010000; bin = 1'b0; // Expected: {'diff': 81, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100001; b = 9'b010010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 81, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011100; b = 9'b101010000; bin = 1'b0; // Expected: {'diff': 204, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011100; b = 9'b101010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 204, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010101; b = 9'b010110000; bin = 1'b1; // Expected: {'diff': 164, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010101; b = 9'b010110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 164, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110110110; b = 9'b010111001; bin = 1'b1; // Expected: {'diff': 252, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110110110; b = 9'b010111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 252, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011000110; b = 9'b110011110; bin = 1'b1; // Expected: {'diff': 295, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011000110; b = 9'b110011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 295, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110000; b = 9'b100101000; bin = 1'b0; // Expected: {'diff': 392, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110000; b = 9'b100101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 392, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010001; b = 9'b011100110; bin = 1'b0; // Expected: {'diff': 427, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010001; b = 9'b011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 427, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101010; b = 9'b100001100; bin = 1'b0; // Expected: {'diff': 158, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101010; b = 9'b100001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 158, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010110; b = 9'b100111001; bin = 1'b0; // Expected: {'diff': 221, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010110; b = 9'b100111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 221, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110010; b = 9'b000001100; bin = 1'b0; // Expected: {'diff': 166, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110010; b = 9'b000001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 166, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011111; b = 9'b010101011; bin = 1'b1; // Expected: {'diff': 115, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011111; b = 9'b010101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101101; b = 9'b000010010; bin = 1'b0; // Expected: {'diff': 91, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101101; b = 9'b000010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 91, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010111; b = 9'b111111001; bin = 1'b0; // Expected: {'diff': 286, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010111; b = 9'b111111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 286, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101010; b = 9'b011001111; bin = 1'b0; // Expected: {'diff': 219, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101010; b = 9'b011001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 219, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101111; b = 9'b101011010; bin = 1'b1; // Expected: {'diff': 276, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101111; b = 9'b101011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 276, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101001; b = 9'b111111010; bin = 1'b1; // Expected: {'diff': 46, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101001; b = 9'b111111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001111; b = 9'b010110111; bin = 1'b0; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001111; b = 9'b010110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110010011; b = 9'b111110000; bin = 1'b1; // Expected: {'diff': 418, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110010011; b = 9'b111110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 418, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101011010; b = 9'b100101011; bin = 1'b1; // Expected: {'diff': 46, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101011010; b = 9'b100101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011010011; b = 9'b001100110; bin = 1'b1; // Expected: {'diff': 108, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011010011; b = 9'b001100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 108, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100110010; b = 9'b010110101; bin = 1'b0; // Expected: {'diff': 125, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100110010; b = 9'b010110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 125, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110110111; b = 9'b011001111; bin = 1'b0; // Expected: {'diff': 232, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110110111; b = 9'b011001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 232, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001101; b = 9'b111111111; bin = 1'b1; // Expected: {'diff': 205, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001101; b = 9'b111111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 205, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110000; b = 9'b101001111; bin = 1'b0; // Expected: {'diff': 289, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110000; b = 9'b101001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 289, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011001; b = 9'b011001011; bin = 1'b0; // Expected: {'diff': 206, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011001; b = 9'b011001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 206, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000000111; b = 9'b101001000; bin = 1'b0; // Expected: {'diff': 191, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000000111; b = 9'b101001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 191, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010000; b = 9'b001110111; bin = 1'b1; // Expected: {'diff': 152, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010000; b = 9'b001110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 152, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010000001; b = 9'b100100001; bin = 1'b1; // Expected: {'diff': 351, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010000001; b = 9'b100100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 351, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010011000; b = 9'b111011100; bin = 1'b1; // Expected: {'diff': 187, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010011000; b = 9'b111011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 187, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010000000; b = 9'b010100101; bin = 1'b0; // Expected: {'diff': 475, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010000000; b = 9'b010100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 475, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110111001; b = 9'b001001010; bin = 1'b1; // Expected: {'diff': 366, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110111001; b = 9'b001001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 366, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110100001; b = 9'b001100101; bin = 1'b0; // Expected: {'diff': 316, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110100001; b = 9'b001100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 316, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111001; b = 9'b101110010; bin = 1'b0; // Expected: {'diff': 135, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111001; b = 9'b101110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 135, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100111100; b = 9'b101110001; bin = 1'b1; // Expected: {'diff': 458, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100111100; b = 9'b101110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 458, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110010000; b = 9'b000001100; bin = 1'b0; // Expected: {'diff': 388, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110010000; b = 9'b000001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 388, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110110; b = 9'b001001111; bin = 1'b0; // Expected: {'diff': 103, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110110; b = 9'b001001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101111100; b = 9'b111101010; bin = 1'b1; // Expected: {'diff': 401, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101111100; b = 9'b111101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 401, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100000111; b = 9'b001001101; bin = 1'b1; // Expected: {'diff': 185, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100000111; b = 9'b001001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 185, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011001; b = 9'b100001011; bin = 1'b1; // Expected: {'diff': 13, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011001; b = 9'b100001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110000; b = 9'b000110110; bin = 1'b1; // Expected: {'diff': 121, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110000; b = 9'b000110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 121, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110111; b = 9'b010101010; bin = 1'b1; // Expected: {'diff': 396, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110111; b = 9'b010101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 396, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010011; b = 9'b100000110; bin = 1'b0; // Expected: {'diff': 269, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010011; b = 9'b100000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 269, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001111; b = 9'b011100110; bin = 1'b0; // Expected: {'diff': 297, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001111; b = 9'b011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 297, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111000; b = 9'b111110000; bin = 1'b1; // Expected: {'diff': 135, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111000; b = 9'b111110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 135, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101011; b = 9'b111011101; bin = 1'b0; // Expected: {'diff': 142, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101011; b = 9'b111011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 142, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010010; b = 9'b110111010; bin = 1'b0; // Expected: {'diff': 408, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010010; b = 9'b110111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 408, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001100; b = 9'b001111010; bin = 1'b1; // Expected: {'diff': 273, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001100; b = 9'b001111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 273, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001000; b = 9'b001101011; bin = 1'b0; // Expected: {'diff': 477, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001000; b = 9'b001101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 477, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101101; b = 9'b000101111; bin = 1'b1; // Expected: {'diff': 189, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101101; b = 9'b000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 189, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110110; b = 9'b110101110; bin = 1'b1; // Expected: {'diff': 71, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110110; b = 9'b110101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 71, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100110; b = 9'b101110101; bin = 1'b0; // Expected: {'diff': 369, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100110; b = 9'b101110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 369, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101001001; b = 9'b011100111; bin = 1'b1; // Expected: {'diff': 97, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101001001; b = 9'b011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110000; b = 9'b000111011; bin = 1'b0; // Expected: {'diff': 117, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110000; b = 9'b000111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 117, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001000101; b = 9'b100100111; bin = 1'b0; // Expected: {'diff': 286, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001000101; b = 9'b100100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 286, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110000; b = 9'b001101000; bin = 1'b1; // Expected: {'diff': 263, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110000; b = 9'b001101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 263, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100110100; b = 9'b000011000; bin = 1'b1; // Expected: {'diff': 283, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100110100; b = 9'b000011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 283, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101101; b = 9'b011101001; bin = 1'b1; // Expected: {'diff': 323, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101101; b = 9'b011101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 323, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010101; b = 9'b011110011; bin = 1'b0; // Expected: {'diff': 354, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010101; b = 9'b011110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 354, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011010; b = 9'b110110010; bin = 1'b0; // Expected: {'diff': 488, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011010; b = 9'b110110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 488, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100100110; b = 9'b100011001; bin = 1'b0; // Expected: {'diff': 13, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100100110; b = 9'b100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101001; b = 9'b010110100; bin = 1'b1; // Expected: {'diff': 52, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101001; b = 9'b010110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001111; b = 9'b000100100; bin = 1'b0; // Expected: {'diff': 107, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001111; b = 9'b000100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 107, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110111; b = 9'b010110011; bin = 1'b1; // Expected: {'diff': 323, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110111; b = 9'b010110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 323, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010000; b = 9'b000101111; bin = 1'b1; // Expected: {'diff': 288, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010000; b = 9'b000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 288, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101001011; b = 9'b101011011; bin = 1'b0; // Expected: {'diff': 496, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101001011; b = 9'b101011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 496, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110110; b = 9'b100011001; bin = 1'b0; // Expected: {'diff': 349, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110110; b = 9'b100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 349, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110001; b = 9'b101001001; bin = 1'b1; // Expected: {'diff': 359, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110001; b = 9'b101001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 359, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110000; b = 9'b111111001; bin = 1'b1; // Expected: {'diff': 246, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110000; b = 9'b111111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 246, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100100010; b = 9'b100001010; bin = 1'b0; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100100010; b = 9'b100001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110110110; b = 9'b001000111; bin = 1'b1; // Expected: {'diff': 366, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110110110; b = 9'b001000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 366, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011111010; b = 9'b110011000; bin = 1'b0; // Expected: {'diff': 354, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011111010; b = 9'b110011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 354, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101000; b = 9'b011111010; bin = 1'b1; // Expected: {'diff': 493, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101000; b = 9'b011111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 493, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010100011; b = 9'b100101001; bin = 1'b1; // Expected: {'diff': 377, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010100011; b = 9'b100101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 377, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001111; b = 9'b001110001; bin = 1'b0; // Expected: {'diff': 286, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001111; b = 9'b001110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 286, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111010111; b = 9'b000111011; bin = 1'b1; // Expected: {'diff': 411, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111010111; b = 9'b000111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 411, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101000; b = 9'b010011110; bin = 1'b1; // Expected: {'diff': 457, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101000; b = 9'b010011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 457, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100000110; b = 9'b011011100; bin = 1'b0; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100000110; b = 9'b011011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000111111; b = 9'b001001111; bin = 1'b1; // Expected: {'diff': 495, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000111111; b = 9'b001001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 495, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110110; b = 9'b001100000; bin = 1'b0; // Expected: {'diff': 86, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110110; b = 9'b001100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000000110; b = 9'b100101110; bin = 1'b1; // Expected: {'diff': 215, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000000110; b = 9'b100101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 215, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110100; b = 9'b010001010; bin = 1'b0; // Expected: {'diff': 362, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110100; b = 9'b010001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 362, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010000; b = 9'b110001110; bin = 1'b1; // Expected: {'diff': 385, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010000; b = 9'b110001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 385, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000000100; b = 9'b001001111; bin = 1'b1; // Expected: {'diff': 436, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000000100; b = 9'b001001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 436, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010100010; b = 9'b101011001; bin = 1'b0; // Expected: {'diff': 329, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010100010; b = 9'b101011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 329, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011011110; b = 9'b011011101; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011011110; b = 9'b011011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011011110; b = 9'b111101101; bin = 1'b0; // Expected: {'diff': 241, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011011110; b = 9'b111101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 241, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010111010; b = 9'b000110111; bin = 1'b1; // Expected: {'diff': 130, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010111010; b = 9'b000110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 130, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110100; b = 9'b110100000; bin = 1'b1; // Expected: {'diff': 339, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110100; b = 9'b110100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 339, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000100011; b = 9'b101110001; bin = 1'b0; // Expected: {'diff': 178, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000100011; b = 9'b101110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 178, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010010; b = 9'b010111110; bin = 1'b0; // Expected: {'diff': 468, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010010; b = 9'b010111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 468, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001000111; b = 9'b100010001; bin = 1'b1; // Expected: {'diff': 309, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001000111; b = 9'b100010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 309, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110000000; b = 9'b000100011; bin = 1'b0; // Expected: {'diff': 349, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110000000; b = 9'b000100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 349, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010100000; b = 9'b110011110; bin = 1'b0; // Expected: {'diff': 258, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010100000; b = 9'b110011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 258, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000100101; b = 9'b110101100; bin = 1'b1; // Expected: {'diff': 120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000100101; b = 9'b110101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101100; b = 9'b000101111; bin = 1'b1; // Expected: {'diff': 380, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101100; b = 9'b000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 380, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001011; b = 9'b101001111; bin = 1'b1; // Expected: {'diff': 187, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001011; b = 9'b101001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 187, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010111; b = 9'b111011001; bin = 1'b1; // Expected: {'diff': 317, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010111; b = 9'b111011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 317, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110010011; b = 9'b000111111; bin = 1'b1; // Expected: {'diff': 339, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110010011; b = 9'b000111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 339, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111000010; b = 9'b010001111; bin = 1'b1; // Expected: {'diff': 306, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111000010; b = 9'b010001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 306, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011010110; b = 9'b110101111; bin = 1'b0; // Expected: {'diff': 295, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011010110; b = 9'b110101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 295, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110010; b = 9'b100100010; bin = 1'b1; // Expected: {'diff': 463, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110010; b = 9'b100100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 463, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001111; b = 9'b110100100; bin = 1'b0; // Expected: {'diff': 235, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001111; b = 9'b110100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 235, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010000; b = 9'b001100011; bin = 1'b1; // Expected: {'diff': 492, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010000; b = 9'b001100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 492, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011111010; b = 9'b010100110; bin = 1'b1; // Expected: {'diff': 83, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011111010; b = 9'b010100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 83, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110111; b = 9'b110011101; bin = 1'b1; // Expected: {'diff': 89, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110111; b = 9'b110011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 89, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101101; b = 9'b100111101; bin = 1'b1; // Expected: {'diff': 303, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101101; b = 9'b100111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 303, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101000; b = 9'b011110110; bin = 1'b1; // Expected: {'diff': 305, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101000; b = 9'b011110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 305, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110001; b = 9'b101101110; bin = 1'b1; // Expected: {'diff': 130, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110001; b = 9'b101101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 130, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011000000; b = 9'b111100001; bin = 1'b1; // Expected: {'diff': 222, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011000000; b = 9'b111100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 222, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110110101; b = 9'b011111010; bin = 1'b1; // Expected: {'diff': 186, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110110101; b = 9'b011111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 186, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111000; b = 9'b000001100; bin = 1'b1; // Expected: {'diff': 491, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111000; b = 9'b000001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 491, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101101; b = 9'b101010000; bin = 1'b0; // Expected: {'diff': 29, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101101; b = 9'b101010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101000011; b = 9'b010011011; bin = 1'b1; // Expected: {'diff': 167, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101000011; b = 9'b010011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 167, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100110001; b = 9'b000011100; bin = 1'b0; // Expected: {'diff': 277, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100110001; b = 9'b000011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 277, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011010011; b = 9'b000010000; bin = 1'b1; // Expected: {'diff': 194, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011010011; b = 9'b000010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 194, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001110; b = 9'b001101010; bin = 1'b1; // Expected: {'diff': 99, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001110; b = 9'b001101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110000; b = 9'b111110001; bin = 1'b1; // Expected: {'diff': 382, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110000; b = 9'b111110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 382, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011001; b = 9'b101011101; bin = 1'b1; // Expected: {'diff': 59, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011001; b = 9'b101011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101000010; b = 9'b011100101; bin = 1'b1; // Expected: {'diff': 92, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101000010; b = 9'b011100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101001; b = 9'b110101000; bin = 1'b1; // Expected: {'diff': 320, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101001; b = 9'b110101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 320, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111100110; b = 9'b100011101; bin = 1'b0; // Expected: {'diff': 201, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100110; b = 9'b100011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 201, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101111; b = 9'b111100100; bin = 1'b0; // Expected: {'diff': 459, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101111; b = 9'b111100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 459, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101111; b = 9'b010100010; bin = 1'b1; // Expected: {'diff': 332, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101111; b = 9'b010100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 332, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100010; b = 9'b111111011; bin = 1'b1; // Expected: {'diff': 102, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100010; b = 9'b111111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111100100; b = 9'b000100101; bin = 1'b0; // Expected: {'diff': 447, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100100; b = 9'b000100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 447, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010011100; b = 9'b010100110; bin = 1'b1; // Expected: {'diff': 501, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010011100; b = 9'b010100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 501, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011101; b = 9'b110110010; bin = 1'b1; // Expected: {'diff': 106, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011101; b = 9'b110110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 106, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100110111; b = 9'b001110001; bin = 1'b0; // Expected: {'diff': 198, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100110111; b = 9'b001110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 198, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101100001; b = 9'b001010010; bin = 1'b1; // Expected: {'diff': 270, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101100001; b = 9'b001010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 270, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001011111; b = 9'b001101001; bin = 1'b1; // Expected: {'diff': 501, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001011111; b = 9'b001101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 501, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011111; b = 9'b010011100; bin = 1'b1; // Expected: {'diff': 258, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011111; b = 9'b010011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 258, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010101; b = 9'b000100011; bin = 1'b0; // Expected: {'diff': 242, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010101; b = 9'b000100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 242, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110010; b = 9'b101100111; bin = 1'b1; // Expected: {'diff': 266, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110010; b = 9'b101100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 266, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110110; b = 9'b011100011; bin = 1'b0; // Expected: {'diff': 403, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110110; b = 9'b011100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 403, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000111001; b = 9'b110111101; bin = 1'b0; // Expected: {'diff': 124, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000111001; b = 9'b110111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 124, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110110010; b = 9'b010010111; bin = 1'b0; // Expected: {'diff': 283, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110110010; b = 9'b010010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 283, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011011110; b = 9'b111110000; bin = 1'b0; // Expected: {'diff': 238, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011011110; b = 9'b111110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 238, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110101; b = 9'b010000001; bin = 1'b1; // Expected: {'diff': 371, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110101; b = 9'b010000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 371, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010100100; b = 9'b010101110; bin = 1'b0; // Expected: {'diff': 502, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010100100; b = 9'b010101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 502, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101000000; b = 9'b111101011; bin = 1'b0; // Expected: {'diff': 341, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101000000; b = 9'b111101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 341, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001100; b = 9'b000011010; bin = 1'b0; // Expected: {'diff': 370, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001100; b = 9'b000011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 370, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110001; b = 9'b100010100; bin = 1'b0; // Expected: {'diff': 413, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110001; b = 9'b100010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 413, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101010; b = 9'b000010100; bin = 1'b1; // Expected: {'diff': 469, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101010; b = 9'b000010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 469, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100101000; b = 9'b101011110; bin = 1'b0; // Expected: {'diff': 458, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100101000; b = 9'b101011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 458, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000100101; b = 9'b110001010; bin = 1'b1; // Expected: {'diff': 154, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000100101; b = 9'b110001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 154, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001101; b = 9'b011101110; bin = 1'b1; // Expected: {'diff': 350, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001101; b = 9'b011101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 350, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110100110; b = 9'b011010101; bin = 1'b0; // Expected: {'diff': 209, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110100110; b = 9'b011010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 209, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001011; b = 9'b101110111; bin = 1'b0; // Expected: {'diff': 20, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001011; b = 9'b101110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101000; b = 9'b000000010; bin = 1'b1; // Expected: {'diff': 485, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101000; b = 9'b000000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 485, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111000010; b = 9'b110111100; bin = 1'b0; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111000010; b = 9'b110111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111100000; b = 9'b001000011; bin = 1'b0; // Expected: {'diff': 413, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100000; b = 9'b001000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 413, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101001011; b = 9'b101001111; bin = 1'b1; // Expected: {'diff': 507, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101001011; b = 9'b101001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 507, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001000; b = 9'b001111011; bin = 1'b0; // Expected: {'diff': 397, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001000; b = 9'b001111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 397, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010001; b = 9'b110011110; bin = 1'b1; // Expected: {'diff': 242, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010001; b = 9'b110011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 242, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100001; b = 9'b111000000; bin = 1'b0; // Expected: {'diff': 161, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100001; b = 9'b111000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 161, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110101; b = 9'b100101010; bin = 1'b0; // Expected: {'diff': 75, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110101; b = 9'b100101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101100; b = 9'b000001101; bin = 1'b0; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101100; b = 9'b000001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101100; b = 9'b111011101; bin = 1'b0; // Expected: {'diff': 271, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101100; b = 9'b111011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 271, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001000; b = 9'b110111010; bin = 1'b1; // Expected: {'diff': 461, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001000; b = 9'b110111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 461, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100110; b = 9'b100010011; bin = 1'b1; // Expected: {'diff': 338, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100110; b = 9'b100010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 338, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010110; b = 9'b110000110; bin = 1'b0; // Expected: {'diff': 464, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010110; b = 9'b110000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 464, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101010; b = 9'b110110111; bin = 1'b0; // Expected: {'diff': 51, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101010; b = 9'b110110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010100010; b = 9'b001110100; bin = 1'b1; // Expected: {'diff': 45, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010100010; b = 9'b001110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011000000; b = 9'b110000010; bin = 1'b0; // Expected: {'diff': 318, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011000000; b = 9'b110000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 318, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011011001; b = 9'b011001110; bin = 1'b1; // Expected: {'diff': 10, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011011001; b = 9'b011001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101010; b = 9'b101100100; bin = 1'b1; // Expected: {'diff': 69, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101010; b = 9'b101100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 69, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111011010; b = 9'b101110111; bin = 1'b0; // Expected: {'diff': 99, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111011010; b = 9'b101110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100100110; b = 9'b100010011; bin = 1'b0; // Expected: {'diff': 19, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100100110; b = 9'b100010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010100111; b = 9'b001110101; bin = 1'b1; // Expected: {'diff': 49, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010100111; b = 9'b001110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010000; b = 9'b101110001; bin = 1'b1; // Expected: {'diff': 222, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010000; b = 9'b101110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 222, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100001; b = 9'b101110000; bin = 1'b1; // Expected: {'diff': 368, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100001; b = 9'b101110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 368, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001100; b = 9'b001101101; bin = 1'b0; // Expected: {'diff': 479, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001100; b = 9'b001101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 479, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110111; b = 9'b111001111; bin = 1'b0; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110111; b = 9'b111001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011000010; b = 9'b101010010; bin = 1'b0; // Expected: {'diff': 368, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011000010; b = 9'b101010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 368, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010110; b = 9'b101110001; bin = 1'b0; // Expected: {'diff': 165, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010110; b = 9'b101110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 165, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110111100; b = 9'b000010011; bin = 1'b1; // Expected: {'diff': 424, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110111100; b = 9'b000010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 424, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001000101; b = 9'b101011011; bin = 1'b0; // Expected: {'diff': 234, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001000101; b = 9'b101011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 234, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011011001; b = 9'b111010010; bin = 1'b1; // Expected: {'diff': 262, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011011001; b = 9'b111010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 262, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010101; b = 9'b101001010; bin = 1'b1; // Expected: {'diff': 330, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010101; b = 9'b101001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 330, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101000; b = 9'b001000001; bin = 1'b0; // Expected: {'diff': 359, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101000; b = 9'b001000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 359, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010011; b = 9'b000000101; bin = 1'b0; // Expected: {'diff': 270, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010011; b = 9'b000000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 270, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001011011; b = 9'b111100011; bin = 1'b0; // Expected: {'diff': 120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001011011; b = 9'b111100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110100; b = 9'b110111000; bin = 1'b0; // Expected: {'diff': 252, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110100; b = 9'b110111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 252, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001000001; b = 9'b101000100; bin = 1'b1; // Expected: {'diff': 252, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001000001; b = 9'b101000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 252, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111001001; b = 9'b101011110; bin = 1'b0; // Expected: {'diff': 107, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111001001; b = 9'b101011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 107, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011111; b = 9'b111111001; bin = 1'b1; // Expected: {'diff': 293, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011111; b = 9'b111111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 293, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001000; b = 9'b011000111; bin = 1'b1; // Expected: {'diff': 192, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001000; b = 9'b011000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 192, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110010; b = 9'b101111000; bin = 1'b1; // Expected: {'diff': 249, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110010; b = 9'b101111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 249, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011010; b = 9'b111111001; bin = 1'b1; // Expected: {'diff': 288, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011010; b = 9'b111111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 288, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101100; b = 9'b000101000; bin = 1'b0; // Expected: {'diff': 196, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101100; b = 9'b000101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 196, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110110101; b = 9'b011010011; bin = 1'b0; // Expected: {'diff': 226, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110110101; b = 9'b011010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 226, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111111; b = 9'b000010111; bin = 1'b0; // Expected: {'diff': 104, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111111; b = 9'b000010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 104, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110101; b = 9'b100010010; bin = 1'b0; // Expected: {'diff': 483, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110101; b = 9'b100010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 483, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001000; b = 9'b011010011; bin = 1'b0; // Expected: {'diff': 501, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001000; b = 9'b011010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 501, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101000; b = 9'b101101001; bin = 1'b0; // Expected: {'diff': 191, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101000; b = 9'b101101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 191, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101011111; b = 9'b000110111; bin = 1'b1; // Expected: {'diff': 295, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101011111; b = 9'b000110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 295, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011111110; b = 9'b110001101; bin = 1'b0; // Expected: {'diff': 369, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011111110; b = 9'b110001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 369, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101111010; b = 9'b100001001; bin = 1'b0; // Expected: {'diff': 113, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101111010; b = 9'b100001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100101110; b = 9'b001110101; bin = 1'b1; // Expected: {'diff': 184, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100101110; b = 9'b001110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 184, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111011101; b = 9'b011110100; bin = 1'b0; // Expected: {'diff': 233, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111011101; b = 9'b011110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 233, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001100; b = 9'b100100000; bin = 1'b0; // Expected: {'diff': 300, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001100; b = 9'b100100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 300, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111110; b = 9'b000110101; bin = 1'b0; // Expected: {'diff': 457, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111110; b = 9'b000110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 457, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101100011; b = 9'b101110000; bin = 1'b0; // Expected: {'diff': 499, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101100011; b = 9'b101110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 499, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000100011; b = 9'b010101010; bin = 1'b0; // Expected: {'diff': 377, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000100011; b = 9'b010101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 377, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101000; b = 9'b111110011; bin = 1'b1; // Expected: {'diff': 436, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101000; b = 9'b111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 436, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001100; b = 9'b000111011; bin = 1'b1; // Expected: {'diff': 336, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001100; b = 9'b000111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 336, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001101; b = 9'b111011001; bin = 1'b0; // Expected: {'diff': 116, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001101; b = 9'b111011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 116, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101110; b = 9'b111011101; bin = 1'b1; // Expected: {'diff': 80, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101110; b = 9'b111011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 80, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011000110; b = 9'b010110101; bin = 1'b1; // Expected: {'diff': 16, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011000110; b = 9'b010110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111100111; b = 9'b000010101; bin = 1'b1; // Expected: {'diff': 465, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100111; b = 9'b000010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 465, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011101; b = 9'b101010101; bin = 1'b0; // Expected: {'diff': 456, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011101; b = 9'b101010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 456, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101011; b = 9'b110001011; bin = 1'b1; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101011; b = 9'b110001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010110; b = 9'b010011000; bin = 1'b1; // Expected: {'diff': 381, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010110; b = 9'b010011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 381, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001001; b = 9'b001101010; bin = 1'b0; // Expected: {'diff': 287, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001001; b = 9'b001101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 287, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000111100; b = 9'b111011100; bin = 1'b0; // Expected: {'diff': 96, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000111100; b = 9'b111011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001011000; b = 9'b101001011; bin = 1'b1; // Expected: {'diff': 268, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001011000; b = 9'b101001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 268, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100101010; b = 9'b100110011; bin = 1'b1; // Expected: {'diff': 502, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100101010; b = 9'b100110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 502, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111001010; b = 9'b001000010; bin = 1'b0; // Expected: {'diff': 392, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111001010; b = 9'b001000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 392, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011111000; b = 9'b011111111; bin = 1'b0; // Expected: {'diff': 505, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011111000; b = 9'b011111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 505, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111010; b = 9'b010110000; bin = 1'b0; // Expected: {'diff': 458, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111010; b = 9'b010110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 458, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011010; b = 9'b000001110; bin = 1'b0; // Expected: {'diff': 396, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011010; b = 9'b000001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 396, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010011110; b = 9'b011001110; bin = 1'b0; // Expected: {'diff': 464, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010011110; b = 9'b011001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 464, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001011; b = 9'b000111100; bin = 1'b0; // Expected: {'diff': 143, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001011; b = 9'b000111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 143, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110101; b = 9'b010101100; bin = 1'b0; // Expected: {'diff': 201, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110101; b = 9'b010101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 201, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100010; b = 9'b101001010; bin = 1'b1; // Expected: {'diff': 407, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100010; b = 9'b101001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 407, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111100; b = 9'b010110110; bin = 1'b1; // Expected: {'diff': 453, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111100; b = 9'b010110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 453, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101111; b = 9'b100110011; bin = 1'b1; // Expected: {'diff': 315, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101111; b = 9'b100110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 315, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111010010; b = 9'b000111110; bin = 1'b0; // Expected: {'diff': 404, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111010010; b = 9'b000111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 404, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011010101; b = 9'b010111100; bin = 1'b0; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011010101; b = 9'b010111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101111; b = 9'b010010001; bin = 1'b1; // Expected: {'diff': 413, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101111; b = 9'b010010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 413, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001010; b = 9'b000000110; bin = 1'b0; // Expected: {'diff': 68, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001010; b = 9'b000000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110110; b = 9'b001110101; bin = 1'b1; // Expected: {'diff': 256, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110110; b = 9'b001110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 256, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011100; b = 9'b100010111; bin = 1'b0; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011100; b = 9'b100010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110011; b = 9'b101010001; bin = 1'b1; // Expected: {'diff': 225, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110011; b = 9'b101010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 225, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100100; b = 9'b101001110; bin = 1'b0; // Expected: {'diff': 406, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100100; b = 9'b101001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 406, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110101; b = 9'b001000101; bin = 1'b0; // Expected: {'diff': 176, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110101; b = 9'b001000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 176, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001011101; b = 9'b101011111; bin = 1'b1; // Expected: {'diff': 253, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001011101; b = 9'b101011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 253, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110111; b = 9'b001011110; bin = 1'b1; // Expected: {'diff': 472, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110111; b = 9'b001011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 472, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101011; b = 9'b111100011; bin = 1'b1; // Expected: {'diff': 455, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101011; b = 9'b111100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 455, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000100101; b = 9'b010000101; bin = 1'b1; // Expected: {'diff': 415, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000100101; b = 9'b010000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 415, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000000010; b = 9'b101101100; bin = 1'b0; // Expected: {'diff': 150, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000000010; b = 9'b101101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 150, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001011111; b = 9'b000001000; bin = 1'b1; // Expected: {'diff': 86, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001011111; b = 9'b000001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001110; b = 9'b011110011; bin = 1'b1; // Expected: {'diff': 474, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001110; b = 9'b011110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 474, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010101; b = 9'b110101000; bin = 1'b1; // Expected: {'diff': 108, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010101; b = 9'b110101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010011110; b = 9'b010100011; bin = 1'b0; // Expected: {'diff': 507, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010011110; b = 9'b010100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 507, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100111101; b = 9'b011000001; bin = 1'b1; // Expected: {'diff': 123, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100111101; b = 9'b011000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 123, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100100; b = 9'b101001000; bin = 1'b1; // Expected: {'diff': 411, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100100; b = 9'b101001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 411, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010010; b = 9'b100011101; bin = 1'b0; // Expected: {'diff': 309, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010010; b = 9'b100011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 309, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011100; b = 9'b101011101; bin = 1'b1; // Expected: {'diff': 62, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011100; b = 9'b101011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000111110; b = 9'b011101110; bin = 1'b1; // Expected: {'diff': 335, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000111110; b = 9'b011101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 335, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001110; b = 9'b101011000; bin = 1'b0; // Expected: {'diff': 374, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001110; b = 9'b101011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 374, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110110; b = 9'b011100001; bin = 1'b1; // Expected: {'diff': 276, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110110; b = 9'b011100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 276, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001111; b = 9'b100111001; bin = 1'b0; // Expected: {'diff': 86, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001111; b = 9'b100111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001101; b = 9'b100110001; bin = 1'b0; // Expected: {'diff': 412, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001101; b = 9'b100110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 412, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111011110; b = 9'b010000011; bin = 1'b0; // Expected: {'diff': 347, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111011110; b = 9'b010000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 347, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100000; b = 9'b100001011; bin = 1'b0; // Expected: {'diff': 469, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100000; b = 9'b100001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 469, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101000010; b = 9'b011101001; bin = 1'b1; // Expected: {'diff': 88, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101000010; b = 9'b011101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111000100; b = 9'b111000110; bin = 1'b1; // Expected: {'diff': 509, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111000100; b = 9'b111000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 509, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001011101; b = 9'b001111101; bin = 1'b1; // Expected: {'diff': 479, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001011101; b = 9'b001111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 479, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100100000; b = 9'b111010000; bin = 1'b1; // Expected: {'diff': 335, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100100000; b = 9'b111010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 335, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101110; b = 9'b000011001; bin = 1'b1; // Expected: {'diff': 212, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101110; b = 9'b000011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 212, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010101101; b = 9'b101111101; bin = 1'b1; // Expected: {'diff': 303, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010101101; b = 9'b101111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 303, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101111111; b = 9'b010001110; bin = 1'b1; // Expected: {'diff': 240, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101111111; b = 9'b010001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 240, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010011; b = 9'b011110010; bin = 1'b0; // Expected: {'diff': 97, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010011; b = 9'b011110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010000010; b = 9'b000000000; bin = 1'b1; // Expected: {'diff': 129, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010000010; b = 9'b000000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 129, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010001; b = 9'b111100010; bin = 1'b0; // Expected: {'diff': 367, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010001; b = 9'b111100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 367, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110000011; b = 9'b100100000; bin = 1'b1; // Expected: {'diff': 98, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110000011; b = 9'b100100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101011000; b = 9'b111001011; bin = 1'b0; // Expected: {'diff': 397, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101011000; b = 9'b111001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 397, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010001; b = 9'b011101100; bin = 1'b0; // Expected: {'diff': 293, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010001; b = 9'b011101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 293, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101010; b = 9'b010100100; bin = 1'b1; // Expected: {'diff': 453, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101010; b = 9'b010100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 453, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111111; b = 9'b100010011; bin = 1'b1; // Expected: {'diff': 363, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111111; b = 9'b100010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 363, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010111011; b = 9'b100010001; bin = 1'b1; // Expected: {'diff': 425, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010111011; b = 9'b100010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 425, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001111; b = 9'b101111011; bin = 1'b0; // Expected: {'diff': 148, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001111; b = 9'b101111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 148, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001011; b = 9'b111011101; bin = 1'b1; // Expected: {'diff': 237, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001011; b = 9'b111011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 237, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110011110; b = 9'b111100100; bin = 1'b0; // Expected: {'diff': 442, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110011110; b = 9'b111100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 442, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100110; b = 9'b010100011; bin = 1'b1; // Expected: {'diff': 66, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100110; b = 9'b010100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 66, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110010010; b = 9'b111110101; bin = 1'b0; // Expected: {'diff': 413, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110010010; b = 9'b111110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 413, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101011101; b = 9'b011101111; bin = 1'b1; // Expected: {'diff': 109, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101011101; b = 9'b011101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 109, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001000; b = 9'b001110010; bin = 1'b1; // Expected: {'diff': 21, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001000; b = 9'b001110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100101000; b = 9'b111110000; bin = 1'b0; // Expected: {'diff': 312, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100101000; b = 9'b111110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 312, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010101; b = 9'b111010011; bin = 1'b0; // Expected: {'diff': 66, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010101; b = 9'b111010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 66, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100111; b = 9'b110110011; bin = 1'b0; // Expected: {'diff': 180, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100111; b = 9'b110110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 180, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100101001; b = 9'b010110000; bin = 1'b1; // Expected: {'diff': 120, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100101001; b = 9'b010110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010000110; b = 9'b101001111; bin = 1'b1; // Expected: {'diff': 310, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010000110; b = 9'b101001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 310, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010101000; b = 9'b101101000; bin = 1'b0; // Expected: {'diff': 320, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010101000; b = 9'b101101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 320, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100011001; b = 9'b000111111; bin = 1'b0; // Expected: {'diff': 218, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100011001; b = 9'b000111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 218, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101001; b = 9'b011101000; bin = 1'b0; // Expected: {'diff': 385, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101001; b = 9'b011101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 385, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111000100; b = 9'b111010001; bin = 1'b0; // Expected: {'diff': 499, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111000100; b = 9'b111010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 499, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110100; b = 9'b001011100; bin = 1'b0; // Expected: {'diff': 88, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110100; b = 9'b001011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111001000; b = 9'b000011101; bin = 1'b0; // Expected: {'diff': 427, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111001000; b = 9'b000011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 427, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011000001; b = 9'b101111100; bin = 1'b1; // Expected: {'diff': 324, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011000001; b = 9'b101111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 324, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110101; b = 9'b100010010; bin = 1'b1; // Expected: {'diff': 354, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110101; b = 9'b100010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 354, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110100; b = 9'b011010011; bin = 1'b0; // Expected: {'diff': 161, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110100; b = 9'b011010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 161, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111100001; b = 9'b000101111; bin = 1'b0; // Expected: {'diff': 434, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100001; b = 9'b000101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 434, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111000; b = 9'b010010001; bin = 1'b1; // Expected: {'diff': 486, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111000; b = 9'b010010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 486, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011110; b = 9'b001111110; bin = 1'b0; // Expected: {'diff': 416, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011110; b = 9'b001111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 416, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101110; b = 9'b111110010; bin = 1'b0; // Expected: {'diff': 380, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101110; b = 9'b111110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 380, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010101011; b = 9'b000111110; bin = 1'b0; // Expected: {'diff': 109, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010101011; b = 9'b000111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 109, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100100; b = 9'b001001011; bin = 1'b1; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100100; b = 9'b001001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110110; b = 9'b010000000; bin = 1'b1; // Expected: {'diff': 437, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110110; b = 9'b010000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 437, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010010010; b = 9'b011010111; bin = 1'b1; // Expected: {'diff': 442, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010010010; b = 9'b011010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 442, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111010001; b = 9'b000010001; bin = 1'b0; // Expected: {'diff': 448, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111010001; b = 9'b000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 448, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100011; b = 9'b000100010; bin = 1'b0; // Expected: {'diff': 65, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100011; b = 9'b000100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101100; b = 9'b100111011; bin = 1'b0; // Expected: {'diff': 433, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101100; b = 9'b100111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 433, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110100; b = 9'b100100100; bin = 1'b0; // Expected: {'diff': 400, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110100; b = 9'b100100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 400, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101011; b = 9'b111010101; bin = 1'b0; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101011; b = 9'b111010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001110010; b = 9'b000010011; bin = 1'b0; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001110010; b = 9'b000010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010100100; b = 9'b001001111; bin = 1'b1; // Expected: {'diff': 84, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010100100; b = 9'b001001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011010001; b = 9'b010001111; bin = 1'b0; // Expected: {'diff': 66, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011010001; b = 9'b010001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 66, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100111111; b = 9'b011111101; bin = 1'b1; // Expected: {'diff': 65, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100111111; b = 9'b011111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110111001; b = 9'b010001100; bin = 1'b1; // Expected: {'diff': 300, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110111001; b = 9'b010001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 300, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001101; b = 9'b100101110; bin = 1'b0; // Expected: {'diff': 351, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001101; b = 9'b100101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 351, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101001101; b = 9'b000000001; bin = 1'b1; // Expected: {'diff': 331, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101001101; b = 9'b000000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 331, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100100001; b = 9'b110001110; bin = 1'b1; // Expected: {'diff': 402, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100100001; b = 9'b110001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 402, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000000110; b = 9'b000101111; bin = 1'b1; // Expected: {'diff': 470, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000000110; b = 9'b000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 470, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110100; b = 9'b100110000; bin = 1'b1; // Expected: {'diff': 259, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110100; b = 9'b100110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 259, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001000100; b = 9'b101010101; bin = 1'b0; // Expected: {'diff': 239, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001000100; b = 9'b101010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 239, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100110; b = 9'b011001101; bin = 1'b0; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100110; b = 9'b011001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101111; b = 9'b010001000; bin = 1'b1; // Expected: {'diff': 102, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101111; b = 9'b010001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101100001; b = 9'b001100010; bin = 1'b0; // Expected: {'diff': 255, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101100001; b = 9'b001100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 255, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010011100; b = 9'b001100011; bin = 1'b1; // Expected: {'diff': 56, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010011100; b = 9'b001100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110111001; b = 9'b110110000; bin = 1'b0; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110111001; b = 9'b110110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110110111; b = 9'b100101001; bin = 1'b0; // Expected: {'diff': 142, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110110111; b = 9'b100101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 142, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111011101; b = 9'b011100111; bin = 1'b1; // Expected: {'diff': 245, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111011101; b = 9'b011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 245, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110110; b = 9'b001001111; bin = 1'b1; // Expected: {'diff': 422, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110110; b = 9'b001001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 422, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101011; b = 9'b000111011; bin = 1'b0; // Expected: {'diff': 304, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101011; b = 9'b000111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 304, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001011000; b = 9'b010111101; bin = 1'b1; // Expected: {'diff': 410, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001011000; b = 9'b010111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 410, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011010; b = 9'b110110111; bin = 1'b1; // Expected: {'diff': 98, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011010; b = 9'b110110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010111; b = 9'b010110101; bin = 1'b1; // Expected: {'diff': 97, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010111; b = 9'b010110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010101; b = 9'b001001110; bin = 1'b0; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010101; b = 9'b001001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101100; b = 9'b001111001; bin = 1'b0; // Expected: {'diff': 371, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101100; b = 9'b001111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 371, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101101; b = 9'b001100001; bin = 1'b1; // Expected: {'diff': 459, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101101; b = 9'b001100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 459, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010011; b = 9'b110100001; bin = 1'b0; // Expected: {'diff': 114, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010011; b = 9'b110100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 114, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000110011; b = 9'b101010101; bin = 1'b0; // Expected: {'diff': 222, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000110011; b = 9'b101010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 222, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101011; b = 9'b110111011; bin = 1'b1; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101011; b = 9'b110111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000100011; b = 9'b011100110; bin = 1'b0; // Expected: {'diff': 317, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000100011; b = 9'b011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 317, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001110; b = 9'b100010001; bin = 1'b1; // Expected: {'diff': 124, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001110; b = 9'b100010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110111001; b = 9'b010000111; bin = 1'b0; // Expected: {'diff': 306, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110111001; b = 9'b010000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 306, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001001; b = 9'b011110010; bin = 1'b0; // Expected: {'diff': 471, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001001; b = 9'b011110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 471, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010001; b = 9'b101011111; bin = 1'b1; // Expected: {'diff': 497, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010001; b = 9'b101011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 497, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001000; b = 9'b110111111; bin = 1'b0; // Expected: {'diff': 265, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001000; b = 9'b110111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 265, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101011; b = 9'b011010100; bin = 1'b1; // Expected: {'diff': 150, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101011; b = 9'b011010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 150, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001100; b = 9'b001011111; bin = 1'b1; // Expected: {'diff': 300, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001100; b = 9'b001011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 300, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011100; b = 9'b000100111; bin = 1'b1; // Expected: {'diff': 500, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011100; b = 9'b000100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 500, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010101000; b = 9'b011000100; bin = 1'b1; // Expected: {'diff': 483, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010101000; b = 9'b011000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 483, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110010101; b = 9'b011110111; bin = 1'b1; // Expected: {'diff': 157, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110010101; b = 9'b011110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 157, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111010101; b = 9'b010000001; bin = 1'b0; // Expected: {'diff': 340, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111010101; b = 9'b010000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 340, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010111101; b = 9'b110111110; bin = 1'b1; // Expected: {'diff': 254, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010111101; b = 9'b110111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 254, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010001000; b = 9'b100100001; bin = 1'b1; // Expected: {'diff': 358, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010001000; b = 9'b100100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 358, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110011; b = 9'b010100101; bin = 1'b1; // Expected: {'diff': 13, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110011; b = 9'b010100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011011000; b = 9'b000001101; bin = 1'b1; // Expected: {'diff': 202, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011011000; b = 9'b000001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 202, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110010100; b = 9'b111001101; bin = 1'b0; // Expected: {'diff': 455, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110010100; b = 9'b111001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 455, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101010100; b = 9'b010001000; bin = 1'b0; // Expected: {'diff': 204, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101010100; b = 9'b010001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 204, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101011001; b = 9'b110010101; bin = 1'b0; // Expected: {'diff': 452, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101011001; b = 9'b110010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 452, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010100110; b = 9'b110000111; bin = 1'b1; // Expected: {'diff': 286, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010100110; b = 9'b110000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 286, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110000001; b = 9'b000001101; bin = 1'b1; // Expected: {'diff': 371, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110000001; b = 9'b000001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 371, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101001; b = 9'b101101000; bin = 1'b0; // Expected: {'diff': 129, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101001; b = 9'b101101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 129, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111000111; b = 9'b100111111; bin = 1'b0; // Expected: {'diff': 136, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111000111; b = 9'b100111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 136, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100001010; b = 9'b110001010; bin = 1'b0; // Expected: {'diff': 384, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100001010; b = 9'b110001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 384, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001110; b = 9'b011010110; bin = 1'b0; // Expected: {'diff': 312, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001110; b = 9'b011010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 312, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111110; b = 9'b110011100; bin = 1'b0; // Expected: {'diff': 226, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111110; b = 9'b110011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 226, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101000110; b = 9'b111011100; bin = 1'b1; // Expected: {'diff': 361, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101000110; b = 9'b111011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 361, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011101; b = 9'b111010110; bin = 1'b1; // Expected: {'diff': 70, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011101; b = 9'b111010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 70, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011110; b = 9'b010000111; bin = 1'b0; // Expected: {'diff': 407, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011110; b = 9'b010000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 407, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010100; b = 9'b000010001; bin = 1'b0; // Expected: {'diff': 259, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010100; b = 9'b000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 259, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100100110; b = 9'b100001001; bin = 1'b1; // Expected: {'diff': 28, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100100110; b = 9'b100001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010010; b = 9'b011011011; bin = 1'b0; // Expected: {'diff': 375, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010010; b = 9'b011011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 375, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001100000; b = 9'b010000011; bin = 1'b0; // Expected: {'diff': 477, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001100000; b = 9'b010000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 477, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001111; b = 9'b110110101; bin = 1'b1; // Expected: {'diff': 89, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001111; b = 9'b110110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 89, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101011001; b = 9'b111000000; bin = 1'b1; // Expected: {'diff': 408, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101011001; b = 9'b111000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 408, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100001111; b = 9'b101100110; bin = 1'b1; // Expected: {'diff': 424, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100001111; b = 9'b101100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 424, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000001111; b = 9'b000101110; bin = 1'b1; // Expected: {'diff': 480, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000001111; b = 9'b000101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 480, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111011010; b = 9'b010001100; bin = 1'b0; // Expected: {'diff': 334, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111011010; b = 9'b010001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 334, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101110011; b = 9'b100100000; bin = 1'b1; // Expected: {'diff': 82, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101110011; b = 9'b100100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110001; b = 9'b110001001; bin = 1'b1; // Expected: {'diff': 359, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110001; b = 9'b110001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 359, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000111111; b = 9'b001110111; bin = 1'b1; // Expected: {'diff': 455, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000111111; b = 9'b001110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 455, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101101100; b = 9'b100000100; bin = 1'b0; // Expected: {'diff': 104, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101101100; b = 9'b100000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 104, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010000000; b = 9'b111011100; bin = 1'b0; // Expected: {'diff': 164, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010000000; b = 9'b111011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 164, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000111011; b = 9'b101011000; bin = 1'b1; // Expected: {'diff': 226, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000111011; b = 9'b101011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 226, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011010; b = 9'b011110111; bin = 1'b1; // Expected: {'diff': 290, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011010; b = 9'b011110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 290, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000100111; b = 9'b100000011; bin = 1'b1; // Expected: {'diff': 291, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b000100111; b = 9'b100000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 291, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011011110; b = 9'b011100010; bin = 1'b1; // Expected: {'diff': 507, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011011110; b = 9'b011100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 507, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110101; b = 9'b011111000; bin = 1'b0; // Expected: {'diff': 445, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110101; b = 9'b011111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 445, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001101000; b = 9'b000001001; bin = 1'b1; // Expected: {'diff': 94, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001101000; b = 9'b000001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 94, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110010; b = 9'b000001011; bin = 1'b0; // Expected: {'diff': 167, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110010; b = 9'b000001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 167, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111010; b = 9'b001100001; bin = 1'b1; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111010; b = 9'b001100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101100101; b = 9'b111011111; bin = 1'b0; // Expected: {'diff': 390, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101100101; b = 9'b111011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 390, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101011; b = 9'b011000001; bin = 1'b0; // Expected: {'diff': 298, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101011; b = 9'b011000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 298, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111000100; b = 9'b001010001; bin = 1'b1; // Expected: {'diff': 370, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111000100; b = 9'b001010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 370, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101001011; b = 9'b001100110; bin = 1'b1; // Expected: {'diff': 228, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101001011; b = 9'b001100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 228, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001010010; b = 9'b101100100; bin = 1'b0; // Expected: {'diff': 238, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001010010; b = 9'b101100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 238, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110101; b = 9'b000100100; bin = 1'b0; // Expected: {'diff': 465, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110101; b = 9'b000100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 465, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010011001; b = 9'b000101101; bin = 1'b0; // Expected: {'diff': 108, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010011001; b = 9'b000101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 108, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001001100; b = 9'b011101000; bin = 1'b0; // Expected: {'diff': 356, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b001001100; b = 9'b011101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 356, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110001101; b = 9'b111100100; bin = 1'b1; // Expected: {'diff': 424, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110001101; b = 9'b111100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 424, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
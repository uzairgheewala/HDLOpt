
`timescale 1ns / 1ps

module tb_N15_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 15;
    
     
    // Inputs
    
    reg  [14:0] a;
    
    reg  [14:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [14:0] diff;
    
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
        
        a = 15'b101100110011110; b = 15'b011001000100100; bin = 1'b1; // Expected: {'diff': 10105, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100110011110; b = 15'b011001000100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10105, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111011010100; b = 15'b110011011100101; bin = 1'b0; // Expected: {'diff': 6127, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111011010100; b = 15'b110011011100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6127, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111011001110101; b = 15'b100111000001111; bin = 1'b0; // Expected: {'diff': 10342, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111011001110101; b = 15'b100111000001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10342, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010110101111; b = 15'b111001010000101; bin = 1'b0; // Expected: {'diff': 29482, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010110101111; b = 15'b111001010000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29482, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100101000111; b = 15'b111011010000100; bin = 1'b1; // Expected: {'diff': 25282, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100101000111; b = 15'b111011010000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25282, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000011001001; b = 15'b010101001000010; bin = 1'b0; // Expected: {'diff': 5767, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000011001001; b = 15'b010101001000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5767, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010100100000001; b = 15'b001010111101000; bin = 1'b0; // Expected: {'diff': 4889, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010100100000001; b = 15'b001010111101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4889, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011001011111101; b = 15'b010000101001111; bin = 1'b1; // Expected: {'diff': 4525, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011001011111101; b = 15'b010000101001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4525, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110111110101000; b = 15'b110110001011100; bin = 1'b1; // Expected: {'diff': 843, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110111110101000; b = 15'b110110001011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 843, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011000010111; b = 15'b100011000101011; bin = 1'b0; // Expected: {'diff': 16364, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011000010111; b = 15'b100011000101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16364, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011000001001; b = 15'b111110000100100; bin = 1'b0; // Expected: {'diff': 2533, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011000001001; b = 15'b111110000100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2533, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010011011001; b = 15'b001010000011100; bin = 1'b1; // Expected: {'diff': 20668, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010011011001; b = 15'b001010000011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20668, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110101110001; b = 15'b100101011100000; bin = 1'b0; // Expected: {'diff': 29329, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110101110001; b = 15'b100101011100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29329, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000101011011; b = 15'b100011110101110; bin = 1'b1; // Expected: {'diff': 27052, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000101011011; b = 15'b100011110101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27052, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011111100110110; b = 15'b000111000001100; bin = 1'b0; // Expected: {'diff': 12586, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011111100110110; b = 15'b000111000001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12586, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000011101110; b = 15'b010100000101110; bin = 1'b0; // Expected: {'diff': 2240, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000011101110; b = 15'b010100000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2240, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011011001000010; b = 15'b111010000011001; bin = 1'b0; // Expected: {'diff': 16937, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011011001000010; b = 15'b111010000011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16937, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000001010000; b = 15'b000010011100110; bin = 1'b1; // Expected: {'diff': 2921, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000001010000; b = 15'b000010011100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2921, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101100111001; b = 15'b111110010010100; bin = 1'b1; // Expected: {'diff': 16036, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101100111001; b = 15'b111110010010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16036, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111000100010110; b = 15'b001100101110100; bin = 1'b1; // Expected: {'diff': 22433, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111000100010110; b = 15'b001100101110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22433, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010011011000; b = 15'b010011011000011; bin = 1'b0; // Expected: {'diff': 15893, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010011011000; b = 15'b010011011000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15893, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011101010011; b = 15'b110011101100110; bin = 1'b0; // Expected: {'diff': 24557, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011101010011; b = 15'b110011101100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24557, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011111101010111; b = 15'b110000101110101; bin = 1'b1; // Expected: {'diff': 24033, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011111101010111; b = 15'b110000101110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24033, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110101000110; b = 15'b111101001000001; bin = 1'b0; // Expected: {'diff': 25349, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110101000110; b = 15'b111101001000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25349, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010000100010100; b = 15'b001110100100010; bin = 1'b0; // Expected: {'diff': 1010, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010000100010100; b = 15'b001110100100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1010, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111110010110010; b = 15'b011011100101000; bin = 1'b1; // Expected: {'diff': 17801, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111110010110010; b = 15'b011011100101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17801, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000011100000; b = 15'b010011010000011; bin = 1'b0; // Expected: {'diff': 2653, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000011100000; b = 15'b010011010000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2653, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011001011011111; b = 15'b110100110110101; bin = 1'b0; // Expected: {'diff': 18730, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011001011011111; b = 15'b110100110110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18730, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100111001110; b = 15'b001110011000011; bin = 1'b1; // Expected: {'diff': 11530, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100111001110; b = 15'b001110011000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11530, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110110101001; b = 15'b111011111001111; bin = 1'b1; // Expected: {'diff': 26073, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110110101001; b = 15'b111011111001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26073, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000010100101; b = 15'b100101110111010; bin = 1'b0; // Expected: {'diff': 13547, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000010100101; b = 15'b100101110111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13547, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110000001000110; b = 15'b011100101111111; bin = 1'b0; // Expected: {'diff': 9927, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110000001000110; b = 15'b011100101111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9927, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000100100011110; b = 15'b111011110010011; bin = 1'b1; // Expected: {'diff': 4490, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000100100011110; b = 15'b111011110010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4490, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011011100010001; b = 15'b010000101110001; bin = 1'b0; // Expected: {'diff': 5536, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011011100010001; b = 15'b010000101110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5536, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100101001101; b = 15'b011001111011101; bin = 1'b0; // Expected: {'diff': 9584, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100101001101; b = 15'b011001111011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9584, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010011010010100; b = 15'b001010110101110; bin = 1'b0; // Expected: {'diff': 4326, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010011010010100; b = 15'b001010110101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4326, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100111110000; b = 15'b011011100001000; bin = 1'b0; // Expected: {'diff': 4840, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100111110000; b = 15'b011011100001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4840, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000110011101; b = 15'b001110110010000; bin = 1'b0; // Expected: {'diff': 25613, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000110011101; b = 15'b001110110010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25613, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010010011010110; b = 15'b100010000100000; bin = 1'b1; // Expected: {'diff': 24757, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010010011010110; b = 15'b100010000100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24757, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010100000110; b = 15'b011111010111101; bin = 1'b1; // Expected: {'diff': 5704, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010100000110; b = 15'b011111010111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5704, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000010111000111; b = 15'b011111000000101; bin = 1'b1; // Expected: {'diff': 18369, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000010111000111; b = 15'b011111000000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18369, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011001011001; b = 15'b100010011001110; bin = 1'b0; // Expected: {'diff': 395, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011001011001; b = 15'b100010011001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 395, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101000000100; b = 15'b000110110100101; bin = 1'b0; // Expected: {'diff': 27743, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101000000100; b = 15'b000110110100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27743, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110111010001; b = 15'b001101111100011; bin = 1'b1; // Expected: {'diff': 20973, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110111010001; b = 15'b001101111100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20973, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100111010000110; b = 15'b011111111111001; bin = 1'b1; // Expected: {'diff': 3724, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100111010000110; b = 15'b011111111111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3724, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101001001110; b = 15'b100101000100100; bin = 1'b0; // Expected: {'diff': 24618, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101001001110; b = 15'b100101000100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24618, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000001111101101; b = 15'b101101111010101; bin = 1'b0; // Expected: {'diff': 10264, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000001111101101; b = 15'b101101111010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10264, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000100111000; b = 15'b001011011101110; bin = 1'b1; // Expected: {'diff': 10825, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000100111000; b = 15'b001011011101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10825, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000011110101; b = 15'b101110100110001; bin = 1'b0; // Expected: {'diff': 9156, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000011110101; b = 15'b101110100110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9156, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000010000010110; b = 15'b000100100000100; bin = 1'b1; // Expected: {'diff': 31505, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000010000010110; b = 15'b000100100000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31505, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101101110100101; b = 15'b110101110101100; bin = 1'b0; // Expected: {'diff': 28665, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101101110100101; b = 15'b110101110101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28665, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110111010001; b = 15'b100101111110000; bin = 1'b0; // Expected: {'diff': 4577, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110111010001; b = 15'b100101111110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4577, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001001001100; b = 15'b111001111011010; bin = 1'b0; // Expected: {'diff': 11890, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001001001100; b = 15'b111001111011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11890, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110101000001; b = 15'b111100110001100; bin = 1'b1; // Expected: {'diff': 17332, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110101000001; b = 15'b111100110001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17332, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001001011001001; b = 15'b101111010101111; bin = 1'b1; // Expected: {'diff': 13337, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001001011001001; b = 15'b101111010101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13337, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010101100101; b = 15'b100100100101001; bin = 1'b1; // Expected: {'diff': 7227, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010101100101; b = 15'b100100100101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7227, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000001010011; b = 15'b011100001101111; bin = 1'b0; // Expected: {'diff': 22500, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000001010011; b = 15'b011100001101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22500, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101110111010; b = 15'b101010011111100; bin = 1'b0; // Expected: {'diff': 9918, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101110111010; b = 15'b101010011111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9918, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101111110101; b = 15'b101010110011001; bin = 1'b0; // Expected: {'diff': 9820, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101111110101; b = 15'b101010110011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9820, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001010010110; b = 15'b110000000011011; bin = 1'b0; // Expected: {'diff': 4731, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001010010110; b = 15'b110000000011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4731, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100110101000; b = 15'b000000111110110; bin = 1'b0; // Expected: {'diff': 6066, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100110101000; b = 15'b000000111110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6066, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000101110111100; b = 15'b101100110001111; bin = 1'b1; // Expected: {'diff': 12844, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000101110111100; b = 15'b101100110001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12844, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000100001101; b = 15'b010101100011001; bin = 1'b0; // Expected: {'diff': 9716, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000100001101; b = 15'b010101100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9716, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000000010010; b = 15'b111100011010011; bin = 1'b1; // Expected: {'diff': 18238, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000000010010; b = 15'b111100011010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18238, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110011100001010; b = 15'b001010011100101; bin = 1'b0; // Expected: {'diff': 21029, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110011100001010; b = 15'b001010011100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21029, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001001001101011; b = 15'b110111011110010; bin = 1'b1; // Expected: {'diff': 9080, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001001001101011; b = 15'b110111011110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9080, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001010011011; b = 15'b001010101010010; bin = 1'b0; // Expected: {'diff': 3401, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001010011011; b = 15'b001010101010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3401, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110011001100000; b = 15'b011100101101010; bin = 1'b0; // Expected: {'diff': 11510, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110011001100000; b = 15'b011100101101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11510, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001110000110; b = 15'b010101100101010; bin = 1'b0; // Expected: {'diff': 30812, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001110000110; b = 15'b010101100101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30812, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010000100010; b = 15'b011101110110100; bin = 1'b1; // Expected: {'diff': 6253, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010000100010; b = 15'b011101110110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6253, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100101111101; b = 15'b100000111111000; bin = 1'b0; // Expected: {'diff': 22405, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100101111101; b = 15'b100000111111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22405, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000010001101100; b = 15'b110110010111101; bin = 1'b0; // Expected: {'diff': 6063, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000010001101100; b = 15'b110110010111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6063, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010011010110000; b = 15'b010101000101101; bin = 1'b1; // Expected: {'diff': 31874, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010011010110000; b = 15'b010101000101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31874, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100010010001001; b = 15'b010000010100100; bin = 1'b1; // Expected: {'diff': 9188, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100010010001001; b = 15'b010000010100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9188, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101000000101; b = 15'b100101111010011; bin = 1'b1; // Expected: {'diff': 28209, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101000000101; b = 15'b100101111010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28209, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000111001101110; b = 15'b010000010110101; bin = 1'b0; // Expected: {'diff': 28089, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000111001101110; b = 15'b010000010110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28089, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011101010001; b = 15'b000100101001101; bin = 1'b0; // Expected: {'diff': 19972, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011101010001; b = 15'b000100101001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19972, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010001110100; b = 15'b010100101100101; bin = 1'b0; // Expected: {'diff': 15119, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010001110100; b = 15'b010100101100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15119, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001001111001001; b = 15'b111100010011001; bin = 1'b0; // Expected: {'diff': 6960, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001001111001001; b = 15'b111100010011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6960, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011111111101101; b = 15'b011000000110000; bin = 1'b1; // Expected: {'diff': 4028, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011111111101101; b = 15'b011000000110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4028, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101001011001011; b = 15'b010111011110011; bin = 1'b1; // Expected: {'diff': 9175, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101001011001011; b = 15'b010111011110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9175, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010000001101; b = 15'b000001111010101; bin = 1'b0; // Expected: {'diff': 12344, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010000001101; b = 15'b000001111010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12344, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010000000010001; b = 15'b010100101011001; bin = 1'b0; // Expected: {'diff': 30392, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010000000010001; b = 15'b010100101011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30392, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000010100111; b = 15'b001101011101011; bin = 1'b1; // Expected: {'diff': 30139, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000010100111; b = 15'b001101011101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30139, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011000010100; b = 15'b011010100000000; bin = 1'b0; // Expected: {'diff': 4372, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011000010100; b = 15'b011010100000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4372, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011111011010110; b = 15'b111110001011011; bin = 1'b1; // Expected: {'diff': 17018, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011111011010110; b = 15'b111110001011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17018, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101001000101; b = 15'b000100001110011; bin = 1'b1; // Expected: {'diff': 12753, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101001000101; b = 15'b000100001110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12753, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111100100100111; b = 15'b001111100111101; bin = 1'b1; // Expected: {'diff': 23017, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111100100100111; b = 15'b001111100111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23017, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000101111110100; b = 15'b100101011001101; bin = 1'b0; // Expected: {'diff': 16679, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000101111110100; b = 15'b100101011001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16679, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100101100001; b = 15'b111101110111000; bin = 1'b1; // Expected: {'diff': 23976, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100101100001; b = 15'b111101110111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23976, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011111110100; b = 15'b100011001001100; bin = 1'b0; // Expected: {'diff': 4520, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011111110100; b = 15'b100011001001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4520, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011011011001; b = 15'b100000110010010; bin = 1'b1; // Expected: {'diff': 5446, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011011011001; b = 15'b100000110010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5446, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000011101101; b = 15'b100111111110101; bin = 1'b0; // Expected: {'diff': 248, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000011101101; b = 15'b100111111110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 248, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000010101001100; b = 15'b011110110110000; bin = 1'b1; // Expected: {'diff': 18331, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000010101001100; b = 15'b011110110110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18331, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110000011110100; b = 15'b001110101111000; bin = 1'b0; // Expected: {'diff': 17276, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110000011110100; b = 15'b001110101111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17276, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000000001001; b = 15'b110000000101010; bin = 1'b1; // Expected: {'diff': 12254, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000000001001; b = 15'b110000000101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12254, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100111010110; b = 15'b100110101011111; bin = 1'b1; // Expected: {'diff': 19574, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100111010110; b = 15'b100110101011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19574, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010100011110; b = 15'b111110110010011; bin = 1'b0; // Expected: {'diff': 26507, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010100011110; b = 15'b111110110010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26507, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101111100100001; b = 15'b000110100000100; bin = 1'b0; // Expected: {'diff': 21021, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101111100100001; b = 15'b000110100000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21021, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111111011110; b = 15'b000101000001111; bin = 1'b1; // Expected: {'diff': 30158, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111111011110; b = 15'b000101000001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30158, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101101110100; b = 15'b010001011110011; bin = 1'b0; // Expected: {'diff': 22657, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101101110100; b = 15'b010001011110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22657, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000001000101; b = 15'b111111011100111; bin = 1'b1; // Expected: {'diff': 20829, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000001000101; b = 15'b111111011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20829, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001110001111000; b = 15'b101000100001001; bin = 1'b1; // Expected: {'diff': 19310, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001110001111000; b = 15'b101000100001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19310, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110000011010; b = 15'b000100101010111; bin = 1'b1; // Expected: {'diff': 12994, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110000011010; b = 15'b000100101010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12994, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011001100111001; b = 15'b101000101111110; bin = 1'b0; // Expected: {'diff': 25019, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011001100111001; b = 15'b101000101111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25019, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011100001000110; b = 15'b111101011001110; bin = 1'b0; // Expected: {'diff': 15736, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011100001000110; b = 15'b111101011001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15736, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010000111001; b = 15'b100001001101110; bin = 1'b1; // Expected: {'diff': 29130, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010000111001; b = 15'b100001001101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29130, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111010001100110; b = 15'b000100100100100; bin = 1'b1; // Expected: {'diff': 27457, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111010001100110; b = 15'b000100100100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27457, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010011010111100; b = 15'b000000111101010; bin = 1'b1; // Expected: {'diff': 9425, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010011010111100; b = 15'b000000111101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9425, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010011100000100; b = 15'b001000001111001; bin = 1'b0; // Expected: {'diff': 5771, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010011100000100; b = 15'b001000001111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5771, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001110111000001; b = 15'b110110011011011; bin = 1'b0; // Expected: {'diff': 12518, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001110111000001; b = 15'b110110011011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12518, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000101011110011; b = 15'b100001011111110; bin = 1'b1; // Expected: {'diff': 18420, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000101011110011; b = 15'b100001011111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18420, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010111010100; b = 15'b110111001111111; bin = 1'b0; // Expected: {'diff': 30549, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010111010100; b = 15'b110111001111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30549, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010011001000110; b = 15'b011101011111001; bin = 1'b1; // Expected: {'diff': 27468, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010011001000110; b = 15'b011101011111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27468, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110111101111; b = 15'b010110011100111; bin = 1'b1; // Expected: {'diff': 4359, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110111101111; b = 15'b010110011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4359, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001001110010; b = 15'b010011100111000; bin = 1'b0; // Expected: {'diff': 15162, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001001110010; b = 15'b010011100111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15162, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011101000101; b = 15'b000101011010010; bin = 1'b0; // Expected: {'diff': 19571, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011101000101; b = 15'b000101011010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19571, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011001101011; b = 15'b001101100110101; bin = 1'b0; // Expected: {'diff': 27446, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011001101011; b = 15'b001101100110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27446, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100010010010; b = 15'b011100011111011; bin = 1'b0; // Expected: {'diff': 3991, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100010010010; b = 15'b011100011111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3991, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000010010100; b = 15'b111100001010001; bin = 1'b0; // Expected: {'diff': 6211, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000010010100; b = 15'b111100001010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6211, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111000101010110; b = 15'b010100110101100; bin = 1'b0; // Expected: {'diff': 18346, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111000101010110; b = 15'b010100110101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18346, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110110000001; b = 15'b101001100111101; bin = 1'b0; // Expected: {'diff': 27204, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110110000001; b = 15'b101001100111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27204, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010101010101; b = 15'b001111111001101; bin = 1'b1; // Expected: {'diff': 17799, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010101010101; b = 15'b001111111001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17799, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010111011111010; b = 15'b111010101100111; bin = 1'b1; // Expected: {'diff': 14738, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010111011111010; b = 15'b111010101100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14738, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101101000000000; b = 15'b100111101111000; bin = 1'b1; // Expected: {'diff': 2695, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101101000000000; b = 15'b100111101111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2695, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111111010100; b = 15'b110110101101101; bin = 1'b0; // Expected: {'diff': 4711, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111111010100; b = 15'b110110101101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4711, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000000000000; b = 15'b110010011010100; bin = 1'b0; // Expected: {'diff': 6956, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000000000000; b = 15'b110010011010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6956, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011101011111; b = 15'b010111110100111; bin = 1'b0; // Expected: {'diff': 10168, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011101011111; b = 15'b010111110100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10168, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001110001000110; b = 15'b100101111001001; bin = 1'b1; // Expected: {'diff': 20604, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001110001000110; b = 15'b100101111001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20604, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011101110010; b = 15'b011101010011001; bin = 1'b0; // Expected: {'diff': 19673, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011101110010; b = 15'b011101010011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19673, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000100110011111; b = 15'b100001100011110; bin = 1'b1; // Expected: {'diff': 18048, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000100110011111; b = 15'b100001100011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18048, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111100101110101; b = 15'b001010001101111; bin = 1'b0; // Expected: {'diff': 25862, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111100101110101; b = 15'b001010001101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25862, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110101100111; b = 15'b100001011111011; bin = 1'b1; // Expected: {'diff': 31339, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110101100111; b = 15'b100001011111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31339, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000111110100; b = 15'b111000110001101; bin = 1'b1; // Expected: {'diff': 24678, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000111110100; b = 15'b111000110001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24678, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010000011000; b = 15'b101101111110111; bin = 1'b1; // Expected: {'diff': 22560, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010000011000; b = 15'b101101111110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22560, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111100001011100; b = 15'b010010111111000; bin = 1'b1; // Expected: {'diff': 21091, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111100001011100; b = 15'b010010111111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21091, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010110111010000; b = 15'b101011010000101; bin = 1'b1; // Expected: {'diff': 22346, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010110111010000; b = 15'b101011010000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22346, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011100010100000; b = 15'b000100101000011; bin = 1'b1; // Expected: {'diff': 12124, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011100010100000; b = 15'b000100101000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010110101001100; b = 15'b100010010011110; bin = 1'b0; // Expected: {'diff': 26798, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010110101001100; b = 15'b100010010011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26798, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111000010111010; b = 15'b100111011001100; bin = 1'b0; // Expected: {'diff': 8686, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111000010111010; b = 15'b100111011001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8686, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010100000011; b = 15'b110111000100110; bin = 1'b1; // Expected: {'diff': 26332, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010100000011; b = 15'b110111000100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26332, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100010010000000; b = 15'b100010101101100; bin = 1'b0; // Expected: {'diff': 32532, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100010010000000; b = 15'b100010101101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32532, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010101010101; b = 15'b001011111011101; bin = 1'b1; // Expected: {'diff': 19831, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010101010101; b = 15'b001011111011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19831, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101001010110; b = 15'b111000011001010; bin = 1'b1; // Expected: {'diff': 10635, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101001010110; b = 15'b111000011001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10635, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011100001111101; b = 15'b111110101110110; bin = 1'b1; // Expected: {'diff': 15110, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011100001111101; b = 15'b111110101110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15110, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100101011101; b = 15'b000111110001000; bin = 1'b1; // Expected: {'diff': 18900, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100101011101; b = 15'b000111110001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18900, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010100011110110; b = 15'b110110001101110; bin = 1'b0; // Expected: {'diff': 15496, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010100011110110; b = 15'b110110001101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15496, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011011100011; b = 15'b011100110011101; bin = 1'b0; // Expected: {'diff': 3398, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011011100011; b = 15'b011100110011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3398, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100101111100000; b = 15'b001110111101000; bin = 1'b0; // Expected: {'diff': 11768, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100101111100000; b = 15'b001110111101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11768, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010110101110101; b = 15'b000101001011110; bin = 1'b1; // Expected: {'diff': 8982, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010110101110101; b = 15'b000101001011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8982, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011111111100110; b = 15'b111110001111001; bin = 1'b1; // Expected: {'diff': 17260, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011111111100110; b = 15'b111110001111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17260, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011001101111; b = 15'b100101010000001; bin = 1'b0; // Expected: {'diff': 31726, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011001101111; b = 15'b100101010000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31726, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101001111110101; b = 15'b111000100100011; bin = 1'b1; // Expected: {'diff': 25297, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101001111110101; b = 15'b111000100100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25297, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100010100111100; b = 15'b011111010000011; bin = 1'b1; // Expected: {'diff': 1720, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100010100111100; b = 15'b011111010000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1720, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001011110100001; b = 15'b010111111000110; bin = 1'b1; // Expected: {'diff': 26586, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001011110100001; b = 15'b010111111000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26586, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000001111110; b = 15'b011010001101111; bin = 1'b0; // Expected: {'diff': 23567, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000001111110; b = 15'b011010001101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23567, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011001110110; b = 15'b100001100110010; bin = 1'b0; // Expected: {'diff': 17220, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011001110110; b = 15'b100001100110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17220, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001001110111001; b = 15'b001000001001001; bin = 1'b0; // Expected: {'diff': 880, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001001110111001; b = 15'b001000001001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 880, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101111100101101; b = 15'b101000110101100; bin = 1'b0; // Expected: {'diff': 3457, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101111100101101; b = 15'b101000110101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3457, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011001001100110; b = 15'b111011001101000; bin = 1'b1; // Expected: {'diff': 15357, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011001001100110; b = 15'b111011001101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15357, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111100011111011; b = 15'b110001110001011; bin = 1'b1; // Expected: {'diff': 5487, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111100011111011; b = 15'b110001110001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5487, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110011111101100; b = 15'b110101000101010; bin = 1'b1; // Expected: {'diff': 32193, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110011111101100; b = 15'b110101000101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32193, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100010110000100; b = 15'b100011100111100; bin = 1'b0; // Expected: {'diff': 32328, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100010110000100; b = 15'b100011100111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32328, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000111101110; b = 15'b010001110000101; bin = 1'b0; // Expected: {'diff': 28265, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000111101110; b = 15'b010001110000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28265, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011001000000111; b = 15'b101010100000011; bin = 1'b0; // Expected: {'diff': 23812, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011001000000111; b = 15'b101010100000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23812, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100011011001; b = 15'b000100010111001; bin = 1'b0; // Expected: {'diff': 4128, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100011011001; b = 15'b000100010111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4128, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110011101011100; b = 15'b000100010010001; bin = 1'b0; // Expected: {'diff': 24267, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110011101011100; b = 15'b000100010010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24267, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111000010110; b = 15'b110001011000110; bin = 1'b0; // Expected: {'diff': 6992, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111000010110; b = 15'b110001011000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6992, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110000000001; b = 15'b001010001100101; bin = 1'b0; // Expected: {'diff': 18332, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110000000001; b = 15'b001010001100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18332, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111110101010010; b = 15'b101011001001110; bin = 1'b0; // Expected: {'diff': 9988, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111110101010010; b = 15'b101011001001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9988, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000111111111; b = 15'b011010101111010; bin = 1'b1; // Expected: {'diff': 19588, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000111111111; b = 15'b011010101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19588, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010010000000100; b = 15'b010010101111000; bin = 1'b0; // Expected: {'diff': 32396, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010010000000100; b = 15'b010010101111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32396, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000001000110; b = 15'b010011110001001; bin = 1'b1; // Expected: {'diff': 10428, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000001000110; b = 15'b010011110001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10428, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000011011100; b = 15'b010100001001111; bin = 1'b1; // Expected: {'diff': 26764, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000011011100; b = 15'b010100001001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26764, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110000001111101; b = 15'b100101001100100; bin = 1'b1; // Expected: {'diff': 5656, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110000001111101; b = 15'b100101001100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5656, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101001000101; b = 15'b111001011100001; bin = 1'b1; // Expected: {'diff': 18275, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101001000101; b = 15'b111001011100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18275, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100100010000; b = 15'b001111000100101; bin = 1'b1; // Expected: {'diff': 15082, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100100010000; b = 15'b001111000100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15082, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100010011001011; b = 15'b011111101001000; bin = 1'b1; // Expected: {'diff': 1410, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100010011001011; b = 15'b011111101001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1410, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100010011100; b = 15'b110001100100011; bin = 1'b0; // Expected: {'diff': 30073, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100010011100; b = 15'b110001100100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30073, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110011100110; b = 15'b010101111011110; bin = 1'b1; // Expected: {'diff': 16647, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110011100110; b = 15'b010101111011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16647, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010010001000000; b = 15'b001101110000101; bin = 1'b0; // Expected: {'diff': 2235, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010010001000000; b = 15'b001101110000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2235, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100111000000111; b = 15'b010111000011010; bin = 1'b1; // Expected: {'diff': 8172, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100111000000111; b = 15'b010111000011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8172, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101111001111; b = 15'b010111010111111; bin = 1'b1; // Expected: {'diff': 32015, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101111001111; b = 15'b010111010111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32015, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111001110001; b = 15'b011001101101011; bin = 1'b0; // Expected: {'diff': 19206, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111001110001; b = 15'b011001101101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19206, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001110001111011; b = 15'b000111100101000; bin = 1'b1; // Expected: {'diff': 3410, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001110001111011; b = 15'b000111100101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3410, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111100100010011; b = 15'b010100010100111; bin = 1'b0; // Expected: {'diff': 20588, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111100100010011; b = 15'b010100010100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20588, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110111100101101; b = 15'b001011111111101; bin = 1'b0; // Expected: {'diff': 22320, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110111100101101; b = 15'b001011111111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22320, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110010111101; b = 15'b010100000111001; bin = 1'b1; // Expected: {'diff': 5251, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110010111101; b = 15'b010100000111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5251, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100101011010; b = 15'b000110101111010; bin = 1'b1; // Expected: {'diff': 15327, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100101011010; b = 15'b000110101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15327, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010001110110; b = 15'b001111011110110; bin = 1'b1; // Expected: {'diff': 17791, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010001110110; b = 15'b001111011110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17791, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010100101001010; b = 15'b100010101101001; bin = 1'b1; // Expected: {'diff': 25568, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010100101001010; b = 15'b100010101101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25568, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101101101000100; b = 15'b010101010100111; bin = 1'b0; // Expected: {'diff': 12445, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101101101000100; b = 15'b010101010100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12445, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101001111100; b = 15'b110001001000000; bin = 1'b0; // Expected: {'diff': 6204, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101001111100; b = 15'b110001001000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6204, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000010101111100; b = 15'b111111101011110; bin = 1'b1; // Expected: {'diff': 1565, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000010101111100; b = 15'b111111101011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1565, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110001001101; b = 15'b000100101111111; bin = 1'b1; // Expected: {'diff': 13005, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110001001101; b = 15'b000100101111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13005, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100111110110110; b = 15'b100111101010111; bin = 1'b1; // Expected: {'diff': 94, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100111110110110; b = 15'b100111101010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 94, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000111001010100; b = 15'b111101001000101; bin = 1'b0; // Expected: {'diff': 5135, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000111001010100; b = 15'b111101001000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5135, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111100101110011; b = 15'b111011100110001; bin = 1'b1; // Expected: {'diff': 577, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111100101110011; b = 15'b111011100110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 577, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101111000011; b = 15'b110100111010000; bin = 1'b0; // Expected: {'diff': 12787, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101111000011; b = 15'b110100111010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12787, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000111011011000; b = 15'b010010000110010; bin = 1'b1; // Expected: {'diff': 27301, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000111011011000; b = 15'b010010000110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27301, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111011010100; b = 15'b011000010100110; bin = 1'b1; // Expected: {'diff': 20013, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111011010100; b = 15'b011000010100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20013, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010011011000; b = 15'b100111110101110; bin = 1'b1; // Expected: {'diff': 1321, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010011011000; b = 15'b100111110101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1321, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100101001110; b = 15'b101001011110011; bin = 1'b1; // Expected: {'diff': 1626, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100101001110; b = 15'b101001011110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1626, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100101111110110; b = 15'b010010010100000; bin = 1'b0; // Expected: {'diff': 10070, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100101111110110; b = 15'b010010010100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10070, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001110000011; b = 15'b101110111101100; bin = 1'b0; // Expected: {'diff': 17815, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001110000011; b = 15'b101110111101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17815, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101000111000; b = 15'b101110010100100; bin = 1'b1; // Expected: {'diff': 23955, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101000111000; b = 15'b101110010100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23955, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000001100010010; b = 15'b011100100101000; bin = 1'b1; // Expected: {'diff': 18921, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000001100010010; b = 15'b011100100101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18921, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001100111100; b = 15'b110101100101111; bin = 1'b0; // Expected: {'diff': 2061, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001100111100; b = 15'b110101100101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2061, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101100001011; b = 15'b011100101110000; bin = 1'b0; // Expected: {'diff': 29083, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101100001011; b = 15'b011100101110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29083, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101101110001; b = 15'b001010001001000; bin = 1'b1; // Expected: {'diff': 10024, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101101110001; b = 15'b001010001001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10024, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111011111001010; b = 15'b100011001110111; bin = 1'b0; // Expected: {'diff': 12627, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111011111001010; b = 15'b100011001110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12627, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101010001100; b = 15'b111011101001001; bin = 1'b1; // Expected: {'diff': 834, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101010001100; b = 15'b111011101001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 834, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000000011110; b = 15'b011001101100010; bin = 1'b1; // Expected: {'diff': 31931, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000000011110; b = 15'b011001101100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31931, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010011101111110; b = 15'b000110110110010; bin = 1'b1; // Expected: {'diff': 6603, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010011101111110; b = 15'b000110110110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6603, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100101000001101; b = 15'b101100010100110; bin = 1'b1; // Expected: {'diff': 29030, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100101000001101; b = 15'b101100010100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29030, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111011101001101; b = 15'b100010100011101; bin = 1'b1; // Expected: {'diff': 12847, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111011101001101; b = 15'b100010100011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12847, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001001011011; b = 15'b001110000100010; bin = 1'b1; // Expected: {'diff': 17976, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001001011011; b = 15'b001110000100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17976, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110101101110; b = 15'b110101101110100; bin = 1'b1; // Expected: {'diff': 505, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110101101110; b = 15'b110101101110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 505, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011111010000; b = 15'b000100101100111; bin = 1'b0; // Expected: {'diff': 20073, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011111010000; b = 15'b000100101100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20073, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001111101111111; b = 15'b111001111110100; bin = 1'b0; // Expected: {'diff': 11147, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001111101111111; b = 15'b111001111110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11147, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011001000001111; b = 15'b111111111011100; bin = 1'b0; // Expected: {'diff': 12851, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011001000001111; b = 15'b111111111011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12851, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101001000110110; b = 15'b000111000101001; bin = 1'b1; // Expected: {'diff': 17420, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101001000110110; b = 15'b000111000101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17420, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001011111100011; b = 15'b101100011010100; bin = 1'b1; // Expected: {'diff': 16142, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001011111100011; b = 15'b101100011010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16142, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000111010110; b = 15'b000111111001100; bin = 1'b0; // Expected: {'diff': 522, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000111010110; b = 15'b000111111001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 522, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011011011111101; b = 15'b111011110011001; bin = 1'b0; // Expected: {'diff': 16228, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011011011111101; b = 15'b111011110011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16228, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000101000011; b = 15'b111110110000000; bin = 1'b0; // Expected: {'diff': 5059, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000101000011; b = 15'b111110110000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5059, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000100000001; b = 15'b110001000110100; bin = 1'b1; // Expected: {'diff': 24268, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000100000001; b = 15'b110001000110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24268, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001010010011; b = 15'b011010111110100; bin = 1'b1; // Expected: {'diff': 27806, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001010010011; b = 15'b011010111110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27806, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010010100101000; b = 15'b101000101111100; bin = 1'b0; // Expected: {'diff': 21420, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010010100101000; b = 15'b101000101111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21420, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100100101001; b = 15'b000001010101101; bin = 1'b1; // Expected: {'diff': 22139, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100100101001; b = 15'b000001010101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22139, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000000011011; b = 15'b101001000001100; bin = 1'b0; // Expected: {'diff': 24079, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000000011011; b = 15'b101001000001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24079, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100010011110101; b = 15'b001000100001111; bin = 1'b0; // Expected: {'diff': 13286, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100010011110101; b = 15'b001000100001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13286, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111111110110; b = 15'b000011011110100; bin = 1'b0; // Expected: {'diff': 30978, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111111110110; b = 15'b000011011110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30978, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001100101101; b = 15'b111010001010111; bin = 1'b1; // Expected: {'diff': 11989, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001100101101; b = 15'b111010001010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11989, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001110000100; b = 15'b010110010100110; bin = 1'b0; // Expected: {'diff': 14046, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001110000100; b = 15'b010110010100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14046, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010000011100101; b = 15'b111111001110111; bin = 1'b0; // Expected: {'diff': 8814, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010000011100101; b = 15'b111111001110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8814, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000010100111001; b = 15'b110110010100011; bin = 1'b1; // Expected: {'diff': 6293, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000010100111001; b = 15'b110110010100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6293, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001111011101101; b = 15'b100111110001001; bin = 1'b0; // Expected: {'diff': 20324, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001111011101101; b = 15'b100111110001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20324, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111011101101011; b = 15'b100100001111000; bin = 1'b0; // Expected: {'diff': 12019, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111011101101011; b = 15'b100100001111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12019, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100110111111; b = 15'b110001110001100; bin = 1'b1; // Expected: {'diff': 26162, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100110111111; b = 15'b110001110001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26162, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010111100100010; b = 15'b100111110011101; bin = 1'b0; // Expected: {'diff': 24453, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010111100100010; b = 15'b100111110011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24453, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101001011010; b = 15'b101101011101001; bin = 1'b0; // Expected: {'diff': 16241, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101001011010; b = 15'b101101011101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16241, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000100101001000; b = 15'b011000110101001; bin = 1'b0; // Expected: {'diff': 22431, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000100101001000; b = 15'b011000110101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22431, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011100100011010; b = 15'b010000111000001; bin = 1'b1; // Expected: {'diff': 5976, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011100100011010; b = 15'b010000111000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5976, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011010100010; b = 15'b110111111100001; bin = 1'b1; // Expected: {'diff': 26304, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011010100010; b = 15'b110111111100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26304, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110101111111100; b = 15'b000100101101110; bin = 1'b0; // Expected: {'diff': 25230, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110101111111100; b = 15'b000100101101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25230, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010010011011; b = 15'b111000010000111; bin = 1'b0; // Expected: {'diff': 17428, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010010011011; b = 15'b111000010000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17428, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110111001111010; b = 15'b011111000001100; bin = 1'b1; // Expected: {'diff': 12397, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110111001111010; b = 15'b011111000001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12397, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110010001000; b = 15'b100111000000001; bin = 1'b0; // Expected: {'diff': 28295, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110010001000; b = 15'b100111000000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28295, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011000010000; b = 15'b011101100001111; bin = 1'b0; // Expected: {'diff': 6913, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011000010000; b = 15'b011101100001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6913, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101000010011; b = 15'b101111111000010; bin = 1'b1; // Expected: {'diff': 6736, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101000010011; b = 15'b101111111000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6736, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010111000010; b = 15'b100100100001011; bin = 1'b0; // Expected: {'diff': 7351, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010111000010; b = 15'b100100100001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7351, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100110010001101; b = 15'b011001001000101; bin = 1'b1; // Expected: {'diff': 6727, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100110010001101; b = 15'b011001001000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6727, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100000011111; b = 15'b110110001000101; bin = 1'b1; // Expected: {'diff': 23513, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100000011111; b = 15'b110110001000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23513, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110011100100000; b = 15'b010100011011101; bin = 1'b0; // Expected: {'diff': 15939, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110011100100000; b = 15'b010100011011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15939, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111010000110; b = 15'b110010111100000; bin = 1'b1; // Expected: {'diff': 6309, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111010000110; b = 15'b110010111100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6309, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000110100000100; b = 15'b011100011001110; bin = 1'b0; // Expected: {'diff': 21558, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000110100000100; b = 15'b011100011001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21558, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010110101011100; b = 15'b001111101000100; bin = 1'b0; // Expected: {'diff': 3608, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010110101011100; b = 15'b001111101000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3608, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011101010010; b = 15'b010001001111000; bin = 1'b0; // Expected: {'diff': 9434, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011101010010; b = 15'b010001001111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9434, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000001000110000; b = 15'b011110000010001; bin = 1'b0; // Expected: {'diff': 17951, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000001000110000; b = 15'b011110000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17951, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101110010011; b = 15'b010101111101111; bin = 1'b1; // Expected: {'diff': 4003, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101110010011; b = 15'b010101111101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4003, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010110100111; b = 15'b100101101100011; bin = 1'b1; // Expected: {'diff': 2627, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010110100111; b = 15'b100101101100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2627, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110110111010; b = 15'b100010011110001; bin = 1'b1; // Expected: {'diff': 10440, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110110111010; b = 15'b100010011110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10440, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001101110000; b = 15'b000110010000010; bin = 1'b0; // Expected: {'diff': 5870, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001101110000; b = 15'b000110010000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5870, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101011110101; b = 15'b111000110000001; bin = 1'b1; // Expected: {'diff': 10611, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101011110101; b = 15'b111000110000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10611, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101001100111100; b = 15'b110100001010100; bin = 1'b1; // Expected: {'diff': 27367, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101001100111100; b = 15'b110100001010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27367, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001110111010; b = 15'b111011010111011; bin = 1'b0; // Expected: {'diff': 27903, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001110111010; b = 15'b111011010111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27903, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111110001110100; b = 15'b110110010110000; bin = 1'b0; // Expected: {'diff': 4036, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111110001110100; b = 15'b110110010110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4036, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001010000011100; b = 15'b011010011100000; bin = 1'b1; // Expected: {'diff': 24379, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001010000011100; b = 15'b011010011100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24379, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011011000111; b = 15'b110010101001001; bin = 1'b1; // Expected: {'diff': 29053, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011011000111; b = 15'b110010101001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29053, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100101001100; b = 15'b010111010001100; bin = 1'b0; // Expected: {'diff': 27328, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100101001100; b = 15'b010111010001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27328, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100110101100101; b = 15'b101001101111011; bin = 1'b0; // Expected: {'diff': 31210, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100110101100101; b = 15'b101001101111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31210, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010000000011; b = 15'b000110001010001; bin = 1'b0; // Expected: {'diff': 22450, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010000000011; b = 15'b000110001010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22450, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110001001100; b = 15'b010111110100000; bin = 1'b1; // Expected: {'diff': 11435, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110001001100; b = 15'b010111110100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11435, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100101000111; b = 15'b010010010100010; bin = 1'b1; // Expected: {'diff': 29860, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100101000111; b = 15'b010010010100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29860, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101101101011; b = 15'b110100001000010; bin = 1'b1; // Expected: {'diff': 13096, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101101101011; b = 15'b110100001000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13096, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011101101010; b = 15'b000011101110110; bin = 1'b1; // Expected: {'diff': 16371, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011101101010; b = 15'b000011101110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16371, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111011101101011; b = 15'b110101100011110; bin = 1'b1; // Expected: {'diff': 3148, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111011101101011; b = 15'b110101100011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3148, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100101000100001; b = 15'b110100100101011; bin = 1'b0; // Expected: {'diff': 24822, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100101000100001; b = 15'b110100100101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24822, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111000000011101; b = 15'b011001001000101; bin = 1'b0; // Expected: {'diff': 15832, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111000000011101; b = 15'b011001001000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15832, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010111000100; b = 15'b001011100000110; bin = 1'b1; // Expected: {'diff': 16061, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010111000100; b = 15'b001011100000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16061, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000111110000; b = 15'b001100110010001; bin = 1'b1; // Expected: {'diff': 26718, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000111110000; b = 15'b001100110010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26718, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010010100100; b = 15'b101011110111011; bin = 1'b1; // Expected: {'diff': 3304, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010010100100; b = 15'b101011110111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3304, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100111110100; b = 15'b001010110000010; bin = 1'b0; // Expected: {'diff': 13426, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100111110100; b = 15'b001010110000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13426, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001010101100110; b = 15'b111001111011110; bin = 1'b0; // Expected: {'diff': 8584, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001010101100110; b = 15'b111001111011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8584, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100001010000; b = 15'b111010111111000; bin = 1'b1; // Expected: {'diff': 25175, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100001010000; b = 15'b111010111111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25175, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000110101011011; b = 15'b010000011011010; bin = 1'b1; // Expected: {'diff': 27776, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000110101011011; b = 15'b010000011011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27776, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101100110111; b = 15'b001101110111100; bin = 1'b1; // Expected: {'diff': 3962, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101100110111; b = 15'b001101110111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3962, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001011101010000; b = 15'b110001011000010; bin = 1'b1; // Expected: {'diff': 13453, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001011101010000; b = 15'b110001011000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13453, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110110001110; b = 15'b110001001100010; bin = 1'b0; // Expected: {'diff': 23340, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110110001110; b = 15'b110001001100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23340, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101111101000; b = 15'b010100110001011; bin = 1'b1; // Expected: {'diff': 4700, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101111101000; b = 15'b010100110001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4700, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101111000010; b = 15'b110001111000011; bin = 1'b1; // Expected: {'diff': 18430, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101111000010; b = 15'b110001111000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18430, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101100001101; b = 15'b010000000111110; bin = 1'b1; // Expected: {'diff': 31438, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101100001101; b = 15'b010000000111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31438, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010110100001; b = 15'b001101000101000; bin = 1'b1; // Expected: {'diff': 15224, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010110100001; b = 15'b001101000101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15224, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100100101001; b = 15'b100111101101010; bin = 1'b0; // Expected: {'diff': 31167, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100100101001; b = 15'b100111101101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31167, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101011110001; b = 15'b101100010000110; bin = 1'b1; // Expected: {'diff': 8810, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101011110001; b = 15'b101100010000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8810, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010110001100110; b = 15'b110011010111100; bin = 1'b0; // Expected: {'diff': 17834, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010110001100110; b = 15'b110011010111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17834, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000011110111; b = 15'b111101111100100; bin = 1'b1; // Expected: {'diff': 17682, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000011110111; b = 15'b111101111100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17682, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111011101110010; b = 15'b011000100110101; bin = 1'b1; // Expected: {'diff': 17980, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111011101110010; b = 15'b011000100110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17980, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011011100110; b = 15'b110110110110100; bin = 1'b0; // Expected: {'diff': 22834, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011011100110; b = 15'b110110110110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22834, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100010001010010; b = 15'b011001110110010; bin = 1'b0; // Expected: {'diff': 4256, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100010001010010; b = 15'b011001110110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4256, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111010001101; b = 15'b101001000100110; bin = 1'b1; // Expected: {'diff': 11366, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111010001101; b = 15'b101001000100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11366, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000101011000111; b = 15'b010101010100010; bin = 1'b1; // Expected: {'diff': 24612, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000101011000111; b = 15'b010101010100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24612, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111110010111000; b = 15'b100000101110101; bin = 1'b1; // Expected: {'diff': 15170, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111110010111000; b = 15'b100000101110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15170, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110011101001; b = 15'b101111011011110; bin = 1'b1; // Expected: {'diff': 32266, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110011101001; b = 15'b101111011011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32266, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100101001010; b = 15'b101000000100110; bin = 1'b1; // Expected: {'diff': 31011, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100101001010; b = 15'b101000000100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31011, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001101001111; b = 15'b011111110101001; bin = 1'b0; // Expected: {'diff': 25510, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001101001111; b = 15'b011111110101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25510, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100110010000001; b = 15'b011101100111010; bin = 1'b1; // Expected: {'diff': 4422, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100110010000001; b = 15'b011101100111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4422, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001110000110010; b = 15'b101010110000000; bin = 1'b0; // Expected: {'diff': 18098, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001110000110010; b = 15'b101010110000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18098, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101001000110111; b = 15'b110001111110111; bin = 1'b1; // Expected: {'diff': 28223, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101001000110111; b = 15'b110001111110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28223, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011011010000; b = 15'b010001010001110; bin = 1'b1; // Expected: {'diff': 25665, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011011010000; b = 15'b010001010001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25665, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100000011110; b = 15'b010101110000110; bin = 1'b0; // Expected: {'diff': 27800, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100000011110; b = 15'b010101110000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27800, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101111000110011; b = 15'b100101110010011; bin = 1'b1; // Expected: {'diff': 4767, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101111000110011; b = 15'b100101110010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4767, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010011010100101; b = 15'b010000110001111; bin = 1'b0; // Expected: {'diff': 1302, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010011010100101; b = 15'b010000110001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1302, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111000000001111; b = 15'b011001001001011; bin = 1'b0; // Expected: {'diff': 15812, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111000000001111; b = 15'b011001001001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15812, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001011000111011; b = 15'b110001101000001; bin = 1'b1; // Expected: {'diff': 13049, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001011000111011; b = 15'b110001101000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13049, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101000100110; b = 15'b100000110110011; bin = 1'b1; // Expected: {'diff': 22642, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101000100110; b = 15'b100000110110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22642, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000010010101; b = 15'b111011101110010; bin = 1'b0; // Expected: {'diff': 14627, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000010010101; b = 15'b111011101110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14627, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101010010010; b = 15'b101001011111110; bin = 1'b0; // Expected: {'diff': 22420, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101010010010; b = 15'b101001011111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22420, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100110010110110; b = 15'b101101000101001; bin = 1'b1; // Expected: {'diff': 29324, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100110010110110; b = 15'b101101000101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29324, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110100101000; b = 15'b010001011010001; bin = 1'b1; // Expected: {'diff': 19030, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110100101000; b = 15'b010001011010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19030, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000000010011; b = 15'b011110110010101; bin = 1'b0; // Expected: {'diff': 4734, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000000010011; b = 15'b011110110010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4734, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001010000010; b = 15'b000010011010010; bin = 1'b0; // Expected: {'diff': 7600, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001010000010; b = 15'b000010011010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7600, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001011100001110; b = 15'b010110000011000; bin = 1'b1; // Expected: {'diff': 27381, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001011100001110; b = 15'b010110000011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27381, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000101111010; b = 15'b111100011011101; bin = 1'b0; // Expected: {'diff': 18589, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000101111010; b = 15'b111100011011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18589, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010100011111111; b = 15'b111011011101101; bin = 1'b1; // Expected: {'diff': 12817, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010100011111111; b = 15'b111011011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12817, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001011111000000; b = 15'b111101010110111; bin = 1'b1; // Expected: {'diff': 7432, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001011111000000; b = 15'b111101010110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7432, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101010001001; b = 15'b000001100100011; bin = 1'b1; // Expected: {'diff': 5989, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101010001001; b = 15'b000001100100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5989, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101101100011001; b = 15'b100011010011011; bin = 1'b1; // Expected: {'diff': 5245, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101101100011001; b = 15'b100011010011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5245, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000001011001100; b = 15'b011111001100111; bin = 1'b1; // Expected: {'diff': 17508, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000001011001100; b = 15'b011111001100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17508, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000001100010101; b = 15'b100010110001100; bin = 1'b0; // Expected: {'diff': 15753, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000001100010101; b = 15'b100010110001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15753, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000000101110; b = 15'b111010010000010; bin = 1'b1; // Expected: {'diff': 19371, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000000101110; b = 15'b111010010000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19371, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011110111010; b = 15'b001001001011111; bin = 1'b1; // Expected: {'diff': 13658, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011110111010; b = 15'b001001001011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13658, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101111000110; b = 15'b000000100101111; bin = 1'b0; // Expected: {'diff': 31383, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101111000110; b = 15'b000000100101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31383, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011001011000010; b = 15'b001111110001100; bin = 1'b1; // Expected: {'diff': 4917, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011001011000010; b = 15'b001111110001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4917, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010110001111; b = 15'b010001010001101; bin = 1'b0; // Expected: {'diff': 17154, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010110001111; b = 15'b010001010001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17154, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110000000010; b = 15'b111101110100011; bin = 1'b1; // Expected: {'diff': 16478, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110000000010; b = 15'b111101110100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16478, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000001001010; b = 15'b011100011100101; bin = 1'b1; // Expected: {'diff': 30564, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000001001010; b = 15'b011100011100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30564, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010100100110010; b = 15'b111001100010100; bin = 1'b0; // Expected: {'diff': 13854, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010100100110010; b = 15'b111001100010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13854, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111000000101111; b = 15'b011111111010111; bin = 1'b0; // Expected: {'diff': 12376, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111000000101111; b = 15'b011111111010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12376, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001001100010101; b = 15'b110010010101001; bin = 1'b0; // Expected: {'diff': 11884, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001001100010101; b = 15'b110010010101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11884, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001001101101101; b = 15'b110100011011101; bin = 1'b1; // Expected: {'diff': 10895, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001001101101101; b = 15'b110100011011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10895, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101111001001; b = 15'b010011011101100; bin = 1'b1; // Expected: {'diff': 5340, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101111001001; b = 15'b010011011101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5340, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110111111010010; b = 15'b111110001001001; bin = 1'b1; // Expected: {'diff': 29576, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110111111010010; b = 15'b111110001001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29576, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000110101110110; b = 15'b100101010010101; bin = 1'b0; // Expected: {'diff': 17121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000110101110110; b = 15'b100101010010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101111000001; b = 15'b101100100101010; bin = 1'b0; // Expected: {'diff': 17047, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101111000001; b = 15'b101100100101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17047, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101110001000; b = 15'b110111011000110; bin = 1'b0; // Expected: {'diff': 19650, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101110001000; b = 15'b110111011000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19650, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001001001001; b = 15'b000100100111001; bin = 1'b1; // Expected: {'diff': 26895, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001001001001; b = 15'b000100100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26895, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010000010001011; b = 15'b011110001110011; bin = 1'b0; // Expected: {'diff': 25624, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010000010001011; b = 15'b011110001110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25624, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101101000100; b = 15'b010100111101000; bin = 1'b0; // Expected: {'diff': 29020, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101101000100; b = 15'b010100111101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29020, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101100011100; b = 15'b011110101010111; bin = 1'b1; // Expected: {'diff': 24004, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101100011100; b = 15'b011110101010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24004, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111101011100; b = 15'b001011001011000; bin = 1'b1; // Expected: {'diff': 26883, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111101011100; b = 15'b001011001011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26883, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110010110110; b = 15'b011000010110100; bin = 1'b1; // Expected: {'diff': 15361, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110010110110; b = 15'b011000010110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15361, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000111000110; b = 15'b101101101100111; bin = 1'b1; // Expected: {'diff': 30302, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000111000110; b = 15'b101101101100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30302, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000010101010; b = 15'b000011000000001; bin = 1'b1; // Expected: {'diff': 10920, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000010101010; b = 15'b000011000000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10920, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111100100111100; b = 15'b100100001101100; bin = 1'b0; // Expected: {'diff': 12496, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111100100111100; b = 15'b100100001101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12496, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110110111101; b = 15'b110111011101101; bin = 1'b0; // Expected: {'diff': 32464, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110110111101; b = 15'b110111011101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32464, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001011000000101; b = 15'b010010001011100; bin = 1'b0; // Expected: {'diff': 29097, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001011000000101; b = 15'b010010001011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29097, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010010001111; b = 15'b111100111011011; bin = 1'b0; // Expected: {'diff': 27316, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010010001111; b = 15'b111100111011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27316, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100110111110000; b = 15'b111011101101100; bin = 1'b1; // Expected: {'diff': 22147, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100110111110000; b = 15'b111011101101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22147, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110001000001; b = 15'b111010001010101; bin = 1'b1; // Expected: {'diff': 26603, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110001000001; b = 15'b111010001010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26603, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111000000110101; b = 15'b011001101110111; bin = 1'b0; // Expected: {'diff': 15550, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111000000110101; b = 15'b011001101110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15550, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010000110111010; b = 15'b010111000000100; bin = 1'b0; // Expected: {'diff': 29622, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010000110111010; b = 15'b010111000000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29622, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101111010011001; b = 15'b000000000011010; bin = 1'b0; // Expected: {'diff': 24191, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101111010011001; b = 15'b000000000011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24191, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001110010001; b = 15'b010010011101111; bin = 1'b1; // Expected: {'diff': 20129, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001110010001; b = 15'b010010011101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20129, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100010011100010; b = 15'b001110111100110; bin = 1'b1; // Expected: {'diff': 9979, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100010011100010; b = 15'b001110111100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9979, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001000100000; b = 15'b011000011000010; bin = 1'b1; // Expected: {'diff': 12637, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001000100000; b = 15'b011000011000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12637, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010000100010000; b = 15'b111100101101000; bin = 1'b0; // Expected: {'diff': 10152, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010000100010000; b = 15'b111100101101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10152, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110111011001; b = 15'b111001001101100; bin = 1'b0; // Expected: {'diff': 27501, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110111011001; b = 15'b111001001101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27501, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000100110100000; b = 15'b111101010001110; bin = 1'b1; // Expected: {'diff': 3857, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000100110100000; b = 15'b111101010001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3857, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010000101011011; b = 15'b101010110001101; bin = 1'b1; // Expected: {'diff': 19405, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010000101011011; b = 15'b101010110001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19405, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100110110001; b = 15'b100111101100000; bin = 1'b1; // Expected: {'diff': 19024, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100110110001; b = 15'b100111101100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19024, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110000000010; b = 15'b000100100111000; bin = 1'b1; // Expected: {'diff': 13001, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110000000010; b = 15'b000100100111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13001, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000100110101110; b = 15'b000011001011110; bin = 1'b1; // Expected: {'diff': 847, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b000100110101110; b = 15'b000011001011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 847, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001010010001; b = 15'b110011001100000; bin = 1'b0; // Expected: {'diff': 31793, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001010010001; b = 15'b110011001100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31793, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100110101010001; b = 15'b101101010110111; bin = 1'b1; // Expected: {'diff': 29337, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100110101010001; b = 15'b101101010110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29337, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001010000100011; b = 15'b001110010111011; bin = 1'b0; // Expected: {'diff': 30568, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001010000100011; b = 15'b001110010111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30568, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101010010000; b = 15'b110100100111101; bin = 1'b1; // Expected: {'diff': 4434, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101010010000; b = 15'b110100100111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4434, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010000000100111; b = 15'b111011110100111; bin = 1'b1; // Expected: {'diff': 10367, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010000000100111; b = 15'b111011110100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10367, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011010111010; b = 15'b110001010101010; bin = 1'b1; // Expected: {'diff': 25615, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011010111010; b = 15'b110001010101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25615, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000010001001110; b = 15'b011011001101000; bin = 1'b1; // Expected: {'diff': 19941, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000010001001110; b = 15'b011011001101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19941, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011100100100000; b = 15'b101010110001111; bin = 1'b1; // Expected: {'diff': 25488, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011100100100000; b = 15'b101010110001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25488, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111110110110111; b = 15'b000000000110010; bin = 1'b1; // Expected: {'diff': 32132, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111110110110111; b = 15'b000000000110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32132, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001111110100; b = 15'b001011101001010; bin = 1'b1; // Expected: {'diff': 3241, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001111110100; b = 15'b001011101001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3241, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100111010000001; b = 15'b010000000010111; bin = 1'b0; // Expected: {'diff': 11882, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100111010000001; b = 15'b010000000010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11882, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111001111101; b = 15'b110001100000001; bin = 1'b0; // Expected: {'diff': 7036, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111001111101; b = 15'b110001100000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7036, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001110101110000; b = 15'b100000011101110; bin = 1'b0; // Expected: {'diff': 23682, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001110101110000; b = 15'b100000011101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23682, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010010100110000; b = 15'b000100001011100; bin = 1'b1; // Expected: {'diff': 7379, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010010100110000; b = 15'b000100001011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7379, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111110100000; b = 15'b111111010000100; bin = 1'b1; // Expected: {'diff': 283, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111110100000; b = 15'b111111010000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 283, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000101011111010; b = 15'b010101100011100; bin = 1'b1; // Expected: {'diff': 24541, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000101011111010; b = 15'b010101100011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24541, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101111001011100; b = 15'b001100100100110; bin = 1'b1; // Expected: {'diff': 17717, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101111001011100; b = 15'b001100100100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17717, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010100110101011; b = 15'b010011000011110; bin = 1'b1; // Expected: {'diff': 908, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010100110101011; b = 15'b010011000011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 908, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110010010101; b = 15'b101000010011101; bin = 1'b0; // Expected: {'diff': 7160, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110010010101; b = 15'b101000010011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7160, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110000110100000; b = 15'b001111100101100; bin = 1'b0; // Expected: {'diff': 17012, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110000110100000; b = 15'b001111100101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17012, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000001000101; b = 15'b010001001110011; bin = 1'b1; // Expected: {'diff': 3537, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000001000101; b = 15'b010001001110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3537, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000110010000; b = 15'b011101001000001; bin = 1'b0; // Expected: {'diff': 5967, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000110010000; b = 15'b011101001000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5967, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100111101011001; b = 15'b101000011111110; bin = 1'b0; // Expected: {'diff': 32347, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100111101011001; b = 15'b101000011111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32347, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100111010101100; b = 15'b001110101000100; bin = 1'b1; // Expected: {'diff': 12647, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100111010101100; b = 15'b001110101000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12647, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010010010011100; b = 15'b010011100011001; bin = 1'b0; // Expected: {'diff': 32131, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010010010011100; b = 15'b010011100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32131, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010100101110111; b = 15'b000010111100010; bin = 1'b0; // Expected: {'diff': 9109, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010100101110111; b = 15'b000010111100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9109, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101000001001; b = 15'b000011000010011; bin = 1'b1; // Expected: {'diff': 29685, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101000001001; b = 15'b000011000010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29685, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011011011100; b = 15'b101101001010000; bin = 1'b0; // Expected: {'diff': 27788, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011011011100; b = 15'b101101001010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27788, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000011010001; b = 15'b111000100100011; bin = 1'b1; // Expected: {'diff': 4013, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000011010001; b = 15'b111000100100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4013, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110100000101011; b = 15'b101010011111011; bin = 1'b0; // Expected: {'diff': 4912, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110100000101011; b = 15'b101010011111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4912, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000111100001110; b = 15'b110110011101011; bin = 1'b1; // Expected: {'diff': 8738, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000111100001110; b = 15'b110110011101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8738, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110010101110; b = 15'b100111111011000; bin = 1'b1; // Expected: {'diff': 27861, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110010101110; b = 15'b100111111011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27861, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110100111001111; b = 15'b010011001010111; bin = 1'b0; // Expected: {'diff': 17272, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110100111001111; b = 15'b010011001010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17272, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110111000001; b = 15'b100011111000001; bin = 1'b0; // Expected: {'diff': 5632, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110111000001; b = 15'b100011111000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5632, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010011000111000; b = 15'b111001001000110; bin = 1'b0; // Expected: {'diff': 13298, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010011000111000; b = 15'b111001001000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13298, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100111000001; b = 15'b100010101011001; bin = 1'b1; // Expected: {'diff': 5223, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100111000001; b = 15'b100010101011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5223, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111011100010101; b = 15'b000010001001010; bin = 1'b0; // Expected: {'diff': 29387, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111011100010101; b = 15'b000010001001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29387, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001111110010100; b = 15'b000100100000000; bin = 1'b1; // Expected: {'diff': 5779, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001111110010100; b = 15'b000100100000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5779, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010001010010; b = 15'b000100110110010; bin = 1'b0; // Expected: {'diff': 10912, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010001010010; b = 15'b000100110110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10912, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010101001100; b = 15'b011101010101110; bin = 1'b1; // Expected: {'diff': 6813, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010101001100; b = 15'b011101010101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6813, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010000110100; b = 15'b100010010101100; bin = 1'b1; // Expected: {'diff': 3975, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010000110100; b = 15'b100010010101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3975, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101000110011; b = 15'b011110010101101; bin = 1'b1; // Expected: {'diff': 28037, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101000110011; b = 15'b011110010101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28037, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100101101101111; b = 15'b101001000000110; bin = 1'b0; // Expected: {'diff': 31081, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100101101101111; b = 15'b101001000000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31081, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010110110011; b = 15'b100110001011011; bin = 1'b1; // Expected: {'diff': 2391, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010110110011; b = 15'b100110001011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2391, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011111011111000; b = 15'b101001000111011; bin = 1'b1; // Expected: {'diff': 27836, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011111011111000; b = 15'b101001000111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27836, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110011011011; b = 15'b000110110101000; bin = 1'b0; // Expected: {'diff': 12083, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110011011011; b = 15'b000110110101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12083, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100001010110011; b = 15'b101101111000010; bin = 1'b1; // Expected: {'diff': 26352, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100001010110011; b = 15'b101101111000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26352, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110011100000110; b = 15'b101110111110100; bin = 1'b1; // Expected: {'diff': 2321, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110011100000110; b = 15'b101110111110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2321, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001010100101010; b = 15'b011011101101101; bin = 1'b0; // Expected: {'diff': 23997, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001010100101010; b = 15'b011011101101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23997, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110100011101; b = 15'b000101010110011; bin = 1'b1; // Expected: {'diff': 25193, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110100011101; b = 15'b000101010110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25193, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110011011000111; b = 15'b000101010000101; bin = 1'b1; // Expected: {'diff': 23617, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110011011000111; b = 15'b000101010000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23617, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001001110101; b = 15'b101011001010011; bin = 1'b0; // Expected: {'diff': 7202, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001001110101; b = 15'b101011001010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7202, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111110101100011; b = 15'b101100101110101; bin = 1'b1; // Expected: {'diff': 9197, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111110101100011; b = 15'b101100101110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9197, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101100110110; b = 15'b001101111111001; bin = 1'b0; // Expected: {'diff': 7997, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101100110110; b = 15'b001101111111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7997, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111010001011010; b = 15'b011000001101100; bin = 1'b0; // Expected: {'diff': 17390, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111010001011010; b = 15'b011000001101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17390, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001111101110; b = 15'b100100110011101; bin = 1'b0; // Expected: {'diff': 10833, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001111101110; b = 15'b100100110011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10833, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011010101110; b = 15'b001110100100011; bin = 1'b0; // Expected: {'diff': 14731, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011010101110; b = 15'b001110100100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14731, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100110101011101; b = 15'b001111001111010; bin = 1'b0; // Expected: {'diff': 12003, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100110101011101; b = 15'b001111001111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12003, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100110011011; b = 15'b110101011101011; bin = 1'b0; // Expected: {'diff': 24240, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100110011011; b = 15'b110101011101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24240, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101101010110; b = 15'b101000000101111; bin = 1'b1; // Expected: {'diff': 23334, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101101010110; b = 15'b101000000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23334, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011000001011; b = 15'b001100110111101; bin = 1'b1; // Expected: {'diff': 15437, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011000001011; b = 15'b001100110111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15437, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001111010011110; b = 15'b100111010111111; bin = 1'b1; // Expected: {'diff': 20446, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001111010011110; b = 15'b100111010111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20446, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001100101010; b = 15'b000001100100110; bin = 1'b1; // Expected: {'diff': 28675, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001100101010; b = 15'b000001100100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28675, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110101001000001; b = 15'b000110100000101; bin = 1'b0; // Expected: {'diff': 23868, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110101001000001; b = 15'b000110100000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23868, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011001010110001; b = 15'b101100010111101; bin = 1'b1; // Expected: {'diff': 23027, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011001010110001; b = 15'b101100010111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23027, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011010001001; b = 15'b101100011100000; bin = 1'b1; // Expected: {'diff': 11688, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011010001001; b = 15'b101100011100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11688, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010000010100011; b = 15'b100110011001010; bin = 1'b0; // Expected: {'diff': 21465, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010000010100011; b = 15'b100110011001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21465, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110100101101001; b = 15'b000001010000101; bin = 1'b1; // Expected: {'diff': 26339, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110100101101001; b = 15'b000001010000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26339, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011011110111000; b = 15'b000111010010010; bin = 1'b0; // Expected: {'diff': 10534, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011011110111000; b = 15'b000111010010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10534, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001101101110; b = 15'b010000111101001; bin = 1'b1; // Expected: {'diff': 16772, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001101101110; b = 15'b010000111101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16772, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000110000100; b = 15'b011111000011111; bin = 1'b1; // Expected: {'diff': 29540, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000110000100; b = 15'b011111000011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29540, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000101000111000; b = 15'b110001010000011; bin = 1'b0; // Expected: {'diff': 10165, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000101000111000; b = 15'b110001010000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10165, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000000001011; b = 15'b110101111100001; bin = 1'b0; // Expected: {'diff': 5162, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000000001011; b = 15'b110101111100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5162, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001010010001000; b = 15'b101000101000001; bin = 1'b1; // Expected: {'diff': 17222, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001010010001000; b = 15'b101000101000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17222, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011011101101; b = 15'b101000110100100; bin = 1'b1; // Expected: {'diff': 30024, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011011101101; b = 15'b101000110100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30024, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101110001110; b = 15'b110011010100110; bin = 1'b1; // Expected: {'diff': 21735, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101110001110; b = 15'b110011010100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21735, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000111010010; b = 15'b100101101101001; bin = 1'b0; // Expected: {'diff': 1641, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000111010010; b = 15'b100101101101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1641, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110000111111111; b = 15'b101101001010011; bin = 1'b0; // Expected: {'diff': 1964, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110000111111111; b = 15'b101101001010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1964, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010011110100011; b = 15'b001101000101100; bin = 1'b0; // Expected: {'diff': 3447, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010011110100011; b = 15'b001101000101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3447, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110111110001001; b = 15'b101001111010111; bin = 1'b0; // Expected: {'diff': 7090, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110111110001001; b = 15'b101001111010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7090, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000001111011; b = 15'b110001101110110; bin = 1'b1; // Expected: {'diff': 11524, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000001111011; b = 15'b110001101110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11524, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100010010110001; b = 15'b100111110001110; bin = 1'b1; // Expected: {'diff': 29986, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100010010110001; b = 15'b100111110001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29986, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110101011010; b = 15'b001010010111111; bin = 1'b0; // Expected: {'diff': 22683, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110101011010; b = 15'b001010010111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22683, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110100111001111; b = 15'b011100000000100; bin = 1'b0; // Expected: {'diff': 12747, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110100111001111; b = 15'b011100000000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12747, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010111010101111; b = 15'b011000101000111; bin = 1'b0; // Expected: {'diff': 32104, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010111010101111; b = 15'b011000101000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32104, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011100000111101; b = 15'b101101110010010; bin = 1'b1; // Expected: {'diff': 23722, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011100000111101; b = 15'b101101110010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23722, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110101000000101; b = 15'b101011101010010; bin = 1'b1; // Expected: {'diff': 4786, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110101000000101; b = 15'b101011101010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4786, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011011111011; b = 15'b011011101100001; bin = 1'b0; // Expected: {'diff': 20378, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011011111011; b = 15'b011011101100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20378, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000011111001; b = 15'b111101101000100; bin = 1'b1; // Expected: {'diff': 17844, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000011111001; b = 15'b111101101000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17844, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000110101101000; b = 15'b010100011000010; bin = 1'b0; // Expected: {'diff': 25766, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000110101101000; b = 15'b010100011000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25766, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000111100011001; b = 15'b011111010101001; bin = 1'b1; // Expected: {'diff': 20591, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000111100011001; b = 15'b011111010101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20591, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011101000011; b = 15'b010010100001100; bin = 1'b0; // Expected: {'diff': 8759, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011101000011; b = 15'b010010100001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8759, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110111110001000; b = 15'b100101011010110; bin = 1'b1; // Expected: {'diff': 9393, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110111110001000; b = 15'b100101011010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9393, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000111000011; b = 15'b010111000010101; bin = 1'b0; // Expected: {'diff': 21422, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000111000011; b = 15'b010111000010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21422, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000001110011; b = 15'b010111000001100; bin = 1'b1; // Expected: {'diff': 21094, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000001110011; b = 15'b010111000001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21094, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000101011000; b = 15'b101100101101000; bin = 1'b1; // Expected: {'diff': 22511, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000101011000; b = 15'b101100101101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22511, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011110011001101; b = 15'b101001011111100; bin = 1'b1; // Expected: {'diff': 27088, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011110011001101; b = 15'b101001011111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27088, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001110000011000; b = 15'b011011101101110; bin = 1'b1; // Expected: {'diff': 25769, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001110000011000; b = 15'b011011101101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25769, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001111110001101; b = 15'b111011010000100; bin = 1'b0; // Expected: {'diff': 10505, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001111110001101; b = 15'b111011010000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10505, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100001110001001; b = 15'b100100101100001; bin = 1'b0; // Expected: {'diff': 31272, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100001110001001; b = 15'b100100101100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31272, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011001010000; b = 15'b100000000001010; bin = 1'b0; // Expected: {'diff': 17990, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011001010000; b = 15'b100000000001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17990, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000100101001; b = 15'b011010000110110; bin = 1'b1; // Expected: {'diff': 3314, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000100101001; b = 15'b011010000110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3314, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101111110000; b = 15'b110011011110001; bin = 1'b1; // Expected: {'diff': 21758, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101111110000; b = 15'b110011011110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21758, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001010101000101; b = 15'b100111110001111; bin = 1'b0; // Expected: {'diff': 17846, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001010101000101; b = 15'b100111110001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17846, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111100101101100; b = 15'b001110001010001; bin = 1'b1; // Expected: {'diff': 23834, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111100101101100; b = 15'b001110001010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23834, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000101100101; b = 15'b101000110111100; bin = 1'b0; // Expected: {'diff': 24489, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000101100101; b = 15'b101000110111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24489, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010100010011100; b = 15'b110001011010111; bin = 1'b0; // Expected: {'diff': 17861, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010100010011100; b = 15'b110001011010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17861, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011110001100; b = 15'b010100010010100; bin = 1'b1; // Expected: {'diff': 7927, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011110001100; b = 15'b010100010010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7927, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111110100011; b = 15'b000011100000001; bin = 1'b1; // Expected: {'diff': 30881, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111110100011; b = 15'b000011100000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30881, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001010110000110; b = 15'b000111101100111; bin = 1'b1; // Expected: {'diff': 1566, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001010110000110; b = 15'b000111101100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1566, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111010001101100; b = 15'b000100101011101; bin = 1'b0; // Expected: {'diff': 27407, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111010001101100; b = 15'b000100101011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27407, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000101101001110; b = 15'b101011010000010; bin = 1'b1; // Expected: {'diff': 13515, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000101101001110; b = 15'b101011010000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13515, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100000111110; b = 15'b111010001100011; bin = 1'b1; // Expected: {'diff': 9178, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100000111110; b = 15'b111010001100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9178, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101011111110; b = 15'b110111101001100; bin = 1'b1; // Expected: {'diff': 11185, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101011111110; b = 15'b110111101001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11185, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110100010000; b = 15'b100011111010110; bin = 1'b0; // Expected: {'diff': 9530, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110100010000; b = 15'b100011111010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9530, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010111000011; b = 15'b011110100011110; bin = 1'b0; // Expected: {'diff': 6309, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010111000011; b = 15'b011110100011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6309, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100110000000111; b = 15'b011111100100100; bin = 1'b0; // Expected: {'diff': 3299, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100110000000111; b = 15'b011111100100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3299, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101100111000; b = 15'b000110011110110; bin = 1'b1; // Expected: {'diff': 11841, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101100111000; b = 15'b000110011110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11841, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010110011000; b = 15'b001011110000001; bin = 1'b1; // Expected: {'diff': 7702, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010110011000; b = 15'b001011110000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7702, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000000111001; b = 15'b011001011101110; bin = 1'b1; // Expected: {'diff': 32074, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000000111001; b = 15'b011001011101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32074, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001000101000; b = 15'b111110011100110; bin = 1'b0; // Expected: {'diff': 30018, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001000101000; b = 15'b111110011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30018, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010111111011100; b = 15'b000111000000010; bin = 1'b0; // Expected: {'diff': 8666, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010111111011100; b = 15'b000111000000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8666, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110011011011010; b = 15'b111100101010000; bin = 1'b1; // Expected: {'diff': 28041, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110011011011010; b = 15'b111100101010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28041, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100110011000100; b = 15'b000110100101011; bin = 1'b1; // Expected: {'diff': 16280, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100110011000100; b = 15'b000110100101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16280, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110100011010010; b = 15'b000001010111001; bin = 1'b0; // Expected: {'diff': 26137, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110100011010010; b = 15'b000001010111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26137, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110100101111001; b = 15'b100111101000100; bin = 1'b1; // Expected: {'diff': 6708, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110100101111001; b = 15'b100111101000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6708, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111010010110; b = 15'b011110000111010; bin = 1'b1; // Expected: {'diff': 16987, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111010010110; b = 15'b011110000111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16987, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011101100011; b = 15'b110100101100100; bin = 1'b1; // Expected: {'diff': 28158, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011101100011; b = 15'b110100101100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28158, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110100100000101; b = 15'b000110110001000; bin = 1'b1; // Expected: {'diff': 23420, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110100100000101; b = 15'b000110110001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23420, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011011010011011; b = 15'b011111000101110; bin = 1'b0; // Expected: {'diff': 30829, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011011010011011; b = 15'b011111000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30829, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010110000110; b = 15'b010001110101000; bin = 1'b1; // Expected: {'diff': 16861, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010110000110; b = 15'b010001110101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16861, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100100011100111; b = 15'b101011011101110; bin = 1'b0; // Expected: {'diff': 29177, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100100011100111; b = 15'b101011011101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29177, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011010001100; b = 15'b010100111011001; bin = 1'b0; // Expected: {'diff': 23731, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011010001100; b = 15'b010100111011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23731, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001001100001; b = 15'b110110110110000; bin = 1'b1; // Expected: {'diff': 29872, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001001100001; b = 15'b110110110110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29872, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000101111110; b = 15'b101100010000001; bin = 1'b1; // Expected: {'diff': 14588, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000101111110; b = 15'b101100010000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14588, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010110110100100; b = 15'b001000000101100; bin = 1'b1; // Expected: {'diff': 7543, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010110110100100; b = 15'b001000000101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7543, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001000101001; b = 15'b011110010101111; bin = 1'b1; // Expected: {'diff': 9593, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001000101001; b = 15'b011110010101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9593, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101011111001; b = 15'b000100111101110; bin = 1'b0; // Expected: {'diff': 12555, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101011111001; b = 15'b000100111101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12555, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110101000000010; b = 15'b011011101100111; bin = 1'b0; // Expected: {'diff': 12955, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110101000000010; b = 15'b011011101100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12955, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111010101010100; b = 15'b111011100111011; bin = 1'b1; // Expected: {'diff': 32280, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b111010101010100; b = 15'b111011100111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32280, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011100100000000; b = 15'b101010001000011; bin = 1'b0; // Expected: {'diff': 25789, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011100100000000; b = 15'b101010001000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25789, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010111010101111; b = 15'b111001100111111; bin = 1'b1; // Expected: {'diff': 15215, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010111010101111; b = 15'b111001100111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15215, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100000011010111; b = 15'b100110100000001; bin = 1'b1; // Expected: {'diff': 29653, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100000011010111; b = 15'b100110100000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29653, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001101110100; b = 15'b001000101000001; bin = 1'b1; // Expected: {'diff': 4658, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001101110100; b = 15'b001000101000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4658, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101111000010111; b = 15'b010010001000011; bin = 1'b1; // Expected: {'diff': 14803, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101111000010111; b = 15'b010010001000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14803, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110101100011010; b = 15'b110000000101110; bin = 1'b0; // Expected: {'diff': 2796, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110101100011010; b = 15'b110000000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2796, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000110011100; b = 15'b010010000011001; bin = 1'b1; // Expected: {'diff': 11650, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000110011100; b = 15'b010010000011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11650, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100111000111; b = 15'b111100011010111; bin = 1'b0; // Expected: {'diff': 8432, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100111000111; b = 15'b111100011010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8432, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001011000101100; b = 15'b100000000110110; bin = 1'b0; // Expected: {'diff': 22006, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001011000101100; b = 15'b100000000110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22006, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110111101101010; b = 15'b110010001110001; bin = 1'b0; // Expected: {'diff': 2809, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110111101101010; b = 15'b110010001110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2809, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010110011101110; b = 15'b001100000100110; bin = 1'b0; // Expected: {'diff': 5320, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010110011101110; b = 15'b001100000100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5320, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011011000111; b = 15'b000000100010000; bin = 1'b0; // Expected: {'diff': 1463, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011011000111; b = 15'b000000100010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1463, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101010001010101; b = 15'b111100101110111; bin = 1'b0; // Expected: {'diff': 23262, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101010001010101; b = 15'b111100101110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23262, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000010101111100; b = 15'b100110110011001; bin = 1'b0; // Expected: {'diff': 14307, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000010101111100; b = 15'b100110110011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14307, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011100000100101; b = 15'b110010101001000; bin = 1'b1; // Expected: {'diff': 21212, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011100000100101; b = 15'b110010101001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21212, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110111000001; b = 15'b100000111101010; bin = 1'b0; // Expected: {'diff': 11223, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110111000001; b = 15'b100000111101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11223, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110000111111010; b = 15'b100010001111110; bin = 1'b0; // Expected: {'diff': 7548, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110000111111010; b = 15'b100010001111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7548, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110111010011011; b = 15'b110000011000000; bin = 1'b0; // Expected: {'diff': 3547, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110111010011011; b = 15'b110000011000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3547, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100001000010001; b = 15'b001000101010101; bin = 1'b0; // Expected: {'diff': 12476, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100001000010001; b = 15'b001000101010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12476, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101001000010101; b = 15'b011110011011111; bin = 1'b0; // Expected: {'diff': 5430, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101001000010101; b = 15'b011110011011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5430, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010101011110; b = 15'b011100110110111; bin = 1'b0; // Expected: {'diff': 31655, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010101011110; b = 15'b011100110110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31655, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011110000101; b = 15'b100100001000000; bin = 1'b1; // Expected: {'diff': 32580, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011110000101; b = 15'b100100001000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32580, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000101010010011; b = 15'b111100010010011; bin = 1'b1; // Expected: {'diff': 4607, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000101010010011; b = 15'b111100010010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4607, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001000000000000; b = 15'b101010100000011; bin = 1'b1; // Expected: {'diff': 15100, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001000000000000; b = 15'b101010100000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15100, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110110100111; b = 15'b001111110011110; bin = 1'b1; // Expected: {'diff': 19976, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110110100111; b = 15'b001111110011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19976, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001100001000101; b = 15'b000111101011100; bin = 1'b0; // Expected: {'diff': 2281, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001100001000101; b = 15'b000111101011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2281, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011000111111010; b = 15'b100101011110000; bin = 1'b0; // Expected: {'diff': 26378, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011000111111010; b = 15'b100101011110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26378, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011111011110111; b = 15'b111101000011001; bin = 1'b0; // Expected: {'diff': 17630, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011111011110111; b = 15'b111101000011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17630, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101011010101100; b = 15'b100010001011111; bin = 1'b0; // Expected: {'diff': 4685, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101011010101100; b = 15'b100010001011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4685, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101100001110; b = 15'b010001101001010; bin = 1'b0; // Expected: {'diff': 22468, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101100001110; b = 15'b010001101001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22468, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011100101001011; b = 15'b111010110100110; bin = 1'b1; // Expected: {'diff': 17316, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011100101001011; b = 15'b111010110100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17316, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010111001110000; b = 15'b010011100101000; bin = 1'b0; // Expected: {'diff': 1864, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010111001110000; b = 15'b010011100101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1864, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010010101001011; b = 15'b101001010001011; bin = 1'b1; // Expected: {'diff': 21183, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b010010101001011; b = 15'b101001010001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21183, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110101000110111; b = 15'b010011101001110; bin = 1'b1; // Expected: {'diff': 17128, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110101000110111; b = 15'b010011101001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17128, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101010011011; b = 15'b100010110001010; bin = 1'b1; // Expected: {'diff': 29968, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101010011011; b = 15'b100010110001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29968, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111000000000; b = 15'b101001101000110; bin = 1'b0; // Expected: {'diff': 10938, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111000000000; b = 15'b101001101000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10938, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001100101110; b = 15'b111110011011010; bin = 1'b0; // Expected: {'diff': 30292, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001100101110; b = 15'b111110011011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30292, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111100000100110; b = 15'b010100100100011; bin = 1'b1; // Expected: {'diff': 20226, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111100000100110; b = 15'b010100100100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20226, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111111001010100; b = 15'b010100001001110; bin = 1'b0; // Expected: {'diff': 22022, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111111001010100; b = 15'b010100001001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22022, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000011110100011; b = 15'b110001111111101; bin = 1'b1; // Expected: {'diff': 9125, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000011110100011; b = 15'b110001111111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010001110001111; b = 15'b000111101010101; bin = 1'b0; // Expected: {'diff': 5178, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010001110001111; b = 15'b000111101010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5178, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001000011011; b = 15'b010001001100001; bin = 1'b0; // Expected: {'diff': 20410, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001000011011; b = 15'b010001001100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20410, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111010011101100; b = 15'b000111000000101; bin = 1'b0; // Expected: {'diff': 26343, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111010011101100; b = 15'b000111000000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26343, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000100100001011; b = 15'b110110101111110; bin = 1'b0; // Expected: {'diff': 7053, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b000100100001011; b = 15'b110110101111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7053, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101110111111; b = 15'b001100110010111; bin = 1'b0; // Expected: {'diff': 4648, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101110111111; b = 15'b001100110010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4648, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111010101110011; b = 15'b101110101100110; bin = 1'b0; // Expected: {'diff': 6157, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111010101110011; b = 15'b101110101100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6157, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111110000100001; b = 15'b111001010000001; bin = 1'b1; // Expected: {'diff': 2463, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b111110000100001; b = 15'b111001010000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2463, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule

`timescale 1ns / 1ps

module tb_N12_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 12;
    
     
    // Inputs
    
    reg  [11:0] a;
    
    reg  [11:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [11:0] diff;
    
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
        
        a = 12'b101000011011; b = 12'b001110001110; bin = 1'b0; // Expected: {'diff': 1677, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101000011011; b = 12'b001110001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1677, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001101011110; b = 12'b100111110100; bin = 1'b0; // Expected: {'diff': 2410, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001101011110; b = 12'b100111110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2410, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111110111; b = 12'b110011011111; bin = 1'b1; // Expected: {'diff': 791, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111110111; b = 12'b110011011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 791, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110001000; b = 12'b110010010110; bin = 1'b1; // Expected: {'diff': 753, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110001000; b = 12'b110010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 753, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001001110001; b = 12'b110001011010; bin = 1'b1; // Expected: {'diff': 1558, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001001110001; b = 12'b110001011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1558, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011011111; b = 12'b010101111000; bin = 1'b1; // Expected: {'diff': 358, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011011111; b = 12'b010101111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 358, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111101110; b = 12'b110101110011; bin = 1'b0; // Expected: {'diff': 635, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111101110; b = 12'b110101110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 635, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010011101110; b = 12'b111011101101; bin = 1'b1; // Expected: {'diff': 1536, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010011101110; b = 12'b111011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1536, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001111101; b = 12'b111011100010; bin = 1'b1; // Expected: {'diff': 3994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001111101; b = 12'b111011100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101100000110; b = 12'b010010011100; bin = 1'b0; // Expected: {'diff': 1642, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101100000110; b = 12'b010010011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1642, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011101010001; b = 12'b100101000011; bin = 1'b0; // Expected: {'diff': 3598, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011101010001; b = 12'b100101000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3598, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100001111010; b = 12'b101111100111; bin = 1'b1; // Expected: {'diff': 3218, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100001111010; b = 12'b101111100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3218, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110111000; b = 12'b000101111010; bin = 1'b0; // Expected: {'diff': 2110, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110111000; b = 12'b000101111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2110, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100011110001; b = 12'b001111000100; bin = 1'b0; // Expected: {'diff': 1325, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100011110001; b = 12'b001111000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1325, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011100101110; b = 12'b101000000110; bin = 1'b1; // Expected: {'diff': 3367, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011100101110; b = 12'b101000000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3367, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110110011; b = 12'b011111000101; bin = 1'b0; // Expected: {'diff': 494, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110110011; b = 12'b011111000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 494, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011111110; b = 12'b100110100110; bin = 1'b1; // Expected: {'diff': 3415, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011111110; b = 12'b100110100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3415, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011001011011; b = 12'b010110001110; bin = 1'b0; // Expected: {'diff': 205, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011001011011; b = 12'b010110001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 205, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000101100; b = 12'b100011010111; bin = 1'b0; // Expected: {'diff': 853, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000101100; b = 12'b100011010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 853, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001000100000; b = 12'b011000000010; bin = 1'b1; // Expected: {'diff': 3101, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001000100000; b = 12'b011000000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3101, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100001010001; b = 12'b001101101111; bin = 1'b0; // Expected: {'diff': 1250, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100001010001; b = 12'b001101101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1250, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000111001; b = 12'b011100011111; bin = 1'b0; // Expected: {'diff': 1818, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000111001; b = 12'b011100011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1818, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010111101; b = 12'b111001000001; bin = 1'b1; // Expected: {'diff': 1659, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010111101; b = 12'b111001000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1659, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101101110; b = 12'b110111001011; bin = 1'b1; // Expected: {'diff': 2978, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101101110; b = 12'b110111001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2978, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110100111; b = 12'b001000011100; bin = 1'b0; // Expected: {'diff': 1419, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110100111; b = 12'b001000011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1419, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110110101000; b = 12'b000011110000; bin = 1'b1; // Expected: {'diff': 3255, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110110101000; b = 12'b000011110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3255, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011111001; b = 12'b110011100111; bin = 1'b0; // Expected: {'diff': 2578, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011111001; b = 12'b110011100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2578, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100000111110; b = 12'b111101100011; bin = 1'b0; // Expected: {'diff': 2267, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100000111110; b = 12'b111101100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2267, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000010110; b = 12'b101110000000; bin = 1'b0; // Expected: {'diff': 662, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000010110; b = 12'b101110000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 662, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000000111001; b = 12'b011111111100; bin = 1'b1; // Expected: {'diff': 2108, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000000111001; b = 12'b011111111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000101000; b = 12'b110110100001; bin = 1'b0; // Expected: {'diff': 135, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000101000; b = 12'b110110100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 135, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011101010; b = 12'b111011010101; bin = 1'b0; // Expected: {'diff': 21, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011101010; b = 12'b111011010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110011011110; b = 12'b011000111100; bin = 1'b1; // Expected: {'diff': 1697, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110011011110; b = 12'b011000111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1697, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010101110; b = 12'b101110110010; bin = 1'b0; // Expected: {'diff': 2300, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010101110; b = 12'b101110110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2300, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000111001011; b = 12'b110000100101; bin = 1'b0; // Expected: {'diff': 1446, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000111001011; b = 12'b110000100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1446, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000011001101; b = 12'b010111101111; bin = 1'b0; // Expected: {'diff': 2782, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000011001101; b = 12'b010111101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2782, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010000101; b = 12'b101100000000; bin = 1'b0; // Expected: {'diff': 1925, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010000101; b = 12'b101100000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1925, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100001010011; b = 12'b110110100101; bin = 1'b0; // Expected: {'diff': 2734, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100001010011; b = 12'b110110100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2734, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010101100; b = 12'b111011101100; bin = 1'b1; // Expected: {'diff': 1471, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010101100; b = 12'b111011101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1471, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010101110; b = 12'b100001001001; bin = 1'b1; // Expected: {'diff': 3172, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010101110; b = 12'b100001001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3172, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110010011001; b = 12'b100110011000; bin = 1'b0; // Expected: {'diff': 769, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110010011001; b = 12'b100110011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 769, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101110100111; b = 12'b001111111110; bin = 1'b0; // Expected: {'diff': 1961, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101110100111; b = 12'b001111111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1961, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010011000000; b = 12'b010011111101; bin = 1'b1; // Expected: {'diff': 4034, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010011000000; b = 12'b010011111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4034, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110110111; b = 12'b010100011011; bin = 1'b1; // Expected: {'diff': 1179, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110110111; b = 12'b010100011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1179, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010111100; b = 12'b100001001011; bin = 1'b0; // Expected: {'diff': 1649, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010111100; b = 12'b100001001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1649, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011001011100; b = 12'b000111001011; bin = 1'b0; // Expected: {'diff': 1169, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011001011100; b = 12'b000111001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1169, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110111110110; b = 12'b111100111011; bin = 1'b1; // Expected: {'diff': 3770, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110111110110; b = 12'b111100111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3770, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010111011; b = 12'b101101001001; bin = 1'b0; // Expected: {'diff': 3442, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010111011; b = 12'b101101001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3442, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110011100; b = 12'b110110000111; bin = 1'b0; // Expected: {'diff': 533, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110011100; b = 12'b110110000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 533, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011111010111; b = 12'b101001011100; bin = 1'b0; // Expected: {'diff': 3451, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011111010111; b = 12'b101001011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3451, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010111011; b = 12'b011011110011; bin = 1'b1; // Expected: {'diff': 2503, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010111011; b = 12'b011011110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2503, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110000001; b = 12'b100010001011; bin = 1'b0; // Expected: {'diff': 246, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110000001; b = 12'b100010001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 246, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110001110; b = 12'b110110110011; bin = 1'b0; // Expected: {'diff': 3035, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110001110; b = 12'b110110110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3035, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111011100; b = 12'b101110101101; bin = 1'b1; // Expected: {'diff': 1070, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111011100; b = 12'b101110101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1070, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001100100; b = 12'b011111001000; bin = 1'b1; // Expected: {'diff': 1691, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001100100; b = 12'b011111001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1691, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100010111; b = 12'b101100101110; bin = 1'b0; // Expected: {'diff': 489, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100010111; b = 12'b101100101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 489, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000001010010; b = 12'b000100011100; bin = 1'b0; // Expected: {'diff': 3894, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000001010010; b = 12'b000100011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3894, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100011111111; b = 12'b111001000110; bin = 1'b0; // Expected: {'diff': 2745, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100011111111; b = 12'b111001000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2745, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101110101011; b = 12'b001010000100; bin = 1'b1; // Expected: {'diff': 2342, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101110101011; b = 12'b001010000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2342, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100111110100; b = 12'b100000110000; bin = 1'b1; // Expected: {'diff': 451, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100111110100; b = 12'b100000110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 451, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110000101; b = 12'b111000010110; bin = 1'b1; // Expected: {'diff': 366, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110000101; b = 12'b111000010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 366, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100011000101; b = 12'b101111111111; bin = 1'b1; // Expected: {'diff': 3269, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100011000101; b = 12'b101111111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3269, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010110001; b = 12'b011111111001; bin = 1'b1; // Expected: {'diff': 183, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010110001; b = 12'b011111111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 183, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010100110001; b = 12'b011000011001; bin = 1'b0; // Expected: {'diff': 3864, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010100110001; b = 12'b011000011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3864, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000100101; b = 12'b100001000001; bin = 1'b0; // Expected: {'diff': 3556, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000100101; b = 12'b100001000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3556, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011111111; b = 12'b010101010100; bin = 1'b0; // Expected: {'diff': 427, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011111111; b = 12'b010101010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 427, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001101111010; b = 12'b100111101110; bin = 1'b1; // Expected: {'diff': 2443, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001101111010; b = 12'b100111101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2443, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010011100011; b = 12'b000111111000; bin = 1'b1; // Expected: {'diff': 746, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010011100011; b = 12'b000111111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 746, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011110111; b = 12'b000101110010; bin = 1'b0; // Expected: {'diff': 1413, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011110111; b = 12'b000101110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1413, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011101110; b = 12'b000111111101; bin = 1'b1; // Expected: {'diff': 1264, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011101110; b = 12'b000111111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1264, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011100110; b = 12'b111001010110; bin = 1'b1; // Expected: {'diff': 2191, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011100110; b = 12'b111001010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2191, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010110001100; b = 12'b010111000011; bin = 1'b0; // Expected: {'diff': 4041, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010110001100; b = 12'b010111000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4041, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011010100; b = 12'b011011110101; bin = 1'b0; // Expected: {'diff': 2015, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011010100; b = 12'b011011110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2015, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001011110; b = 12'b000001110111; bin = 1'b1; // Expected: {'diff': 3558, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001011110; b = 12'b000001110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3558, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101001001; b = 12'b001011001100; bin = 1'b1; // Expected: {'diff': 636, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101001001; b = 12'b001011001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 636, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000100101001; b = 12'b100110110101; bin = 1'b0; // Expected: {'diff': 1908, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000100101001; b = 12'b100110110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1908, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100000110010; b = 12'b000101110101; bin = 1'b0; // Expected: {'diff': 1725, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100000110010; b = 12'b000101110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1725, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010100101011; b = 12'b010110000001; bin = 1'b1; // Expected: {'diff': 4009, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010100101011; b = 12'b010110000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4009, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110110010011; b = 12'b110111110010; bin = 1'b1; // Expected: {'diff': 4000, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110110010011; b = 12'b110111110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4000, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011100011111; b = 12'b110111011101; bin = 1'b0; // Expected: {'diff': 2370, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011100011111; b = 12'b110111011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2370, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101010101010; b = 12'b001111101100; bin = 1'b1; // Expected: {'diff': 1725, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101010101010; b = 12'b001111101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1725, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001101010; b = 12'b110000010001; bin = 1'b0; // Expected: {'diff': 2137, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001101010; b = 12'b110000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2137, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111010110; b = 12'b110001011110; bin = 1'b1; // Expected: {'diff': 1911, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111010110; b = 12'b110001011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1911, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101000010; b = 12'b000100011001; bin = 1'b0; // Expected: {'diff': 2089, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101000010; b = 12'b000100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2089, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001101011110; b = 12'b110000101010; bin = 1'b0; // Expected: {'diff': 1844, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001101011110; b = 12'b110000101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1844, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010110001001; b = 12'b100001101100; bin = 1'b0; // Expected: {'diff': 3357, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010110001001; b = 12'b100001101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3357, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001111000; b = 12'b100001100010; bin = 1'b1; // Expected: {'diff': 1557, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001111000; b = 12'b100001100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1557, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001001011101; b = 12'b101011111111; bin = 1'b1; // Expected: {'diff': 1885, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001001011101; b = 12'b101011111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1885, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100100100110; b = 12'b010010011101; bin = 1'b1; // Expected: {'diff': 1160, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100100100110; b = 12'b010010011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1160, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101110101001; b = 12'b011110010101; bin = 1'b0; // Expected: {'diff': 1044, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101110101001; b = 12'b011110010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1044, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010010111; b = 12'b001100100001; bin = 1'b1; // Expected: {'diff': 3445, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010010111; b = 12'b001100100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3445, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011000111; b = 12'b101010010011; bin = 1'b0; // Expected: {'diff': 52, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011000111; b = 12'b101010010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001000101; b = 12'b011000110111; bin = 1'b0; // Expected: {'diff': 2062, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001000101; b = 12'b011000110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2062, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000111010100; b = 12'b111010011001; bin = 1'b0; // Expected: {'diff': 827, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000111010100; b = 12'b111010011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 827, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010010011; b = 12'b001111111010; bin = 1'b1; // Expected: {'diff': 2712, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010010011; b = 12'b001111111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2712, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101111010000; b = 12'b000111001011; bin = 1'b1; // Expected: {'diff': 2564, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101111010000; b = 12'b000111001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2564, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000010010; b = 12'b101001011001; bin = 1'b1; // Expected: {'diff': 440, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000010010; b = 12'b101001011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 440, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111001000; b = 12'b100000000110; bin = 1'b1; // Expected: {'diff': 1985, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111001000; b = 12'b100000000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1985, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001100110; b = 12'b011011100101; bin = 1'b0; // Expected: {'diff': 1409, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001100110; b = 12'b011011100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1409, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110000110; b = 12'b101101111100; bin = 1'b0; // Expected: {'diff': 3082, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110000110; b = 12'b101101111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3082, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001100001101; b = 12'b111011011000; bin = 1'b0; // Expected: {'diff': 1077, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001100001101; b = 12'b111011011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1077, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110110110110; b = 12'b011011000010; bin = 1'b1; // Expected: {'diff': 1779, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110110110110; b = 12'b011011000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1779, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011010100000; b = 12'b110101010000; bin = 1'b0; // Expected: {'diff': 2384, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011010100000; b = 12'b110101010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2384, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010111000100; b = 12'b100101100101; bin = 1'b1; // Expected: {'diff': 3166, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010111000100; b = 12'b100101100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3166, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101000000101; b = 12'b011100000110; bin = 1'b0; // Expected: {'diff': 767, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101000000101; b = 12'b011100000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 767, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111101100000; b = 12'b010001100010; bin = 1'b1; // Expected: {'diff': 2813, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111101100000; b = 12'b010001100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2813, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010011100101; b = 12'b110110101011; bin = 1'b1; // Expected: {'diff': 1849, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010011100101; b = 12'b110110101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1849, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000100011; b = 12'b000101000001; bin = 1'b1; // Expected: {'diff': 2785, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000100011; b = 12'b000101000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2785, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010001110; b = 12'b110111101111; bin = 1'b0; // Expected: {'diff': 671, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010001110; b = 12'b110111101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 671, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101011111; b = 12'b101111100100; bin = 1'b1; // Expected: {'diff': 378, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101011111; b = 12'b101111100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 378, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110110010010; b = 12'b110110001011; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110110010010; b = 12'b110110001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000000100110; b = 12'b001010000111; bin = 1'b0; // Expected: {'diff': 3487, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000000100110; b = 12'b001010000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3487, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001101010010; b = 12'b110001010101; bin = 1'b1; // Expected: {'diff': 1788, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001101010010; b = 12'b110001010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1788, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110100001; b = 12'b011010010011; bin = 1'b0; // Expected: {'diff': 782, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110100001; b = 12'b011010010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 782, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110110111110; b = 12'b101000111011; bin = 1'b0; // Expected: {'diff': 899, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110110111110; b = 12'b101000111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 899, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000000010110; b = 12'b100100001110; bin = 1'b1; // Expected: {'diff': 1799, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000000010110; b = 12'b100100001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1799, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001011011; b = 12'b110010010100; bin = 1'b1; // Expected: {'diff': 454, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001011011; b = 12'b110010010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 454, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100110000; b = 12'b100110111010; bin = 1'b1; // Expected: {'diff': 885, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100110000; b = 12'b100110111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 885, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000110110101; b = 12'b010001000000; bin = 1'b0; // Expected: {'diff': 3445, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000110110101; b = 12'b010001000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3445, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101100001; b = 12'b011010001100; bin = 1'b1; // Expected: {'diff': 2772, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101100001; b = 12'b011010001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2772, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101100010111; b = 12'b110111001101; bin = 1'b0; // Expected: {'diff': 3402, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101100010111; b = 12'b110111001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3402, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011101010100; b = 12'b101010000010; bin = 1'b1; // Expected: {'diff': 3281, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011101010100; b = 12'b101010000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3281, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101111111101; b = 12'b111100001000; bin = 1'b1; // Expected: {'diff': 3316, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101111111101; b = 12'b111100001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3316, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010010100; b = 12'b001010011010; bin = 1'b1; // Expected: {'diff': 3577, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010010100; b = 12'b001010011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3577, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010110011100; b = 12'b001010011111; bin = 1'b0; // Expected: {'diff': 765, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010110011100; b = 12'b001010011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 765, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001010011; b = 12'b111010100100; bin = 1'b1; // Expected: {'diff': 1454, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001010011; b = 12'b111010100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1454, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111000100; b = 12'b010110111101; bin = 1'b0; // Expected: {'diff': 3591, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111000100; b = 12'b010110111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3591, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110001010; b = 12'b001111001100; bin = 1'b0; // Expected: {'diff': 958, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110001010; b = 12'b001111001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 958, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110011101; b = 12'b100010100000; bin = 1'b1; // Expected: {'diff': 252, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110011101; b = 12'b100010100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 252, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001100111110; b = 12'b110000000101; bin = 1'b1; // Expected: {'diff': 1848, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001100111110; b = 12'b110000000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1848, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110111110101; b = 12'b111001010110; bin = 1'b0; // Expected: {'diff': 3999, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110111110101; b = 12'b111001010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3999, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110101010; b = 12'b000000111111; bin = 1'b1; // Expected: {'diff': 2410, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110101010; b = 12'b000000111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2410, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000011111; b = 12'b001010110100; bin = 1'b1; // Expected: {'diff': 2922, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000011111; b = 12'b001010110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2922, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000001111011; b = 12'b001011101000; bin = 1'b0; // Expected: {'diff': 3475, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000001111011; b = 12'b001011101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3475, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101111110; b = 12'b100010000011; bin = 1'b1; // Expected: {'diff': 1274, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101111110; b = 12'b100010000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1274, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100001101101; b = 12'b010000101011; bin = 1'b0; // Expected: {'diff': 1090, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100001101101; b = 12'b010000101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1090, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000110100101; b = 12'b000010100010; bin = 1'b1; // Expected: {'diff': 258, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b000110100101; b = 12'b000010100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 258, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110110000111; b = 12'b101110001010; bin = 1'b1; // Expected: {'diff': 508, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110110000111; b = 12'b101110001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 508, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011000000; b = 12'b110000001111; bin = 1'b1; // Expected: {'diff': 688, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011000000; b = 12'b110000001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 688, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010110110; b = 12'b111010011100; bin = 1'b0; // Expected: {'diff': 2586, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010110110; b = 12'b111010011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2586, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000001000110; b = 12'b111111001101; bin = 1'b1; // Expected: {'diff': 120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000001000110; b = 12'b111111001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000100010; b = 12'b010011001000; bin = 1'b0; // Expected: {'diff': 2394, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000100010; b = 12'b010011001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2394, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001101011100; b = 12'b011011110100; bin = 1'b0; // Expected: {'diff': 3176, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001101011100; b = 12'b011011110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3176, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001010110; b = 12'b101001100110; bin = 1'b0; // Expected: {'diff': 1008, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001010110; b = 12'b101001100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1008, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011010101110; b = 12'b111011100101; bin = 1'b0; // Expected: {'diff': 1993, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011010101110; b = 12'b111011100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1993, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110011101010; b = 12'b100101001011; bin = 1'b1; // Expected: {'diff': 926, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110011101010; b = 12'b100101001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 926, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001100101001; b = 12'b001110011111; bin = 1'b1; // Expected: {'diff': 3977, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001100101001; b = 12'b001110011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3977, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110110110; b = 12'b011111110111; bin = 1'b1; // Expected: {'diff': 4030, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110110110; b = 12'b011111110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4030, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111101110111; b = 12'b100101000001; bin = 1'b0; // Expected: {'diff': 1590, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111101110111; b = 12'b100101000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1590, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100010010; b = 12'b100010110100; bin = 1'b1; // Expected: {'diff': 1117, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100010010; b = 12'b100010110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1117, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101110110011; b = 12'b110011101011; bin = 1'b0; // Expected: {'diff': 3784, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101110110011; b = 12'b110011101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3784, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010010000; b = 12'b010011000101; bin = 1'b0; // Expected: {'diff': 2507, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010010000; b = 12'b010011000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2507, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001101100111; b = 12'b011011100111; bin = 1'b0; // Expected: {'diff': 3200, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001101100111; b = 12'b011011100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3200, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000000011001; b = 12'b010001001100; bin = 1'b0; // Expected: {'diff': 3021, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000000011001; b = 12'b010001001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3021, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011010100; b = 12'b011100000111; bin = 1'b0; // Expected: {'diff': 4045, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011010100; b = 12'b011100000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4045, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111110000; b = 12'b110010111111; bin = 1'b1; // Expected: {'diff': 816, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111110000; b = 12'b110010111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 816, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001111010; b = 12'b001000011100; bin = 1'b1; // Expected: {'diff': 2653, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001111010; b = 12'b001000011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2653, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101100011111; b = 12'b110001111111; bin = 1'b1; // Expected: {'diff': 3743, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101100011111; b = 12'b110001111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3743, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101111011; b = 12'b101010100011; bin = 1'b1; // Expected: {'diff': 3799, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101111011; b = 12'b101010100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3799, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111101101011; b = 12'b011101011110; bin = 1'b1; // Expected: {'diff': 2060, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111101101011; b = 12'b011101011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2060, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100000101; b = 12'b001001000011; bin = 1'b0; // Expected: {'diff': 3266, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100000101; b = 12'b001001000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3266, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101001000100; b = 12'b000111000001; bin = 1'b1; // Expected: {'diff': 2178, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101001000100; b = 12'b000111000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2178, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011101101; b = 12'b000011100100; bin = 1'b0; // Expected: {'diff': 3593, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011101101; b = 12'b000011100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3593, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111101100001; b = 12'b100001110110; bin = 1'b0; // Expected: {'diff': 1771, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111101100001; b = 12'b100001110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1771, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011100101; b = 12'b010000011000; bin = 1'b1; // Expected: {'diff': 3788, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011100101; b = 12'b010000011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3788, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110111100; b = 12'b001110111010; bin = 1'b1; // Expected: {'diff': 1025, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110111100; b = 12'b001110111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1025, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010100001; b = 12'b010111110110; bin = 1'b0; // Expected: {'diff': 2731, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010100001; b = 12'b010111110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2731, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110110001; b = 12'b110101111011; bin = 1'b0; // Expected: {'diff': 3126, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110110001; b = 12'b110101111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3126, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110111111101; b = 12'b000101101010; bin = 1'b1; // Expected: {'diff': 3218, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110111111101; b = 12'b000101101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3218, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100110110; b = 12'b111001110110; bin = 1'b0; // Expected: {'diff': 3776, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100110110; b = 12'b111001110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3776, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000011001; b = 12'b111101100011; bin = 1'b1; // Expected: {'diff': 3253, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000011001; b = 12'b111101100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3253, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011011001; b = 12'b011001111000; bin = 1'b1; // Expected: {'diff': 3168, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011011001; b = 12'b011001111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3168, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000011010110; b = 12'b001000000011; bin = 1'b1; // Expected: {'diff': 3794, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000011010110; b = 12'b001000000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3794, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011000010; b = 12'b000100100100; bin = 1'b1; // Expected: {'diff': 2461, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011000010; b = 12'b000100100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2461, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001000100101; b = 12'b111110001010; bin = 1'b1; // Expected: {'diff': 666, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001000100101; b = 12'b111110001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 666, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011101000110; b = 12'b010000101000; bin = 1'b0; // Expected: {'diff': 798, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011101000110; b = 12'b010000101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 798, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110101001; b = 12'b001110001101; bin = 1'b0; // Expected: {'diff': 1564, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110101001; b = 12'b001110001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1564, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000000010010; b = 12'b101101010001; bin = 1'b0; // Expected: {'diff': 1217, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000000010010; b = 12'b101101010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1217, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011101001100; b = 12'b111010001110; bin = 1'b1; // Expected: {'diff': 2237, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011101001100; b = 12'b111010001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2237, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101010101000; b = 12'b100010001011; bin = 1'b1; // Expected: {'diff': 540, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101010101000; b = 12'b100010001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 540, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101100001110; b = 12'b000100111010; bin = 1'b1; // Expected: {'diff': 2515, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101100001110; b = 12'b000100111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2515, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011010101; b = 12'b011010001010; bin = 1'b0; // Expected: {'diff': 2123, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011010101; b = 12'b011010001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2123, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001101100; b = 12'b110000000000; bin = 1'b1; // Expected: {'diff': 2155, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001101100; b = 12'b110000000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2155, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100000101111; b = 12'b000000100011; bin = 1'b1; // Expected: {'diff': 2059, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100000101111; b = 12'b000000100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2059, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111101001; b = 12'b100101101100; bin = 1'b0; // Expected: {'diff': 1661, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111101001; b = 12'b100101101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1661, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100101001; b = 12'b101010101111; bin = 1'b0; // Expected: {'diff': 634, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100101001; b = 12'b101010101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 634, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101001010111; b = 12'b010100010100; bin = 1'b0; // Expected: {'diff': 1347, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101001010111; b = 12'b010100010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1347, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100111000011; b = 12'b001101100001; bin = 1'b0; // Expected: {'diff': 1634, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100111000011; b = 12'b001101100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1634, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010011010; b = 12'b011010100011; bin = 1'b1; // Expected: {'diff': 3062, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010011010; b = 12'b011010100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3062, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000000101; b = 12'b101111011100; bin = 1'b0; // Expected: {'diff': 2601, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000000101; b = 12'b101111011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2601, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011101100; b = 12'b110010010010; bin = 1'b0; // Expected: {'diff': 2650, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011101100; b = 12'b110010010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2650, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011100100111; b = 12'b001000111100; bin = 1'b0; // Expected: {'diff': 1259, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011100100111; b = 12'b001000111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1259, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001001001; b = 12'b010000001000; bin = 1'b1; // Expected: {'diff': 64, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001001001; b = 12'b010000001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000111000; b = 12'b011111110100; bin = 1'b1; // Expected: {'diff': 1603, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000111000; b = 12'b011111110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1603, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001100011; b = 12'b110111101100; bin = 1'b1; // Expected: {'diff': 118, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001100011; b = 12'b110111101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100010110; b = 12'b110111001000; bin = 1'b0; // Expected: {'diff': 3918, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100010110; b = 12'b110111001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3918, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011110110; b = 12'b011001101001; bin = 1'b0; // Expected: {'diff': 3213, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011110110; b = 12'b011001101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3213, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110011100010; b = 12'b011000000010; bin = 1'b1; // Expected: {'diff': 1759, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110011100010; b = 12'b011000000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1759, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000111010101; b = 12'b001001101001; bin = 1'b0; // Expected: {'diff': 3948, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000111010101; b = 12'b001001101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3948, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111111111; b = 12'b010100110010; bin = 1'b0; // Expected: {'diff': 2765, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111111111; b = 12'b010100110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2765, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010101101; b = 12'b010010111000; bin = 1'b0; // Expected: {'diff': 1013, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010101101; b = 12'b010010111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1013, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100111110; b = 12'b010000011000; bin = 1'b0; // Expected: {'diff': 2854, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100111110; b = 12'b010000011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2854, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001110100; b = 12'b100111101001; bin = 1'b1; // Expected: {'diff': 650, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001110100; b = 12'b100111101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 650, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000011011101; b = 12'b010100110001; bin = 1'b0; // Expected: {'diff': 2988, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000011011101; b = 12'b010100110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2988, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001001001010; b = 12'b100100011100; bin = 1'b1; // Expected: {'diff': 2349, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001001001010; b = 12'b100100011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2349, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010011010; b = 12'b011010111100; bin = 1'b0; // Expected: {'diff': 3550, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010011010; b = 12'b011010111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3550, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101110101; b = 12'b100010111111; bin = 1'b1; // Expected: {'diff': 2229, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101110101; b = 12'b100010111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2229, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000100011; b = 12'b111100101000; bin = 1'b0; // Expected: {'diff': 3323, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000100011; b = 12'b111100101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3323, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010111110100; b = 12'b101110101000; bin = 1'b0; // Expected: {'diff': 2636, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010111110100; b = 12'b101110101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2636, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010111101; b = 12'b000000101011; bin = 1'b0; // Expected: {'diff': 1170, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010111101; b = 12'b000000101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1170, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011101000100; b = 12'b000110000000; bin = 1'b0; // Expected: {'diff': 1476, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011101000100; b = 12'b000110000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1476, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011101000; b = 12'b011110001111; bin = 1'b1; // Expected: {'diff': 3928, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011101000; b = 12'b011110001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3928, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001111101; b = 12'b000010110011; bin = 1'b0; // Expected: {'diff': 3018, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001111101; b = 12'b000010110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3018, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110100011; b = 12'b100100101001; bin = 1'b1; // Expected: {'diff': 1657, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110100011; b = 12'b100100101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1657, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101101110011; b = 12'b110100010110; bin = 1'b1; // Expected: {'diff': 3676, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101101110011; b = 12'b110100010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3676, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000000111011; b = 12'b100110101111; bin = 1'b0; // Expected: {'diff': 1676, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000000111011; b = 12'b100110101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1676, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011010011111; b = 12'b001001010110; bin = 1'b0; // Expected: {'diff': 1097, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011010011111; b = 12'b001001010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1097, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001110011111; b = 12'b101101101011; bin = 1'b1; // Expected: {'diff': 2099, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001110011111; b = 12'b101101101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2099, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010100110; b = 12'b101101100110; bin = 1'b1; // Expected: {'diff': 2367, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010100110; b = 12'b101101100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2367, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101110101; b = 12'b101001110110; bin = 1'b1; // Expected: {'diff': 2814, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101110101; b = 12'b101001110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2814, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010111101; b = 12'b100100100111; bin = 1'b1; // Expected: {'diff': 2965, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010111101; b = 12'b100100100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2965, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010111101101; b = 12'b110011100100; bin = 1'b1; // Expected: {'diff': 2312, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010111101101; b = 12'b110011100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2312, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000111010001; b = 12'b111001100100; bin = 1'b1; // Expected: {'diff': 876, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000111010001; b = 12'b111001100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 876, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101000011000; b = 12'b001111000110; bin = 1'b0; // Expected: {'diff': 1618, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101000011000; b = 12'b001111000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1618, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000011001101; b = 12'b011001110000; bin = 1'b0; // Expected: {'diff': 2653, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000011001101; b = 12'b011001110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2653, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000100011001; b = 12'b110000111110; bin = 1'b1; // Expected: {'diff': 1242, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000100011001; b = 12'b110000111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1242, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110111010011; b = 12'b001010010110; bin = 1'b1; // Expected: {'diff': 2876, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110111010011; b = 12'b001010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2876, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000100111; b = 12'b001110101111; bin = 1'b1; // Expected: {'diff': 2679, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000100111; b = 12'b001110101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2679, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101101001100; b = 12'b110010100101; bin = 1'b1; // Expected: {'diff': 3750, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101101001100; b = 12'b110010100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3750, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001110011110; b = 12'b010000010100; bin = 1'b1; // Expected: {'diff': 3977, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001110011110; b = 12'b010000010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3977, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010011001011; b = 12'b000011001110; bin = 1'b1; // Expected: {'diff': 1020, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010011001011; b = 12'b000011001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1020, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101101001; b = 12'b011000110110; bin = 1'b0; // Expected: {'diff': 3891, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101101001; b = 12'b011000110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3891, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101111000; b = 12'b011011111111; bin = 1'b1; // Expected: {'diff': 1656, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101111000; b = 12'b011011111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1656, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101000001110; b = 12'b100100100110; bin = 1'b0; // Expected: {'diff': 232, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101000001110; b = 12'b100100100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 232, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010000100; b = 12'b111010010110; bin = 1'b1; // Expected: {'diff': 1005, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010000100; b = 12'b111010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1005, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000111101111; b = 12'b101000100011; bin = 1'b1; // Expected: {'diff': 1995, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000111101111; b = 12'b101000100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1995, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001010111; b = 12'b001010111111; bin = 1'b1; // Expected: {'diff': 407, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001010111; b = 12'b001010111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 407, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000001110; b = 12'b100010110100; bin = 1'b0; // Expected: {'diff': 3418, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000001110; b = 12'b100010110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3418, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111101101; b = 12'b100000001001; bin = 1'b0; // Expected: {'diff': 3044, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111101101; b = 12'b100000001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3044, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101001100010; b = 12'b001100100101; bin = 1'b0; // Expected: {'diff': 1853, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101001100010; b = 12'b001100100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1853, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110110101100; b = 12'b001100101101; bin = 1'b1; // Expected: {'diff': 2686, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110110101100; b = 12'b001100101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2686, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001001110100; b = 12'b011101110000; bin = 1'b1; // Expected: {'diff': 2819, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001001110100; b = 12'b011101110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2819, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001110111; b = 12'b100100111001; bin = 1'b0; // Expected: {'diff': 1342, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001110111; b = 12'b100100111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1342, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011111011; b = 12'b000111110001; bin = 1'b0; // Expected: {'diff': 1290, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011111011; b = 12'b000111110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1290, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101010110; b = 12'b011101001010; bin = 1'b1; // Expected: {'diff': 2571, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101010110; b = 12'b011101001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2571, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100011011010; b = 12'b010001010111; bin = 1'b0; // Expected: {'diff': 1155, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100011011010; b = 12'b010001010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1155, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100111110111; b = 12'b111101101010; bin = 1'b0; // Expected: {'diff': 2701, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100111110111; b = 12'b111101101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2701, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110010111001; b = 12'b100000101111; bin = 1'b1; // Expected: {'diff': 1161, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110010111001; b = 12'b100000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1161, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101000011; b = 12'b000011001011; bin = 1'b0; // Expected: {'diff': 3192, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101000011; b = 12'b000011001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3192, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101110100; b = 12'b000010111011; bin = 1'b1; // Expected: {'diff': 3256, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101110100; b = 12'b000010111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3256, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110111111101; b = 12'b100010110110; bin = 1'b1; // Expected: {'diff': 1350, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110111111101; b = 12'b100010110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1350, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111001110; b = 12'b101111010000; bin = 1'b0; // Expected: {'diff': 1022, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111001110; b = 12'b101111010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1022, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001110000; b = 12'b110011110101; bin = 1'b0; // Expected: {'diff': 1915, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001110000; b = 12'b110011110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1915, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100001110; b = 12'b110010110100; bin = 1'b0; // Expected: {'diff': 90, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100001110; b = 12'b110010110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010100001011; b = 12'b011001000011; bin = 1'b0; // Expected: {'diff': 3784, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010100001011; b = 12'b011001000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3784, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111000011; b = 12'b000011110101; bin = 1'b0; // Expected: {'diff': 718, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111000011; b = 12'b000011110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 718, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010000001001; b = 12'b010011111101; bin = 1'b0; // Expected: {'diff': 3852, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010000001001; b = 12'b010011111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3852, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101101001111; b = 12'b111000001100; bin = 1'b1; // Expected: {'diff': 3394, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101101001111; b = 12'b111000001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3394, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100101010; b = 12'b111001100111; bin = 1'b0; // Expected: {'diff': 195, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100101010; b = 12'b111001100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 195, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110010110100; b = 12'b010011110001; bin = 1'b0; // Expected: {'diff': 1987, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110010110100; b = 12'b010011110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1987, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101001010; b = 12'b101100101110; bin = 1'b1; // Expected: {'diff': 2587, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101001010; b = 12'b101100101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2587, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011110011; b = 12'b001100111110; bin = 1'b1; // Expected: {'diff': 4020, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011110011; b = 12'b001100111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4020, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101001111101; b = 12'b001101011010; bin = 1'b0; // Expected: {'diff': 1827, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101001111101; b = 12'b001101011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1827, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100001000000; b = 12'b000100000000; bin = 1'b0; // Expected: {'diff': 1856, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100001000000; b = 12'b000100000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1856, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101101000; b = 12'b001001110001; bin = 1'b1; // Expected: {'diff': 758, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101101000; b = 12'b001001110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 758, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010100111000; b = 12'b010111001110; bin = 1'b1; // Expected: {'diff': 3945, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010100111000; b = 12'b010111001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3945, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011001110010; b = 12'b001001101000; bin = 1'b0; // Expected: {'diff': 1034, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011001110010; b = 12'b001001101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1034, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010111000; b = 12'b110001100111; bin = 1'b0; // Expected: {'diff': 2129, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010111000; b = 12'b110001100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2129, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101010100010; b = 12'b111011001110; bin = 1'b1; // Expected: {'diff': 3027, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101010100010; b = 12'b111011001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3027, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101110100010; b = 12'b111101011001; bin = 1'b0; // Expected: {'diff': 3145, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101110100010; b = 12'b111101011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3145, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100100011010; b = 12'b001011110001; bin = 1'b0; // Expected: {'diff': 1577, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100100011010; b = 12'b001011110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1577, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011010000; b = 12'b100001110000; bin = 1'b0; // Expected: {'diff': 3680, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011010000; b = 12'b100001110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3680, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001110101000; b = 12'b011100110010; bin = 1'b0; // Expected: {'diff': 3190, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001110101000; b = 12'b011100110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3190, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101101100; b = 12'b101110101101; bin = 1'b1; // Expected: {'diff': 1470, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101101100; b = 12'b101110101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1470, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011100110; b = 12'b111010101010; bin = 1'b0; // Expected: {'diff': 3132, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011100110; b = 12'b111010101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3132, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001001010; b = 12'b110101000010; bin = 1'b0; // Expected: {'diff': 3848, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001001010; b = 12'b110101000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3848, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001000000101; b = 12'b000100111101; bin = 1'b1; // Expected: {'diff': 199, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001000000101; b = 12'b000100111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 199, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110101010; b = 12'b101001100000; bin = 1'b1; // Expected: {'diff': 3401, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110101010; b = 12'b101001100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3401, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011001011101; b = 12'b110010110011; bin = 1'b1; // Expected: {'diff': 2473, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011001011101; b = 12'b110010110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2473, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000000001; b = 12'b000110010000; bin = 1'b1; // Expected: {'diff': 2672, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000000001; b = 12'b000110010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2672, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100001001; b = 12'b011000100000; bin = 1'b0; // Expected: {'diff': 1769, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100001001; b = 12'b011000100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1769, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011000010; b = 12'b000111001010; bin = 1'b1; // Expected: {'diff': 247, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011000010; b = 12'b000111001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 247, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100100100111; b = 12'b000001000101; bin = 1'b0; // Expected: {'diff': 2274, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100100100111; b = 12'b000001000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2274, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011011100; b = 12'b011100000110; bin = 1'b0; // Expected: {'diff': 2006, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011011100; b = 12'b011100000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2006, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001010111; b = 12'b101001011001; bin = 1'b1; // Expected: {'diff': 509, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001010111; b = 12'b101001011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 509, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000111100; b = 12'b111111110111; bin = 1'b0; // Expected: {'diff': 3653, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000111100; b = 12'b111111110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3653, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100000010100; b = 12'b100000000100; bin = 1'b0; // Expected: {'diff': 16, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100000010100; b = 12'b100000000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000111111110; b = 12'b011001110100; bin = 1'b1; // Expected: {'diff': 2953, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000111111110; b = 12'b011001110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2953, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010100001000; b = 12'b011100011010; bin = 1'b1; // Expected: {'diff': 3565, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010100001000; b = 12'b011100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3565, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100111010110; b = 12'b001010101110; bin = 1'b1; // Expected: {'diff': 1831, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100111010110; b = 12'b001010101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1831, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011110010; b = 12'b111100001111; bin = 1'b1; // Expected: {'diff': 994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011110010; b = 12'b111100001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101011111; b = 12'b011001000000; bin = 1'b0; // Expected: {'diff': 2847, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101011111; b = 12'b011001000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2847, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001000010100; b = 12'b111000100111; bin = 1'b0; // Expected: {'diff': 1005, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001000010100; b = 12'b111000100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1005, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101110101; b = 12'b110000101000; bin = 1'b1; // Expected: {'diff': 2380, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101110101; b = 12'b110000101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2380, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100001101111; b = 12'b111010011100; bin = 1'b1; // Expected: {'diff': 2514, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100001101111; b = 12'b111010011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2514, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011101101; b = 12'b011000111110; bin = 1'b0; // Expected: {'diff': 1199, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011101101; b = 12'b011000111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1199, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011001011; b = 12'b010100100010; bin = 1'b0; // Expected: {'diff': 2473, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011001011; b = 12'b010100100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2473, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011100111010; b = 12'b110011100110; bin = 1'b0; // Expected: {'diff': 2644, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011100111010; b = 12'b110011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2644, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101001111; b = 12'b111100101000; bin = 1'b1; // Expected: {'diff': 550, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101001111; b = 12'b111100101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 550, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100000000110; b = 12'b101001110101; bin = 1'b0; // Expected: {'diff': 3473, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100000000110; b = 12'b101001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3473, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100010111; b = 12'b000110011110; bin = 1'b0; // Expected: {'diff': 2937, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100010111; b = 12'b000110011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2937, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010000001010; b = 12'b100011000111; bin = 1'b0; // Expected: {'diff': 2883, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010000001010; b = 12'b100011000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2883, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001011001; b = 12'b001011111100; bin = 1'b1; // Expected: {'diff': 2396, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001011001; b = 12'b001011111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2396, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011111000110; b = 12'b111001100110; bin = 1'b1; // Expected: {'diff': 2399, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011111000110; b = 12'b111001100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2399, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011010110110; b = 12'b000100100001; bin = 1'b0; // Expected: {'diff': 1429, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011010110110; b = 12'b000100100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1429, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010010011; b = 12'b101111010001; bin = 1'b1; // Expected: {'diff': 1729, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010010011; b = 12'b101111010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1729, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110110110100; b = 12'b110001011100; bin = 1'b1; // Expected: {'diff': 343, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110110110100; b = 12'b110001011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 343, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101001011; b = 12'b010110111100; bin = 1'b0; // Expected: {'diff': 1935, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101001011; b = 12'b010110111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1935, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010011011; b = 12'b011011001110; bin = 1'b0; // Expected: {'diff': 3533, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010011011; b = 12'b011011001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3533, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010111000110; b = 12'b010011111001; bin = 1'b1; // Expected: {'diff': 204, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010111000110; b = 12'b010011111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 204, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101001101; b = 12'b000100101001; bin = 1'b0; // Expected: {'diff': 2084, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101001101; b = 12'b000100101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2084, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001110011; b = 12'b100000100011; bin = 1'b0; // Expected: {'diff': 1104, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001110011; b = 12'b100000100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1104, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100100100001; b = 12'b000010110100; bin = 1'b0; // Expected: {'diff': 2157, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100100100001; b = 12'b000010110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2157, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110011100011; b = 12'b111111100111; bin = 1'b1; // Expected: {'diff': 3323, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110011100011; b = 12'b111111100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3323, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011001001; b = 12'b000001101011; bin = 1'b0; // Expected: {'diff': 1630, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011001001; b = 12'b000001101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1630, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011011110; b = 12'b101100011010; bin = 1'b1; // Expected: {'diff': 3011, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011011110; b = 12'b101100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3011, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101101011; b = 12'b001100010011; bin = 1'b0; // Expected: {'diff': 2648, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101101011; b = 12'b001100010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2648, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101111011; b = 12'b011111000111; bin = 1'b1; // Expected: {'diff': 435, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101111011; b = 12'b011111000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 435, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110010101111; b = 12'b000101000111; bin = 1'b0; // Expected: {'diff': 2920, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110010101111; b = 12'b000101000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2920, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000111011001; b = 12'b110110011011; bin = 1'b0; // Expected: {'diff': 1086, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000111011001; b = 12'b110110011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1086, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101001001100; b = 12'b110000110000; bin = 1'b1; // Expected: {'diff': 3611, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101001001100; b = 12'b110000110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3611, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000001110101; b = 12'b011100011011; bin = 1'b0; // Expected: {'diff': 2394, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000001110101; b = 12'b011100011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2394, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011101011; b = 12'b001000010000; bin = 1'b1; // Expected: {'diff': 3290, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011101011; b = 12'b001000010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3290, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101110100111; b = 12'b001011010011; bin = 1'b0; // Expected: {'diff': 2260, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101110100111; b = 12'b001011010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2260, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011110100; b = 12'b011011000000; bin = 1'b1; // Expected: {'diff': 1075, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011110100; b = 12'b011011000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1075, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010010011; b = 12'b011100100101; bin = 1'b0; // Expected: {'diff': 3438, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010010011; b = 12'b011100100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3438, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110010111; b = 12'b101111110010; bin = 1'b1; // Expected: {'diff': 2980, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110010111; b = 12'b101111110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2980, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100111101100; b = 12'b001011101111; bin = 1'b1; // Expected: {'diff': 1788, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100111101100; b = 12'b001011101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1788, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110011011; b = 12'b011100100110; bin = 1'b1; // Expected: {'diff': 628, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110011011; b = 12'b011100100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 628, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110111111; b = 12'b001110011001; bin = 1'b1; // Expected: {'diff': 3109, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110111111; b = 12'b001110011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3109, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000111100; b = 12'b010100011101; bin = 1'b0; // Expected: {'diff': 2335, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000111100; b = 12'b010100011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2335, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110010011; b = 12'b100001100000; bin = 1'b0; // Expected: {'diff': 307, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110010011; b = 12'b100001100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 307, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011001100; b = 12'b011010111010; bin = 1'b1; // Expected: {'diff': 2065, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011001100; b = 12'b011010111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2065, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110011010; b = 12'b010000001110; bin = 1'b1; // Expected: {'diff': 2955, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110011010; b = 12'b010000001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2955, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011001011011; b = 12'b110010110111; bin = 1'b1; // Expected: {'diff': 2467, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011001011011; b = 12'b110010110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2467, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001100100; b = 12'b111001101010; bin = 1'b1; // Expected: {'diff': 1529, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001100100; b = 12'b111001101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1529, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100011100; b = 12'b000010111000; bin = 1'b0; // Expected: {'diff': 3684, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100011100; b = 12'b000010111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3684, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101010010000; b = 12'b010111000101; bin = 1'b1; // Expected: {'diff': 1226, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101010010000; b = 12'b010111000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1226, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101000101; b = 12'b010000100001; bin = 1'b0; // Expected: {'diff': 1316, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101000101; b = 12'b010000100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1316, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100001011000; b = 12'b111011111111; bin = 1'b1; // Expected: {'diff': 2392, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100001011000; b = 12'b111011111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2392, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010111110; b = 12'b001001111000; bin = 1'b1; // Expected: {'diff': 581, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010111110; b = 12'b001001111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 581, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001000010; b = 12'b000101101010; bin = 1'b0; // Expected: {'diff': 3288, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001000010; b = 12'b000101101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3288, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000011010101; b = 12'b101110101100; bin = 1'b0; // Expected: {'diff': 1321, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000011010101; b = 12'b101110101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1321, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101111100000; b = 12'b000100000110; bin = 1'b0; // Expected: {'diff': 2778, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101111100000; b = 12'b000100000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2778, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000001000011; b = 12'b001101100111; bin = 1'b0; // Expected: {'diff': 3292, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000001000011; b = 12'b001101100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3292, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111111000; b = 12'b010000101011; bin = 1'b1; // Expected: {'diff': 4044, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111111000; b = 12'b010000101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4044, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101101100011; b = 12'b001001110000; bin = 1'b0; // Expected: {'diff': 2291, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101101100011; b = 12'b001001110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2291, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001001011101; b = 12'b001001111111; bin = 1'b0; // Expected: {'diff': 4062, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001001011101; b = 12'b001001111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4062, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001100110001; b = 12'b110000101010; bin = 1'b0; // Expected: {'diff': 1799, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001100110001; b = 12'b110000101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1799, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010000011; b = 12'b001101100011; bin = 1'b1; // Expected: {'diff': 3359, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010000011; b = 12'b001101100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3359, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010000100; b = 12'b010110100101; bin = 1'b1; // Expected: {'diff': 3294, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010000100; b = 12'b010110100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3294, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010101111; b = 12'b111111110100; bin = 1'b1; // Expected: {'diff': 3770, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010101111; b = 12'b111111110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3770, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101011011; b = 12'b111111011010; bin = 1'b0; // Expected: {'diff': 2433, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101011011; b = 12'b111111011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2433, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001100101010; b = 12'b101100010000; bin = 1'b0; // Expected: {'diff': 2074, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001100101010; b = 12'b101100010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2074, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111001110; b = 12'b010010000110; bin = 1'b0; // Expected: {'diff': 3912, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111001110; b = 12'b010010000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3912, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000100101000; b = 12'b001100100111; bin = 1'b0; // Expected: {'diff': 3585, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000100101000; b = 12'b001100100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3585, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011010011; b = 12'b010010111111; bin = 1'b0; // Expected: {'diff': 532, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011010011; b = 12'b010010111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 532, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001110010000; b = 12'b010000111110; bin = 1'b1; // Expected: {'diff': 3921, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001110010000; b = 12'b010000111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3921, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111101001; b = 12'b010100001001; bin = 1'b1; // Expected: {'diff': 3807, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111101001; b = 12'b010100001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3807, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010111000; b = 12'b001110000010; bin = 1'b1; // Expected: {'diff': 2869, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010111000; b = 12'b001110000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2869, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110100011; b = 12'b010111101110; bin = 1'b1; // Expected: {'diff': 436, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110100011; b = 12'b010111101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 436, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101101000; b = 12'b000111001011; bin = 1'b1; // Expected: {'diff': 1948, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101101000; b = 12'b000111001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1948, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011001000; b = 12'b001100011000; bin = 1'b1; // Expected: {'diff': 1967, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011001000; b = 12'b001100011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1967, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011001111; b = 12'b101010111011; bin = 1'b0; // Expected: {'diff': 2068, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011001111; b = 12'b101010111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2068, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010111001110; b = 12'b110010110100; bin = 1'b0; // Expected: {'diff': 2330, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010111001110; b = 12'b110010110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2330, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011010001; b = 12'b110101001100; bin = 1'b0; // Expected: {'diff': 3461, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011010001; b = 12'b110101001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3461, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001000100110; b = 12'b011011001000; bin = 1'b0; // Expected: {'diff': 2910, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001000100110; b = 12'b011011001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2910, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000100110110; b = 12'b000100101001; bin = 1'b1; // Expected: {'diff': 12, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b000100110110; b = 12'b000100101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011101100; b = 12'b011101101111; bin = 1'b1; // Expected: {'diff': 2940, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011101100; b = 12'b011101101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2940, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010110001; b = 12'b101010111111; bin = 1'b1; // Expected: {'diff': 1009, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010110001; b = 12'b101010111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1009, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101111111000; b = 12'b101011100000; bin = 1'b1; // Expected: {'diff': 279, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101111111000; b = 12'b101011100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 279, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000011010; b = 12'b000001111000; bin = 1'b1; // Expected: {'diff': 2977, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000011010; b = 12'b000001111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2977, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001110000101; b = 12'b001010011111; bin = 1'b1; // Expected: {'diff': 229, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001110000101; b = 12'b001010011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 229, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010110100001; b = 12'b000011111100; bin = 1'b0; // Expected: {'diff': 1189, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010110100001; b = 12'b000011111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1189, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011101111; b = 12'b010111100011; bin = 1'b1; // Expected: {'diff': 1291, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011101111; b = 12'b010111100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1291, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011110010; b = 12'b010111110101; bin = 1'b1; // Expected: {'diff': 252, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011110010; b = 12'b010111110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 252, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100011011101; b = 12'b111000100010; bin = 1'b1; // Expected: {'diff': 2746, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100011011101; b = 12'b111000100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2746, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110110110100; b = 12'b100001100100; bin = 1'b1; // Expected: {'diff': 1359, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110110110100; b = 12'b100001100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1359, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010101001; b = 12'b011011110000; bin = 1'b0; // Expected: {'diff': 3001, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010101001; b = 12'b011011110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3001, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010001101; b = 12'b001001000101; bin = 1'b1; // Expected: {'diff': 3143, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010001101; b = 12'b001001000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3143, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101000100; b = 12'b000001011011; bin = 1'b1; // Expected: {'diff': 2280, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101000100; b = 12'b000001011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2280, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000010110; b = 12'b010011000100; bin = 1'b0; // Expected: {'diff': 1874, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000010110; b = 12'b010011000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1874, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100001100011; b = 12'b100101010101; bin = 1'b1; // Expected: {'diff': 3853, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100001100011; b = 12'b100101010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3853, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101010110; b = 12'b011000110101; bin = 1'b0; // Expected: {'diff': 2849, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101010110; b = 12'b011000110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2849, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010011101; b = 12'b011111011101; bin = 1'b1; // Expected: {'diff': 191, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010011101; b = 12'b011111011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 191, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001100000111; b = 12'b110100001000; bin = 1'b1; // Expected: {'diff': 1534, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001100000111; b = 12'b110100001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1534, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101111001; b = 12'b000100100101; bin = 1'b1; // Expected: {'diff': 2131, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101111001; b = 12'b000100100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2131, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010100110011; b = 12'b011011000110; bin = 1'b1; // Expected: {'diff': 3692, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010100110011; b = 12'b011011000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3692, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010110000001; b = 12'b100010010100; bin = 1'b1; // Expected: {'diff': 3308, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010110000001; b = 12'b100010010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3308, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010010110; b = 12'b101101101110; bin = 1'b0; // Expected: {'diff': 1832, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010010110; b = 12'b101101101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1832, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101010111001; b = 12'b010100110101; bin = 1'b0; // Expected: {'diff': 1412, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101010111001; b = 12'b010100110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1412, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011100011; b = 12'b000011100001; bin = 1'b1; // Expected: {'diff': 2561, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011100011; b = 12'b000011100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2561, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011000110; b = 12'b110111100100; bin = 1'b1; // Expected: {'diff': 3297, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011000110; b = 12'b110111100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3297, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000000100; b = 12'b011101111011; bin = 1'b1; // Expected: {'diff': 1160, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000000100; b = 12'b011101111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1160, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001000011000; b = 12'b111101001111; bin = 1'b1; // Expected: {'diff': 712, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001000011000; b = 12'b111101001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 712, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000001001011; b = 12'b011001100001; bin = 1'b0; // Expected: {'diff': 2538, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000001001011; b = 12'b011001100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2538, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000011011001; b = 12'b110100100010; bin = 1'b1; // Expected: {'diff': 950, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000011011001; b = 12'b110100100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 950, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011011011; b = 12'b101001011001; bin = 1'b0; // Expected: {'diff': 130, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011011011; b = 12'b101001011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 130, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110100000; b = 12'b011000110101; bin = 1'b0; // Expected: {'diff': 2411, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110100000; b = 12'b011000110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2411, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010011001; b = 12'b001100000010; bin = 1'b1; // Expected: {'diff': 1430, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010011001; b = 12'b001100000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1430, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001010100; b = 12'b000101110000; bin = 1'b0; // Expected: {'diff': 3300, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001010100; b = 12'b000101110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3300, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100011110; b = 12'b010001101011; bin = 1'b1; // Expected: {'diff': 2226, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100011110; b = 12'b010001101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2226, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010000101; b = 12'b111001110111; bin = 1'b1; // Expected: {'diff': 2573, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010000101; b = 12'b111001110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2573, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001011000; b = 12'b010101110101; bin = 1'b0; // Expected: {'diff': 1763, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001011000; b = 12'b010101110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1763, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101110101; b = 12'b101100111111; bin = 1'b0; // Expected: {'diff': 566, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101110101; b = 12'b101100111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 566, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001101000; b = 12'b010001011011; bin = 1'b1; // Expected: {'diff': 2060, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001101000; b = 12'b010001011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2060, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011001001; b = 12'b000101111010; bin = 1'b1; // Expected: {'diff': 2382, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011001001; b = 12'b000101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2382, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010110111; b = 12'b001011110111; bin = 1'b1; // Expected: {'diff': 3519, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010110111; b = 12'b001011110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3519, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011110110; b = 12'b010011111111; bin = 1'b1; // Expected: {'diff': 2550, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011110110; b = 12'b010011111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2550, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010111111; b = 12'b100100101110; bin = 1'b1; // Expected: {'diff': 2448, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010111111; b = 12'b100100101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2448, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100111000100; b = 12'b001010100000; bin = 1'b1; // Expected: {'diff': 1827, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100111000100; b = 12'b001010100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1827, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010101001; b = 12'b001100011011; bin = 1'b0; // Expected: {'diff': 3470, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010101001; b = 12'b001100011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3470, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111100011; b = 12'b110100010000; bin = 1'b0; // Expected: {'diff': 1747, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111100011; b = 12'b110100010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1747, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101011101; b = 12'b001000110100; bin = 1'b1; // Expected: {'diff': 2856, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101011101; b = 12'b001000110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2856, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000110100; b = 12'b101001010001; bin = 1'b1; // Expected: {'diff': 994, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000110100; b = 12'b101001010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 994, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011111000001; b = 12'b100011111000; bin = 1'b1; // Expected: {'diff': 3784, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011111000001; b = 12'b100011111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3784, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010010101; b = 12'b100100000010; bin = 1'b0; // Expected: {'diff': 3987, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010010101; b = 12'b100100000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3987, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101111011101; b = 12'b100101100000; bin = 1'b1; // Expected: {'diff': 636, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101111011101; b = 12'b100101100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 636, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110010100; b = 12'b110100100000; bin = 1'b1; // Expected: {'diff': 3187, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110010100; b = 12'b110100100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3187, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101000101001; b = 12'b010101100110; bin = 1'b1; // Expected: {'diff': 1218, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101000101001; b = 12'b010101100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1218, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101001010010; b = 12'b001011001101; bin = 1'b0; // Expected: {'diff': 1925, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101001010010; b = 12'b001011001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1925, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101110000110; b = 12'b001001111111; bin = 1'b0; // Expected: {'diff': 2311, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101110000110; b = 12'b001001111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2311, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010111111000; b = 12'b111010010100; bin = 1'b1; // Expected: {'diff': 1891, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010111111000; b = 12'b111010010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1891, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011100010011; b = 12'b100101100110; bin = 1'b0; // Expected: {'diff': 3501, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011100010011; b = 12'b100101100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3501, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101100011100; b = 12'b110100111111; bin = 1'b0; // Expected: {'diff': 3549, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101100011100; b = 12'b110100111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3549, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101100001001; b = 12'b101010101011; bin = 1'b0; // Expected: {'diff': 94, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101100001001; b = 12'b101010101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 94, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100111111011; b = 12'b100000101001; bin = 1'b0; // Expected: {'diff': 466, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100111111011; b = 12'b100000101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 466, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001110101; b = 12'b111011100000; bin = 1'b0; // Expected: {'diff': 3989, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001110101; b = 12'b111011100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3989, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101001110; b = 12'b000010100011; bin = 1'b0; // Expected: {'diff': 2219, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101001110; b = 12'b000010100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2219, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001110001101; b = 12'b011101010001; bin = 1'b1; // Expected: {'diff': 3131, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001110001101; b = 12'b011101010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3131, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011100100; b = 12'b001010110101; bin = 1'b1; // Expected: {'diff': 46, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011100100; b = 12'b001010110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101100111100; b = 12'b001010001100; bin = 1'b1; // Expected: {'diff': 2223, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101100111100; b = 12'b001010001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2223, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110110001; b = 12'b010001011111; bin = 1'b1; // Expected: {'diff': 2897, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110110001; b = 12'b010001011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2897, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100001110011; b = 12'b101000000110; bin = 1'b0; // Expected: {'diff': 3693, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100001110011; b = 12'b101000000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3693, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101101000; b = 12'b010001001010; bin = 1'b1; // Expected: {'diff': 285, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101101000; b = 12'b010001001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 285, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011010011110; b = 12'b000001111010; bin = 1'b1; // Expected: {'diff': 1571, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011010011110; b = 12'b000001111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1571, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011101100111; b = 12'b111010011001; bin = 1'b1; // Expected: {'diff': 2253, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011101100111; b = 12'b111010011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2253, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101010000100; b = 12'b010110000100; bin = 1'b1; // Expected: {'diff': 1279, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101010000100; b = 12'b010110000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1279, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101010000; b = 12'b011001101010; bin = 1'b0; // Expected: {'diff': 1766, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101010000; b = 12'b011001101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1766, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100011111; b = 12'b000000010001; bin = 1'b0; // Expected: {'diff': 3342, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100011111; b = 12'b000000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3342, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100100000110; b = 12'b000001111100; bin = 1'b0; // Expected: {'diff': 2186, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100100000110; b = 12'b000001111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2186, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110110000; b = 12'b111001001010; bin = 1'b0; // Expected: {'diff': 2918, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110110000; b = 12'b111001001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2918, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011110111; b = 12'b001100110010; bin = 1'b1; // Expected: {'diff': 4036, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011110111; b = 12'b001100110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4036, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111110101; b = 12'b101010110010; bin = 1'b0; // Expected: {'diff': 2371, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111110101; b = 12'b101010110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2371, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111100111; b = 12'b100100100001; bin = 1'b0; // Expected: {'diff': 2758, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111100111; b = 12'b100100100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2758, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010010111; b = 12'b011100001000; bin = 1'b1; // Expected: {'diff': 1934, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010010111; b = 12'b011100001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1934, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100100110110; b = 12'b011111110010; bin = 1'b0; // Expected: {'diff': 324, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100100110110; b = 12'b011111110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 324, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010011101001; b = 12'b011011101101; bin = 1'b1; // Expected: {'diff': 3579, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010011101001; b = 12'b011011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3579, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010111110; b = 12'b111001001001; bin = 1'b0; // Expected: {'diff': 1141, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010111110; b = 12'b111001001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1141, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010110010; b = 12'b110011101101; bin = 1'b1; // Expected: {'diff': 1988, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010110010; b = 12'b110011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1988, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000001011; b = 12'b111100011110; bin = 1'b1; // Expected: {'diff': 3820, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000001011; b = 12'b111100011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3820, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001001100011; b = 12'b110101011000; bin = 1'b1; // Expected: {'diff': 1290, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001001100011; b = 12'b110101011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1290, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100000111; b = 12'b001010011011; bin = 1'b1; // Expected: {'diff': 3179, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100000111; b = 12'b001010011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3179, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010100111; b = 12'b001000011100; bin = 1'b1; // Expected: {'diff': 1674, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010100111; b = 12'b001000011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1674, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000100111001; b = 12'b000101000100; bin = 1'b0; // Expected: {'diff': 4085, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000100111001; b = 12'b000101000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4085, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111001101; b = 12'b011100100011; bin = 1'b0; // Expected: {'diff': 2218, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111001101; b = 12'b011100100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2218, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101010111; b = 12'b100010010011; bin = 1'b1; // Expected: {'diff': 2243, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101010111; b = 12'b100010010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2243, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101111010; b = 12'b100100110000; bin = 1'b1; // Expected: {'diff': 73, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101111010; b = 12'b100100110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 73, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110000010; b = 12'b101000011100; bin = 1'b1; // Expected: {'diff': 1381, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110000010; b = 12'b101000011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1381, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001101110000; b = 12'b111110001010; bin = 1'b1; // Expected: {'diff': 997, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001101110000; b = 12'b111110001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 997, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001100100011; b = 12'b110111001000; bin = 1'b0; // Expected: {'diff': 1371, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001100100011; b = 12'b110111001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1371, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000011010; b = 12'b011011100100; bin = 1'b1; // Expected: {'diff': 3893, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000011010; b = 12'b011011100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3893, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010110011011; b = 12'b111010110101; bin = 1'b0; // Expected: {'diff': 1766, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010110011011; b = 12'b111010110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1766, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001010110101; b = 12'b100000101010; bin = 1'b1; // Expected: {'diff': 2698, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001010110101; b = 12'b100000101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2698, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011011001101; b = 12'b110011010101; bin = 1'b0; // Expected: {'diff': 2552, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011011001101; b = 12'b110011010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2552, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101111101001; b = 12'b001100101110; bin = 1'b0; // Expected: {'diff': 2235, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101111101001; b = 12'b001100101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2235, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101010101; b = 12'b011001010111; bin = 1'b1; // Expected: {'diff': 765, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101010101; b = 12'b011001010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 765, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000100101; b = 12'b001111011001; bin = 1'b0; // Expected: {'diff': 588, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000100101; b = 12'b001111011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 588, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011101011011; b = 12'b100001110101; bin = 1'b0; // Expected: {'diff': 3814, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011101011011; b = 12'b100001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3814, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001101110; b = 12'b110110001010; bin = 1'b0; // Expected: {'diff': 3812, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001101110; b = 12'b110110001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3812, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101111010010; b = 12'b001110100001; bin = 1'b1; // Expected: {'diff': 2096, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101111010010; b = 12'b001110100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2096, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100011011010; b = 12'b000001110001; bin = 1'b0; // Expected: {'diff': 2153, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100011011010; b = 12'b000001110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2153, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110100000001; b = 12'b100010011111; bin = 1'b1; // Expected: {'diff': 1121, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110100000001; b = 12'b100010011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1121, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010110011010; b = 12'b000100111111; bin = 1'b1; // Expected: {'diff': 1114, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010110011010; b = 12'b000100111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1114, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001001001; b = 12'b010101000100; bin = 1'b1; // Expected: {'diff': 2308, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001001001; b = 12'b010101000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2308, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110010011011; b = 12'b111001000110; bin = 1'b0; // Expected: {'diff': 3669, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110010011011; b = 12'b111001000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3669, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101010000000; b = 12'b011000010001; bin = 1'b1; // Expected: {'diff': 1134, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101010000000; b = 12'b011000010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1134, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101110011; b = 12'b101010010010; bin = 1'b1; // Expected: {'diff': 736, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101110011; b = 12'b101010010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 736, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101001100; b = 12'b000111011100; bin = 1'b0; // Expected: {'diff': 3952, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101001100; b = 12'b000111011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3952, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010010110; b = 12'b000110000111; bin = 1'b1; // Expected: {'diff': 1806, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010010110; b = 12'b000110000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1806, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101111011010; b = 12'b111110101000; bin = 1'b1; // Expected: {'diff': 3121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101111011010; b = 12'b111110101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101100010; b = 12'b110110000000; bin = 1'b1; // Expected: {'diff': 993, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101100010; b = 12'b110110000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 993, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110101100; b = 12'b101000011101; bin = 1'b0; // Expected: {'diff': 1423, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110101100; b = 12'b101000011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1423, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001100110111; b = 12'b010001101101; bin = 1'b1; // Expected: {'diff': 3785, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001100110111; b = 12'b010001101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3785, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101101111111; b = 12'b000110000000; bin = 1'b0; // Expected: {'diff': 2559, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101101111111; b = 12'b000110000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2559, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000011010; b = 12'b110011101100; bin = 1'b0; // Expected: {'diff': 2350, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000011010; b = 12'b110011101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2350, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011011110; b = 12'b111010010111; bin = 1'b1; // Expected: {'diff': 70, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011011110; b = 12'b111010010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 70, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010110110001; b = 12'b000100110110; bin = 1'b0; // Expected: {'diff': 1147, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010110110001; b = 12'b000100110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1147, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000100000001; b = 12'b100011000111; bin = 1'b0; // Expected: {'diff': 2106, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000100000001; b = 12'b100011000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2106, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000100000; b = 12'b110100001011; bin = 1'b1; // Expected: {'diff': 2324, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000100000; b = 12'b110100001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2324, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010011000110; b = 12'b101010011011; bin = 1'b1; // Expected: {'diff': 2602, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010011000110; b = 12'b101010011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2602, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100000011011; b = 12'b110101111000; bin = 1'b0; // Expected: {'diff': 2723, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100000011011; b = 12'b110101111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2723, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100010011111; b = 12'b110101110000; bin = 1'b1; // Expected: {'diff': 2862, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100010011111; b = 12'b110101110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2862, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100000110001; b = 12'b001001111111; bin = 1'b1; // Expected: {'diff': 1457, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100000110001; b = 12'b001001111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1457, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001000001110; b = 12'b110010010001; bin = 1'b1; // Expected: {'diff': 1404, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001000001110; b = 12'b110010010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1404, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101000000; b = 12'b101100101111; bin = 1'b0; // Expected: {'diff': 2577, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101000000; b = 12'b101100101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2577, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011111000100; b = 12'b111111101001; bin = 1'b1; // Expected: {'diff': 2010, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011111000100; b = 12'b111111101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2010, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100011000101; b = 12'b010110100011; bin = 1'b1; // Expected: {'diff': 801, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100011000101; b = 12'b010110100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 801, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001100101101; b = 12'b011010101111; bin = 1'b0; // Expected: {'diff': 3198, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001100101101; b = 12'b011010101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3198, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011101110; b = 12'b001001011000; bin = 1'b0; // Expected: {'diff': 3222, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011101110; b = 12'b001001011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3222, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011001011; b = 12'b010111101100; bin = 1'b1; // Expected: {'diff': 2270, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011001011; b = 12'b010111101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2270, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100000111011; b = 12'b110111011100; bin = 1'b0; // Expected: {'diff': 2655, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100000111011; b = 12'b110111011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2655, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011101100111; b = 12'b001111010110; bin = 1'b0; // Expected: {'diff': 913, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011101100111; b = 12'b001111010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 913, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010111101011; b = 12'b001111101001; bin = 1'b1; // Expected: {'diff': 513, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010111101011; b = 12'b001111101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 513, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101101001101; b = 12'b000001110101; bin = 1'b0; // Expected: {'diff': 2776, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101101001101; b = 12'b000001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2776, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101110101000; b = 12'b101100000100; bin = 1'b1; // Expected: {'diff': 163, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101110101000; b = 12'b101100000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 163, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110010011001; b = 12'b010011100110; bin = 1'b1; // Expected: {'diff': 1970, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110010011001; b = 12'b010011100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1970, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011100011110; b = 12'b101100111100; bin = 1'b1; // Expected: {'diff': 3041, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011100011110; b = 12'b101100111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3041, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110001111010; b = 12'b100001110110; bin = 1'b1; // Expected: {'diff': 1027, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110001111010; b = 12'b100001110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1027, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010110001101; b = 12'b001011101000; bin = 1'b1; // Expected: {'diff': 676, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010110001101; b = 12'b001011101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 676, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101000011; b = 12'b011001000011; bin = 1'b0; // Expected: {'diff': 1792, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101000011; b = 12'b011001000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1792, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001110000000; b = 12'b111011001001; bin = 1'b0; // Expected: {'diff': 1207, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001110000000; b = 12'b111011001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1207, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101010011; b = 12'b001101101011; bin = 1'b0; // Expected: {'diff': 488, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101010011; b = 12'b001101101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 488, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011000001; b = 12'b001000000001; bin = 1'b0; // Expected: {'diff': 192, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011000001; b = 12'b001000000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 192, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110101111; b = 12'b010000110000; bin = 1'b1; // Expected: {'diff': 894, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110101111; b = 12'b010000110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 894, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110011000101; b = 12'b000101011101; bin = 1'b0; // Expected: {'diff': 2920, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110011000101; b = 12'b000101011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2920, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000000010; b = 12'b011101110010; bin = 1'b1; // Expected: {'diff': 3727, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000000010; b = 12'b011101110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3727, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100011011; b = 12'b111100111001; bin = 1'b1; // Expected: {'diff': 4065, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100011011; b = 12'b111100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4065, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101101110; b = 12'b111100111001; bin = 1'b1; // Expected: {'diff': 2612, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101101110; b = 12'b111100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2612, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100111010100; b = 12'b011100111001; bin = 1'b0; // Expected: {'diff': 667, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100111010100; b = 12'b011100111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 667, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000110100; b = 12'b110100011101; bin = 1'b0; // Expected: {'diff': 3863, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000110100; b = 12'b110100011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3863, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001110111011; b = 12'b000001001111; bin = 1'b1; // Expected: {'diff': 875, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001110111011; b = 12'b000001001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 875, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010011110; b = 12'b011110111111; bin = 1'b0; // Expected: {'diff': 1759, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010011110; b = 12'b011110111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1759, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001010111; b = 12'b000111111010; bin = 1'b1; // Expected: {'diff': 3164, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001010111; b = 12'b000111111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3164, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100111101111; b = 12'b101000111000; bin = 1'b0; // Expected: {'diff': 4023, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100111101111; b = 12'b101000111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4023, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001000111; b = 12'b101101110010; bin = 1'b0; // Expected: {'diff': 2261, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001000111; b = 12'b101101110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2261, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110101110; b = 12'b110111100000; bin = 1'b1; // Expected: {'diff': 461, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110101110; b = 12'b110111100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 461, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110010010011; b = 12'b001100001110; bin = 1'b0; // Expected: {'diff': 2437, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110010010011; b = 12'b001100001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2437, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101101001; b = 12'b111011101001; bin = 1'b1; // Expected: {'diff': 2687, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101101001; b = 12'b111011101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2687, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010101110001; b = 12'b110010011110; bin = 1'b1; // Expected: {'diff': 2258, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010101110001; b = 12'b110010011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2258, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000110010110; b = 12'b100110111100; bin = 1'b0; // Expected: {'diff': 2010, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000110010110; b = 12'b100110111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2010, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000111110; b = 12'b100010101010; bin = 1'b1; // Expected: {'diff': 1427, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000111110; b = 12'b100010101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1427, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100110001001; b = 12'b101000011000; bin = 1'b1; // Expected: {'diff': 3952, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b100110001001; b = 12'b101000011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3952, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010100101001; b = 12'b101101100000; bin = 1'b1; // Expected: {'diff': 2504, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010100101001; b = 12'b101101100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2504, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001111000010; b = 12'b101001000100; bin = 1'b1; // Expected: {'diff': 2429, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001111000010; b = 12'b101001000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2429, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111000101000; b = 12'b101101110110; bin = 1'b1; // Expected: {'diff': 689, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111000101000; b = 12'b101101110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 689, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111011001000; b = 12'b000110001101; bin = 1'b0; // Expected: {'diff': 3387, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111011001000; b = 12'b000110001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3387, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001000100101; b = 12'b100111101001; bin = 1'b0; // Expected: {'diff': 2108, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001000100101; b = 12'b100111101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000100111100; b = 12'b101100111000; bin = 1'b0; // Expected: {'diff': 1540, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000100111100; b = 12'b101100111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1540, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111010111100; b = 12'b001001101001; bin = 1'b0; // Expected: {'diff': 3155, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111010111100; b = 12'b001001101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3155, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101001101; b = 12'b110110100010; bin = 1'b0; // Expected: {'diff': 4011, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101001101; b = 12'b110110100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4011, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100010111; b = 12'b111000001110; bin = 1'b1; // Expected: {'diff': 264, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100010111; b = 12'b111000001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 264, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011010101100; b = 12'b011010011101; bin = 1'b1; // Expected: {'diff': 14, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011010101100; b = 12'b011010011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101011011110; b = 12'b010101101001; bin = 1'b0; // Expected: {'diff': 1397, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101011011110; b = 12'b010101101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1397, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101001100111; b = 12'b111001010100; bin = 1'b0; // Expected: {'diff': 3091, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101001100111; b = 12'b111001010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3091, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101110111000; b = 12'b001001100111; bin = 1'b0; // Expected: {'diff': 2385, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101110111000; b = 12'b001001100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2385, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111001110011; b = 12'b101000111011; bin = 1'b1; // Expected: {'diff': 1079, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111001110011; b = 12'b101000111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1079, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110101110010; b = 12'b110100001111; bin = 1'b1; // Expected: {'diff': 98, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110101110010; b = 12'b110100001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010001011; b = 12'b011000001100; bin = 1'b1; // Expected: {'diff': 3710, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010001011; b = 12'b011000001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3710, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111010101; b = 12'b011001011000; bin = 1'b1; // Expected: {'diff': 2428, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111010101; b = 12'b011001011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2428, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000110110010; b = 12'b001101000011; bin = 1'b0; // Expected: {'diff': 3695, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000110110010; b = 12'b001101000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3695, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010101001; b = 12'b110010100110; bin = 1'b0; // Expected: {'diff': 1027, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010101001; b = 12'b110010100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1027, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011001110010; b = 12'b100100000001; bin = 1'b0; // Expected: {'diff': 3441, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011001110010; b = 12'b100100000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3441, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010000101101; b = 12'b011100110100; bin = 1'b1; // Expected: {'diff': 3320, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010000101101; b = 12'b011100110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3320, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001010010; b = 12'b001000011110; bin = 1'b0; // Expected: {'diff': 564, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001010010; b = 12'b001000011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 564, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001000101011; b = 12'b001011001101; bin = 1'b0; // Expected: {'diff': 3934, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001000101011; b = 12'b001011001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3934, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000001100; b = 12'b010001011000; bin = 1'b0; // Expected: {'diff': 436, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000001100; b = 12'b010001011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 436, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111111000110; b = 12'b000110010011; bin = 1'b0; // Expected: {'diff': 3635, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b111111000110; b = 12'b000110010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3635, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011001110110; b = 12'b000001101011; bin = 1'b0; // Expected: {'diff': 1547, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011001110110; b = 12'b000001101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1547, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000110000010; b = 12'b110110111000; bin = 1'b1; // Expected: {'diff': 969, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b000110000010; b = 12'b110110111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 969, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101001010110; b = 12'b001101111010; bin = 1'b1; // Expected: {'diff': 1755, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101001010110; b = 12'b001101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1755, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
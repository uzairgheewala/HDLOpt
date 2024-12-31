
`timescale 1ns / 1ps

module tb_N11_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 11;
    
     
    // Inputs
    
    reg  [10:0] a;
    
    reg  [10:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [10:0] diff;
    
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
        
        a = 11'b00101011001; b = 11'b01001110110; bin = 1'b1; // Expected: {'diff': 1762, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101011001; b = 11'b01001110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1762, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111000010; b = 11'b00100011110; bin = 1'b0; // Expected: {'diff': 1188, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111000010; b = 11'b00100011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1188, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010011111; b = 11'b10011010101; bin = 1'b0; // Expected: {'diff': 1994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010011111; b = 11'b10011010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001100010; b = 11'b11101110101; bin = 1'b0; // Expected: {'diff': 749, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001100010; b = 11'b11101110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 749, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001000111; b = 11'b11000000011; bin = 1'b1; // Expected: {'diff': 67, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001000111; b = 11'b11000000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111011110; b = 11'b00111000010; bin = 1'b0; // Expected: {'diff': 1052, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111011110; b = 11'b00111000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1052, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100100110; b = 11'b10110111010; bin = 1'b0; // Expected: {'diff': 1388, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100100110; b = 11'b10110111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1388, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101100000; b = 11'b01000000101; bin = 1'b0; // Expected: {'diff': 859, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101100000; b = 11'b01000000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 859, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010100110; b = 11'b10011101001; bin = 1'b1; // Expected: {'diff': 444, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010100110; b = 11'b10011101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 444, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100010110; b = 11'b00111100101; bin = 1'b0; // Expected: {'diff': 817, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100010110; b = 11'b00111100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 817, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101011110; b = 11'b01011100000; bin = 1'b0; // Expected: {'diff': 126, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101011110; b = 11'b01011100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 126, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001000111; b = 11'b00100000000; bin = 1'b1; // Expected: {'diff': 838, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001000111; b = 11'b00100000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 838, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110010111; b = 11'b00010000101; bin = 1'b0; // Expected: {'diff': 1810, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110010111; b = 11'b00010000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1810, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000101110; b = 11'b10111010100; bin = 1'b0; // Expected: {'diff': 602, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000101110; b = 11'b10111010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 602, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111100111; b = 11'b11111111000; bin = 1'b0; // Expected: {'diff': 1519, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111100111; b = 11'b11111111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1519, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010011001; b = 11'b01000100011; bin = 1'b0; // Expected: {'diff': 1654, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010011001; b = 11'b01000100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1654, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110111001; b = 11'b10111011100; bin = 1'b1; // Expected: {'diff': 988, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110111001; b = 11'b10111011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 988, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011001011; b = 11'b10010111001; bin = 1'b1; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011001011; b = 11'b10010111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011111001; b = 11'b00111000000; bin = 1'b0; // Expected: {'diff': 825, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011111001; b = 11'b00111000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 825, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100111010; b = 11'b01011000001; bin = 1'b0; // Expected: {'diff': 1145, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100111010; b = 11'b01011000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1145, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010000001; b = 11'b01101011100; bin = 1'b1; // Expected: {'diff': 292, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010000001; b = 11'b01101011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 292, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111011101; b = 11'b11101101011; bin = 1'b1; // Expected: {'diff': 113, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111011101; b = 11'b11101101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011000100; b = 11'b11101010100; bin = 1'b0; // Expected: {'diff': 1904, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011000100; b = 11'b11101010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1904, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000001010; b = 11'b01111111111; bin = 1'b1; // Expected: {'diff': 1034, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000001010; b = 11'b01111111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1034, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111011101; b = 11'b11011100101; bin = 1'b1; // Expected: {'diff': 759, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111011101; b = 11'b11011100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 759, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111011001; b = 11'b11010100011; bin = 1'b1; // Expected: {'diff': 1845, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111011001; b = 11'b11010100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1845, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110010101; b = 11'b11111011010; bin = 1'b1; // Expected: {'diff': 442, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110010101; b = 11'b11111011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 442, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111001101; b = 11'b00101111001; bin = 1'b1; // Expected: {'diff': 1619, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111001101; b = 11'b00101111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1619, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110000101; b = 11'b01101110101; bin = 1'b1; // Expected: {'diff': 1039, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110000101; b = 11'b01101110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1039, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011101010; b = 11'b11100100001; bin = 1'b1; // Expected: {'diff': 968, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011101010; b = 11'b11100100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 968, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111110110; b = 11'b01111000110; bin = 1'b0; // Expected: {'diff': 48, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111110110; b = 11'b01111000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011110111; b = 11'b11010010111; bin = 1'b1; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011110111; b = 11'b11010010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001010110; b = 11'b10011100100; bin = 1'b0; // Expected: {'diff': 370, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001010110; b = 11'b10011100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 370, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010111011; b = 11'b11110011000; bin = 1'b0; // Expected: {'diff': 1827, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010111011; b = 11'b11110011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1827, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011101000; b = 11'b01000010101; bin = 1'b0; // Expected: {'diff': 211, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011101000; b = 11'b01000010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 211, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011001011; b = 11'b01101011101; bin = 1'b1; // Expected: {'diff': 365, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011001011; b = 11'b01101011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 365, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100001011; b = 11'b10010111101; bin = 1'b1; // Expected: {'diff': 1101, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100001011; b = 11'b10010111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1101, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010000001; b = 11'b11100110000; bin = 1'b1; // Expected: {'diff': 336, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010000001; b = 11'b11100110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 336, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001111101; b = 11'b01110110001; bin = 1'b1; // Expected: {'diff': 1739, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001111101; b = 11'b01110110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1739, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011100100; b = 11'b11011100101; bin = 1'b1; // Expected: {'diff': 2046, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011100100; b = 11'b11011100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2046, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011000110; b = 11'b01001000111; bin = 1'b0; // Expected: {'diff': 127, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011000110; b = 11'b01001000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 127, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101000000; b = 11'b10000000000; bin = 1'b1; // Expected: {'diff': 1343, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101000000; b = 11'b10000000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1343, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111101010; b = 11'b00011100101; bin = 1'b1; // Expected: {'diff': 1284, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111101010; b = 11'b00011100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1284, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110110101; b = 11'b10010000110; bin = 1'b0; // Expected: {'diff': 1327, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110110101; b = 11'b10010000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1327, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100101010; b = 11'b10000010100; bin = 1'b1; // Expected: {'diff': 1301, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100101010; b = 11'b10000010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1301, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111100001; b = 11'b01110110100; bin = 1'b0; // Expected: {'diff': 1069, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111100001; b = 11'b01110110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1069, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100000011; b = 11'b11100011001; bin = 1'b0; // Expected: {'diff': 1002, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100000011; b = 11'b11100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1002, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000111011; b = 11'b00000001010; bin = 1'b0; // Expected: {'diff': 49, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000111011; b = 11'b00000001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001001101; b = 11'b01100000100; bin = 1'b0; // Expected: {'diff': 841, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001001101; b = 11'b01100000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 841, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011000000; b = 11'b11011001111; bin = 1'b1; // Expected: {'diff': 1520, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011000000; b = 11'b11011001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1520, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000000000; b = 11'b01111101100; bin = 1'b0; // Expected: {'diff': 20, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000000000; b = 11'b01111101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110111100; b = 11'b10000000001; bin = 1'b1; // Expected: {'diff': 1466, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110111100; b = 11'b10000000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1466, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000101001; b = 11'b10100110011; bin = 1'b0; // Expected: {'diff': 758, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000101001; b = 11'b10100110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 758, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101010010; b = 11'b00010110000; bin = 1'b0; // Expected: {'diff': 1698, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101010010; b = 11'b00010110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1698, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111100010; b = 11'b00111000101; bin = 1'b0; // Expected: {'diff': 1565, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111100010; b = 11'b00111000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1565, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111001101; b = 11'b00001011111; bin = 1'b0; // Expected: {'diff': 1902, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111001101; b = 11'b00001011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1902, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000010010; b = 11'b00110001110; bin = 1'b0; // Expected: {'diff': 1156, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000010010; b = 11'b00110001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1156, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111010111; b = 11'b00000100000; bin = 1'b1; // Expected: {'diff': 950, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111010111; b = 11'b00000100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 950, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100110010; b = 11'b01011111100; bin = 1'b1; // Expected: {'diff': 1077, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100110010; b = 11'b01011111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1077, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010101111; b = 11'b00100100010; bin = 1'b1; // Expected: {'diff': 1420, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010101111; b = 11'b00100100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1420, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011100101; b = 11'b00100101111; bin = 1'b0; // Expected: {'diff': 1974, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011100101; b = 11'b00100101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1974, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111101110; b = 11'b00010101100; bin = 1'b1; // Expected: {'diff': 321, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111101110; b = 11'b00010101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 321, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000101011; b = 11'b00100000110; bin = 1'b0; // Expected: {'diff': 805, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000101011; b = 11'b00100000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 805, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011110001; b = 11'b10101101111; bin = 1'b1; // Expected: {'diff': 385, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011110001; b = 11'b10101101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 385, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000111011; b = 11'b01101000000; bin = 1'b1; // Expected: {'diff': 1274, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000111011; b = 11'b01101000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1274, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110001111; b = 11'b00001001110; bin = 1'b1; // Expected: {'diff': 832, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110001111; b = 11'b00001001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 832, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110010101; b = 11'b10101101011; bin = 1'b0; // Expected: {'diff': 554, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110010101; b = 11'b10101101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 554, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010011001; b = 11'b01000100111; bin = 1'b1; // Expected: {'diff': 1649, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010011001; b = 11'b01000100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1649, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111011010; b = 11'b10011111101; bin = 1'b1; // Expected: {'diff': 732, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111011010; b = 11'b10011111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 732, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010011000; b = 11'b00011011000; bin = 1'b0; // Expected: {'diff': 960, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010011000; b = 11'b00011011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 960, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111010110; b = 11'b10101011101; bin = 1'b1; // Expected: {'diff': 120, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111010110; b = 11'b10101011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100101101; b = 11'b10010100010; bin = 1'b0; // Expected: {'diff': 139, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100101101; b = 11'b10010100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 139, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000111010; b = 11'b11010110011; bin = 1'b1; // Expected: {'diff': 902, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000111010; b = 11'b11010110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 902, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011010101; b = 11'b00111101110; bin = 1'b0; // Expected: {'diff': 231, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011010101; b = 11'b00111101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 231, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010111001; b = 11'b01101101101; bin = 1'b1; // Expected: {'diff': 1867, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010111001; b = 11'b01101101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1867, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100000001; b = 11'b00001011010; bin = 1'b0; // Expected: {'diff': 167, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100000001; b = 11'b00001011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 167, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110010100; b = 11'b10011110001; bin = 1'b1; // Expected: {'diff': 162, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110010100; b = 11'b10011110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 162, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011110111; b = 11'b00101101100; bin = 1'b0; // Expected: {'diff': 907, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011110111; b = 11'b00101101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 907, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100001011; b = 11'b00110100000; bin = 1'b0; // Expected: {'diff': 1387, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100001011; b = 11'b00110100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1387, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111110110; b = 11'b11100010100; bin = 1'b1; // Expected: {'diff': 225, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111110110; b = 11'b11100010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 225, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110100101; b = 11'b01010110011; bin = 1'b0; // Expected: {'diff': 1778, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110100101; b = 11'b01010110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1778, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110010000; b = 11'b01111001011; bin = 1'b0; // Expected: {'diff': 1989, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110010000; b = 11'b01111001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1989, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010011111; b = 11'b01010110010; bin = 1'b0; // Expected: {'diff': 2029, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010011111; b = 11'b01010110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2029, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011011110; b = 11'b00110011100; bin = 1'b1; // Expected: {'diff': 1857, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011011110; b = 11'b00110011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1857, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011000000; b = 11'b01010111101; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011000000; b = 11'b01010111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010100000; b = 11'b11010110100; bin = 1'b1; // Expected: {'diff': 2027, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010100000; b = 11'b11010110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2027, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001010101; b = 11'b10000000010; bin = 1'b1; // Expected: {'diff': 1618, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001010101; b = 11'b10000000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1618, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011110001; b = 11'b10000010001; bin = 1'b1; // Expected: {'diff': 735, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011110001; b = 11'b10000010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 735, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011010111; b = 11'b01011111110; bin = 1'b0; // Expected: {'diff': 985, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011010111; b = 11'b01011111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 985, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010000110; b = 11'b10001101100; bin = 1'b0; // Expected: {'diff': 26, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010000110; b = 11'b10001101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011100011; b = 11'b10100110000; bin = 1'b1; // Expected: {'diff': 1458, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011100011; b = 11'b10100110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1458, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100000011; b = 11'b10011000000; bin = 1'b0; // Expected: {'diff': 67, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100000011; b = 11'b10011000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111110101; b = 11'b01111011000; bin = 1'b1; // Expected: {'diff': 1052, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111110101; b = 11'b01111011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1052, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000110100; b = 11'b00010001101; bin = 1'b0; // Expected: {'diff': 935, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000110100; b = 11'b00010001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 935, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011011110; b = 11'b00111101011; bin = 1'b1; // Expected: {'diff': 1778, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011011110; b = 11'b00111101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1778, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111001011; b = 11'b10110000111; bin = 1'b1; // Expected: {'diff': 67, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111001011; b = 11'b10110000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001100100; b = 11'b11100100100; bin = 1'b1; // Expected: {'diff': 831, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001100100; b = 11'b11100100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 831, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011101110; b = 11'b01000000100; bin = 1'b0; // Expected: {'diff': 234, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011101110; b = 11'b01000000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 234, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011110100; b = 11'b10111000000; bin = 1'b0; // Expected: {'diff': 1844, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011110100; b = 11'b10111000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1844, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001011000; b = 11'b10011010110; bin = 1'b1; // Expected: {'diff': 1921, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001011000; b = 11'b10011010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1921, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101011100; b = 11'b11011111011; bin = 1'b0; // Expected: {'diff': 97, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101011100; b = 11'b11011111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001000011; b = 11'b00110000010; bin = 1'b1; // Expected: {'diff': 704, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001000011; b = 11'b00110000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 704, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000111010; b = 11'b00111110110; bin = 1'b0; // Expected: {'diff': 1092, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000111010; b = 11'b00111110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1092, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111000110; b = 11'b10010110101; bin = 1'b1; // Expected: {'diff': 1808, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111000110; b = 11'b10010110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1808, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010100010; b = 11'b11000010000; bin = 1'b1; // Expected: {'diff': 1169, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010100010; b = 11'b11000010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1169, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010100000; b = 11'b01000001011; bin = 1'b1; // Expected: {'diff': 148, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010100000; b = 11'b01000001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 148, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010000100; b = 11'b11001111100; bin = 1'b1; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010000100; b = 11'b11001111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010010101; b = 11'b10001001000; bin = 1'b0; // Expected: {'diff': 589, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010010101; b = 11'b10001001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 589, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100001111; b = 11'b01010011110; bin = 1'b0; // Expected: {'diff': 625, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100001111; b = 11'b01010011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 625, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111111011; b = 11'b10111001100; bin = 1'b0; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111111011; b = 11'b10111001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011001111; b = 11'b01101000101; bin = 1'b1; // Expected: {'diff': 1929, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011001111; b = 11'b01101000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1929, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000110000; b = 11'b00110001001; bin = 1'b1; // Expected: {'diff': 166, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000110000; b = 11'b00110001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 166, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111001010; b = 11'b00111101100; bin = 1'b0; // Expected: {'diff': 1502, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111001010; b = 11'b00111101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1502, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110000110; b = 11'b11000010110; bin = 1'b0; // Expected: {'diff': 1904, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110000110; b = 11'b11000010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1904, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100010011; b = 11'b10011011011; bin = 1'b1; // Expected: {'diff': 55, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100010011; b = 11'b10011011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111110010; b = 11'b00001011101; bin = 1'b0; // Expected: {'diff': 917, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111110010; b = 11'b00001011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 917, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111000011; b = 11'b01101101001; bin = 1'b1; // Expected: {'diff': 601, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111000011; b = 11'b01101101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 601, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101110111; b = 11'b00100110000; bin = 1'b0; // Expected: {'diff': 1095, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101110111; b = 11'b00100110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1095, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100010100; b = 11'b00000111011; bin = 1'b0; // Expected: {'diff': 1241, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100010100; b = 11'b00000111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1241, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111011001; b = 11'b00101000010; bin = 1'b0; // Expected: {'diff': 663, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111011001; b = 11'b00101000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 663, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010100011; b = 11'b01110000010; bin = 1'b1; // Expected: {'diff': 800, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010100011; b = 11'b01110000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 800, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111010010; b = 11'b00011111101; bin = 1'b1; // Expected: {'diff': 1748, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111010010; b = 11'b00011111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1748, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110101101; b = 11'b10000000000; bin = 1'b0; // Expected: {'diff': 1453, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110101101; b = 11'b10000000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1453, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001101011; b = 11'b10100110101; bin = 1'b1; // Expected: {'diff': 1845, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001101011; b = 11'b10100110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1845, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010011100; b = 11'b11001010100; bin = 1'b1; // Expected: {'diff': 71, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010011100; b = 11'b11001010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 71, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000001101; b = 11'b10001101100; bin = 1'b0; // Expected: {'diff': 929, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000001101; b = 11'b10001101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 929, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100000000; b = 11'b01110000000; bin = 1'b0; // Expected: {'diff': 896, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100000000; b = 11'b01110000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 896, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001101100; b = 11'b11101100011; bin = 1'b1; // Expected: {'diff': 1288, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001101100; b = 11'b11101100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1288, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110010000; b = 11'b11100011000; bin = 1'b1; // Expected: {'diff': 119, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110010000; b = 11'b11100011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 119, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100001111; b = 11'b10001000010; bin = 1'b1; // Expected: {'diff': 204, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100001111; b = 11'b10001000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 204, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111001111; b = 11'b11101101001; bin = 1'b1; // Expected: {'diff': 1125, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111001111; b = 11'b11101101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000011011; b = 11'b01111101101; bin = 1'b0; // Expected: {'diff': 1070, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000011011; b = 11'b01111101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1070, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000001001; b = 11'b11100011010; bin = 1'b1; // Expected: {'diff': 1774, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000001001; b = 11'b11100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1774, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110000010; b = 11'b10111100111; bin = 1'b0; // Expected: {'diff': 1947, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110000010; b = 11'b10111100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1947, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011001100; b = 11'b10010011011; bin = 1'b0; // Expected: {'diff': 561, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011001100; b = 11'b10010011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 561, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110000000; b = 11'b10000010010; bin = 1'b1; // Expected: {'diff': 1389, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110000000; b = 11'b10000010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1389, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101011110; b = 11'b11110010101; bin = 1'b0; // Expected: {'diff': 1993, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101011110; b = 11'b11110010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1993, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110001100; b = 11'b01001100100; bin = 1'b1; // Expected: {'diff': 295, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110001100; b = 11'b01001100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 295, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000011010; b = 11'b01110010110; bin = 1'b0; // Expected: {'diff': 1668, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000011010; b = 11'b01110010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1668, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001001001; b = 11'b00111000111; bin = 1'b0; // Expected: {'diff': 130, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001001001; b = 11'b00111000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 130, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010101100; b = 11'b00000010011; bin = 1'b0; // Expected: {'diff': 665, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010101100; b = 11'b00000010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 665, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111000111; b = 11'b11111010010; bin = 1'b1; // Expected: {'diff': 1012, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111000111; b = 11'b11111010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1012, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001010111; b = 11'b00011100110; bin = 1'b0; // Expected: {'diff': 881, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001010111; b = 11'b00011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 881, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001010001; b = 11'b00000110100; bin = 1'b1; // Expected: {'diff': 540, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001010001; b = 11'b00000110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 540, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010010111; b = 11'b10001101010; bin = 1'b0; // Expected: {'diff': 557, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010010111; b = 11'b10001101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 557, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000001010; b = 11'b01111010110; bin = 1'b1; // Expected: {'diff': 1587, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000001010; b = 11'b01111010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1587, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011111100; b = 11'b11111101010; bin = 1'b0; // Expected: {'diff': 274, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011111100; b = 11'b11111101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 274, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000010111; b = 11'b10010110010; bin = 1'b0; // Expected: {'diff': 1893, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000010111; b = 11'b10010110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1893, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110110001; b = 11'b01010111111; bin = 1'b1; // Expected: {'diff': 753, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110110001; b = 11'b01010111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 753, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110111100; b = 11'b10111100010; bin = 1'b1; // Expected: {'diff': 473, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110111100; b = 11'b10111100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 473, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000011101; b = 11'b10011100111; bin = 1'b1; // Expected: {'diff': 1845, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000011101; b = 11'b10011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1845, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110110100; b = 11'b11111010000; bin = 1'b1; // Expected: {'diff': 1507, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110110100; b = 11'b11111010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1507, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110110010; b = 11'b10001101010; bin = 1'b0; // Expected: {'diff': 840, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110110010; b = 11'b10001101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 840, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111001110; b = 11'b10110111000; bin = 1'b1; // Expected: {'diff': 533, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111001110; b = 11'b10110111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 533, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111111011; b = 11'b10011010010; bin = 1'b0; // Expected: {'diff': 1321, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111111011; b = 11'b10011010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1321, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000011110; b = 11'b01000110010; bin = 1'b1; // Expected: {'diff': 1515, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000011110; b = 11'b01000110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1515, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001101100; b = 11'b01110111111; bin = 1'b1; // Expected: {'diff': 1196, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001101100; b = 11'b01110111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1196, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001010001; b = 11'b00000101001; bin = 1'b1; // Expected: {'diff': 551, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001010001; b = 11'b00000101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 551, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100110010; b = 11'b10000101010; bin = 1'b1; // Expected: {'diff': 1799, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100110010; b = 11'b10000101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1799, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110000010; b = 11'b10111010100; bin = 1'b1; // Expected: {'diff': 1965, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110000010; b = 11'b10111010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1965, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101111100; b = 11'b10010101011; bin = 1'b1; // Expected: {'diff': 208, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101111100; b = 11'b10010101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 208, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100101111; b = 11'b10001010101; bin = 1'b1; // Expected: {'diff': 217, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100101111; b = 11'b10001010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 217, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010101010; b = 11'b11100111100; bin = 1'b0; // Expected: {'diff': 366, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010101010; b = 11'b11100111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 366, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010101110; b = 11'b01011001010; bin = 1'b1; // Expected: {'diff': 995, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010101110; b = 11'b01011001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 995, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001101010; b = 11'b11011001101; bin = 1'b1; // Expected: {'diff': 1436, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001101010; b = 11'b11011001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1436, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000110001; b = 11'b00101101001; bin = 1'b0; // Expected: {'diff': 712, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000110001; b = 11'b00101101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 712, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100001000; b = 11'b00000011010; bin = 1'b1; // Expected: {'diff': 1773, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100001000; b = 11'b00000011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1773, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000110010; b = 11'b01011010111; bin = 1'b0; // Expected: {'diff': 859, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000110010; b = 11'b01011010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 859, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100101001; b = 11'b10100100001; bin = 1'b1; // Expected: {'diff': 519, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100101001; b = 11'b10100100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 519, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001101100; b = 11'b11110010100; bin = 1'b1; // Expected: {'diff': 727, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001101100; b = 11'b11110010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 727, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110100000; b = 11'b11110000010; bin = 1'b0; // Expected: {'diff': 542, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110100000; b = 11'b11110000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 542, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001110010; b = 11'b00100110110; bin = 1'b0; // Expected: {'diff': 316, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001110010; b = 11'b00100110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 316, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010010011; b = 11'b11111001110; bin = 1'b0; // Expected: {'diff': 197, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010010011; b = 11'b11111001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 197, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100000111; b = 11'b01110011110; bin = 1'b1; // Expected: {'diff': 1896, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100000111; b = 11'b01110011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1896, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011011111; b = 11'b11101010010; bin = 1'b1; // Expected: {'diff': 908, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011011111; b = 11'b11101010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 908, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100110000; b = 11'b10110111100; bin = 1'b1; // Expected: {'diff': 1395, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100110000; b = 11'b10110111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1395, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101010011; b = 11'b01010011011; bin = 1'b0; // Expected: {'diff': 1720, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101010011; b = 11'b01010011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1720, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111110111; b = 11'b01000100010; bin = 1'b1; // Expected: {'diff': 1492, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111110111; b = 11'b01000100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1492, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100101010; b = 11'b01001011100; bin = 1'b1; // Expected: {'diff': 717, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100101010; b = 11'b01001011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 717, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000000100; b = 11'b10101110110; bin = 1'b0; // Expected: {'diff': 142, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000000100; b = 11'b10101110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 142, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100000110; b = 11'b01101010100; bin = 1'b1; // Expected: {'diff': 1457, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100000110; b = 11'b01101010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1457, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010000010; b = 11'b00001110100; bin = 1'b0; // Expected: {'diff': 1550, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010000010; b = 11'b00001110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1550, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010011011; b = 11'b00111001100; bin = 1'b1; // Expected: {'diff': 718, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010011011; b = 11'b00111001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 718, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011110101; b = 11'b00111000001; bin = 1'b1; // Expected: {'diff': 307, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011110101; b = 11'b00111000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 307, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101001011; b = 11'b01000111101; bin = 1'b1; // Expected: {'diff': 1293, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101001011; b = 11'b01000111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1293, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110000111; b = 11'b01011101010; bin = 1'b0; // Expected: {'diff': 1693, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110000111; b = 11'b01011101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1693, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111110101; b = 11'b10010101010; bin = 1'b0; // Expected: {'diff': 331, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111110101; b = 11'b10010101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 331, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101011110; b = 11'b11011011110; bin = 1'b0; // Expected: {'diff': 1664, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101011110; b = 11'b11011011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1664, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000010111; b = 11'b00100011100; bin = 1'b0; // Expected: {'diff': 763, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000010111; b = 11'b00100011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 763, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110100110; b = 11'b00000010110; bin = 1'b1; // Expected: {'diff': 399, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110100110; b = 11'b00000010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 399, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000101010; b = 11'b01100000110; bin = 1'b0; // Expected: {'diff': 804, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000101010; b = 11'b01100000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 804, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000010000; b = 11'b11000111000; bin = 1'b1; // Expected: {'diff': 983, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000010000; b = 11'b11000111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 983, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110000001; b = 11'b00010100010; bin = 1'b0; // Expected: {'diff': 1759, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110000001; b = 11'b00010100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1759, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011101010; b = 11'b01100111111; bin = 1'b0; // Expected: {'diff': 1451, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011101010; b = 11'b01100111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1451, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010000011; b = 11'b10100000110; bin = 1'b1; // Expected: {'diff': 892, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010000011; b = 11'b10100000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 892, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111111010; b = 11'b11011100011; bin = 1'b1; // Expected: {'diff': 278, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111111010; b = 11'b11011100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 278, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100000101; b = 11'b11110101110; bin = 1'b0; // Expected: {'diff': 1879, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100000101; b = 11'b11110101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1879, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110110100; b = 11'b01101001110; bin = 1'b0; // Expected: {'diff': 1638, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110110100; b = 11'b01101001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1638, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001110010; b = 11'b10011100010; bin = 1'b0; // Expected: {'diff': 912, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001110010; b = 11'b10011100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 912, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100001011; b = 11'b00000101000; bin = 1'b0; // Expected: {'diff': 739, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100001011; b = 11'b00000101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 739, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000110000; b = 11'b01000100010; bin = 1'b1; // Expected: {'diff': 525, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000110000; b = 11'b01000100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 525, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000011100; b = 11'b10000001011; bin = 1'b0; // Expected: {'diff': 529, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000011100; b = 11'b10000001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 529, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111110001; b = 11'b01111011111; bin = 1'b0; // Expected: {'diff': 530, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111110001; b = 11'b01111011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 530, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001001011; b = 11'b01000110100; bin = 1'b1; // Expected: {'diff': 1046, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001001011; b = 11'b01000110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1046, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001011010; b = 11'b00010101111; bin = 1'b0; // Expected: {'diff': 1963, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001011010; b = 11'b00010101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1963, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010010010; b = 11'b10101010000; bin = 1'b1; // Expected: {'diff': 1345, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010010010; b = 11'b10101010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1345, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010000010; b = 11'b00101110010; bin = 1'b1; // Expected: {'diff': 271, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010000010; b = 11'b00101110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 271, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001010111; b = 11'b00111000100; bin = 1'b0; // Expected: {'diff': 1171, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001010111; b = 11'b00111000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1171, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110000010; b = 11'b01011010010; bin = 1'b0; // Expected: {'diff': 1200, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110000010; b = 11'b01011010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1200, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011111101; b = 11'b01110000101; bin = 1'b1; // Expected: {'diff': 1911, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011111101; b = 11'b01110000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1911, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011000011; b = 11'b01001110110; bin = 1'b1; // Expected: {'diff': 588, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011000011; b = 11'b01001110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 588, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000001100; b = 11'b10010010100; bin = 1'b1; // Expected: {'diff': 1911, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000001100; b = 11'b10010010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1911, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100000001; b = 11'b01010010101; bin = 1'b1; // Expected: {'diff': 107, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100000001; b = 11'b01010010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 107, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001101011; b = 11'b11111011010; bin = 1'b0; // Expected: {'diff': 1681, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001101011; b = 11'b11111011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1681, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110100010; b = 11'b00110100100; bin = 1'b0; // Expected: {'diff': 1022, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110100010; b = 11'b00110100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1022, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111110011; b = 11'b11010010010; bin = 1'b0; // Expected: {'diff': 1377, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111110011; b = 11'b11010010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1377, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010111100; b = 11'b00010000000; bin = 1'b1; // Expected: {'diff': 59, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010111100; b = 11'b00010000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111110001; b = 11'b01001111010; bin = 1'b0; // Expected: {'diff': 375, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111110001; b = 11'b01001111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 375, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111011010; b = 11'b11001111000; bin = 1'b1; // Expected: {'diff': 353, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111011010; b = 11'b11001111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 353, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011111010; b = 11'b11110000011; bin = 1'b1; // Expected: {'diff': 1398, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011111010; b = 11'b11110000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1398, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101010111; b = 11'b10100100101; bin = 1'b0; // Expected: {'diff': 562, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101010111; b = 11'b10100100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 562, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010010011; b = 11'b10101011010; bin = 1'b1; // Expected: {'diff': 1336, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010010011; b = 11'b10101011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1336, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010101001; b = 11'b01001000101; bin = 1'b0; // Expected: {'diff': 612, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010101001; b = 11'b01001000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 612, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110111110; b = 11'b11000011101; bin = 1'b1; // Expected: {'diff': 1440, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110111110; b = 11'b11000011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1440, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100000010; b = 11'b01011111101; bin = 1'b0; // Expected: {'diff': 517, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100000010; b = 11'b01011111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 517, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001000011; b = 11'b00011000101; bin = 1'b0; // Expected: {'diff': 382, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001000011; b = 11'b00011000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 382, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010100100; b = 11'b11001000111; bin = 1'b1; // Expected: {'diff': 1628, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010100100; b = 11'b11001000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1628, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001001100; b = 11'b00011101111; bin = 1'b0; // Expected: {'diff': 1885, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001001100; b = 11'b00011101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1885, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111100100; b = 11'b11100000111; bin = 1'b1; // Expected: {'diff': 220, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111100100; b = 11'b11100000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011010100; b = 11'b10100011000; bin = 1'b1; // Expected: {'diff': 1467, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011010100; b = 11'b10100011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1467, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100110101; b = 11'b00110101011; bin = 1'b0; // Expected: {'diff': 1418, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100110101; b = 11'b00110101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1418, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100100010; b = 11'b00010010101; bin = 1'b0; // Expected: {'diff': 1677, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100100010; b = 11'b00010010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1677, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011011110; b = 11'b11010001000; bin = 1'b1; // Expected: {'diff': 1109, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011011110; b = 11'b11010001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1109, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001011100; b = 11'b11001101011; bin = 1'b1; // Expected: {'diff': 1008, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001011100; b = 11'b11001101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1008, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011001001; b = 11'b00100111110; bin = 1'b1; // Expected: {'diff': 1930, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011001001; b = 11'b00100111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1930, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011101100; b = 11'b00110000010; bin = 1'b0; // Expected: {'diff': 874, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011101100; b = 11'b00110000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 874, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101001110; b = 11'b11100110100; bin = 1'b0; // Expected: {'diff': 26, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101001110; b = 11'b11100110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011101101; b = 11'b00010110001; bin = 1'b0; // Expected: {'diff': 572, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011101101; b = 11'b00010110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 572, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011111000; b = 11'b11010110001; bin = 1'b0; // Expected: {'diff': 1095, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011111000; b = 11'b11010110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1095, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011011001; b = 11'b01100100001; bin = 1'b0; // Expected: {'diff': 952, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011011001; b = 11'b01100100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 952, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101111110; b = 11'b11011111000; bin = 1'b1; // Expected: {'diff': 1669, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101111110; b = 11'b11011111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1669, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011001101; b = 11'b10010100111; bin = 1'b1; // Expected: {'diff': 549, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011001101; b = 11'b10010100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 549, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100011111; b = 11'b00111111000; bin = 1'b0; // Expected: {'diff': 295, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100011111; b = 11'b00111111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 295, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010101000; b = 11'b00111101011; bin = 1'b1; // Expected: {'diff': 1724, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010101000; b = 11'b00111101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1724, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101110100; b = 11'b00110101110; bin = 1'b0; // Expected: {'diff': 1990, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101110100; b = 11'b00110101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1990, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011110011; b = 11'b11110000010; bin = 1'b0; // Expected: {'diff': 369, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011110011; b = 11'b11110000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 369, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101110011; b = 11'b11101101101; bin = 1'b1; // Expected: {'diff': 517, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101110011; b = 11'b11101101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 517, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101000111; b = 11'b11001110011; bin = 1'b1; // Expected: {'diff': 723, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101000111; b = 11'b11001110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 723, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001100110; b = 11'b10100110001; bin = 1'b1; // Expected: {'diff': 1844, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001100110; b = 11'b10100110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1844, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101110100; b = 11'b01010011111; bin = 1'b0; // Expected: {'diff': 1749, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101110100; b = 11'b01010011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1749, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011000011; b = 11'b10000011001; bin = 1'b0; // Expected: {'diff': 682, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011000011; b = 11'b10000011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 682, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011101100; b = 11'b01111110111; bin = 1'b0; // Expected: {'diff': 245, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011101100; b = 11'b01111110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 245, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011101100; b = 11'b01011101001; bin = 1'b1; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011101100; b = 11'b01011101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101010010; b = 11'b11010001100; bin = 1'b0; // Expected: {'diff': 1734, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101010010; b = 11'b11010001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1734, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110111100; b = 11'b11110010111; bin = 1'b0; // Expected: {'diff': 549, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110111100; b = 11'b11110010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 549, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011000100; b = 11'b00000011100; bin = 1'b0; // Expected: {'diff': 1192, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011000100; b = 11'b00000011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1192, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101100111; b = 11'b11001000011; bin = 1'b1; // Expected: {'diff': 1827, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101100111; b = 11'b11001000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1827, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011110110; b = 11'b00000110100; bin = 1'b0; // Expected: {'diff': 194, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011110110; b = 11'b00000110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 194, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100010010; b = 11'b01110110001; bin = 1'b1; // Expected: {'diff': 864, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100010010; b = 11'b01110110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 864, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101001101; b = 11'b01001000110; bin = 1'b0; // Expected: {'diff': 1287, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101001101; b = 11'b01001000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1287, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101011010; b = 11'b00010101010; bin = 1'b1; // Expected: {'diff': 687, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101011010; b = 11'b00010101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 687, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110011101; b = 11'b10110011101; bin = 1'b1; // Expected: {'diff': 1535, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110011101; b = 11'b10110011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1535, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001111111; b = 11'b00101010111; bin = 1'b0; // Expected: {'diff': 1320, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001111111; b = 11'b00101010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1320, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111100101; b = 11'b00101110000; bin = 1'b1; // Expected: {'diff': 628, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111100101; b = 11'b00101110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 628, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110111000; b = 11'b11111101000; bin = 1'b0; // Expected: {'diff': 1488, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110111000; b = 11'b11111101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1488, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010101010; b = 11'b11011100100; bin = 1'b1; // Expected: {'diff': 965, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010101010; b = 11'b11011100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 965, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111111110; b = 11'b10100110011; bin = 1'b0; // Expected: {'diff': 1739, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111111110; b = 11'b10100110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1739, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101011100; b = 11'b01110111111; bin = 1'b1; // Expected: {'diff': 1948, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101011100; b = 11'b01110111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1948, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110111101; b = 11'b11001110000; bin = 1'b1; // Expected: {'diff': 1356, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110111101; b = 11'b11001110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1356, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001011110; b = 11'b01001001001; bin = 1'b1; // Expected: {'diff': 1044, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001011110; b = 11'b01001001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1044, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000001000; b = 11'b00100000111; bin = 1'b1; // Expected: {'diff': 768, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000001000; b = 11'b00100000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 768, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101110101; b = 11'b00010011000; bin = 1'b1; // Expected: {'diff': 1756, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101110101; b = 11'b00010011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1756, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100001010; b = 11'b10101010101; bin = 1'b0; // Expected: {'diff': 1461, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100001010; b = 11'b10101010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1461, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101010011; b = 11'b10000101111; bin = 1'b1; // Expected: {'diff': 1315, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101010011; b = 11'b10000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1315, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010000001; b = 11'b01010101110; bin = 1'b1; // Expected: {'diff': 978, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010000001; b = 11'b01010101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 978, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110010001; b = 11'b00110100011; bin = 1'b1; // Expected: {'diff': 1517, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110010001; b = 11'b00110100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1517, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001110111; b = 11'b11011111000; bin = 1'b1; // Expected: {'diff': 1918, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001110111; b = 11'b11011111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1918, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000101000; b = 11'b10000101110; bin = 1'b0; // Expected: {'diff': 506, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000101000; b = 11'b10000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 506, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001011010; b = 11'b00110000000; bin = 1'b0; // Expected: {'diff': 730, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001011010; b = 11'b00110000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 730, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010000000; b = 11'b11000110110; bin = 1'b0; // Expected: {'diff': 74, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010000000; b = 11'b11000110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 74, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111001100; b = 11'b00101000011; bin = 1'b0; // Expected: {'diff': 1673, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111001100; b = 11'b00101000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1673, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110101110; b = 11'b10010111001; bin = 1'b0; // Expected: {'diff': 1269, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110101110; b = 11'b10010111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1269, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011101110; b = 11'b11000101101; bin = 1'b0; // Expected: {'diff': 1217, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011101110; b = 11'b11000101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1217, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010110000; b = 11'b11000111001; bin = 1'b0; // Expected: {'diff': 119, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010110000; b = 11'b11000111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 119, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011100001; b = 11'b00101000011; bin = 1'b1; // Expected: {'diff': 413, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011100001; b = 11'b00101000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 413, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100011101; b = 11'b11001010011; bin = 1'b0; // Expected: {'diff': 202, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100011101; b = 11'b11001010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 202, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100010111; b = 11'b00011001100; bin = 1'b0; // Expected: {'diff': 1611, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100010111; b = 11'b00011001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1611, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110000010; b = 11'b01110100011; bin = 1'b0; // Expected: {'diff': 1503, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110000010; b = 11'b01110100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1503, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001101101; b = 11'b11011101001; bin = 1'b0; // Expected: {'diff': 900, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001101101; b = 11'b11011101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 900, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100100110; b = 11'b01101111101; bin = 1'b1; // Expected: {'diff': 936, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100100110; b = 11'b01101111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 936, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111100110; b = 11'b11111000000; bin = 1'b1; // Expected: {'diff': 549, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111100110; b = 11'b11111000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 549, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011100101; b = 11'b00010100101; bin = 1'b0; // Expected: {'diff': 64, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011100101; b = 11'b00010100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101011001; b = 11'b00111010010; bin = 1'b1; // Expected: {'diff': 902, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101011001; b = 11'b00111010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 902, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101000110; b = 11'b10001101101; bin = 1'b1; // Expected: {'diff': 1240, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101000110; b = 11'b10001101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1240, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011000110; b = 11'b10101000011; bin = 1'b0; // Expected: {'diff': 1411, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011000110; b = 11'b10101000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1411, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111111001; b = 11'b10000111011; bin = 1'b1; // Expected: {'diff': 1469, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111111001; b = 11'b10000111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1469, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100111011; b = 11'b00111001100; bin = 1'b1; // Expected: {'diff': 878, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100111011; b = 11'b00111001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 878, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101010110; b = 11'b10011010110; bin = 1'b1; // Expected: {'diff': 1663, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101010110; b = 11'b10011010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1663, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101100001; b = 11'b00100100101; bin = 1'b1; // Expected: {'diff': 571, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101100001; b = 11'b00100100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 571, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011001001; b = 11'b11011000101; bin = 1'b1; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011001001; b = 11'b11011000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001111011; b = 11'b11011010110; bin = 1'b1; // Expected: {'diff': 1444, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001111011; b = 11'b11011010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1444, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111111000; b = 11'b10000101101; bin = 1'b0; // Expected: {'diff': 1483, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111111000; b = 11'b10000101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1483, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011011110; b = 11'b00111000001; bin = 1'b1; // Expected: {'diff': 1308, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011011110; b = 11'b00111000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1308, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010010101; b = 11'b01011011101; bin = 1'b0; // Expected: {'diff': 1976, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010010101; b = 11'b01011011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1976, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101010000; b = 11'b11010001100; bin = 1'b1; // Expected: {'diff': 1219, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101010000; b = 11'b11010001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1219, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101010110; b = 11'b00011000100; bin = 1'b0; // Expected: {'diff': 1682, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101010110; b = 11'b00011000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1682, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001101100; b = 11'b10101101101; bin = 1'b1; // Expected: {'diff': 254, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001101100; b = 11'b10101101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 254, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110110010; b = 11'b11001011010; bin = 1'b0; // Expected: {'diff': 1880, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110110010; b = 11'b11001011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1880, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001001001; b = 11'b10001001110; bin = 1'b1; // Expected: {'diff': 2042, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001001001; b = 11'b10001001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2042, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000111001; b = 11'b11011001011; bin = 1'b1; // Expected: {'diff': 877, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000111001; b = 11'b11011001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 877, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010100011; b = 11'b11010110010; bin = 1'b0; // Expected: {'diff': 497, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010100011; b = 11'b11010110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 497, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010111000; b = 11'b10010010110; bin = 1'b1; // Expected: {'diff': 1057, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010111000; b = 11'b10010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1057, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111110111; b = 11'b11101010001; bin = 1'b0; // Expected: {'diff': 1702, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111110111; b = 11'b11101010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1702, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000001001; b = 11'b10100001011; bin = 1'b1; // Expected: {'diff': 1789, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000001001; b = 11'b10100001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1789, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000001001; b = 11'b10010100000; bin = 1'b1; // Expected: {'diff': 1896, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000001001; b = 11'b10010100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1896, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101000111; b = 11'b00100000110; bin = 1'b1; // Expected: {'diff': 576, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101000111; b = 11'b00100000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 576, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100111110; b = 11'b00001011111; bin = 1'b1; // Expected: {'diff': 222, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100111110; b = 11'b00001011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 222, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100000101; b = 11'b01011011010; bin = 1'b0; // Expected: {'diff': 1579, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100000101; b = 11'b01011011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1579, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111110000; b = 11'b11110101000; bin = 1'b1; // Expected: {'diff': 583, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111110000; b = 11'b11110101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 583, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111111001; b = 11'b01100111111; bin = 1'b0; // Expected: {'diff': 698, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111111001; b = 11'b01100111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 698, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100011010; b = 11'b11011011001; bin = 1'b1; // Expected: {'diff': 576, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100011010; b = 11'b11011011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 576, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111010101; b = 11'b00101011100; bin = 1'b1; // Expected: {'diff': 1656, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111010101; b = 11'b00101011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1656, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100001001; b = 11'b00010110111; bin = 1'b1; // Expected: {'diff': 1105, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100001001; b = 11'b00010110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1105, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011011111; b = 11'b00001010101; bin = 1'b1; // Expected: {'diff': 1673, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011011111; b = 11'b00001010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1673, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110010110; b = 11'b01000101110; bin = 1'b1; // Expected: {'diff': 1895, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110010110; b = 11'b01000101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1895, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010100001; b = 11'b10100100100; bin = 1'b1; // Expected: {'diff': 1404, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010100001; b = 11'b10100100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1404, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100010111; b = 11'b11000110110; bin = 1'b0; // Expected: {'diff': 225, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100010111; b = 11'b11000110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 225, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011100001; b = 11'b00011100001; bin = 1'b0; // Expected: {'diff': 512, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011100001; b = 11'b00011100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 512, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110100111; b = 11'b11000101011; bin = 1'b1; // Expected: {'diff': 891, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110100111; b = 11'b11000101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 891, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001000011; b = 11'b01100010001; bin = 1'b1; // Expected: {'diff': 305, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001000011; b = 11'b01100010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 305, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000111000; b = 11'b10010010101; bin = 1'b1; // Expected: {'diff': 930, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000111000; b = 11'b10010010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 930, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010111101; b = 11'b11111000001; bin = 1'b1; // Expected: {'diff': 1787, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010111101; b = 11'b11111000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1787, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000110000; b = 11'b11111101010; bin = 1'b0; // Expected: {'diff': 1606, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000110000; b = 11'b11111101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1606, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101001111; b = 11'b01101001110; bin = 1'b0; // Expected: {'diff': 1025, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101001111; b = 11'b01101001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1025, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001110010; b = 11'b10100011100; bin = 1'b0; // Expected: {'diff': 342, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001110010; b = 11'b10100011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 342, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010010111; b = 11'b00110011100; bin = 1'b1; // Expected: {'diff': 1786, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010010111; b = 11'b00110011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1786, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111100100; b = 11'b00100000000; bin = 1'b0; // Expected: {'diff': 228, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111100100; b = 11'b00100000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 228, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010110101; b = 11'b01100110101; bin = 1'b1; // Expected: {'diff': 383, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010110101; b = 11'b01100110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 383, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101011000; b = 11'b11110110110; bin = 1'b1; // Expected: {'diff': 929, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101011000; b = 11'b11110110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 929, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011011010; b = 11'b00110000101; bin = 1'b0; // Expected: {'diff': 1877, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011011010; b = 11'b00110000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1877, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000101100; b = 11'b00111101010; bin = 1'b0; // Expected: {'diff': 578, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000101100; b = 11'b00111101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 578, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111010110; b = 11'b11111100101; bin = 1'b0; // Expected: {'diff': 2033, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111010110; b = 11'b11111100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2033, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001100001; b = 11'b00010001000; bin = 1'b0; // Expected: {'diff': 473, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001100001; b = 11'b00010001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 473, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011110111; b = 11'b01100111101; bin = 1'b1; // Expected: {'diff': 1465, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011110111; b = 11'b01100111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1465, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100111110; b = 11'b00010011000; bin = 1'b1; // Expected: {'diff': 1189, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100111110; b = 11'b00010011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1189, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000111101; b = 11'b01111110010; bin = 1'b0; // Expected: {'diff': 1611, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000111101; b = 11'b01111110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1611, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011111010; b = 11'b10111111110; bin = 1'b0; // Expected: {'diff': 764, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011111010; b = 11'b10111111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 764, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000100110; b = 11'b10111000100; bin = 1'b1; // Expected: {'diff': 1121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000100110; b = 11'b10111000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100111111; b = 11'b11111100010; bin = 1'b0; // Expected: {'diff': 349, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100111111; b = 11'b11111100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 349, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101010000; b = 11'b00100110010; bin = 1'b1; // Expected: {'diff': 29, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101010000; b = 11'b00100110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101001110; b = 11'b10001010000; bin = 1'b0; // Expected: {'diff': 254, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101001110; b = 11'b10001010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 254, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101111110; b = 11'b00011010101; bin = 1'b1; // Expected: {'diff': 168, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101111110; b = 11'b00011010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 168, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011011110; b = 11'b10111101100; bin = 1'b0; // Expected: {'diff': 1778, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011011110; b = 11'b10111101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1778, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111010100; b = 11'b11110000010; bin = 1'b0; // Expected: {'diff': 594, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111010100; b = 11'b11110000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 594, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001100000; b = 11'b00001010001; bin = 1'b0; // Expected: {'diff': 1039, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001100000; b = 11'b00001010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1039, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010011111; b = 11'b10000101110; bin = 1'b0; // Expected: {'diff': 1649, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010011111; b = 11'b10000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1649, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101100010; b = 11'b11011011101; bin = 1'b1; // Expected: {'diff': 1668, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101100010; b = 11'b11011011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1668, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000000110; b = 11'b10100011001; bin = 1'b1; // Expected: {'diff': 1260, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000000110; b = 11'b10100011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1260, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011111001; b = 11'b00110010010; bin = 1'b1; // Expected: {'diff': 870, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011111001; b = 11'b00110010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 870, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110101001; b = 11'b11001110011; bin = 1'b1; // Expected: {'diff': 821, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110101001; b = 11'b11001110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 821, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001011100; b = 11'b11110001010; bin = 1'b1; // Expected: {'diff': 1233, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001011100; b = 11'b11110001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1233, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110001100; b = 11'b01001010011; bin = 1'b0; // Expected: {'diff': 825, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110001100; b = 11'b01001010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 825, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110110110; b = 11'b01101111001; bin = 1'b0; // Expected: {'diff': 1085, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110110110; b = 11'b01101111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1085, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101100011; b = 11'b11101110001; bin = 1'b0; // Expected: {'diff': 1010, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101100011; b = 11'b11101110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1010, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000100010; b = 11'b11100110000; bin = 1'b0; // Expected: {'diff': 242, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000100010; b = 11'b11100110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 242, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001100111; b = 11'b10000010010; bin = 1'b1; // Expected: {'diff': 1108, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001100111; b = 11'b10000010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010100010; b = 11'b11000101100; bin = 1'b1; // Expected: {'diff': 629, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010100010; b = 11'b11000101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 629, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101110000; b = 11'b01001110011; bin = 1'b1; // Expected: {'diff': 1788, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101110000; b = 11'b01001110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1788, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001110011; b = 11'b10001101000; bin = 1'b0; // Expected: {'diff': 11, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001110011; b = 11'b10001101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010101100; b = 11'b01011111011; bin = 1'b0; // Expected: {'diff': 433, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010101100; b = 11'b01011111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 433, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011011011; b = 11'b00010000010; bin = 1'b0; // Expected: {'diff': 601, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011011011; b = 11'b00010000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 601, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001000100; b = 11'b00001100010; bin = 1'b1; // Expected: {'diff': 993, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001000100; b = 11'b00001100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 993, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000111001; b = 11'b01111001011; bin = 1'b0; // Expected: {'diff': 110, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000111001; b = 11'b01111001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 110, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011101111; b = 11'b10101001000; bin = 1'b1; // Expected: {'diff': 934, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011101111; b = 11'b10101001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 934, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011010010; b = 11'b11010000000; bin = 1'b0; // Expected: {'diff': 82, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011010010; b = 11'b11010000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000100001; b = 11'b10110000101; bin = 1'b0; // Expected: {'diff': 156, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000100001; b = 11'b10110000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 156, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111110001; b = 11'b00000111100; bin = 1'b0; // Expected: {'diff': 1973, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111110001; b = 11'b00000111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1973, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101100011; b = 11'b00101010001; bin = 1'b1; // Expected: {'diff': 1041, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101100011; b = 11'b00101010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1041, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001110010; b = 11'b11011111011; bin = 1'b0; // Expected: {'diff': 375, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001110010; b = 11'b11011111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 375, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101001000; b = 11'b11000000110; bin = 1'b0; // Expected: {'diff': 834, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101001000; b = 11'b11000000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 834, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011010011; b = 11'b01011000010; bin = 1'b0; // Expected: {'diff': 529, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011010011; b = 11'b01011000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 529, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101101100; b = 11'b10110101010; bin = 1'b0; // Expected: {'diff': 1986, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101101100; b = 11'b10110101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1986, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101110001; b = 11'b01100111110; bin = 1'b1; // Expected: {'diff': 1074, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101110001; b = 11'b01100111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1074, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110011111; b = 11'b10001001110; bin = 1'b0; // Expected: {'diff': 1361, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110011111; b = 11'b10001001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1361, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101011110; b = 11'b11000001000; bin = 1'b1; // Expected: {'diff': 853, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101011110; b = 11'b11000001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 853, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011001111; b = 11'b11111000000; bin = 1'b0; // Expected: {'diff': 1807, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011001111; b = 11'b11111000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1807, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111110100; b = 11'b00010111011; bin = 1'b0; // Expected: {'diff': 313, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111110100; b = 11'b00010111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 313, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111101001; b = 11'b01100011111; bin = 1'b1; // Expected: {'diff': 713, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111101001; b = 11'b01100011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 713, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110110100; b = 11'b10110001011; bin = 1'b1; // Expected: {'diff': 552, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110110100; b = 11'b10110001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 552, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010100110; b = 11'b01000100010; bin = 1'b0; // Expected: {'diff': 644, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010100110; b = 11'b01000100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 644, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001000111; b = 11'b10001110100; bin = 1'b0; // Expected: {'diff': 1491, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001000111; b = 11'b10001110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1491, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101110110; b = 11'b10011110001; bin = 1'b1; // Expected: {'diff': 644, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101110110; b = 11'b10011110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 644, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010111011; b = 11'b00000010110; bin = 1'b0; // Expected: {'diff': 1701, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010111011; b = 11'b00000010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1701, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000000111; b = 11'b11010110110; bin = 1'b1; // Expected: {'diff': 1360, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000000111; b = 11'b11010110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1360, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011101011; b = 11'b01010010101; bin = 1'b0; // Expected: {'diff': 86, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011101011; b = 11'b01010010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101001000; b = 11'b10110110010; bin = 1'b1; // Expected: {'diff': 1429, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101001000; b = 11'b10110110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1429, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000001101; b = 11'b01110011001; bin = 1'b1; // Expected: {'diff': 1651, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000001101; b = 11'b01110011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1651, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111011010; b = 11'b11000100010; bin = 1'b0; // Expected: {'diff': 440, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111011010; b = 11'b11000100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 440, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110000110; b = 11'b00100101101; bin = 1'b0; // Expected: {'diff': 1113, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110000110; b = 11'b00100101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100110010; b = 11'b10000101101; bin = 1'b0; // Expected: {'diff': 1797, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100110010; b = 11'b10000101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1797, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000001011; b = 11'b00010010010; bin = 1'b1; // Expected: {'diff': 888, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000001011; b = 11'b00010010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 888, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101001111; b = 11'b11100000001; bin = 1'b0; // Expected: {'diff': 590, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101001111; b = 11'b11100000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 590, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101011111; b = 11'b11101110100; bin = 1'b1; // Expected: {'diff': 490, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101011111; b = 11'b11101110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 490, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010110011; b = 11'b11001010000; bin = 1'b0; // Expected: {'diff': 611, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010110011; b = 11'b11001010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 611, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110111001; b = 11'b00101110010; bin = 1'b1; // Expected: {'diff': 1606, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110111001; b = 11'b00101110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1606, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001100001; b = 11'b01000000110; bin = 1'b1; // Expected: {'diff': 1626, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001100001; b = 11'b01000000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1626, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100111010; b = 11'b01111000011; bin = 1'b0; // Expected: {'diff': 887, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100111010; b = 11'b01111000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 887, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110001000; b = 11'b00101001001; bin = 1'b0; // Expected: {'diff': 63, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110001000; b = 11'b00101001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001010110; b = 11'b01000101100; bin = 1'b0; // Expected: {'diff': 1578, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001010110; b = 11'b01000101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1578, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110001101; b = 11'b11000101101; bin = 1'b0; // Expected: {'diff': 352, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110001101; b = 11'b11000101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 352, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001111010; b = 11'b11011000110; bin = 1'b1; // Expected: {'diff': 1459, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001111010; b = 11'b11011000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1459, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001100100; b = 11'b10101011001; bin = 1'b1; // Expected: {'diff': 1290, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001100100; b = 11'b10101011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1290, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001101100; b = 11'b11101000000; bin = 1'b1; // Expected: {'diff': 1323, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001101100; b = 11'b11101000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1323, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000000101; b = 11'b00010011001; bin = 1'b0; // Expected: {'diff': 1900, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000000101; b = 11'b00010011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1900, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101111001; b = 11'b10111011010; bin = 1'b0; // Expected: {'diff': 927, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101111001; b = 11'b10111011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 927, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111001001; b = 11'b10110110101; bin = 1'b0; // Expected: {'diff': 1044, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111001001; b = 11'b10110110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1044, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010000000; b = 11'b00101111101; bin = 1'b0; // Expected: {'diff': 259, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010000000; b = 11'b00101111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 259, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011001101; b = 11'b11001101110; bin = 1'b1; // Expected: {'diff': 1630, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011001101; b = 11'b11001101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1630, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110000111; b = 11'b01000010100; bin = 1'b1; // Expected: {'diff': 882, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110000111; b = 11'b01000010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 882, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011110101; b = 11'b01100100101; bin = 1'b0; // Expected: {'diff': 464, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011110101; b = 11'b01100100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 464, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001100101; b = 11'b10111010001; bin = 1'b1; // Expected: {'diff': 659, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001100101; b = 11'b10111010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 659, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101100100; b = 11'b01001110001; bin = 1'b0; // Expected: {'diff': 1267, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101100100; b = 11'b01001110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1267, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110010000; b = 11'b10010100100; bin = 1'b1; // Expected: {'diff': 235, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110010000; b = 11'b10010100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 235, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100111101; b = 11'b10101011010; bin = 1'b1; // Expected: {'diff': 994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100111101; b = 11'b10101011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001111010; b = 11'b11000110010; bin = 1'b1; // Expected: {'diff': 583, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001111010; b = 11'b11000110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 583, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100001101; b = 11'b11100001110; bin = 1'b1; // Expected: {'diff': 1022, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100001101; b = 11'b11100001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1022, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001110011; b = 11'b11001101101; bin = 1'b1; // Expected: {'diff': 1541, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001110011; b = 11'b11001101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1541, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111110011; b = 11'b01000101101; bin = 1'b1; // Expected: {'diff': 1989, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111110011; b = 11'b01000101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1989, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001110000; b = 11'b01000101011; bin = 1'b1; // Expected: {'diff': 68, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001110000; b = 11'b01000101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100011110; b = 11'b10010110000; bin = 1'b1; // Expected: {'diff': 1645, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100011110; b = 11'b10010110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1645, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110111111; b = 11'b10010101000; bin = 1'b1; // Expected: {'diff': 1302, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110111111; b = 11'b10010101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1302, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110011100; b = 11'b11111110011; bin = 1'b1; // Expected: {'diff': 1448, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110011100; b = 11'b11111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1448, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010100011; b = 11'b01010000001; bin = 1'b0; // Expected: {'diff': 546, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010100011; b = 11'b01010000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 546, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100110100; b = 11'b11011000001; bin = 1'b0; // Expected: {'diff': 1139, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100110100; b = 11'b11011000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1139, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011100101; b = 11'b10101101100; bin = 1'b1; // Expected: {'diff': 1400, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011100101; b = 11'b10101101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1400, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011011110; b = 11'b01001100101; bin = 1'b1; // Expected: {'diff': 632, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011011110; b = 11'b01001100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 632, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111100111; b = 11'b10010111111; bin = 1'b0; // Expected: {'diff': 808, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111100111; b = 11'b10010111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 808, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011100100; b = 11'b01001000101; bin = 1'b1; // Expected: {'diff': 1182, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011100100; b = 11'b01001000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1182, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110110100; b = 11'b01000111010; bin = 1'b0; // Expected: {'diff': 890, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110110100; b = 11'b01000111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 890, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100101001; b = 11'b00000111011; bin = 1'b0; // Expected: {'diff': 1262, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100101001; b = 11'b00000111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1262, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000011000; b = 11'b00001010100; bin = 1'b0; // Expected: {'diff': 1476, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000011000; b = 11'b00001010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1476, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010011000; b = 11'b10001100000; bin = 1'b1; // Expected: {'diff': 1591, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010011000; b = 11'b10001100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1591, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011000010; b = 11'b01110100101; bin = 1'b1; // Expected: {'diff': 1820, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011000010; b = 11'b01110100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1820, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100011010; b = 11'b01101000010; bin = 1'b1; // Expected: {'diff': 983, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100011010; b = 11'b01101000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 983, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010111100; b = 11'b00010110110; bin = 1'b1; // Expected: {'diff': 1029, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010111100; b = 11'b00010110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1029, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011101011; b = 11'b11100010011; bin = 1'b0; // Expected: {'diff': 472, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011101011; b = 11'b11100010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 472, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111100000; b = 11'b10100101110; bin = 1'b0; // Expected: {'diff': 1202, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111100000; b = 11'b10100101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1202, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011001101; b = 11'b01010110111; bin = 1'b0; // Expected: {'diff': 22, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011001101; b = 11'b01010110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101100000; b = 11'b10110000110; bin = 1'b1; // Expected: {'diff': 473, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101100000; b = 11'b10110000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 473, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111010101; b = 11'b01110101111; bin = 1'b0; // Expected: {'diff': 38, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111010101; b = 11'b01110101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 38, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010011000; b = 11'b00010111011; bin = 1'b0; // Expected: {'diff': 2013, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010011000; b = 11'b00010111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2013, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101101011; b = 11'b00100110010; bin = 1'b0; // Expected: {'diff': 1593, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101101011; b = 11'b00100110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1593, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101010111; b = 11'b10110100100; bin = 1'b0; // Expected: {'diff': 1971, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101010111; b = 11'b10110100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1971, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000110110; b = 11'b01110011000; bin = 1'b0; // Expected: {'diff': 158, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000110110; b = 11'b01110011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 158, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010001011; b = 11'b00011100100; bin = 1'b1; // Expected: {'diff': 1958, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010001011; b = 11'b00011100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1958, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111001001; b = 11'b10010110000; bin = 1'b0; // Expected: {'diff': 1817, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111001001; b = 11'b10010110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1817, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110110111; b = 11'b10001011001; bin = 1'b0; // Expected: {'diff': 1886, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110110111; b = 11'b10001011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1886, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110100100; b = 11'b01111001010; bin = 1'b1; // Expected: {'diff': 2009, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110100100; b = 11'b01111001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2009, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011111111; b = 11'b00101111110; bin = 1'b0; // Expected: {'diff': 385, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011111111; b = 11'b00101111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 385, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010100101; b = 11'b10000000100; bin = 1'b1; // Expected: {'diff': 1184, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010100101; b = 11'b10000000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1184, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001110010; b = 11'b01101011011; bin = 1'b1; // Expected: {'diff': 1814, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001110010; b = 11'b01101011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1814, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111111010; b = 11'b10010110110; bin = 1'b1; // Expected: {'diff': 323, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111111010; b = 11'b10010110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 323, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111100010; b = 11'b01001011000; bin = 1'b0; // Expected: {'diff': 1418, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111100010; b = 11'b01001011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1418, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010100100; b = 11'b00000010010; bin = 1'b0; // Expected: {'diff': 146, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010100100; b = 11'b00000010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 146, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101000010; b = 11'b00000100000; bin = 1'b1; // Expected: {'diff': 1313, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101000010; b = 11'b00000100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1313, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011001111; b = 11'b01011111110; bin = 1'b0; // Expected: {'diff': 1489, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011001111; b = 11'b01011111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1489, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101111001; b = 11'b00011101101; bin = 1'b1; // Expected: {'diff': 1163, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101111001; b = 11'b00011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1163, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101100010; b = 11'b01000011001; bin = 1'b0; // Expected: {'diff': 329, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101100010; b = 11'b01000011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 329, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111100000; b = 11'b01001100110; bin = 1'b1; // Expected: {'diff': 377, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111100000; b = 11'b01001100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 377, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101110001; b = 11'b00110101010; bin = 1'b1; // Expected: {'diff': 454, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101110001; b = 11'b00110101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 454, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011100011; b = 11'b11000010001; bin = 1'b1; // Expected: {'diff': 1233, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011100011; b = 11'b11000010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1233, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011101001; b = 11'b11000010001; bin = 1'b1; // Expected: {'diff': 727, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011101001; b = 11'b11000010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 727, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00101011010; b = 11'b10111100000; bin = 1'b0; // Expected: {'diff': 890, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00101011010; b = 11'b10111100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 890, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110000110; b = 11'b01101010100; bin = 1'b0; // Expected: {'diff': 1074, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110000110; b = 11'b01101010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1074, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010001001; b = 11'b01110111011; bin = 1'b1; // Expected: {'diff': 1741, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010001001; b = 11'b01110111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1741, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010110011; b = 11'b00101010000; bin = 1'b0; // Expected: {'diff': 1379, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010110011; b = 11'b00101010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1379, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011100011; b = 11'b11111100001; bin = 1'b1; // Expected: {'diff': 1281, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011100011; b = 11'b11111100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1281, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001110000; b = 11'b10000111001; bin = 1'b0; // Expected: {'diff': 1591, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001110000; b = 11'b10000111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1591, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101111100; b = 11'b00110110011; bin = 1'b0; // Expected: {'diff': 457, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101111100; b = 11'b00110110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 457, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011011100; b = 11'b01000110000; bin = 1'b0; // Expected: {'diff': 172, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011011100; b = 11'b01000110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 172, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110000001; b = 11'b11000111111; bin = 1'b0; // Expected: {'diff': 1346, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110000001; b = 11'b11000111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1346, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010011010; b = 11'b11100110011; bin = 1'b0; // Expected: {'diff': 871, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010011010; b = 11'b11100110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 871, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100001100; b = 11'b10010101101; bin = 1'b1; // Expected: {'diff': 94, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100001100; b = 11'b10010101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 94, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101011010; b = 11'b10111111011; bin = 1'b0; // Expected: {'diff': 1887, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101011010; b = 11'b10111111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1887, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110011010; b = 11'b10100011110; bin = 1'b1; // Expected: {'diff': 123, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110011010; b = 11'b10100011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 123, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010110111; b = 11'b11101011101; bin = 1'b1; // Expected: {'diff': 1369, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010110111; b = 11'b11101011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1369, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011110110; b = 11'b11101011101; bin = 1'b0; // Expected: {'diff': 921, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011110110; b = 11'b11101011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 921, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010011010; b = 11'b01001100101; bin = 1'b1; // Expected: {'diff': 564, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010011010; b = 11'b01001100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 564, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010001111; b = 11'b10110110010; bin = 1'b1; // Expected: {'diff': 1244, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010001111; b = 11'b10110110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1244, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101000001; b = 11'b00000000101; bin = 1'b1; // Expected: {'diff': 1851, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101000001; b = 11'b00000000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1851, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000111010; b = 11'b00011110010; bin = 1'b1; // Expected: {'diff': 839, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000111010; b = 11'b00011110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 839, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100111111; b = 11'b00011000010; bin = 1'b0; // Expected: {'diff': 1149, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100111111; b = 11'b00011000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1149, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010000111; b = 11'b10001100111; bin = 1'b1; // Expected: {'diff': 543, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010000111; b = 11'b10001100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 543, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010100011; b = 11'b01101001000; bin = 1'b0; // Expected: {'diff': 1883, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010100011; b = 11'b01101001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1883, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001010001; b = 11'b00110010111; bin = 1'b1; // Expected: {'diff': 185, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001010001; b = 11'b00110010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 185, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101110001; b = 11'b11100000100; bin = 1'b0; // Expected: {'diff': 1133, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101110001; b = 11'b11100000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1133, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111110101; b = 11'b11011101111; bin = 1'b1; // Expected: {'diff': 1797, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111110101; b = 11'b11011101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1797, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111110110; b = 11'b11000011111; bin = 1'b1; // Expected: {'diff': 470, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111110110; b = 11'b11000011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 470, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110000100; b = 11'b10111001101; bin = 1'b0; // Expected: {'diff': 1975, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110000100; b = 11'b10111001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1975, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110010011; b = 11'b01111000000; bin = 1'b0; // Expected: {'diff': 979, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110010011; b = 11'b01111000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 979, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011111101; b = 11'b10001010101; bin = 1'b1; // Expected: {'diff': 167, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011111101; b = 11'b10001010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 167, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110100001; b = 11'b10111101000; bin = 1'b0; // Expected: {'diff': 953, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110100001; b = 11'b10111101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 953, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100011110; b = 11'b00001010011; bin = 1'b0; // Expected: {'diff': 1739, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100011110; b = 11'b00001010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1739, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000001110; b = 11'b11100000101; bin = 1'b0; // Expected: {'diff': 265, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000001110; b = 11'b11100000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 265, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010110010; b = 11'b01100011100; bin = 1'b1; // Expected: {'diff': 1429, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010110010; b = 11'b01100011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1429, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000111110; b = 11'b11100000000; bin = 1'b1; // Expected: {'diff': 829, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000111110; b = 11'b11100000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 829, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111101111; b = 11'b11001101011; bin = 1'b0; // Expected: {'diff': 388, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111101111; b = 11'b11001101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 388, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011111100; b = 11'b00111100111; bin = 1'b0; // Expected: {'diff': 1813, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011111100; b = 11'b00111100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1813, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111010110; b = 11'b01011111000; bin = 1'b1; // Expected: {'diff': 1757, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111010110; b = 11'b01011111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1757, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110110010; b = 11'b11001111110; bin = 1'b0; // Expected: {'diff': 308, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110110010; b = 11'b11001111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 308, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101001000; b = 11'b01011101101; bin = 1'b0; // Expected: {'diff': 1115, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101001000; b = 11'b01011101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111001111; b = 11'b00010110000; bin = 1'b0; // Expected: {'diff': 287, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111001111; b = 11'b00010110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 287, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10100101100; b = 11'b01100011010; bin = 1'b1; // Expected: {'diff': 529, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10100101100; b = 11'b01100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 529, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011011111; b = 11'b01100100001; bin = 1'b0; // Expected: {'diff': 1982, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011011111; b = 11'b01100100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1982, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010001110; b = 11'b01000100100; bin = 1'b1; // Expected: {'diff': 1129, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010001110; b = 11'b01000100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1129, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110000101; b = 11'b10010000001; bin = 1'b1; // Expected: {'diff': 1283, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110000101; b = 11'b10010000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1283, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010100100; b = 11'b01110010011; bin = 1'b1; // Expected: {'diff': 272, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010100100; b = 11'b01110010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 272, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000111000; b = 11'b10111101111; bin = 1'b0; // Expected: {'diff': 73, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000111000; b = 11'b10111101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 73, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011110100; b = 11'b00111010011; bin = 1'b0; // Expected: {'diff': 289, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011110100; b = 11'b00111010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 289, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111100100; b = 11'b01000000100; bin = 1'b0; // Expected: {'diff': 480, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111100100; b = 11'b01000000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 480, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000111100; b = 11'b01101101101; bin = 1'b0; // Expected: {'diff': 1743, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000111100; b = 11'b01101101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1743, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10111101101; b = 11'b00011100001; bin = 1'b0; // Expected: {'diff': 1292, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10111101101; b = 11'b00011100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1292, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011001111; b = 11'b01000010110; bin = 1'b1; // Expected: {'diff': 1720, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011001111; b = 11'b01000010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1720, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00011001101; b = 11'b10001001011; bin = 1'b1; // Expected: {'diff': 1153, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00011001101; b = 11'b10001001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1153, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111101110; b = 11'b00000111101; bin = 1'b0; // Expected: {'diff': 945, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111101110; b = 11'b00000111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 945, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011000101; b = 11'b10110100001; bin = 1'b0; // Expected: {'diff': 1828, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011000101; b = 11'b10110100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1828, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110110000; b = 11'b01011101100; bin = 1'b1; // Expected: {'diff': 707, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110110000; b = 11'b01011101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 707, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110101111; b = 11'b10110001110; bin = 1'b0; // Expected: {'diff': 545, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110101111; b = 11'b10110001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 545, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011010010; b = 11'b10011111010; bin = 1'b0; // Expected: {'diff': 472, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011010010; b = 11'b10011111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 472, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011010011; b = 11'b00100001100; bin = 1'b0; // Expected: {'diff': 1479, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011010011; b = 11'b00100001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1479, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00110100101; b = 11'b00110010001; bin = 1'b0; // Expected: {'diff': 20, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00110100101; b = 11'b00110010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000100010; b = 11'b10110101011; bin = 1'b1; // Expected: {'diff': 1142, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000100010; b = 11'b10110101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1142, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00100011011; b = 11'b11101011000; bin = 1'b1; // Expected: {'diff': 450, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00100011011; b = 11'b11101011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 450, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100111110; b = 11'b10101111101; bin = 1'b0; // Expected: {'diff': 449, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100111110; b = 11'b10101111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 449, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100011011; b = 11'b11001101110; bin = 1'b0; // Expected: {'diff': 1197, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100011011; b = 11'b11001101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1197, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110000111; b = 11'b11011010000; bin = 1'b1; // Expected: {'diff': 1718, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110000111; b = 11'b11011010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1718, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000110000; b = 11'b01010101001; bin = 1'b1; // Expected: {'diff': 1414, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000110000; b = 11'b01010101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1414, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01110111001; b = 11'b11100101000; bin = 1'b1; // Expected: {'diff': 1168, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01110111001; b = 11'b11100101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1168, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101011101; b = 11'b01101011101; bin = 1'b0; // Expected: {'diff': 1024, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101011101; b = 11'b01101011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1024, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101100000; b = 11'b11101101101; bin = 1'b0; // Expected: {'diff': 2035, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101100000; b = 11'b11101101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2035, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110001100; b = 11'b11101001000; bin = 1'b0; // Expected: {'diff': 1604, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110001100; b = 11'b11101001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1604, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000100111; b = 11'b11010111110; bin = 1'b1; // Expected: {'diff': 360, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000100111; b = 11'b11010111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 360, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10011100001; b = 11'b11111011111; bin = 1'b1; // Expected: {'diff': 1281, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10011100001; b = 11'b11111011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1281, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100101001; b = 11'b01001001100; bin = 1'b1; // Expected: {'diff': 1244, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100101001; b = 11'b01001001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1244, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101010101; b = 11'b01111011111; bin = 1'b0; // Expected: {'diff': 1910, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101010101; b = 11'b01111011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1910, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110101000; b = 11'b00001101001; bin = 1'b1; // Expected: {'diff': 1854, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110101000; b = 11'b00001101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1854, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110110111; b = 11'b11001001110; bin = 1'b0; // Expected: {'diff': 1897, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110110111; b = 11'b11001001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1897, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001010000; b = 11'b01100100000; bin = 1'b0; // Expected: {'diff': 304, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001010000; b = 11'b01100100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 304, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111001001; b = 11'b11110011010; bin = 1'b1; // Expected: {'diff': 558, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111001001; b = 11'b11110011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 558, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011110100; b = 11'b01110100011; bin = 1'b0; // Expected: {'diff': 849, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011110100; b = 11'b01110100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 849, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011001011; b = 11'b00111001110; bin = 1'b0; // Expected: {'diff': 253, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011001011; b = 11'b00111001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 253, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001010001; b = 11'b10110100010; bin = 1'b0; // Expected: {'diff': 175, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001010001; b = 11'b10110100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 175, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000111001; b = 11'b11111100101; bin = 1'b0; // Expected: {'diff': 596, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000111001; b = 11'b11111100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 596, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010111100; b = 11'b00010011100; bin = 1'b0; // Expected: {'diff': 1056, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010111100; b = 11'b00010011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1056, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101011110; b = 11'b01101110000; bin = 1'b1; // Expected: {'diff': 1005, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101011110; b = 11'b01101110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1005, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10001111100; b = 11'b00111011011; bin = 1'b0; // Expected: {'diff': 673, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10001111100; b = 11'b00111011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 673, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11001000111; b = 11'b11110010111; bin = 1'b0; // Expected: {'diff': 1712, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11001000111; b = 11'b11110010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1712, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11011010011; b = 11'b01110001101; bin = 1'b0; // Expected: {'diff': 838, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11011010011; b = 11'b01110001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 838, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11100100110; b = 11'b10100101111; bin = 1'b0; // Expected: {'diff': 503, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11100100110; b = 11'b10100101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 503, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000011110; b = 11'b11000111100; bin = 1'b0; // Expected: {'diff': 1506, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000011110; b = 11'b11000111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1506, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11111101010; b = 11'b11000001010; bin = 1'b0; // Expected: {'diff': 480, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b11111101010; b = 11'b11000001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 480, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
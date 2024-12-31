
`timescale 1ns / 1ps

module tb_N14_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 14;
    
     
    // Inputs
    
    reg  [13:0] a;
    
    reg  [13:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [13:0] diff;
    
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
        
        a = 14'b11000000001100; b = 14'b00100000110000; bin = 1'b0; // Expected: {'diff': 10204, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000000001100; b = 14'b00100000110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10204, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010110101100; b = 14'b00110011111010; bin = 1'b1; // Expected: {'diff': 10417, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010110101100; b = 14'b00110011111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10417, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001110111001; b = 14'b10110010010110; bin = 1'b1; // Expected: {'diff': 10018, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001110111001; b = 14'b10110010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10018, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101010110000; b = 14'b10110101111000; bin = 1'b0; // Expected: {'diff': 11576, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101010110000; b = 14'b10110101111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11576, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100101011011; b = 14'b01100011000001; bin = 1'b0; // Expected: {'diff': 12442, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100101011011; b = 14'b01100011000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12442, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001111110110; b = 14'b10101100111100; bin = 1'b0; // Expected: {'diff': 14522, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001111110110; b = 14'b10101100111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14522, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001110000110; b = 14'b00111011011011; bin = 1'b1; // Expected: {'diff': 1194, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001110000110; b = 14'b00111011011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1194, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000001001000; b = 14'b11000001101100; bin = 1'b1; // Expected: {'diff': 12251, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000001001000; b = 14'b11000001101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12251, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110100011000; b = 14'b01000001001100; bin = 1'b0; // Expected: {'diff': 3276, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110100011000; b = 14'b01000001001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3276, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100110101010; b = 14'b10111010001001; bin = 1'b0; // Expected: {'diff': 6945, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100110101010; b = 14'b10111010001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6945, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101010101110; b = 14'b00011111110011; bin = 1'b1; // Expected: {'diff': 4794, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101010101110; b = 14'b00011111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4794, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100010001101; b = 14'b00110000100000; bin = 1'b1; // Expected: {'diff': 15468, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100010001101; b = 14'b00110000100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15468, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001101100000; b = 14'b11001011100010; bin = 1'b0; // Expected: {'diff': 8318, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001101100000; b = 14'b11001011100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8318, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111001101110; b = 14'b00111100000010; bin = 1'b0; // Expected: {'diff': 8044, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111001101110; b = 14'b00111100000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8044, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010101111001; b = 14'b01001010001011; bin = 1'b0; // Expected: {'diff': 8942, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010101111001; b = 14'b01001010001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8942, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110011010011; b = 14'b01100000000100; bin = 1'b0; // Expected: {'diff': 1231, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110011010011; b = 14'b01100000000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1231, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000100111111; b = 14'b01001011110001; bin = 1'b0; // Expected: {'diff': 15950, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000100111111; b = 14'b01001011110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15950, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111010010001; b = 14'b11101100001001; bin = 1'b1; // Expected: {'diff': 13191, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111010010001; b = 14'b11101100001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13191, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001000101010; b = 14'b01011001001100; bin = 1'b1; // Expected: {'diff': 15325, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001000101010; b = 14'b01011001001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15325, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011100101010; b = 14'b01000001011010; bin = 1'b0; // Expected: {'diff': 1744, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011100101010; b = 14'b01000001011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1744, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001000101000; b = 14'b01110010010010; bin = 1'b1; // Expected: {'diff': 1429, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001000101000; b = 14'b01110010010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1429, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110011110001; b = 14'b11110000110011; bin = 1'b0; // Expected: {'diff': 8382, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110011110001; b = 14'b11110000110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8382, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011011111101; b = 14'b01010111101100; bin = 1'b1; // Expected: {'diff': 272, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011011111101; b = 14'b01010111101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 272, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100110011001; b = 14'b00101111111111; bin = 1'b0; // Expected: {'diff': 11674, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100110011001; b = 14'b00101111111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11674, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000011100010; b = 14'b10111000001011; bin = 1'b0; // Expected: {'diff': 8919, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000011100010; b = 14'b10111000001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8919, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000111000000; b = 14'b01111100101010; bin = 1'b1; // Expected: {'diff': 12949, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000111000000; b = 14'b01111100101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12949, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000001111101; b = 14'b11110110110000; bin = 1'b0; // Expected: {'diff': 717, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000001111101; b = 14'b11110110110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 717, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000110100110; b = 14'b00100111100010; bin = 1'b0; // Expected: {'diff': 10180, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000110100110; b = 14'b00100111100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10180, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001010111110; b = 14'b01110001110010; bin = 1'b0; // Expected: {'diff': 9804, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001010111110; b = 14'b01110001110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9804, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010000010111; b = 14'b11100111011110; bin = 1'b0; // Expected: {'diff': 10809, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010000010111; b = 14'b11100111011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10809, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010100100011; b = 14'b10101111100110; bin = 1'b1; // Expected: {'diff': 14652, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010100100011; b = 14'b10101111100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14652, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010100101100; b = 14'b01101111010101; bin = 1'b1; // Expected: {'diff': 10582, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010100101100; b = 14'b01101111010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10582, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011010110011; b = 14'b10110110110110; bin = 1'b1; // Expected: {'diff': 10492, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011010110011; b = 14'b10110110110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10492, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011101101011; b = 14'b00100001111111; bin = 1'b1; // Expected: {'diff': 16107, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011101101011; b = 14'b00100001111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16107, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101001100110; b = 14'b10010101111111; bin = 1'b1; // Expected: {'diff': 9446, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101001100110; b = 14'b10010101111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9446, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100100101011; b = 14'b00101100011000; bin = 1'b1; // Expected: {'diff': 15890, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100100101011; b = 14'b00101100011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15890, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100001010111; b = 14'b10101000011100; bin = 1'b0; // Expected: {'diff': 15931, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100001010111; b = 14'b10101000011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15931, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011001110110; b = 14'b01111011111111; bin = 1'b0; // Expected: {'diff': 6007, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011001110110; b = 14'b01111011111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6007, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100110011110; b = 14'b01111001101111; bin = 1'b0; // Expected: {'diff': 15151, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100110011110; b = 14'b01111001101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15151, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100011101010; b = 14'b11001000110111; bin = 1'b0; // Expected: {'diff': 9907, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100011101010; b = 14'b11001000110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9907, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111110000110; b = 14'b00011111101000; bin = 1'b1; // Expected: {'diff': 6045, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111110000110; b = 14'b00011111101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6045, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111100010100; b = 14'b00110010100101; bin = 1'b1; // Expected: {'diff': 8814, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111100010100; b = 14'b00110010100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8814, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100100000000; b = 14'b11001111001111; bin = 1'b1; // Expected: {'diff': 1328, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100100000000; b = 14'b11001111001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1328, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111010000101; b = 14'b10111001110110; bin = 1'b0; // Expected: {'diff': 4111, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111010000101; b = 14'b10111001110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4111, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101111111111; b = 14'b01100111001011; bin = 1'b0; // Expected: {'diff': 564, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101111111111; b = 14'b01100111001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 564, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100101011000; b = 14'b10111001101000; bin = 1'b1; // Expected: {'diff': 10991, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100101011000; b = 14'b10111001101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10991, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110010001001; b = 14'b11000100111100; bin = 1'b0; // Expected: {'diff': 11085, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110010001001; b = 14'b11000100111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11085, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001101001110; b = 14'b10100011111100; bin = 1'b1; // Expected: {'diff': 2641, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001101001110; b = 14'b10100011111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2641, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111011001000; b = 14'b01100110111101; bin = 1'b0; // Expected: {'diff': 1291, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111011001000; b = 14'b01100110111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1291, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110100111001; b = 14'b11000000010111; bin = 1'b1; // Expected: {'diff': 11553, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110100111001; b = 14'b11000000010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11553, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010110001101; b = 14'b01011110110111; bin = 1'b1; // Expected: {'diff': 15829, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010110001101; b = 14'b01011110110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15829, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010111010100; b = 14'b00101010111011; bin = 1'b1; // Expected: {'diff': 6936, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010111010100; b = 14'b00101010111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6936, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010000001101; b = 14'b10011101000111; bin = 1'b1; // Expected: {'diff': 7365, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010000001101; b = 14'b10011101000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7365, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111101100000; b = 14'b11000110010011; bin = 1'b0; // Expected: {'diff': 3533, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111101100000; b = 14'b11000110010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3533, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001101000011; b = 14'b11000011110011; bin = 1'b1; // Expected: {'diff': 8783, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001101000011; b = 14'b11000011110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8783, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000001001101; b = 14'b01000010000011; bin = 1'b0; // Expected: {'diff': 4042, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000001001101; b = 14'b01000010000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4042, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100100100100; b = 14'b10101011100011; bin = 1'b1; // Expected: {'diff': 7744, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100100100100; b = 14'b10101011100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7744, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111010111001; b = 14'b11000111101001; bin = 1'b0; // Expected: {'diff': 3280, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111010111001; b = 14'b11000111101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3280, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011111010101; b = 14'b10111010101101; bin = 1'b0; // Expected: {'diff': 14632, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011111010101; b = 14'b10111010101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14632, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101001110111; b = 14'b11000111010010; bin = 1'b1; // Expected: {'diff': 10404, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101001110111; b = 14'b11000111010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10404, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000011010010; b = 14'b01110110110111; bin = 1'b0; // Expected: {'diff': 13083, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000011010010; b = 14'b01110110110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13083, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010111011000; b = 14'b11000101011101; bin = 1'b0; // Expected: {'diff': 1147, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010111011000; b = 14'b11000101011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1147, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001110000101; b = 14'b11000010101110; bin = 1'b0; // Expected: {'diff': 727, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001110000101; b = 14'b11000010101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 727, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001000111101; b = 14'b11011011110010; bin = 1'b1; // Expected: {'diff': 15178, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001000111101; b = 14'b11011011110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15178, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110110100110; b = 14'b11100000100000; bin = 1'b0; // Expected: {'diff': 1414, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110110100110; b = 14'b11100000100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1414, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110111001010; b = 14'b11001011101010; bin = 1'b0; // Expected: {'diff': 10976, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110111001010; b = 14'b11001011101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10976, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010110011000; b = 14'b11100010011101; bin = 1'b0; // Expected: {'diff': 7419, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010110011000; b = 14'b11100010011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7419, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011101111011; b = 14'b10000010101010; bin = 1'b1; // Expected: {'diff': 14032, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011101111011; b = 14'b10000010101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14032, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111010101010; b = 14'b01011111101110; bin = 1'b1; // Expected: {'diff': 14011, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111010101010; b = 14'b01011111101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14011, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010111111010; b = 14'b01000010111101; bin = 1'b1; // Expected: {'diff': 13628, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010111111010; b = 14'b01000010111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13628, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011110101100; b = 14'b10010101011100; bin = 1'b1; // Expected: {'diff': 4687, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011110101100; b = 14'b10010101011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4687, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110011001101; b = 14'b11011100111010; bin = 1'b0; // Expected: {'diff': 9619, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110011001101; b = 14'b11011100111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9619, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101011010111; b = 14'b01011100101101; bin = 1'b1; // Expected: {'diff': 9129, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101011010111; b = 14'b01011100101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9129, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010000001011; b = 14'b10001000111011; bin = 1'b0; // Expected: {'diff': 8656, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010000001011; b = 14'b10001000111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8656, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110101010101; b = 14'b10000011000100; bin = 1'b0; // Expected: {'diff': 11409, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110101010101; b = 14'b10000011000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11409, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001101101001; b = 14'b00100100000100; bin = 1'b0; // Expected: {'diff': 10853, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001101101001; b = 14'b00100100000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10853, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010001110100; b = 14'b00011000110000; bin = 1'b1; // Expected: {'diff': 11843, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010001110100; b = 14'b00011000110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11843, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010100010101; b = 14'b10000101001111; bin = 1'b1; // Expected: {'diff': 13253, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010100010101; b = 14'b10000101001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13253, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001001111101; b = 14'b11111000110101; bin = 1'b0; // Expected: {'diff': 5192, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001001111101; b = 14'b11111000110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5192, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110011010101; b = 14'b11001001110101; bin = 1'b0; // Expected: {'diff': 14944, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110011010101; b = 14'b11001001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14944, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101100110110; b = 14'b00011111001010; bin = 1'b0; // Expected: {'diff': 876, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101100110110; b = 14'b00011111001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 876, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111111010110; b = 14'b11011101000101; bin = 1'b0; // Expected: {'diff': 6289, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111111010110; b = 14'b11011101000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6289, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001010100010; b = 14'b01011011101110; bin = 1'b0; // Expected: {'diff': 11188, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001010100010; b = 14'b01011011101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11188, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001011101111; b = 14'b01101001011111; bin = 1'b1; // Expected: {'diff': 10383, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001011101111; b = 14'b01101001011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10383, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101100100110; b = 14'b10011001101101; bin = 1'b0; // Expected: {'diff': 9401, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101100100110; b = 14'b10011001101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9401, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010101100011; b = 14'b10101100110011; bin = 1'b1; // Expected: {'diff': 2607, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010101100011; b = 14'b10101100110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2607, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010111011101; b = 14'b11110111100111; bin = 1'b0; // Expected: {'diff': 14326, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010111011101; b = 14'b11110111100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14326, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010000011110; b = 14'b00000100111101; bin = 1'b0; // Expected: {'diff': 737, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010000011110; b = 14'b00000100111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 737, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100010010000; b = 14'b00010101100111; bin = 1'b0; // Expected: {'diff': 4905, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100010010000; b = 14'b00010101100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4905, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011010110000; b = 14'b10101111001010; bin = 1'b0; // Expected: {'diff': 15078, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011010110000; b = 14'b10101111001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15078, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000101101000; b = 14'b01111101100001; bin = 1'b1; // Expected: {'diff': 518, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000101101000; b = 14'b01111101100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 518, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010110010001; b = 14'b10001000001011; bin = 1'b1; // Expected: {'diff': 13189, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010110010001; b = 14'b10001000001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13189, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110001010011; b = 14'b00111111111011; bin = 1'b1; // Expected: {'diff': 3159, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110001010011; b = 14'b00111111111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3159, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010111011100; b = 14'b10101011011010; bin = 1'b0; // Expected: {'diff': 6914, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010111011100; b = 14'b10101011011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6914, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101110000111; b = 14'b11011110111111; bin = 1'b1; // Expected: {'diff': 9159, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101110000111; b = 14'b11011110111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9159, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011111001101; b = 14'b10101111010101; bin = 1'b1; // Expected: {'diff': 11255, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011111001101; b = 14'b10101111010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11255, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000100010001; b = 14'b10101000101111; bin = 1'b1; // Expected: {'diff': 5857, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000100010001; b = 14'b10101000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5857, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101110001001; b = 14'b01111110110001; bin = 1'b0; // Expected: {'diff': 7128, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101110001001; b = 14'b01111110110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7128, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011000101110; b = 14'b00101000110000; bin = 1'b0; // Expected: {'diff': 11262, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011000101110; b = 14'b00101000110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11262, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101000100110; b = 14'b11010001101111; bin = 1'b0; // Expected: {'diff': 1463, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101000100110; b = 14'b11010001101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1463, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011010010011; b = 14'b10101111111010; bin = 1'b1; // Expected: {'diff': 2712, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011010010011; b = 14'b10101111111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2712, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111000100011; b = 14'b01010010010001; bin = 1'b0; // Expected: {'diff': 2450, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111000100011; b = 14'b01010010010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2450, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110000011000; b = 14'b11011010111010; bin = 1'b0; // Expected: {'diff': 5470, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110000011000; b = 14'b11011010111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5470, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100001111101; b = 14'b01101000000011; bin = 1'b1; // Expected: {'diff': 7801, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100001111101; b = 14'b01101000000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7801, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011111100111; b = 14'b00001001011101; bin = 1'b0; // Expected: {'diff': 13706, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011111100111; b = 14'b00001001011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13706, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010010100000; b = 14'b11101001100011; bin = 1'b0; // Expected: {'diff': 6717, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010010100000; b = 14'b11101001100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6717, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111111000000; b = 14'b01000000111011; bin = 1'b0; // Expected: {'diff': 12165, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111111000000; b = 14'b01000000111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12165, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011001010001; b = 14'b00000000011101; bin = 1'b1; // Expected: {'diff': 13875, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011001010001; b = 14'b00000000011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13875, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100110110001; b = 14'b00100110001111; bin = 1'b0; // Expected: {'diff': 34, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100110110001; b = 14'b00100110001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001101110001; b = 14'b00000111111000; bin = 1'b1; // Expected: {'diff': 4472, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001101110001; b = 14'b00000111111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4472, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100011111101; b = 14'b10110011110011; bin = 1'b0; // Expected: {'diff': 3082, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100011111101; b = 14'b10110011110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3082, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110000010110; b = 14'b10100110111100; bin = 1'b1; // Expected: {'diff': 8793, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110000010110; b = 14'b10100110111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8793, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100111011000; b = 14'b11010101100110; bin = 1'b0; // Expected: {'diff': 1138, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100111011000; b = 14'b11010101100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1138, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010001001011; b = 14'b10010100000110; bin = 1'b0; // Expected: {'diff': 8005, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010001001011; b = 14'b10010100000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8005, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010101011101; b = 14'b11001100000001; bin = 1'b1; // Expected: {'diff': 12891, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010101011101; b = 14'b11001100000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12891, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001011100111; b = 14'b00001111011100; bin = 1'b1; // Expected: {'diff': 12042, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001011100111; b = 14'b00001111011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12042, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011001000011; b = 14'b10101011101010; bin = 1'b1; // Expected: {'diff': 15192, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011001000011; b = 14'b10101011101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15192, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111110011010; b = 14'b11000010101011; bin = 1'b1; // Expected: {'diff': 16110, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111110011010; b = 14'b11000010101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16110, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011010000011; b = 14'b00111101010011; bin = 1'b0; // Expected: {'diff': 14128, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011010000011; b = 14'b00111101010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14128, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011001100010; b = 14'b10011010010100; bin = 1'b0; // Expected: {'diff': 12238, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011001100010; b = 14'b10011010010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12238, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101101111001; b = 14'b11001110000101; bin = 1'b1; // Expected: {'diff': 6131, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101101111001; b = 14'b11001110000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6131, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001011101111; b = 14'b10111001010110; bin = 1'b0; // Expected: {'diff': 1177, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001011101111; b = 14'b10111001010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1177, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011101001000; b = 14'b01010010100011; bin = 1'b1; // Expected: {'diff': 12964, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011101001000; b = 14'b01010010100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12964, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101100011011; b = 14'b00100000001110; bin = 1'b0; // Expected: {'diff': 13069, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101100011011; b = 14'b00100000001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13069, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000100010010; b = 14'b01010001001101; bin = 1'b1; // Expected: {'diff': 11460, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000100010010; b = 14'b01010001001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11460, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001011011010; b = 14'b01111110010000; bin = 1'b1; // Expected: {'diff': 4937, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001011011010; b = 14'b01111110010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4937, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000110001010; b = 14'b10010111001000; bin = 1'b0; // Expected: {'diff': 15298, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000110001010; b = 14'b10010111001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15298, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010001010111; b = 14'b11000111100110; bin = 1'b0; // Expected: {'diff': 625, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010001010111; b = 14'b11000111100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 625, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011100011101; b = 14'b00101100101100; bin = 1'b1; // Expected: {'diff': 7152, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011100011101; b = 14'b00101100101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7152, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001111110111; b = 14'b00100000111001; bin = 1'b0; // Expected: {'diff': 15294, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001111110111; b = 14'b00100000111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15294, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110100100110; b = 14'b01010010010110; bin = 1'b1; // Expected: {'diff': 6287, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110100100110; b = 14'b01010010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6287, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001010111011; b = 14'b00001111011011; bin = 1'b1; // Expected: {'diff': 16095, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001010111011; b = 14'b00001111011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16095, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111101111100; b = 14'b11010001111000; bin = 1'b0; // Expected: {'diff': 6916, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111101111100; b = 14'b11010001111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6916, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101000011100; b = 14'b10101100011100; bin = 1'b1; // Expected: {'diff': 7935, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101000011100; b = 14'b10101100011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7935, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000100100001; b = 14'b11010001000011; bin = 1'b1; // Expected: {'diff': 11485, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000100100001; b = 14'b11010001000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11485, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011001111111; b = 14'b10111100100110; bin = 1'b1; // Expected: {'diff': 1880, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011001111111; b = 14'b10111100100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1880, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100001100111; b = 14'b11010111110111; bin = 1'b0; // Expected: {'diff': 4720, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100001100111; b = 14'b11010111110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4720, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100001000101; b = 14'b11110101111010; bin = 1'b1; // Expected: {'diff': 10954, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100001000101; b = 14'b11110101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10954, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100111010000; b = 14'b00000100110100; bin = 1'b1; // Expected: {'diff': 2203, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100111010000; b = 14'b00000100110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2203, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001110001000; b = 14'b10110111110101; bin = 1'b1; // Expected: {'diff': 13714, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001110001000; b = 14'b10110111110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13714, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101010110101; b = 14'b01011111001001; bin = 1'b0; // Expected: {'diff': 4844, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101010110101; b = 14'b01011111001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4844, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100001100001; b = 14'b11000100000011; bin = 1'b1; // Expected: {'diff': 1885, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100001100001; b = 14'b11000100000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1885, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011111010010; b = 14'b00010110011101; bin = 1'b0; // Expected: {'diff': 565, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011111010010; b = 14'b00010110011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 565, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001001101000; b = 14'b01001100000111; bin = 1'b1; // Expected: {'diff': 16224, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001001101000; b = 14'b01001100000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16224, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111100100010; b = 14'b01111110110011; bin = 1'b1; // Expected: {'diff': 3950, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111100100010; b = 14'b01111110110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3950, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100011100001; b = 14'b10011100100100; bin = 1'b1; // Expected: {'diff': 444, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100011100001; b = 14'b10011100100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 444, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011101101000; b = 14'b00010111100001; bin = 1'b0; // Expected: {'diff': 391, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011101101000; b = 14'b00010111100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 391, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101010000100; b = 14'b00000001001001; bin = 1'b0; // Expected: {'diff': 6715, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101010000100; b = 14'b00000001001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6715, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001110000000; b = 14'b00001001100111; bin = 1'b0; // Expected: {'diff': 4377, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001110000000; b = 14'b00001001100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4377, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011000101011; b = 14'b11011110100100; bin = 1'b0; // Expected: {'diff': 3719, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011000101011; b = 14'b11011110100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3719, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000011001110; b = 14'b01010100101001; bin = 1'b1; // Expected: {'diff': 2980, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000011001110; b = 14'b01010100101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2980, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110101111100; b = 14'b10111011000000; bin = 1'b0; // Expected: {'diff': 11964, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110101111100; b = 14'b10111011000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11964, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100001011100; b = 14'b01111100110101; bin = 1'b1; // Expected: {'diff': 6438, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100001011100; b = 14'b01111100110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6438, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110000110110; b = 14'b10111111001011; bin = 1'b0; // Expected: {'diff': 11371, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110000110110; b = 14'b10111111001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11371, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010011000001; b = 14'b01111010111001; bin = 1'b1; // Expected: {'diff': 9735, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010011000001; b = 14'b01111010111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9735, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000101001100; b = 14'b00000111110010; bin = 1'b0; // Expected: {'diff': 8026, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000101001100; b = 14'b00000111110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8026, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100101110001; b = 14'b01000111101111; bin = 1'b1; // Expected: {'diff': 1921, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100101110001; b = 14'b01000111101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1921, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010001000111; b = 14'b10010011000100; bin = 1'b0; // Expected: {'diff': 8067, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010001000111; b = 14'b10010011000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8067, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101101011011; b = 14'b01111110001011; bin = 1'b1; // Expected: {'diff': 11215, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101101011011; b = 14'b01111110001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11215, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010101110111; b = 14'b10100001101001; bin = 1'b1; // Expected: {'diff': 15629, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010101110111; b = 14'b10100001101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15629, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110011001001; b = 14'b01111000000100; bin = 1'b1; // Expected: {'diff': 3780, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110011001001; b = 14'b01111000000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3780, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101100011101; b = 14'b01110100100001; bin = 1'b1; // Expected: {'diff': 15867, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101100011101; b = 14'b01110100100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15867, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011011101110; b = 14'b11111000001101; bin = 1'b0; // Expected: {'diff': 2273, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011011101110; b = 14'b11111000001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2273, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100000010111; b = 14'b00111010111101; bin = 1'b1; // Expected: {'diff': 6489, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100000010111; b = 14'b00111010111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6489, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100000001001; b = 14'b01100011100110; bin = 1'b0; // Expected: {'diff': 12067, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100000001001; b = 14'b01100011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12067, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100111111011; b = 14'b00000111110100; bin = 1'b1; // Expected: {'diff': 6150, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100111111011; b = 14'b00000111110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6150, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000100101001; b = 14'b10100100010010; bin = 1'b1; // Expected: {'diff': 2070, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000100101001; b = 14'b10100100010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2070, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100111101110; b = 14'b11111110010111; bin = 1'b0; // Expected: {'diff': 6743, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100111101110; b = 14'b11111110010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6743, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100110111011; b = 14'b01000110000011; bin = 1'b1; // Expected: {'diff': 10295, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100110111011; b = 14'b01000110000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10295, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001111100111; b = 14'b01100101010101; bin = 1'b0; // Expected: {'diff': 14994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001111100111; b = 14'b01100101010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110001000110; b = 14'b11100010010010; bin = 1'b0; // Expected: {'diff': 9140, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110001000110; b = 14'b11100010010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9140, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101100010011; b = 14'b11100010100110; bin = 1'b1; // Expected: {'diff': 620, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101100010011; b = 14'b11100010100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 620, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100010101110; b = 14'b00011000101011; bin = 1'b0; // Expected: {'diff': 643, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100010101110; b = 14'b00011000101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 643, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101010010000; b = 14'b10111110101100; bin = 1'b0; // Expected: {'diff': 6884, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101010010000; b = 14'b10111110101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6884, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101000001110; b = 14'b00101001100000; bin = 1'b0; // Expected: {'diff': 16302, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101000001110; b = 14'b00101001100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16302, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001000000100; b = 14'b11100001001000; bin = 1'b0; // Expected: {'diff': 14780, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001000000100; b = 14'b11100001001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14780, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110001000100; b = 14'b00100110011111; bin = 1'b1; // Expected: {'diff': 12964, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110001000100; b = 14'b00100110011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12964, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001011000111; b = 14'b01000000011001; bin = 1'b1; // Expected: {'diff': 685, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001011000111; b = 14'b01000000011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 685, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101100100001; b = 14'b11110111001111; bin = 1'b0; // Expected: {'diff': 15698, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101100100001; b = 14'b11110111001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15698, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001000001010; b = 14'b00011111111010; bin = 1'b0; // Expected: {'diff': 6672, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001000001010; b = 14'b00011111111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6672, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010110111000; b = 14'b10001000111100; bin = 1'b0; // Expected: {'diff': 9084, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010110111000; b = 14'b10001000111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9084, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100010110010; b = 14'b11100001110100; bin = 1'b1; // Expected: {'diff': 8253, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100010110010; b = 14'b11100001110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8253, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010000101001; b = 14'b11001100111101; bin = 1'b0; // Expected: {'diff': 236, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010000101001; b = 14'b11001100111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 236, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100101101101; b = 14'b11101010101111; bin = 1'b0; // Expected: {'diff': 3774, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100101101101; b = 14'b11101010101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3774, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110010001001; b = 14'b10100001101100; bin = 1'b1; // Expected: {'diff': 9244, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110010001001; b = 14'b10100001101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9244, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100110000110; b = 14'b10001000010110; bin = 1'b0; // Expected: {'diff': 1904, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100110000110; b = 14'b10001000010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1904, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011001100011; b = 14'b01011101100010; bin = 1'b0; // Expected: {'diff': 3841, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011001100011; b = 14'b01011101100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3841, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110111101000; b = 14'b11001111000000; bin = 1'b0; // Expected: {'diff': 6696, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110111101000; b = 14'b11001111000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6696, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001010111110; b = 14'b01111000111000; bin = 1'b1; // Expected: {'diff': 5253, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001010111110; b = 14'b01111000111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5253, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010011011111; b = 14'b01000011111011; bin = 1'b1; // Expected: {'diff': 5091, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010011011111; b = 14'b01000011111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5091, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110101100101; b = 14'b01110000001101; bin = 1'b0; // Expected: {'diff': 344, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110101100101; b = 14'b01110000001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 344, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110111000111; b = 14'b11010011010011; bin = 1'b0; // Expected: {'diff': 10484, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110111000111; b = 14'b11010011010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10484, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111011101111; b = 14'b10111100000010; bin = 1'b1; // Expected: {'diff': 8172, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111011101111; b = 14'b10111100000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8172, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110110101011; b = 14'b11001111001110; bin = 1'b1; // Expected: {'diff': 10716, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110110101011; b = 14'b11001111001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10716, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000000110010; b = 14'b10010010111100; bin = 1'b0; // Expected: {'diff': 7030, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000000110010; b = 14'b10010010111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7030, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001110011001; b = 14'b10001100011111; bin = 1'b1; // Expected: {'diff': 12409, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001110011001; b = 14'b10001100011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12409, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100000000011; b = 14'b11111010010100; bin = 1'b1; // Expected: {'diff': 14702, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100000000011; b = 14'b11111010010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14702, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001100001101; b = 14'b11110010000000; bin = 1'b0; // Expected: {'diff': 5773, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001100001101; b = 14'b11110010000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5773, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101001000100; b = 14'b01110110000100; bin = 1'b1; // Expected: {'diff': 7359, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101001000100; b = 14'b01110110000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7359, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000100010010; b = 14'b10011101011000; bin = 1'b0; // Expected: {'diff': 14778, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000100010010; b = 14'b10011101011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14778, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101101000111; b = 14'b11001100100100; bin = 1'b0; // Expected: {'diff': 14371, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101101000111; b = 14'b11001100100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14371, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010010110011; b = 14'b10000001000111; bin = 1'b1; // Expected: {'diff': 13419, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010010110011; b = 14'b10000001000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13419, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000100110110; b = 14'b11001000101011; bin = 1'b0; // Expected: {'diff': 12043, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000100110110; b = 14'b11001000101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12043, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001011100111; b = 14'b11100100101011; bin = 1'b1; // Expected: {'diff': 14779, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001011100111; b = 14'b11100100101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14779, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000101000111; b = 14'b01101011011100; bin = 1'b0; // Expected: {'diff': 13931, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000101000111; b = 14'b01101011011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13931, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100101100001; b = 14'b00101010101101; bin = 1'b0; // Expected: {'diff': 16052, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100101100001; b = 14'b00101010101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16052, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100100001110; b = 14'b01100000010011; bin = 1'b0; // Expected: {'diff': 12539, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100100001110; b = 14'b01100000010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12539, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010001000000; b = 14'b10111001110111; bin = 1'b0; // Expected: {'diff': 1481, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010001000000; b = 14'b10111001110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1481, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110011111101; b = 14'b01100111000101; bin = 1'b0; // Expected: {'diff': 9016, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110011111101; b = 14'b01100111000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9016, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010001110101; b = 14'b11011111010111; bin = 1'b0; // Expected: {'diff': 3230, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010001110101; b = 14'b11011111010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3230, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100010111001; b = 14'b00010110001001; bin = 1'b0; // Expected: {'diff': 13104, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100010111001; b = 14'b00010110001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13104, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000100111100; b = 14'b00001001001110; bin = 1'b0; // Expected: {'diff': 16110, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000100111100; b = 14'b00001001001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16110, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100000111111; b = 14'b01011111101011; bin = 1'b0; // Expected: {'diff': 84, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100000111111; b = 14'b01011111101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001101001011; b = 14'b00101011101101; bin = 1'b1; // Expected: {'diff': 2141, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001101001011; b = 14'b00101011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2141, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110110110100; b = 14'b11010101001001; bin = 1'b0; // Expected: {'diff': 10347, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110110110100; b = 14'b11010101001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10347, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000011110110; b = 14'b11100000100100; bin = 1'b1; // Expected: {'diff': 2257, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000011110110; b = 14'b11100000100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2257, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101110011110; b = 14'b10010001101001; bin = 1'b0; // Expected: {'diff': 1845, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101110011110; b = 14'b10010001101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1845, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011111010101; b = 14'b10111001110010; bin = 1'b1; // Expected: {'diff': 14690, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011111010101; b = 14'b10111001110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14690, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100001000110; b = 14'b10010110011101; bin = 1'b0; // Expected: {'diff': 681, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100001000110; b = 14'b10010110011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 681, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111011001010; b = 14'b00001111110110; bin = 1'b0; // Expected: {'diff': 2772, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111011001010; b = 14'b00001111110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2772, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100100011100; b = 14'b11011001001110; bin = 1'b1; // Expected: {'diff': 717, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100100011100; b = 14'b11011001001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 717, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011011010100; b = 14'b01010101101010; bin = 1'b0; // Expected: {'diff': 12650, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011011010100; b = 14'b01010101101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12650, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110101101100; b = 14'b11110110111011; bin = 1'b1; // Expected: {'diff': 12208, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110101101100; b = 14'b11110110111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12208, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100110100110; b = 14'b00111101010001; bin = 1'b1; // Expected: {'diff': 6740, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100110100110; b = 14'b00111101010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6740, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110000110001; b = 14'b11010001111101; bin = 1'b0; // Expected: {'diff': 1972, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110000110001; b = 14'b11010001111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1972, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100100100010; b = 14'b01100000011000; bin = 1'b0; // Expected: {'diff': 8458, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100100100010; b = 14'b01100000011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8458, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011000001101; b = 14'b01011011101101; bin = 1'b0; // Expected: {'diff': 16160, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011000001101; b = 14'b01011011101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16160, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110111011000; b = 14'b01100111011010; bin = 1'b0; // Expected: {'diff': 1022, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110111011000; b = 14'b01100111011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1022, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010110101110; b = 14'b01100010011000; bin = 1'b1; // Expected: {'diff': 3349, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010110101110; b = 14'b01100010011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3349, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100101100100; b = 14'b00101101101111; bin = 1'b0; // Expected: {'diff': 3573, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100101100100; b = 14'b00101101101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3573, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010001101110; b = 14'b10101000000100; bin = 1'b1; // Expected: {'diff': 14953, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010001101110; b = 14'b10101000000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14953, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111000000101; b = 14'b10010110011001; bin = 1'b0; // Expected: {'diff': 2156, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111000000101; b = 14'b10010110011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2156, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101110101001; b = 14'b00001100000110; bin = 1'b0; // Expected: {'diff': 6307, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101110101001; b = 14'b00001100000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6307, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011111101000; b = 14'b00100111010001; bin = 1'b1; // Expected: {'diff': 3606, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011111101000; b = 14'b00100111010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3606, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110001001110; b = 14'b00110110001110; bin = 1'b0; // Expected: {'diff': 16064, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110001001110; b = 14'b00110110001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16064, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101111010000; b = 14'b01100111111111; bin = 1'b1; // Expected: {'diff': 464, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101111010000; b = 14'b01100111111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 464, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100001110110; b = 14'b10111111100000; bin = 1'b0; // Expected: {'diff': 10390, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100001110110; b = 14'b10111111100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10390, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010001001101; b = 14'b01001100011100; bin = 1'b1; // Expected: {'diff': 8496, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010001001101; b = 14'b01001100011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8496, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011000101010; b = 14'b10010010000000; bin = 1'b0; // Expected: {'diff': 8618, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011000101010; b = 14'b10010010000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8618, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000010001101; b = 14'b01001010010110; bin = 1'b1; // Expected: {'diff': 3574, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000010001101; b = 14'b01001010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3574, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111000010101; b = 14'b00010010111100; bin = 1'b0; // Expected: {'diff': 14681, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111000010101; b = 14'b00010010111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14681, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111101001100; b = 14'b11111110110011; bin = 1'b1; // Expected: {'diff': 16280, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111101001100; b = 14'b11111110110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16280, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011001010110; b = 14'b11010010011011; bin = 1'b1; // Expected: {'diff': 4538, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011001010110; b = 14'b11010010011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4538, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100111000101; b = 14'b01110100111011; bin = 1'b1; // Expected: {'diff': 7305, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100111000101; b = 14'b01110100111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7305, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111101000110; b = 14'b10011000110001; bin = 1'b1; // Expected: {'diff': 14612, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111101000110; b = 14'b10011000110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14612, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010100101100; b = 14'b00111101100000; bin = 1'b1; // Expected: {'diff': 5579, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010100101100; b = 14'b00111101100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5579, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001011111111; b = 14'b01100000100000; bin = 1'b0; // Expected: {'diff': 6879, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001011111111; b = 14'b01100000100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6879, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100010101111; b = 14'b01011000010100; bin = 1'b1; // Expected: {'diff': 12954, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100010101111; b = 14'b01011000010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12954, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101111011001; b = 14'b10010001100000; bin = 1'b0; // Expected: {'diff': 6009, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101111011001; b = 14'b10010001100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6009, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111010001101; b = 14'b11000001000110; bin = 1'b0; // Expected: {'diff': 15943, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111010001101; b = 14'b11000001000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15943, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011010000000; b = 14'b01111010001010; bin = 1'b1; // Expected: {'diff': 2037, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011010000000; b = 14'b01111010001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2037, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010110110110; b = 14'b10000001010001; bin = 1'b0; // Expected: {'diff': 5477, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010110110110; b = 14'b10000001010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5477, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011100010111; b = 14'b01001011100111; bin = 1'b1; // Expected: {'diff': 9263, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011100010111; b = 14'b01001011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9263, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011010101101; b = 14'b11001110011010; bin = 1'b1; // Expected: {'diff': 786, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011010101101; b = 14'b11001110011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 786, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011011001101; b = 14'b11100111100111; bin = 1'b1; // Expected: {'diff': 7397, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011011001101; b = 14'b11100111100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7397, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010111000011; b = 14'b11101001110110; bin = 1'b1; // Expected: {'diff': 2892, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010111000011; b = 14'b11101001110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2892, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100100000110; b = 14'b10111001101011; bin = 1'b1; // Expected: {'diff': 6810, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100100000110; b = 14'b10111001101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6810, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000011110001; b = 14'b00101011011100; bin = 1'b0; // Expected: {'diff': 9749, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000011110001; b = 14'b00101011011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9749, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100111110100; b = 14'b10001010111100; bin = 1'b1; // Expected: {'diff': 14135, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100111110100; b = 14'b10001010111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14135, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011010111101; b = 14'b00100100000110; bin = 1'b1; // Expected: {'diff': 15798, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011010111101; b = 14'b00100100000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15798, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010111100010; b = 14'b01110100111101; bin = 1'b0; // Expected: {'diff': 10405, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010111100010; b = 14'b01110100111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10405, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101001100111; b = 14'b01110100101101; bin = 1'b1; // Expected: {'diff': 15673, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101001100111; b = 14'b01110100101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15673, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010100100100; b = 14'b00110000011110; bin = 1'b1; // Expected: {'diff': 2309, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010100100100; b = 14'b00110000011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2309, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001001101111; b = 14'b10000010011010; bin = 1'b1; // Expected: {'diff': 12756, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001001101111; b = 14'b10000010011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12756, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000110111001; b = 14'b01100001001111; bin = 1'b0; // Expected: {'diff': 2410, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000110111001; b = 14'b01100001001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2410, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011111010010; b = 14'b00011100011001; bin = 1'b0; // Expected: {'diff': 8377, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011111010010; b = 14'b00011100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8377, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001110001010; b = 14'b11110100110100; bin = 1'b1; // Expected: {'diff': 9813, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001110001010; b = 14'b11110100110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9813, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011111001010; b = 14'b11110011010010; bin = 1'b1; // Expected: {'diff': 15095, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011111001010; b = 14'b11110011010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15095, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001000111010; b = 14'b11111110001100; bin = 1'b1; // Expected: {'diff': 8877, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001000111010; b = 14'b11111110001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8877, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000110011010; b = 14'b10111111001100; bin = 1'b0; // Expected: {'diff': 4558, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000110011010; b = 14'b10111111001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4558, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110110100100; b = 14'b11011000000100; bin = 1'b0; // Expected: {'diff': 1952, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110110100100; b = 14'b11011000000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1952, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000101111010; b = 14'b10111001001101; bin = 1'b0; // Expected: {'diff': 813, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000101111010; b = 14'b10111001001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 813, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011100101110; b = 14'b01010100101100; bin = 1'b1; // Expected: {'diff': 4609, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011100101110; b = 14'b01010100101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4609, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010101111111; b = 14'b01011100100100; bin = 1'b0; // Expected: {'diff': 7771, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010101111111; b = 14'b01011100100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7771, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011000110000; b = 14'b01111111110111; bin = 1'b1; // Expected: {'diff': 13880, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011000110000; b = 14'b01111111110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13880, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101000001010; b = 14'b01000100001111; bin = 1'b1; // Expected: {'diff': 10490, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101000001010; b = 14'b01000100001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10490, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110101001111; b = 14'b10101100011000; bin = 1'b0; // Expected: {'diff': 567, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110101001111; b = 14'b10101100011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 567, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001110000100; b = 14'b11101111111000; bin = 1'b0; // Expected: {'diff': 10124, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001110000100; b = 14'b11101111111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10124, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101100011000; b = 14'b01110011100110; bin = 1'b0; // Expected: {'diff': 11826, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101100011000; b = 14'b01110011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11826, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110011100111; b = 14'b00011000101110; bin = 1'b0; // Expected: {'diff': 14009, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110011100111; b = 14'b00011000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14009, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000110111100; b = 14'b00000011101010; bin = 1'b0; // Expected: {'diff': 8402, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000110111100; b = 14'b00000011101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8402, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101000101101; b = 14'b11111101000101; bin = 1'b0; // Expected: {'diff': 15080, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101000101101; b = 14'b11111101000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15080, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010101111101; b = 14'b11011111011001; bin = 1'b1; // Expected: {'diff': 11683, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010101111101; b = 14'b11011111011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11683, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001010100110; b = 14'b11101110110001; bin = 1'b1; // Expected: {'diff': 5876, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001010100110; b = 14'b11101110110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5876, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100111111111; b = 14'b00000110110101; bin = 1'b0; // Expected: {'diff': 14410, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100111111111; b = 14'b00000110110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14410, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110010010010; b = 14'b01011111010110; bin = 1'b0; // Expected: {'diff': 13500, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110010010010; b = 14'b01011111010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13500, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101100000100; b = 14'b10100011101110; bin = 1'b1; // Expected: {'diff': 533, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101100000100; b = 14'b10100011101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 533, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111101100000; b = 14'b01010010011001; bin = 1'b0; // Expected: {'diff': 2759, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111101100000; b = 14'b01010010011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2759, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010001111000; b = 14'b01000101000100; bin = 1'b0; // Expected: {'diff': 820, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010001111000; b = 14'b01000101000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 820, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001011010111; b = 14'b00011111110011; bin = 1'b1; // Expected: {'diff': 15075, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001011010111; b = 14'b00011111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15075, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111101110100; b = 14'b10110000111011; bin = 1'b1; // Expected: {'diff': 4920, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111101110100; b = 14'b10110000111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4920, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011011110001; b = 14'b11101111100000; bin = 1'b1; // Expected: {'diff': 6928, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011011110001; b = 14'b11101111100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6928, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110011110111; b = 14'b00110000101000; bin = 1'b0; // Expected: {'diff': 4303, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110011110111; b = 14'b00110000101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4303, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011001100101; b = 14'b11000111010101; bin = 1'b0; // Expected: {'diff': 1168, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011001100101; b = 14'b11000111010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1168, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001011010001; b = 14'b00000011101111; bin = 1'b1; // Expected: {'diff': 4577, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001011010001; b = 14'b00000011101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4577, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001110001111; b = 14'b01011100000011; bin = 1'b0; // Expected: {'diff': 3212, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001110001111; b = 14'b01011100000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3212, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001000111010; b = 14'b10000101001011; bin = 1'b0; // Expected: {'diff': 8431, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001000111010; b = 14'b10000101001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8431, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101011101100; b = 14'b10101001000011; bin = 1'b0; // Expected: {'diff': 169, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101011101100; b = 14'b10101001000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 169, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101010011001; b = 14'b11111110001001; bin = 1'b1; // Expected: {'diff': 2831, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101010011001; b = 14'b11111110001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2831, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100000111010; b = 14'b00010000101111; bin = 1'b1; // Expected: {'diff': 9226, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100000111010; b = 14'b00010000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9226, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000010010001; b = 14'b00110011011101; bin = 1'b1; // Expected: {'diff': 13235, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000010010001; b = 14'b00110011011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13235, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110100100101; b = 14'b01111100000101; bin = 1'b0; // Expected: {'diff': 3616, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110100100101; b = 14'b01111100000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3616, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011010011001; b = 14'b10100001011100; bin = 1'b1; // Expected: {'diff': 7740, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011010011001; b = 14'b10100001011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7740, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101010101000; b = 14'b11011010000111; bin = 1'b1; // Expected: {'diff': 1056, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101010101000; b = 14'b11011010000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1056, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111100001111; b = 14'b01111001100011; bin = 1'b1; // Expected: {'diff': 4267, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111100001111; b = 14'b01111001100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4267, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111011100001; b = 14'b00010100010110; bin = 1'b0; // Expected: {'diff': 14795, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111011100001; b = 14'b00010100010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14795, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010010111111; b = 14'b10001100110101; bin = 1'b0; // Expected: {'diff': 394, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010010111111; b = 14'b10001100110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 394, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100000011100; b = 14'b10101010011111; bin = 1'b0; // Expected: {'diff': 15741, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100000011100; b = 14'b10101010011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15741, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001000110101; b = 14'b00111111010100; bin = 1'b1; // Expected: {'diff': 608, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001000110101; b = 14'b00111111010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 608, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000111101011; b = 14'b11000011000101; bin = 1'b0; // Expected: {'diff': 12582, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000111101011; b = 14'b11000011000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12582, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011000000111; b = 14'b01101111100111; bin = 1'b1; // Expected: {'diff': 10783, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011000000111; b = 14'b01101111100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10783, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010011101100; b = 14'b10010100000110; bin = 1'b0; // Expected: {'diff': 12262, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010011101100; b = 14'b10010100000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12262, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010011110100; b = 14'b01000000110100; bin = 1'b0; // Expected: {'diff': 9408, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010011110100; b = 14'b01000000110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9408, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000110011110; b = 14'b00000001101101; bin = 1'b1; // Expected: {'diff': 12592, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000110011110; b = 14'b00000001101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12592, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111101111110; b = 14'b10110001011011; bin = 1'b1; // Expected: {'diff': 8994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111101111110; b = 14'b10110001011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001100110110; b = 14'b00011100101111; bin = 1'b1; // Expected: {'diff': 7174, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001100110110; b = 14'b00011100101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7174, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110111101110; b = 14'b00111110000011; bin = 1'b0; // Expected: {'diff': 3691, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110111101110; b = 14'b00111110000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3691, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111000100000; b = 14'b11000011100010; bin = 1'b1; // Expected: {'diff': 15677, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111000100000; b = 14'b11000011100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15677, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000101010000; b = 14'b11110000110001; bin = 1'b1; // Expected: {'diff': 5406, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000101010000; b = 14'b11110000110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5406, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010101110001; b = 14'b11110111100111; bin = 1'b0; // Expected: {'diff': 1930, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010101110001; b = 14'b11110111100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1930, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110101010101; b = 14'b00011000010011; bin = 1'b1; // Expected: {'diff': 10049, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110101010101; b = 14'b00011000010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10049, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011111011000; b = 14'b11000111111100; bin = 1'b1; // Expected: {'diff': 9691, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011111011000; b = 14'b11000111111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9691, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001001110101; b = 14'b10011000001011; bin = 1'b0; // Expected: {'diff': 11370, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001001110101; b = 14'b10011000001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11370, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100000110001; b = 14'b11110010010011; bin = 1'b1; // Expected: {'diff': 15261, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100000110001; b = 14'b11110010010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15261, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011110100110; b = 14'b11100001110101; bin = 1'b0; // Expected: {'diff': 3889, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011110100110; b = 14'b11100001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3889, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001010000001; b = 14'b10010001010111; bin = 1'b1; // Expected: {'diff': 15913, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001010000001; b = 14'b10010001010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15913, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111010100000; b = 14'b11010011000101; bin = 1'b0; // Expected: {'diff': 6619, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111010100000; b = 14'b11010011000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6619, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100111001111; b = 14'b11010111100001; bin = 1'b1; // Expected: {'diff': 13293, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100111001111; b = 14'b11010111100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13293, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000111101000; b = 14'b11000101101011; bin = 1'b0; // Expected: {'diff': 8317, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000111101000; b = 14'b11000101101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8317, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011000101110; b = 14'b10110100010111; bin = 1'b0; // Expected: {'diff': 10519, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011000101110; b = 14'b10110100010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10519, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110100111001; b = 14'b10010101000111; bin = 1'b0; // Expected: {'diff': 14322, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110100111001; b = 14'b10010101000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14322, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000001101111; b = 14'b11010011001101; bin = 1'b1; // Expected: {'diff': 7073, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000001101111; b = 14'b11010011001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7073, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010010101100; b = 14'b11010111001111; bin = 1'b0; // Expected: {'diff': 7901, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010010101100; b = 14'b11010111001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7901, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000101011000; b = 14'b01010010000110; bin = 1'b1; // Expected: {'diff': 7377, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000101011000; b = 14'b01010010000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7377, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010101001001; b = 14'b01011111110001; bin = 1'b0; // Expected: {'diff': 3416, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010101001001; b = 14'b01011111110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3416, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011011101000; b = 14'b01010100111001; bin = 1'b1; // Expected: {'diff': 8622, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011011101000; b = 14'b01010100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8622, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111100100011; b = 14'b00001001101001; bin = 1'b0; // Expected: {'diff': 7354, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111100100011; b = 14'b00001001101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7354, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101011001010; b = 14'b10010111101110; bin = 1'b0; // Expected: {'diff': 1244, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101011001010; b = 14'b10010111101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1244, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111100110001; b = 14'b01000010010111; bin = 1'b0; // Expected: {'diff': 7834, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111100110001; b = 14'b01000010010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7834, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001001001010; b = 14'b00110001100011; bin = 1'b1; // Expected: {'diff': 13798, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001001001010; b = 14'b00110001100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13798, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010101011100; b = 14'b00100101001110; bin = 1'b1; // Expected: {'diff': 15373, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010101011100; b = 14'b00100101001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15373, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100101111011; b = 14'b00100000100111; bin = 1'b1; // Expected: {'diff': 4435, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100101111011; b = 14'b00100000100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4435, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010010000000; b = 14'b10110101100111; bin = 1'b0; // Expected: {'diff': 1817, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010010000000; b = 14'b10110101100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1817, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101010110001; b = 14'b10001111011011; bin = 1'b1; // Expected: {'diff': 14037, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101010110001; b = 14'b10001111011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14037, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110101111101; b = 14'b11001100001000; bin = 1'b0; // Expected: {'diff': 2677, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110101111101; b = 14'b11001100001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2677, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000110110011; b = 14'b00001000100111; bin = 1'b1; // Expected: {'diff': 3979, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000110110011; b = 14'b00001000100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3979, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101111001011; b = 14'b01010111100010; bin = 1'b0; // Expected: {'diff': 13801, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101111001011; b = 14'b01010111100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13801, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001100111100; b = 14'b10000010010000; bin = 1'b1; // Expected: {'diff': 12971, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001100111100; b = 14'b10000010010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12971, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011000101010; b = 14'b11101101010110; bin = 1'b1; // Expected: {'diff': 10963, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011000101010; b = 14'b11101101010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10963, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110011110000; b = 14'b00010101110000; bin = 1'b1; // Expected: {'diff': 14207, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110011110000; b = 14'b00010101110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14207, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101001010000; b = 14'b10111110111101; bin = 1'b1; // Expected: {'diff': 10898, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101001010000; b = 14'b10111110111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10898, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000001111101; b = 14'b10110010101011; bin = 1'b0; // Expected: {'diff': 978, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000001111101; b = 14'b10110010101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 978, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100101011001; b = 14'b01010110110110; bin = 1'b0; // Expected: {'diff': 9123, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100101011001; b = 14'b01010110110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9123, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000001010100; b = 14'b10101011001101; bin = 1'b0; // Expected: {'diff': 9607, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000001010100; b = 14'b10101011001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9607, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101000100110; b = 14'b10111001101001; bin = 1'b1; // Expected: {'diff': 11196, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101000100110; b = 14'b10111001101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11196, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100010000011; b = 14'b11010111010110; bin = 1'b0; // Expected: {'diff': 4781, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100010000011; b = 14'b11010111010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4781, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110010100100; b = 14'b11111010110101; bin = 1'b1; // Expected: {'diff': 11758, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110010100100; b = 14'b11111010110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11758, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010101101000; b = 14'b00010101011001; bin = 1'b1; // Expected: {'diff': 4110, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010101101000; b = 14'b00010101011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4110, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000100011111; b = 14'b00100111010011; bin = 1'b0; // Expected: {'diff': 5964, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000100011111; b = 14'b00100111010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5964, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011111011001; b = 14'b01011011000010; bin = 1'b0; // Expected: {'diff': 4375, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011111011001; b = 14'b01011011000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4375, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101011100101; b = 14'b11101010011111; bin = 1'b0; // Expected: {'diff': 12358, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101011100101; b = 14'b11101010011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12358, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010000000001; b = 14'b11111001101000; bin = 1'b1; // Expected: {'diff': 9624, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010000000001; b = 14'b11111001101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9624, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111010011111; b = 14'b10111100010100; bin = 1'b0; // Expected: {'diff': 16267, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111010011111; b = 14'b10111100010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16267, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101001010111; b = 14'b11000100100111; bin = 1'b1; // Expected: {'diff': 6447, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101001010111; b = 14'b11000100100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6447, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001011010011; b = 14'b01010011101100; bin = 1'b1; // Expected: {'diff': 7654, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001011010011; b = 14'b01010011101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7654, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101011110011; b = 14'b10010110001000; bin = 1'b1; // Expected: {'diff': 13674, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101011110011; b = 14'b10010110001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13674, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001011101110; b = 14'b10110101111111; bin = 1'b1; // Expected: {'diff': 9582, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001011101110; b = 14'b10110101111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9582, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100100100011; b = 14'b11000111001110; bin = 1'b1; // Expected: {'diff': 14164, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100100100011; b = 14'b11000111001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14164, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000110111010; b = 14'b00111100111010; bin = 1'b0; // Expected: {'diff': 12928, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000110111010; b = 14'b00111100111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12928, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000011110011; b = 14'b11001111111100; bin = 1'b1; // Expected: {'diff': 11510, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000011110011; b = 14'b11001111111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11510, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000100011001; b = 14'b10100100101110; bin = 1'b0; // Expected: {'diff': 2027, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000100011001; b = 14'b10100100101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2027, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100000010010; b = 14'b10010100110000; bin = 1'b1; // Expected: {'diff': 13025, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100000010010; b = 14'b10010100110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13025, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110111111101; b = 14'b00011000001011; bin = 1'b1; // Expected: {'diff': 14321, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110111111101; b = 14'b00011000001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14321, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101001000010; b = 14'b00111110010110; bin = 1'b0; // Expected: {'diff': 15020, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101001000010; b = 14'b00111110010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15020, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010010111000; b = 14'b01111000010110; bin = 1'b0; // Expected: {'diff': 9890, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010010111000; b = 14'b01111000010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9890, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010110111001; b = 14'b10101010100000; bin = 1'b0; // Expected: {'diff': 2841, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010110111001; b = 14'b10101010100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2841, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010010010010; b = 14'b00011000110011; bin = 1'b0; // Expected: {'diff': 3679, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010010010010; b = 14'b00011000110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3679, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100010000110; b = 14'b01010111000100; bin = 1'b1; // Expected: {'diff': 12993, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100010000110; b = 14'b01010111000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12993, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100010011000; b = 14'b01111111000100; bin = 1'b1; // Expected: {'diff': 10451, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100010011000; b = 14'b01111111000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10451, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011011110001; b = 14'b01110000100011; bin = 1'b1; // Expected: {'diff': 6861, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011011110001; b = 14'b01110000100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6861, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000101110010; b = 14'b10011010010001; bin = 1'b1; // Expected: {'diff': 15072, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000101110010; b = 14'b10011010010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15072, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001010011110; b = 14'b01101101010001; bin = 1'b1; // Expected: {'diff': 10060, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001010011110; b = 14'b01101101010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10060, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010000010101; b = 14'b11100000101101; bin = 1'b1; // Expected: {'diff': 11239, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010000010101; b = 14'b11100000101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11239, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110011001101; b = 14'b01101100010000; bin = 1'b1; // Expected: {'diff': 444, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110011001101; b = 14'b01101100010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 444, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011011010101; b = 14'b00010110010100; bin = 1'b0; // Expected: {'diff': 12609, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011011010101; b = 14'b00010110010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12609, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101101100110; b = 14'b01111101101000; bin = 1'b1; // Expected: {'diff': 15357, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101101100110; b = 14'b01111101101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15357, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100010001011; b = 14'b01001000101011; bin = 1'b0; // Expected: {'diff': 1632, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100010001011; b = 14'b01001000101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1632, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010110011010; b = 14'b00010110011000; bin = 1'b0; // Expected: {'diff': 4098, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010110011010; b = 14'b00010110011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4098, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100100000001; b = 14'b01001001001011; bin = 1'b0; // Expected: {'diff': 1718, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100100000001; b = 14'b01001001001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1718, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000100001100; b = 14'b00101101111010; bin = 1'b1; // Expected: {'diff': 1425, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000100001100; b = 14'b00101101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1425, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000011010110; b = 14'b01010111110011; bin = 1'b0; // Expected: {'diff': 6883, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000011010110; b = 14'b01010111110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6883, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011111100001; b = 14'b01101011101000; bin = 1'b1; // Expected: {'diff': 7416, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011111100001; b = 14'b01101011101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7416, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011101110010; b = 14'b01101010000010; bin = 1'b1; // Expected: {'diff': 7407, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011101110010; b = 14'b01101010000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7407, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110000011111; b = 14'b01111001101101; bin = 1'b1; // Expected: {'diff': 15793, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110000011111; b = 14'b01111001101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15793, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110111001011; b = 14'b00101100000101; bin = 1'b1; // Expected: {'diff': 4805, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110111001011; b = 14'b00101100000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4805, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110101111011; b = 14'b10001011111000; bin = 1'b0; // Expected: {'diff': 2691, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110101111011; b = 14'b10001011111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2691, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011001110000; b = 14'b01010101010100; bin = 1'b0; // Expected: {'diff': 12572, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011001110000; b = 14'b01010101010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12572, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001111001000; b = 14'b11000101001011; bin = 1'b1; // Expected: {'diff': 4732, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001111001000; b = 14'b11000101001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4732, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000000011010; b = 14'b01110010010000; bin = 1'b1; // Expected: {'diff': 13193, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000000011010; b = 14'b01110010010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13193, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010110011100; b = 14'b10001000000111; bin = 1'b1; // Expected: {'diff': 5012, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010110011100; b = 14'b10001000000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5012, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001111111010; b = 14'b11100001010101; bin = 1'b0; // Expected: {'diff': 11173, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001111111010; b = 14'b11100001010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11173, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111010110011; b = 14'b10101000010110; bin = 1'b0; // Expected: {'diff': 9373, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111010110011; b = 14'b10101000010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9373, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001100110101; b = 14'b10100100110011; bin = 1'b1; // Expected: {'diff': 10753, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001100110101; b = 14'b10100100110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10753, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010011110011; b = 14'b01000110010001; bin = 1'b0; // Expected: {'diff': 9058, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010011110011; b = 14'b01000110010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9058, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111010001011; b = 14'b01111001110000; bin = 1'b1; // Expected: {'diff': 4122, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111010001011; b = 14'b01111001110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111010010111; b = 14'b01000010101001; bin = 1'b1; // Expected: {'diff': 7661, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111010010111; b = 14'b01000010101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7661, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011001111110; b = 14'b10111111100110; bin = 1'b1; // Expected: {'diff': 1687, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011001111110; b = 14'b10111111100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1687, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001101001001; b = 14'b10011011000011; bin = 1'b1; // Expected: {'diff': 11397, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001101001001; b = 14'b10011011000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11397, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100101001010; b = 14'b00110111001011; bin = 1'b0; // Expected: {'diff': 11135, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100101001010; b = 14'b00110111001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11135, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001001001001; b = 14'b11111101111011; bin = 1'b1; // Expected: {'diff': 717, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001001001001; b = 14'b11111101111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 717, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110110110000; b = 14'b11100100011001; bin = 1'b0; // Expected: {'diff': 9367, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110110110000; b = 14'b11100100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9367, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011110010100; b = 14'b11010110101110; bin = 1'b0; // Expected: {'diff': 4582, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011110010100; b = 14'b11010110101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4582, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101011010000; b = 14'b11000010111100; bin = 1'b1; // Expected: {'diff': 6675, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101011010000; b = 14'b11000010111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6675, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101010011001; b = 14'b10011010111000; bin = 1'b1; // Expected: {'diff': 992, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101010011001; b = 14'b10011010111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 992, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010001011010; b = 14'b10010011101001; bin = 1'b0; // Expected: {'diff': 12145, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010001011010; b = 14'b10010011101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12145, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010000100010; b = 14'b10010110100100; bin = 1'b1; // Expected: {'diff': 3709, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010000100010; b = 14'b10010110100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3709, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001110011001; b = 14'b01101000101100; bin = 1'b1; // Expected: {'diff': 6508, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001110011001; b = 14'b01101000101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6508, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011101100010; b = 14'b01011010011101; bin = 1'b0; // Expected: {'diff': 197, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011101100010; b = 14'b01011010011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 197, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000110001100; b = 14'b00101001101100; bin = 1'b1; // Expected: {'diff': 1823, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000110001100; b = 14'b00101001101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1823, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101001001110; b = 14'b00111111001011; bin = 1'b1; // Expected: {'diff': 10882, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101001001110; b = 14'b00111111001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10882, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001000000011; b = 14'b10000000000000; bin = 1'b0; // Expected: {'diff': 515, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001000000011; b = 14'b10000000000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 515, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011001100101; b = 14'b01000110101101; bin = 1'b0; // Expected: {'diff': 1208, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011001100101; b = 14'b01000110101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1208, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000111000001; b = 14'b01001001001101; bin = 1'b0; // Expected: {'diff': 8052, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000111000001; b = 14'b01001001001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8052, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011000001001; b = 14'b00110001000010; bin = 1'b1; // Expected: {'diff': 10694, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011000001001; b = 14'b00110001000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10694, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011001010000; b = 14'b01001101110000; bin = 1'b0; // Expected: {'diff': 736, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011001010000; b = 14'b01001101110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 736, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111110001001; b = 14'b11100110000110; bin = 1'b1; // Expected: {'diff': 9730, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111110001001; b = 14'b11100110000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9730, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110100111001; b = 14'b11011010011110; bin = 1'b1; // Expected: {'diff': 9882, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110100111001; b = 14'b11011010011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9882, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001010111001; b = 14'b10011111100010; bin = 1'b0; // Expected: {'diff': 2775, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001010111001; b = 14'b10011111100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2775, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000101101001; b = 14'b00111010100000; bin = 1'b1; // Expected: {'diff': 712, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000101101001; b = 14'b00111010100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 712, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001011010001; b = 14'b10011010011111; bin = 1'b0; // Expected: {'diff': 15410, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001011010001; b = 14'b10011010011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15410, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101001010001; b = 14'b00010011101111; bin = 1'b1; // Expected: {'diff': 5473, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101001010001; b = 14'b00010011101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5473, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000011001001; b = 14'b11101110011111; bin = 1'b0; // Expected: {'diff': 13610, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000011001001; b = 14'b11101110011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13610, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110111111010; b = 14'b11000101010001; bin = 1'b0; // Expected: {'diff': 7337, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110111111010; b = 14'b11000101010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7337, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101010111100; b = 14'b00111101100110; bin = 1'b0; // Expected: {'diff': 6998, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101010111100; b = 14'b00111101100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6998, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011001010101; b = 14'b01010110100001; bin = 1'b0; // Expected: {'diff': 4276, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011001010101; b = 14'b01010110100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4276, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010000111010; b = 14'b00001001100000; bin = 1'b1; // Expected: {'diff': 12761, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010000111010; b = 14'b00001001100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12761, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000110100010; b = 14'b10001101001000; bin = 1'b1; // Expected: {'diff': 11865, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000110100010; b = 14'b10001101001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11865, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110010101010; b = 14'b11010111011010; bin = 1'b0; // Expected: {'diff': 14032, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110010101010; b = 14'b11010111011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14032, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001111011011; b = 14'b00010001101110; bin = 1'b1; // Expected: {'diff': 16236, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001111011011; b = 14'b00010001101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16236, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100111010010; b = 14'b01110111101001; bin = 1'b0; // Expected: {'diff': 7145, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100111010010; b = 14'b01110111101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7145, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111000110001; b = 14'b10011001011000; bin = 1'b1; // Expected: {'diff': 10200, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111000110001; b = 14'b10011001011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10200, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001111110100; b = 14'b10010111010010; bin = 1'b0; // Expected: {'diff': 11810, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001111110100; b = 14'b10010111010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11810, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011101011111; b = 14'b11010011000011; bin = 1'b1; // Expected: {'diff': 12955, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011101011111; b = 14'b11010011000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12955, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000000111011; b = 14'b01001001000110; bin = 1'b0; // Expected: {'diff': 7669, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000000111011; b = 14'b01001001000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7669, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111100100001; b = 14'b10111111010111; bin = 1'b1; // Expected: {'diff': 3913, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111100100001; b = 14'b10111111010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3913, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011100100111; b = 14'b10111110110111; bin = 1'b0; // Expected: {'diff': 10096, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011100100111; b = 14'b10111110110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10096, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101010011011; b = 14'b01110001001000; bin = 1'b0; // Expected: {'diff': 11859, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101010011011; b = 14'b01110001001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11859, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110100100110; b = 14'b01000010010011; bin = 1'b1; // Expected: {'diff': 15506, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110100100110; b = 14'b01000010010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15506, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011011001001; b = 14'b00110111000100; bin = 1'b1; // Expected: {'diff': 10500, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011011001001; b = 14'b00110111000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10500, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110100111101; b = 14'b11100100110110; bin = 1'b0; // Expected: {'diff': 1031, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110100111101; b = 14'b11100100110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1031, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100110001111; b = 14'b11111001101001; bin = 1'b1; // Expected: {'diff': 6949, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100110001111; b = 14'b11111001101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6949, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111001001101; b = 14'b11001111101011; bin = 1'b0; // Expected: {'diff': 14946, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111001001101; b = 14'b11001111101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14946, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001101010100; b = 14'b00010100100001; bin = 1'b0; // Expected: {'diff': 7731, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001101010100; b = 14'b00010100100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7731, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010001011111; b = 14'b11111010010001; bin = 1'b0; // Expected: {'diff': 5582, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010001011111; b = 14'b11111010010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5582, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111001011101; b = 14'b01010010001010; bin = 1'b1; // Expected: {'diff': 14802, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111001011101; b = 14'b01010010001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14802, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101010111111; b = 14'b00111110010101; bin = 1'b0; // Expected: {'diff': 15146, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101010111111; b = 14'b00111110010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15146, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110001100111; b = 14'b01010111101111; bin = 1'b1; // Expected: {'diff': 5751, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110001100111; b = 14'b01010111101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5751, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000001111101; b = 14'b01010000111111; bin = 1'b0; // Expected: {'diff': 15422, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000001111101; b = 14'b01010000111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15422, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110111011011; b = 14'b10111101100000; bin = 1'b1; // Expected: {'diff': 3706, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110111011011; b = 14'b10111101100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3706, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011011110110; b = 14'b00100011001100; bin = 1'b1; // Expected: {'diff': 11817, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011011110110; b = 14'b00100011001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11817, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110100000110; b = 14'b10000100110101; bin = 1'b1; // Expected: {'diff': 7120, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110100000110; b = 14'b10000100110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7120, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101010001000; b = 14'b11101100011110; bin = 1'b0; // Expected: {'diff': 12138, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101010001000; b = 14'b11101100011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12138, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101101000100; b = 14'b11010100011001; bin = 1'b0; // Expected: {'diff': 9771, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101101000100; b = 14'b11010100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9771, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101101000010; b = 14'b11110100011010; bin = 1'b1; // Expected: {'diff': 7719, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101101000010; b = 14'b11110100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7719, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000000110101; b = 14'b11000101001010; bin = 1'b0; // Expected: {'diff': 7915, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000000110101; b = 14'b11000101001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7915, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100101000001; b = 14'b00011011010010; bin = 1'b1; // Expected: {'diff': 12910, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100101000001; b = 14'b00011011010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12910, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100010110001; b = 14'b10101101000000; bin = 1'b0; // Expected: {'diff': 3441, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100010110001; b = 14'b10101101000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3441, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010010101001; b = 14'b10100000010100; bin = 1'b1; // Expected: {'diff': 11412, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010010101001; b = 14'b10100000010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11412, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100010100111; b = 14'b10001011111011; bin = 1'b1; // Expected: {'diff': 1451, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100010100111; b = 14'b10001011111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1451, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010010100010; b = 14'b00111111100101; bin = 1'b1; // Expected: {'diff': 5308, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010010100010; b = 14'b00111111100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5308, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010011101100; b = 14'b01011100101101; bin = 1'b1; // Expected: {'diff': 11710, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010011101100; b = 14'b01011100101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11710, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101011110010; b = 14'b00000011010101; bin = 1'b0; // Expected: {'diff': 2589, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101011110010; b = 14'b00000011010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2589, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100100001010; b = 14'b10100111111000; bin = 1'b1; // Expected: {'diff': 12049, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100100001010; b = 14'b10100111111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12049, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101111110111; b = 14'b00000111010011; bin = 1'b0; // Expected: {'diff': 6692, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101111110111; b = 14'b00000111010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6692, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100111110111; b = 14'b01000001001110; bin = 1'b1; // Expected: {'diff': 2472, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100111110111; b = 14'b01000001001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2472, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110010011110; b = 14'b01010010001011; bin = 1'b0; // Expected: {'diff': 10259, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110010011110; b = 14'b01010010001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10259, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100001101100; b = 14'b10001101001011; bin = 1'b0; // Expected: {'diff': 1313, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100001101100; b = 14'b10001101001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1313, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100110000011; b = 14'b10100101100110; bin = 1'b1; // Expected: {'diff': 8220, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100110000011; b = 14'b10100101100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8220, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110111100111; b = 14'b01010010011110; bin = 1'b0; // Expected: {'diff': 14665, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110111100111; b = 14'b01010010011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14665, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100000101010; b = 14'b00100010001110; bin = 1'b1; // Expected: {'diff': 8091, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100000101010; b = 14'b00100010001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8091, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000000010000; b = 14'b01010010101110; bin = 1'b0; // Expected: {'diff': 7010, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000000010000; b = 14'b01010010101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7010, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000011011000; b = 14'b00011110111001; bin = 1'b1; // Expected: {'diff': 2334, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000011011000; b = 14'b00011110111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2334, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010011000011; b = 14'b00001000101010; bin = 1'b1; // Expected: {'diff': 12952, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010011000011; b = 14'b00001000101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12952, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100000011000; b = 14'b00000010010010; bin = 1'b0; // Expected: {'diff': 1926, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100000011000; b = 14'b00000010010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1926, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110110011110; b = 14'b11111001111011; bin = 1'b1; // Expected: {'diff': 3874, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110110011110; b = 14'b11111001111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3874, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110111110010; b = 14'b00111100011010; bin = 1'b0; // Expected: {'diff': 3800, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110111110010; b = 14'b00111100011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3800, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000010011100; b = 14'b00001011001111; bin = 1'b1; // Expected: {'diff': 3532, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000010011100; b = 14'b00001011001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3532, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110110001111; b = 14'b11111110010100; bin = 1'b1; // Expected: {'diff': 15866, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110110001111; b = 14'b11111110010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15866, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100011010001; b = 14'b11000000010010; bin = 1'b1; // Expected: {'diff': 2238, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100011010001; b = 14'b11000000010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2238, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011111111100; b = 14'b11100101110101; bin = 1'b1; // Expected: {'diff': 16006, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011111111100; b = 14'b11100101110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16006, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100011011010; b = 14'b00000010100101; bin = 1'b1; // Expected: {'diff': 6196, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100011011010; b = 14'b00000010100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6196, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010111100110; b = 14'b10001001000100; bin = 1'b1; // Expected: {'diff': 9121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010111100110; b = 14'b10001001000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011001010011; b = 14'b00100000000010; bin = 1'b1; // Expected: {'diff': 11856, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011001010011; b = 14'b00100000000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11856, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011110010100; b = 14'b11000000101010; bin = 1'b0; // Expected: {'diff': 5994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011110010100; b = 14'b11000000101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011111101011; b = 14'b11000101110111; bin = 1'b1; // Expected: {'diff': 1651, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011111101011; b = 14'b11000101110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1651, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000110011100; b = 14'b01010000100000; bin = 1'b0; // Expected: {'diff': 11644, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000110011100; b = 14'b01010000100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11644, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110001000001; b = 14'b10100001001011; bin = 1'b1; // Expected: {'diff': 1013, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110001000001; b = 14'b10100001001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1013, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110100000000; b = 14'b10101101101100; bin = 1'b1; // Expected: {'diff': 8595, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110100000000; b = 14'b10101101101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8595, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111001111010; b = 14'b00100111000000; bin = 1'b1; // Expected: {'diff': 5305, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111001111010; b = 14'b00100111000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5305, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100101001001; b = 14'b10000011111001; bin = 1'b0; // Expected: {'diff': 10320, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100101001001; b = 14'b10000011111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10320, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111110011101; b = 14'b11111100001001; bin = 1'b1; // Expected: {'diff': 12435, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111110011101; b = 14'b11111100001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12435, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11111110011001; b = 14'b10110110000110; bin = 1'b1; // Expected: {'diff': 4626, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11111110011001; b = 14'b10110110000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4626, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110011100001; b = 14'b10000110111000; bin = 1'b0; // Expected: {'diff': 11049, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110011100001; b = 14'b10000110111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11049, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101101101100; b = 14'b10101001110000; bin = 1'b1; // Expected: {'diff': 12539, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101101101100; b = 14'b10101001110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12539, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000011111110; b = 14'b11010110101000; bin = 1'b1; // Expected: {'diff': 2901, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000011111110; b = 14'b11010110101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2901, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101010010111; b = 14'b00000111110010; bin = 1'b0; // Expected: {'diff': 2213, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101010010111; b = 14'b00000111110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2213, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000011010110; b = 14'b10110010110101; bin = 1'b0; // Expected: {'diff': 13345, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000011010110; b = 14'b10110010110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13345, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000010100011; b = 14'b00100011011001; bin = 1'b1; // Expected: {'diff': 6089, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000010100011; b = 14'b00100011011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6089, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001100101001; b = 14'b10011100111100; bin = 1'b0; // Expected: {'diff': 3053, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001100101001; b = 14'b10011100111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3053, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001100101100; b = 14'b10111100011110; bin = 1'b1; // Expected: {'diff': 5133, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001100101100; b = 14'b10111100011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5133, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000110100011; b = 14'b10010011101010; bin = 1'b1; // Expected: {'diff': 3256, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000110100011; b = 14'b10010011101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3256, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100111000001; b = 14'b01011111100101; bin = 1'b1; // Expected: {'diff': 12763, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100111000001; b = 14'b01011111100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12763, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100110100010; b = 14'b10001111100001; bin = 1'b1; // Expected: {'diff': 5568, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100110100010; b = 14'b10001111100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5568, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011100100111; b = 14'b00000011100010; bin = 1'b1; // Expected: {'diff': 5700, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011100100111; b = 14'b00000011100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5700, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111100001011; b = 14'b00101110111100; bin = 1'b1; // Expected: {'diff': 4942, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111100001011; b = 14'b00101110111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4942, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010001001001; b = 14'b10101111100101; bin = 1'b1; // Expected: {'diff': 6243, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010001001001; b = 14'b10101111100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6243, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101111101000; b = 14'b00011011001010; bin = 1'b1; // Expected: {'diff': 9501, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101111101000; b = 14'b00011011001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9501, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100001000010; b = 14'b01101001101011; bin = 1'b1; // Expected: {'diff': 7638, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100001000010; b = 14'b01101001101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7638, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01111010110000; b = 14'b00000000101011; bin = 1'b1; // Expected: {'diff': 7812, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01111010110000; b = 14'b00000000101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7812, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001000110000; b = 14'b01011010101010; bin = 1'b0; // Expected: {'diff': 2950, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001000110000; b = 14'b01011010101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2950, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011010100000; b = 14'b00010000000000; bin = 1'b1; // Expected: {'diff': 12959, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011010100000; b = 14'b00010000000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12959, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11100000100011; b = 14'b01000101110101; bin = 1'b1; // Expected: {'diff': 9901, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11100000100011; b = 14'b01000101110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9901, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110010101010; b = 14'b01010000010010; bin = 1'b0; // Expected: {'diff': 2200, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110010101010; b = 14'b01010000010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2200, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110001001011; b = 14'b01100100110110; bin = 1'b1; // Expected: {'diff': 4884, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110001001011; b = 14'b01100100110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4884, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100101111010; b = 14'b10010100101100; bin = 1'b0; // Expected: {'diff': 1102, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100101111010; b = 14'b10010100101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01011000111100; b = 14'b00011111101010; bin = 1'b1; // Expected: {'diff': 3665, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01011000111100; b = 14'b00011111101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3665, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110001101000; b = 14'b10111101100110; bin = 1'b0; // Expected: {'diff': 3330, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110001101000; b = 14'b10111101100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3330, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110110011010; b = 14'b00111101010111; bin = 1'b0; // Expected: {'diff': 7747, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110110011010; b = 14'b00111101010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7747, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010111100011; b = 14'b01100100000010; bin = 1'b1; // Expected: {'diff': 7392, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010111100011; b = 14'b01100100000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7392, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000000010111; b = 14'b11110101111010; bin = 1'b0; // Expected: {'diff': 8861, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000000010111; b = 14'b11110101111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8861, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001110011110; b = 14'b01000110111110; bin = 1'b0; // Expected: {'diff': 8672, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001110011110; b = 14'b01000110111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8672, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001100010000; b = 14'b01001000010011; bin = 1'b0; // Expected: {'diff': 4349, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001100010000; b = 14'b01001000010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4349, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00001100101110; b = 14'b10000110110110; bin = 1'b0; // Expected: {'diff': 8568, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00001100101110; b = 14'b10000110110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8568, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101111001100; b = 14'b11111100111001; bin = 1'b1; // Expected: {'diff': 11410, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101111001100; b = 14'b11111100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11410, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110100110111; b = 14'b01110001100010; bin = 1'b0; // Expected: {'diff': 8405, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110100110111; b = 14'b01110001100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8405, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001100110100; b = 14'b11001001011001; bin = 1'b0; // Expected: {'diff': 12507, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001100110100; b = 14'b11001001011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12507, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01100000110101; b = 14'b01111010010001; bin = 1'b0; // Expected: {'diff': 14756, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01100000110101; b = 14'b01111010010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14756, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000001100111; b = 14'b11000011111000; bin = 1'b0; // Expected: {'diff': 8047, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000001100111; b = 14'b11000011111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8047, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100010110100; b = 14'b10111011110011; bin = 1'b0; // Expected: {'diff': 6593, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100010110100; b = 14'b10111011110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6593, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101011010000; b = 14'b01101000101110; bin = 1'b1; // Expected: {'diff': 12449, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101011010000; b = 14'b01101000101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12449, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010111101010; b = 14'b01011001010101; bin = 1'b1; // Expected: {'diff': 8084, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010111101010; b = 14'b01011001010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8084, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10100011111110; b = 14'b11010000001101; bin = 1'b0; // Expected: {'diff': 13553, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10100011111110; b = 14'b11010000001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13553, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000001010110; b = 14'b10000000101110; bin = 1'b0; // Expected: {'diff': 12328, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000001010110; b = 14'b10000000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12328, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110000011111; b = 14'b01000000111101; bin = 1'b1; // Expected: {'diff': 3041, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110000011111; b = 14'b01000000111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3041, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11101010010010; b = 14'b00110011001110; bin = 1'b1; // Expected: {'diff': 11715, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11101010010010; b = 14'b00110011001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11715, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010010001101; b = 14'b10011011000111; bin = 1'b0; // Expected: {'diff': 11718, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010010001101; b = 14'b10011011000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11718, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101000110010; b = 14'b10000000110000; bin = 1'b0; // Expected: {'diff': 2562, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101000110010; b = 14'b10000000110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2562, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011010111000; b = 14'b01110010000011; bin = 1'b1; // Expected: {'diff': 2612, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011010111000; b = 14'b01110010000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2612, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011000001111; b = 14'b01101001010110; bin = 1'b1; // Expected: {'diff': 3000, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011000001111; b = 14'b01101001010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3000, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10001011100011; b = 14'b11010001001000; bin = 1'b0; // Expected: {'diff': 11931, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10001011100011; b = 14'b11010001001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11931, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011001000111; b = 14'b10101101001110; bin = 1'b0; // Expected: {'diff': 2809, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011001000111; b = 14'b10101101001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2809, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000011101000; b = 14'b00000111101111; bin = 1'b1; // Expected: {'diff': 16120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000011101000; b = 14'b00000111101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11110111101110; b = 14'b01100011010000; bin = 1'b0; // Expected: {'diff': 9502, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11110111101110; b = 14'b01100011010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9502, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100000111011; b = 14'b01011000110001; bin = 1'b0; // Expected: {'diff': 12810, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100000111011; b = 14'b01011000110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12810, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111000111011; b = 14'b10111000110111; bin = 1'b1; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111000111011; b = 14'b10111000110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110001101111; b = 14'b11101110101101; bin = 1'b0; // Expected: {'diff': 8386, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110001101111; b = 14'b11101110101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8386, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010001101001; b = 14'b01011001010010; bin = 1'b1; // Expected: {'diff': 15894, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010001101001; b = 14'b01011001010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15894, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01101011100001; b = 14'b00101110001101; bin = 1'b0; // Expected: {'diff': 3924, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01101011100001; b = 14'b00101110001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3924, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011111101000; b = 14'b10001011110110; bin = 1'b1; // Expected: {'diff': 9457, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011111101000; b = 14'b10001011110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9457, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11011110001000; b = 14'b10011011001101; bin = 1'b0; // Expected: {'diff': 4283, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11011110001000; b = 14'b10011011001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4283, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111110110000; b = 14'b10100001110000; bin = 1'b0; // Expected: {'diff': 10048, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111110110000; b = 14'b10100001110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10048, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
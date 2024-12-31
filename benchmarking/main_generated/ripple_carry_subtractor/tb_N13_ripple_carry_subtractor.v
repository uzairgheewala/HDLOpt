
`timescale 1ns / 1ps

module tb_N13_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 13;
    
     
    // Inputs
    
    reg  [12:0] a;
    
    reg  [12:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [12:0] diff;
    
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
        
        a = 13'b1110110111000; b = 13'b1110011001000; bin = 1'b1; // Expected: {'diff': 239, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110110111000; b = 13'b1110011001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 239, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111010011000; b = 13'b0000011000001; bin = 1'b1; // Expected: {'diff': 3542, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111010011000; b = 13'b0000011000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3542, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010000000100; b = 13'b1000100010111; bin = 1'b1; // Expected: {'diff': 748, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010000000100; b = 13'b1000100010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 748, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000011100100; b = 13'b1101101110010; bin = 1'b0; // Expected: {'diff': 1394, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000011100100; b = 13'b1101101110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1394, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010000101010; b = 13'b1101100010101; bin = 1'b1; // Expected: {'diff': 2324, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010000101010; b = 13'b1101100010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2324, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111000101100; b = 13'b0110011111111; bin = 1'b0; // Expected: {'diff': 301, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111000101100; b = 13'b0110011111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 301, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011011110100; b = 13'b0110100100110; bin = 1'b0; // Expected: {'diff': 2510, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011011110100; b = 13'b0110100100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2510, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111011011011; b = 13'b1000011001010; bin = 1'b0; // Expected: {'diff': 7697, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111011011011; b = 13'b1000011001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7697, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111101011101; b = 13'b1110001100010; bin = 1'b0; // Expected: {'diff': 4859, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111101011101; b = 13'b1110001100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4859, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101001011; b = 13'b0011010000100; bin = 1'b1; // Expected: {'diff': 3270, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101001011; b = 13'b0011010000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3270, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101010011010; b = 13'b1010010100110; bin = 1'b0; // Expected: {'diff': 5620, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101010011010; b = 13'b1010010100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5620, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111011111001; b = 13'b1010100111001; bin = 1'b1; // Expected: {'diff': 2495, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111011111001; b = 13'b1010100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2495, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101101100000; b = 13'b0110001110010; bin = 1'b1; // Expected: {'diff': 3821, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101101100000; b = 13'b0110001110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3821, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001001011; b = 13'b1001100001000; bin = 1'b1; // Expected: {'diff': 1346, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001001011; b = 13'b1001100001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1346, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001100010111; b = 13'b0011000010000; bin = 1'b1; // Expected: {'diff': 3334, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001100010111; b = 13'b0011000010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3334, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011111001000; b = 13'b1100000110010; bin = 1'b0; // Expected: {'diff': 3990, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011111001000; b = 13'b1100000110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3990, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010111000010; b = 13'b0110000000000; bin = 1'b0; // Expected: {'diff': 2498, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010111000010; b = 13'b0110000000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2498, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100100010000; b = 13'b1001110000010; bin = 1'b1; // Expected: {'diff': 1421, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100100010000; b = 13'b1001110000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1421, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001000111; b = 13'b0000101101111; bin = 1'b1; // Expected: {'diff': 5847, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001000111; b = 13'b0000101101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5847, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011000100110; b = 13'b0100111011010; bin = 1'b1; // Expected: {'diff': 7243, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011000100110; b = 13'b0100111011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7243, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100111111000; b = 13'b1101111000010; bin = 1'b0; // Expected: {'diff': 3638, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100111111000; b = 13'b1101111000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3638, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100010111100; b = 13'b0011111110101; bin = 1'b0; // Expected: {'diff': 4295, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100010111100; b = 13'b0011111110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4295, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000010000001; b = 13'b0000011100000; bin = 1'b1; // Expected: {'diff': 4000, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000010000001; b = 13'b0000011100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4000, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010010001110; b = 13'b1001111001000; bin = 1'b1; // Expected: {'diff': 4293, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010010001110; b = 13'b1001111001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4293, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110111011111; b = 13'b1110100110110; bin = 1'b0; // Expected: {'diff': 4265, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110111011111; b = 13'b1110100110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4265, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011101000010; b = 13'b0000111001100; bin = 1'b1; // Expected: {'diff': 5493, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011101000010; b = 13'b0000111001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5493, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001110110100; b = 13'b1110101011110; bin = 1'b0; // Expected: {'diff': 1622, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001110110100; b = 13'b1110101011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1622, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010011011100; b = 13'b0110100110010; bin = 1'b0; // Expected: {'diff': 1962, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010011011100; b = 13'b0110100110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1962, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000101010111; b = 13'b1110010011110; bin = 1'b0; // Expected: {'diff': 1209, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000101010111; b = 13'b1110010011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1209, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001010000111; b = 13'b1111011110011; bin = 1'b1; // Expected: {'diff': 5011, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001010000111; b = 13'b1111011110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5011, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101101001110; b = 13'b0110010110011; bin = 1'b0; // Expected: {'diff': 3739, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101101001110; b = 13'b0110010110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3739, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001001110000; b = 13'b0100010111111; bin = 1'b1; // Expected: {'diff': 6576, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001001110000; b = 13'b0100010111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6576, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100111110011; b = 13'b0011110101100; bin = 1'b0; // Expected: {'diff': 4679, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100111110011; b = 13'b0011110101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4679, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011100011011; b = 13'b1011010111111; bin = 1'b0; // Expected: {'diff': 4188, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011100011011; b = 13'b1011010111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4188, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110010100010; b = 13'b0101111100110; bin = 1'b0; // Expected: {'diff': 4284, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110010100010; b = 13'b0101111100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4284, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100101101010; b = 13'b1101010100000; bin = 1'b0; // Expected: {'diff': 7882, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100101101010; b = 13'b1101010100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7882, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111011100011; b = 13'b0010000111110; bin = 1'b1; // Expected: {'diff': 6820, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111011100011; b = 13'b0010000111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6820, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100010010111; b = 13'b1110101010000; bin = 1'b1; // Expected: {'diff': 6982, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100010010111; b = 13'b1110101010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6982, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111101111100; b = 13'b1111111100000; bin = 1'b0; // Expected: {'diff': 8092, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111101111100; b = 13'b1111111100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8092, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000001110001; b = 13'b1110011000001; bin = 1'b0; // Expected: {'diff': 5040, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000001110001; b = 13'b1110011000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5040, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000001000011; b = 13'b1100000000010; bin = 1'b0; // Expected: {'diff': 2113, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000001000011; b = 13'b1100000000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2113, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010111010100; b = 13'b0100100000111; bin = 1'b0; // Expected: {'diff': 3277, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010111010100; b = 13'b0100100000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3277, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100000011100; b = 13'b1001100110011; bin = 1'b1; // Expected: {'diff': 1256, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100000011100; b = 13'b1001100110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1256, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111111001110; b = 13'b1001000101000; bin = 1'b1; // Expected: {'diff': 3493, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111111001110; b = 13'b1001000101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3493, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010001110111; b = 13'b0001100010010; bin = 1'b0; // Expected: {'diff': 4453, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010001110111; b = 13'b0001100010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4453, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101100001001; b = 13'b1101001011010; bin = 1'b1; // Expected: {'diff': 174, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101100001001; b = 13'b1101001011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 174, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111100100100; b = 13'b1101000011001; bin = 1'b1; // Expected: {'diff': 1290, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111100100100; b = 13'b1101000011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1290, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101010010100; b = 13'b1000100001100; bin = 1'b1; // Expected: {'diff': 2439, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101010010100; b = 13'b1000100001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2439, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011101101101; b = 13'b0011111001101; bin = 1'b1; // Expected: {'diff': 3999, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011101101101; b = 13'b0011111001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3999, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011001101000; b = 13'b0011001001101; bin = 1'b0; // Expected: {'diff': 27, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011001101000; b = 13'b0011001001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101100100100; b = 13'b0101111000100; bin = 1'b0; // Expected: {'diff': 3936, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101100100100; b = 13'b0101111000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3936, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001111001010; b = 13'b1001011010111; bin = 1'b1; // Expected: {'diff': 4338, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001111001010; b = 13'b1001011010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4338, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010010110001; b = 13'b1101110110110; bin = 1'b1; // Expected: {'diff': 2298, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010010110001; b = 13'b1101110110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2298, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110100111011; b = 13'b1001111101100; bin = 1'b1; // Expected: {'diff': 6478, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110100111011; b = 13'b1001111101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6478, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100001111101; b = 13'b1111000000010; bin = 1'b0; // Expected: {'diff': 2683, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100001111101; b = 13'b1111000000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2683, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011000010000; b = 13'b1001100001100; bin = 1'b0; // Expected: {'diff': 4868, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011000010000; b = 13'b1001100001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4868, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010010100101; b = 13'b1110111001001; bin = 1'b0; // Expected: {'diff': 1756, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010010100101; b = 13'b1110111001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1756, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110001110000; b = 13'b0011101011110; bin = 1'b1; // Expected: {'diff': 1297, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110001110000; b = 13'b0011101011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1297, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010011111111; b = 13'b0111111111010; bin = 1'b1; // Expected: {'diff': 1284, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010011111111; b = 13'b0111111111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1284, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110000101101; b = 13'b0101100110000; bin = 1'b0; // Expected: {'diff': 253, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110000101101; b = 13'b0101100110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 253, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001001110; b = 13'b0011100110110; bin = 1'b1; // Expected: {'diff': 4375, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001001110; b = 13'b0011100110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4375, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010110000101; b = 13'b0111111011111; bin = 1'b1; // Expected: {'diff': 5541, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010110000101; b = 13'b0111111011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5541, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010010100000; b = 13'b1111001000010; bin = 1'b0; // Expected: {'diff': 1630, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010010100000; b = 13'b1111001000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1630, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110110000111; b = 13'b1110001010100; bin = 1'b1; // Expected: {'diff': 306, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110110000111; b = 13'b1110001010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 306, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110011000011; b = 13'b1111101110101; bin = 1'b1; // Expected: {'diff': 3405, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110011000011; b = 13'b1111101110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3405, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111111110101; b = 13'b1000010011010; bin = 1'b1; // Expected: {'diff': 3930, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111111110101; b = 13'b1000010011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3930, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011000110101; b = 13'b0110011011010; bin = 1'b0; // Expected: {'diff': 6491, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011000110101; b = 13'b0110011011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6491, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000100100110; b = 13'b0001000111110; bin = 1'b0; // Expected: {'diff': 7912, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000100100110; b = 13'b0001000111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7912, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111011111110; b = 13'b0010010101001; bin = 1'b0; // Expected: {'diff': 2645, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111011111110; b = 13'b0010010101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2645, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111110010101; b = 13'b0110011100110; bin = 1'b1; // Expected: {'diff': 4782, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111110010101; b = 13'b0110011100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4782, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111010011011; b = 13'b0010011011010; bin = 1'b1; // Expected: {'diff': 6592, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111010011011; b = 13'b0010011011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6592, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110101111111; b = 13'b0111000001111; bin = 1'b0; // Expected: {'diff': 8048, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110101111111; b = 13'b0111000001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8048, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110010110010; b = 13'b0011010110001; bin = 1'b0; // Expected: {'diff': 1537, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110010110010; b = 13'b0011010110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1537, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010001101101; b = 13'b0000010010111; bin = 1'b1; // Expected: {'diff': 5077, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010001101101; b = 13'b0000010010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5077, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100101010100; b = 13'b1111100010100; bin = 1'b0; // Expected: {'diff': 6720, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100101010100; b = 13'b1111100010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6720, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100011011010; b = 13'b1101011111001; bin = 1'b1; // Expected: {'diff': 7648, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100011011010; b = 13'b1101011111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7648, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010011111100; b = 13'b0110011010110; bin = 1'b0; // Expected: {'diff': 2086, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010011111100; b = 13'b0110011010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2086, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001110000000; b = 13'b0000011100101; bin = 1'b1; // Expected: {'diff': 4762, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001110000000; b = 13'b0000011100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4762, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111000001001; b = 13'b0111110111010; bin = 1'b0; // Expected: {'diff': 7759, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111000001001; b = 13'b0111110111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7759, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010010000111; b = 13'b0010010000110; bin = 1'b0; // Expected: {'diff': 4097, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010010000111; b = 13'b0010010000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4097, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010010110011; b = 13'b0111000001111; bin = 1'b1; // Expected: {'diff': 1699, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010010110011; b = 13'b0111000001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1699, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001100111100; b = 13'b1000011110101; bin = 1'b1; // Expected: {'diff': 582, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001100111100; b = 13'b1000011110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 582, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111001111011; b = 13'b0100111010111; bin = 1'b0; // Expected: {'diff': 5284, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111001111011; b = 13'b0100111010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5284, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111000001000; b = 13'b1011001000001; bin = 1'b0; // Expected: {'diff': 1991, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111000001000; b = 13'b1011001000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1991, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111010010010; b = 13'b1111100101010; bin = 1'b1; // Expected: {'diff': 3943, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111010010010; b = 13'b1111100101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3943, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110101010001; b = 13'b1110001101001; bin = 1'b1; // Expected: {'diff': 231, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110101010001; b = 13'b1110001101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 231, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100000000011; b = 13'b0101111111101; bin = 1'b0; // Expected: {'diff': 3078, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100000000011; b = 13'b0101111111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3078, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110000110001; b = 13'b0100111000111; bin = 1'b0; // Expected: {'diff': 4714, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110000110001; b = 13'b0100111000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4714, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110111111001; b = 13'b0001001101001; bin = 1'b0; // Expected: {'diff': 2960, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110111111001; b = 13'b0001001101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2960, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111101010011; b = 13'b0011100001000; bin = 1'b0; // Expected: {'diff': 2123, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111101010011; b = 13'b0011100001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2123, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100111110010; b = 13'b0101000100001; bin = 1'b0; // Expected: {'diff': 8145, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100111110010; b = 13'b0101000100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8145, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110110111001; b = 13'b1011110111110; bin = 1'b0; // Expected: {'diff': 1531, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110110111001; b = 13'b1011110111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1531, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100001100000; b = 13'b0110101011001; bin = 1'b1; // Expected: {'diff': 6918, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100001100000; b = 13'b0110101011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6918, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100110011000; b = 13'b1101001110010; bin = 1'b1; // Expected: {'diff': 3877, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100110011000; b = 13'b1101001110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3877, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111100101000; b = 13'b1001110000110; bin = 1'b1; // Expected: {'diff': 2977, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111100101000; b = 13'b1001110000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2977, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000001110001; b = 13'b0111110000000; bin = 1'b0; // Expected: {'diff': 241, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000001110001; b = 13'b0111110000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 241, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001010110010; b = 13'b0111010111001; bin = 1'b0; // Expected: {'diff': 1017, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001010110010; b = 13'b0111010111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1017, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010010100011; b = 13'b0010100100000; bin = 1'b0; // Expected: {'diff': 3971, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010010100011; b = 13'b0010100100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3971, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000011110010; b = 13'b1000111110000; bin = 1'b1; // Expected: {'diff': 3841, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000011110010; b = 13'b1000111110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3841, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111100111100; b = 13'b0011111010101; bin = 1'b1; // Expected: {'diff': 5990, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111100111100; b = 13'b0011111010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5990, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001010001011; b = 13'b0111001100000; bin = 1'b0; // Expected: {'diff': 1067, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001010001011; b = 13'b0111001100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1067, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100001101111; b = 13'b1100101001111; bin = 1'b0; // Expected: {'diff': 3872, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100001101111; b = 13'b1100101001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3872, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010111001011; b = 13'b0101110100111; bin = 1'b0; // Expected: {'diff': 6692, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010111001011; b = 13'b0101110100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6692, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001100000000; b = 13'b1011111100110; bin = 1'b1; // Expected: {'diff': 2841, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001100000000; b = 13'b1011111100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2841, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010011000110; b = 13'b0011110010011; bin = 1'b0; // Expected: {'diff': 3379, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010011000110; b = 13'b0011110010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3379, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101101010101; b = 13'b0110001000000; bin = 1'b1; // Expected: {'diff': 7956, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101101010101; b = 13'b0110001000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7956, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000001110010; b = 13'b1100000101110; bin = 1'b0; // Expected: {'diff': 6212, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000001110010; b = 13'b1100000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6212, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100011000110; b = 13'b1111010010010; bin = 1'b1; // Expected: {'diff': 6707, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100011000110; b = 13'b1111010010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6707, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100100100000; b = 13'b1010100110111; bin = 1'b1; // Expected: {'diff': 1000, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100100100000; b = 13'b1010100110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1000, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100001000010; b = 13'b1101000001101; bin = 1'b0; // Expected: {'diff': 3637, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100001000010; b = 13'b1101000001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3637, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000001101000; b = 13'b0110110000100; bin = 1'b0; // Expected: {'diff': 4836, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000001101000; b = 13'b0110110000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4836, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101000100100; b = 13'b1011101101010; bin = 1'b1; // Expected: {'diff': 697, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101000100100; b = 13'b1011101101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 697, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010010000001; b = 13'b0001011111111; bin = 1'b1; // Expected: {'diff': 4481, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010010000001; b = 13'b0001011111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4481, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101111101; b = 13'b0110110110010; bin = 1'b1; // Expected: {'diff': 1482, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101111101; b = 13'b0110110110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1482, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100100010101; b = 13'b0010010001110; bin = 1'b0; // Expected: {'diff': 5255, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100100010101; b = 13'b0010010001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5255, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110011010010; b = 13'b0000111100010; bin = 1'b1; // Expected: {'diff': 6895, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110011010010; b = 13'b0000111100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6895, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100010111100; b = 13'b1010111001100; bin = 1'b0; // Expected: {'diff': 4848, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100010111100; b = 13'b1010111001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4848, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000011011000; b = 13'b1011000000100; bin = 1'b1; // Expected: {'diff': 6867, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000011011000; b = 13'b1011000000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6867, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010001101101; b = 13'b1110001001010; bin = 1'b1; // Expected: {'diff': 6178, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010001101101; b = 13'b1110001001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6178, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111101000110; b = 13'b1001100000111; bin = 1'b1; // Expected: {'diff': 7230, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111101000110; b = 13'b1001100000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7230, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100111100000; b = 13'b1101111100000; bin = 1'b0; // Expected: {'diff': 7680, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100111100000; b = 13'b1101111100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7680, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101011010000; b = 13'b0000111000000; bin = 1'b0; // Expected: {'diff': 6416, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101011010000; b = 13'b0000111000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6416, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100010010111; b = 13'b0101100010001; bin = 1'b0; // Expected: {'diff': 7558, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100010010111; b = 13'b0101100010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7558, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000000000101; b = 13'b0101011101101; bin = 1'b1; // Expected: {'diff': 1303, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000000000101; b = 13'b0101011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1303, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100010111100; b = 13'b0101101100011; bin = 1'b1; // Expected: {'diff': 3416, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100010111100; b = 13'b0101101100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3416, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110111111101; b = 13'b1010010100111; bin = 1'b1; // Expected: {'diff': 6485, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110111111101; b = 13'b1010010100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6485, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101101010011; b = 13'b0111001000111; bin = 1'b0; // Expected: {'diff': 7436, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101101010011; b = 13'b0111001000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7436, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001110011001; b = 13'b1010100111111; bin = 1'b1; // Expected: {'diff': 7769, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001110011001; b = 13'b1010100111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7769, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110100001100; b = 13'b0110100001111; bin = 1'b1; // Expected: {'diff': 8188, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110100001100; b = 13'b0110100001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8188, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101110011; b = 13'b1000101111010; bin = 1'b1; // Expected: {'diff': 504, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101110011; b = 13'b1000101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 504, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000110110101; b = 13'b1011111100101; bin = 1'b0; // Expected: {'diff': 6608, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000110110101; b = 13'b1011111100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6608, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011011010110; b = 13'b0000011110111; bin = 1'b0; // Expected: {'diff': 1503, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011011010110; b = 13'b0000011110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1503, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100111111001; b = 13'b0011010100110; bin = 1'b0; // Expected: {'diff': 851, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100111111001; b = 13'b0011010100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 851, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110011011101; b = 13'b0000011100111; bin = 1'b1; // Expected: {'diff': 3061, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110011011101; b = 13'b0000011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3061, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111011100011; b = 13'b1111001001010; bin = 1'b0; // Expected: {'diff': 4249, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111011100011; b = 13'b1111001001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4249, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001001101011; b = 13'b1100011010100; bin = 1'b1; // Expected: {'diff': 2454, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001001101011; b = 13'b1100011010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2454, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011001111101; b = 13'b0111100011111; bin = 1'b0; // Expected: {'diff': 5982, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011001111101; b = 13'b0111100011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5982, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011000011011; b = 13'b1000001100000; bin = 1'b1; // Expected: {'diff': 1466, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011000011011; b = 13'b1000001100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1466, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101110110110; b = 13'b0000010110101; bin = 1'b0; // Expected: {'diff': 6913, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101110110110; b = 13'b0000010110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6913, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110110010000; b = 13'b1001011101101; bin = 1'b0; // Expected: {'diff': 2723, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110110010000; b = 13'b1001011101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2723, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000011010111; b = 13'b1101001111110; bin = 1'b1; // Expected: {'diff': 5720, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000011010111; b = 13'b1101001111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5720, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010000001001; b = 13'b1010111010111; bin = 1'b0; // Expected: {'diff': 7730, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010000001001; b = 13'b1010111010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7730, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001111010; b = 13'b1100101111100; bin = 1'b0; // Expected: {'diff': 7934, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001111010; b = 13'b1100101111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7934, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010110100011; b = 13'b0000011110011; bin = 1'b0; // Expected: {'diff': 5296, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010110100011; b = 13'b0000011110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5296, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000111000010; b = 13'b0111011010101; bin = 1'b1; // Expected: {'diff': 748, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000111000010; b = 13'b0111011010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 748, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100101001110; b = 13'b1110111101001; bin = 1'b0; // Expected: {'diff': 2917, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100101001110; b = 13'b1110111101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2917, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001000101111; b = 13'b0100010111110; bin = 1'b0; // Expected: {'diff': 6513, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001000101111; b = 13'b0100010111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6513, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111001110100; b = 13'b0101001010010; bin = 1'b1; // Expected: {'diff': 1057, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111001110100; b = 13'b0101001010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1057, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101010000011; b = 13'b1000000110100; bin = 1'b0; // Expected: {'diff': 6735, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101010000011; b = 13'b1000000110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6735, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100111011100; b = 13'b1101100010110; bin = 1'b1; // Expected: {'diff': 7877, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100111011100; b = 13'b1101100010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7877, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111010011001; b = 13'b0001001101111; bin = 1'b1; // Expected: {'diff': 7209, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111010011001; b = 13'b0001001101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7209, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001101101; b = 13'b1011110100110; bin = 1'b1; // Expected: {'diff': 198, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001101101; b = 13'b1011110100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 198, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100100011110; b = 13'b1011111000101; bin = 1'b0; // Expected: {'diff': 4441, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100100011110; b = 13'b1011111000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4441, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011110010010; b = 13'b1100111010001; bin = 1'b1; // Expected: {'diff': 7616, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011110010010; b = 13'b1100111010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7616, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011010011110; b = 13'b1010100000000; bin = 1'b1; // Expected: {'diff': 4509, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011010011110; b = 13'b1010100000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4509, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101000001011; b = 13'b0100000001100; bin = 1'b0; // Expected: {'diff': 511, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101000001011; b = 13'b0100000001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 511, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101010111111; b = 13'b1110000111111; bin = 1'b1; // Expected: {'diff': 7807, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101010111111; b = 13'b1110000111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7807, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111111111101; b = 13'b0101111110010; bin = 1'b1; // Expected: {'diff': 1034, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111111111101; b = 13'b0101111110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1034, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111001000011; b = 13'b0010000001000; bin = 1'b1; // Expected: {'diff': 2618, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111001000011; b = 13'b0010000001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2618, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111101101111; b = 13'b0111011100111; bin = 1'b1; // Expected: {'diff': 135, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111101101111; b = 13'b0111011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 135, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011101000111; b = 13'b1011011000101; bin = 1'b1; // Expected: {'diff': 129, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011101000111; b = 13'b1011011000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 129, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000011010101; b = 13'b0010001101011; bin = 1'b1; // Expected: {'diff': 3177, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000011010101; b = 13'b0010001101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3177, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111111000110; b = 13'b0110101111110; bin = 1'b1; // Expected: {'diff': 583, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111111000110; b = 13'b0110101111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 583, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011001000011; b = 13'b1010100010001; bin = 1'b0; // Expected: {'diff': 4402, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011001000011; b = 13'b1010100010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4402, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000011110100; b = 13'b0111110111000; bin = 1'b0; // Expected: {'diff': 316, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000011110100; b = 13'b0111110111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 316, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000101100011; b = 13'b1010010111101; bin = 1'b1; // Expected: {'diff': 3237, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000101100011; b = 13'b1010010111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3237, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110101010101; b = 13'b1000111000110; bin = 1'b0; // Expected: {'diff': 2959, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110101010101; b = 13'b1000111000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2959, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011100010010; b = 13'b0001101011100; bin = 1'b1; // Expected: {'diff': 949, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011100010010; b = 13'b0001101011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 949, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000100010110; b = 13'b1101100100110; bin = 1'b1; // Expected: {'diff': 5615, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000100010110; b = 13'b1101100100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5615, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101101101110; b = 13'b1000100011101; bin = 1'b0; // Expected: {'diff': 6737, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101101101110; b = 13'b1000100011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6737, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011010010111; b = 13'b1100100011010; bin = 1'b0; // Expected: {'diff': 7549, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011010010111; b = 13'b1100100011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7549, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000110000101; b = 13'b0001101110011; bin = 1'b0; // Expected: {'diff': 3602, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000110000101; b = 13'b0001101110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3602, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101011110010; b = 13'b1111011000001; bin = 1'b1; // Expected: {'diff': 7216, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101011110010; b = 13'b1111011000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7216, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001111011011; b = 13'b1110010000101; bin = 1'b1; // Expected: {'diff': 1877, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001111011011; b = 13'b1110010000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1877, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101100111111; b = 13'b0111110010000; bin = 1'b0; // Expected: {'diff': 7087, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101100111111; b = 13'b0111110010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7087, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010010011110; b = 13'b1011000111011; bin = 1'b1; // Expected: {'diff': 7778, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010010011110; b = 13'b1011000111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7778, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001100100111; b = 13'b0001010010010; bin = 1'b0; // Expected: {'diff': 4245, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001100100111; b = 13'b0001010010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4245, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110010110010; b = 13'b0001010011001; bin = 1'b1; // Expected: {'diff': 2584, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110010110010; b = 13'b0001010011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2584, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001111001100; b = 13'b1001111101001; bin = 1'b1; // Expected: {'diff': 4066, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001111001100; b = 13'b1001111101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4066, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000110101010; b = 13'b1000111110000; bin = 1'b1; // Expected: {'diff': 8121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000110101010; b = 13'b1000111110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001100100011; b = 13'b1001110101010; bin = 1'b1; // Expected: {'diff': 3960, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001100100011; b = 13'b1001110101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3960, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100000010001; b = 13'b0011010101111; bin = 1'b1; // Expected: {'diff': 353, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100000010001; b = 13'b0011010101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 353, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001100110101; b = 13'b1111000000010; bin = 1'b1; // Expected: {'diff': 5426, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001100110101; b = 13'b1111000000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5426, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010011100100; b = 13'b0110101100111; bin = 1'b0; // Expected: {'diff': 6013, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010011100100; b = 13'b0110101100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6013, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000111110101; b = 13'b0101101000001; bin = 1'b0; // Expected: {'diff': 1716, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000111110101; b = 13'b0101101000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1716, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011110001101; b = 13'b0111000010101; bin = 1'b0; // Expected: {'diff': 2424, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011110001101; b = 13'b0111000010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2424, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101100101010; b = 13'b0111000111010; bin = 1'b1; // Expected: {'diff': 7407, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101100101010; b = 13'b0111000111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7407, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101010000011; b = 13'b1111100101111; bin = 1'b0; // Expected: {'diff': 6996, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101010000011; b = 13'b1111100101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6996, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011010001010; b = 13'b0111001010111; bin = 1'b0; // Expected: {'diff': 6195, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011010001010; b = 13'b0111001010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6195, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001011010010; b = 13'b1110000100111; bin = 1'b0; // Expected: {'diff': 5803, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001011010010; b = 13'b1110000100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5803, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010010011111; b = 13'b1010111100100; bin = 1'b1; // Expected: {'diff': 3770, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010010011111; b = 13'b1010111100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3770, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111001100100; b = 13'b0011011100010; bin = 1'b1; // Expected: {'diff': 1921, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111001100100; b = 13'b0011011100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1921, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001101111100; b = 13'b0011000001010; bin = 1'b1; // Expected: {'diff': 7537, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001101111100; b = 13'b0011000001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7537, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010011001011; b = 13'b1011001000000; bin = 1'b0; // Expected: {'diff': 7819, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010011001011; b = 13'b1011001000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7819, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101110101; b = 13'b1010101000100; bin = 1'b0; // Expected: {'diff': 7729, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101110101; b = 13'b1010101000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7729, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001001000100; b = 13'b0100011111100; bin = 1'b0; // Expected: {'diff': 6472, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001001000100; b = 13'b0100011111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6472, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010000100011; b = 13'b0110101110001; bin = 1'b0; // Expected: {'diff': 5810, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010000100011; b = 13'b0110101110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5810, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111101100010; b = 13'b1001001100011; bin = 1'b0; // Expected: {'diff': 7423, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111101100010; b = 13'b1001001100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7423, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100100011001; b = 13'b1001000011010; bin = 1'b0; // Expected: {'diff': 1791, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100100011001; b = 13'b1001000011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1791, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111111111000; b = 13'b0010111111001; bin = 1'b1; // Expected: {'diff': 6654, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111111111000; b = 13'b0010111111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6654, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101010001000; b = 13'b1011001010011; bin = 1'b1; // Expected: {'diff': 1076, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101010001000; b = 13'b1011001010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1076, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100010101011; b = 13'b1110100000001; bin = 1'b0; // Expected: {'diff': 7082, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100010101011; b = 13'b1110100000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7082, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000111100110; b = 13'b0101000010101; bin = 1'b0; // Expected: {'diff': 2001, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000111100110; b = 13'b0101000010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2001, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101111100110; b = 13'b1000111000011; bin = 1'b1; // Expected: {'diff': 6690, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101111100110; b = 13'b1000111000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6690, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000111011010; b = 13'b1101110100000; bin = 1'b0; // Expected: {'diff': 5690, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000111011010; b = 13'b1101110100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5690, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110110000010; b = 13'b0001100011001; bin = 1'b0; // Expected: {'diff': 2665, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110110000010; b = 13'b0001100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2665, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011100100010; b = 13'b1100100010100; bin = 1'b0; // Expected: {'diff': 3598, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011100100010; b = 13'b1100100010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3598, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110111111101; b = 13'b0001111111001; bin = 1'b1; // Expected: {'diff': 2563, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110111111101; b = 13'b0001111111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2563, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110111101111; b = 13'b0100011110010; bin = 1'b1; // Expected: {'diff': 1276, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110111101111; b = 13'b0100011110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1276, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110101100100; b = 13'b1000100110101; bin = 1'b1; // Expected: {'diff': 7214, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110101100100; b = 13'b1000100110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7214, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011101010010; b = 13'b1101100101110; bin = 1'b1; // Expected: {'diff': 3107, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011101010010; b = 13'b1101100101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3107, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010010111000; b = 13'b0110011110011; bin = 1'b1; // Expected: {'diff': 1988, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010010111000; b = 13'b0110011110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1988, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100011011100; b = 13'b0100011110101; bin = 1'b1; // Expected: {'diff': 8166, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100011011100; b = 13'b0100011110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8166, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100010100100; b = 13'b1100111001000; bin = 1'b1; // Expected: {'diff': 3803, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100010100100; b = 13'b1100111001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3803, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001011110; b = 13'b1000101111010; bin = 1'b1; // Expected: {'diff': 1763, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001011110; b = 13'b1000101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1763, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001000111101; b = 13'b1100110111111; bin = 1'b0; // Expected: {'diff': 2174, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001000111101; b = 13'b1100110111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2174, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000101000001; b = 13'b0010000100110; bin = 1'b1; // Expected: {'diff': 3354, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000101000001; b = 13'b0010000100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3354, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001001001110; b = 13'b1100110100010; bin = 1'b1; // Expected: {'diff': 2219, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001001001110; b = 13'b1100110100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2219, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011101100110; b = 13'b1111100100101; bin = 1'b0; // Expected: {'diff': 2113, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011101100110; b = 13'b1111100100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2113, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010000110001; b = 13'b0100100101011; bin = 1'b0; // Expected: {'diff': 2822, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010000110001; b = 13'b0100100101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2822, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001001000011; b = 13'b1001110100100; bin = 1'b0; // Expected: {'diff': 7839, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001001000011; b = 13'b1001110100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7839, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110001010011; b = 13'b0010001110011; bin = 1'b1; // Expected: {'diff': 6111, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110001010011; b = 13'b0010001110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6111, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110010111001; b = 13'b0101110111100; bin = 1'b1; // Expected: {'diff': 4348, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110010111001; b = 13'b0101110111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4348, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110010100001; b = 13'b0010111111100; bin = 1'b1; // Expected: {'diff': 5796, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110010100001; b = 13'b0010111111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5796, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101000100101; b = 13'b0101001101010; bin = 1'b1; // Expected: {'diff': 4026, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101000100101; b = 13'b0101001101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4026, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001010001011; b = 13'b0100101110111; bin = 1'b1; // Expected: {'diff': 2323, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001010001011; b = 13'b0100101110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2323, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111000011111; b = 13'b0101000110011; bin = 1'b0; // Expected: {'diff': 1004, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111000011111; b = 13'b0101000110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1004, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010101110000; b = 13'b0010101100100; bin = 1'b1; // Expected: {'diff': 11, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010101110000; b = 13'b0010101100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010111111101; b = 13'b1101100100000; bin = 1'b0; // Expected: {'diff': 6877, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010111111101; b = 13'b1101100100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6877, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100101101111; b = 13'b1100010101100; bin = 1'b0; // Expected: {'diff': 4291, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100101101111; b = 13'b1100010101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4291, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101000001100; b = 13'b0011001001011; bin = 1'b0; // Expected: {'diff': 961, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101000001100; b = 13'b0011001001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 961, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101011110000; b = 13'b0000010101010; bin = 1'b0; // Expected: {'diff': 6726, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101011110000; b = 13'b0000010101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6726, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011011111101; b = 13'b0100011100001; bin = 1'b1; // Expected: {'diff': 7707, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011011111101; b = 13'b0100011100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7707, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010001000001; b = 13'b0111001111000; bin = 1'b0; // Expected: {'diff': 1481, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010001000001; b = 13'b0111001111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1481, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011011001101; b = 13'b0010101001100; bin = 1'b0; // Expected: {'diff': 385, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011011001101; b = 13'b0010101001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 385, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011101001001; b = 13'b1010111001101; bin = 1'b0; // Expected: {'diff': 4476, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011101001001; b = 13'b1010111001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4476, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111110011111; b = 13'b0101110010110; bin = 1'b1; // Expected: {'diff': 5128, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111110011111; b = 13'b0101110010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5128, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011110001111; b = 13'b0011011100011; bin = 1'b1; // Expected: {'diff': 4267, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011110001111; b = 13'b0011011100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4267, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000010111000; b = 13'b1000011110110; bin = 1'b0; // Expected: {'diff': 8130, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000010111000; b = 13'b1000011110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8130, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010110100100; b = 13'b0000011100010; bin = 1'b0; // Expected: {'diff': 5314, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010110100100; b = 13'b0000011100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5314, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100100101110; b = 13'b0110000110111; bin = 1'b0; // Expected: {'diff': 3319, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100100101110; b = 13'b0110000110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3319, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110000011110; b = 13'b0111111101101; bin = 1'b1; // Expected: {'diff': 3120, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110000011110; b = 13'b0111111101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3120, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000111110001; b = 13'b0111011111010; bin = 1'b0; // Expected: {'diff': 4855, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000111110001; b = 13'b0111011111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4855, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110101011111; b = 13'b0111110000110; bin = 1'b0; // Expected: {'diff': 7641, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110101011111; b = 13'b0111110000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7641, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001011101000; b = 13'b0111001011111; bin = 1'b1; // Expected: {'diff': 5256, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001011101000; b = 13'b0111001011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5256, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011000000101; b = 13'b0000101010011; bin = 1'b0; // Expected: {'diff': 1202, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011000000101; b = 13'b0000101010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1202, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011110011011; b = 13'b0101000001100; bin = 1'b0; // Expected: {'diff': 3471, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011110011011; b = 13'b0101000001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3471, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100000110110; b = 13'b0101101101100; bin = 1'b1; // Expected: {'diff': 3273, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100000110110; b = 13'b0101101101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3273, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000010000011; b = 13'b0011110000100; bin = 1'b0; // Expected: {'diff': 2303, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000010000011; b = 13'b0011110000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2303, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100000110110; b = 13'b0001001011111; bin = 1'b0; // Expected: {'diff': 1495, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100000110110; b = 13'b0001001011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1495, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101100010001; b = 13'b0001000101101; bin = 1'b1; // Expected: {'diff': 6371, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101100010001; b = 13'b0001000101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6371, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101010100011; b = 13'b0000001100001; bin = 1'b0; // Expected: {'diff': 2626, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101010100011; b = 13'b0000001100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2626, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001110010; b = 13'b0111000000101; bin = 1'b1; // Expected: {'diff': 2668, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001110010; b = 13'b0111000000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2668, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010100101110; b = 13'b0011100110010; bin = 1'b1; // Expected: {'diff': 7675, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010100101110; b = 13'b0011100110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7675, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111000110111; b = 13'b1001010001111; bin = 1'b1; // Expected: {'diff': 2983, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111000110111; b = 13'b1001010001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2983, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010000100101; b = 13'b0100000010001; bin = 1'b0; // Expected: {'diff': 3092, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010000100101; b = 13'b0100000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3092, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101011110001; b = 13'b0000111010111; bin = 1'b1; // Expected: {'diff': 2329, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101011110001; b = 13'b0000111010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2329, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000000010110; b = 13'b1100010101100; bin = 1'b1; // Expected: {'diff': 5993, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000000010110; b = 13'b1100010101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5993, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010000110110; b = 13'b0111110100101; bin = 1'b1; // Expected: {'diff': 1168, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010000110110; b = 13'b0111110100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1168, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000110010011; b = 13'b1001100011010; bin = 1'b1; // Expected: {'diff': 3704, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000110010011; b = 13'b1001100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3704, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110111110100; b = 13'b1111001101110; bin = 1'b0; // Expected: {'diff': 3974, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110111110100; b = 13'b1111001101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3974, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001010001; b = 13'b1000001010000; bin = 1'b1; // Expected: {'diff': 2048, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001010001; b = 13'b1000001010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2048, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111100101101; b = 13'b1101110010011; bin = 1'b1; // Expected: {'diff': 5017, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111100101101; b = 13'b1101110010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5017, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100110000010; b = 13'b0110011100101; bin = 1'b1; // Expected: {'diff': 3228, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100110000010; b = 13'b0110011100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3228, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001000111111; b = 13'b0011101100110; bin = 1'b1; // Expected: {'diff': 2776, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001000111111; b = 13'b0011101100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2776, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101111100110; b = 13'b0000110000011; bin = 1'b0; // Expected: {'diff': 6755, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101111100110; b = 13'b0000110000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6755, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101110011; b = 13'b0010010100001; bin = 1'b1; // Expected: {'diff': 3793, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101110011; b = 13'b0010010100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3793, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101111111100; b = 13'b1000101001010; bin = 1'b1; // Expected: {'diff': 2737, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101111111100; b = 13'b1000101001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2737, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010101001101; b = 13'b1100101011101; bin = 1'b0; // Expected: {'diff': 3056, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010101001101; b = 13'b1100101011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3056, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001111100100; b = 13'b0110100111110; bin = 1'b0; // Expected: {'diff': 1702, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001111100100; b = 13'b0110100111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1702, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001001101; b = 13'b1000000100000; bin = 1'b0; // Expected: {'diff': 2093, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001001101; b = 13'b1000000100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2093, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011000110001; b = 13'b1011100100011; bin = 1'b0; // Expected: {'diff': 7950, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011000110001; b = 13'b1011100100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7950, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010000101100; b = 13'b1101011111000; bin = 1'b1; // Expected: {'diff': 2355, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010000101100; b = 13'b1101011111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2355, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110011101110; b = 13'b0101011101101; bin = 1'b1; // Expected: {'diff': 4608, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110011101110; b = 13'b0101011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4608, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111101100100; b = 13'b1000101110100; bin = 1'b1; // Expected: {'diff': 7663, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111101100100; b = 13'b1000101110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7663, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110101100100; b = 13'b1110000111111; bin = 1'b0; // Expected: {'diff': 4389, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110101100100; b = 13'b1110000111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4389, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100000010000; b = 13'b0111110010000; bin = 1'b0; // Expected: {'diff': 6272, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100000010000; b = 13'b0111110010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6272, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110011001000; b = 13'b0101110011011; bin = 1'b1; // Expected: {'diff': 4396, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110011001000; b = 13'b0101110011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4396, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111010001011; b = 13'b1111001011001; bin = 1'b0; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111010001011; b = 13'b1111001011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001001110011; b = 13'b0111010010100; bin = 1'b1; // Expected: {'diff': 5086, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001001110011; b = 13'b0111010010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5086, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000000000001; b = 13'b1100111011111; bin = 1'b1; // Expected: {'diff': 5665, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000000000001; b = 13'b1100111011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5665, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011010000101; b = 13'b1100000011001; bin = 1'b0; // Expected: {'diff': 7788, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011010000101; b = 13'b1100000011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7788, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000011110100; b = 13'b1000011001111; bin = 1'b1; // Expected: {'diff': 36, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000011110100; b = 13'b1000011001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110100000110; b = 13'b1110110010010; bin = 1'b1; // Expected: {'diff': 3955, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110100000110; b = 13'b1110110010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3955, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010100011011; b = 13'b0111001011000; bin = 1'b0; // Expected: {'diff': 1731, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010100011011; b = 13'b0111001011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1731, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101010100110; b = 13'b0101011011100; bin = 1'b0; // Expected: {'diff': 4042, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101010100110; b = 13'b0101011011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4042, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011111000101; b = 13'b1100100100100; bin = 1'b1; // Expected: {'diff': 3744, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011111000101; b = 13'b1100100100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3744, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100011000010; b = 13'b0100010000101; bin = 1'b0; // Expected: {'diff': 61, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100011000010; b = 13'b0100010000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110111110011; b = 13'b0000111111000; bin = 1'b0; // Expected: {'diff': 3067, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110111110011; b = 13'b0000111111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3067, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110110010000; b = 13'b0000110001100; bin = 1'b1; // Expected: {'diff': 3075, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110110010000; b = 13'b0000110001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3075, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111010101010; b = 13'b1011111011101; bin = 1'b1; // Expected: {'diff': 1740, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111010101010; b = 13'b1011111011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1740, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101111110001; b = 13'b0101010111101; bin = 1'b0; // Expected: {'diff': 4404, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101111110001; b = 13'b0101010111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4404, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101100111010; b = 13'b1101000001010; bin = 1'b0; // Expected: {'diff': 304, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101100111010; b = 13'b1101000001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 304, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111010000001; b = 13'b1111101001011; bin = 1'b0; // Expected: {'diff': 7990, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111010000001; b = 13'b1111101001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7990, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111011111010; b = 13'b1010001011011; bin = 1'b0; // Expected: {'diff': 2719, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111011111010; b = 13'b1010001011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2719, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110111000001; b = 13'b0110000001010; bin = 1'b0; // Expected: {'diff': 439, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110111000001; b = 13'b0110000001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 439, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001010001110; b = 13'b0010110110111; bin = 1'b0; // Expected: {'diff': 7383, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001010001110; b = 13'b0010110110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7383, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110000111100; b = 13'b1000110101111; bin = 1'b1; // Expected: {'diff': 2700, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110000111100; b = 13'b1000110101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2700, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100011110100; b = 13'b0111010001010; bin = 1'b0; // Expected: {'diff': 6762, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100011110100; b = 13'b0111010001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6762, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110011111001; b = 13'b0000110110001; bin = 1'b1; // Expected: {'diff': 6983, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110011111001; b = 13'b0000110110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6983, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101100111100; b = 13'b1010001001010; bin = 1'b1; // Expected: {'diff': 1777, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101100111100; b = 13'b1010001001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1777, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110010101110; b = 13'b0110101110001; bin = 1'b0; // Expected: {'diff': 3901, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110010101110; b = 13'b0110101110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3901, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111100001100; b = 13'b1001011100100; bin = 1'b1; // Expected: {'diff': 7207, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111100001100; b = 13'b1001011100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7207, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000010001110; b = 13'b0001010000100; bin = 1'b1; // Expected: {'diff': 3593, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000010001110; b = 13'b0001010000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3593, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101100100111; b = 13'b0111110110001; bin = 1'b1; // Expected: {'diff': 2933, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101100100111; b = 13'b0111110110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2933, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101010010; b = 13'b1011110011011; bin = 1'b1; // Expected: {'diff': 7094, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101010010; b = 13'b1011110011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7094, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111001110010; b = 13'b0101010101001; bin = 1'b0; // Expected: {'diff': 969, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111001110010; b = 13'b0101010101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 969, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111011111110; b = 13'b1001110100001; bin = 1'b0; // Expected: {'diff': 7005, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111011111110; b = 13'b1001110100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7005, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111011001010; b = 13'b1101000010001; bin = 1'b0; // Expected: {'diff': 1209, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111011001010; b = 13'b1101000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1209, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110110010001; b = 13'b0111001101101; bin = 1'b1; // Expected: {'diff': 7971, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110110010001; b = 13'b0111001101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7971, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011111111001; b = 13'b1001100001010; bin = 1'b0; // Expected: {'diff': 1263, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011111111001; b = 13'b1001100001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1263, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100010001100; b = 13'b0011000100100; bin = 1'b0; // Expected: {'diff': 4712, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100010001100; b = 13'b0011000100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4712, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000011000000; b = 13'b0111101100100; bin = 1'b1; // Expected: {'diff': 4443, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000011000000; b = 13'b0111101100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4443, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010110100001; b = 13'b1101101011100; bin = 1'b0; // Expected: {'diff': 2629, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010110100001; b = 13'b1101101011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2629, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000101101011; b = 13'b1001110111010; bin = 1'b1; // Expected: {'diff': 3504, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000101101011; b = 13'b1001110111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3504, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111111100111; b = 13'b0001000101110; bin = 1'b1; // Expected: {'diff': 3512, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111111100111; b = 13'b0001000101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3512, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100011010111; b = 13'b0000000011110; bin = 1'b1; // Expected: {'diff': 6328, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100011010111; b = 13'b0000000011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6328, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101000000000; b = 13'b1101101101000; bin = 1'b1; // Expected: {'diff': 3735, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101000000000; b = 13'b1101101101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3735, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100001110000; b = 13'b0000001111011; bin = 1'b1; // Expected: {'diff': 6132, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100001110000; b = 13'b0000001111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6132, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010111011000; b = 13'b0000100010001; bin = 1'b0; // Expected: {'diff': 1223, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010111011000; b = 13'b0000100010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1223, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110101111011; b = 13'b0011011010001; bin = 1'b0; // Expected: {'diff': 5802, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110101111011; b = 13'b0011011010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5802, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101010110011; b = 13'b0110110100100; bin = 1'b1; // Expected: {'diff': 3342, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101010110011; b = 13'b0110110100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3342, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001001010001; b = 13'b1011110101101; bin = 1'b0; // Expected: {'diff': 6820, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001001010001; b = 13'b1011110101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6820, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010001111010; b = 13'b0001010000100; bin = 1'b1; // Expected: {'diff': 501, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010001111010; b = 13'b0001010000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 501, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101001000001; b = 13'b0001001111100; bin = 1'b1; // Expected: {'diff': 6084, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101001000001; b = 13'b0001001111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6084, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001101001011; b = 13'b1100001000000; bin = 1'b0; // Expected: {'diff': 2827, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001101001011; b = 13'b1100001000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2827, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001110110011; b = 13'b0101010101111; bin = 1'b0; // Expected: {'diff': 6404, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001110110011; b = 13'b0101010101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6404, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111011011000; b = 13'b0000110010000; bin = 1'b1; // Expected: {'diff': 7495, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111011011000; b = 13'b0000110010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7495, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100101000010; b = 13'b1001011100110; bin = 1'b0; // Expected: {'diff': 5724, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100101000010; b = 13'b1001011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5724, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101010110; b = 13'b1000011100000; bin = 1'b0; // Expected: {'diff': 630, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101010110; b = 13'b1000011100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 630, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100111100010; b = 13'b1101010010110; bin = 1'b0; // Expected: {'diff': 3916, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100111100010; b = 13'b1101010010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3916, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001010101100; b = 13'b0001101001011; bin = 1'b0; // Expected: {'diff': 8033, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001010101100; b = 13'b0001101001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8033, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111011010100; b = 13'b0101000101011; bin = 1'b0; // Expected: {'diff': 5289, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111011010100; b = 13'b0101000101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5289, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011100010000; b = 13'b1101101100110; bin = 1'b0; // Expected: {'diff': 7082, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011100010000; b = 13'b1101101100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7082, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011010111010; b = 13'b1010100010011; bin = 1'b0; // Expected: {'diff': 423, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011010111010; b = 13'b1010100010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 423, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010100011000; b = 13'b1100000000100; bin = 1'b1; // Expected: {'diff': 7443, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010100011000; b = 13'b1100000000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7443, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100001011011; b = 13'b0101011110010; bin = 1'b0; // Expected: {'diff': 7529, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100001011011; b = 13'b0101011110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7529, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011001000111; b = 13'b1111110101111; bin = 1'b1; // Expected: {'diff': 5783, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011001000111; b = 13'b1111110101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5783, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000100111010; b = 13'b1000010011111; bin = 1'b0; // Expected: {'diff': 4251, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000100111010; b = 13'b1000010011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4251, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001110100100; b = 13'b1100110101000; bin = 1'b1; // Expected: {'diff': 6651, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001110100100; b = 13'b1100110101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6651, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101000011; b = 13'b0111010010111; bin = 1'b0; // Expected: {'diff': 1196, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101000011; b = 13'b0111010010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1196, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000011000010; b = 13'b0100011000011; bin = 1'b1; // Expected: {'diff': 6142, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000011000010; b = 13'b0100011000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6142, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111001110100; b = 13'b1100000001110; bin = 1'b1; // Expected: {'diff': 1637, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111001110100; b = 13'b1100000001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1637, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001001101110; b = 13'b0110000010000; bin = 1'b1; // Expected: {'diff': 5725, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001001101110; b = 13'b0110000010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5725, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000100001101; b = 13'b1010101100010; bin = 1'b0; // Expected: {'diff': 2987, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000100001101; b = 13'b1010101100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2987, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011111101110; b = 13'b0001010110011; bin = 1'b1; // Expected: {'diff': 1338, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011111101110; b = 13'b0001010110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1338, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011111100000; b = 13'b0111110010010; bin = 1'b1; // Expected: {'diff': 6221, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011111100000; b = 13'b0111110010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6221, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011000001010; b = 13'b1100001000111; bin = 1'b0; // Expected: {'diff': 3523, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011000001010; b = 13'b1100001000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3523, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111111111110; b = 13'b1100000110011; bin = 1'b1; // Expected: {'diff': 6090, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111111111110; b = 13'b1100000110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6090, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101011000001; b = 13'b0110011100111; bin = 1'b1; // Expected: {'diff': 3545, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101011000001; b = 13'b0110011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3545, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010101100001; b = 13'b0110110111101; bin = 1'b0; // Expected: {'diff': 6052, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010101100001; b = 13'b0110110111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6052, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000010110100; b = 13'b0110111111110; bin = 1'b1; // Expected: {'diff': 693, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000010110100; b = 13'b0110111111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 693, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010000101101; b = 13'b1000000110010; bin = 1'b0; // Expected: {'diff': 1019, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010000101101; b = 13'b1000000110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1019, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010110110000; b = 13'b0100101110110; bin = 1'b1; // Expected: {'diff': 7225, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010110110000; b = 13'b0100101110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7225, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001011110111; b = 13'b0101100010001; bin = 1'b0; // Expected: {'diff': 2022, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001011110111; b = 13'b0101100010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2022, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000001010001; b = 13'b0010111001111; bin = 1'b1; // Expected: {'diff': 2689, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000001010001; b = 13'b0010111001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2689, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110010011100; b = 13'b1011110010000; bin = 1'b1; // Expected: {'diff': 5387, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110010011100; b = 13'b1011110010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5387, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001101111111; b = 13'b1011100011001; bin = 1'b0; // Expected: {'diff': 3174, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001101111111; b = 13'b1011100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3174, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101010000011; b = 13'b1000000001010; bin = 1'b1; // Expected: {'diff': 6776, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101010000011; b = 13'b1000000001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6776, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101111110001; b = 13'b0001010100110; bin = 1'b0; // Expected: {'diff': 6475, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101111110001; b = 13'b0001010100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6475, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010000010000; b = 13'b1011001001011; bin = 1'b0; // Expected: {'diff': 7621, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010000010000; b = 13'b1011001001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7621, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110101101110; b = 13'b0101001011100; bin = 1'b1; // Expected: {'diff': 785, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110101101110; b = 13'b0101001011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 785, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101100111; b = 13'b1011001110001; bin = 1'b1; // Expected: {'diff': 7413, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101100111; b = 13'b1011001110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7413, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111111010110; b = 13'b0011110000000; bin = 1'b1; // Expected: {'diff': 2133, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111111010110; b = 13'b0011110000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2133, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101011000000; b = 13'b0000011111011; bin = 1'b1; // Expected: {'diff': 2500, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101011000000; b = 13'b0000011111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2500, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110011111110; b = 13'b1011111101011; bin = 1'b0; // Expected: {'diff': 5395, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110011111110; b = 13'b1011111101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5395, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010101011000; b = 13'b1111011001110; bin = 1'b0; // Expected: {'diff': 1674, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010101011000; b = 13'b1111011001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1674, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000100111011; b = 13'b1110111000111; bin = 1'b0; // Expected: {'diff': 884, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000100111011; b = 13'b1110111000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 884, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100000001111; b = 13'b0000101110010; bin = 1'b1; // Expected: {'diff': 5788, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100000001111; b = 13'b0000101110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5788, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110000010010; b = 13'b1010010011111; bin = 1'b1; // Expected: {'diff': 1906, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110000010010; b = 13'b1010010011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1906, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101101001010; b = 13'b1000011001100; bin = 1'b1; // Expected: {'diff': 2685, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101101001010; b = 13'b1000011001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2685, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111110011000; b = 13'b1000010001111; bin = 1'b1; // Expected: {'diff': 7944, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111110011000; b = 13'b1000010001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7944, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010111110100; b = 13'b0000001001010; bin = 1'b0; // Expected: {'diff': 5546, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010111110100; b = 13'b0000001001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5546, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001111011101; b = 13'b0101000000111; bin = 1'b0; // Expected: {'diff': 6614, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001111011101; b = 13'b0101000000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6614, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010111100010; b = 13'b1001001111011; bin = 1'b0; // Expected: {'diff': 871, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010111100010; b = 13'b1001001111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 871, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000100100010; b = 13'b1010111000100; bin = 1'b1; // Expected: {'diff': 2909, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000100100010; b = 13'b1010111000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2909, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000011111010; b = 13'b1111101011010; bin = 1'b0; // Expected: {'diff': 416, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000011111010; b = 13'b1111101011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 416, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111101001110; b = 13'b1101010101011; bin = 1'b0; // Expected: {'diff': 5283, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111101001110; b = 13'b1101010101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5283, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110000001101; b = 13'b0101110001101; bin = 1'b0; // Expected: {'diff': 128, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110000001101; b = 13'b0101110001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 128, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111111010111; b = 13'b1101011000100; bin = 1'b1; // Expected: {'diff': 5394, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111111010111; b = 13'b1101011000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5394, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010101001100; b = 13'b0010011110000; bin = 1'b1; // Expected: {'diff': 4187, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010101001100; b = 13'b0010011110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4187, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001110110001; b = 13'b0110110001001; bin = 1'b0; // Expected: {'diff': 5672, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001110110001; b = 13'b0110110001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5672, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010110010100; b = 13'b0111000101111; bin = 1'b0; // Expected: {'diff': 5989, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010110010100; b = 13'b0111000101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5989, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000111001110; b = 13'b1111010011111; bin = 1'b1; // Expected: {'diff': 814, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000111001110; b = 13'b1111010011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 814, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100110111100; b = 13'b1010110101001; bin = 1'b0; // Expected: {'diff': 5139, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100110111100; b = 13'b1010110101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5139, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001011001101; b = 13'b1101010001010; bin = 1'b1; // Expected: {'diff': 6210, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001011001101; b = 13'b1101010001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6210, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111001111110; b = 13'b1000100110001; bin = 1'b0; // Expected: {'diff': 3405, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111001111110; b = 13'b1000100110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3405, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001100111111; b = 13'b1110011100110; bin = 1'b1; // Expected: {'diff': 1624, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001100111111; b = 13'b1110011100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1624, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011011101111; b = 13'b0101101000010; bin = 1'b0; // Expected: {'diff': 2989, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011011101111; b = 13'b0101101000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2989, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011101110101; b = 13'b1001010010110; bin = 1'b1; // Expected: {'diff': 1246, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011101110101; b = 13'b1001010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1246, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001010001110; b = 13'b0101010110010; bin = 1'b0; // Expected: {'diff': 6108, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001010001110; b = 13'b0101010110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100111101000; b = 13'b1011101111001; bin = 1'b0; // Expected: {'diff': 4719, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100111101000; b = 13'b1011101111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4719, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000100110010; b = 13'b0101000111000; bin = 1'b0; // Expected: {'diff': 1786, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000100110010; b = 13'b0101000111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1786, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111001010110; b = 13'b1010001011001; bin = 1'b0; // Expected: {'diff': 6653, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111001010110; b = 13'b1010001011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6653, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000010100111; b = 13'b0101111110010; bin = 1'b0; // Expected: {'diff': 5301, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000010100111; b = 13'b0101111110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5301, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011110001011; b = 13'b1000100100000; bin = 1'b0; // Expected: {'diff': 1643, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011110001011; b = 13'b1000100100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1643, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111101000010; b = 13'b0001111000110; bin = 1'b0; // Expected: {'diff': 7036, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111101000010; b = 13'b0001111000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7036, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111010100011; b = 13'b0110111010111; bin = 1'b1; // Expected: {'diff': 4299, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111010100011; b = 13'b0110111010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4299, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101101010111; b = 13'b0000011001100; bin = 1'b0; // Expected: {'diff': 6795, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101101010111; b = 13'b0000011001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6795, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010011011101; b = 13'b1100101101110; bin = 1'b0; // Expected: {'diff': 2927, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010011011101; b = 13'b1100101101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2927, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101010100000; b = 13'b1111111111111; bin = 1'b0; // Expected: {'diff': 6817, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101010100000; b = 13'b1111111111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6817, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111010001001; b = 13'b1110101001010; bin = 1'b1; // Expected: {'diff': 4414, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111010001001; b = 13'b1110101001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4414, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010101110001; b = 13'b0000000010001; bin = 1'b0; // Expected: {'diff': 5472, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010101110001; b = 13'b0000000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5472, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001111000011; b = 13'b0010011011100; bin = 1'b0; // Expected: {'diff': 7911, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001111000011; b = 13'b0010011011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7911, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110100100011; b = 13'b1111100101010; bin = 1'b0; // Expected: {'diff': 7673, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110100100011; b = 13'b1111100101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7673, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011111110011; b = 13'b1010000101000; bin = 1'b1; // Expected: {'diff': 5066, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011111110011; b = 13'b1010000101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5066, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110010101101; b = 13'b1001000111110; bin = 1'b0; // Expected: {'diff': 6767, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110010101101; b = 13'b1001000111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6767, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000010010011; b = 13'b1001111100101; bin = 1'b1; // Expected: {'diff': 7341, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000010010011; b = 13'b1001111100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7341, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110010011100; b = 13'b0000111100010; bin = 1'b0; // Expected: {'diff': 6842, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110010011100; b = 13'b0000111100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6842, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000100101010; b = 13'b1010010000100; bin = 1'b0; // Expected: {'diff': 7334, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000100101010; b = 13'b1010010000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7334, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101111111011; b = 13'b1101110101010; bin = 1'b0; // Expected: {'diff': 81, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101111111011; b = 13'b1101110101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 81, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100111000000; b = 13'b0110101110100; bin = 1'b0; // Expected: {'diff': 3148, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100111000000; b = 13'b0110101110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3148, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011111000100; b = 13'b1111100000011; bin = 1'b1; // Expected: {'diff': 6336, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011111000100; b = 13'b1111100000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6336, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010101101101; b = 13'b0110101101010; bin = 1'b1; // Expected: {'diff': 6146, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010101101101; b = 13'b0110101101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6146, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100110010101; b = 13'b1010000001000; bin = 1'b1; // Expected: {'diff': 1420, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100110010101; b = 13'b1010000001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1420, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010101101000; b = 13'b0110111010100; bin = 1'b0; // Expected: {'diff': 6036, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010101101000; b = 13'b0110111010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6036, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101110110001; b = 13'b1000001000001; bin = 1'b0; // Expected: {'diff': 2928, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101110110001; b = 13'b1000001000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2928, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011111010000; b = 13'b0110000111011; bin = 1'b1; // Expected: {'diff': 7060, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011111010000; b = 13'b0110000111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7060, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011001100100; b = 13'b1000011101101; bin = 1'b1; // Expected: {'diff': 1398, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011001100100; b = 13'b1000011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1398, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001001010101; b = 13'b1001101110010; bin = 1'b1; // Expected: {'diff': 7906, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001001010101; b = 13'b1001101110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7906, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011100001000; b = 13'b0110010011101; bin = 1'b0; // Expected: {'diff': 2667, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011100001000; b = 13'b0110010011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2667, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010110111001; b = 13'b0010011011111; bin = 1'b0; // Expected: {'diff': 218, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010110111001; b = 13'b0010011011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 218, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001100111010; b = 13'b0001001111110; bin = 1'b0; // Expected: {'diff': 4284, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001100111010; b = 13'b0001001111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4284, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110010101000; b = 13'b1100001100111; bin = 1'b0; // Expected: {'diff': 1089, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110010101000; b = 13'b1100001100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1089, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100100101100; b = 13'b1011000111001; bin = 1'b0; // Expected: {'diff': 4851, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100100101100; b = 13'b1011000111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4851, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001110100000; b = 13'b1010101111001; bin = 1'b0; // Expected: {'diff': 3623, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001110100000; b = 13'b1010101111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3623, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010110110111; b = 13'b1100100100010; bin = 1'b0; // Expected: {'diff': 3221, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010110110111; b = 13'b1100100100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3221, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101001000110; b = 13'b0101001100000; bin = 1'b1; // Expected: {'diff': 4069, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101001000110; b = 13'b0101001100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4069, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101101100011; b = 13'b1100001110110; bin = 1'b0; // Expected: {'diff': 749, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101101100011; b = 13'b1100001110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 749, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100010100111; b = 13'b0101011110111; bin = 1'b1; // Expected: {'diff': 7599, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100010100111; b = 13'b0101011110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7599, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000000001000; b = 13'b1000110001001; bin = 1'b1; // Expected: {'diff': 7806, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000000001000; b = 13'b1000110001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7806, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110111100100; b = 13'b0010011010001; bin = 1'b0; // Expected: {'diff': 6419, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110111100100; b = 13'b0010011010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6419, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011011100110; b = 13'b1110011010001; bin = 1'b1; // Expected: {'diff': 6676, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011011100110; b = 13'b1110011010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6676, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110100001001; b = 13'b1000000110000; bin = 1'b1; // Expected: {'diff': 7384, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110100001001; b = 13'b1000000110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7384, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011001111100; b = 13'b1110000011111; bin = 1'b0; // Expected: {'diff': 6749, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011001111100; b = 13'b1110000011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6749, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011110001111; b = 13'b1000100110011; bin = 1'b0; // Expected: {'diff': 1628, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011110001111; b = 13'b1000100110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1628, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111100101010; b = 13'b1100001101101; bin = 1'b0; // Expected: {'diff': 5821, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111100101010; b = 13'b1100001101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5821, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011101100100; b = 13'b1000110010000; bin = 1'b0; // Expected: {'diff': 5588, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011101100100; b = 13'b1000110010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5588, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011100111100; b = 13'b1010011111110; bin = 1'b1; // Expected: {'diff': 4669, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011100111100; b = 13'b1010011111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4669, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001100010001; b = 13'b0101000011001; bin = 1'b0; // Expected: {'diff': 6392, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001100010001; b = 13'b0101000011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6392, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110011011111; b = 13'b1010011100110; bin = 1'b0; // Expected: {'diff': 6137, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110011011111; b = 13'b1010011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6137, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001001000101; b = 13'b0010101100111; bin = 1'b0; // Expected: {'diff': 3294, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001001000101; b = 13'b0010101100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3294, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111101000000; b = 13'b0110000000011; bin = 1'b0; // Expected: {'diff': 4925, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111101000000; b = 13'b0110000000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4925, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011111010001; b = 13'b1000010110000; bin = 1'b1; // Expected: {'diff': 1824, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011111010001; b = 13'b1000010110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1824, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011000010111; b = 13'b0001011010001; bin = 1'b1; // Expected: {'diff': 4933, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011000010111; b = 13'b0001011010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4933, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000000011000; b = 13'b1010100110010; bin = 1'b0; // Expected: {'diff': 2790, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000000011000; b = 13'b1010100110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2790, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011111111001; b = 13'b1111101000010; bin = 1'b1; // Expected: {'diff': 2230, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011111111001; b = 13'b1111101000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2230, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010010001101; b = 13'b0101111101011; bin = 1'b1; // Expected: {'diff': 2209, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010010001101; b = 13'b0101111101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2209, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110100001011; b = 13'b1000000011011; bin = 1'b0; // Expected: {'diff': 3312, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110100001011; b = 13'b1000000011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3312, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000110110000; b = 13'b1110010001011; bin = 1'b1; // Expected: {'diff': 5412, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000110110000; b = 13'b1110010001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5412, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110000001000; b = 13'b1000000100011; bin = 1'b0; // Expected: {'diff': 7141, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110000001000; b = 13'b1000000100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7141, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011010100100; b = 13'b1001011100110; bin = 1'b0; // Expected: {'diff': 958, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011010100100; b = 13'b1001011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 958, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100110101110; b = 13'b0000111110000; bin = 1'b0; // Expected: {'diff': 1982, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100110101110; b = 13'b0000111110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1982, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000101110000; b = 13'b0111111001001; bin = 1'b1; // Expected: {'diff': 422, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000101110000; b = 13'b0111111001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 422, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010001000010; b = 13'b1011010110110; bin = 1'b0; // Expected: {'diff': 3468, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010001000010; b = 13'b1011010110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3468, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111001001101; b = 13'b1000010010110; bin = 1'b1; // Expected: {'diff': 3510, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111001001101; b = 13'b1000010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3510, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010110110011; b = 13'b0011101000101; bin = 1'b0; // Expected: {'diff': 7790, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010110110011; b = 13'b0011101000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7790, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001010110011; b = 13'b0110001100111; bin = 1'b1; // Expected: {'diff': 5707, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001010110011; b = 13'b0110001100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5707, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110100010011; b = 13'b1010111100111; bin = 1'b1; // Expected: {'diff': 1835, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110100010011; b = 13'b1010111100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1835, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010100010101; b = 13'b1100111101010; bin = 1'b1; // Expected: {'diff': 2858, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010100010101; b = 13'b1100111101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2858, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000010000010; b = 13'b1110000110101; bin = 1'b1; // Expected: {'diff': 1100, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000010000010; b = 13'b1110000110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1100, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000101001011; b = 13'b0100100111111; bin = 1'b0; // Expected: {'diff': 6156, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000101001011; b = 13'b0100100111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6156, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001010110001; b = 13'b1001001000001; bin = 1'b1; // Expected: {'diff': 111, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001010110001; b = 13'b1001001000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 111, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100000101001; b = 13'b1010001110010; bin = 1'b0; // Expected: {'diff': 951, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100000101001; b = 13'b1010001110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 951, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100110111011; b = 13'b1010010101101; bin = 1'b0; // Expected: {'diff': 5390, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100110111011; b = 13'b1010010101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5390, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010101100011; b = 13'b0110101111011; bin = 1'b1; // Expected: {'diff': 2023, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010101100011; b = 13'b0110101111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2023, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110110100000; b = 13'b1100000101100; bin = 1'b1; // Expected: {'diff': 1395, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110110100000; b = 13'b1100000101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1395, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001100011001; b = 13'b1000111010010; bin = 1'b1; // Expected: {'diff': 326, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001100011001; b = 13'b1000111010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 326, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011010111111; b = 13'b1001011000111; bin = 1'b0; // Expected: {'diff': 5112, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011010111111; b = 13'b1001011000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5112, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000100111010; b = 13'b0100011001100; bin = 1'b1; // Expected: {'diff': 6253, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000100111010; b = 13'b0100011001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6253, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011100110000; b = 13'b1001110000010; bin = 1'b1; // Expected: {'diff': 941, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011100110000; b = 13'b1001110000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 941, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010111110110; b = 13'b0110110001110; bin = 1'b0; // Expected: {'diff': 2152, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010111110110; b = 13'b0110110001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2152, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111000010000; b = 13'b1111110111110; bin = 1'b1; // Expected: {'diff': 3665, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111000010000; b = 13'b1111110111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3665, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101101000101; b = 13'b1111011001110; bin = 1'b0; // Expected: {'diff': 7287, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101101000101; b = 13'b1111011001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7287, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111111111110; b = 13'b0110000011011; bin = 1'b1; // Expected: {'diff': 994, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111111111110; b = 13'b0110000011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 994, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110100000011; b = 13'b0011000111001; bin = 1'b0; // Expected: {'diff': 1738, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110100000011; b = 13'b0011000111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1738, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110010000100; b = 13'b1001010101000; bin = 1'b0; // Expected: {'diff': 6620, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110010000100; b = 13'b1001010101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6620, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101111100001; b = 13'b0111011010111; bin = 1'b0; // Expected: {'diff': 7434, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101111100001; b = 13'b0111011010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7434, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101110011111; b = 13'b1111011100110; bin = 1'b1; // Expected: {'diff': 3256, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101110011111; b = 13'b1111011100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3256, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011110000000; b = 13'b0101111001000; bin = 1'b1; // Expected: {'diff': 2999, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011110000000; b = 13'b0101111001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2999, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011001100100; b = 13'b0101011010010; bin = 1'b1; // Expected: {'diff': 7057, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011001100100; b = 13'b0101011010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7057, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000001111010; b = 13'b1011101011011; bin = 1'b0; // Expected: {'diff': 6431, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000001111010; b = 13'b1011101011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6431, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110001110010; b = 13'b1111010001101; bin = 1'b0; // Expected: {'diff': 7653, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110001110010; b = 13'b1111010001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7653, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011110000110; b = 13'b1010010001110; bin = 1'b1; // Expected: {'diff': 759, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011110000110; b = 13'b1010010001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 759, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010001100001; b = 13'b1011101111010; bin = 1'b0; // Expected: {'diff': 7399, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010001100001; b = 13'b1011101111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7399, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111101101101; b = 13'b1000001110000; bin = 1'b1; // Expected: {'diff': 7932, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111101101101; b = 13'b1000001110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7932, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111101101101; b = 13'b1110000100110; bin = 1'b1; // Expected: {'diff': 838, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111101101101; b = 13'b1110000100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 838, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001001001111; b = 13'b1011101010000; bin = 1'b0; // Expected: {'diff': 2815, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001001001111; b = 13'b1011101010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2815, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100011111011; b = 13'b1110101010001; bin = 1'b0; // Expected: {'diff': 7082, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100011111011; b = 13'b1110101010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7082, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110010100110; b = 13'b1111111101100; bin = 1'b1; // Expected: {'diff': 7353, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110010100110; b = 13'b1111111101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7353, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110101010101; b = 13'b0100011010111; bin = 1'b1; // Expected: {'diff': 1149, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110101010101; b = 13'b0100011010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1149, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011100111100; b = 13'b0100110011100; bin = 1'b1; // Expected: {'diff': 3487, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011100111100; b = 13'b0100110011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3487, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100000000010; b = 13'b1101000010010; bin = 1'b1; // Expected: {'diff': 7663, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100000000010; b = 13'b1101000010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7663, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001100111001; b = 13'b1100011101011; bin = 1'b0; // Expected: {'diff': 2638, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001100111001; b = 13'b1100011101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2638, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011011011101; b = 13'b1011010011111; bin = 1'b0; // Expected: {'diff': 4158, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011011011101; b = 13'b1011010011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4158, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010000110100; b = 13'b1011100100100; bin = 1'b1; // Expected: {'diff': 3343, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010000110100; b = 13'b1011100100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3343, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010000010101; b = 13'b0111000100110; bin = 1'b0; // Expected: {'diff': 5615, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010000010101; b = 13'b0111000100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5615, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011000100111; b = 13'b0001101010001; bin = 1'b0; // Expected: {'diff': 4822, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011000100111; b = 13'b0001101010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4822, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010110110010; b = 13'b1011000101110; bin = 1'b1; // Expected: {'diff': 8067, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010110110010; b = 13'b1011000101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8067, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101111101101; b = 13'b1101010111001; bin = 1'b1; // Expected: {'diff': 307, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101111101101; b = 13'b1101010111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 307, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001111100000; b = 13'b1101100101100; bin = 1'b1; // Expected: {'diff': 6323, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001111100000; b = 13'b1101100101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6323, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010000111110; b = 13'b0110000010100; bin = 1'b0; // Expected: {'diff': 6186, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010000111110; b = 13'b0110000010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6186, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001001001111; b = 13'b0110001010011; bin = 1'b1; // Expected: {'diff': 1531, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001001001111; b = 13'b0110001010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1531, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111010111110; b = 13'b0100000000011; bin = 1'b1; // Expected: {'diff': 1722, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111010111110; b = 13'b0100000000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1722, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111110101111; b = 13'b1001100001110; bin = 1'b0; // Expected: {'diff': 7329, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111110101111; b = 13'b1001100001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7329, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001001111101; b = 13'b0101110010110; bin = 1'b0; // Expected: {'diff': 1767, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001001111101; b = 13'b0101110010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1767, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110001100111; b = 13'b1011111010011; bin = 1'b1; // Expected: {'diff': 5267, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110001100111; b = 13'b1011111010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5267, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010011100000; b = 13'b1001110101111; bin = 1'b0; // Expected: {'diff': 305, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010011100000; b = 13'b1001110101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 305, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000100001100; b = 13'b1001000001001; bin = 1'b0; // Expected: {'diff': 7939, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000100001100; b = 13'b1001000001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7939, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010010010100; b = 13'b0100011011000; bin = 1'b1; // Expected: {'diff': 7099, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010010010100; b = 13'b0100011011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7099, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100010001100; b = 13'b1111001000101; bin = 1'b0; // Expected: {'diff': 2631, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100010001100; b = 13'b1111001000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2631, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101001011010; b = 13'b1101010101001; bin = 1'b1; // Expected: {'diff': 4016, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101001011010; b = 13'b1101010101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4016, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011100000010; b = 13'b1100110010000; bin = 1'b0; // Expected: {'diff': 3442, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011100000010; b = 13'b1100110010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3442, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010100010101; b = 13'b1101110000010; bin = 1'b1; // Expected: {'diff': 6546, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010100010101; b = 13'b1101110000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6546, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001001100110; b = 13'b0001101101111; bin = 1'b0; // Expected: {'diff': 3831, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001001100110; b = 13'b0001101101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3831, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101000100001; b = 13'b1100001101001; bin = 1'b0; // Expected: {'diff': 4536, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101000100001; b = 13'b1100001101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4536, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010000011110; b = 13'b1110000000010; bin = 1'b0; // Expected: {'diff': 6172, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010000011110; b = 13'b1110000000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6172, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100011100111; b = 13'b0100001010010; bin = 1'b1; // Expected: {'diff': 148, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100011100111; b = 13'b0100001010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 148, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000000100000; b = 13'b1110000110000; bin = 1'b1; // Expected: {'diff': 5103, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000000100000; b = 13'b1110000110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5103, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100000001111; b = 13'b1101000110110; bin = 1'b1; // Expected: {'diff': 7640, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100000001111; b = 13'b1101000110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7640, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110011010011; b = 13'b1011111011110; bin = 1'b0; // Expected: {'diff': 1269, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110011010011; b = 13'b1011111011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1269, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111010010100; b = 13'b0111111101010; bin = 1'b1; // Expected: {'diff': 3753, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111010010100; b = 13'b0111111101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3753, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001010111011; b = 13'b1001001110110; bin = 1'b0; // Expected: {'diff': 4165, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001010111011; b = 13'b1001001110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4165, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011011111011; b = 13'b1000110111101; bin = 1'b1; // Expected: {'diff': 1341, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011011111011; b = 13'b1000110111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1341, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110000100111; b = 13'b0000111000011; bin = 1'b1; // Expected: {'diff': 6755, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110000100111; b = 13'b0000111000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6755, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011000110111; b = 13'b1001011110110; bin = 1'b0; // Expected: {'diff': 4929, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011000110111; b = 13'b1001011110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4929, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000110000001; b = 13'b0011100100000; bin = 1'b1; // Expected: {'diff': 6752, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000110000001; b = 13'b0011100100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6752, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000100100111; b = 13'b1010011111001; bin = 1'b1; // Expected: {'diff': 3117, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000100100111; b = 13'b1010011111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3117, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100110100111; b = 13'b1111001100100; bin = 1'b1; // Expected: {'diff': 2882, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100110100111; b = 13'b1111001100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2882, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000011100101; b = 13'b1100111000001; bin = 1'b0; // Expected: {'diff': 1828, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000011100101; b = 13'b1100111000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1828, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001100111111; b = 13'b0101000111100; bin = 1'b0; // Expected: {'diff': 6403, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001100111111; b = 13'b0101000111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6403, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011001001100; b = 13'b0000011110110; bin = 1'b1; // Expected: {'diff': 1365, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011001001100; b = 13'b0000011110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1365, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101101101011; b = 13'b1110010001100; bin = 1'b1; // Expected: {'diff': 3806, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101101101011; b = 13'b1110010001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3806, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001111011000; b = 13'b0001111100110; bin = 1'b1; // Expected: {'diff': 8177, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001111011000; b = 13'b0001111100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8177, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010010000000; b = 13'b1110110110010; bin = 1'b1; // Expected: {'diff': 5837, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010010000000; b = 13'b1110110110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5837, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101100011101; b = 13'b0000101010100; bin = 1'b1; // Expected: {'diff': 6600, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101100011101; b = 13'b0000101010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6600, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001000101011; b = 13'b1001101100111; bin = 1'b0; // Expected: {'diff': 3780, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001000101011; b = 13'b1001101100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3780, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010010100000; b = 13'b1110101101111; bin = 1'b0; // Expected: {'diff': 1841, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010010100000; b = 13'b1110101101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1841, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010101101001; b = 13'b1010100010001; bin = 1'b0; // Expected: {'diff': 4184, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010101101001; b = 13'b1010100010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4184, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010011110011; b = 13'b1101001100101; bin = 1'b0; // Expected: {'diff': 6798, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010011110011; b = 13'b1101001100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6798, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111011010101; b = 13'b1001101001101; bin = 1'b0; // Expected: {'diff': 7048, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111011010101; b = 13'b1001101001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7048, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111110011000; b = 13'b1001011000110; bin = 1'b1; // Expected: {'diff': 3281, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111110011000; b = 13'b1001011000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3281, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110110110010; b = 13'b0010000110011; bin = 1'b1; // Expected: {'diff': 2430, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110110110010; b = 13'b0010000110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2430, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111100011110; b = 13'b1010110101011; bin = 1'b0; // Expected: {'diff': 6515, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111100011110; b = 13'b1010110101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6515, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111100110101; b = 13'b1101101100101; bin = 1'b0; // Expected: {'diff': 976, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111100110101; b = 13'b1101101100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 976, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100000110000; b = 13'b0110010100001; bin = 1'b0; // Expected: {'diff': 2959, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100000110000; b = 13'b0110010100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2959, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010000011011; b = 13'b1000101110011; bin = 1'b1; // Expected: {'diff': 4775, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010000011011; b = 13'b1000101110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4775, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011110100101; b = 13'b0010110111010; bin = 1'b1; // Expected: {'diff': 490, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011110100101; b = 13'b0010110111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 490, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100011110101; b = 13'b1011000100000; bin = 1'b1; // Expected: {'diff': 4820, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100011110101; b = 13'b1011000100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4820, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001000010101; b = 13'b0110101001001; bin = 1'b0; // Expected: {'diff': 5324, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001000010101; b = 13'b0110101001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5324, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101110011011; b = 13'b0010101011010; bin = 1'b0; // Expected: {'diff': 1601, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101110011011; b = 13'b0010101011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1601, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010111000000; b = 13'b0000000010011; bin = 1'b1; // Expected: {'diff': 1452, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010111000000; b = 13'b0000000010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1452, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1001101010010; b = 13'b0101000101101; bin = 1'b0; // Expected: {'diff': 2341, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1001101010010; b = 13'b0101000101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2341, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111000110110; b = 13'b0101011010100; bin = 1'b1; // Expected: {'diff': 865, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111000110110; b = 13'b0101011010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 865, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101000101010; b = 13'b1000000011001; bin = 1'b0; // Expected: {'diff': 2577, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101000101010; b = 13'b1000000011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2577, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100110011010; b = 13'b0101111001011; bin = 1'b1; // Expected: {'diff': 3534, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100110011010; b = 13'b0101111001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3534, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010100110000; b = 13'b1010001001111; bin = 1'b0; // Expected: {'diff': 225, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010100110000; b = 13'b1010001001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 225, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110000010010; b = 13'b1111111000110; bin = 1'b0; // Expected: {'diff': 7244, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110000010010; b = 13'b1111111000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7244, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110111000000; b = 13'b1110110110010; bin = 1'b1; // Expected: {'diff': 4109, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110111000000; b = 13'b1110110110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4109, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1000011101101; b = 13'b0000010011011; bin = 1'b0; // Expected: {'diff': 4178, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000011101101; b = 13'b0000010011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4178, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1101100110111; b = 13'b1010111011111; bin = 1'b0; // Expected: {'diff': 1368, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1101100110111; b = 13'b1010111011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1368, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
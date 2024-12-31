
`timescale 1ns / 1ps

module tb_N16_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 16;
    
     
    // Inputs
    
    reg  [15:0] a;
    
    reg  [15:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [15:0] diff;
    
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
        
        a = 16'b1001101100110100; b = 16'b0000100011111111; bin = 1'b1; // Expected: {'diff': 37428, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001101100110100; b = 16'b0000100011111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37428, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001000111001110; b = 16'b1101010010101100; bin = 1'b1; // Expected: {'diff': 15649, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001000111001110; b = 16'b1101010010101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15649, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110101010010110; b = 16'b1111000100001010; bin = 1'b1; // Expected: {'diff': 63883, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110101010010110; b = 16'b1111000100001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63883, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101110000110; b = 16'b1001010100111000; bin = 1'b0; // Expected: {'diff': 34382, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101110000110; b = 16'b1001010100111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34382, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010000000111000; b = 16'b1000110001110000; bin = 1'b1; // Expected: {'diff': 5063, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010000000111000; b = 16'b1000110001110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5063, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101000000000001; b = 16'b1100101011001000; bin = 1'b0; // Expected: {'diff': 34105, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101000000000001; b = 16'b1100101011001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34105, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011111001111111; b = 16'b1101011010110010; bin = 1'b1; // Expected: {'diff': 26572, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011111001111111; b = 16'b1101011010110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26572, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011001101000101; b = 16'b1001110000011101; bin = 1'b0; // Expected: {'diff': 5928, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011001101000101; b = 16'b1001110000011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5928, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010011111100010; b = 16'b1100000001000100; bin = 1'b1; // Expected: {'diff': 59293, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010011111100010; b = 16'b1100000001000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59293, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001111010000010; b = 16'b1101110111001111; bin = 1'b0; // Expected: {'diff': 49331, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001111010000010; b = 16'b1101110111001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49331, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000100100100111; b = 16'b1000111100110011; bin = 1'b1; // Expected: {'diff': 31219, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000100100100111; b = 16'b1000111100110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31219, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110010001010001; b = 16'b0001011000000101; bin = 1'b0; // Expected: {'diff': 52812, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110010001010001; b = 16'b0001011000000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52812, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011000010010011; b = 16'b1101111000011000; bin = 1'b0; // Expected: {'diff': 21115, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011000010010011; b = 16'b1101111000011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21115, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001000110001000; b = 16'b1011101011011011; bin = 1'b0; // Expected: {'diff': 22189, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001000110001000; b = 16'b1011101011011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22189, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111010101111; b = 16'b1011000101111011; bin = 1'b1; // Expected: {'diff': 23859, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111010101111; b = 16'b1011000101111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23859, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100111000110101; b = 16'b0001100100100101; bin = 1'b1; // Expected: {'diff': 13583, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100111000110101; b = 16'b0001100100100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13583, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011011111000110; b = 16'b1011100001110000; bin = 1'b0; // Expected: {'diff': 65366, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011011111000110; b = 16'b1011100001110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65366, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000011011011101; b = 16'b1000100000010111; bin = 1'b1; // Expected: {'diff': 65221, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000011011011101; b = 16'b1000100000010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65221, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011110011110101; b = 16'b0001100001001111; bin = 1'b1; // Expected: {'diff': 9381, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011110011110101; b = 16'b0001100001001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9381, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110000000100100; b = 16'b0110100110101000; bin = 1'b0; // Expected: {'diff': 30332, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110000000100100; b = 16'b0110100110101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30332, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011110111101001; b = 16'b1010011000111001; bin = 1'b1; // Expected: {'diff': 38831, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011110111101001; b = 16'b1010011000111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 38831, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011010010010000; b = 16'b1101101011001100; bin = 1'b0; // Expected: {'diff': 55748, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011010010010000; b = 16'b1101101011001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55748, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111000001101000; b = 16'b0000000011101101; bin = 1'b0; // Expected: {'diff': 61307, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111000001101000; b = 16'b0000000011101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61307, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001000100100001; b = 16'b0000110000101111; bin = 1'b1; // Expected: {'diff': 34033, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001000100100001; b = 16'b0000110000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34033, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111111101000110; b = 16'b0011010010001111; bin = 1'b1; // Expected: {'diff': 19126, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111111101000110; b = 16'b0011010010001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19126, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010110000001011; b = 16'b1001101101110011; bin = 1'b0; // Expected: {'diff': 37016, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010110000001011; b = 16'b1001101101110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37016, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100100100011001; b = 16'b1001000101010001; bin = 1'b0; // Expected: {'diff': 14280, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100100100011001; b = 16'b1001000101010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14280, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011110100011101; b = 16'b0000101011010000; bin = 1'b1; // Expected: {'diff': 45644, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011110100011101; b = 16'b0000101011010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45644, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001001010100110; b = 16'b0011111011101001; bin = 1'b1; // Expected: {'diff': 21436, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001001010100110; b = 16'b0011111011101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21436, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111011110001010; b = 16'b1100011001010100; bin = 1'b0; // Expected: {'diff': 12598, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111011110001010; b = 16'b1100011001010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12598, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110111000000010; b = 16'b0101001001001111; bin = 1'b1; // Expected: {'diff': 7090, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110111000000010; b = 16'b0101001001001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7090, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110101111110111; b = 16'b1011101011111101; bin = 1'b0; // Expected: {'diff': 45306, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110101111110111; b = 16'b1011101011111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45306, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111100000011110; b = 16'b0100011110011101; bin = 1'b1; // Expected: {'diff': 12416, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111100000011110; b = 16'b0100011110011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12416, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101010111110010; b = 16'b0011001000101011; bin = 1'b1; // Expected: {'diff': 41926, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101010111110010; b = 16'b0011001000101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41926, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011000010111111; b = 16'b1010011010001111; bin = 1'b1; // Expected: {'diff': 2607, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011000010111111; b = 16'b1010011010001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2607, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000110101001101; b = 16'b0111001111110111; bin = 1'b0; // Expected: {'diff': 39254, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000110101001101; b = 16'b0111001111110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39254, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000010100001000; b = 16'b0000101001110000; bin = 1'b0; // Expected: {'diff': 31384, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000010100001000; b = 16'b0000101001110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31384, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101101000010000; b = 16'b1110000100001011; bin = 1'b0; // Expected: {'diff': 30981, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101101000010000; b = 16'b1110000100001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30981, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111011011010110; b = 16'b0101001101010001; bin = 1'b0; // Expected: {'diff': 41861, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111011011010110; b = 16'b0101001101010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41861, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100111010011000; b = 16'b1000011010000111; bin = 1'b1; // Expected: {'diff': 51216, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100111010011000; b = 16'b1000011010000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51216, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111010001011011; b = 16'b1000001010001111; bin = 1'b0; // Expected: {'diff': 29132, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111010001011011; b = 16'b1000001010001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29132, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010001010111010; b = 16'b1011000110001001; bin = 1'b0; // Expected: {'diff': 61745, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010001010111010; b = 16'b1011000110001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61745, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100001001101010; b = 16'b0110000111111111; bin = 1'b0; // Expected: {'diff': 24683, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100001001101010; b = 16'b0110000111111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24683, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011001101101100; b = 16'b1010000001011111; bin = 1'b0; // Expected: {'diff': 4877, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011001101101100; b = 16'b1010000001011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4877, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010001111110000; b = 16'b0111001000100100; bin = 1'b0; // Expected: {'diff': 12748, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010001111110000; b = 16'b0111001000100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12748, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000010100011110; b = 16'b0010110000110011; bin = 1'b1; // Expected: {'diff': 22762, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000010100011110; b = 16'b0010110000110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22762, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010111111010000; b = 16'b0011101110111010; bin = 1'b0; // Expected: {'diff': 62486, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010111111010000; b = 16'b0011101110111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62486, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010110011010110; b = 16'b1100011011110011; bin = 1'b0; // Expected: {'diff': 58851, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010110011010110; b = 16'b1100011011110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58851, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110001001011100; b = 16'b1110010001110101; bin = 1'b0; // Expected: {'diff': 64999, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110001001011100; b = 16'b1110010001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64999, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101010100100111; b = 16'b0011001010010010; bin = 1'b0; // Expected: {'diff': 41621, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101010100100111; b = 16'b0011001010010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41621, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000001101010111; b = 16'b1010111100001110; bin = 1'b0; // Expected: {'diff': 21577, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000001101010111; b = 16'b1010111100001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21577, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010100110001000; b = 16'b0001110001001100; bin = 1'b0; // Expected: {'diff': 3388, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010100110001000; b = 16'b0001110001001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3388, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110000001011111; b = 16'b1100000010001010; bin = 1'b1; // Expected: {'diff': 8148, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110000001011111; b = 16'b1100000010001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8148, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101011010111001; b = 16'b0000011100011011; bin = 1'b1; // Expected: {'diff': 53149, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101011010111001; b = 16'b0000011100011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53149, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000000000100000; b = 16'b0011111011000011; bin = 1'b1; // Expected: {'diff': 49500, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000000000100000; b = 16'b0011111011000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49500, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011110111111001; b = 16'b1100101011011011; bin = 1'b1; // Expected: {'diff': 62237, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011110111111001; b = 16'b1100101011011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62237, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010011011011010; b = 16'b1001001000010101; bin = 1'b1; // Expected: {'diff': 5316, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010011011011010; b = 16'b1001001000010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5316, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110101111100000; b = 16'b0101011011011100; bin = 1'b0; // Expected: {'diff': 5380, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110101111100000; b = 16'b0101011011011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5380, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101000010100110; b = 16'b0111100000010110; bin = 1'b1; // Expected: {'diff': 55439, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101000010100110; b = 16'b0111100000010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55439, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101001110010001; b = 16'b1111001011101101; bin = 1'b1; // Expected: {'diff': 57507, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101001110010001; b = 16'b1111001011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57507, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011111011100010; b = 16'b0010011001001110; bin = 1'b1; // Expected: {'diff': 39059, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011111011100010; b = 16'b0010011001001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39059, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100010001011100; b = 16'b1000001100100000; bin = 1'b1; // Expected: {'diff': 49467, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100010001011100; b = 16'b1000001100100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49467, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100011011100100; b = 16'b0110011011000110; bin = 1'b0; // Expected: {'diff': 57374, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100011011100100; b = 16'b0110011011000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57374, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100101111110100; b = 16'b0000110000110111; bin = 1'b0; // Expected: {'diff': 49085, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100101111110100; b = 16'b0000110000110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49085, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111000000111011; b = 16'b0111100101011111; bin = 1'b0; // Expected: {'diff': 30428, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111000000111011; b = 16'b0111100101011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30428, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101111111000000; b = 16'b0101111001101010; bin = 1'b1; // Expected: {'diff': 341, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101111111000000; b = 16'b0101111001101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 341, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000011100011101; b = 16'b0100001010111000; bin = 1'b0; // Expected: {'diff': 17509, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000011100011101; b = 16'b0100001010111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17509, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111110001011011; b = 16'b1110111000010111; bin = 1'b0; // Expected: {'diff': 36420, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111110001011011; b = 16'b1110111000010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36420, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011111011110111; b = 16'b1000011100001011; bin = 1'b1; // Expected: {'diff': 47083, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011111011110111; b = 16'b1000011100001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47083, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100101111110001; b = 16'b1000011001010010; bin = 1'b0; // Expected: {'diff': 17823, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100101111110001; b = 16'b1000011001010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17823, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100010000100000; b = 16'b0101011100111000; bin = 1'b0; // Expected: {'diff': 60648, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100010000100000; b = 16'b0101011100111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60648, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101011010110; b = 16'b1011101110000100; bin = 1'b1; // Expected: {'diff': 24401, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101011010110; b = 16'b1011101110000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24401, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100110010010100; b = 16'b0011101011011000; bin = 1'b0; // Expected: {'diff': 37308, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100110010010100; b = 16'b0011101011011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37308, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110111100000001; b = 16'b1010000001110111; bin = 1'b1; // Expected: {'diff': 20105, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110111100000001; b = 16'b1010000001110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20105, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000110001111110; b = 16'b0000000111100000; bin = 1'b0; // Expected: {'diff': 2718, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000110001111110; b = 16'b0000000111100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2718, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110010100101100; b = 16'b0110101010100001; bin = 1'b0; // Expected: {'diff': 31371, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110010100101100; b = 16'b0110101010100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31371, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111010110101000; b = 16'b0000110110111001; bin = 1'b0; // Expected: {'diff': 26607, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111010110101000; b = 16'b0000110110111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26607, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001101101110001; b = 16'b0011011101001110; bin = 1'b1; // Expected: {'diff': 25634, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001101101110001; b = 16'b0011011101001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25634, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111111100101; b = 16'b1011011010111110; bin = 1'b0; // Expected: {'diff': 22823, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111111100101; b = 16'b1011011010111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22823, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000100011010010; b = 16'b1001000101000101; bin = 1'b0; // Expected: {'diff': 63373, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000100011010010; b = 16'b1001000101000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63373, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100010001000110; b = 16'b0010100000101110; bin = 1'b0; // Expected: {'diff': 39960, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100010001000110; b = 16'b0010100000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39960, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100010010011001; b = 16'b1100000011000111; bin = 1'b1; // Expected: {'diff': 33745, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100010010011001; b = 16'b1100000011000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33745, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100011000100010; b = 16'b0101101101000000; bin = 1'b1; // Expected: {'diff': 27361, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100011000100010; b = 16'b0101101101000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27361, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001010111100110; b = 16'b1111011110011010; bin = 1'b1; // Expected: {'diff': 40523, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001010111100110; b = 16'b1111011110011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40523, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101011110110001; b = 16'b1000000111011111; bin = 1'b0; // Expected: {'diff': 21970, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101011110110001; b = 16'b1000000111011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21970, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111100010111001; b = 16'b1111100011011001; bin = 1'b0; // Expected: {'diff': 32736, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111100010111001; b = 16'b1111100011011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32736, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101010011100001; b = 16'b0010000010010110; bin = 1'b1; // Expected: {'diff': 13386, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101010011100001; b = 16'b0010000010010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13386, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011100100111010; b = 16'b0110010010110111; bin = 1'b0; // Expected: {'diff': 54403, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011100100111010; b = 16'b0110010010110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54403, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101011010100101; b = 16'b1001001100101101; bin = 1'b0; // Expected: {'diff': 50040, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101011010100101; b = 16'b1001001100101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50040, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110010110110010; b = 16'b0001011010100101; bin = 1'b1; // Expected: {'diff': 53004, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110010110110010; b = 16'b0001011010100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53004, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110100000101001; b = 16'b1100010001111001; bin = 1'b1; // Expected: {'diff': 41903, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110100000101001; b = 16'b1100010001111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41903, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000100011001001; b = 16'b1001000111001101; bin = 1'b0; // Expected: {'diff': 30460, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000100011001001; b = 16'b1001000111001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30460, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001000010000010; b = 16'b0010100101100010; bin = 1'b0; // Expected: {'diff': 59168, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001000010000010; b = 16'b0010100101100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59168, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101000111000010; b = 16'b0000110011111100; bin = 1'b0; // Expected: {'diff': 17606, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101000111000010; b = 16'b0000110011111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17606, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010110010110010; b = 16'b0001110101000000; bin = 1'b0; // Expected: {'diff': 36722, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010110010110010; b = 16'b0001110101000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36722, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011000010101111; b = 16'b1010010001110011; bin = 1'b1; // Expected: {'diff': 35899, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011000010101111; b = 16'b1010010001110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35899, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010111111101100; b = 16'b1111100010111010; bin = 1'b1; // Expected: {'diff': 46897, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010111111101100; b = 16'b1111100010111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46897, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100110011000000; b = 16'b1010011101110000; bin = 1'b0; // Expected: {'diff': 42320, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100110011000000; b = 16'b1010011101110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42320, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001111001011011; b = 16'b0000001101101111; bin = 1'b1; // Expected: {'diff': 39659, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001111001011011; b = 16'b0000001101101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39659, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101100111100010; b = 16'b0000110110110001; bin = 1'b0; // Expected: {'diff': 19505, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101100111100010; b = 16'b0000110110110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19505, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010111011000111; b = 16'b0110010100111001; bin = 1'b1; // Expected: {'diff': 18829, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010111011000111; b = 16'b0110010100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18829, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110100110000111; b = 16'b0011101101000001; bin = 1'b0; // Expected: {'diff': 44614, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110100110000111; b = 16'b0011101101000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44614, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001001110100000; b = 16'b1011001100100011; bin = 1'b1; // Expected: {'diff': 57468, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001001110100000; b = 16'b1011001100100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57468, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100110010001110; b = 16'b1010100100001111; bin = 1'b0; // Expected: {'diff': 41855, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100110010001110; b = 16'b1010100100001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41855, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101100001000100; b = 16'b0110000000010100; bin = 1'b1; // Expected: {'diff': 63535, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101100001000100; b = 16'b0110000000010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63535, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000000111001111; b = 16'b0101011000000011; bin = 1'b0; // Expected: {'diff': 43980, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000000111001111; b = 16'b0101011000000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43980, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101011100100; b = 16'b1110000101010101; bin = 1'b1; // Expected: {'diff': 14734, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101011100100; b = 16'b1110000101010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14734, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111000111011111; b = 16'b0111110111100111; bin = 1'b1; // Expected: {'diff': 29687, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111000111011111; b = 16'b0111110111100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29687, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010010001110000; b = 16'b0010101010101111; bin = 1'b0; // Expected: {'diff': 63937, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010010001110000; b = 16'b0010101010101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63937, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000101100101110; b = 16'b0011010100111010; bin = 1'b0; // Expected: {'diff': 54772, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000101100101110; b = 16'b0011010100111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54772, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011101110010110; b = 16'b0010011101010101; bin = 1'b1; // Expected: {'diff': 37952, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011101110010110; b = 16'b0010011101010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37952, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000010111001100; b = 16'b1011000110001010; bin = 1'b1; // Expected: {'diff': 54337, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000010111001100; b = 16'b1011000110001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54337, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111110100100010; b = 16'b0010010111101101; bin = 1'b1; // Expected: {'diff': 55092, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111110100100010; b = 16'b0010010111101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55092, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101110010011111; b = 16'b1011100010011000; bin = 1'b1; // Expected: {'diff': 41990, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101110010011111; b = 16'b1011100010011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41990, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001011010000011; b = 16'b0001110011110001; bin = 1'b0; // Expected: {'diff': 31122, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001011010000011; b = 16'b0001110011110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001111100001000; b = 16'b0101010110110001; bin = 1'b1; // Expected: {'diff': 51542, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001111100001000; b = 16'b0101010110110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51542, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010101110101100; b = 16'b1011100110011111; bin = 1'b0; // Expected: {'diff': 61965, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010101110101100; b = 16'b1011100110011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61965, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101011111011000; b = 16'b1100100000101110; bin = 1'b0; // Expected: {'diff': 36778, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101011111011000; b = 16'b1100100000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36778, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000001111111011; b = 16'b0010001110000010; bin = 1'b1; // Expected: {'diff': 24696, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000001111111011; b = 16'b0010001110000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24696, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010111111000000; b = 16'b1010110010111111; bin = 1'b1; // Expected: {'diff': 768, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010111111000000; b = 16'b1010110010111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 768, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111001000111101; b = 16'b0010011001001011; bin = 1'b0; // Expected: {'diff': 19442, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111001000111101; b = 16'b0010011001001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19442, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001101000111100; b = 16'b1100101101011110; bin = 1'b1; // Expected: {'diff': 52957, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001101000111100; b = 16'b1100101101011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52957, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100101101010000; b = 16'b1101111110010111; bin = 1'b1; // Expected: {'diff': 27576, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100101101010000; b = 16'b1101111110010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27576, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100011011101010; b = 16'b0100100010011101; bin = 1'b1; // Expected: {'diff': 32332, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100011011101010; b = 16'b0100100010011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32332, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001010001011011; b = 16'b0010001111000111; bin = 1'b0; // Expected: {'diff': 61588, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001010001011011; b = 16'b0010001111000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61588, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110111101000100; b = 16'b1000001010011001; bin = 1'b0; // Expected: {'diff': 60587, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110111101000100; b = 16'b1000001010011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60587, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000110000001001; b = 16'b0010101011101100; bin = 1'b1; // Expected: {'diff': 57628, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000110000001001; b = 16'b0010101011101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57628, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101000101010101; b = 16'b1000111011111010; bin = 1'b0; // Expected: {'diff': 49755, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101000101010101; b = 16'b1000111011111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49755, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010010000010110; b = 16'b1101110111010001; bin = 1'b0; // Expected: {'diff': 50757, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010010000010110; b = 16'b1101110111010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50757, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001001001110111; b = 16'b1010001000111001; bin = 1'b0; // Expected: {'diff': 61502, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001001001110111; b = 16'b1010001000111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61502, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100111000011100; b = 16'b0101000000101110; bin = 1'b0; // Expected: {'diff': 65006, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100111000011100; b = 16'b0101000000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65006, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101110110100110; b = 16'b1001011000101100; bin = 1'b0; // Expected: {'diff': 51066, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101110110100110; b = 16'b1001011000101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51066, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101110000010111; b = 16'b0110111010010000; bin = 1'b0; // Expected: {'diff': 60807, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101110000010111; b = 16'b0110111010010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60807, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111111001011101; b = 16'b1001111001010010; bin = 1'b0; // Expected: {'diff': 57355, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111111001011101; b = 16'b1001111001010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57355, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000001000100011; b = 16'b0010100101100011; bin = 1'b0; // Expected: {'diff': 55488, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000001000100011; b = 16'b0010100101100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55488, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010010010010011; b = 16'b1110101111101110; bin = 1'b0; // Expected: {'diff': 47269, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010010010010011; b = 16'b1110101111101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47269, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111100101010010; b = 16'b1001110000111101; bin = 1'b1; // Expected: {'diff': 56596, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111100101010010; b = 16'b1001110000111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56596, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111010111111101; b = 16'b1110110000110100; bin = 1'b0; // Expected: {'diff': 35273, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111010111111101; b = 16'b1110110000110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35273, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011100110100011; b = 16'b1101010011010111; bin = 1'b0; // Expected: {'diff': 58572, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011100110100011; b = 16'b1101010011010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58572, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101000010011010; b = 16'b0010010111001110; bin = 1'b0; // Expected: {'diff': 43724, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101000010011010; b = 16'b0010010111001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43724, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010100111100011; b = 16'b0111011110111000; bin = 1'b1; // Expected: {'diff': 12842, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010100111100011; b = 16'b0111011110111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12842, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010101100001100; b = 16'b1100110101101111; bin = 1'b0; // Expected: {'diff': 56733, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010101100001100; b = 16'b1100110101101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56733, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000111010011001; b = 16'b1010110111001111; bin = 1'b1; // Expected: {'diff': 57545, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000111010011001; b = 16'b1010110111001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57545, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100000100010001; b = 16'b1001000110011001; bin = 1'b0; // Expected: {'diff': 12152, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100000100010001; b = 16'b1001000110011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12152, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110011111100000; b = 16'b0011101111011110; bin = 1'b0; // Expected: {'diff': 11266, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110011111100000; b = 16'b0011101111011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11266, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011000101100010; b = 16'b1010100101000001; bin = 1'b1; // Expected: {'diff': 34848, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011000101100010; b = 16'b1010100101000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34848, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100111100111110; b = 16'b1011011011100000; bin = 1'b0; // Expected: {'diff': 39006, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100111100111110; b = 16'b1011011011100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39006, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010100111101000; b = 16'b0011001000100000; bin = 1'b1; // Expected: {'diff': 30663, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010100111101000; b = 16'b0011001000100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30663, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000101001001000; b = 16'b0100110010101010; bin = 1'b1; // Expected: {'diff': 15773, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000101001001000; b = 16'b0100110010101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15773, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001100011110100; b = 16'b1111001001010101; bin = 1'b0; // Expected: {'diff': 9887, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001100011110100; b = 16'b1111001001010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9887, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110011100011110; b = 16'b1110001111010110; bin = 1'b0; // Expected: {'diff': 33608, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110011100011110; b = 16'b1110001111010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33608, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001111110101010; b = 16'b0111100101110001; bin = 1'b1; // Expected: {'diff': 9784, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001111110101010; b = 16'b0111100101110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9784, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101010111011111; b = 16'b0100111101100011; bin = 1'b1; // Expected: {'diff': 1659, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101010111011111; b = 16'b0100111101100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1659, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101101001011011; b = 16'b0111101010101011; bin = 1'b0; // Expected: {'diff': 57264, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101101001011011; b = 16'b0111101010101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57264, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101011011110010; b = 16'b1110000101000010; bin = 1'b1; // Expected: {'diff': 30127, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101011011110010; b = 16'b1110000101000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30127, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011110111101111; b = 16'b1001110100000010; bin = 1'b0; // Expected: {'diff': 8429, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011110111101111; b = 16'b1001110100000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8429, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110111101010001; b = 16'b1100100100011000; bin = 1'b0; // Expected: {'diff': 42553, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110111101010001; b = 16'b1100100100011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42553, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101000111001111; b = 16'b0001100100101000; bin = 1'b0; // Expected: {'diff': 14503, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101000111001111; b = 16'b0001100100101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14503, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101101010000000; b = 16'b0000010110100001; bin = 1'b0; // Expected: {'diff': 21727, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101101010000000; b = 16'b0000010110100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21727, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011100011100001; b = 16'b0010110001000110; bin = 1'b0; // Expected: {'diff': 3227, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011100011100001; b = 16'b0010110001000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3227, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111010010011001; b = 16'b0001000011001101; bin = 1'b0; // Expected: {'diff': 25548, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111010010011001; b = 16'b0001000011001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25548, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100000100111100; b = 16'b1101100001010100; bin = 1'b0; // Expected: {'diff': 59624, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100000100111100; b = 16'b1101100001010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59624, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000111011100000; b = 16'b0011010010100000; bin = 1'b1; // Expected: {'diff': 23103, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000111011100000; b = 16'b0011010010100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101000100000111; b = 16'b0110000101011010; bin = 1'b1; // Expected: {'diff': 28588, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101000100000111; b = 16'b0110000101011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28588, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111000001001101; b = 16'b1111100001111000; bin = 1'b0; // Expected: {'diff': 63445, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111000001001101; b = 16'b1111100001111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63445, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100011001101011; b = 16'b1001001011010001; bin = 1'b0; // Expected: {'diff': 45978, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100011001101011; b = 16'b1001001011010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45978, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010110100001111; b = 16'b0101010101110011; bin = 1'b0; // Expected: {'diff': 22428, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010110100001111; b = 16'b0101010101110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22428, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101111111111110; b = 16'b0010101000101111; bin = 1'b1; // Expected: {'diff': 46542, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101111111111110; b = 16'b0010101000101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46542, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100110010111010; b = 16'b0100100111100010; bin = 1'b1; // Expected: {'diff': 33495, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100110010111010; b = 16'b0100100111100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33495, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010011100110101; b = 16'b0111100000100100; bin = 1'b1; // Expected: {'diff': 44816, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010011100110101; b = 16'b0111100000100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44816, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110111001001100; b = 16'b0011010100001011; bin = 1'b1; // Expected: {'diff': 47424, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110111001001100; b = 16'b0011010100001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47424, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010101010111001; b = 16'b1001100101110011; bin = 1'b1; // Expected: {'diff': 37189, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010101010111001; b = 16'b1001100101110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37189, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110011111011110; b = 16'b0111010010100011; bin = 1'b0; // Expected: {'diff': 29499, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110011111011110; b = 16'b0111010010100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29499, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000101101011111; b = 16'b0111001000100100; bin = 1'b0; // Expected: {'diff': 6459, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000101101011111; b = 16'b0111001000100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6459, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011111010101011; b = 16'b0000010000101001; bin = 1'b0; // Expected: {'diff': 14978, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011111010101011; b = 16'b0000010000101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14978, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101010110010100; b = 16'b0101111011100110; bin = 1'b1; // Expected: {'diff': 30381, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101010110010100; b = 16'b0101111011100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30381, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111101011010011; b = 16'b0010001001001010; bin = 1'b0; // Expected: {'diff': 55433, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111101011010011; b = 16'b0010001001001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55433, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010001011111111; b = 16'b0010110010000011; bin = 1'b0; // Expected: {'diff': 30332, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010001011111111; b = 16'b0010110010000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30332, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101111011111110; b = 16'b0101101010011100; bin = 1'b1; // Expected: {'diff': 33889, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101111011111110; b = 16'b0101101010011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33889, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111011101000101; b = 16'b1100100001110101; bin = 1'b0; // Expected: {'diff': 11984, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111011101000101; b = 16'b1100100001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11984, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011111110001110; b = 16'b0011110011000110; bin = 1'b0; // Expected: {'diff': 33480, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011111110001110; b = 16'b0011110011000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33480, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010111101010111; b = 16'b0010111111001111; bin = 1'b0; // Expected: {'diff': 32648, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010111101010111; b = 16'b0010111111001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32648, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101011110011000; b = 16'b0100000100110110; bin = 1'b1; // Expected: {'diff': 5729, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101011110011000; b = 16'b0100000100110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5729, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100000111011101; b = 16'b0010011100100001; bin = 1'b1; // Expected: {'diff': 6843, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100000111011101; b = 16'b0010011100100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6843, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110101111111100; b = 16'b1101000101000010; bin = 1'b0; // Expected: {'diff': 6842, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110101111111100; b = 16'b1101000101000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6842, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111111010011010; b = 16'b1001011111110101; bin = 1'b1; // Expected: {'diff': 26276, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111111010011010; b = 16'b1001011111110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26276, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101000110110110; b = 16'b0100101011101010; bin = 1'b1; // Expected: {'diff': 1739, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101000110110110; b = 16'b0100101011101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1739, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110110000111001; b = 16'b1010001000010100; bin = 1'b1; // Expected: {'diff': 18980, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110110000111001; b = 16'b1010001000010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18980, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010100100001111; b = 16'b1010111011110001; bin = 1'b1; // Expected: {'diff': 64029, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010100100001111; b = 16'b1010111011110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64029, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001011101001001; b = 16'b0001001001100111; bin = 1'b1; // Expected: {'diff': 34017, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001011101001001; b = 16'b0001001001100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34017, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010011000101001; b = 16'b1111001101001110; bin = 1'b1; // Expected: {'diff': 45786, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010011000101001; b = 16'b1111001101001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45786, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001011000101111; b = 16'b1100010011011000; bin = 1'b1; // Expected: {'diff': 53590, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001011000101111; b = 16'b1100010011011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53590, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110011010100110; b = 16'b0010101000000001; bin = 1'b0; // Expected: {'diff': 15525, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110011010100110; b = 16'b0010101000000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15525, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001011110110010; b = 16'b0000011011001001; bin = 1'b1; // Expected: {'diff': 37096, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001011110110010; b = 16'b0000011011001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37096, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110110110011101; b = 16'b0100100101001010; bin = 1'b0; // Expected: {'diff': 42067, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110110110011101; b = 16'b0100100101001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42067, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101100000011001; b = 16'b0111111100100010; bin = 1'b0; // Expected: {'diff': 22775, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101100000011001; b = 16'b0111111100100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22775, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000101110100100; b = 16'b0101110110100101; bin = 1'b1; // Expected: {'diff': 44542, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000101110100100; b = 16'b0101110110100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44542, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110101001010111; b = 16'b1010011100010111; bin = 1'b0; // Expected: {'diff': 17216, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110101001010111; b = 16'b1010011100010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17216, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110011010110000; b = 16'b1111111010100111; bin = 1'b1; // Expected: {'diff': 59400, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110011010110000; b = 16'b1111111010100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59400, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110100111100001; b = 16'b0011101101101010; bin = 1'b0; // Expected: {'diff': 11895, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110100111100001; b = 16'b0011101101101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11895, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101111110001111; b = 16'b1010101110010010; bin = 1'b1; // Expected: {'diff': 13308, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101111110001111; b = 16'b1010101110010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13308, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101110010110110; b = 16'b1111111101010100; bin = 1'b1; // Expected: {'diff': 23905, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101110010110110; b = 16'b1111111101010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23905, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010000100110011; b = 16'b1100011011001100; bin = 1'b1; // Expected: {'diff': 23142, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010000100110011; b = 16'b1100011011001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23142, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000001011100100; b = 16'b1010000011101111; bin = 1'b0; // Expected: {'diff': 57845, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000001011100100; b = 16'b1010000011101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57845, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100100100101010; b = 16'b0001000111111110; bin = 1'b0; // Expected: {'diff': 46892, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100100100101010; b = 16'b0001000111111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46892, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101110010001101; b = 16'b1101100001101000; bin = 1'b1; // Expected: {'diff': 1060, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101110010001101; b = 16'b1101100001101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1060, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101101110000010; b = 16'b0110010101110000; bin = 1'b0; // Expected: {'diff': 62994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101101110000010; b = 16'b0110010101110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010000000001010; b = 16'b1101001010101110; bin = 1'b1; // Expected: {'diff': 52571, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010000000001010; b = 16'b1101001010101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52571, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100000001100001; b = 16'b0111111001001001; bin = 1'b0; // Expected: {'diff': 16920, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100000001100001; b = 16'b0111111001001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16920, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011100101100011; b = 16'b0010110001111001; bin = 1'b1; // Expected: {'diff': 3305, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011100101100011; b = 16'b0010110001111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3305, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001000101000100; b = 16'b1011001001101100; bin = 1'b0; // Expected: {'diff': 24280, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001000101000100; b = 16'b1011001001101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24280, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010000001111101; b = 16'b0011000101000010; bin = 1'b1; // Expected: {'diff': 61242, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010000001111101; b = 16'b0011000101000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61242, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110001100000001; b = 16'b0001000110111011; bin = 1'b0; // Expected: {'diff': 20806, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110001100000001; b = 16'b0001000110111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20806, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011001110100100; b = 16'b0000011101001000; bin = 1'b0; // Expected: {'diff': 44124, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011001110100100; b = 16'b0000011101001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111111111011010; b = 16'b0011011010011101; bin = 1'b0; // Expected: {'diff': 18749, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111111111011010; b = 16'b0011011010011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18749, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001011100011011; b = 16'b1101101101101110; bin = 1'b0; // Expected: {'diff': 48045, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001011100011011; b = 16'b1101101101101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48045, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100001101001001; b = 16'b0001101001100011; bin = 1'b1; // Expected: {'diff': 43237, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100001101001001; b = 16'b0001101001100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43237, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010110000111001; b = 16'b1011001001111011; bin = 1'b1; // Expected: {'diff': 31165, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010110000111001; b = 16'b1011001001111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31165, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011100100001010; b = 16'b0010000000000110; bin = 1'b0; // Expected: {'diff': 39172, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011100100001010; b = 16'b0010000000000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39172, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101100011111011; b = 16'b0101000111001001; bin = 1'b0; // Expected: {'diff': 34610, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101100011111011; b = 16'b0101000111001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34610, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100101001110111; b = 16'b1110101111001001; bin = 1'b0; // Expected: {'diff': 57006, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100101001110111; b = 16'b1110101111001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57006, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111110011101111; b = 16'b0101101011110101; bin = 1'b0; // Expected: {'diff': 41466, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111110011101111; b = 16'b0101101011110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41466, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101111101101010; b = 16'b1000000110101101; bin = 1'b0; // Expected: {'diff': 56765, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101111101101010; b = 16'b1000000110101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56765, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101001111010011; b = 16'b1100000100101011; bin = 1'b0; // Expected: {'diff': 4776, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101001111010011; b = 16'b1100000100101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4776, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111110001011010; b = 16'b0010010110010011; bin = 1'b1; // Expected: {'diff': 54982, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111110001011010; b = 16'b0010010110010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54982, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100100010011010; b = 16'b1111000010001000; bin = 1'b1; // Expected: {'diff': 55313, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100100010011010; b = 16'b1111000010001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55313, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001111010100110; b = 16'b1000011011011001; bin = 1'b0; // Expected: {'diff': 38861, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001111010100110; b = 16'b1000011011011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 38861, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011001111000100; b = 16'b1000100011010000; bin = 1'b1; // Expected: {'diff': 43763, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011001111000100; b = 16'b1000100011010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43763, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001111011000000; b = 16'b0101101001100011; bin = 1'b1; // Expected: {'diff': 50268, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001111011000000; b = 16'b0101101001100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50268, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011111111001111; b = 16'b1100101010000001; bin = 1'b0; // Expected: {'diff': 30030, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011111111001111; b = 16'b1100101010000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30030, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001010011101011; b = 16'b1011011010011001; bin = 1'b0; // Expected: {'diff': 24146, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001010011101011; b = 16'b1011011010011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24146, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101011101101000; b = 16'b0100111110000110; bin = 1'b1; // Expected: {'diff': 34785, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101011101101000; b = 16'b0100111110000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34785, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011000001001111; b = 16'b0101100100011101; bin = 1'b0; // Expected: {'diff': 55090, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011000001001111; b = 16'b0101100100011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55090, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110000001110110; b = 16'b0001011000011100; bin = 1'b1; // Expected: {'diff': 19033, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110000001110110; b = 16'b0001011000011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19033, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111110001011100; b = 16'b1000100011101111; bin = 1'b1; // Expected: {'diff': 62316, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111110001011100; b = 16'b1000100011101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62316, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010001100010111; b = 16'b1001111110101001; bin = 1'b0; // Expected: {'diff': 878, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010001100010111; b = 16'b1001111110101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 878, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010011100110110; b = 16'b0110100001010000; bin = 1'b0; // Expected: {'diff': 16102, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010011100110110; b = 16'b0110100001010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101100100101011; b = 16'b1001001000010111; bin = 1'b1; // Expected: {'diff': 50963, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101100100101011; b = 16'b1001001000010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50963, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000101100111010; b = 16'b0110100111100011; bin = 1'b0; // Expected: {'diff': 8535, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000101100111010; b = 16'b0110100111100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8535, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011000110010010; b = 16'b1011100111111110; bin = 1'b1; // Expected: {'diff': 30611, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011000110010010; b = 16'b1011100111111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30611, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010101101000001; b = 16'b0010011100100101; bin = 1'b0; // Expected: {'diff': 33820, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010101101000001; b = 16'b0010011100100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33820, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110100011001011; b = 16'b1111000111110010; bin = 1'b0; // Expected: {'diff': 63193, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110100011001011; b = 16'b1111000111110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63193, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111101110101; b = 16'b1001001010000000; bin = 1'b1; // Expected: {'diff': 31988, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111101110101; b = 16'b1001001010000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31988, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101001011101010; b = 16'b0010001110011101; bin = 1'b0; // Expected: {'diff': 12109, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101001011101010; b = 16'b0010001110011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12109, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000011011011111; b = 16'b1100001010110010; bin = 1'b1; // Expected: {'diff': 17452, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000011011011111; b = 16'b1100001010110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17452, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111110010101001; b = 16'b1111100000000101; bin = 1'b1; // Expected: {'diff': 1187, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111110010101001; b = 16'b1111100000000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1187, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011010011111010; b = 16'b1000110001000100; bin = 1'b0; // Expected: {'diff': 43190, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011010011111010; b = 16'b1000110001000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43190, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001111111100011; b = 16'b0110001010011000; bin = 1'b1; // Expected: {'diff': 48458, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001111111100011; b = 16'b0110001010011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48458, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000000111101101; b = 16'b0101001111101101; bin = 1'b0; // Expected: {'diff': 11776, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000000111101101; b = 16'b0101001111101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11776, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111000001110100; b = 16'b0010000100010011; bin = 1'b1; // Expected: {'diff': 20320, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111000001110100; b = 16'b0010000100010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20320, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100000111101111; b = 16'b1000001000011101; bin = 1'b1; // Expected: {'diff': 16337, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100000111101111; b = 16'b1000001000011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16337, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111111101010001; b = 16'b1010111001101011; bin = 1'b0; // Expected: {'diff': 20710, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111111101010001; b = 16'b1010111001101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20710, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111111111100111; b = 16'b0011101111111111; bin = 1'b0; // Expected: {'diff': 17384, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111111111100111; b = 16'b0011101111111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17384, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110111001111100; b = 16'b0101001100010110; bin = 1'b0; // Expected: {'diff': 39782, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110111001111100; b = 16'b0101001100010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39782, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101110111001001; b = 16'b1001001101111110; bin = 1'b1; // Expected: {'diff': 19018, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101110111001001; b = 16'b1001001101111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19018, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010000110111000; b = 16'b1000100011001111; bin = 1'b0; // Expected: {'diff': 6377, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010000110111000; b = 16'b1000100011001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6377, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011111111011001; b = 16'b1010000001110000; bin = 1'b1; // Expected: {'diff': 8040, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011111111011001; b = 16'b1010000001110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8040, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001010000010011; b = 16'b0111100010101000; bin = 1'b1; // Expected: {'diff': 7018, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001010000010011; b = 16'b0111100010101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7018, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100001101010101; b = 16'b1000110101010000; bin = 1'b0; // Expected: {'diff': 46597, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100001101010101; b = 16'b1000110101010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46597, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011000011110101; b = 16'b0010010010111010; bin = 1'b1; // Expected: {'diff': 3130, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011000011110101; b = 16'b0010010010111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3130, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010110000011101; b = 16'b1101001010001111; bin = 1'b1; // Expected: {'diff': 55693, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010110000011101; b = 16'b1101001010001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55693, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000010101001001; b = 16'b0011111100011000; bin = 1'b0; // Expected: {'diff': 50737, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000010101001001; b = 16'b0011111100011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50737, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111000010100010; b = 16'b1011111101001010; bin = 1'b0; // Expected: {'diff': 12632, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111000010100010; b = 16'b1011111101001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12632, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010100001100001; b = 16'b0001011011100011; bin = 1'b1; // Expected: {'diff': 4477, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010100001100001; b = 16'b0001011011100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4477, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010111110110110; b = 16'b1110000011011011; bin = 1'b0; // Expected: {'diff': 52955, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010111110110110; b = 16'b1110000011011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52955, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011111011010111; b = 16'b1000010100000010; bin = 1'b1; // Expected: {'diff': 14804, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011111011010111; b = 16'b1000010100000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14804, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100111111101101; b = 16'b1100100010111101; bin = 1'b0; // Expected: {'diff': 34608, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100111111101101; b = 16'b1100100010111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34608, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010010111111101; b = 16'b0101100111111000; bin = 1'b0; // Expected: {'diff': 19461, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010010111111101; b = 16'b0101100111111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19461, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001001100100010; b = 16'b1001110000001101; bin = 1'b0; // Expected: {'diff': 63253, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001001100100010; b = 16'b1001110000001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63253, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000101011110001; b = 16'b0000110101110010; bin = 1'b1; // Expected: {'diff': 64894, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000101011110001; b = 16'b0000110101110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64894, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100100110100001; b = 16'b1011100000110111; bin = 1'b1; // Expected: {'diff': 4457, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100100110100001; b = 16'b1011100000110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4457, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111100100101010; b = 16'b0111001000000001; bin = 1'b1; // Expected: {'diff': 1832, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111100100101010; b = 16'b0111001000000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1832, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010010010111111; b = 16'b1111010001001001; bin = 1'b0; // Expected: {'diff': 45174, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010010010111111; b = 16'b1111010001001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45174, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011011111000001; b = 16'b1100011001011000; bin = 1'b0; // Expected: {'diff': 29033, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011011111000001; b = 16'b1100011001011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29033, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011000101111011; b = 16'b0011010011100000; bin = 1'b1; // Expected: {'diff': 31898, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011000101111011; b = 16'b0011010011100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31898, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000010010100010; b = 16'b0010110100000010; bin = 1'b1; // Expected: {'diff': 22431, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000010010100010; b = 16'b0010110100000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22431, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111010110001000; b = 16'b0101110001001001; bin = 1'b1; // Expected: {'diff': 6462, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111010110001000; b = 16'b0101110001001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6462, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011100101101001; b = 16'b0101011001001110; bin = 1'b1; // Expected: {'diff': 25370, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011100101101001; b = 16'b0101011001001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25370, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110000101110110; b = 16'b1101110111000100; bin = 1'b0; // Expected: {'diff': 33714, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110000101110110; b = 16'b1101110111000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33714, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001000010011001; b = 16'b0110010111100110; bin = 1'b1; // Expected: {'diff': 10930, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001000010011001; b = 16'b0110010111100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10930, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010101011011011; b = 16'b1011100111111011; bin = 1'b1; // Expected: {'diff': 61663, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010101011011011; b = 16'b1011100111111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61663, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000010101010001; b = 16'b1010001000011100; bin = 1'b1; // Expected: {'diff': 58164, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000010101010001; b = 16'b1010001000011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58164, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000000100010000; b = 16'b0000000010110000; bin = 1'b0; // Expected: {'diff': 96, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000000100010000; b = 16'b0000000010110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001001111011000; b = 16'b0101110000101100; bin = 1'b0; // Expected: {'diff': 14252, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001001111011000; b = 16'b0101110000101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14252, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111100101100011; b = 16'b1100110100001000; bin = 1'b1; // Expected: {'diff': 11354, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111100101100011; b = 16'b1100110100001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11354, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110011010110000; b = 16'b1011001011001001; bin = 1'b0; // Expected: {'diff': 13287, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110011010110000; b = 16'b1011001011001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13287, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010000111010101; b = 16'b0101111010110010; bin = 1'b0; // Expected: {'diff': 17187, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010000111010101; b = 16'b0101111010110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17187, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101001011000; b = 16'b0111010110110100; bin = 1'b0; // Expected: {'diff': 42148, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101001011000; b = 16'b0111010110110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42148, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111100111100000; b = 16'b1110101110011011; bin = 1'b0; // Expected: {'diff': 36421, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111100111100000; b = 16'b1110101110011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36421, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011100100100101; b = 16'b1010011010111000; bin = 1'b0; // Expected: {'diff': 4717, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011100100100101; b = 16'b1010011010111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4717, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001011100110011; b = 16'b0100111110000010; bin = 1'b1; // Expected: {'diff': 18352, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001011100110011; b = 16'b0100111110000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18352, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011100111111000; b = 16'b0101100100000001; bin = 1'b1; // Expected: {'diff': 57590, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011100111111000; b = 16'b0101100100000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57590, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001000000101100; b = 16'b1111101101101000; bin = 1'b0; // Expected: {'diff': 5316, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001000000101100; b = 16'b1111101101101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5316, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010111111000000; b = 16'b1001110111101110; bin = 1'b0; // Expected: {'diff': 4562, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010111111000000; b = 16'b1001110111101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4562, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110110110111111; b = 16'b1101001011111110; bin = 1'b1; // Expected: {'diff': 39616, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110110110111111; b = 16'b1101001011111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39616, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111110101101000; b = 16'b0101001000110111; bin = 1'b0; // Expected: {'diff': 43825, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111110101101000; b = 16'b0101001000110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43825, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101010111011010; b = 16'b1111011010110111; bin = 1'b1; // Expected: {'diff': 57122, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101010111011010; b = 16'b1111011010110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57122, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001001101101011; b = 16'b1011111111110011; bin = 1'b1; // Expected: {'diff': 21367, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001001101101011; b = 16'b1011111111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21367, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010001011100101; b = 16'b0110011111010010; bin = 1'b1; // Expected: {'diff': 47890, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010001011100101; b = 16'b0110011111010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47890, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010110010100101; b = 16'b0101100111101000; bin = 1'b1; // Expected: {'diff': 53948, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010110010100101; b = 16'b0101100111101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53948, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011011110010000; b = 16'b1010110111010101; bin = 1'b0; // Expected: {'diff': 35259, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011011110010000; b = 16'b1010110111010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35259, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000010010101011; b = 16'b1011100011111010; bin = 1'b1; // Expected: {'diff': 19376, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000010010101011; b = 16'b1011100011111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19376, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110111001110100; b = 16'b1110011011011110; bin = 1'b1; // Expected: {'diff': 1941, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110111001110100; b = 16'b1110011011011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1941, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001010000111011; b = 16'b0100111101000111; bin = 1'b0; // Expected: {'diff': 50420, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001010000111011; b = 16'b0100111101000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50420, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110111110100000; b = 16'b1100010000101111; bin = 1'b0; // Expected: {'diff': 43889, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110111110100000; b = 16'b1100010000101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43889, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110000011111010; b = 16'b1011001011001111; bin = 1'b0; // Expected: {'diff': 11819, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110000011111010; b = 16'b1011001011001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11819, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011100101101000; b = 16'b1011100001010010; bin = 1'b1; // Expected: {'diff': 277, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011100101101000; b = 16'b1011100001010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 277, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101101000000010; b = 16'b1011101110100110; bin = 1'b0; // Expected: {'diff': 7772, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101101000000010; b = 16'b1011101110100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7772, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010101011100001; b = 16'b1100010000110001; bin = 1'b0; // Expected: {'diff': 59056, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010101011100001; b = 16'b1100010000110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59056, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100010101100111; b = 16'b0010100101001011; bin = 1'b0; // Expected: {'diff': 7196, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100010101100111; b = 16'b0010100101001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7196, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101010010111011; b = 16'b1110010111001111; bin = 1'b0; // Expected: {'diff': 61164, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101010010111011; b = 16'b1110010111001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61164, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111001001110; b = 16'b1011010010100010; bin = 1'b1; // Expected: {'diff': 22955, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111001001110; b = 16'b1011010010100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22955, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010011110111011; b = 16'b1011100000110101; bin = 1'b0; // Expected: {'diff': 61318, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010011110111011; b = 16'b1011100000110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61318, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010111101001001; b = 16'b0000100111011101; bin = 1'b1; // Expected: {'diff': 42347, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010111101001001; b = 16'b0000100111011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42347, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001111000011101; b = 16'b0111011110111010; bin = 1'b1; // Expected: {'diff': 42594, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001111000011101; b = 16'b0111011110111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42594, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111011100011111; b = 16'b0001010101001000; bin = 1'b1; // Expected: {'diff': 25046, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111011100011111; b = 16'b0001010101001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25046, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000101111100010; b = 16'b0111000111100001; bin = 1'b1; // Expected: {'diff': 6656, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000101111100010; b = 16'b0111000111100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6656, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011100101100101; b = 16'b0110110101101100; bin = 1'b1; // Expected: {'diff': 19448, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011100101100101; b = 16'b0110110101101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19448, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100100110011001; b = 16'b1000000110111101; bin = 1'b0; // Expected: {'diff': 51164, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100100110011001; b = 16'b1000000110111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51164, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111001111011000; b = 16'b0011100100111000; bin = 1'b0; // Expected: {'diff': 47776, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111001111011000; b = 16'b0011100100111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47776, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111110010110010; b = 16'b1100111010011000; bin = 1'b0; // Expected: {'diff': 11802, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111110010110010; b = 16'b1100111010011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11802, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001111111100110; b = 16'b0010011011011110; bin = 1'b0; // Expected: {'diff': 63752, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001111111100110; b = 16'b0010011011011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63752, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101011111000101; b = 16'b0101010001111001; bin = 1'b1; // Expected: {'diff': 843, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101011111000101; b = 16'b0101010001111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 843, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110110110011100; b = 16'b0000100010001000; bin = 1'b0; // Expected: {'diff': 58644, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110110110011100; b = 16'b0000100010001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58644, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101011011110001; b = 16'b0011110001001011; bin = 1'b1; // Expected: {'diff': 6821, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101011011110001; b = 16'b0011110001001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6821, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000001001110000; b = 16'b0010101110101100; bin = 1'b0; // Expected: {'diff': 54980, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000001001110000; b = 16'b0010101110101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54980, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101100000001011; b = 16'b0000001001011101; bin = 1'b0; // Expected: {'diff': 21934, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101100000001011; b = 16'b0000001001011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21934, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001010011001001; b = 16'b0000010100101101; bin = 1'b1; // Expected: {'diff': 36763, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001010011001001; b = 16'b0000010100101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36763, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011000011011001; b = 16'b0101011101101100; bin = 1'b0; // Expected: {'diff': 55661, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011000011011001; b = 16'b0101011101101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55661, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110010111010101; b = 16'b1101000110111110; bin = 1'b0; // Expected: {'diff': 37911, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110010111010101; b = 16'b1101000110111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37911, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101010010101010; b = 16'b1010001101100100; bin = 1'b0; // Expected: {'diff': 45382, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101010010101010; b = 16'b1010001101100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45382, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101111111010101; b = 16'b0011010111010000; bin = 1'b1; // Expected: {'diff': 10756, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101111111010101; b = 16'b0011010111010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10756, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110010101011100; b = 16'b1110111101001010; bin = 1'b0; // Expected: {'diff': 62994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110010101011100; b = 16'b1110111101001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011110101100000; b = 16'b1000110101110100; bin = 1'b0; // Expected: {'diff': 12268, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011110101100000; b = 16'b1000110101110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12268, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000010111011010; b = 16'b0001111100010011; bin = 1'b0; // Expected: {'diff': 59079, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000010111011010; b = 16'b0001111100010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59079, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001110011110111; b = 16'b0000101111110110; bin = 1'b0; // Expected: {'diff': 4353, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001110011110111; b = 16'b0000101111110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4353, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000001000000111; b = 16'b1101110001101001; bin = 1'b0; // Expected: {'diff': 9630, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000001000000111; b = 16'b1101110001101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9630, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111010111010; b = 16'b0011111100001111; bin = 1'b1; // Expected: {'diff': 53162, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111010111010; b = 16'b0011111100001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53162, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101011110101001; b = 16'b0000001101011000; bin = 1'b1; // Expected: {'diff': 21584, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101011110101001; b = 16'b0000001101011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21584, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111001001011101; b = 16'b0001000001110100; bin = 1'b1; // Expected: {'diff': 57832, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111001001011101; b = 16'b0001000001110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57832, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111011000111000; b = 16'b1101111010000000; bin = 1'b0; // Expected: {'diff': 38840, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111011000111000; b = 16'b1101111010000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 38840, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000010100101000; b = 16'b1010111011110100; bin = 1'b0; // Expected: {'diff': 54836, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000010100101000; b = 16'b1010111011110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54836, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100001100010101; b = 16'b1001101000000011; bin = 1'b0; // Expected: {'diff': 10514, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100001100010101; b = 16'b1001101000000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10514, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001010011110100; b = 16'b1100010110011011; bin = 1'b0; // Expected: {'diff': 20313, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001010011110100; b = 16'b1100010110011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20313, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100011001111100; b = 16'b0010110100000111; bin = 1'b1; // Expected: {'diff': 39284, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100011001111100; b = 16'b0010110100000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39284, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111101110010001; b = 16'b1000100111111000; bin = 1'b0; // Expected: {'diff': 29081, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111101110010001; b = 16'b1000100111111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29081, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010110001111111; b = 16'b1011010110111100; bin = 1'b1; // Expected: {'diff': 63170, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010110001111111; b = 16'b1011010110111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63170, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101001111011101; b = 16'b0100110000111010; bin = 1'b1; // Expected: {'diff': 34722, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101001111011101; b = 16'b0100110000111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34722, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010111001001000; b = 16'b1000110101111111; bin = 1'b1; // Expected: {'diff': 41160, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010111001001000; b = 16'b1000110101111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41160, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000010110110101; b = 16'b1100111110000111; bin = 1'b1; // Expected: {'diff': 13869, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000010110110101; b = 16'b1100111110000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13869, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001100010001110; b = 16'b0010101111110001; bin = 1'b0; // Expected: {'diff': 60573, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001100010001110; b = 16'b0010101111110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60573, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111011011011110; b = 16'b0000001110101111; bin = 1'b1; // Expected: {'diff': 62254, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111011011011110; b = 16'b0000001110101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62254, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011110111000001; b = 16'b1100010000011001; bin = 1'b0; // Expected: {'diff': 31144, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011110111000001; b = 16'b1100010000011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31144, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011000100100111; b = 16'b0110101011010111; bin = 1'b1; // Expected: {'diff': 50767, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011000100100111; b = 16'b0110101011010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50767, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100000001101100; b = 16'b0011011000011000; bin = 1'b1; // Expected: {'diff': 2643, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100000001101100; b = 16'b0011011000011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2643, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011001111011111; b = 16'b0001001111101000; bin = 1'b1; // Expected: {'diff': 40950, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011001111011111; b = 16'b0001001111101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40950, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110011101100111; b = 16'b1101110011010010; bin = 1'b1; // Expected: {'diff': 2708, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110011101100111; b = 16'b1101110011010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2708, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010100100100001; b = 16'b0110011010101001; bin = 1'b1; // Expected: {'diff': 17015, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010100100100001; b = 16'b0110011010101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17015, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010000101100101; b = 16'b1101101000011101; bin = 1'b1; // Expected: {'diff': 51015, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010000101100101; b = 16'b1101101000011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51015, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111000011000101; b = 16'b0010101000011111; bin = 1'b1; // Expected: {'diff': 18085, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111000011000101; b = 16'b0010101000011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18085, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010111111010111; b = 16'b0010010011110100; bin = 1'b0; // Expected: {'diff': 2787, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010111111010111; b = 16'b0010010011110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2787, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001000001111111; b = 16'b0111111100101100; bin = 1'b1; // Expected: {'diff': 37202, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001000001111111; b = 16'b0111111100101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37202, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010001011011011; b = 16'b1001110100000111; bin = 1'b0; // Expected: {'diff': 34260, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010001011011011; b = 16'b1001110100000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34260, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010001111111011; b = 16'b1100010110101111; bin = 1'b1; // Expected: {'diff': 56907, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010001111111011; b = 16'b1100010110101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56907, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111101101000100; b = 16'b1000001100010110; bin = 1'b0; // Expected: {'diff': 30766, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111101101000100; b = 16'b1000001100010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30766, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011011110100001; b = 16'b1001100100011000; bin = 1'b0; // Expected: {'diff': 7817, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011011110100001; b = 16'b1001100100011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7817, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111010100101; b = 16'b0111100110011010; bin = 1'b0; // Expected: {'diff': 38155, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111010100101; b = 16'b0111100110011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 38155, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111010010111101; b = 16'b1000110011101010; bin = 1'b0; // Expected: {'diff': 59347, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111010010111101; b = 16'b1000110011101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59347, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010011110111110; b = 16'b0000100011010000; bin = 1'b0; // Expected: {'diff': 40686, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010011110111110; b = 16'b0000100011010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40686, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101101111010011; b = 16'b0110010110110010; bin = 1'b1; // Expected: {'diff': 30240, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101101111010011; b = 16'b0110010110110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30240, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010000101101000; b = 16'b0000111111110011; bin = 1'b1; // Expected: {'diff': 4468, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010000101101000; b = 16'b0000111111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4468, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111001000101111; b = 16'b0111111110011000; bin = 1'b1; // Expected: {'diff': 29334, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111001000101111; b = 16'b0111111110011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29334, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100010101100011; b = 16'b0010011000111110; bin = 1'b0; // Expected: {'diff': 7973, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100010101100011; b = 16'b0010011000111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7973, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011100100001111; b = 16'b1100111011101000; bin = 1'b0; // Expected: {'diff': 27175, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011100100001111; b = 16'b1100111011101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27175, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000100111100010; b = 16'b1100111001010011; bin = 1'b1; // Expected: {'diff': 48014, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000100111100010; b = 16'b1100111001010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48014, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111100010011011; b = 16'b0111101000101011; bin = 1'b1; // Expected: {'diff': 65135, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111100010011011; b = 16'b0111101000101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65135, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011110000110100; b = 16'b0000000011101010; bin = 1'b1; // Expected: {'diff': 15177, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011110000110100; b = 16'b0000000011101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15177, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000011000011000; b = 16'b0000111011001001; bin = 1'b1; // Expected: {'diff': 30542, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000011000011000; b = 16'b0000111011001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30542, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011001011101010; b = 16'b0110100001100011; bin = 1'b0; // Expected: {'diff': 19079, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011001011101010; b = 16'b0110100001100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19079, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101011011001111; b = 16'b1100110011100001; bin = 1'b0; // Expected: {'diff': 35310, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101011011001111; b = 16'b1100110011100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35310, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110010111110000; b = 16'b0100001111111001; bin = 1'b0; // Expected: {'diff': 41463, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110010111110000; b = 16'b0100001111111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41463, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001100010001111; b = 16'b0001001001000011; bin = 1'b1; // Expected: {'diff': 34379, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001100010001111; b = 16'b0001001001000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34379, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111111100000011; b = 16'b1100000011100011; bin = 1'b0; // Expected: {'diff': 15904, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111111100000011; b = 16'b1100000011100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15904, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111010111101100; b = 16'b0100010011110010; bin = 1'b0; // Expected: {'diff': 12538, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111010111101100; b = 16'b0100010011110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12538, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100100111000110; b = 16'b1100011110111011; bin = 1'b1; // Expected: {'diff': 33290, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100100111000110; b = 16'b1100011110111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33290, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101101010101100; b = 16'b0101100001100001; bin = 1'b0; // Expected: {'diff': 33355, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101101010101100; b = 16'b0101100001100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33355, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100001111100101; b = 16'b0110000101011100; bin = 1'b1; // Expected: {'diff': 25224, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100001111100101; b = 16'b0110000101011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25224, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010000100100010; b = 16'b0011111001011101; bin = 1'b1; // Expected: {'diff': 58052, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010000100100010; b = 16'b0011111001011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58052, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011101010100011; b = 16'b0100001010010000; bin = 1'b0; // Expected: {'diff': 30739, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011101010100011; b = 16'b0100001010010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30739, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010111101110101; b = 16'b0100011111100010; bin = 1'b1; // Expected: {'diff': 59282, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010111101110101; b = 16'b0100011111100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59282, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101110100000001; b = 16'b1010000010011110; bin = 1'b0; // Expected: {'diff': 15459, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101110100000001; b = 16'b1010000010011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15459, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111111010000101; b = 16'b0010111100011001; bin = 1'b0; // Expected: {'diff': 20332, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111111010000101; b = 16'b0010111100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20332, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000001101101101; b = 16'b1001101111110110; bin = 1'b1; // Expected: {'diff': 59254, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000001101101101; b = 16'b1001101111110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59254, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001111000101010; b = 16'b1011001001000110; bin = 1'b1; // Expected: {'diff': 60387, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001111000101010; b = 16'b1011001001000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60387, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001000100010111; b = 16'b0100111001001110; bin = 1'b0; // Expected: {'diff': 17097, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001000100010111; b = 16'b0100111001001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17097, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110110101001011; b = 16'b1100100100011001; bin = 1'b0; // Expected: {'diff': 9266, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110110101001011; b = 16'b1100100100011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9266, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000000101010101; b = 16'b0100100011111100; bin = 1'b1; // Expected: {'diff': 47192, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000000101010101; b = 16'b0100100011111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47192, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001000100001001; b = 16'b0100000001111011; bin = 1'b0; // Expected: {'diff': 53390, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001000100001001; b = 16'b0100000001111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53390, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001110111111011; b = 16'b0101111100010101; bin = 1'b0; // Expected: {'diff': 16102, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001110111111011; b = 16'b0101111100010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110100010011111; b = 16'b0011101001101011; bin = 1'b0; // Expected: {'diff': 11828, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110100010011111; b = 16'b0011101001101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11828, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111000100111100; b = 16'b1011101100110100; bin = 1'b0; // Expected: {'diff': 46600, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111000100111100; b = 16'b1011101100110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46600, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010101001101000; b = 16'b1101010100001000; bin = 1'b1; // Expected: {'diff': 21855, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010101001101000; b = 16'b1101010100001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21855, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111111111111000; b = 16'b1100001100011011; bin = 1'b0; // Expected: {'diff': 48349, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111111111111000; b = 16'b1100001100011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48349, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110101000011101; b = 16'b0010010010000001; bin = 1'b1; // Expected: {'diff': 50587, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110101000011101; b = 16'b0010010010000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50587, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111101001101111; b = 16'b0001111111001111; bin = 1'b0; // Expected: {'diff': 55968, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111101001101111; b = 16'b0001111111001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55968, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001011111111110; b = 16'b0111110111111010; bin = 1'b1; // Expected: {'diff': 6659, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001011111111110; b = 16'b0111110111111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6659, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010110101010011; b = 16'b0100010001010110; bin = 1'b1; // Expected: {'diff': 26876, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010110101010011; b = 16'b0100010001010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26876, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011001101010000; b = 16'b0010110111010100; bin = 1'b0; // Expected: {'diff': 1404, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011001101010000; b = 16'b0010110111010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1404, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001010001110101; b = 16'b0000111001011011; bin = 1'b1; // Expected: {'diff': 1561, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001010001110101; b = 16'b0000111001011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1561, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100001101101101; b = 16'b1111010110000001; bin = 1'b1; // Expected: {'diff': 19947, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100001101101101; b = 16'b1111010110000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19947, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101110100110011; b = 16'b0101101011101000; bin = 1'b1; // Expected: {'diff': 33354, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101110100110011; b = 16'b0101101011101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33354, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011101100011111; b = 16'b1001011110010101; bin = 1'b0; // Expected: {'diff': 41866, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011101100011111; b = 16'b1001011110010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41866, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011010001100011; b = 16'b1101100010101011; bin = 1'b0; // Expected: {'diff': 56248, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011010001100011; b = 16'b1101100010101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56248, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100011101010101; b = 16'b0110011110000100; bin = 1'b0; // Expected: {'diff': 57297, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100011101010101; b = 16'b0110011110000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57297, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101100000001010; b = 16'b1110001101001100; bin = 1'b0; // Expected: {'diff': 62654, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101100000001010; b = 16'b1110001101001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62654, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010111000000001; b = 16'b0000000111001011; bin = 1'b0; // Expected: {'diff': 44086, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010111000000001; b = 16'b0000000111001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44086, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011111100100010; b = 16'b1100001110100010; bin = 1'b1; // Expected: {'diff': 31615, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011111100100010; b = 16'b1100001110100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31615, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011011111110110; b = 16'b1111011001101101; bin = 1'b1; // Expected: {'diff': 16776, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011011111110110; b = 16'b1111011001101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16776, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110011111101001; b = 16'b0100001011100011; bin = 1'b0; // Expected: {'diff': 42246, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110011111101001; b = 16'b0100001011100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42246, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100011010110011; b = 16'b0011101000111110; bin = 1'b0; // Expected: {'diff': 3189, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100011010110011; b = 16'b0011101000111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3189, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110000010111100; b = 16'b0100000001011111; bin = 1'b0; // Expected: {'diff': 41053, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110000010111100; b = 16'b0100000001011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41053, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111011111100000; b = 16'b1110111101110101; bin = 1'b1; // Expected: {'diff': 2154, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111011111100000; b = 16'b1110111101110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2154, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010001111111111; b = 16'b0010111100001101; bin = 1'b0; // Expected: {'diff': 29938, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010001111111111; b = 16'b0010111100001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29938, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101000101101000; b = 16'b1000001001111110; bin = 1'b0; // Expected: {'diff': 20202, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101000101101000; b = 16'b1000001001111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20202, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100000101001101; b = 16'b1011101000110011; bin = 1'b0; // Expected: {'diff': 1818, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100000101001101; b = 16'b1011101000110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1818, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000010100111010; b = 16'b0000011010111110; bin = 1'b1; // Expected: {'diff': 32379, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000010100111010; b = 16'b0000011010111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32379, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100100000101011; b = 16'b0110010110100000; bin = 1'b0; // Expected: {'diff': 25227, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100100000101011; b = 16'b0110010110100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25227, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010111111001100; b = 16'b0011100110110111; bin = 1'b0; // Expected: {'diff': 62997, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010111111001100; b = 16'b0011100110110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62997, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101011001000; b = 16'b1100110010111101; bin = 1'b0; // Expected: {'diff': 19979, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101011001000; b = 16'b1100110010111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19979, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110100110001110; b = 16'b0000111101100011; bin = 1'b1; // Expected: {'diff': 23082, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110100110001110; b = 16'b0000111101100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23082, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011100011101111; b = 16'b0110110001010010; bin = 1'b1; // Expected: {'diff': 19612, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011100011101111; b = 16'b0110110001010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19612, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010101001000110; b = 16'b1000011010100001; bin = 1'b0; // Expected: {'diff': 41893, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010101001000110; b = 16'b1000011010100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41893, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110101010100000; b = 16'b1110011000010110; bin = 1'b0; // Expected: {'diff': 1162, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110101010100000; b = 16'b1110011000010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1162, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111110001010010; b = 16'b0001011011010000; bin = 1'b0; // Expected: {'diff': 58754, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111110001010010; b = 16'b0001011011010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58754, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010110111011100; b = 16'b1001100000101110; bin = 1'b0; // Expected: {'diff': 5550, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010110111011100; b = 16'b1001100000101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5550, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011101100111110; b = 16'b1100011111000110; bin = 1'b0; // Expected: {'diff': 29560, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011101100111110; b = 16'b1100011111000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29560, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001010000000010; b = 16'b1111100011001110; bin = 1'b0; // Expected: {'diff': 39732, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001010000000010; b = 16'b1111100011001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39732, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000101101111010; b = 16'b0000011010100110; bin = 1'b1; // Expected: {'diff': 1235, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000101101111010; b = 16'b0000011010100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1235, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010111111100111; b = 16'b1101010011110011; bin = 1'b0; // Expected: {'diff': 23284, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010111111100111; b = 16'b1101010011110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23284, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111111001010110; b = 16'b1101001001100111; bin = 1'b0; // Expected: {'diff': 11247, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111111001010110; b = 16'b1101001001100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11247, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010011100100110; b = 16'b0011111000011010; bin = 1'b1; // Expected: {'diff': 59659, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010011100100110; b = 16'b0011111000011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59659, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111111111001101; b = 16'b1000000011000111; bin = 1'b1; // Expected: {'diff': 65285, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111111111001101; b = 16'b1000000011000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65285, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101101011101101; b = 16'b0001011110011000; bin = 1'b1; // Expected: {'diff': 17236, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101101011101101; b = 16'b0001011110011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17236, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001100101110101; b = 16'b0100001000011101; bin = 1'b1; // Expected: {'diff': 22359, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001100101110101; b = 16'b0100001000011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22359, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000100011010100; b = 16'b1011001100111110; bin = 1'b0; // Expected: {'diff': 21910, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000100011010100; b = 16'b1011001100111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21910, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110001001110111; b = 16'b0110010111111110; bin = 1'b1; // Expected: {'diff': 64632, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110001001110111; b = 16'b0110010111111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64632, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010101101111001; b = 16'b0111111111010110; bin = 1'b0; // Expected: {'diff': 43939, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010101101111001; b = 16'b0111111111010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43939, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100000001111010; b = 16'b0110011000010110; bin = 1'b1; // Expected: {'diff': 23139, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100000001111010; b = 16'b0110011000010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23139, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001110011010001; b = 16'b1111011010010111; bin = 1'b0; // Expected: {'diff': 42554, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001110011010001; b = 16'b1111011010010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42554, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101000111011111; b = 16'b0001100100011011; bin = 1'b1; // Expected: {'diff': 14531, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101000111011111; b = 16'b0001100100011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14531, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110001101011011; b = 16'b0010111011111111; bin = 1'b0; // Expected: {'diff': 13404, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110001101011011; b = 16'b0010111011111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13404, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111101000100011; b = 16'b0010011011100111; bin = 1'b1; // Expected: {'diff': 21307, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111101000100011; b = 16'b0010011011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21307, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111011001010110; b = 16'b1100010101000110; bin = 1'b0; // Expected: {'diff': 12560, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111011001010110; b = 16'b1100010101000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12560, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100010111000110; b = 16'b1001111011111010; bin = 1'b1; // Expected: {'diff': 42699, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100010111000110; b = 16'b1001111011111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42699, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111111110101010; b = 16'b1001100001001110; bin = 1'b0; // Expected: {'diff': 59228, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111111110101010; b = 16'b1001100001001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59228, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101001110000110; b = 16'b1000110100010111; bin = 1'b1; // Expected: {'diff': 18030, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101001110000110; b = 16'b1000110100010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18030, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101110111000101; b = 16'b1000111001010000; bin = 1'b0; // Expected: {'diff': 53109, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101110111000101; b = 16'b1000111001010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53109, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001010100100110; b = 16'b0100100010100100; bin = 1'b0; // Expected: {'diff': 52354, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001010100100110; b = 16'b0100100010100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52354, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111011101111; b = 16'b0000010010011100; bin = 1'b0; // Expected: {'diff': 2643, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111011101111; b = 16'b0000010010011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2643, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010001011100001; b = 16'b0011000101001110; bin = 1'b0; // Expected: {'diff': 29075, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010001011100001; b = 16'b0011000101001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29075, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011110100011010; b = 16'b0100011011010100; bin = 1'b0; // Expected: {'diff': 30278, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011110100011010; b = 16'b0100011011010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30278, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011011000101001; b = 16'b1001111000101011; bin = 1'b0; // Expected: {'diff': 38910, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011011000101001; b = 16'b1001111000101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 38910, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001111001010101; b = 16'b1101111001110001; bin = 1'b1; // Expected: {'diff': 16355, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001111001010101; b = 16'b1101111001110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16355, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011100001011001; b = 16'b0110000101101000; bin = 1'b1; // Expected: {'diff': 22256, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011100001011001; b = 16'b0110000101101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22256, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011100001100001; b = 16'b1011101110001011; bin = 1'b0; // Expected: {'diff': 31958, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011100001100001; b = 16'b1011101110001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31958, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000011111111001; b = 16'b0001000001100001; bin = 1'b0; // Expected: {'diff': 30616, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000011111111001; b = 16'b0001000001100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30616, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001010100101111; b = 16'b0000101111010100; bin = 1'b1; // Expected: {'diff': 2394, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001010100101111; b = 16'b0000101111010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2394, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000000000110001; b = 16'b0110011011110111; bin = 1'b0; // Expected: {'diff': 39226, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000000000110001; b = 16'b0110011011110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39226, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110111110101001; b = 16'b1111101100000001; bin = 1'b0; // Expected: {'diff': 29864, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110111110101001; b = 16'b1111101100000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29864, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101001100001010; b = 16'b0001001001001010; bin = 1'b1; // Expected: {'diff': 16575, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101001100001010; b = 16'b0001001001001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16575, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001001000100000; b = 16'b0100010000101110; bin = 1'b1; // Expected: {'diff': 19953, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001001000100000; b = 16'b0100010000101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19953, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111000100101010; b = 16'b0111011100101101; bin = 1'b0; // Expected: {'diff': 63997, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111000100101010; b = 16'b0111011100101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63997, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110110110100101; b = 16'b1101000000101000; bin = 1'b0; // Expected: {'diff': 7549, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110110110100101; b = 16'b1101000000101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7549, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100010100100101; b = 16'b1010011000100100; bin = 1'b1; // Expected: {'diff': 40704, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100010100100101; b = 16'b1010011000100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40704, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101100011010; b = 16'b1001010011000010; bin = 1'b1; // Expected: {'diff': 34391, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101100011010; b = 16'b1001010011000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34391, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010110111111010; b = 16'b0100000010101110; bin = 1'b1; // Expected: {'diff': 27979, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010110111111010; b = 16'b0100000010101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27979, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010100000110011; b = 16'b1111110110111001; bin = 1'b0; // Expected: {'diff': 10874, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010100000110011; b = 16'b1111110110111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10874, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101001100111; b = 16'b0011000100101111; bin = 1'b0; // Expected: {'diff': 59704, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101001100111; b = 16'b0011000100101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59704, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011011000100011; b = 16'b1000011101101000; bin = 1'b0; // Expected: {'diff': 11963, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011011000100011; b = 16'b1000011101101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11963, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010010101001000; b = 16'b0111011100100010; bin = 1'b0; // Expected: {'diff': 44582, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010010101001000; b = 16'b0111011100100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44582, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110011001011111; b = 16'b1011111000100011; bin = 1'b1; // Expected: {'diff': 43067, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110011001011111; b = 16'b1011111000100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43067, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111000100011001; b = 16'b1101101110101001; bin = 1'b1; // Expected: {'diff': 38255, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111000100011001; b = 16'b1101101110101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 38255, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110111111011001; b = 16'b1010011001010001; bin = 1'b0; // Expected: {'diff': 18824, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110111111011001; b = 16'b1010011001010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18824, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011001101101111; b = 16'b0011110100011111; bin = 1'b0; // Expected: {'diff': 30288, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011001101101111; b = 16'b0011110100011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30288, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110000011000111; b = 16'b1101001011000111; bin = 1'b0; // Expected: {'diff': 36352, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110000011000111; b = 16'b1101001011000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36352, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001100011101111; b = 16'b1011010000010101; bin = 1'b1; // Expected: {'diff': 58585, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001100011101111; b = 16'b1011010000010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58585, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010101100111011; b = 16'b1100100100110111; bin = 1'b0; // Expected: {'diff': 57860, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010101100111011; b = 16'b1100100100110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57860, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011000011010111; b = 16'b1001110111110000; bin = 1'b0; // Expected: {'diff': 37607, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011000011010111; b = 16'b1001110111110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37607, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010101011101111; b = 16'b1100100000110100; bin = 1'b1; // Expected: {'diff': 25274, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010101011101111; b = 16'b1100100000110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25274, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111100101101100; b = 16'b0000000111011000; bin = 1'b1; // Expected: {'diff': 30611, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111100101101100; b = 16'b0000000111011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30611, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011001000011000; b = 16'b0001001001101000; bin = 1'b0; // Expected: {'diff': 40880, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011001000011000; b = 16'b0001001001101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40880, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101110001010010; b = 16'b1101100100011110; bin = 1'b1; // Expected: {'diff': 33587, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101110001010010; b = 16'b1101100100011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33587, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000011101001011; b = 16'b0011011001001100; bin = 1'b1; // Expected: {'diff': 53502, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000011101001011; b = 16'b0011011001001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53502, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111100011011110; b = 16'b0010100100111001; bin = 1'b1; // Expected: {'diff': 20388, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111100011011110; b = 16'b0010100100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20388, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001100000010010; b = 16'b0110001101010010; bin = 1'b0; // Expected: {'diff': 46272, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001100000010010; b = 16'b0110001101010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46272, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011110001010010; b = 16'b0111001000111110; bin = 1'b1; // Expected: {'diff': 51731, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011110001010010; b = 16'b0111001000111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51731, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110000011111001; b = 16'b0000110101001101; bin = 1'b0; // Expected: {'diff': 54188, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110000011111001; b = 16'b0000110101001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54188, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111011101111010; b = 16'b0011110010011110; bin = 1'b1; // Expected: {'diff': 15067, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111011101111010; b = 16'b0011110010011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15067, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110000010110001; b = 16'b1001001110001010; bin = 1'b1; // Expected: {'diff': 52518, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110000010110001; b = 16'b1001001110001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52518, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010100110110101; b = 16'b0010100010111000; bin = 1'b0; // Expected: {'diff': 33021, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010100110110101; b = 16'b0010100010111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33021, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101000000001001; b = 16'b1001110110010100; bin = 1'b1; // Expected: {'diff': 45684, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101000000001001; b = 16'b1001110110010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45684, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000100110001101; b = 16'b1010110101001100; bin = 1'b1; // Expected: {'diff': 23616, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000100110001101; b = 16'b1010110101001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23616, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100011101001001; b = 16'b0111000110100000; bin = 1'b0; // Expected: {'diff': 54697, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100011101001001; b = 16'b0111000110100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54697, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000111000001010; b = 16'b1110010101100100; bin = 1'b1; // Expected: {'diff': 43173, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000111000001010; b = 16'b1110010101100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43173, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111011010100110; b = 16'b1000011010100110; bin = 1'b0; // Expected: {'diff': 28672, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111011010100110; b = 16'b1000011010100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28672, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100000010011101; b = 16'b1000010001001111; bin = 1'b1; // Expected: {'diff': 48205, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100000010011101; b = 16'b1000010001001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48205, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000000101111001; b = 16'b0011010110001100; bin = 1'b0; // Expected: {'diff': 19437, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000000101111001; b = 16'b0011010110001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19437, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111011101000000; b = 16'b1000111011001010; bin = 1'b0; // Expected: {'diff': 59510, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111011101000000; b = 16'b1000111011001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59510, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000111111110011; b = 16'b0101111000110101; bin = 1'b0; // Expected: {'diff': 12734, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000111111110011; b = 16'b0101111000110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12734, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100000100011101; b = 16'b1010101011110001; bin = 1'b1; // Expected: {'diff': 5675, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100000100011101; b = 16'b1010101011110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5675, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001101001011001; b = 16'b0010010010111001; bin = 1'b0; // Expected: {'diff': 30112, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001101001011001; b = 16'b0010010010111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30112, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001001100000001; b = 16'b1011110111011111; bin = 1'b0; // Expected: {'diff': 21794, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001001100000001; b = 16'b1011110111011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21794, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001100010011110; b = 16'b0101010111000100; bin = 1'b1; // Expected: {'diff': 17113, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001100010011110; b = 16'b0101010111000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001001101010101; b = 16'b0010110101011010; bin = 1'b0; // Expected: {'diff': 26107, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001001101010101; b = 16'b0010110101011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26107, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011001001110101; b = 16'b1100000010101000; bin = 1'b0; // Expected: {'diff': 29133, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011001001110101; b = 16'b1100000010101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29133, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000101101101011; b = 16'b1000000111100100; bin = 1'b1; // Expected: {'diff': 35206, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000101101101011; b = 16'b1000000111100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35206, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010110010101001; b = 16'b0111001100100011; bin = 1'b0; // Expected: {'diff': 47494, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010110010101001; b = 16'b0111001100100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47494, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011011010111111; b = 16'b1001000111111111; bin = 1'b0; // Expected: {'diff': 9408, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011011010111111; b = 16'b1001000111111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9408, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000110111101001; b = 16'b0000111000011000; bin = 1'b1; // Expected: {'diff': 65488, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000110111101001; b = 16'b0000111000011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65488, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100000100000010; b = 16'b0001110010101111; bin = 1'b1; // Expected: {'diff': 42066, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100000100000010; b = 16'b0001110010101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42066, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100011110101011; b = 16'b0111101100101010; bin = 1'b0; // Expected: {'diff': 52353, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100011110101011; b = 16'b0111101100101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52353, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001110011000011; b = 16'b0110111101111010; bin = 1'b1; // Expected: {'diff': 44360, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001110011000011; b = 16'b0110111101111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44360, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101000110101; b = 16'b0011100100001101; bin = 1'b1; // Expected: {'diff': 57639, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101000110101; b = 16'b0011100100001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57639, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011010111000010; b = 16'b0000011001101101; bin = 1'b1; // Expected: {'diff': 44884, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011010111000010; b = 16'b0000011001101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44884, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101011110110; b = 16'b1110000111011100; bin = 1'b1; // Expected: {'diff': 14617, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101011110110; b = 16'b1110000111011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14617, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010101100111110; b = 16'b1000000110010110; bin = 1'b1; // Expected: {'diff': 10663, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010101100111110; b = 16'b1000000110010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10663, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101001110101101; b = 16'b0101001110000001; bin = 1'b0; // Expected: {'diff': 32812, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101001110101101; b = 16'b0101001110000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32812, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001000101010001; b = 16'b0000001011110111; bin = 1'b0; // Expected: {'diff': 36442, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001000101010001; b = 16'b0000001011110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36442, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001001011100000; b = 16'b0011000010010010; bin = 1'b1; // Expected: {'diff': 57933, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001001011100000; b = 16'b0011000010010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57933, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001010110110100; b = 16'b1111011110000001; bin = 1'b1; // Expected: {'diff': 40498, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001010110110100; b = 16'b1111011110000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40498, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000110010101000; b = 16'b0001111001010001; bin = 1'b0; // Expected: {'diff': 61015, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000110010101000; b = 16'b0001111001010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61015, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100011001000110; b = 16'b1111001000101010; bin = 1'b0; // Expected: {'diff': 54300, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100011001000110; b = 16'b1111001000101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54300, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110110000011100; b = 16'b0000100000101110; bin = 1'b1; // Expected: {'diff': 25581, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110110000011100; b = 16'b0000100000101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25581, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000010001111010; b = 16'b1000101000110010; bin = 1'b1; // Expected: {'diff': 64071, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000010001111010; b = 16'b1000101000110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64071, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000101110011011; b = 16'b0001110101101111; bin = 1'b1; // Expected: {'diff': 28203, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000101110011011; b = 16'b0001110101101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28203, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101001010001101; b = 16'b1110100000100010; bin = 1'b1; // Expected: {'diff': 27242, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101001010001101; b = 16'b1110100000100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27242, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111100001100000; b = 16'b1001001011101011; bin = 1'b1; // Expected: {'diff': 25972, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111100001100000; b = 16'b1001001011101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25972, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000110110011010; b = 16'b0000001101110011; bin = 1'b0; // Expected: {'diff': 35367, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000110110011010; b = 16'b0000001101110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35367, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1111000100110000; b = 16'b0110111111011010; bin = 1'b0; // Expected: {'diff': 33110, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1111000100110000; b = 16'b0110111111011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33110, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010110000000001; b = 16'b0010011110011110; bin = 1'b1; // Expected: {'diff': 1122, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010110000000001; b = 16'b0010011110011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111001011111100; b = 16'b0101111111001001; bin = 1'b1; // Expected: {'diff': 4914, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111001011111100; b = 16'b0101111111001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4914, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000110010110011; b = 16'b0000011100010001; bin = 1'b0; // Expected: {'diff': 34210, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000110010110011; b = 16'b0000011100010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34210, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110101100101100; b = 16'b0001100010111011; bin = 1'b1; // Expected: {'diff': 21104, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110101100101100; b = 16'b0001100010111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21104, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110111010011110; b = 16'b1011000100101010; bin = 1'b1; // Expected: {'diff': 48499, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110111010011110; b = 16'b1011000100101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48499, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111110111110010; b = 16'b1010110101001001; bin = 1'b1; // Expected: {'diff': 53416, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111110111110010; b = 16'b1010110101001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53416, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100100101100100; b = 16'b1000101000001100; bin = 1'b1; // Expected: {'diff': 16215, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100100101100100; b = 16'b1000101000001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16215, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110001010000110; b = 16'b1101011001101010; bin = 1'b1; // Expected: {'diff': 3099, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110001010000110; b = 16'b1101011001101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3099, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010101100110010; b = 16'b0111001010000100; bin = 1'b1; // Expected: {'diff': 14509, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010101100110010; b = 16'b0111001010000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14509, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000010110011111; b = 16'b1100101101101001; bin = 1'b0; // Expected: {'diff': 47670, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000010110011111; b = 16'b1100101101101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47670, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110110101011011; b = 16'b0010000101100100; bin = 1'b1; // Expected: {'diff': 52214, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110110101011011; b = 16'b0010000101100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52214, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1011011101100111; b = 16'b0001110100001001; bin = 1'b1; // Expected: {'diff': 39517, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1011011101100111; b = 16'b0001110100001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39517, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100100111010000; b = 16'b1100000100010100; bin = 1'b1; // Expected: {'diff': 2235, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100100111010000; b = 16'b1100000100010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2235, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111011100011; b = 16'b0000000010001101; bin = 1'b0; // Expected: {'diff': 3670, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111011100011; b = 16'b0000000010001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3670, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010111010101110; b = 16'b0100100010010100; bin = 1'b1; // Expected: {'diff': 26137, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010111010101110; b = 16'b0100100010010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26137, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000111100011100; b = 16'b0001101101100100; bin = 1'b0; // Expected: {'diff': 29624, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000111100011100; b = 16'b0001101101100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29624, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100010100100001; b = 16'b0011010001110110; bin = 1'b0; // Expected: {'diff': 4267, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100010100100001; b = 16'b0011010001110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4267, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100010100011011; b = 16'b1001100100100010; bin = 1'b0; // Expected: {'diff': 11257, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100010100011011; b = 16'b1001100100100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11257, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011101000010001; b = 16'b0010011100101101; bin = 1'b0; // Expected: {'diff': 4836, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011101000010001; b = 16'b0010011100101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4836, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111011000110; b = 16'b1101111111011011; bin = 1'b1; // Expected: {'diff': 12010, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111011000110; b = 16'b1101111111011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12010, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111110100100000; b = 16'b0101010010110111; bin = 1'b0; // Expected: {'diff': 10345, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111110100100000; b = 16'b0101010010110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10345, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010110111001101; b = 16'b0001001010011111; bin = 1'b0; // Expected: {'diff': 39726, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010110111001101; b = 16'b0001001010011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39726, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
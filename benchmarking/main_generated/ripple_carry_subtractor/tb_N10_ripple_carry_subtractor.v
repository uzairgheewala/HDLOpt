
`timescale 1ns / 1ps

module tb_N10_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 10;
    
     
    // Inputs
    
    reg  [9:0] a;
    
    reg  [9:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [9:0] diff;
    
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
        
        a = 10'b0011010010; b = 10'b0001110011; bin = 1'b0; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011010010; b = 10'b0001110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000000; b = 10'b1000110011; bin = 1'b0; // Expected: {'diff': 333, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000000; b = 10'b1000110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 333, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101110011; b = 10'b0111110101; bin = 1'b1; // Expected: {'diff': 381, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101110011; b = 10'b0111110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 381, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011001000; b = 10'b0101100011; bin = 1'b1; // Expected: {'diff': 356, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011001000; b = 10'b0101100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 356, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011010001; b = 10'b0100100000; bin = 1'b1; // Expected: {'diff': 432, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011010001; b = 10'b0100100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 432, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100100000; b = 10'b1000000111; bin = 1'b1; // Expected: {'diff': 280, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100100000; b = 10'b1000000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 280, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011111010; b = 10'b1101010100; bin = 1'b0; // Expected: {'diff': 934, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011111010; b = 10'b1101010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 934, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001100010; b = 10'b0110100000; bin = 1'b0; // Expected: {'diff': 706, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001100010; b = 10'b0110100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 706, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011010110; b = 10'b1101011111; bin = 1'b0; // Expected: {'diff': 375, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011010110; b = 10'b1101011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 375, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010010000; b = 10'b1111110001; bin = 1'b0; // Expected: {'diff': 159, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010010000; b = 10'b1111110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 159, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110011011; b = 10'b0101011000; bin = 1'b0; // Expected: {'diff': 579, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110011011; b = 10'b0101011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 579, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110001001; b = 10'b0010010011; bin = 1'b1; // Expected: {'diff': 757, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110001001; b = 10'b0010010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 757, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110010011; b = 10'b0011001000; bin = 1'b0; // Expected: {'diff': 715, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110010011; b = 10'b0011001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 715, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110111100; b = 10'b1111110101; bin = 1'b0; // Expected: {'diff': 455, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110111100; b = 10'b1111110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 455, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001001111; b = 10'b0010000101; bin = 1'b0; // Expected: {'diff': 458, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001001111; b = 10'b0010000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 458, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010000000; b = 10'b0001010110; bin = 1'b1; // Expected: {'diff': 553, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010000000; b = 10'b0001010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 553, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011011010; b = 10'b1011100100; bin = 1'b1; // Expected: {'diff': 501, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011011010; b = 10'b1011100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 501, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011011000; b = 10'b0011110110; bin = 1'b0; // Expected: {'diff': 994, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011011000; b = 10'b0011110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 994, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111000111; b = 10'b1000111001; bin = 1'b0; // Expected: {'diff': 398, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111000111; b = 10'b1000111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 398, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101000; b = 10'b0101100110; bin = 1'b1; // Expected: {'diff': 385, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101000; b = 10'b0101100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 385, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000100; b = 10'b1001100111; bin = 1'b1; // Expected: {'diff': 284, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000100; b = 10'b1001100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 284, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000011101; b = 10'b0101110111; bin = 1'b0; // Expected: {'diff': 678, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000011101; b = 10'b0101110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 678, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110110001; b = 10'b0010111110; bin = 1'b0; // Expected: {'diff': 243, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110110001; b = 10'b0010111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 243, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001100010; b = 10'b0110101010; bin = 1'b1; // Expected: {'diff': 695, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001100010; b = 10'b0110101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 695, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100010010; b = 10'b0000101011; bin = 1'b1; // Expected: {'diff': 230, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100010010; b = 10'b0000101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 230, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110001111; b = 10'b1001001001; bin = 1'b1; // Expected: {'diff': 837, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110001111; b = 10'b1001001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 837, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100110110; b = 10'b1010011010; bin = 1'b0; // Expected: {'diff': 668, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100110110; b = 10'b1010011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 668, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011110010; b = 10'b1111110011; bin = 1'b0; // Expected: {'diff': 767, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011110010; b = 10'b1111110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 767, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110011111; b = 10'b0001110010; bin = 1'b1; // Expected: {'diff': 300, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110011111; b = 10'b0001110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 300, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100111101; b = 10'b1111001101; bin = 1'b1; // Expected: {'diff': 367, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100111101; b = 10'b1111001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 367, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111000111; b = 10'b0100010000; bin = 1'b0; // Expected: {'diff': 183, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111000111; b = 10'b0100010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 183, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001001111; b = 10'b0100010001; bin = 1'b0; // Expected: {'diff': 318, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001001111; b = 10'b0100010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 318, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001100011; b = 10'b1000001010; bin = 1'b1; // Expected: {'diff': 88, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001100011; b = 10'b1000001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011110111; b = 10'b0101100101; bin = 1'b0; // Expected: {'diff': 402, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011110111; b = 10'b0101100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 402, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101000111; b = 10'b1010101010; bin = 1'b1; // Expected: {'diff': 668, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101000111; b = 10'b1010101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 668, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011000100; b = 10'b1011100011; bin = 1'b1; // Expected: {'diff': 992, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011000100; b = 10'b1011100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 992, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001101000; b = 10'b0111001111; bin = 1'b1; // Expected: {'diff': 664, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001101000; b = 10'b0111001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 664, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101111101; b = 10'b1110011011; bin = 1'b1; // Expected: {'diff': 481, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101111101; b = 10'b1110011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 481, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001101111; b = 10'b1111000101; bin = 1'b0; // Expected: {'diff': 682, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001101111; b = 10'b1111000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 682, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000011100; b = 10'b1001000100; bin = 1'b0; // Expected: {'diff': 984, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000011100; b = 10'b1001000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 984, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100010101; b = 10'b0101101010; bin = 1'b0; // Expected: {'diff': 427, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100010101; b = 10'b0101101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 427, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011110001; b = 10'b0101100100; bin = 1'b1; // Expected: {'diff': 396, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011110001; b = 10'b0101100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 396, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001000010; b = 10'b1010010010; bin = 1'b0; // Expected: {'diff': 944, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001000010; b = 10'b1010010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 944, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110011101; b = 10'b0001110010; bin = 1'b1; // Expected: {'diff': 298, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110011101; b = 10'b0001110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 298, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101111000; b = 10'b1111010111; bin = 1'b1; // Expected: {'diff': 928, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101111000; b = 10'b1111010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 928, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100100111; b = 10'b0101011100; bin = 1'b0; // Expected: {'diff': 971, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100100111; b = 10'b0101011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 971, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111011100; b = 10'b0010010100; bin = 1'b0; // Expected: {'diff': 840, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111011100; b = 10'b0010010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 840, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000100100; b = 10'b1111101111; bin = 1'b0; // Expected: {'diff': 53, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000100100; b = 10'b1111101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001011010; b = 10'b0110110000; bin = 1'b0; // Expected: {'diff': 682, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001011010; b = 10'b0110110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 682, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000011100; b = 10'b0111100100; bin = 1'b1; // Expected: {'diff': 55, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000011100; b = 10'b0111100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010100000; b = 10'b1001111111; bin = 1'b1; // Expected: {'diff': 32, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010100000; b = 10'b1001111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110010010; b = 10'b1110101011; bin = 1'b1; // Expected: {'diff': 998, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110010010; b = 10'b1110101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 998, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111000100; b = 10'b0101110100; bin = 1'b0; // Expected: {'diff': 592, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111000100; b = 10'b0101110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 592, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101110001; b = 10'b0011000011; bin = 1'b0; // Expected: {'diff': 174, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101110001; b = 10'b0011000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 174, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100011001; b = 10'b1101001111; bin = 1'b1; // Expected: {'diff': 457, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100011001; b = 10'b1101001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 457, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101101; b = 10'b1000100100; bin = 1'b0; // Expected: {'diff': 201, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101101; b = 10'b1000100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 201, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000100011; b = 10'b0110100001; bin = 1'b0; // Expected: {'diff': 130, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000100011; b = 10'b0110100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 130, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110111111; b = 10'b0000101000; bin = 1'b0; // Expected: {'diff': 407, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110111111; b = 10'b0000101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 407, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101100110; b = 10'b1101110100; bin = 1'b0; // Expected: {'diff': 1010, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101100110; b = 10'b1101110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1010, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101011100; b = 10'b1011100110; bin = 1'b0; // Expected: {'diff': 630, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101011100; b = 10'b1011100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 630, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111101110; b = 10'b0100010101; bin = 1'b0; // Expected: {'diff': 217, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111101110; b = 10'b0100010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 217, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100010000; b = 10'b0101000011; bin = 1'b1; // Expected: {'diff': 460, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100010000; b = 10'b0101000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 460, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100100110; b = 10'b1011001011; bin = 1'b0; // Expected: {'diff': 91, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100100110; b = 10'b1011001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 91, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100101100; b = 10'b1110100000; bin = 1'b0; // Expected: {'diff': 396, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100101100; b = 10'b1110100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 396, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011000011; b = 10'b0110110100; bin = 1'b1; // Expected: {'diff': 782, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011000011; b = 10'b0110110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 782, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110101100; b = 10'b1111001000; bin = 1'b1; // Expected: {'diff': 483, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110101100; b = 10'b1111001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 483, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001010010; b = 10'b1110100011; bin = 1'b0; // Expected: {'diff': 175, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001010010; b = 10'b1110100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 175, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000010111; b = 10'b1010100110; bin = 1'b0; // Expected: {'diff': 881, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000010111; b = 10'b1010100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 881, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111000101; b = 10'b1101010111; bin = 1'b0; // Expected: {'diff': 622, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111000101; b = 10'b1101010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 622, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000100010; b = 10'b0111110011; bin = 1'b1; // Expected: {'diff': 46, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000100010; b = 10'b0111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110100000; b = 10'b0011001010; bin = 1'b0; // Expected: {'diff': 726, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110100000; b = 10'b0011001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 726, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101001000; b = 10'b0010010011; bin = 1'b0; // Expected: {'diff': 693, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101001000; b = 10'b0010010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 693, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000111111; b = 10'b1011010101; bin = 1'b0; // Expected: {'diff': 874, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000111111; b = 10'b1011010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 874, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100111101; b = 10'b1100011000; bin = 1'b1; // Expected: {'diff': 548, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100111101; b = 10'b1100011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 548, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110110000; b = 10'b0110101111; bin = 1'b0; // Expected: {'diff': 513, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110110000; b = 10'b0110101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 513, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011010101; b = 10'b0001011111; bin = 1'b0; // Expected: {'diff': 630, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011010101; b = 10'b0001011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 630, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101010; b = 10'b1101101011; bin = 1'b0; // Expected: {'diff': 895, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101010; b = 10'b1101101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 895, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010110110; b = 10'b0000010001; bin = 1'b0; // Expected: {'diff': 165, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010110110; b = 10'b0000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 165, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100110001; b = 10'b1000010010; bin = 1'b0; // Expected: {'diff': 287, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100110001; b = 10'b1000010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 287, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111001000; b = 10'b1011100101; bin = 1'b1; // Expected: {'diff': 226, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111001000; b = 10'b1011100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 226, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001000000; b = 10'b1100111110; bin = 1'b1; // Expected: {'diff': 257, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001000000; b = 10'b1100111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 257, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111001001; b = 10'b1111100011; bin = 1'b1; // Expected: {'diff': 997, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111001001; b = 10'b1111100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 997, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011000100; b = 10'b1011111000; bin = 1'b0; // Expected: {'diff': 972, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011000100; b = 10'b1011111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 972, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011001111; b = 10'b0100110110; bin = 1'b1; // Expected: {'diff': 408, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011001111; b = 10'b0100110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 408, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111000110; b = 10'b0111001101; bin = 1'b0; // Expected: {'diff': 1017, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111000110; b = 10'b0111001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1017, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001001101; b = 10'b1010110110; bin = 1'b0; // Expected: {'diff': 407, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001001101; b = 10'b1010110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 407, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010110000; b = 10'b1101100111; bin = 1'b1; // Expected: {'diff': 328, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010110000; b = 10'b1101100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 328, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111001110; b = 10'b1111111011; bin = 1'b0; // Expected: {'diff': 979, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111001110; b = 10'b1111111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 979, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001010111; b = 10'b0100000010; bin = 1'b0; // Expected: {'diff': 853, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001010111; b = 10'b0100000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 853, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011011101; b = 10'b0110000011; bin = 1'b1; // Expected: {'diff': 345, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011011101; b = 10'b0110000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 345, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100111101; b = 10'b0000000101; bin = 1'b1; // Expected: {'diff': 823, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100111101; b = 10'b0000000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 823, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110010100; b = 10'b0011010111; bin = 1'b0; // Expected: {'diff': 189, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110010100; b = 10'b0011010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 189, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111010001; b = 10'b0101001010; bin = 1'b0; // Expected: {'diff': 647, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111010001; b = 10'b0101001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 647, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111110010; b = 10'b1100111011; bin = 1'b1; // Expected: {'diff': 694, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111110010; b = 10'b1100111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 694, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100000100; b = 10'b1110010100; bin = 1'b1; // Expected: {'diff': 367, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100000100; b = 10'b1110010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 367, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001001101; b = 10'b1111011011; bin = 1'b1; // Expected: {'diff': 625, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001001101; b = 10'b1111011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 625, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110110100; b = 10'b0110111101; bin = 1'b1; // Expected: {'diff': 502, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110110100; b = 10'b0110111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 502, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011010100; b = 10'b1111101100; bin = 1'b0; // Expected: {'diff': 744, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011010100; b = 10'b1111101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 744, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110011101; b = 10'b1000101111; bin = 1'b0; // Expected: {'diff': 878, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110011101; b = 10'b1000101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 878, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110110100; b = 10'b1010000000; bin = 1'b0; // Expected: {'diff': 820, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110110100; b = 10'b1010000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 820, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110001001; b = 10'b0111010001; bin = 1'b1; // Expected: {'diff': 951, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110001001; b = 10'b0111010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 951, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111101100; b = 10'b1111110010; bin = 1'b1; // Expected: {'diff': 1017, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111101100; b = 10'b1111110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1017, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000100011; b = 10'b1001101001; bin = 1'b1; // Expected: {'diff': 953, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000100011; b = 10'b1001101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 953, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011111100; b = 10'b1110101111; bin = 1'b1; // Expected: {'diff': 332, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011111100; b = 10'b1110101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 332, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001011100; b = 10'b0100001010; bin = 1'b0; // Expected: {'diff': 338, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001011100; b = 10'b0100001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 338, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101100111; b = 10'b1100011010; bin = 1'b1; // Expected: {'diff': 588, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101100111; b = 10'b1100011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 588, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000110110; b = 10'b0101000101; bin = 1'b0; // Expected: {'diff': 241, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000110110; b = 10'b0101000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 241, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010100010; b = 10'b1110100000; bin = 1'b0; // Expected: {'diff': 770, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010100010; b = 10'b1110100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 770, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011110001; b = 10'b0011000100; bin = 1'b1; // Expected: {'diff': 44, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011110001; b = 10'b0011000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010011; b = 10'b0000100001; bin = 1'b1; // Expected: {'diff': 561, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010011; b = 10'b0000100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 561, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110100111; b = 10'b0101000111; bin = 1'b0; // Expected: {'diff': 608, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110100111; b = 10'b0101000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 608, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110111001; b = 10'b1110000110; bin = 1'b1; // Expected: {'diff': 562, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110111001; b = 10'b1110000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 562, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010100001; b = 10'b1011110101; bin = 1'b0; // Expected: {'diff': 940, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010100001; b = 10'b1011110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 940, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000101011; b = 10'b0010101100; bin = 1'b0; // Expected: {'diff': 895, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000101011; b = 10'b0010101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 895, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111000101; b = 10'b1000101100; bin = 1'b1; // Expected: {'diff': 408, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111000101; b = 10'b1000101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 408, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000100; b = 10'b1111000011; bin = 1'b0; // Expected: {'diff': 961, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000100; b = 10'b1111000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 961, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000010101; b = 10'b0111100011; bin = 1'b0; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000010101; b = 10'b0111100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000100111; b = 10'b1111111010; bin = 1'b0; // Expected: {'diff': 45, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000100111; b = 10'b1111111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010001100; b = 10'b1001101111; bin = 1'b0; // Expected: {'diff': 29, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010001100; b = 10'b1001101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010000001; b = 10'b0010111001; bin = 1'b1; // Expected: {'diff': 967, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010000001; b = 10'b0010111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 967, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000110110; b = 10'b0001011110; bin = 1'b1; // Expected: {'diff': 471, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000110110; b = 10'b0001011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 471, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111010011; b = 10'b0000011111; bin = 1'b0; // Expected: {'diff': 948, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111010011; b = 10'b0000011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 948, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111001000; b = 10'b1000110010; bin = 1'b1; // Expected: {'diff': 917, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111001000; b = 10'b1000110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 917, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101010000; b = 10'b0000010011; bin = 1'b0; // Expected: {'diff': 829, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101010000; b = 10'b0000010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 829, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010111110; b = 10'b1111111100; bin = 1'b0; // Expected: {'diff': 194, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010111110; b = 10'b1111111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 194, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100101100; b = 10'b1001000010; bin = 1'b0; // Expected: {'diff': 746, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100101100; b = 10'b1001000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 746, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011000001; b = 10'b0101111110; bin = 1'b0; // Expected: {'diff': 835, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011000001; b = 10'b0101111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 835, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100010101; b = 10'b0010100010; bin = 1'b1; // Expected: {'diff': 114, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100010101; b = 10'b0010100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 114, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001011111; b = 10'b1010101101; bin = 1'b1; // Expected: {'diff': 945, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001011111; b = 10'b1010101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 945, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010001001; b = 10'b1101001100; bin = 1'b1; // Expected: {'diff': 316, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010001001; b = 10'b1101001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 316, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100100111; b = 10'b1110000110; bin = 1'b0; // Expected: {'diff': 929, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100100111; b = 10'b1110000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 929, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111000101; b = 10'b1111111010; bin = 1'b0; // Expected: {'diff': 459, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111000101; b = 10'b1111111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 459, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101101000; b = 10'b1100111000; bin = 1'b0; // Expected: {'diff': 560, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101101000; b = 10'b1100111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 560, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011100000; b = 10'b1000110110; bin = 1'b0; // Expected: {'diff': 170, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011100000; b = 10'b1000110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 170, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111110010; b = 10'b0011111101; bin = 1'b1; // Expected: {'diff': 244, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111110010; b = 10'b0011111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 244, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110100000; b = 10'b0110100110; bin = 1'b0; // Expected: {'diff': 1018, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110100000; b = 10'b0110100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1018, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100100110; b = 10'b0110001101; bin = 1'b1; // Expected: {'diff': 408, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100100110; b = 10'b0110001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 408, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010001001; b = 10'b0000111101; bin = 1'b1; // Expected: {'diff': 75, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010001001; b = 10'b0000111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001000100; b = 10'b1110100100; bin = 1'b0; // Expected: {'diff': 672, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001000100; b = 10'b1110100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 672, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100001110; b = 10'b1100001001; bin = 1'b1; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100001110; b = 10'b1100001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001110001; b = 10'b0101101001; bin = 1'b1; // Expected: {'diff': 263, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001110001; b = 10'b0101101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 263, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000001011; b = 10'b0001101001; bin = 1'b0; // Expected: {'diff': 418, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000001011; b = 10'b0001101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 418, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100011011; b = 10'b0101011010; bin = 1'b0; // Expected: {'diff': 961, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100011011; b = 10'b0101011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 961, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110101111; b = 10'b1101001000; bin = 1'b1; // Expected: {'diff': 102, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110101111; b = 10'b1101001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110101110; b = 10'b1100111100; bin = 1'b1; // Expected: {'diff': 113, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110101110; b = 10'b1100111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111001001; b = 10'b1111101000; bin = 1'b1; // Expected: {'diff': 992, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111001001; b = 10'b1111101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 992, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110010101; b = 10'b1001011101; bin = 1'b1; // Expected: {'diff': 311, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110010101; b = 10'b1001011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 311, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110011000; b = 10'b0100001111; bin = 1'b1; // Expected: {'diff': 648, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110011000; b = 10'b0100001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 648, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111101001; b = 10'b0110101100; bin = 1'b0; // Expected: {'diff': 573, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111101001; b = 10'b0110101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 573, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100011001; b = 10'b1010001101; bin = 1'b0; // Expected: {'diff': 652, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100011001; b = 10'b1010001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 652, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100110101; b = 10'b1000010001; bin = 1'b0; // Expected: {'diff': 292, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100110101; b = 10'b1000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 292, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010111110; b = 10'b0110101011; bin = 1'b0; // Expected: {'diff': 787, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010111110; b = 10'b0110101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 787, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111100010; b = 10'b1000111000; bin = 1'b0; // Expected: {'diff': 938, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111100010; b = 10'b1000111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 938, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001111100; b = 10'b1010001101; bin = 1'b0; // Expected: {'diff': 495, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001111100; b = 10'b1010001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 495, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011010111; b = 10'b1011001001; bin = 1'b0; // Expected: {'diff': 14, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011010111; b = 10'b1011001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001101111; b = 10'b1001111001; bin = 1'b0; // Expected: {'diff': 502, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001101111; b = 10'b1001111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 502, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110011110; b = 10'b0110000111; bin = 1'b1; // Expected: {'diff': 22, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110011110; b = 10'b0110000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011010010; b = 10'b0100101101; bin = 1'b1; // Expected: {'diff': 932, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011010010; b = 10'b0100101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 932, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001001010; b = 10'b1000111100; bin = 1'b0; // Expected: {'diff': 526, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001001010; b = 10'b1000111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 526, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100011100; b = 10'b1001110101; bin = 1'b0; // Expected: {'diff': 679, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100011100; b = 10'b1001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 679, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001011101; b = 10'b1000010001; bin = 1'b0; // Expected: {'diff': 76, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001011101; b = 10'b1000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 76, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101001100; b = 10'b1001011111; bin = 1'b0; // Expected: {'diff': 237, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101001100; b = 10'b1001011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 237, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010010111; b = 10'b0110101001; bin = 1'b1; // Expected: {'diff': 749, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010010111; b = 10'b0110101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 749, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110101011; b = 10'b1111011000; bin = 1'b1; // Expected: {'diff': 466, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110101011; b = 10'b1111011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 466, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110100111; b = 10'b0101100010; bin = 1'b0; // Expected: {'diff': 581, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110100111; b = 10'b0101100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 581, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100011001; b = 10'b0110000110; bin = 1'b1; // Expected: {'diff': 402, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100011001; b = 10'b0110000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 402, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001110110; b = 10'b1010001000; bin = 1'b0; // Expected: {'diff': 494, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001110110; b = 10'b1010001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 494, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110011000; b = 10'b0110110001; bin = 1'b1; // Expected: {'diff': 486, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110011000; b = 10'b0110110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 486, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111101001; b = 10'b1101011101; bin = 1'b0; // Expected: {'diff': 652, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111101001; b = 10'b1101011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 652, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001110001; b = 10'b0010110000; bin = 1'b1; // Expected: {'diff': 960, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001110001; b = 10'b0010110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 960, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010010010; b = 10'b1111000010; bin = 1'b0; // Expected: {'diff': 720, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010010010; b = 10'b1111000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 720, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110101011; b = 10'b1111110011; bin = 1'b1; // Expected: {'diff': 439, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110101011; b = 10'b1111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 439, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110101011; b = 10'b1100010110; bin = 1'b1; // Expected: {'diff': 660, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110101011; b = 10'b1100010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 660, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110100011; b = 10'b0100000101; bin = 1'b0; // Expected: {'diff': 670, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110100011; b = 10'b0100000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 670, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000000111; b = 10'b0110010000; bin = 1'b1; // Expected: {'diff': 118, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000000111; b = 10'b0110010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001111000; b = 10'b0001111100; bin = 1'b1; // Expected: {'diff': 507, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001111000; b = 10'b0001111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 507, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110111111; b = 10'b0111011010; bin = 1'b1; // Expected: {'diff': 996, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110111111; b = 10'b0111011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 996, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001010110; b = 10'b0001010111; bin = 1'b0; // Expected: {'diff': 1023, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001010110; b = 10'b0001010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1023, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111011101; b = 10'b1000111001; bin = 1'b1; // Expected: {'diff': 931, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111011101; b = 10'b1000111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 931, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000100111; b = 10'b1001010011; bin = 1'b0; // Expected: {'diff': 980, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000100111; b = 10'b1001010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 980, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010010010; b = 10'b0110011010; bin = 1'b1; // Expected: {'diff': 247, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010010010; b = 10'b0110011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 247, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001110011; b = 10'b1100010011; bin = 1'b1; // Expected: {'diff': 863, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001110011; b = 10'b1100010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 863, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111011010; b = 10'b1110101001; bin = 1'b0; // Expected: {'diff': 561, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111011010; b = 10'b1110101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 561, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001001100; b = 10'b0111010000; bin = 1'b1; // Expected: {'diff': 635, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001001100; b = 10'b0111010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 635, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110010111; b = 10'b1000111010; bin = 1'b0; // Expected: {'diff': 349, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110010111; b = 10'b1000111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 349, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101011101; b = 10'b0110110111; bin = 1'b0; // Expected: {'diff': 934, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101011101; b = 10'b0110110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 934, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100100110; b = 10'b1111011011; bin = 1'b1; // Expected: {'diff': 842, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100100110; b = 10'b1111011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 842, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111011001; b = 10'b0001100010; bin = 1'b0; // Expected: {'diff': 375, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111011001; b = 10'b0001100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 375, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111111001; b = 10'b0000011110; bin = 1'b0; // Expected: {'diff': 987, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111111001; b = 10'b0000011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 987, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101100110; b = 10'b1001001110; bin = 1'b1; // Expected: {'diff': 279, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101100110; b = 10'b1001001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 279, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111011111; b = 10'b1010001110; bin = 1'b1; // Expected: {'diff': 336, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111011111; b = 10'b1010001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 336, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000101010; b = 10'b1100001100; bin = 1'b1; // Expected: {'diff': 285, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000101010; b = 10'b1100001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 285, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110011000; b = 10'b0011011011; bin = 1'b0; // Expected: {'diff': 701, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110011000; b = 10'b0011011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 701, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100010110; b = 10'b0100101110; bin = 1'b1; // Expected: {'diff': 487, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100010110; b = 10'b0100101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 487, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101000101; b = 10'b0000010111; bin = 1'b0; // Expected: {'diff': 814, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101000101; b = 10'b0000010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 814, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111111011; b = 10'b1111000010; bin = 1'b1; // Expected: {'diff': 56, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111111011; b = 10'b1111000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011011110; b = 10'b0000101101; bin = 1'b0; // Expected: {'diff': 177, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011011110; b = 10'b0000101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 177, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101010100; b = 10'b1100011010; bin = 1'b0; // Expected: {'diff': 570, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101010100; b = 10'b1100011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 570, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000001110; b = 10'b0101000101; bin = 1'b0; // Expected: {'diff': 713, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000001110; b = 10'b0101000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 713, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100101010; b = 10'b1001010110; bin = 1'b1; // Expected: {'diff': 723, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100101010; b = 10'b1001010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 723, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001111011; b = 10'b0001111010; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001111011; b = 10'b0001111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001110110; b = 10'b1001001010; bin = 1'b1; // Expected: {'diff': 555, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001110110; b = 10'b1001001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 555, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110001110; b = 10'b0000001111; bin = 1'b1; // Expected: {'diff': 894, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110001110; b = 10'b0000001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 894, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110101111; b = 10'b0000110110; bin = 1'b0; // Expected: {'diff': 377, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110101111; b = 10'b0000110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 377, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100001101; b = 10'b1001011001; bin = 1'b1; // Expected: {'diff': 691, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100001101; b = 10'b1001011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 691, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001110110; b = 10'b1101010111; bin = 1'b0; // Expected: {'diff': 799, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001110110; b = 10'b1101010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 799, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011001001; b = 10'b1001100011; bin = 1'b1; // Expected: {'diff': 613, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011001001; b = 10'b1001100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 613, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111010010; b = 10'b0100100110; bin = 1'b0; // Expected: {'diff': 684, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111010010; b = 10'b0100100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 684, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110011000; b = 10'b0111111010; bin = 1'b1; // Expected: {'diff': 413, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110011000; b = 10'b0111111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 413, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101110; b = 10'b1110111111; bin = 1'b0; // Expected: {'diff': 815, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101110; b = 10'b1110111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 815, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110010101; b = 10'b1001000011; bin = 1'b0; // Expected: {'diff': 850, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110010101; b = 10'b1001000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 850, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000101110; b = 10'b0111011111; bin = 1'b0; // Expected: {'diff': 79, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000101110; b = 10'b0111011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111100010; b = 10'b0101010000; bin = 1'b0; // Expected: {'diff': 658, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111100010; b = 10'b0101010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 658, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000000; b = 10'b1000001010; bin = 1'b1; // Expected: {'diff': 373, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000000; b = 10'b1000001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 373, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010011101; b = 10'b0100111101; bin = 1'b0; // Expected: {'diff': 352, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010011101; b = 10'b0100111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 352, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101001001; b = 10'b0111101110; bin = 1'b0; // Expected: {'diff': 347, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101001001; b = 10'b0111101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 347, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100101011; b = 10'b0110010111; bin = 1'b0; // Expected: {'diff': 404, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100101011; b = 10'b0110010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 404, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010010110; b = 10'b1111110011; bin = 1'b1; // Expected: {'diff': 674, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010010110; b = 10'b1111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 674, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001010101; b = 10'b1010101110; bin = 1'b1; // Expected: {'diff': 422, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001010101; b = 10'b1010101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 422, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110010001; b = 10'b0101110011; bin = 1'b1; // Expected: {'diff': 541, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110010001; b = 10'b0101110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 541, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000110011; b = 10'b0001100001; bin = 1'b0; // Expected: {'diff': 978, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000110011; b = 10'b0001100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 978, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110110001; b = 10'b1010100100; bin = 1'b1; // Expected: {'diff': 780, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110110001; b = 10'b1010100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 780, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001100101; b = 10'b0111001011; bin = 1'b0; // Expected: {'diff': 666, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001100101; b = 10'b0111001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 666, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110100111; b = 10'b0100011101; bin = 1'b0; // Expected: {'diff': 138, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110100111; b = 10'b0100011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 138, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000101011; b = 10'b0001110101; bin = 1'b0; // Expected: {'diff': 950, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000101011; b = 10'b0001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 950, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010101110; b = 10'b0110110100; bin = 1'b0; // Expected: {'diff': 250, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010101110; b = 10'b0110110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 250, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100100100; b = 10'b1101110110; bin = 1'b1; // Expected: {'diff': 429, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100100100; b = 10'b1101110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 429, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010000; b = 10'b0011110110; bin = 1'b1; // Expected: {'diff': 345, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010000; b = 10'b0011110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 345, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110101101; b = 10'b1010100110; bin = 1'b0; // Expected: {'diff': 775, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110101101; b = 10'b1010100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 775, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101110001; b = 10'b1001110100; bin = 1'b0; // Expected: {'diff': 765, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101110001; b = 10'b1001110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 765, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000101011; b = 10'b0101010111; bin = 1'b0; // Expected: {'diff': 724, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000101011; b = 10'b0101010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 724, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000010101; b = 10'b1000111111; bin = 1'b1; // Expected: {'diff': 469, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000010101; b = 10'b1000111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 469, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101110111; b = 10'b1011100100; bin = 1'b0; // Expected: {'diff': 659, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101110111; b = 10'b1011100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 659, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010100010; b = 10'b0001001101; bin = 1'b1; // Expected: {'diff': 596, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010100010; b = 10'b0001001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 596, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100000000; b = 10'b0111010000; bin = 1'b0; // Expected: {'diff': 816, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100000000; b = 10'b0111010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 816, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101111101; b = 10'b1111001001; bin = 1'b0; // Expected: {'diff': 436, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101111101; b = 10'b1111001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 436, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110011110; b = 10'b0011000111; bin = 1'b1; // Expected: {'diff': 214, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110011110; b = 10'b0011000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 214, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101101; b = 10'b0000001000; bin = 1'b0; // Expected: {'diff': 741, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101101; b = 10'b0000001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 741, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001110010; b = 10'b0011111000; bin = 1'b1; // Expected: {'diff': 889, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001110010; b = 10'b0011111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 889, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100000101; b = 10'b1110010111; bin = 1'b1; // Expected: {'diff': 877, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100000101; b = 10'b1110010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 877, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110110001; b = 10'b0010010101; bin = 1'b1; // Expected: {'diff': 283, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110110001; b = 10'b0010010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 283, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110111111; b = 10'b1001001011; bin = 1'b1; // Expected: {'diff': 883, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110111111; b = 10'b1001001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 883, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001100100; b = 10'b0101000001; bin = 1'b0; // Expected: {'diff': 291, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001100100; b = 10'b0101000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 291, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110010011; b = 10'b0000111111; bin = 1'b1; // Expected: {'diff': 339, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110010011; b = 10'b0000111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 339, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100011100; b = 10'b1101010010; bin = 1'b1; // Expected: {'diff': 969, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100011100; b = 10'b1101010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 969, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001010010; b = 10'b0011010110; bin = 1'b1; // Expected: {'diff': 891, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001010010; b = 10'b0011010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 891, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010011100; b = 10'b1110011001; bin = 1'b1; // Expected: {'diff': 258, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010011100; b = 10'b1110011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 258, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001101110; b = 10'b0011101010; bin = 1'b0; // Expected: {'diff': 900, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001101110; b = 10'b0011101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 900, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001000100; b = 10'b0010000011; bin = 1'b0; // Expected: {'diff': 961, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001000100; b = 10'b0010000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 961, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011100000; b = 10'b1111100101; bin = 1'b0; // Expected: {'diff': 763, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011100000; b = 10'b1111100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 763, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101101110; b = 10'b1110101000; bin = 1'b0; // Expected: {'diff': 966, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101101110; b = 10'b1110101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 966, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111001000; b = 10'b1010111101; bin = 1'b1; // Expected: {'diff': 778, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111001000; b = 10'b1010111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 778, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001110011; b = 10'b0011110011; bin = 1'b0; // Expected: {'diff': 384, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001110011; b = 10'b0011110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 384, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011100010; b = 10'b0010111010; bin = 1'b0; // Expected: {'diff': 552, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011100010; b = 10'b0010111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 552, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101011000; b = 10'b1110110011; bin = 1'b1; // Expected: {'diff': 420, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101011000; b = 10'b1110110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 420, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001100101; b = 10'b0001110101; bin = 1'b1; // Expected: {'diff': 495, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001100101; b = 10'b0001110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 495, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101110001; b = 10'b0001100100; bin = 1'b0; // Expected: {'diff': 781, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101110001; b = 10'b0001100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 781, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010110110; b = 10'b1000110110; bin = 1'b0; // Expected: {'diff': 128, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010110110; b = 10'b1000110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 128, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111011100; b = 10'b1000010011; bin = 1'b0; // Expected: {'diff': 969, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111011100; b = 10'b1000010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 969, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100000111; b = 10'b0111001100; bin = 1'b0; // Expected: {'diff': 827, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100000111; b = 10'b0111001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 827, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010110100; b = 10'b0010100111; bin = 1'b1; // Expected: {'diff': 12, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010110100; b = 10'b0010100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001101011; b = 10'b1011111010; bin = 1'b1; // Expected: {'diff': 368, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001101011; b = 10'b1011111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 368, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111010010; b = 10'b1010010000; bin = 1'b1; // Expected: {'diff': 833, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111010010; b = 10'b1010010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 833, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001110011; b = 10'b1001101111; bin = 1'b0; // Expected: {'diff': 516, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001110011; b = 10'b1001101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 516, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001110101; b = 10'b1100111111; bin = 1'b1; // Expected: {'diff': 821, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001110101; b = 10'b1100111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 821, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001000111; b = 10'b0000011110; bin = 1'b0; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001000111; b = 10'b0000011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101010011; b = 10'b1000111001; bin = 1'b1; // Expected: {'diff': 793, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101010011; b = 10'b1000111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 793, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001110011; b = 10'b1111011011; bin = 1'b1; // Expected: {'diff': 151, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001110011; b = 10'b1111011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 151, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111111001; b = 10'b1100101001; bin = 1'b0; // Expected: {'diff': 208, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111111001; b = 10'b1100101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 208, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001101011; b = 10'b1011011100; bin = 1'b0; // Expected: {'diff': 399, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001101011; b = 10'b1011011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 399, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110100111; b = 10'b1111101100; bin = 1'b0; // Expected: {'diff': 955, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110100111; b = 10'b1111101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 955, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101111; b = 10'b0000100110; bin = 1'b1; // Expected: {'diff': 712, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101111; b = 10'b0000100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 712, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110010110; b = 10'b1110111010; bin = 1'b1; // Expected: {'diff': 475, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110010110; b = 10'b1110111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 475, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001001111; b = 10'b1110100001; bin = 1'b1; // Expected: {'diff': 685, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001001111; b = 10'b1110100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 685, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010101110; b = 10'b0100101101; bin = 1'b1; // Expected: {'diff': 384, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010101110; b = 10'b0100101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 384, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100010000; b = 10'b1100010010; bin = 1'b1; // Expected: {'diff': 1021, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100010000; b = 10'b1100010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1021, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011000001; b = 10'b0101101100; bin = 1'b0; // Expected: {'diff': 341, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011000001; b = 10'b0101101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 341, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100010010; b = 10'b1111011101; bin = 1'b1; // Expected: {'diff': 308, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100010010; b = 10'b1111011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 308, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010110010; b = 10'b1101000101; bin = 1'b1; // Expected: {'diff': 876, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010110010; b = 10'b1101000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 876, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110001110; b = 10'b1111010010; bin = 1'b1; // Expected: {'diff': 443, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110001110; b = 10'b1111010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 443, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000001010; b = 10'b0011000001; bin = 1'b1; // Expected: {'diff': 328, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000001010; b = 10'b0011000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 328, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011011111; b = 10'b0000001110; bin = 1'b0; // Expected: {'diff': 209, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011011111; b = 10'b0000001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 209, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000001110; b = 10'b1100110110; bin = 1'b1; // Expected: {'diff': 215, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000001110; b = 10'b1100110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 215, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110111111; b = 10'b1010111011; bin = 1'b0; // Expected: {'diff': 772, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110111111; b = 10'b1010111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 772, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000101111; b = 10'b0111001111; bin = 1'b0; // Expected: {'diff': 96, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000101111; b = 10'b0111001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110010100; b = 10'b0010010101; bin = 1'b0; // Expected: {'diff': 767, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110010100; b = 10'b0010010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 767, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011110111; b = 10'b0110111101; bin = 1'b0; // Expected: {'diff': 826, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011110111; b = 10'b0110111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 826, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010001111; b = 10'b0100001110; bin = 1'b1; // Expected: {'diff': 384, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010001111; b = 10'b0100001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 384, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000010; b = 10'b1110011100; bin = 1'b0; // Expected: {'diff': 998, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000010; b = 10'b1110011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 998, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010111001; b = 10'b0000100010; bin = 1'b0; // Expected: {'diff': 663, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010111001; b = 10'b0000100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 663, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101100001; b = 10'b0010010101; bin = 1'b1; // Expected: {'diff': 715, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101100001; b = 10'b0010010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 715, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100111000; b = 10'b1001100111; bin = 1'b0; // Expected: {'diff': 209, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100111000; b = 10'b1001100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 209, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101110101; b = 10'b1001100100; bin = 1'b1; // Expected: {'diff': 272, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101110101; b = 10'b1001100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 272, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001100000; b = 10'b1100111101; bin = 1'b0; // Expected: {'diff': 291, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001100000; b = 10'b1100111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 291, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000111010; b = 10'b1111011011; bin = 1'b1; // Expected: {'diff': 606, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000111010; b = 10'b1111011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 606, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000010101; b = 10'b1011011101; bin = 1'b1; // Expected: {'diff': 823, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000010101; b = 10'b1011011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 823, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101110000; b = 10'b1111100101; bin = 1'b0; // Expected: {'diff': 395, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101110000; b = 10'b1111100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 395, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001111110; b = 10'b1100101001; bin = 1'b1; // Expected: {'diff': 340, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001111110; b = 10'b1100101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 340, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010000111; b = 10'b1100001110; bin = 1'b1; // Expected: {'diff': 888, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010000111; b = 10'b1100001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 888, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010101111; b = 10'b1110001111; bin = 1'b1; // Expected: {'diff': 799, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010101111; b = 10'b1110001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 799, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111101111; b = 10'b1011110000; bin = 1'b1; // Expected: {'diff': 766, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111101111; b = 10'b1011110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 766, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111101100; b = 10'b0110101101; bin = 1'b1; // Expected: {'diff': 62, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111101100; b = 10'b0110101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110011001; b = 10'b0110100010; bin = 1'b0; // Expected: {'diff': 1015, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110011001; b = 10'b0110100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1015, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000110000; b = 10'b1100110110; bin = 1'b1; // Expected: {'diff': 249, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000110000; b = 10'b1100110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 249, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111001111; b = 10'b0101010000; bin = 1'b1; // Expected: {'diff': 126, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111001111; b = 10'b0101010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 126, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010111100; b = 10'b1001111111; bin = 1'b0; // Expected: {'diff': 61, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010111100; b = 10'b1001111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100110110; b = 10'b1001101010; bin = 1'b0; // Expected: {'diff': 204, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100110110; b = 10'b1001101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 204, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011001011; b = 10'b1101011101; bin = 1'b1; // Expected: {'diff': 365, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011001011; b = 10'b1101011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 365, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001000101; b = 10'b1101100010; bin = 1'b1; // Expected: {'diff': 738, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001000101; b = 10'b1101100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 738, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100111011; b = 10'b0110001111; bin = 1'b0; // Expected: {'diff': 940, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100111011; b = 10'b0110001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 940, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010101111; b = 10'b1000101010; bin = 1'b1; // Expected: {'diff': 644, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010101111; b = 10'b1000101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 644, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011001001; b = 10'b0000011011; bin = 1'b0; // Expected: {'diff': 174, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011001001; b = 10'b0000011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 174, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111111011; b = 10'b0010000100; bin = 1'b0; // Expected: {'diff': 375, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111111011; b = 10'b0010000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 375, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100000001; b = 10'b1110010000; bin = 1'b0; // Expected: {'diff': 881, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100000001; b = 10'b1110010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 881, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111111111; b = 10'b1000111011; bin = 1'b0; // Expected: {'diff': 452, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111111111; b = 10'b1000111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 452, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001011101; b = 10'b1100111001; bin = 1'b1; // Expected: {'diff': 291, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001011101; b = 10'b1100111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 291, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100011011; b = 10'b1111110100; bin = 1'b0; // Expected: {'diff': 295, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100011011; b = 10'b1111110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 295, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010111110; b = 10'b1100000010; bin = 1'b0; // Expected: {'diff': 956, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010111110; b = 10'b1100000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 956, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110010111; b = 10'b0100101000; bin = 1'b0; // Expected: {'diff': 623, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110010111; b = 10'b0100101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 623, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101010010; b = 10'b1001101111; bin = 1'b1; // Expected: {'diff': 226, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101010010; b = 10'b1001101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 226, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001110101; b = 10'b0100110001; bin = 1'b0; // Expected: {'diff': 836, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001110101; b = 10'b0100110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 836, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010100; b = 10'b1011110010; bin = 1'b1; // Expected: {'diff': 865, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010100; b = 10'b1011110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 865, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000010111; b = 10'b0011001000; bin = 1'b0; // Expected: {'diff': 335, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000010111; b = 10'b0011001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 335, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001010010; b = 10'b0110010010; bin = 1'b0; // Expected: {'diff': 704, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001010010; b = 10'b0110010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 704, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001001100; b = 10'b0001001011; bin = 1'b0; // Expected: {'diff': 513, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001001100; b = 10'b0001001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 513, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010010011; b = 10'b1101000111; bin = 1'b1; // Expected: {'diff': 331, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010010011; b = 10'b1101000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 331, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101010; b = 10'b0010111011; bin = 1'b1; // Expected: {'diff': 558, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101010; b = 10'b0010111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 558, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101111111; b = 10'b1110000111; bin = 1'b0; // Expected: {'diff': 504, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101111111; b = 10'b1110000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 504, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001111010; b = 10'b1001000001; bin = 1'b1; // Expected: {'diff': 568, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001111010; b = 10'b1001000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 568, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100011110; b = 10'b1001101011; bin = 1'b1; // Expected: {'diff': 690, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100011110; b = 10'b1001101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 690, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111001010; b = 10'b1100101000; bin = 1'b1; // Expected: {'diff': 673, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111001010; b = 10'b1100101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 673, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001001000; b = 10'b1010000000; bin = 1'b1; // Expected: {'diff': 967, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001001000; b = 10'b1010000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 967, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110110110; b = 10'b1100010000; bin = 1'b0; // Expected: {'diff': 166, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110110110; b = 10'b1100010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 166, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010101; b = 10'b0011110110; bin = 1'b1; // Expected: {'diff': 350, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010101; b = 10'b0011110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 350, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101110000; b = 10'b0100011011; bin = 1'b1; // Expected: {'diff': 596, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101110000; b = 10'b0100011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 596, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011010101; b = 10'b0001111101; bin = 1'b0; // Expected: {'diff': 600, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011010101; b = 10'b0001111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 600, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001001010; b = 10'b0010011001; bin = 1'b0; // Expected: {'diff': 945, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001001010; b = 10'b0010011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 945, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110111110; b = 10'b1110101111; bin = 1'b1; // Expected: {'diff': 14, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110111110; b = 10'b1110101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000100000; b = 10'b0000101000; bin = 1'b0; // Expected: {'diff': 504, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000100000; b = 10'b0000101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 504, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010111100; b = 10'b1101100100; bin = 1'b0; // Expected: {'diff': 856, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010111100; b = 10'b1101100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 856, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000010; b = 10'b1110000100; bin = 1'b1; // Expected: {'diff': 1021, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000010; b = 10'b1110000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1021, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000111000; b = 10'b1011010011; bin = 1'b0; // Expected: {'diff': 357, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000111000; b = 10'b1011010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 357, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000100001; b = 10'b1010000000; bin = 1'b0; // Expected: {'diff': 417, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000100001; b = 10'b1010000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 417, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100010110; b = 10'b1001111000; bin = 1'b0; // Expected: {'diff': 158, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100010110; b = 10'b1001111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 158, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110001111; b = 10'b1010001101; bin = 1'b1; // Expected: {'diff': 769, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110001111; b = 10'b1010001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 769, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011101011; b = 10'b0110110011; bin = 1'b1; // Expected: {'diff': 823, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011101011; b = 10'b0110110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 823, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100110001; b = 10'b0100010101; bin = 1'b0; // Expected: {'diff': 28, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100110001; b = 10'b0100010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001010001; b = 10'b1110010100; bin = 1'b1; // Expected: {'diff': 188, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001010001; b = 10'b1110010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 188, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000010; b = 10'b1010011000; bin = 1'b1; // Expected: {'diff': 233, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000010; b = 10'b1010011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 233, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100001111; b = 10'b1000001101; bin = 1'b1; // Expected: {'diff': 769, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100001111; b = 10'b1000001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 769, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001111010; b = 10'b0100100100; bin = 1'b0; // Expected: {'diff': 854, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001111010; b = 10'b0100100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 854, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000111; b = 10'b1010101111; bin = 1'b1; // Expected: {'diff': 215, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000111; b = 10'b1010101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 215, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000101010; b = 10'b1010010001; bin = 1'b1; // Expected: {'diff': 408, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000101010; b = 10'b1010010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 408, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110001111; b = 10'b1100111011; bin = 1'b1; // Expected: {'diff': 83, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110001111; b = 10'b1100111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 83, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001100011; b = 10'b1000100010; bin = 1'b1; // Expected: {'diff': 576, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001100011; b = 10'b1000100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 576, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101011000; b = 10'b1100100110; bin = 1'b0; // Expected: {'diff': 562, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101011000; b = 10'b1100100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 562, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000101010; b = 10'b0110100011; bin = 1'b1; // Expected: {'diff': 134, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000101010; b = 10'b0110100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 134, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101101100; b = 10'b1101010111; bin = 1'b0; // Expected: {'diff': 533, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101101100; b = 10'b1101010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 533, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101000010; b = 10'b0011001101; bin = 1'b1; // Expected: {'diff': 628, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101000010; b = 10'b0011001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 628, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101000101; b = 10'b1101101110; bin = 1'b1; // Expected: {'diff': 982, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101000101; b = 10'b1101101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 982, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011111100; b = 10'b0011100111; bin = 1'b1; // Expected: {'diff': 20, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011111100; b = 10'b0011100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010000011; b = 10'b0010111101; bin = 1'b1; // Expected: {'diff': 453, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010000011; b = 10'b0010111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 453, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011100000; b = 10'b0101000000; bin = 1'b1; // Expected: {'diff': 415, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011100000; b = 10'b0101000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 415, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010001110; b = 10'b0000101000; bin = 1'b0; // Expected: {'diff': 102, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010001110; b = 10'b0000101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011000100; b = 10'b1100111110; bin = 1'b0; // Expected: {'diff': 390, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011000100; b = 10'b1100111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 390, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000111111; b = 10'b1111110010; bin = 1'b1; // Expected: {'diff': 76, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000111111; b = 10'b1111110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 76, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100111011; b = 10'b1101101100; bin = 1'b0; // Expected: {'diff': 975, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100111011; b = 10'b1101101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 975, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011110000; b = 10'b0001110010; bin = 1'b0; // Expected: {'diff': 638, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011110000; b = 10'b0001110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 638, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011111011; b = 10'b0110110000; bin = 1'b0; // Expected: {'diff': 843, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011111011; b = 10'b0110110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 843, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001111110; b = 10'b0011111000; bin = 1'b1; // Expected: {'diff': 389, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001111110; b = 10'b0011111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 389, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100001101; b = 10'b1000011101; bin = 1'b0; // Expected: {'diff': 752, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100001101; b = 10'b1000011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 752, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100011101; b = 10'b1110101000; bin = 1'b1; // Expected: {'diff': 372, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100011101; b = 10'b1110101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 372, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111100111; b = 10'b0101100000; bin = 1'b1; // Expected: {'diff': 134, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111100111; b = 10'b0101100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 134, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100100010; b = 10'b0111010101; bin = 1'b0; // Expected: {'diff': 845, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100100010; b = 10'b0111010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 845, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101000100; b = 10'b0101100000; bin = 1'b0; // Expected: {'diff': 484, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101000100; b = 10'b0101100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 484, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111010001; b = 10'b0100101000; bin = 1'b0; // Expected: {'diff': 681, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111010001; b = 10'b0100101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 681, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010111; b = 10'b1011100001; bin = 1'b0; // Expected: {'diff': 886, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010111; b = 10'b1011100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 886, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110100101; b = 10'b1111011011; bin = 1'b1; // Expected: {'diff': 969, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110100101; b = 10'b1111011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 969, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110000111; b = 10'b0100010000; bin = 1'b1; // Expected: {'diff': 118, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110000111; b = 10'b0100010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110000110; b = 10'b1111001110; bin = 1'b0; // Expected: {'diff': 440, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110000110; b = 10'b1111001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 440, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000110001; b = 10'b1101001001; bin = 1'b1; // Expected: {'diff': 231, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000110001; b = 10'b1101001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 231, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010100; b = 10'b0111110100; bin = 1'b1; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010100; b = 10'b0111110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011001110; b = 10'b1001010000; bin = 1'b0; // Expected: {'diff': 126, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011001110; b = 10'b1001010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 126, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110011111; b = 10'b0110110111; bin = 1'b1; // Expected: {'diff': 487, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110011111; b = 10'b0110110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 487, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111110011; b = 10'b0110101111; bin = 1'b0; // Expected: {'diff': 68, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111110011; b = 10'b0110101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001000010; b = 10'b1101011001; bin = 1'b0; // Expected: {'diff': 745, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001000010; b = 10'b1101011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 745, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100100001; b = 10'b1001110101; bin = 1'b0; // Expected: {'diff': 684, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100100001; b = 10'b1001110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 684, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111100111; b = 10'b0100010001; bin = 1'b1; // Expected: {'diff': 725, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111100111; b = 10'b0100010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 725, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101011001; b = 10'b1110011111; bin = 1'b1; // Expected: {'diff': 441, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101011001; b = 10'b1110011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 441, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010001011; b = 10'b0110011010; bin = 1'b1; // Expected: {'diff': 752, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010001011; b = 10'b0110011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 752, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000010000; b = 10'b1010100001; bin = 1'b1; // Expected: {'diff': 366, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000010000; b = 10'b1010100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 366, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100000100; b = 10'b0000001000; bin = 1'b0; // Expected: {'diff': 764, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100000100; b = 10'b0000001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 764, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010110110; b = 10'b0100100010; bin = 1'b1; // Expected: {'diff': 915, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010110110; b = 10'b0100100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 915, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011001110; b = 10'b1010111001; bin = 1'b1; // Expected: {'diff': 20, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011001110; b = 10'b1010111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011101111; b = 10'b0010100001; bin = 1'b1; // Expected: {'diff': 77, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011101111; b = 10'b0010100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000010000; b = 10'b0110011001; bin = 1'b0; // Expected: {'diff': 631, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000010000; b = 10'b0110011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 631, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111000110; b = 10'b0010111111; bin = 1'b0; // Expected: {'diff': 775, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111000110; b = 10'b0010111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 775, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101001001; b = 10'b0101100110; bin = 1'b0; // Expected: {'diff': 995, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101001001; b = 10'b0101100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 995, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100001011; b = 10'b1000001110; bin = 1'b0; // Expected: {'diff': 253, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100001011; b = 10'b1000001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 253, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000011101; b = 10'b0010001000; bin = 1'b1; // Expected: {'diff': 916, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000011101; b = 10'b0010001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 916, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001000010; b = 10'b0101001011; bin = 1'b0; // Expected: {'diff': 247, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001000010; b = 10'b0101001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 247, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000110010; b = 10'b0010101101; bin = 1'b1; // Expected: {'diff': 388, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000110010; b = 10'b0010101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 388, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010001111; b = 10'b0110000010; bin = 1'b0; // Expected: {'diff': 781, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010001111; b = 10'b0110000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 781, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100101010; b = 10'b1110111101; bin = 1'b1; // Expected: {'diff': 876, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100101010; b = 10'b1110111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 876, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101111010; b = 10'b0110111001; bin = 1'b0; // Expected: {'diff': 449, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101111010; b = 10'b0110111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 449, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111111000; b = 10'b1011100001; bin = 1'b0; // Expected: {'diff': 791, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111111000; b = 10'b1011100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 791, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101011110; b = 10'b1111001101; bin = 1'b1; // Expected: {'diff': 400, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101011110; b = 10'b1111001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 400, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001111010; b = 10'b1101101100; bin = 1'b0; // Expected: {'diff': 782, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001111010; b = 10'b1101101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 782, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100000110; b = 10'b1011001011; bin = 1'b0; // Expected: {'diff': 571, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100000110; b = 10'b1011001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 571, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011011000; b = 10'b1000001110; bin = 1'b1; // Expected: {'diff': 713, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011011000; b = 10'b1000001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 713, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101101110; b = 10'b1010001010; bin = 1'b0; // Expected: {'diff': 228, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101101110; b = 10'b1010001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 228, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100000111; b = 10'b0101001100; bin = 1'b0; // Expected: {'diff': 443, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100000111; b = 10'b0101001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 443, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100000001; b = 10'b1111100000; bin = 1'b0; // Expected: {'diff': 801, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100000001; b = 10'b1111100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 801, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100010110; b = 10'b0100111010; bin = 1'b0; // Expected: {'diff': 476, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100010110; b = 10'b0100111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 476, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010011100; b = 10'b0101001010; bin = 1'b1; // Expected: {'diff': 849, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010011100; b = 10'b0101001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 849, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001100101; b = 10'b0110100011; bin = 1'b1; // Expected: {'diff': 193, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001100101; b = 10'b0110100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 193, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111010101; b = 10'b0011110001; bin = 1'b1; // Expected: {'diff': 739, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111010101; b = 10'b0011110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 739, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111001001; b = 10'b0100000001; bin = 1'b0; // Expected: {'diff': 712, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111001001; b = 10'b0100000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 712, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111110010; b = 10'b0000010001; bin = 1'b0; // Expected: {'diff': 993, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111110010; b = 10'b0000010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 993, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100100010; b = 10'b0010101111; bin = 1'b0; // Expected: {'diff': 115, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100100010; b = 10'b0010101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011101101; b = 10'b0000010000; bin = 1'b1; // Expected: {'diff': 220, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011101101; b = 10'b0000010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100000111; b = 10'b1011001001; bin = 1'b0; // Expected: {'diff': 574, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100000111; b = 10'b1011001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 574, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100111101; b = 10'b0101000110; bin = 1'b0; // Expected: {'diff': 1015, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100111101; b = 10'b0101000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1015, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011011011; b = 10'b1000110010; bin = 1'b0; // Expected: {'diff': 169, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011011011; b = 10'b1000110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 169, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011010011; b = 10'b0001000011; bin = 1'b1; // Expected: {'diff': 655, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011010011; b = 10'b0001000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 655, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000110101; b = 10'b1001111011; bin = 1'b0; // Expected: {'diff': 442, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000110101; b = 10'b1001111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 442, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101000; b = 10'b1000000000; bin = 1'b1; // Expected: {'diff': 231, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101000; b = 10'b1000000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 231, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101110000; b = 10'b0110011011; bin = 1'b0; // Expected: {'diff': 981, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101110000; b = 10'b0110011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 981, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001101100; b = 10'b0000111010; bin = 1'b0; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001101100; b = 10'b0000111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010010110; b = 10'b1001010011; bin = 1'b0; // Expected: {'diff': 67, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010010110; b = 10'b1001010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111111100; b = 10'b1100010101; bin = 1'b1; // Expected: {'diff': 230, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111111100; b = 10'b1100010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 230, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000011011; b = 10'b1100010010; bin = 1'b0; // Expected: {'diff': 265, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000011011; b = 10'b1100010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 265, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110100110; b = 10'b1001011100; bin = 1'b0; // Expected: {'diff': 842, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110100110; b = 10'b1001011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 842, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001110100; b = 10'b0111010010; bin = 1'b1; // Expected: {'diff': 673, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001110100; b = 10'b0111010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 673, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101001011; b = 10'b1000000001; bin = 1'b0; // Expected: {'diff': 842, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101001011; b = 10'b1000000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 842, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010111110; b = 10'b0101100111; bin = 1'b1; // Expected: {'diff': 342, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010111110; b = 10'b0101100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 342, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100011011; b = 10'b0011010000; bin = 1'b1; // Expected: {'diff': 74, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100011011; b = 10'b0011010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 74, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110110011; b = 10'b1110001110; bin = 1'b0; // Expected: {'diff': 37, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110110011; b = 10'b1110001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010010111; b = 10'b0001001100; bin = 1'b1; // Expected: {'diff': 74, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010010111; b = 10'b0001001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 74, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101000001; b = 10'b1101101010; bin = 1'b1; // Expected: {'diff': 982, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101000001; b = 10'b1101101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 982, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010101110; b = 10'b1111110011; bin = 1'b1; // Expected: {'diff': 186, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010101110; b = 10'b1111110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 186, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100011110; b = 10'b1100001101; bin = 1'b0; // Expected: {'diff': 529, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100011110; b = 10'b1100001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 529, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111001001; b = 10'b0010100111; bin = 1'b0; // Expected: {'diff': 802, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111001001; b = 10'b0010100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 802, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001001100; b = 10'b0100010001; bin = 1'b0; // Expected: {'diff': 827, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001001100; b = 10'b0100010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 827, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110111010; b = 10'b0101111101; bin = 1'b1; // Expected: {'diff': 572, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110111010; b = 10'b0101111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 572, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011100110; b = 10'b1111001111; bin = 1'b1; // Expected: {'diff': 278, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011100110; b = 10'b1111001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 278, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011110000; b = 10'b1010110110; bin = 1'b1; // Expected: {'diff': 57, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011110000; b = 10'b1010110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101111110; b = 10'b1010101100; bin = 1'b1; // Expected: {'diff': 209, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101111110; b = 10'b1010101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 209, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000010010; b = 10'b0101110000; bin = 1'b1; // Expected: {'diff': 161, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000010010; b = 10'b0101110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 161, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010110000; b = 10'b0011000010; bin = 1'b0; // Expected: {'diff': 1006, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010110000; b = 10'b0011000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1006, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010011; b = 10'b0010111000; bin = 1'b1; // Expected: {'diff': 410, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010011; b = 10'b0010111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 410, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010101010; b = 10'b1010011011; bin = 1'b1; // Expected: {'diff': 14, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010101010; b = 10'b1010011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110110111; b = 10'b1110111110; bin = 1'b0; // Expected: {'diff': 505, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110110111; b = 10'b1110111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 505, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101001111; b = 10'b1011101100; bin = 1'b1; // Expected: {'diff': 98, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101001111; b = 10'b1011101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101110111; b = 10'b0101100101; bin = 1'b1; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101110111; b = 10'b0101100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011111001; b = 10'b0010000111; bin = 1'b0; // Expected: {'diff': 114, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011111001; b = 10'b0010000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 114, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100101001; b = 10'b1011100000; bin = 1'b0; // Expected: {'diff': 585, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100101001; b = 10'b1011100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 585, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101010000; b = 10'b1100110111; bin = 1'b1; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101010000; b = 10'b1100110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111100010; b = 10'b1001110011; bin = 1'b0; // Expected: {'diff': 879, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111100010; b = 10'b1001110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 879, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000111111; b = 10'b1100110001; bin = 1'b0; // Expected: {'diff': 782, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000111111; b = 10'b1100110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 782, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111110010; b = 10'b0100011000; bin = 1'b1; // Expected: {'diff': 217, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111110010; b = 10'b0100011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 217, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011100001; b = 10'b1010111100; bin = 1'b1; // Expected: {'diff': 548, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011100001; b = 10'b1010111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 548, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000000011; b = 10'b1000010011; bin = 1'b1; // Expected: {'diff': 495, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000000011; b = 10'b1000010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 495, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010011; b = 10'b1001001110; bin = 1'b1; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010011; b = 10'b1001001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001000100; b = 10'b1011010111; bin = 1'b1; // Expected: {'diff': 876, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001000100; b = 10'b1011010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 876, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010000000; b = 10'b0111010100; bin = 1'b0; // Expected: {'diff': 172, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010000000; b = 10'b0111010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 172, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101100010; b = 10'b0111101010; bin = 1'b0; // Expected: {'diff': 376, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101100010; b = 10'b0111101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 376, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011000110; b = 10'b1010011011; bin = 1'b1; // Expected: {'diff': 554, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011000110; b = 10'b1010011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 554, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010000100; b = 10'b0010001100; bin = 1'b0; // Expected: {'diff': 1016, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010000100; b = 10'b0010001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1016, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110110011; b = 10'b1111101110; bin = 1'b1; // Expected: {'diff': 452, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110110011; b = 10'b1111101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 452, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001000111; b = 10'b1100100000; bin = 1'b1; // Expected: {'diff': 294, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001000111; b = 10'b1100100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 294, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001111011; b = 10'b1100001000; bin = 1'b1; // Expected: {'diff': 370, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001111011; b = 10'b1100001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 370, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010100111; b = 10'b1010110001; bin = 1'b0; // Expected: {'diff': 1014, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010100111; b = 10'b1010110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1014, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111011001; b = 10'b1011110110; bin = 1'b0; // Expected: {'diff': 227, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111011001; b = 10'b1011110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 227, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111010011; b = 10'b1011001111; bin = 1'b1; // Expected: {'diff': 259, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111010011; b = 10'b1011001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 259, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100111011; b = 10'b1111011111; bin = 1'b0; // Expected: {'diff': 348, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100111011; b = 10'b1111011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 348, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101011110; b = 10'b0100000010; bin = 1'b1; // Expected: {'diff': 603, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101011110; b = 10'b0100000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 603, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001111110; b = 10'b1100100101; bin = 1'b0; // Expected: {'diff': 857, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001111110; b = 10'b1100100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 857, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111010010; b = 10'b0011010101; bin = 1'b1; // Expected: {'diff': 252, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111010010; b = 10'b0011010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 252, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100010101; b = 10'b0000010101; bin = 1'b1; // Expected: {'diff': 767, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100010101; b = 10'b0000010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 767, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001000111; b = 10'b1111000110; bin = 1'b1; // Expected: {'diff': 640, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001000111; b = 10'b1111000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 640, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011110001; b = 10'b0110001001; bin = 1'b1; // Expected: {'diff': 359, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011110001; b = 10'b0110001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 359, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100010000; b = 10'b1110101000; bin = 1'b0; // Expected: {'diff': 872, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100010000; b = 10'b1110101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 872, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011011100; b = 10'b1000001010; bin = 1'b0; // Expected: {'diff': 210, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011011100; b = 10'b1000001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 210, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101001000; b = 10'b1000001001; bin = 1'b0; // Expected: {'diff': 319, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101001000; b = 10'b1000001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 319, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100100101; b = 10'b0110000011; bin = 1'b0; // Expected: {'diff': 930, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100100101; b = 10'b0110000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 930, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101001010; b = 10'b0000110110; bin = 1'b0; // Expected: {'diff': 276, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101001010; b = 10'b0000110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 276, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010010010; b = 10'b0111010010; bin = 1'b0; // Expected: {'diff': 704, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010010010; b = 10'b0111010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 704, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010100; b = 10'b0110011101; bin = 1'b1; // Expected: {'diff': 182, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010100; b = 10'b0110011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 182, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011111000; b = 10'b0111010110; bin = 1'b1; // Expected: {'diff': 801, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011111000; b = 10'b0111010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 801, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100100000; b = 10'b0100001101; bin = 1'b0; // Expected: {'diff': 531, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100100000; b = 10'b0100001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 531, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100101001; b = 10'b1001011100; bin = 1'b0; // Expected: {'diff': 205, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100101001; b = 10'b1001011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 205, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011111001; b = 10'b0011001010; bin = 1'b0; // Expected: {'diff': 559, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011111001; b = 10'b0011001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 559, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011000011; b = 10'b1001111001; bin = 1'b1; // Expected: {'diff': 585, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011000011; b = 10'b1001111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 585, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010010001; b = 10'b0110100111; bin = 1'b0; // Expected: {'diff': 746, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010010001; b = 10'b0110100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 746, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011111101; b = 10'b0001011110; bin = 1'b1; // Expected: {'diff': 158, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011111101; b = 10'b0001011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 158, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110100011; b = 10'b1010110010; bin = 1'b0; // Expected: {'diff': 753, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110100011; b = 10'b1010110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 753, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100010001; b = 10'b0010000101; bin = 1'b1; // Expected: {'diff': 651, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100010001; b = 10'b0010000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 651, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011011101; b = 10'b1010001000; bin = 1'b0; // Expected: {'diff': 85, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011011101; b = 10'b1010001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 85, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100100000; b = 10'b0010000111; bin = 1'b1; // Expected: {'diff': 152, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100100000; b = 10'b0010000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 152, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100011100; b = 10'b1000011101; bin = 1'b0; // Expected: {'diff': 255, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100011100; b = 10'b1000011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 255, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100000011; b = 10'b1001111100; bin = 1'b0; // Expected: {'diff': 135, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100000011; b = 10'b1001111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 135, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111010001; b = 10'b1011110110; bin = 1'b1; // Expected: {'diff': 218, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111010001; b = 10'b1011110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 218, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011111100; b = 10'b0101001010; bin = 1'b1; // Expected: {'diff': 433, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011111100; b = 10'b0101001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 433, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011001010; b = 10'b0101010101; bin = 1'b1; // Expected: {'diff': 372, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011001010; b = 10'b0101010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 372, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001111000; b = 10'b0011111010; bin = 1'b1; // Expected: {'diff': 893, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001111000; b = 10'b0011111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 893, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101111000; b = 10'b0110000110; bin = 1'b1; // Expected: {'diff': 1009, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101111000; b = 10'b0110000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1009, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001011010; b = 10'b1100100010; bin = 1'b0; // Expected: {'diff': 312, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001011010; b = 10'b1100100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 312, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100110101; b = 10'b1100111000; bin = 1'b1; // Expected: {'diff': 1020, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100110101; b = 10'b1100111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1020, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001000000; b = 10'b1111011000; bin = 1'b1; // Expected: {'diff': 615, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001000000; b = 10'b1111011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 615, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010101011; b = 10'b0110100001; bin = 1'b1; // Expected: {'diff': 777, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010101011; b = 10'b0110100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 777, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100000001; b = 10'b0001101010; bin = 1'b0; // Expected: {'diff': 663, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100000001; b = 10'b0001101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 663, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110100111; b = 10'b1011011111; bin = 1'b0; // Expected: {'diff': 712, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110100111; b = 10'b1011011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 712, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110001000; b = 10'b0011010011; bin = 1'b0; // Expected: {'diff': 693, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110001000; b = 10'b0011010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 693, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101011110; b = 10'b0001000000; bin = 1'b0; // Expected: {'diff': 286, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101011110; b = 10'b0001000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 286, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000100111; b = 10'b0101101011; bin = 1'b1; // Expected: {'diff': 699, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000100111; b = 10'b0101101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 699, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111111011; b = 10'b1111011101; bin = 1'b0; // Expected: {'diff': 30, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111111011; b = 10'b1111011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111011000; b = 10'b0011111101; bin = 1'b1; // Expected: {'diff': 218, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111011000; b = 10'b0011111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 218, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110000010; b = 10'b1111010100; bin = 1'b0; // Expected: {'diff': 430, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110000010; b = 10'b1111010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 430, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111011101; b = 10'b0011001010; bin = 1'b0; // Expected: {'diff': 787, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111011101; b = 10'b0011001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 787, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000101111; b = 10'b0001111111; bin = 1'b1; // Expected: {'diff': 431, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000101111; b = 10'b0001111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 431, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111001010; b = 10'b1010100011; bin = 1'b0; // Expected: {'diff': 807, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111001010; b = 10'b1010100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 807, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110100001; b = 10'b1010111010; bin = 1'b0; // Expected: {'diff': 231, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110100001; b = 10'b1010111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 231, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110101010; b = 10'b1101111111; bin = 1'b0; // Expected: {'diff': 43, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110101010; b = 10'b1101111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000101110; b = 10'b1001100011; bin = 1'b0; // Expected: {'diff': 971, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000101110; b = 10'b1001100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 971, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011001110; b = 10'b1001100110; bin = 1'b0; // Expected: {'diff': 616, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011001110; b = 10'b1001100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 616, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000101100; b = 10'b1011010010; bin = 1'b0; // Expected: {'diff': 858, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000101100; b = 10'b1011010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 858, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101111; b = 10'b0000111101; bin = 1'b0; // Expected: {'diff': 690, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101111; b = 10'b0000111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 690, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010111011; b = 10'b1011011010; bin = 1'b1; // Expected: {'diff': 480, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010111011; b = 10'b1011011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 480, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111100111; b = 10'b1101011001; bin = 1'b1; // Expected: {'diff': 141, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111100111; b = 10'b1101011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 141, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000001100; b = 10'b0111011110; bin = 1'b0; // Expected: {'diff': 558, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000001100; b = 10'b0111011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 558, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101100101; b = 10'b1100110001; bin = 1'b0; // Expected: {'diff': 52, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101100101; b = 10'b1100110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000000; b = 10'b1011101100; bin = 1'b0; // Expected: {'diff': 148, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000000; b = 10'b1011101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 148, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001100011; b = 10'b1110010110; bin = 1'b1; // Expected: {'diff': 716, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001100011; b = 10'b1110010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 716, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110010110; b = 10'b0010101101; bin = 1'b1; // Expected: {'diff': 744, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110010110; b = 10'b0010101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 744, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110011111; b = 10'b0110010110; bin = 1'b0; // Expected: {'diff': 521, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110011111; b = 10'b0110010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 521, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110011011; b = 10'b1111101111; bin = 1'b0; // Expected: {'diff': 428, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110011011; b = 10'b1111101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 428, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010011; b = 10'b0011100000; bin = 1'b0; // Expected: {'diff': 371, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010011; b = 10'b0011100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 371, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100011010; b = 10'b1111010010; bin = 1'b0; // Expected: {'diff': 840, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100011010; b = 10'b1111010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 840, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001111000; b = 10'b0110110111; bin = 1'b0; // Expected: {'diff': 705, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001111000; b = 10'b0110110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 705, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101011111; b = 10'b0011111100; bin = 1'b0; // Expected: {'diff': 99, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101011111; b = 10'b0011111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110000001; b = 10'b1000000010; bin = 1'b1; // Expected: {'diff': 382, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110000001; b = 10'b1000000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 382, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111001111; b = 10'b0011110111; bin = 1'b1; // Expected: {'diff': 727, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111001111; b = 10'b0011110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 727, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101010010; b = 10'b0101001001; bin = 1'b1; // Expected: {'diff': 520, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101010010; b = 10'b0101001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 520, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100111010; b = 10'b1010110111; bin = 1'b0; // Expected: {'diff': 643, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100111010; b = 10'b1010110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 643, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010000100; b = 10'b0000100000; bin = 1'b0; // Expected: {'diff': 100, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010000100; b = 10'b0000100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100110010; b = 10'b1011101110; bin = 1'b1; // Expected: {'diff': 579, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100110010; b = 10'b1011101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 579, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110010110; b = 10'b1110010111; bin = 1'b1; // Expected: {'diff': 510, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110010110; b = 10'b1110010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 510, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000010100; b = 10'b0011101101; bin = 1'b1; // Expected: {'diff': 294, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000010100; b = 10'b0011101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 294, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101100011; b = 10'b1001111101; bin = 1'b1; // Expected: {'diff': 229, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101100011; b = 10'b1001111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 229, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000111001; b = 10'b0001111000; bin = 1'b0; // Expected: {'diff': 961, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000111001; b = 10'b0001111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 961, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001100000; b = 10'b0011011110; bin = 1'b1; // Expected: {'diff': 385, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001100000; b = 10'b0011011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 385, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010001100; b = 10'b0111000011; bin = 1'b1; // Expected: {'diff': 712, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010001100; b = 10'b0111000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 712, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110011011; b = 10'b1000011000; bin = 1'b1; // Expected: {'diff': 898, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110011011; b = 10'b1000011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 898, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100010100; b = 10'b0110100100; bin = 1'b0; // Expected: {'diff': 880, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100010100; b = 10'b0110100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 880, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101110000; b = 10'b1001010110; bin = 1'b1; // Expected: {'diff': 281, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101110000; b = 10'b1001010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 281, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001110001; b = 10'b1011101001; bin = 1'b1; // Expected: {'diff': 903, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001110001; b = 10'b1011101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 903, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000010101; b = 10'b0011000011; bin = 1'b0; // Expected: {'diff': 338, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000010101; b = 10'b0011000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 338, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100001101; b = 10'b0101010010; bin = 1'b0; // Expected: {'diff': 443, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100001101; b = 10'b0101010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 443, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1100111001; b = 10'b1010011000; bin = 1'b0; // Expected: {'diff': 161, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1100111001; b = 10'b1010011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 161, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011011000; b = 10'b0010010110; bin = 1'b0; // Expected: {'diff': 578, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011011000; b = 10'b0010010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 578, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
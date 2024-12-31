
`timescale 1ns / 1ps

module tb_N7_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 7;
    
     
    // Inputs
    
    reg  [6:0] a;
    
    reg  [6:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [6:0] diff;
    
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
        
        a = 7'b0111111; b = 7'b1101011; bin = 1'b0; // Expected: {'diff': 84, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111111; b = 7'b1101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100000; b = 7'b0111100; bin = 1'b0; // Expected: {'diff': 36, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100000; b = 7'b0111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111110; b = 7'b1001101; bin = 1'b1; // Expected: {'diff': 112, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111110; b = 7'b1001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111110; b = 7'b1011011; bin = 1'b1; // Expected: {'diff': 98, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111110; b = 7'b1011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101110; b = 7'b1000100; bin = 1'b0; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101110; b = 7'b1000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b0110001; bin = 1'b1; // Expected: {'diff': 78, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b0110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 78, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010101; b = 7'b0100001; bin = 1'b0; // Expected: {'diff': 52, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010101; b = 7'b0100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111101; b = 7'b1011100; bin = 1'b0; // Expected: {'diff': 33, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111101; b = 7'b1011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001001; b = 7'b1001110; bin = 1'b1; // Expected: {'diff': 122, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001001; b = 7'b1001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 122, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010101; b = 7'b1011101; bin = 1'b0; // Expected: {'diff': 120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010101; b = 7'b1011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011001; b = 7'b1000110; bin = 1'b1; // Expected: {'diff': 18, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011001; b = 7'b1000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000011; b = 7'b1101111; bin = 1'b0; // Expected: {'diff': 84, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000011; b = 7'b1101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001000; b = 7'b1111010; bin = 1'b0; // Expected: {'diff': 78, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001000; b = 7'b1111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 78, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110111; b = 7'b1101001; bin = 1'b1; // Expected: {'diff': 77, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110111; b = 7'b1101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110000; b = 7'b0001100; bin = 1'b0; // Expected: {'diff': 36, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110000; b = 7'b0001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010100; b = 7'b0101011; bin = 1'b1; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010100; b = 7'b0101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b1010110; bin = 1'b1; // Expected: {'diff': 51, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b1010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000011; b = 7'b1001010; bin = 1'b0; // Expected: {'diff': 121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000011; b = 7'b1001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b1111110; bin = 1'b0; // Expected: {'diff': 79, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b1111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110010; b = 7'b0100000; bin = 1'b0; // Expected: {'diff': 18, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110010; b = 7'b0100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000101; b = 7'b1000001; bin = 1'b0; // Expected: {'diff': 68, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000101; b = 7'b1000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111000; b = 7'b1110110; bin = 1'b1; // Expected: {'diff': 65, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111000; b = 7'b1110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101000; b = 7'b1110100; bin = 1'b1; // Expected: {'diff': 51, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101000; b = 7'b1110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110100; b = 7'b1001100; bin = 1'b0; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110100; b = 7'b1001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000111; b = 7'b1001111; bin = 1'b0; // Expected: {'diff': 56, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000111; b = 7'b1001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b1001010; bin = 1'b0; // Expected: {'diff': 23, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b1001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b0101000; bin = 1'b1; // Expected: {'diff': 126, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b0101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 126, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b0000011; bin = 1'b0; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b0000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100101; b = 7'b0110010; bin = 1'b1; // Expected: {'diff': 114, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100101; b = 7'b0110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 114, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000110; b = 7'b0101000; bin = 1'b1; // Expected: {'diff': 93, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000110; b = 7'b0101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101101; b = 7'b1111100; bin = 1'b1; // Expected: {'diff': 112, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101101; b = 7'b1111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101010; b = 7'b1111001; bin = 1'b1; // Expected: {'diff': 48, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101010; b = 7'b1111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b0111001; bin = 1'b1; // Expected: {'diff': 21, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b0111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100101; b = 7'b0000011; bin = 1'b1; // Expected: {'diff': 97, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100101; b = 7'b0000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011001; b = 7'b1001110; bin = 1'b0; // Expected: {'diff': 11, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011001; b = 7'b1001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101101; b = 7'b0101010; bin = 1'b0; // Expected: {'diff': 67, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101101; b = 7'b0101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011100; b = 7'b0101111; bin = 1'b0; // Expected: {'diff': 109, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011100; b = 7'b0101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 109, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b1100011; bin = 1'b0; // Expected: {'diff': 105, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b1100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 105, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100101; b = 7'b0010000; bin = 1'b0; // Expected: {'diff': 21, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100101; b = 7'b0010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111101; b = 7'b1010100; bin = 1'b0; // Expected: {'diff': 105, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111101; b = 7'b1010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 105, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010100; b = 7'b0010001; bin = 1'b0; // Expected: {'diff': 67, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010100; b = 7'b0010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b0110110; bin = 1'b0; // Expected: {'diff': 34, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b0110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001001; b = 7'b0100001; bin = 1'b1; // Expected: {'diff': 103, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b0100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110100; b = 7'b1110010; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110100; b = 7'b1110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100101; b = 7'b0100100; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100101; b = 7'b0100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010100; b = 7'b0111101; bin = 1'b0; // Expected: {'diff': 87, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010100; b = 7'b0111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 87, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011001; b = 7'b0010111; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011001; b = 7'b0010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001000; b = 7'b1111001; bin = 1'b0; // Expected: {'diff': 15, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001000; b = 7'b1111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011001; b = 7'b1001110; bin = 1'b0; // Expected: {'diff': 75, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011001; b = 7'b1001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000100; b = 7'b1011011; bin = 1'b0; // Expected: {'diff': 105, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000100; b = 7'b1011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 105, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010101; b = 7'b1000000; bin = 1'b1; // Expected: {'diff': 84, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010101; b = 7'b1000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100010; b = 7'b1011010; bin = 1'b1; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100010; b = 7'b1011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000000; b = 7'b0100111; bin = 1'b1; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000000; b = 7'b0100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010101; b = 7'b1101100; bin = 1'b1; // Expected: {'diff': 104, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010101; b = 7'b1101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 104, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101101; b = 7'b0010110; bin = 1'b1; // Expected: {'diff': 22, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101101; b = 7'b0010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100110; b = 7'b0010001; bin = 1'b1; // Expected: {'diff': 84, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100110; b = 7'b0010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010001; b = 7'b1010110; bin = 1'b0; // Expected: {'diff': 123, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010001; b = 7'b1010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 123, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b0011011; bin = 1'b1; // Expected: {'diff': 60, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b0011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000111; b = 7'b1000011; bin = 1'b1; // Expected: {'diff': 67, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000111; b = 7'b1000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b1010101; bin = 1'b1; // Expected: {'diff': 81, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b1010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 81, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100001; b = 7'b1010010; bin = 1'b0; // Expected: {'diff': 79, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100001; b = 7'b1010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110101; b = 7'b1101000; bin = 1'b0; // Expected: {'diff': 77, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110101; b = 7'b1101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111110; b = 7'b1011001; bin = 1'b0; // Expected: {'diff': 101, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111110; b = 7'b1011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 101, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110011; b = 7'b1011011; bin = 1'b1; // Expected: {'diff': 23, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110011; b = 7'b1011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000111; b = 7'b0111111; bin = 1'b1; // Expected: {'diff': 71, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000111; b = 7'b0111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 71, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101101; b = 7'b0100101; bin = 1'b1; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101101; b = 7'b0100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110010; b = 7'b1000011; bin = 1'b1; // Expected: {'diff': 46, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110010; b = 7'b1000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010000; b = 7'b1011000; bin = 1'b0; // Expected: {'diff': 56, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010000; b = 7'b1011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b1010101; bin = 1'b0; // Expected: {'diff': 43, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b1010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010111; b = 7'b1010010; bin = 1'b0; // Expected: {'diff': 69, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010111; b = 7'b1010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 69, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100100; b = 7'b0001000; bin = 1'b0; // Expected: {'diff': 92, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100100; b = 7'b0001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011001; b = 7'b0001111; bin = 1'b1; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011001; b = 7'b0001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001001; b = 7'b0001111; bin = 1'b1; // Expected: {'diff': 121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b0001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100101; b = 7'b1111101; bin = 1'b1; // Expected: {'diff': 39, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100101; b = 7'b1111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100010; b = 7'b0111000; bin = 1'b1; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100010; b = 7'b0111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100111; b = 7'b0010110; bin = 1'b1; // Expected: {'diff': 80, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100111; b = 7'b0010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 80, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011011; b = 7'b1111001; bin = 1'b1; // Expected: {'diff': 97, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011011; b = 7'b1111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011010; b = 7'b0100110; bin = 1'b0; // Expected: {'diff': 116, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011010; b = 7'b0100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 116, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010010; b = 7'b0110010; bin = 1'b0; // Expected: {'diff': 96, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010010; b = 7'b0110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100011; b = 7'b1001101; bin = 1'b0; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100011; b = 7'b1001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011011; b = 7'b0000110; bin = 1'b1; // Expected: {'diff': 20, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011011; b = 7'b0000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001011; b = 7'b1011100; bin = 1'b1; // Expected: {'diff': 46, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001011; b = 7'b1011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101000; b = 7'b1000001; bin = 1'b1; // Expected: {'diff': 102, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101000; b = 7'b1000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011001; b = 7'b0110011; bin = 1'b0; // Expected: {'diff': 102, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011001; b = 7'b0110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001110; b = 7'b1100100; bin = 1'b0; // Expected: {'diff': 42, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b1100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101101; b = 7'b1001011; bin = 1'b0; // Expected: {'diff': 98, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101101; b = 7'b1001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010011; b = 7'b0000110; bin = 1'b0; // Expected: {'diff': 13, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010011; b = 7'b0000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b1001001; bin = 1'b1; // Expected: {'diff': 93, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b1001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110000; b = 7'b1101101; bin = 1'b0; // Expected: {'diff': 67, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110000; b = 7'b1101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101000; b = 7'b1111101; bin = 1'b0; // Expected: {'diff': 107, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101000; b = 7'b1111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 107, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100011; b = 7'b1101001; bin = 1'b1; // Expected: {'diff': 57, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100011; b = 7'b1101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100101; b = 7'b0100011; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100101; b = 7'b0100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000011; b = 7'b1100001; bin = 1'b0; // Expected: {'diff': 98, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000011; b = 7'b1100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010000; b = 7'b1100101; bin = 1'b0; // Expected: {'diff': 43, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010000; b = 7'b1100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000010; b = 7'b1001111; bin = 1'b0; // Expected: {'diff': 51, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000010; b = 7'b1001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000101; b = 7'b0000110; bin = 1'b0; // Expected: {'diff': 127, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000101; b = 7'b0000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 127, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010010; b = 7'b0010001; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010010; b = 7'b0010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010011; b = 7'b0111101; bin = 1'b0; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010011; b = 7'b0111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101100; b = 7'b0100001; bin = 1'b0; // Expected: {'diff': 75, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101100; b = 7'b0100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101001; b = 7'b0101010; bin = 1'b1; // Expected: {'diff': 62, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101001; b = 7'b0101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b0100110; bin = 1'b1; // Expected: {'diff': 89, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b0100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 89, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010111; b = 7'b0110100; bin = 1'b0; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010111; b = 7'b0110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101000; b = 7'b0100001; bin = 1'b1; // Expected: {'diff': 70, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101000; b = 7'b0100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 70, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b0010000; bin = 1'b1; // Expected: {'diff': 80, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b0010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 80, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001001; b = 7'b1101101; bin = 1'b1; // Expected: {'diff': 27, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b1101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b1011111; bin = 1'b1; // Expected: {'diff': 124, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b1011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 124, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011101; b = 7'b0101010; bin = 1'b0; // Expected: {'diff': 51, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011101; b = 7'b0101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000110; b = 7'b0010001; bin = 1'b0; // Expected: {'diff': 53, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000110; b = 7'b0010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010010; b = 7'b1001010; bin = 1'b1; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010010; b = 7'b1001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010101; b = 7'b1001100; bin = 1'b0; // Expected: {'diff': 73, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010101; b = 7'b1001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 73, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111001; b = 7'b1010010; bin = 1'b0; // Expected: {'diff': 103, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111001; b = 7'b1010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111011; b = 7'b1010011; bin = 1'b1; // Expected: {'diff': 103, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111011; b = 7'b1010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100111; b = 7'b1010000; bin = 1'b1; // Expected: {'diff': 22, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100111; b = 7'b1010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110010; b = 7'b0101000; bin = 1'b1; // Expected: {'diff': 73, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110010; b = 7'b0101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 73, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010001; b = 7'b1010011; bin = 1'b0; // Expected: {'diff': 62, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010001; b = 7'b1010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100000; b = 7'b0101011; bin = 1'b0; // Expected: {'diff': 117, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100000; b = 7'b0101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 117, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111001; b = 7'b0101011; bin = 1'b1; // Expected: {'diff': 13, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111001; b = 7'b0101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000101; b = 7'b1010001; bin = 1'b1; // Expected: {'diff': 115, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000101; b = 7'b1010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 115, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011100; b = 7'b0111100; bin = 1'b0; // Expected: {'diff': 96, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011100; b = 7'b0111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101111; b = 7'b1110110; bin = 1'b1; // Expected: {'diff': 120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101111; b = 7'b1110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011010; b = 7'b0011010; bin = 1'b1; // Expected: {'diff': 127, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011010; b = 7'b0011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 127, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001000; b = 7'b0000001; bin = 1'b0; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001000; b = 7'b0000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111000; b = 7'b0001000; bin = 1'b0; // Expected: {'diff': 48, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111000; b = 7'b0001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110010; b = 7'b0011001; bin = 1'b0; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110010; b = 7'b0011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000101; b = 7'b1001111; bin = 1'b0; // Expected: {'diff': 54, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000101; b = 7'b1001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101000; b = 7'b0001010; bin = 1'b1; // Expected: {'diff': 29, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101000; b = 7'b0001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011110; b = 7'b1110101; bin = 1'b0; // Expected: {'diff': 41, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011110; b = 7'b1110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101110; b = 7'b0000011; bin = 1'b1; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101110; b = 7'b0000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b0000100; bin = 1'b1; // Expected: {'diff': 92, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b0000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010111; b = 7'b0000010; bin = 1'b0; // Expected: {'diff': 85, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010111; b = 7'b0000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 85, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000010; b = 7'b0110100; bin = 1'b1; // Expected: {'diff': 77, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000010; b = 7'b0110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101001; b = 7'b1010010; bin = 1'b1; // Expected: {'diff': 22, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101001; b = 7'b1010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110101; b = 7'b0011111; bin = 1'b0; // Expected: {'diff': 86, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110101; b = 7'b0011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b1010000; bin = 1'b1; // Expected: {'diff': 16, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b1010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b1001010; bin = 1'b0; // Expected: {'diff': 93, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b1001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100110; b = 7'b1010100; bin = 1'b0; // Expected: {'diff': 18, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100110; b = 7'b1010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b0110101; bin = 1'b0; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b0110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b1011000; bin = 1'b1; // Expected: {'diff': 116, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b1011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 116, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010000; b = 7'b0101110; bin = 1'b1; // Expected: {'diff': 33, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010000; b = 7'b0101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100011; b = 7'b1100110; bin = 1'b1; // Expected: {'diff': 60, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100011; b = 7'b1100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110110; b = 7'b0100111; bin = 1'b1; // Expected: {'diff': 78, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110110; b = 7'b0100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 78, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b0001000; bin = 1'b0; // Expected: {'diff': 120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b0001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100110; b = 7'b0101001; bin = 1'b0; // Expected: {'diff': 125, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100110; b = 7'b0101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101000; b = 7'b0001001; bin = 1'b0; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101000; b = 7'b0001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100101; b = 7'b0111011; bin = 1'b0; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100101; b = 7'b0111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111011; b = 7'b1110101; bin = 1'b0; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111011; b = 7'b1110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011010; b = 7'b0011011; bin = 1'b0; // Expected: {'diff': 63, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011010; b = 7'b0011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101100; b = 7'b0111010; bin = 1'b0; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101100; b = 7'b0111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101000; b = 7'b1011100; bin = 1'b1; // Expected: {'diff': 75, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101000; b = 7'b1011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000100; b = 7'b0000100; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000100; b = 7'b0000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111000; b = 7'b0000111; bin = 1'b0; // Expected: {'diff': 49, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111000; b = 7'b0000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b1001101; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b1001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111100; b = 7'b0000100; bin = 1'b0; // Expected: {'diff': 120, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111100; b = 7'b0000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011010; b = 7'b0111001; bin = 1'b1; // Expected: {'diff': 32, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011010; b = 7'b0111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b0101110; bin = 1'b1; // Expected: {'diff': 31, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b0101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110110; b = 7'b1111000; bin = 1'b1; // Expected: {'diff': 61, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110110; b = 7'b1111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111111; b = 7'b0101010; bin = 1'b0; // Expected: {'diff': 21, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111111; b = 7'b0101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000101; b = 7'b0000111; bin = 1'b0; // Expected: {'diff': 62, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000101; b = 7'b0000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b1111011; bin = 1'b0; // Expected: {'diff': 102, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b1111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111001; b = 7'b0011100; bin = 1'b0; // Expected: {'diff': 93, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111001; b = 7'b0011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111001; b = 7'b0110100; bin = 1'b0; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111001; b = 7'b0110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000110; b = 7'b0010000; bin = 1'b0; // Expected: {'diff': 54, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000110; b = 7'b0010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110101; b = 7'b1001010; bin = 1'b1; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110101; b = 7'b1001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011011; b = 7'b1010100; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011011; b = 7'b1010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101000; b = 7'b1111001; bin = 1'b0; // Expected: {'diff': 47, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101000; b = 7'b1111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110111; b = 7'b0000011; bin = 1'b0; // Expected: {'diff': 116, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110111; b = 7'b0000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 116, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b0010111; bin = 1'b0; // Expected: {'diff': 56, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b0010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101101; b = 7'b1110000; bin = 1'b1; // Expected: {'diff': 60, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101101; b = 7'b1110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100101; b = 7'b1011101; bin = 1'b1; // Expected: {'diff': 71, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100101; b = 7'b1011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 71, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010001; b = 7'b0101101; bin = 1'b1; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010001; b = 7'b0101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000111; b = 7'b1111000; bin = 1'b0; // Expected: {'diff': 15, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000111; b = 7'b1111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011100; b = 7'b0000011; bin = 1'b0; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011100; b = 7'b0000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b1001000; bin = 1'b1; // Expected: {'diff': 67, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b1001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111000; b = 7'b1100100; bin = 1'b0; // Expected: {'diff': 84, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111000; b = 7'b1100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101011; b = 7'b0100110; bin = 1'b0; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101011; b = 7'b0100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b0010101; bin = 1'b1; // Expected: {'diff': 55, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b0010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010001; b = 7'b0110010; bin = 1'b1; // Expected: {'diff': 30, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010001; b = 7'b0110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000101; b = 7'b1110001; bin = 1'b0; // Expected: {'diff': 84, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000101; b = 7'b1110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010100; b = 7'b0001011; bin = 1'b1; // Expected: {'diff': 8, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010100; b = 7'b0001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b0111000; bin = 1'b0; // Expected: {'diff': 32, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b0111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100001; b = 7'b0010000; bin = 1'b1; // Expected: {'diff': 16, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100001; b = 7'b0010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101111; b = 7'b1011110; bin = 1'b0; // Expected: {'diff': 81, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101111; b = 7'b1011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 81, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110010; b = 7'b1100111; bin = 1'b0; // Expected: {'diff': 75, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110010; b = 7'b1100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b0101111; bin = 1'b0; // Expected: {'diff': 31, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b0101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100110; b = 7'b0010101; bin = 1'b0; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100110; b = 7'b0010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011100; b = 7'b1011000; bin = 1'b0; // Expected: {'diff': 68, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011100; b = 7'b1011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111110; b = 7'b0110111; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111110; b = 7'b0110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011001; b = 7'b1101111; bin = 1'b1; // Expected: {'diff': 105, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011001; b = 7'b1101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 105, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111100; b = 7'b1011101; bin = 1'b1; // Expected: {'diff': 94, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111100; b = 7'b1011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 94, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110111; b = 7'b1011011; bin = 1'b1; // Expected: {'diff': 27, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110111; b = 7'b1011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110110; b = 7'b1011101; bin = 1'b1; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110110; b = 7'b1011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111101; b = 7'b1001000; bin = 1'b1; // Expected: {'diff': 52, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111101; b = 7'b1001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101111; b = 7'b1000111; bin = 1'b0; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101111; b = 7'b1000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100010; b = 7'b0011100; bin = 1'b0; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100010; b = 7'b0011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010101; b = 7'b0000110; bin = 1'b1; // Expected: {'diff': 78, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010101; b = 7'b0000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 78, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110111; b = 7'b1101110; bin = 1'b1; // Expected: {'diff': 72, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110111; b = 7'b1101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 72, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101110; b = 7'b1100111; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101110; b = 7'b1100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101101; b = 7'b0100101; bin = 1'b0; // Expected: {'diff': 8, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101101; b = 7'b0100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110100; b = 7'b0111110; bin = 1'b0; // Expected: {'diff': 118, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110100; b = 7'b0111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101011; b = 7'b1010100; bin = 1'b0; // Expected: {'diff': 87, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101011; b = 7'b1010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 87, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010110; b = 7'b1000000; bin = 1'b0; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010110; b = 7'b1000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111011; b = 7'b0000111; bin = 1'b1; // Expected: {'diff': 115, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111011; b = 7'b0000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101111; b = 7'b0001001; bin = 1'b0; // Expected: {'diff': 102, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101111; b = 7'b0001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111100; b = 7'b1100001; bin = 1'b1; // Expected: {'diff': 90, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111100; b = 7'b1100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110000; b = 7'b1101100; bin = 1'b1; // Expected: {'diff': 67, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110000; b = 7'b1101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111100; b = 7'b0110000; bin = 1'b1; // Expected: {'diff': 11, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111100; b = 7'b0110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011011; b = 7'b0111001; bin = 1'b1; // Expected: {'diff': 97, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011011; b = 7'b0111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b0000101; bin = 1'b1; // Expected: {'diff': 91, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b0000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 91, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111011; b = 7'b1100001; bin = 1'b1; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111011; b = 7'b1100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010011; b = 7'b1111000; bin = 1'b1; // Expected: {'diff': 26, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010011; b = 7'b1111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b1100110; bin = 1'b1; // Expected: {'diff': 76, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b1100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 76, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100010; b = 7'b1001001; bin = 1'b1; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100010; b = 7'b1001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011101; b = 7'b0000100; bin = 1'b1; // Expected: {'diff': 88, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011101; b = 7'b0000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111001; b = 7'b1010001; bin = 1'b0; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111001; b = 7'b1010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010101; b = 7'b0100010; bin = 1'b1; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010101; b = 7'b0100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101111; b = 7'b0110111; bin = 1'b0; // Expected: {'diff': 120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101111; b = 7'b0110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111000; b = 7'b0111101; bin = 1'b1; // Expected: {'diff': 122, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111000; b = 7'b0111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 122, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100000; b = 7'b1011011; bin = 1'b0; // Expected: {'diff': 69, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100000; b = 7'b1011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 69, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b1010010; bin = 1'b0; // Expected: {'diff': 124, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b1010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 124, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010100; b = 7'b1111000; bin = 1'b0; // Expected: {'diff': 92, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010100; b = 7'b1111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111100; b = 7'b0001100; bin = 1'b0; // Expected: {'diff': 48, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111100; b = 7'b0001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001110; b = 7'b1001101; bin = 1'b1; // Expected: {'diff': 64, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b1001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111011; b = 7'b0101001; bin = 1'b1; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111011; b = 7'b0101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100110; b = 7'b1001111; bin = 1'b1; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100110; b = 7'b1001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001101; b = 7'b1011000; bin = 1'b0; // Expected: {'diff': 53, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001101; b = 7'b1011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011011; b = 7'b0001011; bin = 1'b1; // Expected: {'diff': 79, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011011; b = 7'b0001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000111; b = 7'b1101011; bin = 1'b1; // Expected: {'diff': 91, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000111; b = 7'b1101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 91, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b0000100; bin = 1'b1; // Expected: {'diff': 87, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b0000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 87, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000001; b = 7'b1101000; bin = 1'b1; // Expected: {'diff': 88, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000001; b = 7'b1101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001110; b = 7'b1000001; bin = 1'b1; // Expected: {'diff': 76, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b1000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 76, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110011; b = 7'b1011101; bin = 1'b0; // Expected: {'diff': 22, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110011; b = 7'b1011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b0110111; bin = 1'b0; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b0110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111110; b = 7'b0000010; bin = 1'b0; // Expected: {'diff': 124, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111110; b = 7'b0000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010110; b = 7'b1111100; bin = 1'b0; // Expected: {'diff': 26, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010110; b = 7'b1111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110100; b = 7'b1110111; bin = 1'b1; // Expected: {'diff': 60, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110100; b = 7'b1110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b0010100; bin = 1'b1; // Expected: {'diff': 57, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b0010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100101; b = 7'b1100011; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100101; b = 7'b1100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110101; b = 7'b0000011; bin = 1'b0; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110101; b = 7'b0000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001101; b = 7'b0101000; bin = 1'b0; // Expected: {'diff': 101, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001101; b = 7'b0101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 101, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001101; b = 7'b0110110; bin = 1'b0; // Expected: {'diff': 87, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001101; b = 7'b0110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 87, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011111; b = 7'b0100000; bin = 1'b1; // Expected: {'diff': 62, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011111; b = 7'b0100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111010; b = 7'b1101111; bin = 1'b0; // Expected: {'diff': 75, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111010; b = 7'b1101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101010; b = 7'b0110100; bin = 1'b1; // Expected: {'diff': 53, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101010; b = 7'b0110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001001; b = 7'b0111010; bin = 1'b1; // Expected: {'diff': 78, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b0111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 78, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b0100011; bin = 1'b0; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b0100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000011; b = 7'b0101010; bin = 1'b1; // Expected: {'diff': 88, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000011; b = 7'b0101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100010; b = 7'b1111001; bin = 1'b0; // Expected: {'diff': 41, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100010; b = 7'b1111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000001; b = 7'b1011100; bin = 1'b1; // Expected: {'diff': 100, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000001; b = 7'b1011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b1010010; bin = 1'b1; // Expected: {'diff': 121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b1010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111010; b = 7'b1000110; bin = 1'b0; // Expected: {'diff': 52, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111010; b = 7'b1000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001101; b = 7'b1001001; bin = 1'b0; // Expected: {'diff': 68, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001101; b = 7'b1001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001110; b = 7'b0000010; bin = 1'b0; // Expected: {'diff': 12, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b0000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b0011001; bin = 1'b0; // Expected: {'diff': 63, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b0011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110111; b = 7'b1000010; bin = 1'b0; // Expected: {'diff': 53, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110111; b = 7'b1000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101010; b = 7'b0001000; bin = 1'b1; // Expected: {'diff': 97, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101010; b = 7'b0001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b0011110; bin = 1'b1; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b0011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111101; b = 7'b1000100; bin = 1'b0; // Expected: {'diff': 57, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111101; b = 7'b1000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111110; b = 7'b0100011; bin = 1'b0; // Expected: {'diff': 27, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111110; b = 7'b0100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000000; b = 7'b0100100; bin = 1'b1; // Expected: {'diff': 27, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000000; b = 7'b0100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000101; b = 7'b0011110; bin = 1'b0; // Expected: {'diff': 103, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000101; b = 7'b0011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100000; b = 7'b0000110; bin = 1'b0; // Expected: {'diff': 90, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100000; b = 7'b0000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110100; b = 7'b0010001; bin = 1'b1; // Expected: {'diff': 34, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110100; b = 7'b0010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011011; b = 7'b1110011; bin = 1'b0; // Expected: {'diff': 40, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011011; b = 7'b1110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101010; b = 7'b0110101; bin = 1'b1; // Expected: {'diff': 52, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101010; b = 7'b0110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 52, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010100; b = 7'b0100111; bin = 1'b1; // Expected: {'diff': 108, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010100; b = 7'b0100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011011; b = 7'b0000011; bin = 1'b0; // Expected: {'diff': 24, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011011; b = 7'b0000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001000; b = 7'b0110011; bin = 1'b0; // Expected: {'diff': 21, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001000; b = 7'b0110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000101; b = 7'b0100010; bin = 1'b0; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000101; b = 7'b0100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001010; b = 7'b1010101; bin = 1'b0; // Expected: {'diff': 117, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001010; b = 7'b1010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 117, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101101; b = 7'b0000001; bin = 1'b1; // Expected: {'diff': 43, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101101; b = 7'b0000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011100; b = 7'b0011100; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011100; b = 7'b0011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000001; b = 7'b1010111; bin = 1'b0; // Expected: {'diff': 42, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000001; b = 7'b1010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111110; b = 7'b0111011; bin = 1'b1; // Expected: {'diff': 66, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111110; b = 7'b0111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 66, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011101; b = 7'b1101000; bin = 1'b1; // Expected: {'diff': 116, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011101; b = 7'b1101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 116, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b0101110; bin = 1'b0; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b0101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b1001110; bin = 1'b1; // Expected: {'diff': 59, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b1001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111011; b = 7'b0011100; bin = 1'b0; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111011; b = 7'b0011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110001; b = 7'b0101001; bin = 1'b1; // Expected: {'diff': 71, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110001; b = 7'b0101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 71, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010101; b = 7'b0100000; bin = 1'b0; // Expected: {'diff': 117, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010101; b = 7'b0100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 117, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b0010000; bin = 1'b1; // Expected: {'diff': 71, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b0010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 71, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b1111011; bin = 1'b0; // Expected: {'diff': 44, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b1111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110000; b = 7'b0011100; bin = 1'b1; // Expected: {'diff': 83, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110000; b = 7'b0011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 83, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100010; b = 7'b1111110; bin = 1'b1; // Expected: {'diff': 99, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100010; b = 7'b1111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010001; b = 7'b0101001; bin = 1'b0; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010001; b = 7'b0101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b1100000; bin = 1'b1; // Expected: {'diff': 41, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b1100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111011; b = 7'b1111110; bin = 1'b0; // Expected: {'diff': 61, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111011; b = 7'b1111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110101; b = 7'b0110000; bin = 1'b1; // Expected: {'diff': 68, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110101; b = 7'b0110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101000; b = 7'b1000001; bin = 1'b1; // Expected: {'diff': 38, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101000; b = 7'b1000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 38, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011111; b = 7'b0101011; bin = 1'b1; // Expected: {'diff': 51, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011111; b = 7'b0101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010100; b = 7'b0101010; bin = 1'b1; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010100; b = 7'b0101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111001; b = 7'b1001011; bin = 1'b1; // Expected: {'diff': 45, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111001; b = 7'b1001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010110; b = 7'b0010110; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010110; b = 7'b0010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010110; b = 7'b1011111; bin = 1'b1; // Expected: {'diff': 54, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010110; b = 7'b1011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111011; b = 7'b1100011; bin = 1'b0; // Expected: {'diff': 88, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111011; b = 7'b1100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000000; b = 7'b0100010; bin = 1'b0; // Expected: {'diff': 30, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000000; b = 7'b0100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011011; b = 7'b0011011; bin = 1'b0; // Expected: {'diff': 64, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011011; b = 7'b0011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011011; b = 7'b0111100; bin = 1'b0; // Expected: {'diff': 31, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011011; b = 7'b0111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011111; b = 7'b0011101; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011111; b = 7'b0011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111010; b = 7'b1111011; bin = 1'b0; // Expected: {'diff': 63, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111010; b = 7'b1111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100010; b = 7'b0101010; bin = 1'b0; // Expected: {'diff': 120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100010; b = 7'b0101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000110; b = 7'b0110101; bin = 1'b1; // Expected: {'diff': 80, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000110; b = 7'b0110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 80, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101011; b = 7'b1001011; bin = 1'b0; // Expected: {'diff': 32, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101011; b = 7'b1001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000111; b = 7'b1010101; bin = 1'b1; // Expected: {'diff': 113, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000111; b = 7'b1010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 113, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100011; b = 7'b1001111; bin = 1'b1; // Expected: {'diff': 19, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100011; b = 7'b1001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000111; b = 7'b0110110; bin = 1'b1; // Expected: {'diff': 16, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000111; b = 7'b0110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011010; b = 7'b1100001; bin = 1'b0; // Expected: {'diff': 57, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011010; b = 7'b1100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000011; b = 7'b1011110; bin = 1'b1; // Expected: {'diff': 100, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000011; b = 7'b1011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b1111000; bin = 1'b1; // Expected: {'diff': 19, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b1111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b1111111; bin = 1'b0; // Expected: {'diff': 98, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b1111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b1110011; bin = 1'b0; // Expected: {'diff': 25, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b1110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011100; b = 7'b0111111; bin = 1'b1; // Expected: {'diff': 92, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011100; b = 7'b0111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101011; b = 7'b0000001; bin = 1'b0; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101011; b = 7'b0000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110010; b = 7'b0110000; bin = 1'b1; // Expected: {'diff': 65, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110010; b = 7'b0110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b1101010; bin = 1'b1; // Expected: {'diff': 109, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b1101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 109, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010001; b = 7'b0111111; bin = 1'b0; // Expected: {'diff': 18, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010001; b = 7'b0111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110111; b = 7'b0100001; bin = 1'b0; // Expected: {'diff': 86, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110111; b = 7'b0100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011101; b = 7'b0100000; bin = 1'b0; // Expected: {'diff': 61, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011101; b = 7'b0100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010100; b = 7'b0001101; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010100; b = 7'b0001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001111; b = 7'b0110000; bin = 1'b0; // Expected: {'diff': 95, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001111; b = 7'b0110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011110; b = 7'b0110011; bin = 1'b1; // Expected: {'diff': 106, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011110; b = 7'b0110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 106, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101100; b = 7'b0011110; bin = 1'b0; // Expected: {'diff': 14, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101100; b = 7'b0011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101001; b = 7'b1000101; bin = 1'b0; // Expected: {'diff': 100, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101001; b = 7'b1000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101001; b = 7'b0000110; bin = 1'b0; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101001; b = 7'b0000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001010; b = 7'b0011100; bin = 1'b0; // Expected: {'diff': 46, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001010; b = 7'b0011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111101; b = 7'b1011101; bin = 1'b1; // Expected: {'diff': 95, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111101; b = 7'b1011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101111; b = 7'b1111011; bin = 1'b1; // Expected: {'diff': 115, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101111; b = 7'b1111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 115, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010011; b = 7'b1001010; bin = 1'b0; // Expected: {'diff': 73, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010011; b = 7'b1001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 73, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111000; b = 7'b1100110; bin = 1'b1; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111000; b = 7'b1100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110000; b = 7'b0001011; bin = 1'b0; // Expected: {'diff': 37, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110000; b = 7'b0001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101110; b = 7'b0111010; bin = 1'b1; // Expected: {'diff': 51, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101110; b = 7'b0111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b0001010; bin = 1'b1; // Expected: {'diff': 81, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b0001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 81, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b1111001; bin = 1'b0; // Expected: {'diff': 58, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b1111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b0001110; bin = 1'b0; // Expected: {'diff': 83, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b0001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 83, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100011; b = 7'b0000000; bin = 1'b1; // Expected: {'diff': 98, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100011; b = 7'b0000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011101; b = 7'b0010000; bin = 1'b0; // Expected: {'diff': 77, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011101; b = 7'b0010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110100; b = 7'b1111100; bin = 1'b0; // Expected: {'diff': 56, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110100; b = 7'b1111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000001; b = 7'b1001010; bin = 1'b1; // Expected: {'diff': 118, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000001; b = 7'b1001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101010; b = 7'b1001011; bin = 1'b1; // Expected: {'diff': 30, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101010; b = 7'b1001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000011; b = 7'b1011110; bin = 1'b0; // Expected: {'diff': 37, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000011; b = 7'b1011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011111; b = 7'b0110110; bin = 1'b0; // Expected: {'diff': 105, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011111; b = 7'b0110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 105, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001000; b = 7'b0001110; bin = 1'b0; // Expected: {'diff': 122, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001000; b = 7'b0001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 122, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101100; b = 7'b0001011; bin = 1'b0; // Expected: {'diff': 33, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101100; b = 7'b0001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100010; b = 7'b1100101; bin = 1'b0; // Expected: {'diff': 61, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100010; b = 7'b1100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010110; b = 7'b1000101; bin = 1'b0; // Expected: {'diff': 81, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010110; b = 7'b1000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 81, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111100; b = 7'b1011000; bin = 1'b0; // Expected: {'diff': 100, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111100; b = 7'b1011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010011; b = 7'b0000101; bin = 1'b1; // Expected: {'diff': 77, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010011; b = 7'b0000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b1000000; bin = 1'b1; // Expected: {'diff': 23, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b1000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011010; b = 7'b0100010; bin = 1'b0; // Expected: {'diff': 120, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011010; b = 7'b0100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 120, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110000; b = 7'b1101001; bin = 1'b0; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110000; b = 7'b1101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001000; b = 7'b0001100; bin = 1'b1; // Expected: {'diff': 123, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001000; b = 7'b0001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 123, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b1001101; bin = 1'b1; // Expected: {'diff': 60, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b1001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110110; b = 7'b1110010; bin = 1'b0; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110110; b = 7'b1110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110011; b = 7'b0100111; bin = 1'b1; // Expected: {'diff': 75, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110011; b = 7'b0100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010011; b = 7'b0010111; bin = 1'b0; // Expected: {'diff': 60, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010011; b = 7'b0010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011111; b = 7'b0111010; bin = 1'b0; // Expected: {'diff': 37, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011111; b = 7'b0111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110001; b = 7'b0010101; bin = 1'b0; // Expected: {'diff': 92, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110001; b = 7'b0010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b1110101; bin = 1'b1; // Expected: {'diff': 10, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b1110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101101; b = 7'b1000011; bin = 1'b1; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101101; b = 7'b1000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110001; b = 7'b1100101; bin = 1'b0; // Expected: {'diff': 12, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110001; b = 7'b1100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011110; b = 7'b0010110; bin = 1'b1; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011110; b = 7'b0010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000000; b = 7'b1101010; bin = 1'b0; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000000; b = 7'b1101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110001; b = 7'b1010011; bin = 1'b0; // Expected: {'diff': 94, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110001; b = 7'b1010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 94, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101011; b = 7'b1010011; bin = 1'b1; // Expected: {'diff': 87, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101011; b = 7'b1010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 87, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101110; b = 7'b1100110; bin = 1'b1; // Expected: {'diff': 71, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101110; b = 7'b1100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 71, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110100; b = 7'b1001000; bin = 1'b0; // Expected: {'diff': 44, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110100; b = 7'b1001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110100; b = 7'b1111111; bin = 1'b0; // Expected: {'diff': 117, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110100; b = 7'b1111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 117, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100010; b = 7'b0101101; bin = 1'b0; // Expected: {'diff': 53, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100010; b = 7'b0101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110100; b = 7'b0111101; bin = 1'b0; // Expected: {'diff': 119, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110100; b = 7'b0111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 119, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011111; b = 7'b0101110; bin = 1'b1; // Expected: {'diff': 48, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011111; b = 7'b0101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010010; b = 7'b1011010; bin = 1'b0; // Expected: {'diff': 56, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010010; b = 7'b1011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001110; b = 7'b1111011; bin = 1'b1; // Expected: {'diff': 18, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b1111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b1110000; bin = 1'b0; // Expected: {'diff': 95, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b1110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101111; b = 7'b1011100; bin = 1'b0; // Expected: {'diff': 83, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101111; b = 7'b1011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 83, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101010; b = 7'b0000100; bin = 1'b0; // Expected: {'diff': 102, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101010; b = 7'b0000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011000; b = 7'b1111100; bin = 1'b0; // Expected: {'diff': 28, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011000; b = 7'b1111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100101; b = 7'b0011011; bin = 1'b1; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100101; b = 7'b0011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100011; b = 7'b0110010; bin = 1'b0; // Expected: {'diff': 113, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100011; b = 7'b0110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 113, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000111; b = 7'b0000000; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000111; b = 7'b0000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011010; b = 7'b0110100; bin = 1'b1; // Expected: {'diff': 101, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011010; b = 7'b0110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 101, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111010; b = 7'b1011110; bin = 1'b1; // Expected: {'diff': 91, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111010; b = 7'b1011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 91, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b1011100; bin = 1'b1; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b1011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110010; b = 7'b1001010; bin = 1'b0; // Expected: {'diff': 104, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110010; b = 7'b1001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 104, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011000; b = 7'b0111001; bin = 1'b0; // Expected: {'diff': 95, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011000; b = 7'b0111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b1101111; bin = 1'b1; // Expected: {'diff': 93, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b1101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111001; b = 7'b1100001; bin = 1'b1; // Expected: {'diff': 87, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111001; b = 7'b1100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 87, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110010; b = 7'b0001010; bin = 1'b1; // Expected: {'diff': 103, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110010; b = 7'b0001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000100; b = 7'b0100111; bin = 1'b0; // Expected: {'diff': 29, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000100; b = 7'b0100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b1111101; bin = 1'b0; // Expected: {'diff': 91, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b1111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 91, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101101; b = 7'b1111100; bin = 1'b0; // Expected: {'diff': 113, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101101; b = 7'b1111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 113, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000110; b = 7'b1101101; bin = 1'b0; // Expected: {'diff': 89, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000110; b = 7'b1101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 89, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010011; b = 7'b1111010; bin = 1'b0; // Expected: {'diff': 89, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010011; b = 7'b1111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 89, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110010; b = 7'b1111110; bin = 1'b0; // Expected: {'diff': 116, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110010; b = 7'b1111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 116, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100010; b = 7'b0100011; bin = 1'b1; // Expected: {'diff': 62, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100010; b = 7'b0100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000010; b = 7'b1000101; bin = 1'b0; // Expected: {'diff': 125, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000010; b = 7'b1000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010100; b = 7'b0010001; bin = 1'b1; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010100; b = 7'b0010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111100; b = 7'b1100101; bin = 1'b1; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111100; b = 7'b1100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011001; b = 7'b0000100; bin = 1'b1; // Expected: {'diff': 84, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011001; b = 7'b0000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100101; b = 7'b0100010; bin = 1'b0; // Expected: {'diff': 67, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100101; b = 7'b0100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110100; b = 7'b0100010; bin = 1'b1; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110100; b = 7'b0100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b1001100; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b1001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000011; b = 7'b1100111; bin = 1'b1; // Expected: {'diff': 27, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000011; b = 7'b1100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001001; b = 7'b1100100; bin = 1'b0; // Expected: {'diff': 37, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b1100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 37, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100000; b = 7'b0111101; bin = 1'b1; // Expected: {'diff': 98, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100000; b = 7'b0111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b0010010; bin = 1'b1; // Expected: {'diff': 32, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b0010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b1010101; bin = 1'b0; // Expected: {'diff': 121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b1010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011111; b = 7'b1110010; bin = 1'b0; // Expected: {'diff': 45, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011111; b = 7'b1110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011110; b = 7'b0000011; bin = 1'b1; // Expected: {'diff': 90, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011110; b = 7'b0000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100110; b = 7'b1011000; bin = 1'b0; // Expected: {'diff': 78, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100110; b = 7'b1011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 78, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100010; b = 7'b1000101; bin = 1'b1; // Expected: {'diff': 92, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100010; b = 7'b1000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000111; b = 7'b0100101; bin = 1'b0; // Expected: {'diff': 34, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000111; b = 7'b0100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101010; b = 7'b0111111; bin = 1'b0; // Expected: {'diff': 43, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101010; b = 7'b0111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111011; b = 7'b1010111; bin = 1'b1; // Expected: {'diff': 99, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111011; b = 7'b1010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b0110111; bin = 1'b1; // Expected: {'diff': 123, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b0110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 123, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110000; b = 7'b0110110; bin = 1'b1; // Expected: {'diff': 121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110000; b = 7'b0110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011111; b = 7'b1110000; bin = 1'b1; // Expected: {'diff': 46, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011111; b = 7'b1110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011111; b = 7'b0011100; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011111; b = 7'b0011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011101; b = 7'b1011110; bin = 1'b0; // Expected: {'diff': 63, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011101; b = 7'b1011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010100; b = 7'b1000101; bin = 1'b0; // Expected: {'diff': 79, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010100; b = 7'b1000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b0100001; bin = 1'b0; // Expected: {'diff': 107, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b0100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 107, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010010; b = 7'b1010100; bin = 1'b1; // Expected: {'diff': 125, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010010; b = 7'b1010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b0101001; bin = 1'b0; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b0101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011001; b = 7'b0010000; bin = 1'b1; // Expected: {'diff': 8, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011001; b = 7'b0010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111110; b = 7'b1001100; bin = 1'b0; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111110; b = 7'b1001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111001; b = 7'b0111101; bin = 1'b1; // Expected: {'diff': 59, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111001; b = 7'b0111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111101; b = 7'b0110101; bin = 1'b1; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111101; b = 7'b0110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000101; b = 7'b0100010; bin = 1'b0; // Expected: {'diff': 99, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000101; b = 7'b0100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000101; b = 7'b0010011; bin = 1'b1; // Expected: {'diff': 113, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000101; b = 7'b0010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 113, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000001; b = 7'b0111111; bin = 1'b0; // Expected: {'diff': 66, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000001; b = 7'b0111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 66, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b1010000; bin = 1'b1; // Expected: {'diff': 126, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b1010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 126, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111011; b = 7'b1101110; bin = 1'b1; // Expected: {'diff': 12, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111011; b = 7'b1101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b1001110; bin = 1'b1; // Expected: {'diff': 125, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b1001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110001; b = 7'b0001101; bin = 1'b0; // Expected: {'diff': 36, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110001; b = 7'b0001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100110; b = 7'b1000100; bin = 1'b1; // Expected: {'diff': 33, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100110; b = 7'b1000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100100; b = 7'b1100100; bin = 1'b1; // Expected: {'diff': 63, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100100; b = 7'b1100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b1101111; bin = 1'b0; // Expected: {'diff': 105, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b1101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 105, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000010; b = 7'b1110101; bin = 1'b1; // Expected: {'diff': 76, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000010; b = 7'b1110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 76, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010011; b = 7'b0100001; bin = 1'b0; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010011; b = 7'b0100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111100; b = 7'b0110010; bin = 1'b1; // Expected: {'diff': 73, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111100; b = 7'b0110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 73, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010100; b = 7'b1000010; bin = 1'b1; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010100; b = 7'b1000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100111; b = 7'b0010100; bin = 1'b1; // Expected: {'diff': 82, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100111; b = 7'b0010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100010; b = 7'b0010010; bin = 1'b0; // Expected: {'diff': 16, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100010; b = 7'b0010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001101; b = 7'b0100001; bin = 1'b0; // Expected: {'diff': 108, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001101; b = 7'b0100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101111; b = 7'b0100000; bin = 1'b0; // Expected: {'diff': 79, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101111; b = 7'b0100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000110; b = 7'b1101101; bin = 1'b0; // Expected: {'diff': 25, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000110; b = 7'b1101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001011; b = 7'b1110100; bin = 1'b1; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001011; b = 7'b1110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111010; b = 7'b1100010; bin = 1'b1; // Expected: {'diff': 87, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111010; b = 7'b1100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 87, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000101; b = 7'b1101000; bin = 1'b1; // Expected: {'diff': 92, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000101; b = 7'b1101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010010; b = 7'b0111000; bin = 1'b1; // Expected: {'diff': 89, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010010; b = 7'b0111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 89, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001000; b = 7'b0011100; bin = 1'b1; // Expected: {'diff': 43, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001000; b = 7'b0011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111000; b = 7'b1001111; bin = 1'b0; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111000; b = 7'b1001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001111; b = 7'b1110010; bin = 1'b0; // Expected: {'diff': 29, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001111; b = 7'b1110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 29, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011100; b = 7'b0110110; bin = 1'b1; // Expected: {'diff': 101, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011100; b = 7'b0110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 101, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011110; b = 7'b0000011; bin = 1'b0; // Expected: {'diff': 91, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011110; b = 7'b0000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 91, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001110; b = 7'b1011010; bin = 1'b1; // Expected: {'diff': 51, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b1011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101111; b = 7'b1111010; bin = 1'b0; // Expected: {'diff': 53, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101111; b = 7'b1111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101001; b = 7'b1110000; bin = 1'b0; // Expected: {'diff': 57, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101001; b = 7'b1110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111010; b = 7'b1010000; bin = 1'b0; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111010; b = 7'b1010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010000; b = 7'b0110101; bin = 1'b1; // Expected: {'diff': 90, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010000; b = 7'b0110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001000; b = 7'b1011001; bin = 1'b0; // Expected: {'diff': 111, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001000; b = 7'b1011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 111, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010110; b = 7'b1110100; bin = 1'b1; // Expected: {'diff': 33, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010110; b = 7'b1110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100111; b = 7'b0111100; bin = 1'b1; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100111; b = 7'b0111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110111; b = 7'b1111100; bin = 1'b1; // Expected: {'diff': 58, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110111; b = 7'b1111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110000; b = 7'b1010010; bin = 1'b0; // Expected: {'diff': 94, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110000; b = 7'b1010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 94, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b0011000; bin = 1'b1; // Expected: {'diff': 63, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b0011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100101; b = 7'b0100100; bin = 1'b1; // Expected: {'diff': 64, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100101; b = 7'b0100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000110; b = 7'b1101100; bin = 1'b0; // Expected: {'diff': 90, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000110; b = 7'b1101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011100; b = 7'b1011101; bin = 1'b1; // Expected: {'diff': 62, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011100; b = 7'b1011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000001; b = 7'b1100101; bin = 1'b1; // Expected: {'diff': 27, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000001; b = 7'b1100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 27, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b0011001; bin = 1'b1; // Expected: {'diff': 102, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b0011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b1101001; bin = 1'b1; // Expected: {'diff': 98, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b1101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101010; b = 7'b0011101; bin = 1'b0; // Expected: {'diff': 13, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101010; b = 7'b0011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001001; b = 7'b0001011; bin = 1'b1; // Expected: {'diff': 125, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b0001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110101; b = 7'b1001001; bin = 1'b0; // Expected: {'diff': 44, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110101; b = 7'b1001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101100; b = 7'b1011010; bin = 1'b0; // Expected: {'diff': 18, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101100; b = 7'b1011010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000111; b = 7'b0111000; bin = 1'b0; // Expected: {'diff': 79, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000111; b = 7'b0111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101111; b = 7'b1001110; bin = 1'b1; // Expected: {'diff': 32, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101111; b = 7'b1001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001010; b = 7'b1000001; bin = 1'b0; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001010; b = 7'b1000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001101; b = 7'b0000110; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001101; b = 7'b0000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011001; b = 7'b0101100; bin = 1'b1; // Expected: {'diff': 44, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011001; b = 7'b0101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001001; b = 7'b1111101; bin = 1'b0; // Expected: {'diff': 12, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b1111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 12, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000101; b = 7'b0100101; bin = 1'b0; // Expected: {'diff': 32, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000101; b = 7'b0100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001000; b = 7'b0000110; bin = 1'b0; // Expected: {'diff': 66, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001000; b = 7'b0000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 66, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010001; b = 7'b0011100; bin = 1'b0; // Expected: {'diff': 53, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010001; b = 7'b0011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100010; b = 7'b0011001; bin = 1'b0; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100010; b = 7'b0011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b0000010; bin = 1'b0; // Expected: {'diff': 90, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b0000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b0101001; bin = 1'b1; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b0101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010010; b = 7'b1110100; bin = 1'b0; // Expected: {'diff': 30, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010010; b = 7'b1110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b0111111; bin = 1'b0; // Expected: {'diff': 16, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b0111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100011; b = 7'b1101001; bin = 1'b1; // Expected: {'diff': 121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100011; b = 7'b1101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010100; b = 7'b0111110; bin = 1'b0; // Expected: {'diff': 22, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010100; b = 7'b0111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111100; b = 7'b0100100; bin = 1'b0; // Expected: {'diff': 88, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111100; b = 7'b0100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100110; b = 7'b1010100; bin = 1'b1; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100110; b = 7'b1010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001011; b = 7'b0001111; bin = 1'b1; // Expected: {'diff': 123, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001011; b = 7'b0001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 123, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100000; b = 7'b0011101; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100000; b = 7'b0011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110100; b = 7'b1001001; bin = 1'b0; // Expected: {'diff': 43, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110100; b = 7'b1001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111111; b = 7'b0001111; bin = 1'b0; // Expected: {'diff': 112, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111111; b = 7'b0001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011000; b = 7'b0000010; bin = 1'b1; // Expected: {'diff': 21, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011000; b = 7'b0000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110000; b = 7'b1000000; bin = 1'b1; // Expected: {'diff': 111, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110000; b = 7'b1000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 111, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011011; b = 7'b1000101; bin = 1'b0; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011011; b = 7'b1000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b1011001; bin = 1'b0; // Expected: {'diff': 49, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b1011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101110; b = 7'b0010110; bin = 1'b1; // Expected: {'diff': 23, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101110; b = 7'b0010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b1111111; bin = 1'b1; // Expected: {'diff': 0, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b1111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010111; b = 7'b0101111; bin = 1'b1; // Expected: {'diff': 39, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010111; b = 7'b0101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100000; b = 7'b0110111; bin = 1'b1; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100000; b = 7'b0110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011110; b = 7'b1001010; bin = 1'b1; // Expected: {'diff': 19, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011110; b = 7'b1001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 19, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001111; b = 7'b0110101; bin = 1'b0; // Expected: {'diff': 90, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001111; b = 7'b0110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011000; b = 7'b0100001; bin = 1'b1; // Expected: {'diff': 118, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011000; b = 7'b0100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001110; b = 7'b1011001; bin = 1'b0; // Expected: {'diff': 53, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b1011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001001; b = 7'b0111000; bin = 1'b1; // Expected: {'diff': 80, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b0111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 80, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b1110001; bin = 1'b1; // Expected: {'diff': 93, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b1110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110001; b = 7'b1000110; bin = 1'b1; // Expected: {'diff': 106, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110001; b = 7'b1000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 106, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011010; b = 7'b1101101; bin = 1'b1; // Expected: {'diff': 108, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011010; b = 7'b1101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b1101001; bin = 1'b0; // Expected: {'diff': 100, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b1101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111111; b = 7'b1011011; bin = 1'b1; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111111; b = 7'b1011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101001; b = 7'b1110010; bin = 1'b0; // Expected: {'diff': 55, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101001; b = 7'b1110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 55, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000110; b = 7'b0111101; bin = 1'b1; // Expected: {'diff': 8, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000110; b = 7'b0111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110111; b = 7'b0000111; bin = 1'b1; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110111; b = 7'b0000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111100; b = 7'b0111010; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111100; b = 7'b0111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010001; b = 7'b1100011; bin = 1'b0; // Expected: {'diff': 110, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010001; b = 7'b1100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 110, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001000; b = 7'b1000001; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001000; b = 7'b1000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001010; b = 7'b1111111; bin = 1'b0; // Expected: {'diff': 75, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001010; b = 7'b1111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b0010101; bin = 1'b1; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b0010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101111; b = 7'b1110100; bin = 1'b1; // Expected: {'diff': 122, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101111; b = 7'b1110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 122, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010010; b = 7'b1001001; bin = 1'b1; // Expected: {'diff': 72, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010010; b = 7'b1001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 72, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101110; b = 7'b1111111; bin = 1'b0; // Expected: {'diff': 111, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101110; b = 7'b1111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 111, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010101; b = 7'b0101111; bin = 1'b0; // Expected: {'diff': 102, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010101; b = 7'b0101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 102, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b1111110; bin = 1'b1; // Expected: {'diff': 79, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b1111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000100; b = 7'b0111110; bin = 1'b1; // Expected: {'diff': 69, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000100; b = 7'b0111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 69, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111110; b = 7'b1110011; bin = 1'b0; // Expected: {'diff': 75, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111110; b = 7'b1110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000000; b = 7'b0111101; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000000; b = 7'b0111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111011; b = 7'b1100110; bin = 1'b1; // Expected: {'diff': 20, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111011; b = 7'b1100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 20, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101100; b = 7'b1111001; bin = 1'b0; // Expected: {'diff': 115, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101100; b = 7'b1111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 115, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001101; b = 7'b0001100; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001101; b = 7'b0001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011010; b = 7'b0000000; bin = 1'b0; // Expected: {'diff': 90, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011010; b = 7'b0000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110110; b = 7'b0101111; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110110; b = 7'b0101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000010; b = 7'b0110000; bin = 1'b0; // Expected: {'diff': 82, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000010; b = 7'b0110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100010; b = 7'b1011111; bin = 1'b0; // Expected: {'diff': 67, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100010; b = 7'b1011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b0110101; bin = 1'b1; // Expected: {'diff': 38, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b0110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 38, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010101; b = 7'b0010000; bin = 1'b1; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010101; b = 7'b0010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100100; b = 7'b1010010; bin = 1'b0; // Expected: {'diff': 82, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100100; b = 7'b1010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b0011001; bin = 1'b0; // Expected: {'diff': 72, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b0011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 72, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b0001111; bin = 1'b0; // Expected: {'diff': 125, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b0001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100001; b = 7'b0011100; bin = 1'b0; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100001; b = 7'b0011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100000; b = 7'b0001110; bin = 1'b0; // Expected: {'diff': 18, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100000; b = 7'b0001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011000; b = 7'b1001111; bin = 1'b1; // Expected: {'diff': 72, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011000; b = 7'b1001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 72, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011110; b = 7'b1010000; bin = 1'b0; // Expected: {'diff': 14, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011110; b = 7'b1010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000010; b = 7'b0110010; bin = 1'b0; // Expected: {'diff': 16, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000010; b = 7'b0110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111000; b = 7'b1111010; bin = 1'b0; // Expected: {'diff': 126, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111000; b = 7'b1111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 126, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000001; b = 7'b1000001; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000001; b = 7'b1000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b0101110; bin = 1'b0; // Expected: {'diff': 92, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b0101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111001; b = 7'b1001100; bin = 1'b0; // Expected: {'diff': 109, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111001; b = 7'b1001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 109, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b1111010; bin = 1'b0; // Expected: {'diff': 57, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b1111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010111; b = 7'b0101110; bin = 1'b0; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010111; b = 7'b0101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b1100000; bin = 1'b0; // Expected: {'diff': 44, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b1100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100000; b = 7'b0001010; bin = 1'b1; // Expected: {'diff': 85, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100000; b = 7'b0001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 85, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100100; b = 7'b1100010; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100100; b = 7'b1100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110001; b = 7'b0100110; bin = 1'b1; // Expected: {'diff': 10, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110001; b = 7'b0100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000100; b = 7'b1110011; bin = 1'b0; // Expected: {'diff': 17, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000100; b = 7'b1110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b0110111; bin = 1'b1; // Expected: {'diff': 84, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b0110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b0110110; bin = 1'b1; // Expected: {'diff': 112, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b0110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001011; b = 7'b0100101; bin = 1'b1; // Expected: {'diff': 101, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001011; b = 7'b0100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 101, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
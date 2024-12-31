
`timescale 1ns / 1ps

module tb_N8_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 8;
    
     
    // Inputs
    
    reg  [7:0] a;
    
    reg  [7:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [7:0] diff;
    
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
        
        a = 8'b10110111; b = 8'b11010001; bin = 1'b0; // Expected: {'diff': 230, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110111; b = 8'b11010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 230, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110001; b = 8'b00111010; bin = 1'b0; // Expected: {'diff': 119, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110001; b = 8'b00111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 119, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010010; b = 8'b01101101; bin = 1'b0; // Expected: {'diff': 101, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010010; b = 8'b01101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 101, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011101; b = 8'b00100011; bin = 1'b1; // Expected: {'diff': 57, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011101; b = 8'b00100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101000; b = 8'b10101110; bin = 1'b1; // Expected: {'diff': 121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101000; b = 8'b10101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100100; b = 8'b10011100; bin = 1'b1; // Expected: {'diff': 199, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100100; b = 8'b10011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 199, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010000; b = 8'b01001111; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010000; b = 8'b01001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101011; b = 8'b10000000; bin = 1'b0; // Expected: {'diff': 171, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101011; b = 8'b10000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 171, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000010; b = 8'b00100100; bin = 1'b1; // Expected: {'diff': 93, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000010; b = 8'b00100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011101; b = 8'b01100000; bin = 1'b0; // Expected: {'diff': 61, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011101; b = 8'b01100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010100; b = 8'b10110010; bin = 1'b0; // Expected: {'diff': 162, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010100; b = 8'b10110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 162, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000011; b = 8'b11010001; bin = 1'b0; // Expected: {'diff': 242, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000011; b = 8'b11010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 242, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010011; b = 8'b10101111; bin = 1'b1; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010011; b = 8'b10101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111110; b = 8'b11000111; bin = 1'b1; // Expected: {'diff': 246, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111110; b = 8'b11000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 246, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110001; b = 8'b00011001; bin = 1'b0; // Expected: {'diff': 88, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110001; b = 8'b00011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110100; b = 8'b11010000; bin = 1'b1; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110100; b = 8'b11010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001011; b = 8'b01010000; bin = 1'b1; // Expected: {'diff': 122, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001011; b = 8'b01010000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110011; b = 8'b11001100; bin = 1'b1; // Expected: {'diff': 230, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110011; b = 8'b11001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 230, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011001; b = 8'b10100000; bin = 1'b1; // Expected: {'diff': 248, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011001; b = 8'b10100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 248, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101111; b = 8'b10000101; bin = 1'b0; // Expected: {'diff': 234, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101111; b = 8'b10000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 234, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000000; b = 8'b01000000; bin = 1'b0; // Expected: {'diff': 128, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000000; b = 8'b01000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 128, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011000; b = 8'b00111111; bin = 1'b0; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011000; b = 8'b00111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001001; b = 8'b11011101; bin = 1'b1; // Expected: {'diff': 107, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001001; b = 8'b11011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 107, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000101; b = 8'b00101000; bin = 1'b1; // Expected: {'diff': 156, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000101; b = 8'b00101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 156, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111110; b = 8'b01010011; bin = 1'b1; // Expected: {'diff': 234, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111110; b = 8'b01010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 234, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111111; b = 8'b00010000; bin = 1'b0; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111111; b = 8'b00010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101111; b = 8'b10101110; bin = 1'b1; // Expected: {'diff': 64, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101111; b = 8'b10101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010010; b = 8'b00111000; bin = 1'b1; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010010; b = 8'b00111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011101; b = 8'b10000100; bin = 1'b0; // Expected: {'diff': 89, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011101; b = 8'b10000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 89, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001000; b = 8'b01111000; bin = 1'b1; // Expected: {'diff': 79, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001000; b = 8'b01111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110001; b = 8'b00011101; bin = 1'b0; // Expected: {'diff': 84, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110001; b = 8'b00011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110100; b = 8'b10110101; bin = 1'b0; // Expected: {'diff': 255, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110100; b = 8'b10110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 255, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101111; b = 8'b11011100; bin = 1'b0; // Expected: {'diff': 83, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101111; b = 8'b11011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 32,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 83, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110001; b = 8'b00001100; bin = 1'b1; // Expected: {'diff': 228, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110001; b = 8'b00001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 33,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 228, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111101; b = 8'b11000001; bin = 1'b1; // Expected: {'diff': 251, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111101; b = 8'b11000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 34,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 251, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111010; b = 8'b01010110; bin = 1'b1; // Expected: {'diff': 99, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111010; b = 8'b01010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 35,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011010; b = 8'b00011101; bin = 1'b1; // Expected: {'diff': 188, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011010; b = 8'b00011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 36,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 188, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110100; b = 8'b10010001; bin = 1'b0; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110100; b = 8'b10010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 37,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011001; b = 8'b11000000; bin = 1'b1; // Expected: {'diff': 216, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011001; b = 8'b11000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 38,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 216, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110001; b = 8'b00000100; bin = 1'b1; // Expected: {'diff': 236, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110001; b = 8'b00000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 39,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 236, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110100; b = 8'b00111010; bin = 1'b0; // Expected: {'diff': 58, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110100; b = 8'b00111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 40,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000010; b = 8'b01100011; bin = 1'b1; // Expected: {'diff': 94, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000010; b = 8'b01100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 41,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 94, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000011; b = 8'b01100001; bin = 1'b0; // Expected: {'diff': 34, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000011; b = 8'b01100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 42,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100001; b = 8'b01011000; bin = 1'b1; // Expected: {'diff': 8, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100001; b = 8'b01011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 43,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000100; b = 8'b01011001; bin = 1'b0; // Expected: {'diff': 107, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000100; b = 8'b01011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 44,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 107, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011110; b = 8'b11000010; bin = 1'b0; // Expected: {'diff': 92, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011110; b = 8'b11000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 45,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100110; b = 8'b10010110; bin = 1'b1; // Expected: {'diff': 79, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100110; b = 8'b10010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 46,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110101; b = 8'b10000011; bin = 1'b1; // Expected: {'diff': 241, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110101; b = 8'b10000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 47,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 241, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010111; b = 8'b11000000; bin = 1'b0; // Expected: {'diff': 215, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010111; b = 8'b11000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 48,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 215, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101100; b = 8'b00011100; bin = 1'b0; // Expected: {'diff': 144, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101100; b = 8'b00011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 49,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 144, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100000; b = 8'b11110010; bin = 1'b1; // Expected: {'diff': 109, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100000; b = 8'b11110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 50,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 109, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011111; b = 8'b00001101; bin = 1'b0; // Expected: {'diff': 18, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011111; b = 8'b00001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 51,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100011; b = 8'b10100001; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100011; b = 8'b10100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 52,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b11001110; bin = 1'b1; // Expected: {'diff': 171, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b11001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 53,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 171, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010000; b = 8'b01011101; bin = 1'b1; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010000; b = 8'b01011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 54,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011111; b = 8'b01101100; bin = 1'b1; // Expected: {'diff': 178, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011111; b = 8'b01101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 55,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 178, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101100; b = 8'b11001010; bin = 1'b1; // Expected: {'diff': 33, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101100; b = 8'b11001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 56,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010010; b = 8'b10111010; bin = 1'b1; // Expected: {'diff': 151, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010010; b = 8'b10111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 57,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 151, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111101; b = 8'b01101010; bin = 1'b1; // Expected: {'diff': 146, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111101; b = 8'b01101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 58,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 146, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001011; b = 8'b01111000; bin = 1'b1; // Expected: {'diff': 146, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001011; b = 8'b01111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 59,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 146, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110111; b = 8'b01010111; bin = 1'b0; // Expected: {'diff': 96, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110111; b = 8'b01010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 60,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111110; b = 8'b10101010; bin = 1'b0; // Expected: {'diff': 84, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111110; b = 8'b10101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 61,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000110; b = 8'b01001100; bin = 1'b0; // Expected: {'diff': 58, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000110; b = 8'b01001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 62,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011110; b = 8'b11101101; bin = 1'b0; // Expected: {'diff': 241, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011110; b = 8'b11101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 63,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 241, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000100; b = 8'b01010101; bin = 1'b0; // Expected: {'diff': 239, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000100; b = 8'b01010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 64,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 239, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000001; b = 8'b10110010; bin = 1'b1; // Expected: {'diff': 78, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000001; b = 8'b10110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 65,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 78, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110000; b = 8'b01111110; bin = 1'b1; // Expected: {'diff': 113, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110000; b = 8'b01111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 66,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000111; b = 8'b11001011; bin = 1'b0; // Expected: {'diff': 124, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000111; b = 8'b11001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 67,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 124, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101110; b = 8'b00101101; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101110; b = 8'b00101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 68,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000100; b = 8'b11001001; bin = 1'b1; // Expected: {'diff': 186, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000100; b = 8'b11001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 69,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 186, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101101; b = 8'b10110101; bin = 1'b0; // Expected: {'diff': 56, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101101; b = 8'b10110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 70,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011001; b = 8'b11111100; bin = 1'b1; // Expected: {'diff': 28, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011001; b = 8'b11111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 71,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111100; b = 8'b10001100; bin = 1'b1; // Expected: {'diff': 175, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111100; b = 8'b10001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 72,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 175, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111010; b = 8'b00011011; bin = 1'b1; // Expected: {'diff': 30, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111010; b = 8'b00011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 73,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111001; b = 8'b00000000; bin = 1'b0; // Expected: {'diff': 185, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111001; b = 8'b00000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 74,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 185, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100010; b = 8'b10010010; bin = 1'b0; // Expected: {'diff': 144, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100010; b = 8'b10010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 75,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 144, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010001; b = 8'b01001001; bin = 1'b0; // Expected: {'diff': 8, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010001; b = 8'b01001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 76,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111010; b = 8'b01110010; bin = 1'b1; // Expected: {'diff': 71, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111010; b = 8'b01110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 77,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 71, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101010; b = 8'b01011111; bin = 1'b1; // Expected: {'diff': 10, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101010; b = 8'b01011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 78,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011101; b = 8'b11110001; bin = 1'b1; // Expected: {'diff': 43, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011101; b = 8'b11110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 79,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 43, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100100; b = 8'b00111001; bin = 1'b1; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100100; b = 8'b00111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 80,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110100; b = 8'b00101000; bin = 1'b1; // Expected: {'diff': 139, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110100; b = 8'b00101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 81,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 139, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110000; b = 8'b01001011; bin = 1'b1; // Expected: {'diff': 164, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110000; b = 8'b01001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 82,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 164, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010110; b = 8'b11001100; bin = 1'b0; // Expected: {'diff': 74, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010110; b = 8'b11001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 83,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 74, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010011; b = 8'b01110010; bin = 1'b0; // Expected: {'diff': 161, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010011; b = 8'b01110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 84,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 161, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010000; b = 8'b10111100; bin = 1'b0; // Expected: {'diff': 84, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010000; b = 8'b10111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 85,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110011; b = 8'b10000010; bin = 1'b1; // Expected: {'diff': 176, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110011; b = 8'b10000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 86,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 176, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100001; b = 8'b11110011; bin = 1'b1; // Expected: {'diff': 173, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100001; b = 8'b11110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 87,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 173, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111111; b = 8'b01101111; bin = 1'b1; // Expected: {'diff': 79, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111111; b = 8'b01101111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 88,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111100; b = 8'b11001111; bin = 1'b1; // Expected: {'diff': 108, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111100; b = 8'b11001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 89,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101000; b = 8'b00001010; bin = 1'b0; // Expected: {'diff': 30, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101000; b = 8'b00001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 90,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011111; b = 8'b10011110; bin = 1'b0; // Expected: {'diff': 129, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011111; b = 8'b10011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 91,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 129, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100110; b = 8'b10011111; bin = 1'b0; // Expected: {'diff': 7, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100110; b = 8'b10011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 92,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001001; b = 8'b01111000; bin = 1'b1; // Expected: {'diff': 80, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001001; b = 8'b01111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 93,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 80, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011011; b = 8'b11100000; bin = 1'b0; // Expected: {'diff': 59, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011011; b = 8'b11100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 94,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111000; b = 8'b01010000; bin = 1'b0; // Expected: {'diff': 168, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111000; b = 8'b01010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 95,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 168, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000001; b = 8'b10001011; bin = 1'b0; // Expected: {'diff': 118, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000001; b = 8'b10001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 96,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110110; b = 8'b00010100; bin = 1'b0; // Expected: {'diff': 162, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110110; b = 8'b00010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 97,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 162, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001010; b = 8'b01010011; bin = 1'b1; // Expected: {'diff': 118, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001010; b = 8'b01010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 98,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000001; b = 8'b01000100; bin = 1'b0; // Expected: {'diff': 189, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000001; b = 8'b01000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 99,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 189, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001100; b = 8'b00110111; bin = 1'b0; // Expected: {'diff': 149, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001100; b = 8'b00110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 100,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 149, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100111; b = 8'b11011100; bin = 1'b0; // Expected: {'diff': 11, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100111; b = 8'b11011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 101,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010111; b = 8'b00011111; bin = 1'b1; // Expected: {'diff': 119, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010111; b = 8'b00011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 102,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 119, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011110; b = 8'b00001000; bin = 1'b1; // Expected: {'diff': 85, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011110; b = 8'b00001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 103,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 85, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000101; b = 8'b10001111; bin = 1'b1; // Expected: {'diff': 53, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000101; b = 8'b10001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 104,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001011; b = 8'b11110110; bin = 1'b0; // Expected: {'diff': 21, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001011; b = 8'b11110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 105,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110110; b = 8'b00101001; bin = 1'b0; // Expected: {'diff': 77, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110110; b = 8'b00101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 106,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101100; b = 8'b00101010; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101100; b = 8'b00101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 107,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010001; b = 8'b10011001; bin = 1'b1; // Expected: {'diff': 247, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010001; b = 8'b10011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 108,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 247, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100100; b = 8'b01111100; bin = 1'b1; // Expected: {'diff': 103, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100100; b = 8'b01111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 109,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110011; b = 8'b10111010; bin = 1'b1; // Expected: {'diff': 248, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110011; b = 8'b10111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 110,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 248, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110001; b = 8'b01000100; bin = 1'b0; // Expected: {'diff': 237, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110001; b = 8'b01000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 111,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 237, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111100; b = 8'b01110111; bin = 1'b1; // Expected: {'diff': 4, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111100; b = 8'b01110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 112,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100011; b = 8'b10010110; bin = 1'b0; // Expected: {'diff': 141, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100011; b = 8'b10010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 113,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 141, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110111; b = 8'b10101111; bin = 1'b0; // Expected: {'diff': 136, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110111; b = 8'b10101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 114,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 136, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111000; b = 8'b10001001; bin = 1'b1; // Expected: {'diff': 238, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111000; b = 8'b10001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 115,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 238, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101101; b = 8'b00100110; bin = 1'b1; // Expected: {'diff': 70, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101101; b = 8'b00100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 116,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 70, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001100; b = 8'b11010101; bin = 1'b1; // Expected: {'diff': 246, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001100; b = 8'b11010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 117,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 246, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010011; b = 8'b11000001; bin = 1'b0; // Expected: {'diff': 210, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010011; b = 8'b11000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 118,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 210, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001111; b = 8'b01001001; bin = 1'b1; // Expected: {'diff': 197, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001111; b = 8'b01001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 119,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 197, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111000; b = 8'b00001110; bin = 1'b0; // Expected: {'diff': 106, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111000; b = 8'b00001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 120,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 106, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011100; b = 8'b01000011; bin = 1'b1; // Expected: {'diff': 152, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011100; b = 8'b01000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 121,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 152, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010000; b = 8'b10100000; bin = 1'b0; // Expected: {'diff': 240, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010000; b = 8'b10100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 122,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 240, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111110; b = 8'b10100110; bin = 1'b0; // Expected: {'diff': 152, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111110; b = 8'b10100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 123,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 152, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000011; b = 8'b11001101; bin = 1'b1; // Expected: {'diff': 245, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000011; b = 8'b11001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 124,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 245, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011101; b = 8'b00000010; bin = 1'b0; // Expected: {'diff': 155, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011101; b = 8'b00000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 125,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 155, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111110; b = 8'b01010110; bin = 1'b0; // Expected: {'diff': 104, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111110; b = 8'b01010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 126,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 104, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010101; b = 8'b01110101; bin = 1'b1; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010101; b = 8'b01110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 127,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000011; b = 8'b01111010; bin = 1'b1; // Expected: {'diff': 8, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000011; b = 8'b01111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 128,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100101; b = 8'b10110100; bin = 1'b0; // Expected: {'diff': 177, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100101; b = 8'b10110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 129,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 177, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110000; b = 8'b10011111; bin = 1'b1; // Expected: {'diff': 16, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110000; b = 8'b10011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 130,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 16, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101000; b = 8'b11010101; bin = 1'b0; // Expected: {'diff': 211, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101000; b = 8'b11010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 131,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 211, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001111; b = 8'b10001011; bin = 1'b1; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001111; b = 8'b10001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 132,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100001; b = 8'b10001001; bin = 1'b1; // Expected: {'diff': 23, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100001; b = 8'b10001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 133,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001010; b = 8'b00110000; bin = 1'b0; // Expected: {'diff': 154, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001010; b = 8'b00110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 134,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 154, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010101; b = 8'b00110000; bin = 1'b1; // Expected: {'diff': 164, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010101; b = 8'b00110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 135,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 164, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b01111100; bin = 1'b0; // Expected: {'diff': 254, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b01111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 136,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 254, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100011; b = 8'b10001011; bin = 1'b1; // Expected: {'diff': 87, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100011; b = 8'b10001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 137,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 87, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001101; b = 8'b00111010; bin = 1'b0; // Expected: {'diff': 211, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001101; b = 8'b00111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 138,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 211, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011110; b = 8'b00101011; bin = 1'b1; // Expected: {'diff': 242, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011110; b = 8'b00101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 139,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 242, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110011; b = 8'b00111000; bin = 1'b0; // Expected: {'diff': 187, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110011; b = 8'b00111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 140,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 187, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001110; b = 8'b10101010; bin = 1'b1; // Expected: {'diff': 99, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001110; b = 8'b10101010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 141,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100000; b = 8'b11100110; bin = 1'b1; // Expected: {'diff': 185, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100000; b = 8'b11100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 142,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 185, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111111; b = 8'b11101001; bin = 1'b0; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111111; b = 8'b11101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 143,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000000; b = 8'b11110011; bin = 1'b0; // Expected: {'diff': 77, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000000; b = 8'b11110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 144,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000000; b = 8'b01111100; bin = 1'b0; // Expected: {'diff': 132, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000000; b = 8'b01111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 145,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 132, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100100; b = 8'b10101100; bin = 1'b0; // Expected: {'diff': 56, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100100; b = 8'b10101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 146,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100111; b = 8'b10101100; bin = 1'b0; // Expected: {'diff': 251, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100111; b = 8'b10101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 147,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 251, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001101; b = 8'b10100010; bin = 1'b1; // Expected: {'diff': 170, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001101; b = 8'b10100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 148,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 170, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001111; b = 8'b01010001; bin = 1'b1; // Expected: {'diff': 61, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001111; b = 8'b01010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 149,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011000; b = 8'b00110101; bin = 1'b1; // Expected: {'diff': 226, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011000; b = 8'b00110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 150,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 226, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010011; b = 8'b10110100; bin = 1'b0; // Expected: {'diff': 95, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010011; b = 8'b10110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 151,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111110; b = 8'b00101100; bin = 1'b0; // Expected: {'diff': 82, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111110; b = 8'b00101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 152,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010100; b = 8'b00110101; bin = 1'b0; // Expected: {'diff': 159, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010100; b = 8'b00110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 153,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 159, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101100; b = 8'b01111111; bin = 1'b0; // Expected: {'diff': 173, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101100; b = 8'b01111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 154,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 173, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101011; b = 8'b00000100; bin = 1'b0; // Expected: {'diff': 231, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101011; b = 8'b00000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 155,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 231, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000100; b = 8'b01100101; bin = 1'b0; // Expected: {'diff': 223, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000100; b = 8'b01100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 156,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 223, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111000; b = 8'b10001000; bin = 1'b1; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111000; b = 8'b10001000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 157,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110000; b = 8'b11110111; bin = 1'b0; // Expected: {'diff': 121, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110000; b = 8'b11110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 158,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110110; b = 8'b11001100; bin = 1'b1; // Expected: {'diff': 169, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110110; b = 8'b11001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 159,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 169, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b11111011; bin = 1'b0; // Expected: {'diff': 238, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b11111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 160,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 238, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110101; b = 8'b00001011; bin = 1'b0; // Expected: {'diff': 106, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110101; b = 8'b00001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 161,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 106, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111010; b = 8'b01110111; bin = 1'b1; // Expected: {'diff': 194, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111010; b = 8'b01110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 162,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 194, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011011; b = 8'b10000101; bin = 1'b0; // Expected: {'diff': 22, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011011; b = 8'b10000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 163,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011010; b = 8'b11001001; bin = 1'b1; // Expected: {'diff': 208, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011010; b = 8'b11001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 164,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 208, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001011; b = 8'b10100110; bin = 1'b1; // Expected: {'diff': 164, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001011; b = 8'b10100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 165,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 164, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111000; b = 8'b10001101; bin = 1'b1; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111000; b = 8'b10001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 166,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001001; b = 8'b10000011; bin = 1'b1; // Expected: {'diff': 69, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001001; b = 8'b10000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 167,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 69, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100100; b = 8'b10101110; bin = 1'b1; // Expected: {'diff': 53, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100100; b = 8'b10101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 168,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111110; b = 8'b11000010; bin = 1'b1; // Expected: {'diff': 123, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111110; b = 8'b11000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 169,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 123, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001001; b = 8'b01000111; bin = 1'b1; // Expected: {'diff': 193, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001001; b = 8'b01000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 170,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 193, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011011; b = 8'b11010010; bin = 1'b0; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011011; b = 8'b11010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 171,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000100; b = 8'b00110100; bin = 1'b0; // Expected: {'diff': 208, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000100; b = 8'b00110100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 172,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 208, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010111; b = 8'b01100111; bin = 1'b1; // Expected: {'diff': 175, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010111; b = 8'b01100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 173,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 175, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010000; b = 8'b11101100; bin = 1'b1; // Expected: {'diff': 227, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010000; b = 8'b11101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 174,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 227, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011110; b = 8'b10101000; bin = 1'b1; // Expected: {'diff': 53, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011110; b = 8'b10101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 175,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 53, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011011; b = 8'b11010100; bin = 1'b1; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011011; b = 8'b11010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 176,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110001; b = 8'b01010010; bin = 1'b0; // Expected: {'diff': 223, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110001; b = 8'b01010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 177,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 223, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010101; b = 8'b10011001; bin = 1'b1; // Expected: {'diff': 187, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010101; b = 8'b10011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 178,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 187, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010101; b = 8'b10000101; bin = 1'b1; // Expected: {'diff': 79, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010101; b = 8'b10000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 179,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010010; b = 8'b11011000; bin = 1'b1; // Expected: {'diff': 57, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010010; b = 8'b11011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 180,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001100; b = 8'b10101011; bin = 1'b0; // Expected: {'diff': 97, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001100; b = 8'b10101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 181,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111110; b = 8'b11011111; bin = 1'b1; // Expected: {'diff': 158, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111110; b = 8'b11011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 182,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 158, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011011; b = 8'b00010110; bin = 1'b1; // Expected: {'diff': 68, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011011; b = 8'b00010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 183,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101111; b = 8'b11000111; bin = 1'b0; // Expected: {'diff': 232, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101111; b = 8'b11000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 184,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 232, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011101; b = 8'b11000111; bin = 1'b0; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011101; b = 8'b11000111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 185,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110111; b = 8'b00001110; bin = 1'b0; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110111; b = 8'b00001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 186,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101111; b = 8'b11010100; bin = 1'b1; // Expected: {'diff': 26, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101111; b = 8'b11010100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 187,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010000; b = 8'b01010000; bin = 1'b0; // Expected: {'diff': 64, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010000; b = 8'b01010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 188,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010010; b = 8'b11001101; bin = 1'b0; // Expected: {'diff': 133, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010010; b = 8'b11001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 189,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 133, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101000; b = 8'b10100000; bin = 1'b1; // Expected: {'diff': 135, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101000; b = 8'b10100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 190,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 135, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110001; b = 8'b01001000; bin = 1'b0; // Expected: {'diff': 169, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110001; b = 8'b01001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 191,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 169, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010111; b = 8'b11100111; bin = 1'b1; // Expected: {'diff': 47, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010111; b = 8'b11100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 192,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010000; b = 8'b11010100; bin = 1'b0; // Expected: {'diff': 60, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010000; b = 8'b11010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 193,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010000; b = 8'b11011110; bin = 1'b0; // Expected: {'diff': 114, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010000; b = 8'b11011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 194,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 114, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110110; b = 8'b11111010; bin = 1'b0; // Expected: {'diff': 124, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110110; b = 8'b11111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 195,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 124, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100001; b = 8'b11101011; bin = 1'b1; // Expected: {'diff': 245, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100001; b = 8'b11101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 196,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 245, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000001; b = 8'b11000011; bin = 1'b1; // Expected: {'diff': 125, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000001; b = 8'b11000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 197,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100000; b = 8'b11111111; bin = 1'b0; // Expected: {'diff': 161, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100000; b = 8'b11111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 198,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 161, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111001; b = 8'b00000010; bin = 1'b1; // Expected: {'diff': 182, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111001; b = 8'b00000010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 199,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 182, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000111; b = 8'b01100100; bin = 1'b1; // Expected: {'diff': 226, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000111; b = 8'b01100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 200,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 226, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000110; b = 8'b00101110; bin = 1'b0; // Expected: {'diff': 152, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000110; b = 8'b00101110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 201,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 152, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001110; b = 8'b01110101; bin = 1'b1; // Expected: {'diff': 88, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001110; b = 8'b01110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 202,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 88, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001000; b = 8'b01001001; bin = 1'b0; // Expected: {'diff': 127, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001000; b = 8'b01001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 203,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 127, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110011; b = 8'b10101000; bin = 1'b0; // Expected: {'diff': 75, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110011; b = 8'b10101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 204,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001000; b = 8'b01010000; bin = 1'b0; // Expected: {'diff': 56, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001000; b = 8'b01010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 205,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111011; b = 8'b10010101; bin = 1'b1; // Expected: {'diff': 101, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111011; b = 8'b10010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 206,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 101, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100111; b = 8'b00111001; bin = 1'b0; // Expected: {'diff': 110, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100111; b = 8'b00111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 207,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 110, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101010; b = 8'b11111101; bin = 1'b1; // Expected: {'diff': 172, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101010; b = 8'b11111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 208,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 172, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101100; b = 8'b10110110; bin = 1'b1; // Expected: {'diff': 117, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101100; b = 8'b10110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 209,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 117, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101100; b = 8'b11001101; bin = 1'b1; // Expected: {'diff': 30, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101100; b = 8'b11001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 210,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101000; b = 8'b00010110; bin = 1'b0; // Expected: {'diff': 146, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101000; b = 8'b00010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 211,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 146, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100011; b = 8'b11111011; bin = 1'b1; // Expected: {'diff': 167, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100011; b = 8'b11111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 212,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 167, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111110; b = 8'b00111100; bin = 1'b1; // Expected: {'diff': 129, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111110; b = 8'b00111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 213,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 129, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001110; b = 8'b01000011; bin = 1'b0; // Expected: {'diff': 11, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001110; b = 8'b01000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 214,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100101; b = 8'b10110111; bin = 1'b1; // Expected: {'diff': 45, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100101; b = 8'b10110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 215,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101101; b = 8'b00110011; bin = 1'b0; // Expected: {'diff': 58, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101101; b = 8'b00110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 216,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000000; b = 8'b01101000; bin = 1'b1; // Expected: {'diff': 87, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000000; b = 8'b01101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 217,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 87, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010101; b = 8'b00110000; bin = 1'b1; // Expected: {'diff': 100, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010101; b = 8'b00110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 218,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001011; b = 8'b10100000; bin = 1'b1; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001011; b = 8'b10100000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 219,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101100; b = 8'b01000011; bin = 1'b0; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101100; b = 8'b01000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 220,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011010; b = 8'b10111101; bin = 1'b1; // Expected: {'diff': 92, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011010; b = 8'b10111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 221,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110100; b = 8'b10001110; bin = 1'b0; // Expected: {'diff': 166, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110100; b = 8'b10001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 222,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 166, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110101; b = 8'b00001101; bin = 1'b1; // Expected: {'diff': 103, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110101; b = 8'b00001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 223,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010001; b = 8'b00101111; bin = 1'b0; // Expected: {'diff': 226, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010001; b = 8'b00101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 224,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 226, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000101; b = 8'b01101110; bin = 1'b1; // Expected: {'diff': 150, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000101; b = 8'b01101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 225,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 150, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110000; b = 8'b01010110; bin = 1'b1; // Expected: {'diff': 153, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110000; b = 8'b01010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 226,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 153, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110011; b = 8'b11110111; bin = 1'b1; // Expected: {'diff': 123, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110011; b = 8'b11110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 227,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 123, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111011; b = 8'b10110001; bin = 1'b0; // Expected: {'diff': 202, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111011; b = 8'b10110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 228,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 202, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111010; b = 8'b00000101; bin = 1'b0; // Expected: {'diff': 245, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111010; b = 8'b00000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 229,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 245, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000010; b = 8'b10101001; bin = 1'b1; // Expected: {'diff': 216, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000010; b = 8'b10101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 230,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 216, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010000; b = 8'b01000011; bin = 1'b0; // Expected: {'diff': 141, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010000; b = 8'b01000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 231,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 141, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111011; b = 8'b11100101; bin = 1'b1; // Expected: {'diff': 149, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111011; b = 8'b11100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 232,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 149, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110111; b = 8'b01100110; bin = 1'b0; // Expected: {'diff': 209, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110111; b = 8'b01100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 233,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 209, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000011; b = 8'b00100101; bin = 1'b1; // Expected: {'diff': 221, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000011; b = 8'b00100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 234,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 221, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011111; b = 8'b10100100; bin = 1'b0; // Expected: {'diff': 187, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011111; b = 8'b10100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 235,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 187, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111111; b = 8'b00100010; bin = 1'b0; // Expected: {'diff': 157, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111111; b = 8'b00100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 236,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 157, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001110; b = 8'b11001010; bin = 1'b1; // Expected: {'diff': 131, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001110; b = 8'b11001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 237,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 131, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101100; b = 8'b11100101; bin = 1'b1; // Expected: {'diff': 134, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101100; b = 8'b11100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 238,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 134, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101000; b = 8'b00101000; bin = 1'b1; // Expected: {'diff': 63, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101000; b = 8'b00101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 239,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 63, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110010; b = 8'b10111011; bin = 1'b1; // Expected: {'diff': 118, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110010; b = 8'b10111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 240,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101101; b = 8'b11001110; bin = 1'b0; // Expected: {'diff': 159, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101101; b = 8'b11001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 241,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 159, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110001; b = 8'b11011111; bin = 1'b0; // Expected: {'diff': 18, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110001; b = 8'b11011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 242,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101000; b = 8'b11110000; bin = 1'b1; // Expected: {'diff': 247, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101000; b = 8'b11110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 243,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 247, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101001; b = 8'b01101010; bin = 1'b0; // Expected: {'diff': 191, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101001; b = 8'b01101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 244,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 191, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001100; b = 8'b11010001; bin = 1'b1; // Expected: {'diff': 186, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001100; b = 8'b11010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 245,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 186, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001011; b = 8'b01001100; bin = 1'b0; // Expected: {'diff': 191, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001011; b = 8'b01001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 246,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 191, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011000; b = 8'b11111101; bin = 1'b1; // Expected: {'diff': 26, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011000; b = 8'b11111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 247,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110110; b = 8'b10110011; bin = 1'b1; // Expected: {'diff': 194, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110110; b = 8'b10110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 248,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 194, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100101; b = 8'b10111110; bin = 1'b0; // Expected: {'diff': 167, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100101; b = 8'b10111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 249,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 167, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011001; b = 8'b00100111; bin = 1'b0; // Expected: {'diff': 242, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011001; b = 8'b00100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 250,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 242, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001100; b = 8'b01100101; bin = 1'b0; // Expected: {'diff': 39, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001100; b = 8'b01100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 251,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001010; b = 8'b00000011; bin = 1'b0; // Expected: {'diff': 135, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001010; b = 8'b00000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 252,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 135, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101010; b = 8'b10000110; bin = 1'b1; // Expected: {'diff': 163, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101010; b = 8'b10000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 253,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 163, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000101; b = 8'b11110000; bin = 1'b0; // Expected: {'diff': 213, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000101; b = 8'b11110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 254,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 213, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101010; b = 8'b00100001; bin = 1'b0; // Expected: {'diff': 73, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101010; b = 8'b00100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 255,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 73, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001101; b = 8'b11100010; bin = 1'b1; // Expected: {'diff': 42, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001101; b = 8'b11100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 256,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b10001001; bin = 1'b0; // Expected: {'diff': 96, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b10001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 257,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010011; b = 8'b01011001; bin = 1'b0; // Expected: {'diff': 122, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010011; b = 8'b01011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 258,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011011; b = 8'b00111000; bin = 1'b1; // Expected: {'diff': 98, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011011; b = 8'b00111000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 259,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100010; b = 8'b11111001; bin = 1'b1; // Expected: {'diff': 168, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100010; b = 8'b11111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 260,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 168, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101000; b = 8'b00110100; bin = 1'b1; // Expected: {'diff': 243, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101000; b = 8'b00110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 261,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 243, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101100; b = 8'b00110100; bin = 1'b1; // Expected: {'diff': 183, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101100; b = 8'b00110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 262,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 183, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110001; b = 8'b01010110; bin = 1'b0; // Expected: {'diff': 91, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110001; b = 8'b01010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 263,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 91, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101010; b = 8'b01111111; bin = 1'b0; // Expected: {'diff': 235, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101010; b = 8'b01111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 264,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 235, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000110; b = 8'b00010001; bin = 1'b0; // Expected: {'diff': 245, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000110; b = 8'b00010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 265,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 245, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000101; b = 8'b11010110; bin = 1'b1; // Expected: {'diff': 110, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000101; b = 8'b11010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 266,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 110, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111010; b = 8'b00110111; bin = 1'b1; // Expected: {'diff': 194, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111010; b = 8'b00110111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 267,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 194, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111110; b = 8'b11111110; bin = 1'b0; // Expected: {'diff': 64, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111110; b = 8'b11111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 268,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 64, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000110; b = 8'b11100101; bin = 1'b1; // Expected: {'diff': 96, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000110; b = 8'b11100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 269,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000000; b = 8'b10110110; bin = 1'b0; // Expected: {'diff': 10, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000000; b = 8'b10110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 270,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100000; b = 8'b11100010; bin = 1'b1; // Expected: {'diff': 61, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100000; b = 8'b11100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 271,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 61, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101110; b = 8'b10101111; bin = 1'b0; // Expected: {'diff': 255, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101110; b = 8'b10101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 272,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 255, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110010; b = 8'b11000110; bin = 1'b0; // Expected: {'diff': 44, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110010; b = 8'b11000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 273,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101111; b = 8'b00001111; bin = 1'b1; // Expected: {'diff': 223, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101111; b = 8'b00001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 274,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 223, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010111; b = 8'b01011011; bin = 1'b0; // Expected: {'diff': 124, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010111; b = 8'b01011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 275,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100110; b = 8'b00011000; bin = 1'b0; // Expected: {'diff': 206, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100110; b = 8'b00011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 276,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 206, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100001; b = 8'b00110101; bin = 1'b0; // Expected: {'diff': 236, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100001; b = 8'b00110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 277,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 236, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000110; b = 8'b00100111; bin = 1'b1; // Expected: {'diff': 158, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000110; b = 8'b00100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 278,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 158, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b00011110; bin = 1'b1; // Expected: {'diff': 91, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b00011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 279,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 91, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110101; b = 8'b01100001; bin = 1'b1; // Expected: {'diff': 83, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110101; b = 8'b01100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 280,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 83, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111100; b = 8'b00110010; bin = 1'b1; // Expected: {'diff': 137, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111100; b = 8'b00110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 281,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 137, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010011; b = 8'b01111011; bin = 1'b0; // Expected: {'diff': 216, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010011; b = 8'b01111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 282,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 216, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100010; b = 8'b11101100; bin = 1'b1; // Expected: {'diff': 245, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100010; b = 8'b11101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 283,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 245, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101011; b = 8'b00011111; bin = 1'b1; // Expected: {'diff': 11, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101011; b = 8'b00011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 284,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111100; b = 8'b00110011; bin = 1'b0; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111100; b = 8'b00110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 285,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000110; b = 8'b00001110; bin = 1'b1; // Expected: {'diff': 247, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000110; b = 8'b00001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 286,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 247, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011110; b = 8'b10101000; bin = 1'b0; // Expected: {'diff': 246, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011110; b = 8'b10101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 287,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 246, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001000; b = 8'b01001101; bin = 1'b1; // Expected: {'diff': 58, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001000; b = 8'b01001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 288,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111011; b = 8'b11000000; bin = 1'b0; // Expected: {'diff': 123, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111011; b = 8'b11000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 289,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 123, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011110; b = 8'b01110001; bin = 1'b1; // Expected: {'diff': 172, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011110; b = 8'b01110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 290,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 172, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110110; b = 8'b10110000; bin = 1'b1; // Expected: {'diff': 197, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110110; b = 8'b10110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 291,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 197, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011100; b = 8'b01110110; bin = 1'b1; // Expected: {'diff': 165, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011100; b = 8'b01110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 292,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 165, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111101; b = 8'b00010101; bin = 1'b0; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111101; b = 8'b00010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 293,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010111; b = 8'b00110011; bin = 1'b0; // Expected: {'diff': 164, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010111; b = 8'b00110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 294,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 164, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000110; b = 8'b11000001; bin = 1'b1; // Expected: {'diff': 68, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000110; b = 8'b11000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 295,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110111; b = 8'b11001100; bin = 1'b1; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110111; b = 8'b11001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 296,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111110; b = 8'b01111111; bin = 1'b0; // Expected: {'diff': 191, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111110; b = 8'b01111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 297,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 191, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101000; b = 8'b01011101; bin = 1'b1; // Expected: {'diff': 138, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101000; b = 8'b01011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 298,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 138, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000101; b = 8'b10100100; bin = 1'b0; // Expected: {'diff': 97, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000101; b = 8'b10100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 299,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010111; b = 8'b10100110; bin = 1'b0; // Expected: {'diff': 49, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010111; b = 8'b10100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 300,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 49, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111100; b = 8'b11010101; bin = 1'b0; // Expected: {'diff': 103, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111100; b = 8'b11010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 301,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001001; b = 8'b11100000; bin = 1'b0; // Expected: {'diff': 105, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001001; b = 8'b11100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 302,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 105, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000010; b = 8'b11000110; bin = 1'b0; // Expected: {'diff': 188, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000010; b = 8'b11000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 303,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 188, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000111; b = 8'b01101101; bin = 1'b0; // Expected: {'diff': 26, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000111; b = 8'b01101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 304,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000110; b = 8'b10110100; bin = 1'b1; // Expected: {'diff': 81, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000110; b = 8'b10110100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 305,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 81, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011001; b = 8'b00010100; bin = 1'b0; // Expected: {'diff': 69, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011001; b = 8'b00010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 306,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 69, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011010; b = 8'b01100100; bin = 1'b0; // Expected: {'diff': 54, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011010; b = 8'b01100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 307,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101101; b = 8'b10011111; bin = 1'b1; // Expected: {'diff': 205, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101101; b = 8'b10011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 308,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 205, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010001; b = 8'b00110111; bin = 1'b0; // Expected: {'diff': 154, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010001; b = 8'b00110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 309,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 154, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000101; b = 8'b01011100; bin = 1'b1; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000101; b = 8'b01011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 310,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011000; b = 8'b01011110; bin = 1'b0; // Expected: {'diff': 250, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011000; b = 8'b01011110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 311,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 250, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101010; b = 8'b10101100; bin = 1'b1; // Expected: {'diff': 189, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101010; b = 8'b10101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 312,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 189, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100101; b = 8'b01010100; bin = 1'b0; // Expected: {'diff': 81, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100101; b = 8'b01010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 313,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 81, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b10101101; bin = 1'b1; // Expected: {'diff': 59, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b10101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 314,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001011; b = 8'b11011000; bin = 1'b0; // Expected: {'diff': 243, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001011; b = 8'b11011000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 315,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 243, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010001; b = 8'b00110111; bin = 1'b0; // Expected: {'diff': 26, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010001; b = 8'b00110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 316,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 26, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101111; b = 8'b11010001; bin = 1'b1; // Expected: {'diff': 93, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101111; b = 8'b11010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 317,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001011; b = 8'b10100001; bin = 1'b1; // Expected: {'diff': 233, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001011; b = 8'b10100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 318,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 233, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101100; b = 8'b11110010; bin = 1'b1; // Expected: {'diff': 185, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101100; b = 8'b11110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 319,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 185, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010101; b = 8'b10100111; bin = 1'b1; // Expected: {'diff': 173, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010101; b = 8'b10100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 320,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 173, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101001; b = 8'b10101000; bin = 1'b0; // Expected: {'diff': 193, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101001; b = 8'b10101000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 321,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 193, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011101; b = 8'b01010010; bin = 1'b0; // Expected: {'diff': 203, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011101; b = 8'b01010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 322,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 203, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011011; b = 8'b10000101; bin = 1'b1; // Expected: {'diff': 21, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011011; b = 8'b10000101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 323,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111001; b = 8'b10000000; bin = 1'b0; // Expected: {'diff': 57, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111001; b = 8'b10000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 324,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101001; b = 8'b10000001; bin = 1'b1; // Expected: {'diff': 231, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101001; b = 8'b10000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 325,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 231, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100000; b = 8'b01010101; bin = 1'b0; // Expected: {'diff': 11, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100000; b = 8'b01010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 326,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 11, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b10011011; bin = 1'b0; // Expected: {'diff': 223, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b10011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 327,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 223, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011101; b = 8'b10101101; bin = 1'b1; // Expected: {'diff': 239, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011101; b = 8'b10101101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 328,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 239, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001001; b = 8'b00100001; bin = 1'b0; // Expected: {'diff': 168, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001001; b = 8'b00100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 329,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 168, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100010; b = 8'b10011111; bin = 1'b0; // Expected: {'diff': 67, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100010; b = 8'b10011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 330,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101011; b = 8'b11110010; bin = 1'b0; // Expected: {'diff': 185, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101011; b = 8'b11110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 331,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 185, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101000; b = 8'b01100010; bin = 1'b0; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101000; b = 8'b01100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 332,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110111; b = 8'b10010000; bin = 1'b0; // Expected: {'diff': 103, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110111; b = 8'b10010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 333,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001000; b = 8'b10011111; bin = 1'b0; // Expected: {'diff': 41, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001000; b = 8'b10011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 334,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010000; b = 8'b10100010; bin = 1'b1; // Expected: {'diff': 45, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010000; b = 8'b10100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 335,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110001; b = 8'b11001000; bin = 1'b0; // Expected: {'diff': 233, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110001; b = 8'b11001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 336,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 233, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110000; b = 8'b10000011; bin = 1'b1; // Expected: {'diff': 44, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110000; b = 8'b10000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 337,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 44, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b11001010; bin = 1'b0; // Expected: {'diff': 176, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b11001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 338,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 176, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011111; b = 8'b01100011; bin = 1'b0; // Expected: {'diff': 124, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011111; b = 8'b01100011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 339,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000100; b = 8'b11010011; bin = 1'b0; // Expected: {'diff': 177, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000100; b = 8'b11010011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 340,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 177, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101111; b = 8'b11100100; bin = 1'b0; // Expected: {'diff': 139, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101111; b = 8'b11100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 341,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 139, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110101; b = 8'b10101011; bin = 1'b1; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110101; b = 8'b10101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 342,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011000; b = 8'b01011101; bin = 1'b0; // Expected: {'diff': 59, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011000; b = 8'b01011101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 343,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 59, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000010; b = 8'b10000011; bin = 1'b1; // Expected: {'diff': 126, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000010; b = 8'b10000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 344,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 126, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000001; b = 8'b01100100; bin = 1'b1; // Expected: {'diff': 220, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000001; b = 8'b01100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 345,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 220, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011001; b = 8'b11101001; bin = 1'b0; // Expected: {'diff': 112, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011001; b = 8'b11101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 346,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011010; b = 8'b10000011; bin = 1'b1; // Expected: {'diff': 214, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011010; b = 8'b10000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 347,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 214, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b10000101; bin = 1'b0; // Expected: {'diff': 100, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b10000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 348,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101010; b = 8'b10110101; bin = 1'b1; // Expected: {'diff': 244, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101010; b = 8'b10110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 349,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 244, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111111; b = 8'b10000011; bin = 1'b0; // Expected: {'diff': 252, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111111; b = 8'b10000011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 350,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 252, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000100; b = 8'b00110010; bin = 1'b0; // Expected: {'diff': 210, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000100; b = 8'b00110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 351,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 210, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101011; b = 8'b00100000; bin = 1'b0; // Expected: {'diff': 75, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101011; b = 8'b00100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 352,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100000; b = 8'b10100111; bin = 1'b1; // Expected: {'diff': 248, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100000; b = 8'b10100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 353,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 248, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011111; b = 8'b01001101; bin = 1'b0; // Expected: {'diff': 82, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011111; b = 8'b01001101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 354,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101100; b = 8'b10100110; bin = 1'b1; // Expected: {'diff': 5, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101100; b = 8'b10100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 355,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010111; b = 8'b10000000; bin = 1'b0; // Expected: {'diff': 23, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010111; b = 8'b10000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 356,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111110; b = 8'b00100001; bin = 1'b1; // Expected: {'diff': 220, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111110; b = 8'b00100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 357,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111111; b = 8'b11111110; bin = 1'b0; // Expected: {'diff': 65, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111111; b = 8'b11111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 358,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110000; b = 8'b11110111; bin = 1'b0; // Expected: {'diff': 249, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110000; b = 8'b11110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 359,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 249, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011110; b = 8'b01111010; bin = 1'b1; // Expected: {'diff': 35, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011110; b = 8'b01111010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 360,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001111; b = 8'b01110010; bin = 1'b0; // Expected: {'diff': 93, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001111; b = 8'b01110010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 361,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111110; b = 8'b01001111; bin = 1'b1; // Expected: {'diff': 238, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111110; b = 8'b01001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 362,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 238, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100110; b = 8'b10010110; bin = 1'b1; // Expected: {'diff': 15, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100110; b = 8'b10010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 363,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 15, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111100; b = 8'b10100010; bin = 1'b1; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111100; b = 8'b10100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 364,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000110; b = 8'b11011010; bin = 1'b1; // Expected: {'diff': 235, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000110; b = 8'b11011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 365,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 235, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101010; b = 8'b10010000; bin = 1'b0; // Expected: {'diff': 218, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101010; b = 8'b10010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 366,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 218, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000011; b = 8'b00001001; bin = 1'b1; // Expected: {'diff': 185, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000011; b = 8'b00001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 367,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 185, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001111; b = 8'b11110010; bin = 1'b1; // Expected: {'diff': 156, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001111; b = 8'b11110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 368,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 156, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111000; b = 8'b10001010; bin = 1'b0; // Expected: {'diff': 174, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111000; b = 8'b10001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 369,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 174, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110111; b = 8'b10001010; bin = 1'b1; // Expected: {'diff': 108, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110111; b = 8'b10001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 370,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 108, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010011; b = 8'b01000001; bin = 1'b0; // Expected: {'diff': 18, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010011; b = 8'b01000001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 371,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011000; b = 8'b00010010; bin = 1'b0; // Expected: {'diff': 6, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011000; b = 8'b00010010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 372,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000100; b = 8'b11111011; bin = 1'b1; // Expected: {'diff': 136, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000100; b = 8'b11111011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 373,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 136, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110111; b = 8'b01001101; bin = 1'b1; // Expected: {'diff': 169, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110111; b = 8'b01001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 374,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 169, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101100; b = 8'b01011100; bin = 1'b0; // Expected: {'diff': 144, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101100; b = 8'b01011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 375,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 144, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000010; b = 8'b01001001; bin = 1'b1; // Expected: {'diff': 56, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000010; b = 8'b01001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 376,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 56, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100001; b = 8'b01111001; bin = 1'b1; // Expected: {'diff': 103, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100001; b = 8'b01111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 377,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100111; b = 8'b00001000; bin = 1'b0; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100111; b = 8'b00001000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 378,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b10101111; bin = 1'b0; // Expected: {'diff': 58, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b10101111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 379,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 58, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011101; b = 8'b00001001; bin = 1'b1; // Expected: {'diff': 147, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011101; b = 8'b00001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 380,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 147, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000000; b = 8'b00001011; bin = 1'b1; // Expected: {'diff': 116, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000000; b = 8'b00001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 381,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 116, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011100; b = 8'b10011100; bin = 1'b0; // Expected: {'diff': 192, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011100; b = 8'b10011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 382,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 192, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b01110110; bin = 1'b0; // Expected: {'diff': 115, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b01110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 383,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110000; b = 8'b01011000; bin = 1'b1; // Expected: {'diff': 23, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110000; b = 8'b01011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 384,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011001; b = 8'b01110000; bin = 1'b1; // Expected: {'diff': 40, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011001; b = 8'b01110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 385,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 40, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001110; b = 8'b10010001; bin = 1'b1; // Expected: {'diff': 60, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001110; b = 8'b10010001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 386,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001001; b = 8'b00100110; bin = 1'b0; // Expected: {'diff': 99, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001001; b = 8'b00100110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 387,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101001; b = 8'b01110110; bin = 1'b0; // Expected: {'diff': 243, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101001; b = 8'b01110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 388,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 243, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001001; b = 8'b10010000; bin = 1'b0; // Expected: {'diff': 57, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001001; b = 8'b10010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 389,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101011; b = 8'b11110011; bin = 1'b1; // Expected: {'diff': 183, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101011; b = 8'b11110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 390,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 183, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010111; b = 8'b01000101; bin = 1'b0; // Expected: {'diff': 146, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010111; b = 8'b01000101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 391,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 146, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001111; b = 8'b00000000; bin = 1'b1; // Expected: {'diff': 142, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001111; b = 8'b00000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 392,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 142, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001001; b = 8'b00001100; bin = 1'b1; // Expected: {'diff': 60, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001001; b = 8'b00001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 393,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000111; b = 8'b00100111; bin = 1'b1; // Expected: {'diff': 31, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000111; b = 8'b00100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 394,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 31, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110000; b = 8'b01101101; bin = 1'b0; // Expected: {'diff': 131, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110000; b = 8'b01101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 395,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 131, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100110; b = 8'b10100001; bin = 1'b0; // Expected: {'diff': 133, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100110; b = 8'b10100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 396,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 133, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001111; b = 8'b00011111; bin = 1'b1; // Expected: {'diff': 239, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001111; b = 8'b00011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 397,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 239, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100111; b = 8'b11101000; bin = 1'b1; // Expected: {'diff': 254, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100111; b = 8'b11101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 398,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 254, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000010; b = 8'b11100101; bin = 1'b1; // Expected: {'diff': 28, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000010; b = 8'b11100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 399,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010001; b = 8'b11001111; bin = 1'b0; // Expected: {'diff': 66, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010001; b = 8'b11001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 400,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 66, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111110; b = 8'b10011100; bin = 1'b0; // Expected: {'diff': 34, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111110; b = 8'b10011100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 401,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 34, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000000; b = 8'b10000100; bin = 1'b0; // Expected: {'diff': 252, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000000; b = 8'b10000100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 402,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 252, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100011; b = 8'b11001011; bin = 1'b1; // Expected: {'diff': 215, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100011; b = 8'b11001011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 403,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 215, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111000; b = 8'b01000111; bin = 1'b1; // Expected: {'diff': 48, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111000; b = 8'b01000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 404,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101111; b = 8'b00110010; bin = 1'b1; // Expected: {'diff': 60, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101111; b = 8'b00110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 405,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011001; b = 8'b10101100; bin = 1'b1; // Expected: {'diff': 172, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011001; b = 8'b10101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 406,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 172, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011101; b = 8'b01110010; bin = 1'b1; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011101; b = 8'b01110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 407,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101000; b = 8'b01110111; bin = 1'b0; // Expected: {'diff': 241, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101000; b = 8'b01110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 408,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 241, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010001; b = 8'b10101010; bin = 1'b0; // Expected: {'diff': 231, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010001; b = 8'b10101010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 409,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 231, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101111; b = 8'b10001100; bin = 1'b1; // Expected: {'diff': 226, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101111; b = 8'b10001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 410,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 226, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010101; b = 8'b11011111; bin = 1'b0; // Expected: {'diff': 118, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010101; b = 8'b11011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 411,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101111; b = 8'b00000100; bin = 1'b1; // Expected: {'diff': 42, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101111; b = 8'b00000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 412,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010011; b = 8'b01010101; bin = 1'b1; // Expected: {'diff': 189, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010011; b = 8'b01010101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 413,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 189, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110100; b = 8'b11011001; bin = 1'b0; // Expected: {'diff': 155, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110100; b = 8'b11011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 414,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 155, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001101; b = 8'b00010001; bin = 1'b0; // Expected: {'diff': 60, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001101; b = 8'b00010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 415,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 60, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010101; b = 8'b01100111; bin = 1'b1; // Expected: {'diff': 173, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010101; b = 8'b01100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 416,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 173, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000111; b = 8'b00110000; bin = 1'b1; // Expected: {'diff': 150, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000111; b = 8'b00110000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 417,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 150, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000010; b = 8'b00111111; bin = 1'b0; // Expected: {'diff': 195, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000010; b = 8'b00111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 418,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 195, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110011; b = 8'b11101100; bin = 1'b0; // Expected: {'diff': 135, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110011; b = 8'b11101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 419,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 135, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001000; b = 8'b10111101; bin = 1'b0; // Expected: {'diff': 203, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001000; b = 8'b10111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 420,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 203, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b00100111; bin = 1'b1; // Expected: {'diff': 82, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b00100111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 421,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101100; b = 8'b00000000; bin = 1'b1; // Expected: {'diff': 235, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101100; b = 8'b00000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 422,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 235, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001010; b = 8'b11111101; bin = 1'b0; // Expected: {'diff': 77, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001010; b = 8'b11111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 423,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100011; b = 8'b01101001; bin = 1'b1; // Expected: {'diff': 249, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100011; b = 8'b01101001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 424,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 249, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110110; b = 8'b00111111; bin = 1'b1; // Expected: {'diff': 118, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110110; b = 8'b00111111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 425,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 118, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100001; b = 8'b10000000; bin = 1'b0; // Expected: {'diff': 33, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100001; b = 8'b10000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 426,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 33, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010111; b = 8'b00100100; bin = 1'b1; // Expected: {'diff': 50, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010111; b = 8'b00100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 427,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001111; b = 8'b01000110; bin = 1'b1; // Expected: {'diff': 136, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001111; b = 8'b01000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 428,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 136, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100100; b = 8'b10100001; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100100; b = 8'b10100001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 429,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110010; b = 8'b01011001; bin = 1'b0; // Expected: {'diff': 25, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110010; b = 8'b01011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 430,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001010; b = 8'b00000011; bin = 1'b1; // Expected: {'diff': 198, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001010; b = 8'b00000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 431,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 198, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100000; b = 8'b10101100; bin = 1'b1; // Expected: {'diff': 243, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100000; b = 8'b10101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 432,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 243, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001111; b = 8'b10111100; bin = 1'b1; // Expected: {'diff': 82, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001111; b = 8'b10111100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 433,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110011; b = 8'b01111000; bin = 1'b0; // Expected: {'diff': 251, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110011; b = 8'b01111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 434,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 251, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010101; b = 8'b11100100; bin = 1'b1; // Expected: {'diff': 48, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010101; b = 8'b11100100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 435,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 48, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100111; b = 8'b10110110; bin = 1'b1; // Expected: {'diff': 176, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100111; b = 8'b10110110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 436,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 176, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111111; b = 8'b10001111; bin = 1'b0; // Expected: {'diff': 112, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111111; b = 8'b10001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 437,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111011; b = 8'b01000011; bin = 1'b1; // Expected: {'diff': 119, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111011; b = 8'b01000011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 438,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 119, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010011; b = 8'b01000110; bin = 1'b1; // Expected: {'diff': 140, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010011; b = 8'b01000110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 439,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 140, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010010; b = 8'b00111000; bin = 1'b0; // Expected: {'diff': 90, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010010; b = 8'b00111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 440,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 90, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110010; b = 8'b01101000; bin = 1'b1; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110010; b = 8'b01101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 441,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011010; b = 8'b10110101; bin = 1'b0; // Expected: {'diff': 165, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011010; b = 8'b10110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 442,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 165, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101111; b = 8'b10011101; bin = 1'b1; // Expected: {'diff': 145, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101111; b = 8'b10011101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 443,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 145, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010111; b = 8'b00011111; bin = 1'b1; // Expected: {'diff': 183, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010111; b = 8'b00011111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 444,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 183, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011010; b = 8'b01011011; bin = 1'b1; // Expected: {'diff': 62, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011010; b = 8'b01011011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 445,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010101; b = 8'b11101001; bin = 1'b0; // Expected: {'diff': 236, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010101; b = 8'b11101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 446,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 236, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100110; b = 8'b11110110; bin = 1'b0; // Expected: {'diff': 112, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100110; b = 8'b11110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 447,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100110; b = 8'b00001111; bin = 1'b1; // Expected: {'diff': 22, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100110; b = 8'b00001111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 448,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010100; b = 8'b10100110; bin = 1'b1; // Expected: {'diff': 237, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010100; b = 8'b10100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 449,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 237, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010101; b = 8'b11000110; bin = 1'b0; // Expected: {'diff': 207, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010101; b = 8'b11000110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 450,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 207, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b01101110; bin = 1'b1; // Expected: {'diff': 122, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b01101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 451,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110011; b = 8'b00001111; bin = 1'b0; // Expected: {'diff': 36, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110011; b = 8'b00001111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 452,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 36, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101110; b = 8'b00001110; bin = 1'b1; // Expected: {'diff': 159, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101110; b = 8'b00001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 453,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 159, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110010; b = 8'b00110101; bin = 1'b1; // Expected: {'diff': 188, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110010; b = 8'b00110101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 454,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 188, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110110; b = 8'b11110101; bin = 1'b0; // Expected: {'diff': 129, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110110; b = 8'b11110101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 455,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 129, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110100; b = 8'b00110000; bin = 1'b0; // Expected: {'diff': 132, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110100; b = 8'b00110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 456,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 132, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000000; b = 8'b10010001; bin = 1'b0; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000000; b = 8'b10010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 457,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110001; b = 8'b00001001; bin = 1'b1; // Expected: {'diff': 103, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110001; b = 8'b00001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 458,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001110; b = 8'b11111110; bin = 1'b1; // Expected: {'diff': 207, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001110; b = 8'b11111110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 459,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 207, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101111; b = 8'b01110001; bin = 1'b0; // Expected: {'diff': 126, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101111; b = 8'b01110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 460,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 126, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111111; b = 8'b10010010; bin = 1'b1; // Expected: {'diff': 108, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111111; b = 8'b10010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 461,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 108, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001001; b = 8'b00101011; bin = 1'b1; // Expected: {'diff': 93, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001001; b = 8'b00101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 462,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 93, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101011; b = 8'b10000000; bin = 1'b1; // Expected: {'diff': 234, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101011; b = 8'b10000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 463,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 234, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101001; b = 8'b00001010; bin = 1'b1; // Expected: {'diff': 94, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101001; b = 8'b00001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 464,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 94, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001000; b = 8'b11110011; bin = 1'b1; // Expected: {'diff': 84, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001000; b = 8'b11110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 465,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 84, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001010; b = 8'b00101000; bin = 1'b1; // Expected: {'diff': 161, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001010; b = 8'b00101000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 466,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 161, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100001; b = 8'b00011111; bin = 1'b0; // Expected: {'diff': 194, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100001; b = 8'b00011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 467,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 194, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100001; b = 8'b11101011; bin = 1'b1; // Expected: {'diff': 181, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100001; b = 8'b11101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 468,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 181, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001101; b = 8'b11001001; bin = 1'b0; // Expected: {'diff': 68, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001101; b = 8'b11001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 469,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 68, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011100; b = 8'b01011111; bin = 1'b0; // Expected: {'diff': 189, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011100; b = 8'b01011111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 470,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 189, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010010; b = 8'b11110110; bin = 1'b0; // Expected: {'diff': 28, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010010; b = 8'b11110110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 471,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 28, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011111; b = 8'b01101100; bin = 1'b0; // Expected: {'diff': 243, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011111; b = 8'b01101100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 472,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 243, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111111; b = 8'b10100000; bin = 1'b0; // Expected: {'diff': 223, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111111; b = 8'b10100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 473,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 223, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000111; b = 8'b00101101; bin = 1'b0; // Expected: {'diff': 218, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000111; b = 8'b00101101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 474,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 218, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100011; b = 8'b01101011; bin = 1'b1; // Expected: {'diff': 183, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100011; b = 8'b01101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 475,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 183, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111000; b = 8'b10000010; bin = 1'b0; // Expected: {'diff': 54, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111000; b = 8'b10000010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 476,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100000; b = 8'b01011011; bin = 1'b0; // Expected: {'diff': 69, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100000; b = 8'b01011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 477,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 69, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111101; b = 8'b01101011; bin = 1'b0; // Expected: {'diff': 82, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111101; b = 8'b01101011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 478,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 82, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b01001010; bin = 1'b1; // Expected: {'diff': 47, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b01001010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 479,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010001; b = 8'b11111011; bin = 1'b0; // Expected: {'diff': 86, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010001; b = 8'b11111011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 480,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100000; b = 8'b01101100; bin = 1'b1; // Expected: {'diff': 51, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100000; b = 8'b01101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 481,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 51, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001001; b = 8'b00111010; bin = 1'b0; // Expected: {'diff': 207, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001001; b = 8'b00111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 482,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 207, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001011; b = 8'b10000000; bin = 1'b0; // Expected: {'diff': 203, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001011; b = 8'b10000000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 483,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 203, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101001; b = 8'b11000001; bin = 1'b1; // Expected: {'diff': 103, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101001; b = 8'b11000001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 484,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 103, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010101; b = 8'b11110000; bin = 1'b0; // Expected: {'diff': 101, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010101; b = 8'b11110000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 485,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 101, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100111; b = 8'b11011001; bin = 1'b1; // Expected: {'diff': 77, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100111; b = 8'b11011001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 486,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011011; b = 8'b00111001; bin = 1'b1; // Expected: {'diff': 97, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011011; b = 8'b00111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 487,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010110; b = 8'b10111010; bin = 1'b0; // Expected: {'diff': 220, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010110; b = 8'b10111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 488,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 220, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100001; b = 8'b01100110; bin = 1'b1; // Expected: {'diff': 250, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100001; b = 8'b01100110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 489,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 250, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011111; b = 8'b01111100; bin = 1'b0; // Expected: {'diff': 99, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011111; b = 8'b01111100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 490,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 99, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111010; b = 8'b10001010; bin = 1'b0; // Expected: {'diff': 112, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111010; b = 8'b10001010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 491,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111011; b = 8'b00111010; bin = 1'b0; // Expected: {'diff': 65, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111011; b = 8'b00111010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 492,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 65, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100111; b = 8'b10100011; bin = 1'b1; // Expected: {'diff': 195, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100111; b = 8'b10100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 493,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 195, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111111; b = 8'b01111101; bin = 1'b0; // Expected: {'diff': 130, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111111; b = 8'b01111101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 494,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 130, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011111; b = 8'b01010100; bin = 1'b0; // Expected: {'diff': 75, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011111; b = 8'b01010100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 495,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 75, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100011; b = 8'b01100100; bin = 1'b0; // Expected: {'diff': 191, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100011; b = 8'b01100100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 496,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 191, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001111; b = 8'b11001100; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001111; b = 8'b11001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 497,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001101; b = 8'b00011110; bin = 1'b1; // Expected: {'diff': 46, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001101; b = 8'b00011110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 498,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101110; b = 8'b00001001; bin = 1'b1; // Expected: {'diff': 164, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101110; b = 8'b00001001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 499,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 164, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011110; b = 8'b01000111; bin = 1'b1; // Expected: {'diff': 86, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011110; b = 8'b01000111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 500,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 86, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001110; b = 8'b10000100; bin = 1'b1; // Expected: {'diff': 201, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001110; b = 8'b10000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 501,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 201, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101100; b = 8'b10100101; bin = 1'b1; // Expected: {'diff': 134, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101100; b = 8'b10100101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 502,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 134, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001111; b = 8'b00000000; bin = 1'b1; // Expected: {'diff': 14, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001111; b = 8'b00000000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 503,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 14, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101101; b = 8'b00111110; bin = 1'b0; // Expected: {'diff': 239, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101101; b = 8'b00111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 504,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 239, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000011; b = 8'b00111000; bin = 1'b0; // Expected: {'diff': 139, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000011; b = 8'b00111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 505,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 139, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010001; b = 8'b10111001; bin = 1'b0; // Expected: {'diff': 152, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010001; b = 8'b10111001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 506,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 152, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100010; b = 8'b01010001; bin = 1'b0; // Expected: {'diff': 17, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100010; b = 8'b01010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 507,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 17, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100011; b = 8'b10101110; bin = 1'b1; // Expected: {'diff': 244, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100011; b = 8'b10101110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 508,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 244, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000010; b = 8'b00110010; bin = 1'b1; // Expected: {'diff': 79, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000010; b = 8'b00110010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 509,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111001; b = 8'b10010110; bin = 1'b1; // Expected: {'diff': 98, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111001; b = 8'b10010110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 510,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111111; b = 8'b10001100; bin = 1'b0; // Expected: {'diff': 115, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111111; b = 8'b10001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 511,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100010; b = 8'b01100101; bin = 1'b0; // Expected: {'diff': 125, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100010; b = 8'b01100101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 512,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 125, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001111; b = 8'b10001100; bin = 1'b1; // Expected: {'diff': 194, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001111; b = 8'b10001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 513,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 194, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010110; b = 8'b11111101; bin = 1'b1; // Expected: {'diff': 152, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010110; b = 8'b11111101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 514,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 152, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011100; b = 8'b01100111; bin = 1'b0; // Expected: {'diff': 117, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011100; b = 8'b01100111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 515,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 117, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110000; b = 8'b00001001; bin = 1'b0; // Expected: {'diff': 39, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110000; b = 8'b00001001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 516,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 39, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101100; b = 8'b00001110; bin = 1'b1; // Expected: {'diff': 157, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101100; b = 8'b00001110; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 517,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 157, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100110; b = 8'b11011001; bin = 1'b0; // Expected: {'diff': 77, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100110; b = 8'b11011001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 518,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101001; b = 8'b01001100; bin = 1'b1; // Expected: {'diff': 92, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101001; b = 8'b01001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 519,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 92, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100111; b = 8'b10010110; bin = 1'b0; // Expected: {'diff': 145, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100111; b = 8'b10010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 520,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 145, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100100; b = 8'b11110111; bin = 1'b0; // Expected: {'diff': 45, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100100; b = 8'b11110111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 521,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 45, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000000; b = 8'b11100000; bin = 1'b0; // Expected: {'diff': 32, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000000; b = 8'b11100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 522,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000110; b = 8'b10010000; bin = 1'b0; // Expected: {'diff': 54, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000110; b = 8'b10010000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 523,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111101; b = 8'b11111111; bin = 1'b0; // Expected: {'diff': 190, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111101; b = 8'b11111111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 524,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 190, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100001; b = 8'b11111000; bin = 1'b0; // Expected: {'diff': 169, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100001; b = 8'b11111000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 525,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 169, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011111; b = 8'b00100010; bin = 1'b0; // Expected: {'diff': 189, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011111; b = 8'b00100010; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 526,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 189, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000111; b = 8'b10100010; bin = 1'b1; // Expected: {'diff': 100, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000111; b = 8'b10100010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 527,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 100, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010000; b = 8'b01001100; bin = 1'b1; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010000; b = 8'b01001100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 528,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010101; b = 8'b10010001; bin = 1'b0; // Expected: {'diff': 196, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010101; b = 8'b10010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 529,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 196, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100111; b = 8'b10010110; bin = 1'b0; // Expected: {'diff': 81, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100111; b = 8'b10010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 530,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 81, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011001; b = 8'b11001011; bin = 1'b0; // Expected: {'diff': 206, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011001; b = 8'b11001011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 531,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 206, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001011; b = 8'b00111110; bin = 1'b0; // Expected: {'diff': 141, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001011; b = 8'b00111110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 532,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 141, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010110; b = 8'b00100001; bin = 1'b1; // Expected: {'diff': 180, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010110; b = 8'b00100001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 533,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 180, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101010; b = 8'b00100000; bin = 1'b0; // Expected: {'diff': 74, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101010; b = 8'b00100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 534,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 74, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101000; b = 8'b00101011; bin = 1'b1; // Expected: {'diff': 252, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101000; b = 8'b00101011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 535,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 252, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100011; b = 8'b01010110; bin = 1'b0; // Expected: {'diff': 77, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100011; b = 8'b01010110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 536,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 77, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111000; b = 8'b11010011; bin = 1'b1; // Expected: {'diff': 228, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111000; b = 8'b11010011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 537,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 228, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001001; b = 8'b01001100; bin = 1'b0; // Expected: {'diff': 253, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001001; b = 8'b01001100; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 538,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 253, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101000; b = 8'b00110011; bin = 1'b1; // Expected: {'diff': 116, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101000; b = 8'b00110011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 539,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 116, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000010; b = 8'b10100000; bin = 1'b0; // Expected: {'diff': 98, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000010; b = 8'b10100000; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 540,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 98, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b10011010; bin = 1'b1; // Expected: {'diff': 78, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b10011010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 541,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 78, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010101; b = 8'b11111001; bin = 1'b1; // Expected: {'diff': 155, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010101; b = 8'b11111001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 542,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 155, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000111; b = 8'b11011000; bin = 1'b1; // Expected: {'diff': 174, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000111; b = 8'b11011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 543,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 174, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100010; b = 8'b10010111; bin = 1'b1; // Expected: {'diff': 10, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100010; b = 8'b10010111; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 544,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 10, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011011; b = 8'b01001101; bin = 1'b1; // Expected: {'diff': 205, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011011; b = 8'b01001101; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 545,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 205, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000001; b = 8'b01011000; bin = 1'b1; // Expected: {'diff': 104, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000001; b = 8'b01011000; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 546,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 104, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001000; b = 8'b00101001; bin = 1'b0; // Expected: {'diff': 95, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001000; b = 8'b00101001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 547,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110001; b = 8'b10110011; bin = 1'b0; // Expected: {'diff': 190, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110001; b = 8'b10110011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 548,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 190, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010000; b = 8'b10010010; bin = 1'b1; // Expected: {'diff': 189, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010000; b = 8'b10010010; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 549,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 189, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100001; b = 8'b00110001; bin = 1'b0; // Expected: {'diff': 112, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100001; b = 8'b00110001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 550,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 112, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000100; b = 8'b10100011; bin = 1'b1; // Expected: {'diff': 96, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000100; b = 8'b10100011; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 551,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 96, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011011; b = 8'b01101100; bin = 1'b1; // Expected: {'diff': 46, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011011; b = 8'b01101100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 552,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101001; b = 8'b00010111; bin = 1'b0; // Expected: {'diff': 146, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101001; b = 8'b00010111; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 553,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 146, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001101; b = 8'b00000100; bin = 1'b1; // Expected: {'diff': 200, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001101; b = 8'b00000100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 554,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 200, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010111; b = 8'b10001110; bin = 1'b0; // Expected: {'diff': 137, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010111; b = 8'b10001110; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 555,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 137, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111101; b = 8'b10011100; bin = 1'b1; // Expected: {'diff': 32, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111101; b = 8'b10011100; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 556,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 32, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101111; b = 8'b10010101; bin = 1'b0; // Expected: {'diff': 218, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101111; b = 8'b10010101; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 557,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 218, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101101; b = 8'b00110001; bin = 1'b1; // Expected: {'diff': 187, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101101; b = 8'b00110001; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 558,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 187, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011010; b = 8'b10010001; bin = 1'b0; // Expected: {'diff': 9, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011010; b = 8'b10010001; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 559,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101101; b = 8'b11011011; bin = 1'b0; // Expected: {'diff': 210, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101101; b = 8'b11011011; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 560,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 210, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
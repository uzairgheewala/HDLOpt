
`timescale 1ns / 1ps

module tb_N14_kogge_stone_adder;

    // Parameters
    
    parameter N = 14;
    
     
    // Inputs
    
    reg  [13:0] a;
    
    reg  [13:0] b;
    
    
    // Outputs
    
    wire  [13:0] sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    kogge_stone_adder  #( N ) uut (
        
        .a(a),
        
        .b(b),
        
        
        .sum(sum),
        
        .cout(cout)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 14'b01110001111011; b = 14'b11011101001110; // Expected: {'sum': 5065, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110001111011; b = 14'b11011101001110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5065, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01000011101110; b = 14'b11111011010001; // Expected: {'sum': 4031, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01000011101110; b = 14'b11111011010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4031, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00111100111101; b = 14'b11100101001100; // Expected: {'sum': 2185, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b00111100111101; b = 14'b11100101001100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2185, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000011000110; b = 14'b01001001001101; // Expected: {'sum': 787, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000011000110; b = 14'b01001001001101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 787, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10101001001001; b = 14'b00110000010100; // Expected: {'sum': 13917, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10101001001001; b = 14'b00110000010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13917, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011001000111; b = 14'b10111001000001; // Expected: {'sum': 5256, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011001000111; b = 14'b10111001000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5256, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01010111100010; b = 14'b11100100001111; // Expected: {'sum': 3825, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01010111100010; b = 14'b11100100001111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3825, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110011101011; b = 14'b01111110110101; // Expected: {'sum': 11424, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110011101011; b = 14'b01111110110101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11424, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001110000011; b = 14'b10101100100011; // Expected: {'sum': 16038, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001110000011; b = 14'b10101100100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16038, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10000100101001; b = 14'b10010000100101; // Expected: {'sum': 1358, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10000100101001; b = 14'b10010000100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1358, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00101000101011; b = 14'b11001110001110; // Expected: {'sum': 15801, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00101000101011; b = 14'b11001110001110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15801, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011011011101; b = 14'b11111001000011; // Expected: {'sum': 9504, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011011011101; b = 14'b11111001000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9504, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000111011011; b = 14'b10001110001010; // Expected: {'sum': 5477, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000111011011; b = 14'b10001110001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5477, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10011000011101; b = 14'b00101110101110; // Expected: {'sum': 12747, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10011000011101; b = 14'b00101110101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12747, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111110000001; b = 14'b11011001001010; // Expected: {'sum': 9675, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111110000001; b = 14'b11011001001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9675, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10110011101101; b = 14'b01110000111111; // Expected: {'sum': 2348, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b10110011101101; b = 14'b01110000111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2348, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000011001000; b = 14'b11101011000100; // Expected: {'sum': 11148, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000011001000; b = 14'b11101011000100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11148, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110000000100; b = 14'b00101100101101; // Expected: {'sum': 10033, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110000000100; b = 14'b00101100101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10033, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10010011000110; b = 14'b00110001010100; // Expected: {'sum': 12570, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10010011000110; b = 14'b00110001010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12570, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011110101101; b = 14'b01111001010100; // Expected: {'sum': 9729, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011110101101; b = 14'b01111001010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9729, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01110000001000; b = 14'b11110101001100; // Expected: {'sum': 6484, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01110000001000; b = 14'b11110101001100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6484, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b01001010000110; b = 14'b11000111010000; // Expected: {'sum': 1110, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b01001010000110; b = 14'b11000111010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1110, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00010001111101; b = 14'b11010001010100; // Expected: {'sum': 14545, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00010001111101; b = 14'b11010001010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 14545, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11010000010011; b = 14'b10000111001111; // Expected: {'sum': 5602, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11010000010011; b = 14'b10000111001111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5602, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11000000000111; b = 14'b00100001111010; // Expected: {'sum': 14465, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b11000000000111; b = 14'b00100001111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 14465, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b11001100000001; b = 14'b01000100000000; // Expected: {'sum': 1025, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 14'b11001100000001; b = 14'b01000100000000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1025, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110100000001; b = 14'b10011010011001; // Expected: {'sum': 13210, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110100000001; b = 14'b10011010011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13210, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b10111011000000; b = 14'b00011100011110; // Expected: {'sum': 13790, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b10111011000000; b = 14'b00011100011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13790, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000100111101; b = 14'b10111001010010; // Expected: {'sum': 12175, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000100111101; b = 14'b10111001010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12175, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00011100010001; b = 14'b10101111110100; // Expected: {'sum': 13061, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00011100010001; b = 14'b10101111110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13061, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00000100011010; b = 14'b00101111010101; // Expected: {'sum': 3311, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00000100011010; b = 14'b00101111010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3311, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00100110100000; b = 14'b00111001010000; // Expected: {'sum': 6128, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00100110100000; b = 14'b00111001010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6128, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 14'b00110101001111; b = 14'b10111111010100; // Expected: {'sum': 15651, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 14'b00110101001111; b = 14'b10111111010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15651, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
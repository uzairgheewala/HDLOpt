
`timescale 1ns / 1ps

module tb_N17_kogge_stone_adder;

    // Parameters
    
    parameter N = 17;
    
     
    // Inputs
    
    reg  [16:0] a;
    
    reg  [16:0] b;
    
    
    // Outputs
    
    wire  [16:0] sum;
    
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
        
        a = 17'b01010100000101000; b = 17'b11110110000101101; // Expected: {'sum': 37973, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b01010100000101000; b = 17'b11110110000101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37973, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b00111011111010000; b = 17'b01111000100000101; // Expected: {'sum': 92373, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b00111011111010000; b = 17'b01111000100000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 92373, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b11010110110111100; b = 17'b10110000010001010; // Expected: {'sum': 69190, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b11010110110111100; b = 17'b10110000010001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 69190, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10111111111100000; b = 17'b11111101011011101; // Expected: {'sum': 96957, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b10111111111100000; b = 17'b11111101011011101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 96957, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10010101001011110; b = 17'b10011110010010011; // Expected: {'sum': 26353, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b10010101001011110; b = 17'b10011110010010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 26353, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10011111010001001; b = 17'b00100011010000100; // Expected: {'sum': 99597, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b10011111010001001; b = 17'b00100011010000100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 99597, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10100010101111001; b = 17'b00100000110011000; // Expected: {'sum': 100113, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b10100010101111001; b = 17'b00100000110011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 100113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b01001000001001110; b = 17'b01011111010110101; // Expected: {'sum': 85763, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b01001000001001110; b = 17'b01011111010110101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 85763, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b00111110001010100; b = 17'b10010101000001010; // Expected: {'sum': 108126, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b00111110001010100; b = 17'b10010101000001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 108126, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b00111100111110101; b = 17'b00100101111011011; // Expected: {'sum': 50640, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b00111100111110101; b = 17'b00100101111011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 50640, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b00000000111000000; b = 17'b11000101110100101; // Expected: {'sum': 101733, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b00000000111000000; b = 17'b11000101110100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 101733, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10000011111110011; b = 17'b01111100000101001; // Expected: {'sum': 28, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b10000011111110011; b = 17'b01111100000101001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 28, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10101100111100000; b = 17'b01001000001100111; // Expected: {'sum': 125511, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b10101100111100000; b = 17'b01001000001100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 125511, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b00110000100110110; b = 17'b11100110100000010; // Expected: {'sum': 11832, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b00110000100110110; b = 17'b11100110100000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11832, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b11010011110100011; b = 17'b00100101100011101; // Expected: {'sum': 127680, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b11010011110100011; b = 17'b00100101100011101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 127680, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b11110111000111101; b = 17'b01011000001000010; // Expected: {'sum': 40575, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b11110111000111101; b = 17'b01011000001000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 40575, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10000110100011001; b = 17'b10010000100000010; // Expected: {'sum': 11803, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b10000110100011001; b = 17'b10010000100000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11803, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b01111001000101011; b = 17'b11101010100100101; // Expected: {'sum': 51024, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b01111001000101011; b = 17'b11101010100100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 51024, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b00010100101111111; b = 17'b11010011001011011; // Expected: {'sum': 118746, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b00010100101111111; b = 17'b11010011001011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 118746, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b11001101010010011; b = 17'b11011001110011001; // Expected: {'sum': 85548, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b11001101010010011; b = 17'b11011001110011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 85548, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10000101001011001; b = 17'b10011010001011011; // Expected: {'sum': 16052, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b10000101001011001; b = 17'b10011010001011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16052, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b11010110011100010; b = 17'b01110001011001101; // Expected: {'sum': 36783, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b11010110011100010; b = 17'b01110001011001101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 36783, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10011111101000010; b = 17'b00010111111010000; // Expected: {'sum': 93970, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b10011111101000010; b = 17'b00010111111010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 93970, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b00011110001000001; b = 17'b11000101100110000; // Expected: {'sum': 116593, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b00011110001000001; b = 17'b11000101100110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 116593, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b11110101110011110; b = 17'b00110000001111101; // Expected: {'sum': 19483, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b11110101110011110; b = 17'b00110000001111101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 19483, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b01000110100011011; b = 17'b00011111011100001; // Expected: {'sum': 52220, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b01000110100011011; b = 17'b00011111011100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 52220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10110101010111101; b = 17'b00101110000100100; // Expected: {'sum': 116449, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b10110101010111101; b = 17'b00101110000100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 116449, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10010111111111110; b = 17'b00001101111111111; // Expected: {'sum': 84989, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b10010111111111110; b = 17'b00001101111111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 84989, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b11100100100000101; b = 17'b10110101000001001; // Expected: {'sum': 78606, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b11100100100000101; b = 17'b10110101000001001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 78606, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10010101001001101; b = 17'b00001010111111111; // Expected: {'sum': 81996, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b10010101001001101; b = 17'b00001010111111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 81996, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b10001110001010111; b = 17'b10111010110000110; // Expected: {'sum': 37341, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 17'b10001110001010111; b = 17'b10111010110000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37341, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b01111000110111110; b = 17'b01110110011011110; // Expected: {'sum': 122524, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b01111000110111110; b = 17'b01110110011011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 122524, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 17'b00010101110110101; b = 17'b10000001111011100; // Expected: {'sum': 77713, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 17'b00010101110110101; b = 17'b10000001111011100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 77713, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
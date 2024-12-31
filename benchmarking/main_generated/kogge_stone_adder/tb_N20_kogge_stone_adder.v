
`timescale 1ns / 1ps

module tb_N20_kogge_stone_adder;

    // Parameters
    
    parameter N = 20;
    
     
    // Inputs
    
    reg  [19:0] a;
    
    reg  [19:0] b;
    
    
    // Outputs
    
    wire  [19:0] sum;
    
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
        
        a = 20'b11110001000110100011; b = 20'b00100001011101011001; // Expected: {'sum': 76028, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11110001000110100011; b = 20'b00100001011101011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 76028, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11010101100100111011; b = 20'b00101011111000111111; // Expected: {'sum': 6010, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11010101100100111011; b = 20'b00101011111000111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6010, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11101111001011111011; b = 20'b11100100010101001011; // Expected: {'sum': 866374, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11101111001011111011; b = 20'b11100100010101001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 866374, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b10010111010011001010; b = 20'b10000011100100101000; // Expected: {'sum': 110066, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b10010111010011001010; b = 20'b10000011100100101000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 110066, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11100110010101000100; b = 20'b11000110011100110000; // Expected: {'sum': 707700, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11100110010101000100; b = 20'b11000110011100110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 707700, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b01010101000100101010; b = 20'b00001110101101110110; // Expected: {'sum': 408736, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b01010101000100101010; b = 20'b00001110101101110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 408736, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b01010010000011100011; b = 20'b11010011101110110001; // Expected: {'sum': 154772, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b01010010000011100011; b = 20'b11010011101110110001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 154772, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b01010101001011011000; b = 20'b11101100100110101110; // Expected: {'sum': 269446, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b01010101001011011000; b = 20'b11101100100110101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 269446, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b00000111101100010100; b = 20'b01010001000101010100; // Expected: {'sum': 363624, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b00000111101100010100; b = 20'b01010001000101010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 363624, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b01111110110010000110; b = 20'b10001101100110100101; // Expected: {'sum': 50731, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b01111110110010000110; b = 20'b10001101100110100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 50731, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b00111100110110110001; b = 20'b01100010000101111001; // Expected: {'sum': 651050, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b00111100110110110001; b = 20'b01100010000101111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 651050, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b00000010000010100000; b = 20'b11011000111100110101; // Expected: {'sum': 896981, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b00000010000010100000; b = 20'b11011000111100110101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 896981, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b00001001100011100001; b = 20'b01100011110001111010; // Expected: {'sum': 447835, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b00001001100011100001; b = 20'b01100011110001111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 447835, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11011010101101001110; b = 20'b10001101011110011110; // Expected: {'sum': 426732, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11011010101101001110; b = 20'b10001101011110011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 426732, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b01100101010010001001; b = 20'b10001010101001010111; // Expected: {'sum': 982752, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b01100101010010001001; b = 20'b10001010101001010111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 982752, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b01010110001111001011; b = 20'b00111111011011110011; // Expected: {'sum': 613054, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b01010110001111001011; b = 20'b00111111011011110011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 613054, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b01111100100011001001; b = 20'b10100100000000110101; // Expected: {'sum': 133374, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b01111100100011001001; b = 20'b10100100000000110101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 133374, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b01010100000011010011; b = 20'b00100010001111000010; // Expected: {'sum': 484501, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b01010100000011010011; b = 20'b00100010001111000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 484501, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b00010100101111101000; b = 20'b11111001000111100001; // Expected: {'sum': 56777, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b00010100101111101000; b = 20'b11111001000111100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 56777, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b10001110000001011100; b = 20'b10100101111010111011; // Expected: {'sum': 212759, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b10001110000001011100; b = 20'b10100101111010111011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 212759, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11111100111100010100; b = 20'b11001101100111010011; // Expected: {'sum': 829671, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11111100111100010100; b = 20'b11001101100111010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 829671, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11111101100110111101; b = 20'b00110001001000111100; // Expected: {'sum': 191481, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11111101100110111101; b = 20'b00110001001000111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 191481, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11001100001011111101; b = 20'b01101010010111000111; // Expected: {'sum': 223428, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11001100001011111101; b = 20'b01101010010111000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 223428, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b10010111001100000101; b = 20'b11011010100100001110; // Expected: {'sum': 465939, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b10010111001100000101; b = 20'b11011010100100001110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 465939, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b00001100011000011011; b = 20'b10100100111101001110; // Expected: {'sum': 726377, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b00001100011000011011; b = 20'b10100100111101001110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 726377, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11000111110101100011; b = 20'b00010101111001010010; // Expected: {'sum': 908213, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 20'b11000111110101100011; b = 20'b00010101111001010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 908213, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b01101101011101100100; b = 20'b11001010100101001101; // Expected: {'sum': 229553, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b01101101011101100100; b = 20'b11001010100101001101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 229553, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b00111101100000000111; b = 20'b11001110110111101000; // Expected: {'sum': 50671, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b00111101100000000111; b = 20'b11001110110111101000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 50671, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b10111011011010001100; b = 20'b10101010111101010011; // Expected: {'sum': 419295, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b10111011011010001100; b = 20'b10101010111101010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 419295, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11010010001000001011; b = 20'b10000111111111111010; // Expected: {'sum': 369157, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11010010001000001011; b = 20'b10000111111111111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 369157, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b11011100101100011101; b = 20'b01010101000111100100; // Expected: {'sum': 204033, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b11011100101100011101; b = 20'b01010101000111100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 204033, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b00100110001001011111; b = 20'b11101001110110110000; // Expected: {'sum': 65551, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b00100110001001011111; b = 20'b11101001110110110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 65551, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 20'b10001011111100010111; b = 20'b01110100010010010001; // Expected: {'sum': 936, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 20'b10001011111100010111; b = 20'b01110100010010010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 936, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
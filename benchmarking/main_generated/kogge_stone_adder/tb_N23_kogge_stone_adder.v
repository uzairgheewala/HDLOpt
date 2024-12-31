
`timescale 1ns / 1ps

module tb_N23_kogge_stone_adder;

    // Parameters
    
    parameter N = 23;
    
     
    // Inputs
    
    reg  [22:0] a;
    
    reg  [22:0] b;
    
    
    // Outputs
    
    wire  [22:0] sum;
    
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
        
        a = 23'b10101011001011110011111; b = 23'b00000101010101111100110; // Expected: {'sum': 5784453, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b10101011001011110011111; b = 23'b00000101010101111100110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5784453, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b01110101101001001011011; b = 23'b10001100100111111111111; // Expected: {'sum': 74330, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b01110101101001001011011; b = 23'b10001100100111111111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 74330, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b01111100111100010110101; b = 23'b10001011101101010000001; // Expected: {'sum': 283446, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b01111100111100010110101; b = 23'b10001011101101010000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 283446, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b01100010001111101011100; b = 23'b00111110001001101000111; // Expected: {'sum': 5255843, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b01100010001111101011100; b = 23'b00111110001001101000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5255843, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b00110111100110100100001; b = 23'b10110011011011001011111; // Expected: {'sum': 7701376, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b00110111100110100100001; b = 23'b10110011011011001011111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7701376, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10100101001010111011111; b = 23'b11111010001011111101110; // Expected: {'sum': 5221837, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b10100101001010111011111; b = 23'b11111010001011111101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5221837, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b11000000010011110001110; b = 23'b10011001000000100001011; // Expected: {'sum': 2926745, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b11000000010011110001110; b = 23'b10011001000000100001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2926745, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10001010011010101111110; b = 23'b00111110011010101100011; // Expected: {'sum': 6580961, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b10001010011010101111110; b = 23'b00111110011010101100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6580961, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b11001101010101110111111; b = 23'b10000100000100010011000; // Expected: {'sum': 2667607, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b11001101010101110111111; b = 23'b10000100000100010011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2667607, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b00010100011100101110110; b = 23'b01001001000000111110111; // Expected: {'sum': 3062637, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b00010100011100101110110; b = 23'b01001001000000111110111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3062637, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b00110011010110111110111; b = 23'b11110111010101100000101; // Expected: {'sum': 1399036, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b00110011010110111110111; b = 23'b11110111010101100000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1399036, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10100100110001110000111; b = 23'b01110100101111111111010; // Expected: {'sum': 836481, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b10100100110001110000111; b = 23'b01110100101111111111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 836481, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b00010110001100010111011; b = 23'b00010001010011010010010; // Expected: {'sum': 1294157, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b00010110001100010111011; b = 23'b00010001010011010010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1294157, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10001000101111010010001; b = 23'b00111100010101001110100; // Expected: {'sum': 6457605, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b10001000101111010010001; b = 23'b00111100010101001110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6457605, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b00000111111100100110010; b = 23'b01110001010000101001110; // Expected: {'sum': 3971712, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b00000111111100100110010; b = 23'b01110001010000101001110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3971712, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b11110100010101001100111; b = 23'b10100101100011010101100; // Expected: {'sum': 5042451, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b11110100010101001100111; b = 23'b10100101100011010101100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5042451, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b01000001101000010010000; b = 23'b00011101000000001100111; // Expected: {'sum': 3100919, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b01000001101000010010000; b = 23'b00011101000000001100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3100919, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10011100011001111101011; b = 23'b00101111011101101010000; // Expected: {'sum': 6680379, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b10011100011001111101011; b = 23'b00101111011101101010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6680379, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b11000010111001100101000; b = 23'b01000111011000001001101; // Expected: {'sum': 336757, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b11000010111001100101000; b = 23'b01000111011000001001101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 336757, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b00100011001001001001100; b = 23'b01110000100001010011111; // Expected: {'sum': 4838635, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b00100011001001001001100; b = 23'b01110000100001010011111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4838635, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b11010111100000001101000; b = 23'b01011010000110011010100; // Expected: {'sum': 1625404, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b11010111100000001101000; b = 23'b01011010000110011010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1625404, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10111001101100000000010; b = 23'b11010110011101011000010; // Expected: {'sum': 4723396, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b10111001101100000000010; b = 23'b11010110011101011000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4723396, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b01000001011000110001100; b = 23'b00101011001010100101100; // Expected: {'sum': 3557048, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b01000001011000110001100; b = 23'b00101011001010100101100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3557048, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10110110001100111011010; b = 23'b10101110000111110110010; // Expected: {'sum': 3287436, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b10110110001100111011010; b = 23'b10101110000111110110010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3287436, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10111011000101111001101; b = 23'b01110000100100011101100; // Expected: {'sum': 1430713, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b10111011000101111001101; b = 23'b01110000100100011101100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1430713, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b11011100100101101010100; b = 23'b01000011110100101101000; // Expected: {'sum': 1062076, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b11011100100101101010100; b = 23'b01000011110100101101000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1062076, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10011010000111001010001; b = 23'b10100011110110110011011; // Expected: {'sum': 2030572, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b10011010000111001010001; b = 23'b10100011110110110011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2030572, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b00101000110000101110110; b = 23'b00011110001100011110100; // Expected: {'sum': 2325098, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b00101000110000101110110; b = 23'b00011110001100011110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2325098, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b00101110001110000110101; b = 23'b00001000011110100001011; // Expected: {'sum': 1792320, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b00101110001110000110101; b = 23'b00001000011110100001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1792320, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10011010000110011010100; b = 23'b00100110001111100011011; // Expected: {'sum': 6302703, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b10011010000110011010100; b = 23'b00100110001111100011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6302703, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10011110011010010011100; b = 23'b00011111001010110010110; // Expected: {'sum': 6212146, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 23'b10011110011010010011100; b = 23'b00011111001010110010110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6212146, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10010101100100011011101; b = 23'b11110010010100001100100; // Expected: {'sum': 4452673, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b10010101100100011011101; b = 23'b11110010010100001100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4452673, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 23'b10100100000111001010000; b = 23'b01111101001100101111110; // Expected: {'sum': 1091534, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 23'b10100100000111001010000; b = 23'b01111101001100101111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1091534, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
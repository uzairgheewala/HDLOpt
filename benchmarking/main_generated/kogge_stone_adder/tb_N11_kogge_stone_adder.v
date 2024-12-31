
`timescale 1ns / 1ps

module tb_N11_kogge_stone_adder;

    // Parameters
    
    parameter N = 11;
    
     
    // Inputs
    
    reg  [10:0] a;
    
    reg  [10:0] b;
    
    
    // Outputs
    
    wire  [10:0] sum;
    
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
        
        a = 11'b10101010101; b = 11'b01101101011; // Expected: {'sum': 192, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101010101; b = 11'b01101101011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 192, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11010101101; b = 11'b01110000001; // Expected: {'sum': 558, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11010101101; b = 11'b01110000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 558, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010001010; b = 11'b10000011100; // Expected: {'sum': 1190, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010001010; b = 11'b10000011100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1190, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010001001; b = 11'b11000001000; // Expected: {'sum': 657, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010001001; b = 11'b11000001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 657, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00010101110; b = 11'b10000000110; // Expected: {'sum': 1204, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00010101110; b = 11'b10000000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1204, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001000111; b = 11'b00101001001; // Expected: {'sum': 400, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001000111; b = 11'b00101001001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 400, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010100000; b = 11'b01001110110; // Expected: {'sum': 1302, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010100000; b = 11'b01001110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1302, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011010000; b = 11'b01011101010; // Expected: {'sum': 1466, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011010000; b = 11'b01011101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1466, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00001001111; b = 11'b00010111111; // Expected: {'sum': 270, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00001001111; b = 11'b00010111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 270, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01010111000; b = 11'b01000000111; // Expected: {'sum': 1215, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01010111000; b = 11'b01000000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1215, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101100010; b = 11'b10110101010; // Expected: {'sum': 1292, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101100010; b = 11'b10110101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1292, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000101010; b = 11'b10000110111; // Expected: {'sum': 1121, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000101010; b = 11'b10000110111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1121, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01000110100; b = 11'b00110111011; // Expected: {'sum': 1007, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01000110100; b = 11'b00110111011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1007, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101011100; b = 11'b01010110000; // Expected: {'sum': 12, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101011100; b = 11'b01010110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111100011; b = 11'b01101000101; // Expected: {'sum': 1832, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111100011; b = 11'b01101000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1832, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000000001; b = 11'b11010111101; // Expected: {'sum': 1726, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000000001; b = 11'b11010111101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1726, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01011001000; b = 11'b00010100110; // Expected: {'sum': 878, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01011001000; b = 11'b00010100110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 878, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01001111001; b = 11'b11101101101; // Expected: {'sum': 486, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01001111001; b = 11'b11101101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 486, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100111101; b = 11'b11111111100; // Expected: {'sum': 825, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100111101; b = 11'b11111111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 825, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01101111010; b = 11'b01000101110; // Expected: {'sum': 1448, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01101111010; b = 11'b01000101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1448, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01111110100; b = 11'b01100000111; // Expected: {'sum': 1787, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01111110100; b = 11'b01100000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1787, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100010111; b = 11'b01011001111; // Expected: {'sum': 1510, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100010111; b = 11'b01011001111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1510, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10101010100; b = 11'b10101000011; // Expected: {'sum': 663, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10101010100; b = 11'b10101000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 663, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00000100101; b = 11'b10011011100; // Expected: {'sum': 1281, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b00000100101; b = 11'b10011011100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1281, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11101111000; b = 11'b11111001000; // Expected: {'sum': 1856, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11101111000; b = 11'b11111001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1856, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10110000111; b = 11'b01001011101; // Expected: {'sum': 2020, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10110000111; b = 11'b01001011101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2020, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000011001; b = 11'b01000010001; // Expected: {'sum': 1578, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000011001; b = 11'b01000010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1578, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10010101011; b = 11'b11001001000; // Expected: {'sum': 755, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10010101011; b = 11'b11001001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 755, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b01100011001; b = 11'b11010011000; // Expected: {'sum': 433, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b01100011001; b = 11'b11010011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 433, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b10000000011; b = 11'b11111001000; // Expected: {'sum': 971, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b10000000011; b = 11'b11111001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 971, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b00111011001; b = 11'b11111000101; // Expected: {'sum': 414, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b00111011001; b = 11'b11111000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 414, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11110000100; b = 11'b11001111101; // Expected: {'sum': 1537, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11110000100; b = 11'b11001111101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1537, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 11'b11000001100; b = 11'b01010010101; // Expected: {'sum': 161, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 11'b11000001100; b = 11'b01010010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 161, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
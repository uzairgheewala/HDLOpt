
`timescale 1ns / 1ps

module tb_N13_kogge_stone_adder;

    // Parameters
    
    parameter N = 13;
    
     
    // Inputs
    
    reg  [12:0] a;
    
    reg  [12:0] b;
    
    
    // Outputs
    
    wire  [12:0] sum;
    
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
        
        a = 13'b1000111111100; b = 13'b0110000000011; // Expected: {'sum': 7679, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1000111111100; b = 13'b0110000000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7679, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111010011101; b = 13'b0010110010011; // Expected: {'sum': 5168, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111010011101; b = 13'b0010110010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5168, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100000111000; b = 13'b0001000011110; // Expected: {'sum': 2646, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100000111000; b = 13'b0001000011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2646, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100110010111; b = 13'b0110010010101; // Expected: {'sum': 1580, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100110010111; b = 13'b0110010010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1580, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1110011111000; b = 13'b0100010000001; // Expected: {'sum': 1401, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1110011111000; b = 13'b0100010000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1401, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111011101111; b = 13'b0101100010011; // Expected: {'sum': 6658, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111011101111; b = 13'b0101100010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6658, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011100011000; b = 13'b1001111111010; // Expected: {'sum': 2834, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011100011000; b = 13'b1001111111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2834, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100111000010; b = 13'b1001110011001; // Expected: {'sum': 3419, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100111000010; b = 13'b1001110011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3419, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011001100110; b = 13'b0101110010100; // Expected: {'sum': 4602, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011001100110; b = 13'b0101110010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4602, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000001110010; b = 13'b0100001101100; // Expected: {'sum': 2270, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000001110010; b = 13'b0100001101100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2270, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011110000100; b = 13'b1001100101110; // Expected: {'sum': 6834, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011110000100; b = 13'b1001100101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6834, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001101001111; b = 13'b1110001101101; // Expected: {'sum': 8124, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001101001111; b = 13'b1110001101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1010010111011; b = 13'b0101010110110; // Expected: {'sum': 8049, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b1010010111011; b = 13'b0101010110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8049, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111100010001; b = 13'b1011100000011; // Expected: {'sum': 1556, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111100010001; b = 13'b1011100000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1556, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001100110111; b = 13'b0000110010001; // Expected: {'sum': 1224, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001100110111; b = 13'b0000110010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1224, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111000000111; b = 13'b0011011100100; // Expected: {'sum': 5355, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111000000111; b = 13'b0011011100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5355, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111001110100; b = 13'b0011011100000; // Expected: {'sum': 1364, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111001110100; b = 13'b0011011100000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1364, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011101001001; b = 13'b1111111010001; // Expected: {'sum': 5914, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011101001001; b = 13'b1111111010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5914, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1111110011010; b = 13'b1001000111101; // Expected: {'sum': 4567, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1111110011010; b = 13'b1001000111101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4567, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100111001000; b = 13'b0110011111000; // Expected: {'sum': 5824, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100111001000; b = 13'b0110011111000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5824, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0110110001100; b = 13'b1000000000001; // Expected: {'sum': 7565, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0110110001100; b = 13'b1000000000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7565, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0010110110110; b = 13'b1001010010110; // Expected: {'sum': 6220, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0010110110110; b = 13'b1001010010110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0111001000011; b = 13'b0110101111011; // Expected: {'sum': 7102, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0111001000011; b = 13'b0110101111011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1100010010100; b = 13'b0100101001010; // Expected: {'sum': 478, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1100010010100; b = 13'b0100101001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 478, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001011100001; b = 13'b0001100011101; // Expected: {'sum': 1534, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001011100001; b = 13'b0001100011101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1534, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0001100100000; b = 13'b0111000110000; // Expected: {'sum': 4432, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0001100100000; b = 13'b0111000110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4432, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b1011101001100; b = 13'b1100110101000; // Expected: {'sum': 4340, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b1011101001100; b = 13'b1100110101000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4340, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101100110011; b = 13'b1000111100100; // Expected: {'sum': 7447, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101100110011; b = 13'b1000111100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7447, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101111000111; b = 13'b1011100110011; // Expected: {'sum': 762, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101111000111; b = 13'b1011100110011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 762, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0101000110111; b = 13'b1101101010001; // Expected: {'sum': 1416, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0101000110111; b = 13'b1101101010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1416, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0011101011101; b = 13'b1111001001010; // Expected: {'sum': 1447, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 13'b0011101011101; b = 13'b1111001001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1447, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0000101011100; b = 13'b0000010110110; // Expected: {'sum': 530, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0000101011100; b = 13'b0000010110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 530, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 13'b0100000111000; b = 13'b0011001011011; // Expected: {'sum': 3731, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 13'b0100000111000; b = 13'b0011001011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3731, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule

`timescale 1ns / 1ps

module tb_N25_kogge_stone_adder;

    // Parameters
    
    parameter N = 25;
    
     
    // Inputs
    
    reg  [24:0] a;
    
    reg  [24:0] b;
    
    
    // Outputs
    
    wire  [24:0] sum;
    
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
        
        a = 25'b0010010011001000010000100; b = 25'b1000111011111010100010111; // Expected: {'sum': 23561627, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0010010011001000010000100; b = 25'b1000111011111010100010111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23561627, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1111001100010100101000011; b = 25'b1001100001010011001011011; // Expected: {'sum': 18272158, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1111001100010100101000011; b = 25'b1001100001010011001011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 18272158, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1110110100111100101011111; b = 25'b0000110110011101110100111; // Expected: {'sum': 32879878, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b1110110100111100101011111; b = 25'b0000110110011101110100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 32879878, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1010101010011000100100001; b = 25'b0111100010110000100100111; // Expected: {'sum': 4624968, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1010101010011000100100001; b = 25'b0111100010110000100100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4624968, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1010101111110110011000101; b = 25'b0100010111000010101101000; // Expected: {'sum': 31683117, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b1010101111110110011000101; b = 25'b0100010111000010101101000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 31683117, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0110010111111010100000100; b = 25'b0100111011110010110100001; // Expected: {'sum': 23714469, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0110010111111010100000100; b = 25'b0100111011110010110100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23714469, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1101010111110111111110100; b = 25'b1110001000000010001001011; // Expected: {'sum': 24114239, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1101010111110111111110100; b = 25'b1110001000000010001001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24114239, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1101011000100101101010010; b = 25'b1011101000011101100110001; // Expected: {'sum': 18908803, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1101011000100101101010010; b = 25'b1011101000011101100110001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 18908803, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0101001000000010110110110; b = 25'b1011101111110110101110000; // Expected: {'sum': 1831718, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b0101001000000010110110110; b = 25'b1011101111110110101110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1831718, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1101000011011101101111100; b = 25'b0111010001001111101010001; // Expected: {'sum': 9067213, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1101000011011101101111100; b = 25'b0111010001001111101010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9067213, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0000100000111011001110001; b = 25'b1000000110011000010000010; // Expected: {'sum': 18065139, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0000100000111011001110001; b = 25'b1000000110011000010000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 18065139, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0110111000010100000110100; b = 25'b1101011111011101010010011; // Expected: {'sum': 9167559, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b0110111000010100000110100; b = 25'b1101011111011101010010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9167559, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0101100010100111100001000; b = 25'b1010010100001100110011000; // Expected: {'sum': 33253536, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0101100010100111100001000; b = 25'b1010010100001100110011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 33253536, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1101110011010110001010001; b = 25'b0000100010100000000010111; // Expected: {'sum': 30076008, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b1101110011010110001010001; b = 25'b0000100010100000000010111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30076008, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0001001111100010010001101; b = 25'b1011110011000111010100011; // Expected: {'sum': 27349808, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0001001111100010010001101; b = 25'b1011110011000111010100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 27349808, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1010100001000010001010000; b = 25'b0001100010111111011101100; // Expected: {'sum': 25297724, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b1010100001000010001010000; b = 25'b0001100010111111011101100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25297724, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1000000101101110011111111; b = 25'b0111111011101011101101011; // Expected: {'sum': 46186, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1000000101101110011111111; b = 25'b0111111011101011101101011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 46186, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1010010010100010010001110; b = 25'b1101001011010110101111001; // Expected: {'sum': 15659527, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1010010010100010010001110; b = 25'b1101001011010110101111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15659527, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1110010100000100110111001; b = 25'b0101101110011001101011101; // Expected: {'sum': 8469782, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1110010100000100110111001; b = 25'b0101101110011001101011101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8469782, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0011010111000100101101000; b = 25'b0001101110101111011010010; // Expected: {'sum': 10676282, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0011010111000100101101000; b = 25'b0001101110101111011010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10676282, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1111110100000010000001010; b = 25'b0010100001101100111110101; // Expected: {'sum': 4906495, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1111110100000010000001010; b = 25'b0010100001101100111110101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4906495, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1001001101011101001011100; b = 25'b0010111100001011101101001; // Expected: {'sum': 25481669, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b1001001101011101001011100; b = 25'b0010111100001011101101001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25481669, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1000111001001111011001000; b = 25'b0000100000000001110010011; // Expected: {'sum': 19702363, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b1000111001001111011001000; b = 25'b0000100000000001110010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 19702363, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0011111010100101110101101; b = 25'b0100010101010001110100000; // Expected: {'sum': 17297229, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0011111010100101110101101; b = 25'b0100010101010001110100000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 17297229, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0011000000001100010111110; b = 25'b1011001100000110000110111; // Expected: {'sum': 29762805, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0011000000001100010111110; b = 25'b1011001100000110000110111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29762805, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0100001100001100100100100; b = 25'b1111100111100010100111111; // Expected: {'sum': 7986787, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b0100001100001100100100100; b = 25'b1111100111100010100111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7986787, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1001001001110001010101110; b = 25'b0101101100110001100101010; // Expected: {'sum': 31147480, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b1001001001110001010101110; b = 25'b0101101100110001100101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 31147480, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1010100110110111000011100; b = 25'b1001001100110111000000110; // Expected: {'sum': 7986210, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1010100110110111000011100; b = 25'b1001001100110111000000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7986210, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0010110011100111111111111; b = 25'b1010100101011011110010100; // Expected: {'sum': 28084115, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0010110011100111111111111; b = 25'b1010100101011011110010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 28084115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0010100010100100011001001; b = 25'b1000101111010011000011110; // Expected: {'sum': 23654119, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 25'b0010100010100100011001001; b = 25'b1000101111010011000011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23654119, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1001011110111010001010011; b = 25'b0111000000110101011110100; // Expected: {'sum': 1040199, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1001011110111010001010011; b = 25'b0111000000110101011110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1040199, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b0000111001110001010111111; b = 25'b1111001111111011111100001; // Expected: {'sum': 318112, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b0000111001110001010111111; b = 25'b1111001111111011111100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 318112, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 25'b1000000010101111001010001; b = 25'b1111011101010010011101111; // Expected: {'sum': 15729472, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 25'b1000000010101111001010001; b = 25'b1111011101010010011101111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15729472, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
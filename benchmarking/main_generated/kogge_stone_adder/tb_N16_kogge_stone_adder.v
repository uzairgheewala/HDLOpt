
`timescale 1ns / 1ps

module tb_N16_kogge_stone_adder;

    // Parameters
    
    parameter N = 16;
    
     
    // Inputs
    
    reg  [15:0] a;
    
    reg  [15:0] b;
    
    
    // Outputs
    
    wire  [15:0] sum;
    
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
        
        a = 16'b1000011001101101; b = 16'b0110111111100000; // Expected: {'sum': 63053, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000011001101101; b = 16'b0110111111100000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 63053, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011011001110111; b = 16'b0101010101010101; // Expected: {'sum': 35788, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011011001110111; b = 16'b0101010101010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 35788, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1100001011101011; b = 16'b0001101110111101; // Expected: {'sum': 57000, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1100001011101011; b = 16'b0001101110111101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 57000, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011010000011101; b = 16'b1111110101100000; // Expected: {'sum': 12669, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011010000011101; b = 16'b1111110101100000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12669, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001101010010111; b = 16'b1001010001011011; // Expected: {'sum': 12018, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001101010010111; b = 16'b1001010001011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12018, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010111110000101; b = 16'b1111001000100101; // Expected: {'sum': 8618, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010111110000101; b = 16'b1111001000100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8618, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111001000100; b = 16'b1000001101011001; // Expected: {'sum': 37277, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111001000100; b = 16'b1000001101011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37277, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0010100110000101; b = 16'b1100100011000010; // Expected: {'sum': 62023, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0010100110000101; b = 16'b1100100011000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 62023, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111000001001111; b = 16'b0110010011000111; // Expected: {'sum': 54550, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111000001001111; b = 16'b0110010011000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54550, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101001110011101; b = 16'b0101011110000011; // Expected: {'sum': 11040, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101001110011101; b = 16'b0101011110000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11040, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110000100100001; b = 16'b0111001010010110; // Expected: {'sum': 54199, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110000100100001; b = 16'b0111001010010110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54199, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010001001010101; b = 16'b1101101010000011; // Expected: {'sum': 31960, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010001001010101; b = 16'b1101101010000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 31960, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0011100101100011; b = 16'b0100010110111001; // Expected: {'sum': 32540, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0011100101100011; b = 16'b0100010110111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 32540, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110010000101011; b = 16'b0001011000100010; // Expected: {'sum': 64077, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110010000101011; b = 16'b0001011000100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 64077, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000101011110111; b = 16'b1101100111101011; // Expected: {'sum': 25826, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000101011110111; b = 16'b1101100111101011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25826, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1101101101101101; b = 16'b0101110111000110; // Expected: {'sum': 14643, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1101101101101101; b = 16'b0101110111000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 14643, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1010010101010101; b = 16'b1111000111010101; // Expected: {'sum': 38698, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1010010101010101; b = 16'b1111000111010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 38698, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0101111011001111; b = 16'b0001011100111111; // Expected: {'sum': 30222, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0101111011001111; b = 16'b0001011100111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30222, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000111110011011; b = 16'b0001101010101110; // Expected: {'sum': 10825, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000111110011011; b = 16'b0001101010101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10825, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000010100011111; b = 16'b1000001111111001; // Expected: {'sum': 35096, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000010100011111; b = 16'b1000001111111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 35096, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111101111110001; b = 16'b1111001001100101; // Expected: {'sum': 28246, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111101111110001; b = 16'b1111001001100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 28246, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1110000000100000; b = 16'b0000111000000011; // Expected: {'sum': 60963, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b1110000000100000; b = 16'b0000111000000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 60963, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0110110010011001; b = 16'b0110101010010010; // Expected: {'sum': 55083, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0110110010011001; b = 16'b0110101010010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 55083, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1000111001010010; b = 16'b1101110110101100; // Expected: {'sum': 27646, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1000111001010010; b = 16'b1101110110101100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 27646, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000000000100011; b = 16'b1011011001100111; // Expected: {'sum': 46730, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000000000100011; b = 16'b1011011001100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 46730, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0111010011101111; b = 16'b1100100010000110; // Expected: {'sum': 15733, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b0111010011101111; b = 16'b1100100010000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15733, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100101100011010; b = 16'b1011001011011011; // Expected: {'sum': 65013, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100101100011010; b = 16'b1011001011011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 65013, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001101010100001; b = 16'b0000100100010100; // Expected: {'sum': 9141, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001101010100001; b = 16'b0000100100010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9141, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100000101010101; b = 16'b0110011001000111; // Expected: {'sum': 42908, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100000101010101; b = 16'b0110011001000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 42908, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0100111011100110; b = 16'b1001000010100110; // Expected: {'sum': 57228, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0100111011100110; b = 16'b1001000010100110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 57228, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b1001100001110110; b = 16'b1101011101011010; // Expected: {'sum': 28624, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 16'b1001100001110110; b = 16'b1101011101011010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 28624, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0001010011010111; b = 16'b0111001000101000; // Expected: {'sum': 34559, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0001010011010111; b = 16'b0111001000101000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 34559, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 16'b0000100100101101; b = 16'b0101001110101110; // Expected: {'sum': 23771, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 16'b0000100100101101; b = 16'b0101001110101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23771, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
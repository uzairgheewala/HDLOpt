
`timescale 1ns / 1ps

module tb_N19_kogge_stone_adder;

    // Parameters
    
    parameter N = 19;
    
     
    // Inputs
    
    reg  [18:0] a;
    
    reg  [18:0] b;
    
    
    // Outputs
    
    wire  [18:0] sum;
    
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
        
        a = 19'b1011100000000101111; b = 19'b0011001010100011101; // Expected: {'sum': 480588, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b1011100000000101111; b = 19'b0011001010100011101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 480588, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1010111111001111000; b = 19'b1011110011000000110; // Expected: {'sum': 222334, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1010111111001111000; b = 19'b1011110011000000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 222334, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1111001100110010100; b = 19'b1010100011000100100; // Expected: {'sum': 319416, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1111001100110010100; b = 19'b1010100011000100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 319416, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1011111010110000001; b = 19'b1001100111111111011; // Expected: {'sum': 181628, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1011111010110000001; b = 19'b1001100111111111011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 181628, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0111010010111111000; b = 19'b0001010101010001110; // Expected: {'sum': 282758, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0111010010111111000; b = 19'b0001010101010001110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 282758, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1001000011000100111; b = 19'b1110010100011010010; // Expected: {'sum': 241401, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1001000011000100111; b = 19'b1110010100011010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 241401, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1001011100001111100; b = 19'b1011100100010011010; // Expected: {'sum': 164118, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1001011100001111100; b = 19'b1011100100010011010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 164118, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1101011111110101101; b = 19'b0001111010011000010; // Expected: {'sum': 504943, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b1101011111110101101; b = 19'b0001111010011000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 504943, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1011110111111000011; b = 19'b1000001000111001000; // Expected: {'sum': 131467, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1011110111111000011; b = 19'b1000001000111001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 131467, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1001110011110010101; b = 19'b1111010111001101011; // Expected: {'sum': 300544, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1001110011110010101; b = 19'b1111010111001101011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 300544, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1100110100000001001; b = 19'b1010011110110000100; // Expected: {'sum': 238989, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1100110100000001001; b = 19'b1010011110110000100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 238989, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0000110010010110011; b = 19'b0111011110110011011; // Expected: {'sum': 270926, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0000110010010110011; b = 19'b0111011110110011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 270926, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1010100001111101000; b = 19'b0111010100011010110; // Expected: {'sum': 60606, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1010100001111101000; b = 19'b0111010100011010110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 60606, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1100100011001101000; b = 19'b1011001111101001001; // Expected: {'sum': 255409, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1100100011001101000; b = 19'b1011001111101001001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 255409, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1011000010000100110; b = 19'b1001100101110111010; // Expected: {'sum': 151520, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1011000010000100110; b = 19'b1001100101110111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 151520, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1100110001011000111; b = 19'b1110111001010000010; // Expected: {'sum': 382281, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1100110001011000111; b = 19'b1110111001010000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 382281, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0000110111110010001; b = 19'b0001111001011101101; // Expected: {'sum': 90750, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0000110111110010001; b = 19'b0001111001011101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 90750, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0101000011100000010; b = 19'b1001110000101011000; // Expected: {'sum': 485466, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0101000011100000010; b = 19'b1001110000101011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 485466, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0110011111010100100; b = 19'b1111111101000110100; // Expected: {'sum': 211160, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b0110011111010100100; b = 19'b1111111101000110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 211160, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0101111100101001010; b = 19'b0101101010011010100; // Expected: {'sum': 380446, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0101111100101001010; b = 19'b0101101010011010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 380446, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0001100010110001011; b = 19'b1001110001010100110; // Expected: {'sum': 370737, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0001100010110001011; b = 19'b1001110001010100110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 370737, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1000101110111100000; b = 19'b1110010101111100011; // Expected: {'sum': 231875, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1000101110111100000; b = 19'b1110010101111100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 231875, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1100100100100101101; b = 19'b1011110000011000010; // Expected: {'sum': 272879, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1100100100100101101; b = 19'b1011110000011000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 272879, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1101010111000110000; b = 19'b0001011001100011100; // Expected: {'sum': 483660, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b1101010111000110000; b = 19'b0001011001100011100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 483660, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0101111100111111101; b = 19'b1111101010110010111; // Expected: {'sum': 184212, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b0101111100111111101; b = 19'b1111101010110010111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 184212, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1100001000010000001; b = 19'b1110010001010100111; // Expected: {'sum': 340776, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1100001000010000001; b = 19'b1110010001010100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 340776, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b1100010000001000101; b = 19'b1100011110000001101; // Expected: {'sum': 285778, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b1100010000001000101; b = 19'b1100011110000001101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 285778, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0110100101000000000; b = 19'b0001010110010001011; // Expected: {'sum': 259723, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0110100101000000000; b = 19'b0001010110010001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 259723, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0100111011110101001; b = 19'b1010100111010111111; // Expected: {'sum': 509544, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0100111011110101001; b = 19'b1010100111010111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 509544, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0010111011000001100; b = 19'b1011000111111111011; // Expected: {'sum': 460295, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0010111011000001100; b = 19'b1011000111111111011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 460295, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0110101010110111010; b = 19'b0001000100000100100; // Expected: {'sum': 253406, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0110101010110111010; b = 19'b0001000100000100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 253406, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0001000111111100110; b = 19'b0110110001011110111; // Expected: {'sum': 258781, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 19'b0001000111111100110; b = 19'b0110110001011110111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 258781, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 19'b0111100011011011111; b = 19'b1100100101001111111; // Expected: {'sum': 135518, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 19'b0111100011011011111; b = 19'b1100100101001111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 135518, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
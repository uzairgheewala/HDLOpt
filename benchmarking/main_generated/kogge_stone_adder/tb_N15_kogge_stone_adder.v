
`timescale 1ns / 1ps

module tb_N15_kogge_stone_adder;

    // Parameters
    
    parameter N = 15;
    
     
    // Inputs
    
    reg  [14:0] a;
    
    reg  [14:0] b;
    
    
    // Outputs
    
    wire  [14:0] sum;
    
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
        
        a = 15'b100111101101110; b = 15'b010010101101111; // Expected: {'sum': 29917, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b100111101101110; b = 15'b010010101101111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29917, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000010000011111; b = 15'b101011001110111; // Expected: {'sum': 23190, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b000010000011111; b = 15'b101011001110111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23190, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011001111000101; b = 15'b101000100001001; // Expected: {'sum': 1230, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011001111000101; b = 15'b101000100001001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1230, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001010111011; b = 15'b111100000100001; // Expected: {'sum': 23260, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001010111011; b = 15'b111100000100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23260, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101110110100100; b = 15'b101001011101010; // Expected: {'sum': 12430, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101110110100100; b = 15'b101001011101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12430, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010010111000; b = 15'b000001111011001; // Expected: {'sum': 14481, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010010111000; b = 15'b000001111011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 14481, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011101111011; b = 15'b110001101111110; // Expected: {'sum': 11001, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011101111011; b = 15'b110001101111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11001, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b100011110000010; b = 15'b100000010100101; // Expected: {'sum': 2087, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b100011110000010; b = 15'b100000010100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2087, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110111100111101; b = 15'b010011110000100; // Expected: {'sum': 5825, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110111100111101; b = 15'b010011110000100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5825, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110000101100001; b = 15'b101110111010010; // Expected: {'sum': 16179, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110000101100001; b = 15'b101110111010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16179, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001101001001100; b = 15'b001110000110100; // Expected: {'sum': 13952, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001101001001100; b = 15'b001110000110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13952, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101100000011010; b = 15'b011010100011100; // Expected: {'sum': 3382, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b101100000011010; b = 15'b011010100011100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3382, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010110111001; b = 15'b101001111001011; // Expected: {'sum': 14724, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010110111001; b = 15'b101001111001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 14724, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101000010010001; b = 15'b010100000011101; // Expected: {'sum': 30894, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101000010010001; b = 15'b010100000011101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30894, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000110001100111; b = 15'b001111100010111; // Expected: {'sum': 11134, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b000110001100111; b = 15'b001111100010111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11134, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010110001100; b = 15'b010001100101000; // Expected: {'sum': 22708, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010110001100; b = 15'b010001100101000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 22708, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001001010001001; b = 15'b010100000100100; // Expected: {'sum': 15021, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b001001010001001; b = 15'b010100000100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15021, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101011101010; b = 15'b101100000000000; // Expected: {'sum': 21226, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101011101010; b = 15'b101100000000000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 21226, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110010111111000; b = 15'b001111100100010; // Expected: {'sum': 1306, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110010111111000; b = 15'b001111100100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1306, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110110000100110; b = 15'b000100010111100; // Expected: {'sum': 29922, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110110000100110; b = 15'b000100010111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29922, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110000000010101; b = 15'b000000011101100; // Expected: {'sum': 24833, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b110000000010101; b = 15'b000000011101100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24833, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b010101101000110; b = 15'b011100001111010; // Expected: {'sum': 25536, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b010101101000110; b = 15'b011100001111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25536, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011101111010011; b = 15'b011010110100101; // Expected: {'sum': 29048, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b011101111010011; b = 15'b011010110100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29048, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111001101010111; b = 15'b110001000010010; // Expected: {'sum': 21865, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b111001101010111; b = 15'b110001000010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 21865, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b011010001110111; b = 15'b101101001000101; // Expected: {'sum': 3772, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b011010001110111; b = 15'b101101001000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3772, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000100011000100; b = 15'b101011101010101; // Expected: {'sum': 24601, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b000100011000100; b = 15'b101011101010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24601, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b101101011000011; b = 15'b001100011101101; // Expected: {'sum': 29616, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b101101011000011; b = 15'b001100011101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29616, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b000000101010000; b = 15'b111110101101101; // Expected: {'sum': 32445, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 15'b000000101010000; b = 15'b111110101101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 32445, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111101111101110; b = 15'b110100010011110; // Expected: {'sum': 25740, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b111101111101110; b = 15'b110100010011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25740, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b110001011011000; b = 15'b111100001100110; // Expected: {'sum': 23358, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b110001011011000; b = 15'b111100001100110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23358, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111011010010111; b = 15'b010010101001010; // Expected: {'sum': 7137, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b111011010010111; b = 15'b010010101001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7137, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b001011110101101; b = 15'b110110001011100; // Expected: {'sum': 1033, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b001011110101101; b = 15'b110110001011100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1033, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 15'b111011001111011; b = 15'b011001111110110; // Expected: {'sum': 10865, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 15'b111011001111011; b = 15'b011001111110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10865, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
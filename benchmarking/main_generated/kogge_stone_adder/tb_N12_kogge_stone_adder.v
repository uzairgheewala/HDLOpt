
`timescale 1ns / 1ps

module tb_N12_kogge_stone_adder;

    // Parameters
    
    parameter N = 12;
    
     
    // Inputs
    
    reg  [11:0] a;
    
    reg  [11:0] b;
    
    
    // Outputs
    
    wire  [11:0] sum;
    
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
        
        a = 12'b010001011010; b = 12'b100011000001; // Expected: {'sum': 3355, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001011010; b = 12'b100011000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3355, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011010001; b = 12'b110010011011; // Expected: {'sum': 3948, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011010001; b = 12'b110010011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3948, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010111001001; b = 12'b110001010011; // Expected: {'sum': 540, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010111001001; b = 12'b110001010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 540, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110011010000; b = 12'b011101111001; // Expected: {'sum': 1097, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110011010000; b = 12'b011101111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1097, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001101011111; b = 12'b111111101000; // Expected: {'sum': 839, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b001101011111; b = 12'b111111101000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 839, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100010010; b = 12'b100000010011; // Expected: {'sum': 1829, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100010010; b = 12'b100000010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1829, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000101110010; b = 12'b011100111111; // Expected: {'sum': 2225, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b000101110010; b = 12'b011100111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2225, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101000010011; b = 12'b111101111110; // Expected: {'sum': 2449, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101000010011; b = 12'b111101111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2449, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100101011011; b = 12'b001001110011; // Expected: {'sum': 3022, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100101011011; b = 12'b001001110011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3022, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011111100000; b = 12'b011101000110; // Expected: {'sum': 3878, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011111100000; b = 12'b011101000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3878, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100011110; b = 12'b001000011100; // Expected: {'sum': 314, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100011110; b = 12'b001000011100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 314, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101100011111; b = 12'b000010000011; // Expected: {'sum': 2978, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b101100011111; b = 12'b000010000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2978, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101001100001; b = 12'b101011111001; // Expected: {'sum': 1370, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101001100001; b = 12'b101011111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1370, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b101000011011; b = 12'b100000101001; // Expected: {'sum': 580, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b101000011011; b = 12'b100000101001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 580, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001000111; b = 12'b111100111001; // Expected: {'sum': 896, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001000111; b = 12'b111100111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 896, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111110011001; b = 12'b011010111100; // Expected: {'sum': 1621, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111110011001; b = 12'b011010111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1621, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000010001; b = 12'b001000001000; // Expected: {'sum': 3609, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000010001; b = 12'b001000001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3609, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011101100100; b = 12'b000111001110; // Expected: {'sum': 2354, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b011101100100; b = 12'b000111001110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2354, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110011010010; b = 12'b111001001010; // Expected: {'sum': 2844, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110011010010; b = 12'b111001001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2844, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b110000011110; b = 12'b010100100101; // Expected: {'sum': 323, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b110000011110; b = 12'b010100100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 323, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011000111000; b = 12'b110111011100; // Expected: {'sum': 1044, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011000111000; b = 12'b110111011100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1044, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b111100000011; b = 12'b011010111010; // Expected: {'sum': 1469, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b111100000011; b = 12'b011010111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1469, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010001001011; b = 12'b101011111111; // Expected: {'sum': 3914, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b010001001011; b = 12'b101011111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3914, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011110011010; b = 12'b111000000011; // Expected: {'sum': 1437, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011110011010; b = 12'b111000000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1437, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b100011000101; b = 12'b000001111100; // Expected: {'sum': 2369, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b100011000101; b = 12'b000001111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2369, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010000000100; b = 12'b110101110000; // Expected: {'sum': 372, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010000000100; b = 12'b110101110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 372, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000010000011; b = 12'b110010111110; // Expected: {'sum': 3393, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b000010000011; b = 12'b110010111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3393, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011001001111; b = 12'b101010001000; // Expected: {'sum': 215, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011001001111; b = 12'b101010001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 215, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b011111000010; b = 12'b111101100011; // Expected: {'sum': 1829, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b011111000010; b = 12'b111101100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1829, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001011010000; b = 12'b011000010010; // Expected: {'sum': 2274, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001011010000; b = 12'b011000010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2274, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b001110110100; b = 12'b000011100100; // Expected: {'sum': 1176, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b001110110100; b = 12'b000011100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1176, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b010010111001; b = 12'b110000011010; // Expected: {'sum': 211, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 12'b010010111001; b = 12'b110000011010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 211, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 12'b000000110110; b = 12'b001111000110; // Expected: {'sum': 1020, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 12'b000000110110; b = 12'b001111000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1020, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
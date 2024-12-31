
`timescale 1ns / 1ps

module tb_N22_kogge_stone_adder;

    // Parameters
    
    parameter N = 22;
    
     
    // Inputs
    
    reg  [21:0] a;
    
    reg  [21:0] b;
    
    
    // Outputs
    
    wire  [21:0] sum;
    
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
        
        a = 22'b1000101001011010000100; b = 22'b1011001011111001111001; // Expected: {'sum': 1004797, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1000101001011010000100; b = 22'b1011001011111001111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1004797, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0011111000000101001000; b = 22'b1100111000111011110110; // Expected: {'sum': 200766, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b0011111000000101001000; b = 22'b1100111000111011110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 200766, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0001100001000111010110; b = 22'b0000110011011011000101; // Expected: {'sum': 608411, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0001100001000111010110; b = 22'b0000110011011011000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 608411, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1001110111100010001110; b = 22'b1111110011110100101010; // Expected: {'sum': 2536888, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1001110111100010001110; b = 22'b1111110011110100101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2536888, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0011100110101000101100; b = 22'b0001010001100010100101; // Expected: {'sum': 1278673, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0011100110101000101100; b = 22'b0001010001100010100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1278673, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0010110101110011110000; b = 22'b1101101111101011001000; // Expected: {'sum': 153528, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b0010110101110011110000; b = 22'b1101101111101011001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 153528, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0010000010101010100111; b = 22'b0010111000100000101111; // Expected: {'sum': 1290966, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0010000010101010100111; b = 22'b0010111000100000101111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1290966, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0000110111111001011111; b = 22'b0111100011101111001010; // Expected: {'sum': 2210345, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0000110111111001011111; b = 22'b0111100011101111001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2210345, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0110101111110110100100; b = 22'b1000111010101110110010; // Expected: {'sum': 4106582, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0110101111110110100100; b = 22'b1000111010101110110010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4106582, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0100001000011101010101; b = 22'b1010111110001010111010; // Expected: {'sum': 3959311, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0100001000011101010101; b = 22'b1010111110001010111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3959311, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1000001111100100011110; b = 22'b1111000100001111101100; // Expected: {'sum': 1916170, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1000001111100100011110; b = 22'b1111000100001111101100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1916170, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1110100100100000111101; b = 22'b0001011010110101010110; // Expected: {'sum': 4191635, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b1110100100100000111101; b = 22'b0001011010110101010110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4191635, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0110000001100111001110; b = 22'b0000000111000001011111; // Expected: {'sum': 1608237, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0110000001100111001110; b = 22'b0000000111000001011111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1608237, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0000100001001010000100; b = 22'b1101111110100100000010; // Expected: {'sum': 3799942, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0000100001001010000100; b = 22'b1101111110100100000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3799942, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1101010000110111110000; b = 22'b1001011110011011010110; // Expected: {'sum': 1766598, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1101010000110111110000; b = 22'b1001011110011011010110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1766598, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1101101110110011111010; b = 22'b1011011111010010100100; // Expected: {'sum': 2417054, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1101101110110011111010; b = 22'b1011011111010010100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2417054, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0100110101110110100110; b = 22'b0000100001100001101010; // Expected: {'sum': 1406480, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0100110101110110100110; b = 22'b0000100001100001101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1406480, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0111101111100011001000; b = 22'b1000111100000000100000; // Expected: {'sum': 178408, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b0111101111100011001000; b = 22'b1000111100000000100000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 178408, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1110100000111101011111; b = 22'b1000010100101110110100; // Expected: {'sum': 1792787, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1110100000111101011111; b = 22'b1000010100101110110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1792787, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0011010101110010001111; b = 22'b0010101111110100001001; // Expected: {'sum': 1595800, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0011010101110010001111; b = 22'b0010101111110100001001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1595800, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1000101100010110000100; b = 22'b1111101101001011001000; // Expected: {'sum': 2201676, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1000101100010110000100; b = 22'b1111101101001011001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2201676, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1100000110011000110001; b = 22'b0000000011000000010101; // Expected: {'sum': 3184198, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b1100000110011000110001; b = 22'b0000000011000000010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3184198, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0001110001101000100101; b = 22'b0101011111000010001000; // Expected: {'sum': 1903277, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0001110001101000100101; b = 22'b0101011111000010001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1903277, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0111110100010001101000; b = 22'b1010010011110110000001; // Expected: {'sum': 557545, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b0111110100010001101000; b = 22'b1010010011110110000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 557545, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0100110101111000011001; b = 22'b1101000101000011101110; // Expected: {'sum': 503559, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b0100110101111000011001; b = 22'b1101000101000011101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 503559, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1000011000001011001111; b = 22'b1011101010001111000011; // Expected: {'sum': 1058450, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1000011000001011001111; b = 22'b1011101010001111000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1058450, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1101001000011010010101; b = 22'b1011010110010110000001; // Expected: {'sum': 2223126, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1101001000011010010101; b = 22'b1011010110010110000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2223126, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0010100000010001100001; b = 22'b1001100000101011000111; // Expected: {'sum': 3149608, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0010100000010001100001; b = 22'b1001100000101011000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3149608, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0001110100000010001110; b = 22'b0110010010111001001000; // Expected: {'sum': 2125526, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0001110100000010001110; b = 22'b0110010010111001001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2125526, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0110000000110110101110; b = 22'b0010010000000111010010; // Expected: {'sum': 2166656, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0110000000110110101110; b = 22'b0010010000000111010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2166656, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b0110000011110001111010; b = 22'b0111011011000110111000; // Expected: {'sum': 3534386, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b0110000011110001111010; b = 22'b0111011011000110111000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3534386, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1100011011100110001110; b = 22'b0010010111100000100010; // Expected: {'sum': 3879344, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 22'b1100011011100110001110; b = 22'b0010010111100000100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3879344, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 22'b1100111011000110010101; b = 22'b1110000010101001001110; // Expected: {'sum': 2874339, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 22'b1100111011000110010101; b = 22'b1110000010101001001110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2874339, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule

`timescale 1ns / 1ps

module tb_N18_kogge_stone_adder;

    // Parameters
    
    parameter N = 18;
    
     
    // Inputs
    
    reg  [17:0] a;
    
    reg  [17:0] b;
    
    
    // Outputs
    
    wire  [17:0] sum;
    
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
        
        a = 18'b110011011011101011; b = 18'b110001010110000100; // Expected: {'sum': 150639, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b110011011011101011; b = 18'b110001010110000100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 150639, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b101100001001000001; b = 18'b011010110101110001; // Expected: {'sum': 28594, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b101100001001000001; b = 18'b011010110101110001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 28594, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b110000110001110100; b = 18'b011001111011000111; // Expected: {'sum': 43835, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b110000110001110100; b = 18'b011001111011000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 43835, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b111000001100101001; b = 18'b010100101001011000; // Expected: {'sum': 52609, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b111000001100101001; b = 18'b010100101001011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 52609, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b111101010110001110; b = 18'b101101000100100100; // Expected: {'sum': 173746, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b111101010110001110; b = 18'b101101000100100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 173746, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b111110000110101010; b = 18'b100111010000000000; // Expected: {'sum': 153002, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b111110000110101010; b = 18'b100111010000000000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 153002, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b011001110111001011; b = 18'b101111010000101111; // Expected: {'sum': 37370, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b011001110111001011; b = 18'b101111010000101111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37370, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b100000011000100101; b = 18'b101000100010111100; // Expected: {'sum': 36577, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b100000011000100101; b = 18'b101000100010111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 36577, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b010111110111011010; b = 18'b100001011011010011; // Expected: {'sum': 234669, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b010111110111011010; b = 18'b100001011011010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 234669, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b110111000011101101; b = 18'b010110010011111001; // Expected: {'sum': 54758, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b110111000011101101; b = 18'b010110010011111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54758, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b011011100101000111; b = 18'b100010111010011111; // Expected: {'sum': 255974, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b011011100101000111; b = 18'b100010111010011111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 255974, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b110000001100111001; b = 18'b010010001101000011; // Expected: {'sum': 9852, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b110000001100111001; b = 18'b010010001101000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9852, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b001000010010011100; b = 18'b101100101111100010; // Expected: {'sum': 217214, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b001000010010011100; b = 18'b101100101111100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 217214, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b010111100101000100; b = 18'b101010010100110000; // Expected: {'sum': 7796, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b010111100101000100; b = 18'b101010010100110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7796, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b100001011000000001; b = 18'b100010101010110110; // Expected: {'sum': 16567, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b100001011000000001; b = 18'b100010101010110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16567, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b110001001110110010; b = 18'b000101111101101001; // Expected: {'sum': 226075, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b110001001110110010; b = 18'b000101111101101001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 226075, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b010100101101111001; b = 18'b011010000000001010; // Expected: {'sum': 191363, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b010100101101111001; b = 18'b011010000000001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 191363, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b011001011011101111; b = 18'b111111001101111011; // Expected: {'sum': 100970, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b011001011011101111; b = 18'b111111001101111011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 100970, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b001110011011101010; b = 18'b000111110010110001; // Expected: {'sum': 91035, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b001110011011101010; b = 18'b000111110010110001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 91035, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b101110111001111100; b = 18'b100011111010011111; // Expected: {'sum': 77083, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b101110111001111100; b = 18'b100011111010011111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 77083, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b111010000100010000; b = 18'b111100101101000010; // Expected: {'sum': 224338, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b111010000100010000; b = 18'b111100101101000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 224338, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b000000111010110011; b = 18'b001110010111011110; // Expected: {'sum': 62609, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b000000111010110011; b = 18'b001110010111011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 62609, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b110010100010011110; b = 18'b100011011101110110; // Expected: {'sum': 90132, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b110010100010011110; b = 18'b100011011101110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 90132, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b011111010101110100; b = 18'b000010100000110011; // Expected: {'sum': 138663, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b011111010101110100; b = 18'b000010100000110011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 138663, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b000000101000001111; b = 18'b101000101010100111; // Expected: {'sum': 169142, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b000000101000001111; b = 18'b101000101010100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 169142, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b101001101110000110; b = 18'b110101001101001011; // Expected: {'sum': 126673, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b101001101110000110; b = 18'b110101001101001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 126673, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b000011010101010000; b = 18'b000000110111110000; // Expected: {'sum': 17216, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b000011010101010000; b = 18'b000000110111110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 17216, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b101011100101011100; b = 18'b110101001010000101; // Expected: {'sum': 134113, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b101011100101011100; b = 18'b110101001010000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 134113, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b001111101010010110; b = 18'b011001110010100101; // Expected: {'sum': 169787, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b001111101010010110; b = 18'b011001110010100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 169787, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b000001101010111011; b = 18'b001011011001110110; // Expected: {'sum': 53553, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b000001101010111011; b = 18'b001011011001110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 53553, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b011100010010101100; b = 18'b000011100111101101; // Expected: {'sum': 130713, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b011100010010101100; b = 18'b000011100111101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 130713, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b010100010011100001; b = 18'b101000111000100101; // Expected: {'sum': 250630, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 18'b010100010011100001; b = 18'b101000111000100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 250630, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 18'b110100110000101001; b = 18'b110100010100011001; // Expected: {'sum': 168258, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 18'b110100110000101001; b = 18'b110100010100011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 168258, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
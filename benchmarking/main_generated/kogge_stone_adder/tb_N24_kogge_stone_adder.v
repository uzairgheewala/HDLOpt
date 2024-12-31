
`timescale 1ns / 1ps

module tb_N24_kogge_stone_adder;

    // Parameters
    
    parameter N = 24;
    
     
    // Inputs
    
    reg  [23:0] a;
    
    reg  [23:0] b;
    
    
    // Outputs
    
    wire  [23:0] sum;
    
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
        
        a = 24'b000011100110000101011001; b = 24'b011001000100111101111100; // Expected: {'sum': 7516373, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b000011100110000101011001; b = 24'b011001000100111101111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7516373, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b000111010111010110110101; b = 24'b000010101101101010101001; // Expected: {'sum': 2642014, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b000111010111010110110101; b = 24'b000010101101101010101001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2642014, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b100110110010110000101101; b = 24'b100001010100001110110010; // Expected: {'sum': 2125791, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b100110110010110000101101; b = 24'b100001010100001110110010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2125791, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b111101001110100100111000; b = 24'b110000010100011111100100; // Expected: {'sum': 11940124, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b111101001110100100111000; b = 24'b110000010100011111100100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11940124, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b010111010110101101100111; b = 24'b011100101011000011000111; // Expected: {'sum': 13638702, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b010111010110101101100111; b = 24'b011100101011000011000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13638702, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b001011111100001010101110; b = 24'b011010010101010000010101; // Expected: {'sum': 10032835, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b001011111100001010101110; b = 24'b011010010101010000010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10032835, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b101011111111011010010101; b = 24'b001110010101001110001011; // Expected: {'sum': 15288864, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b101011111111011010010101; b = 24'b001110010101001110001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15288864, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b001001100110011100101011; b = 24'b101101100011000010110011; // Expected: {'sum': 14456798, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b001001100110011100101011; b = 24'b101101100011000010110011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 14456798, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b001100001111101001001111; b = 24'b010000010111101111100001; // Expected: {'sum': 7501360, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b001100001111101001001111; b = 24'b010000010111101111100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7501360, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b101001111110111000000001; b = 24'b010100111001000111111010; // Expected: {'sum': 16482299, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b101001111110111000000001; b = 24'b010100111001000111111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16482299, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b011000100101100111101101; b = 24'b011011011111110011111110; // Expected: {'sum': 13653739, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b011000100101100111101101; b = 24'b011011011111110011111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13653739, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b010001101000010010001010; b = 24'b000111010000001000110101; // Expected: {'sum': 6522559, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b010001101000010010001010; b = 24'b000111010000001000110101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6522559, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b011110010011110001110011; b = 24'b110001011010111110111001; // Expected: {'sum': 4123692, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b011110010011110001110011; b = 24'b110001011010111110111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4123692, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b110111011000110101101100; b = 24'b100001001111110000010111; // Expected: {'sum': 6457731, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b110111011000110101101100; b = 24'b100001001111110000010111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6457731, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b011100011100011011110001; b = 24'b001000000100001101000000; // Expected: {'sum': 9570865, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b011100011100011011110001; b = 24'b001000000100001101000000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9570865, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b000100001011000011000011; b = 24'b011110000111110100111100; // Expected: {'sum': 8990207, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b000100001011000011000011; b = 24'b011110000111110100111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8990207, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b000001000111110000000100; b = 24'b010000010110101111101010; // Expected: {'sum': 4581358, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b000001000111110000000100; b = 24'b010000010110101111101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4581358, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b101100101011000110011100; b = 24'b011011000001101101011011; // Expected: {'sum': 2018551, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b101100101011000110011100; b = 24'b011011000001101101011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2018551, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b100101010001110101111110; b = 24'b110100010111000100001111; // Expected: {'sum': 6721165, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b100101010001110101111110; b = 24'b110100010111000100001111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6721165, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b010010110000011011111101; b = 24'b000101011011000111111110; // Expected: {'sum': 6338811, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b010010110000011011111101; b = 24'b000101011011000111111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6338811, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b101110111111100110110110; b = 24'b111011000100001011110111; // Expected: {'sum': 11025581, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b101110111111100110110110; b = 24'b111011000100001011110111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11025581, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b000101000011001011101101; b = 24'b010111110000111101010011; // Expected: {'sum': 7553600, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b000101000011001011101101; b = 24'b010111110000111101010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7553600, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b010001000111011110001111; b = 24'b101100001110101100100111; // Expected: {'sum': 16081590, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b010001000111011110001111; b = 24'b101100001110101100100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16081590, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b110000010111100010100000; b = 24'b110001010101111100010010; // Expected: {'sum': 8837042, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b110000010111100010100000; b = 24'b110001010101111100010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8837042, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b011100001001100001110001; b = 24'b001011101011111001101010; // Expected: {'sum': 10442459, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b011100001001100001110001; b = 24'b001011101011111001101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10442459, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b101000110010010111000111; b = 24'b010010111001010101010011; // Expected: {'sum': 15645466, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b101000110010010111000111; b = 24'b010010111001010101010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15645466, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b100000100111101100101110; b = 24'b110000000110110001001011; // Expected: {'sum': 4384633, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b100000100111101100101110; b = 24'b110000000110110001001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4384633, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b011101001001110110010011; b = 24'b010010001101001101011110; // Expected: {'sum': 12415217, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b011101001001110110010011; b = 24'b010010001101001101011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12415217, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b101011101011111110010000; b = 24'b000100011110100100110001; // Expected: {'sum': 12626113, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b101011101011111110010000; b = 24'b000100011110100100110001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12626113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b010111000100000110010001; b = 24'b001101110000010010010011; // Expected: {'sum': 9651748, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b010111000100000110010001; b = 24'b001101110000010010010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9651748, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b001000010011001010011110; b = 24'b011010000000011010011001; // Expected: {'sum': 8993079, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 24'b001000010011001010011110; b = 24'b011010000000011010011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8993079, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b111101010101010011011000; b = 24'b110010101001001101100110; // Expected: {'sum': 12576830, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b111101010101010011011000; b = 24'b110010101001001101100110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12576830, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 24'b100001001100111011000100; b = 24'b111011010101010111010010; // Expected: {'sum': 7480470, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 24'b100001001100111011000100; b = 24'b111011010101010111010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7480470, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule

`timescale 1ns / 1ps

module tb_N32_kogge_stone_adder;

    // Parameters
    
    parameter N = 32;
    
     
    // Inputs
    
    reg  [31:0] a;
    
    reg  [31:0] b;
    
    
    // Outputs
    
    wire  [31:0] sum;
    
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
        
        a = 32'b00000000000000000101001000100111; b = 32'b00000000000000001101111101100010; // Expected: {'sum': 78217, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000101001000100111; b = 32'b00000000000000001101111101100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 78217, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001001111010011011; b = 32'b00000000000000001000001101010001; // Expected: {'sum': 74220, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001001111010011011; b = 32'b00000000000000001000001101010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 74220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000101100110010111; b = 32'b00000000000000001100110001000001; // Expected: {'sum': 75224, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000101100110010111; b = 32'b00000000000000001100110001000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 75224, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001110011111110001; b = 32'b00000000000000000011100100100001; // Expected: {'sum': 74002, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001110011111110001; b = 32'b00000000000000000011100100100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 74002, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001001111010000111; b = 32'b00000000000000001101000001100001; // Expected: {'sum': 93928, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001001111010000111; b = 32'b00000000000000001101000001100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 93928, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000100011001011000; b = 32'b00000000000000000010010101100011; // Expected: {'sum': 27579, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000100011001011000; b = 32'b00000000000000000010010101100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 27579, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001001100101100101; b = 32'b00000000000000000011011000100110; // Expected: {'sum': 53131, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001001100101100101; b = 32'b00000000000000000011011000100110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 53131, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000100010000010001; b = 32'b00000000000000000101100100001101; // Expected: {'sum': 40222, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000100010000010001; b = 32'b00000000000000000101100100001101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 40222, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001110101110110100; b = 32'b00000000000000000110011100000111; // Expected: {'sum': 86715, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001110101110110100; b = 32'b00000000000000000110011100000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 86715, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001111010000010100; b = 32'b00000000000000001111000110100010; // Expected: {'sum': 124342, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001111010000010100; b = 32'b00000000000000001111000110100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 124342, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001100010011010001; b = 32'b00000000000000001111110101110110; // Expected: {'sum': 115271, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001100010011010001; b = 32'b00000000000000001111110101110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 115271, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000110100111110100; b = 32'b00000000000000000010100001111000; // Expected: {'sum': 37484, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000110100111110100; b = 32'b00000000000000000010100001111000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37484, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000101010011111101; b = 32'b00000000000000001101011000010011; // Expected: {'sum': 76560, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000101010011111101; b = 32'b00000000000000001101011000010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 76560, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000000011001000100; b = 32'b00000000000000001000001001110100; // Expected: {'sum': 35000, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000000011001000100; b = 32'b00000000000000001000001001110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 35000, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000100001010101100; b = 32'b00000000000000000010101000000111; // Expected: {'sum': 27827, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000100001010101100; b = 32'b00000000000000000010101000000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 27827, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001111100000001110; b = 32'b00000000000000000111101000101110; // Expected: {'sum': 94780, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001111100000001110; b = 32'b00000000000000000111101000101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 94780, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000000011100100011; b = 32'b00000000000000001111100011001100; // Expected: {'sum': 65519, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000000011100100011; b = 32'b00000000000000001111100011001100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 65519, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000110100011011100; b = 32'b00000000000000000000000111111101; // Expected: {'sum': 27353, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000110100011011100; b = 32'b00000000000000000000000111111101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 27353, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001001010011101001; b = 32'b00000000000000000011101100010111; // Expected: {'sum': 53248, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001001010011101001; b = 32'b00000000000000000011101100010111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 53248, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000001100101100011; b = 32'b00000000000000001000100101100110; // Expected: {'sum': 41673, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000001100101100011; b = 32'b00000000000000001000100101100110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 41673, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000101001001101100; b = 32'b00000000000000000001010111001101; // Expected: {'sum': 26681, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000101001001101100; b = 32'b00000000000000000001010111001101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 26681, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000011100110001000; b = 32'b00000000000000001111011000010101; // Expected: {'sum': 77725, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000011100110001000; b = 32'b00000000000000001111011000010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 77725, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001101101011110110; b = 32'b00000000000000001100100011011111; // Expected: {'sum': 107477, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001101101011110110; b = 32'b00000000000000001100100011011111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 107477, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000001011001100011; b = 32'b00000000000000000110111101111010; // Expected: {'sum': 34269, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000001011001100011; b = 32'b00000000000000000110111101111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 34269, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000100111001110011; b = 32'b00000000000000000100111111011010; // Expected: {'sum': 40525, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000100111001110011; b = 32'b00000000000000000100111111011010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 40525, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000100011111111111; b = 32'b00000000000000001001010110101101; // Expected: {'sum': 56748, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000100011111111111; b = 32'b00000000000000001001010110101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 56748, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001110011111011100; b = 32'b00000000000000001000000011101100; // Expected: {'sum': 92360, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001110011111011100; b = 32'b00000000000000001000000011101100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 92360, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001011100111010001; b = 32'b00000000000000000010110010010011; // Expected: {'sum': 58980, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001011100111010001; b = 32'b00000000000000000010110010010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 58980, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001110011000101001; b = 32'b00000000000000001111110101010111; // Expected: {'sum': 123776, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001110011000101001; b = 32'b00000000000000001111110101010111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 123776, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001111110100111100; b = 32'b00000000000000000101100100000011; // Expected: {'sum': 87615, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001111110100111100; b = 32'b00000000000000000101100100000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 87615, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000000001101010100100; b = 32'b00000000000000001110100110110110; // Expected: {'sum': 66650, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000000001101010100100; b = 32'b00000000000000001110100110110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 66650, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001100101011100101; b = 32'b00000000000000000000100010111100; // Expected: {'sum': 54177, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001100101011100101; b = 32'b00000000000000000000100010111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54177, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 32'b00000000000000001111011100110100; b = 32'b00000000000000001000010100001100; // Expected: {'sum': 97344, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 32'b00000000000000001111011100110100; b = 32'b00000000000000001000010100001100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 97344, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
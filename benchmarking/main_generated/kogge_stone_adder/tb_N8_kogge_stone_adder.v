
`timescale 1ns / 1ps

module tb_N8_kogge_stone_adder;

    // Parameters
    
    parameter N = 8;
    
     
    // Inputs
    
    reg  [7:0] a;
    
    reg  [7:0] b;
    
    
    // Outputs
    
    wire  [7:0] sum;
    
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
        
        a = 8'b01001000; b = 8'b00010010; // Expected: {'sum': 90, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001000; b = 8'b00010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 90, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011001; b = 8'b01000011; // Expected: {'sum': 220, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011001; b = 8'b01000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010001; b = 8'b00011100; // Expected: {'sum': 173, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010001; b = 8'b00011100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 173, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000100; b = 8'b11010001; // Expected: {'sum': 85, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000100; b = 8'b11010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 85, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010111; b = 8'b00010110; // Expected: {'sum': 45, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010111; b = 8'b00010110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 45, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001001; b = 8'b01110110; // Expected: {'sum': 127, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001001; b = 8'b01110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 127, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101001; b = 8'b00000111; // Expected: {'sum': 48, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101001; b = 8'b00000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 48, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011000; b = 8'b10100111; // Expected: {'sum': 127, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011000; b = 8'b10100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 127, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110110; b = 8'b10110111; // Expected: {'sum': 45, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110110; b = 8'b10110111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 45, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010100; b = 8'b00100101; // Expected: {'sum': 185, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010100; b = 8'b00100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 185, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000111; b = 8'b01110100; // Expected: {'sum': 187, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000111; b = 8'b01110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 187, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000001; b = 8'b00000100; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000001; b = 8'b00000100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100100; b = 8'b01110110; // Expected: {'sum': 26, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100100; b = 8'b01110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 26, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010000; b = 8'b01111001; // Expected: {'sum': 201, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010000; b = 8'b01111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 201, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001011; b = 8'b00110000; // Expected: {'sum': 187, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001011; b = 8'b00110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 187, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001001; b = 8'b01010011; // Expected: {'sum': 220, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001001; b = 8'b01010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100101; b = 8'b10001110; // Expected: {'sum': 51, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100101; b = 8'b10001110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 51, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101100; b = 8'b01111011; // Expected: {'sum': 231, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101100; b = 8'b01111011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 231, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110110; b = 8'b10110010; // Expected: {'sum': 232, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110110; b = 8'b10110010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 232, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011001; b = 8'b00000001; // Expected: {'sum': 154, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011001; b = 8'b00000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 154, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110000; b = 8'b00111100; // Expected: {'sum': 44, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110000; b = 8'b00111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 44, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011000; b = 8'b00101010; // Expected: {'sum': 130, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011000; b = 8'b00101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 130, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010001; b = 8'b00110011; // Expected: {'sum': 68, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010001; b = 8'b00110011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010010; b = 8'b11110011; // Expected: {'sum': 69, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010010; b = 8'b11110011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 69, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000110; b = 8'b01010101; // Expected: {'sum': 27, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000110; b = 8'b01010101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 27, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010111; b = 8'b11111111; // Expected: {'sum': 86, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010111; b = 8'b11111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110000; b = 8'b11110000; // Expected: {'sum': 96, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110000; b = 8'b11110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 96, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101010; b = 8'b10101011; // Expected: {'sum': 213, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101010; b = 8'b10101011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 213, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001011; b = 8'b10111000; // Expected: {'sum': 131, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001011; b = 8'b10111000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 131, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101001; b = 8'b11110100; // Expected: {'sum': 93, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101001; b = 8'b11110100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100110; b = 8'b01110110; // Expected: {'sum': 156, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100110; b = 8'b01110110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 156, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100101; b = 8'b10011110; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100101; b = 8'b10011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010100; b = 8'b11111011; // Expected: {'sum': 79, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010100; b = 8'b11111011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 79, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
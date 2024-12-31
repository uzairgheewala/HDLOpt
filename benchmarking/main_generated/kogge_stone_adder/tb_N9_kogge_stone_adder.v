
`timescale 1ns / 1ps

module tb_N9_kogge_stone_adder;

    // Parameters
    
    parameter N = 9;
    
     
    // Inputs
    
    reg  [8:0] a;
    
    reg  [8:0] b;
    
    
    // Outputs
    
    wire  [8:0] sum;
    
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
        
        a = 9'b111100100; b = 9'b010001011; // Expected: {'sum': 111, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100100; b = 9'b010001011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 111, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100001011; b = 9'b011111000; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100001011; b = 9'b011111000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010110010; b = 9'b001010000; // Expected: {'sum': 258, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b010110010; b = 9'b001010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 258, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110000100; b = 9'b001000100; // Expected: {'sum': 456, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b110000100; b = 9'b001000100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 456, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110101111; b = 9'b111000101; // Expected: {'sum': 372, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110101111; b = 9'b111000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 372, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101001001; b = 9'b101110001; // Expected: {'sum': 186, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b101001001; b = 9'b101110001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 186, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100101110; b = 9'b101010111; // Expected: {'sum': 133, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100101110; b = 9'b101010111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 133, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100001010; b = 9'b011100011; // Expected: {'sum': 493, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100001010; b = 9'b011100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 493, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111000100; b = 9'b011011010; // Expected: {'sum': 158, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111000100; b = 9'b011011010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 158, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b101000000; b = 9'b010010001; // Expected: {'sum': 465, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b101000000; b = 9'b010010001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 465, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b110111100; b = 9'b101010010; // Expected: {'sum': 270, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b110111100; b = 9'b101010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 270, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110001; b = 9'b110100001; // Expected: {'sum': 146, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110001; b = 9'b110100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 146, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111001; b = 9'b101000010; // Expected: {'sum': 315, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111001; b = 9'b101000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 315, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000101000; b = 9'b110011000; // Expected: {'sum': 448, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b000101000; b = 9'b110011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 448, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010001; b = 9'b000011000; // Expected: {'sum': 41, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010001; b = 9'b000011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011110011; b = 9'b001010000; // Expected: {'sum': 323, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011110011; b = 9'b001010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 323, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100110100; b = 9'b001100011; // Expected: {'sum': 407, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100110100; b = 9'b001100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 407, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000011110; b = 9'b001110001; // Expected: {'sum': 143, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b000011110; b = 9'b001110001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 143, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111110011; b = 9'b110111110; // Expected: {'sum': 433, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111110011; b = 9'b110111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 433, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111101011; b = 9'b101000010; // Expected: {'sum': 301, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111101011; b = 9'b101000010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 301, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111111110; b = 9'b111011010; // Expected: {'sum': 472, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111111110; b = 9'b111011010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 472, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011100110; b = 9'b101111001; // Expected: {'sum': 95, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011100110; b = 9'b101111001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 95, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b001111011; b = 9'b001001100; // Expected: {'sum': 199, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b001111011; b = 9'b001001100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 199, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100001100; b = 9'b011000110; // Expected: {'sum': 466, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b100001100; b = 9'b011000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 466, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100010001; b = 9'b101100001; // Expected: {'sum': 114, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100010001; b = 9'b101100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 114, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000010001; b = 9'b110010000; // Expected: {'sum': 417, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b000010001; b = 9'b110010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 417, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b000000011; b = 9'b011001010; // Expected: {'sum': 205, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b000000011; b = 9'b011001010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 205, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011001100; b = 9'b100111110; // Expected: {'sum': 10, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011001100; b = 9'b100111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011101011; b = 9'b101011001; // Expected: {'sum': 68, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b011101011; b = 9'b101011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 68, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b100100001; b = 9'b110011101; // Expected: {'sum': 190, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b100100001; b = 9'b110011101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 190, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b011000011; b = 9'b011011011; // Expected: {'sum': 414, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 9'b011000011; b = 9'b011011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 414, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b111100011; b = 9'b000111100; // Expected: {'sum': 31, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b111100011; b = 9'b000111100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 31, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 9'b010111100; b = 9'b111110011; // Expected: {'sum': 175, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 9'b010111100; b = 9'b111110011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 175, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
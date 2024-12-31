
`timescale 1ns / 1ps

module tb_N10_kogge_stone_adder;

    // Parameters
    
    parameter N = 10;
    
     
    // Inputs
    
    reg  [9:0] a;
    
    reg  [9:0] b;
    
    
    // Outputs
    
    wire  [9:0] sum;
    
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
        
        a = 10'b1111101000; b = 10'b0111100011; // Expected: {'sum': 459, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111101000; b = 10'b0111100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 459, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110111000; b = 10'b1111100000; // Expected: {'sum': 408, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110111000; b = 10'b1111100000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 408, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100111011; b = 10'b0110000011; // Expected: {'sum': 702, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100111011; b = 10'b0110000011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 702, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011100111; b = 10'b0011010011; // Expected: {'sum': 442, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011100111; b = 10'b0011010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 442, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1111010110; b = 10'b0000000101; // Expected: {'sum': 987, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1111010110; b = 10'b0000000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 987, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010100011; b = 10'b0110101101; // Expected: {'sum': 592, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010100011; b = 10'b0110101101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 592, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000110011; b = 10'b0011001000; // Expected: {'sum': 763, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000110011; b = 10'b0011001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 763, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001011110; b = 10'b0111100111; // Expected: {'sum': 581, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001011110; b = 10'b0111100111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 581, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000100001; b = 10'b0010000110; // Expected: {'sum': 679, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000100001; b = 10'b0010000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 679, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101101100; b = 10'b1000011000; // Expected: {'sum': 900, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101101100; b = 10'b1000011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 900, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010010001; b = 10'b1100100101; // Expected: {'sum': 950, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010010001; b = 10'b1100100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 950, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010100100; b = 10'b0110000111; // Expected: {'sum': 555, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010100100; b = 10'b0110000111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 555, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0101000010; b = 10'b0110101010; // Expected: {'sum': 748, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0101000010; b = 10'b0110101010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 748, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111100001; b = 10'b1110100101; // Expected: {'sum': 390, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111100001; b = 10'b1110100101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 390, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1010110110; b = 10'b0111101011; // Expected: {'sum': 161, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1010110110; b = 10'b0111101011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 161, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110011000; b = 10'b0010011001; // Expected: {'sum': 49, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110011000; b = 10'b0010011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 49, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000111010; b = 10'b1000100011; // Expected: {'sum': 93, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000111010; b = 10'b1000100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0111110100; b = 10'b0110000000; // Expected: {'sum': 884, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0111110100; b = 10'b0110000000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 884, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000111101; b = 10'b1100000101; // Expected: {'sum': 322, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000111101; b = 10'b1100000101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 322, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0100000111; b = 10'b0011110011; // Expected: {'sum': 506, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0100000111; b = 10'b0011110011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 506, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1101100001; b = 10'b0011010000; // Expected: {'sum': 49, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1101100001; b = 10'b0011010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 49, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0001111010; b = 10'b0010001111; // Expected: {'sum': 265, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0001111010; b = 10'b0010001111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 265, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011110110; b = 10'b0001100010; // Expected: {'sum': 856, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011110110; b = 10'b0001100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 856, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010000010; b = 10'b0010110101; // Expected: {'sum': 311, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010000010; b = 10'b0010110101; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 311, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0010101101; b = 10'b0001001111; // Expected: {'sum': 252, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0010101101; b = 10'b0001001111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 252, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1011101100; b = 10'b1111110010; // Expected: {'sum': 734, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1011101100; b = 10'b1111110010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 734, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1000010101; b = 10'b0110000001; // Expected: {'sum': 918, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1000010101; b = 10'b0110000001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 918, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0011010100; b = 10'b0100111111; // Expected: {'sum': 531, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0011010100; b = 10'b0100111111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 531, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0110011001; b = 10'b0110010110; // Expected: {'sum': 815, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0110011001; b = 10'b0110010110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 815, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1110101011; b = 10'b0000110010; // Expected: {'sum': 989, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1110101011; b = 10'b0000110010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 989, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001100001; b = 10'b0111100011; // Expected: {'sum': 68, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001100001; b = 10'b0111100011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 68, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b0000111101; b = 10'b1001010010; // Expected: {'sum': 655, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b0000111101; b = 10'b1001010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 655, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 10'b1001010011; b = 10'b0101010100; // Expected: {'sum': 935, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 10'b1001010011; b = 10'b0101010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 935, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
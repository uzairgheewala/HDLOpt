
`timescale 1ns / 1ps

module tb_N7_kogge_stone_adder;

    // Parameters
    
    parameter N = 7;
    
     
    // Inputs
    
    reg  [6:0] a;
    
    reg  [6:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [6:0] sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    kogge_stone_adder  #( N ) uut (
        
        .a(a),
        
        .b(b),
        
        .cin(cin),
        
        
        .sum(sum),
        
        .cout(cout)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        cin = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 7'b0001001; b = 7'b1101010; cin = 1'b0; // Expected: {'sum': 115, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b1101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011111; b = 7'b0011100; cin = 1'b0; // Expected: {'sum': 59, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011111; b = 7'b0011100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 59, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000101; b = 7'b1001011; cin = 1'b1; // Expected: {'sum': 81, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000101; b = 7'b1001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 81, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000100; b = 7'b1110111; cin = 1'b0; // Expected: {'sum': 123, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000100; b = 7'b1110111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 123, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010011; b = 7'b0100101; cin = 1'b1; // Expected: {'sum': 57, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010011; b = 7'b0100101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110000; b = 7'b1001111; cin = 1'b1; // Expected: {'sum': 64, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110000; b = 7'b1001111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 64, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010000; b = 7'b0001101; cin = 1'b0; // Expected: {'sum': 29, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010000; b = 7'b0001101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010101; b = 7'b1000000; cin = 1'b1; // Expected: {'sum': 22, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010101; b = 7'b1000000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 22, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001110; b = 7'b0010101; cin = 1'b1; // Expected: {'sum': 36, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b0010101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 36, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101111; b = 7'b0100001; cin = 1'b0; // Expected: {'sum': 16, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101111; b = 7'b0100001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b1011111; cin = 1'b1; // Expected: {'sum': 106, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b1011111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 106, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110010; b = 7'b1101001; cin = 1'b0; // Expected: {'sum': 91, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110010; b = 7'b1101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 91, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110111; b = 7'b1010111; cin = 1'b0; // Expected: {'sum': 14, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110111; b = 7'b1010111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 14, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110110; b = 7'b1001001; cin = 1'b0; // Expected: {'sum': 63, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110110; b = 7'b1001001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 63, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101110; b = 7'b0011101; cin = 1'b0; // Expected: {'sum': 11, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101110; b = 7'b0011101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011001; b = 7'b0001110; cin = 1'b1; // Expected: {'sum': 104, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011001; b = 7'b0001110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 104, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110101; b = 7'b0111100; cin = 1'b0; // Expected: {'sum': 113, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110101; b = 7'b0111100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110100; b = 7'b1000000; cin = 1'b1; // Expected: {'sum': 53, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110100; b = 7'b1000000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 53, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000111; b = 7'b0100011; cin = 1'b1; // Expected: {'sum': 107, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000111; b = 7'b0100011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 107, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101001; b = 7'b0101011; cin = 1'b0; // Expected: {'sum': 20, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101001; b = 7'b0101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 20, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011101; b = 7'b0001011; cin = 1'b1; // Expected: {'sum': 105, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011101; b = 7'b0001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 105, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b0110101; cin = 1'b1; // Expected: {'sum': 66, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b0110101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 66, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000100; b = 7'b1110010; cin = 1'b0; // Expected: {'sum': 54, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000100; b = 7'b1110010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111010; b = 7'b1000010; cin = 1'b0; // Expected: {'sum': 60, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111010; b = 7'b1000010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 60, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010010; b = 7'b0011011; cin = 1'b0; // Expected: {'sum': 45, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010010; b = 7'b0011011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 45, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000100; b = 7'b0001000; cin = 1'b1; // Expected: {'sum': 13, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000100; b = 7'b0001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011011; b = 7'b1011010; cin = 1'b0; // Expected: {'sum': 117, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011011; b = 7'b1011010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 117, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b1100101; cin = 1'b0; // Expected: {'sum': 12, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b1100101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010010; b = 7'b1100010; cin = 1'b1; // Expected: {'sum': 53, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010010; b = 7'b1100010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 53, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000101; b = 7'b1010101; cin = 1'b0; // Expected: {'sum': 26, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000101; b = 7'b1010101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 26, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101010; b = 7'b0001011; cin = 1'b0; // Expected: {'sum': 117, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101010; b = 7'b0001011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 117, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100010; b = 7'b1110110; cin = 1'b1; // Expected: {'sum': 89, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100010; b = 7'b1110110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 89, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011111; b = 7'b0000100; cin = 1'b1; // Expected: {'sum': 36, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011111; b = 7'b0000100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 36, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110001; b = 7'b0000111; cin = 1'b0; // Expected: {'sum': 120, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110001; b = 7'b0000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 33,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 120, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b1010110; cin = 1'b0; // Expected: {'sum': 96, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b1010110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 34,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 96, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
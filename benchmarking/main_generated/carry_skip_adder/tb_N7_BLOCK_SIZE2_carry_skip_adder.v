
`timescale 1ns / 1ps

module tb_N7_BLOCK_SIZE2_carry_skip_adder;

    // Parameters
    
    parameter N = 7;
    
    parameter BLOCK_SIZE = 2;
    
     
    // Inputs
    
    reg  [6:0] a;
    
    reg  [6:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [6:0] sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    carry_skip_adder  #( N,BLOCK_SIZE ) uut (
        
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
        
        a = 7'b0010010; b = 7'b1100111; cin = 1'b0; // Expected: {'sum': 121, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010010; b = 7'b1100111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 121, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000110; b = 7'b0111010; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000110; b = 7'b0111010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101110; b = 7'b0010111; cin = 1'b0; // Expected: {'sum': 69, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101110; b = 7'b0010111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 69, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000000; b = 7'b0100001; cin = 1'b0; // Expected: {'sum': 97, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000000; b = 7'b0100001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000110; b = 7'b0101010; cin = 1'b1; // Expected: {'sum': 49, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000110; b = 7'b0101010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 49, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100011; b = 7'b1010001; cin = 1'b1; // Expected: {'sum': 117, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100011; b = 7'b1010001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 117, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001011; b = 7'b1011000; cin = 1'b1; // Expected: {'sum': 100, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001011; b = 7'b1011000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 100, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b0000100; cin = 1'b0; // Expected: {'sum': 83, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b0000100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 83, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b0110001; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b0110001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111110; b = 7'b0010111; cin = 1'b1; // Expected: {'sum': 86, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111110; b = 7'b0010111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 86, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110000; b = 7'b0010011; cin = 1'b1; // Expected: {'sum': 68, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110000; b = 7'b0010011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010001; b = 7'b0101001; cin = 1'b0; // Expected: {'sum': 122, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010001; b = 7'b0101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101010; b = 7'b1111100; cin = 1'b1; // Expected: {'sum': 103, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101010; b = 7'b1111100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 103, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010110; b = 7'b1011110; cin = 1'b0; // Expected: {'sum': 116, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010110; b = 7'b1011110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 116, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100100; b = 7'b0000010; cin = 1'b1; // Expected: {'sum': 103, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100100; b = 7'b0000010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100001; b = 7'b1011100; cin = 1'b0; // Expected: {'sum': 125, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100001; b = 7'b1011100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 125, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111110; b = 7'b1011001; cin = 1'b1; // Expected: {'sum': 24, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111110; b = 7'b1011001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111101; b = 7'b0010110; cin = 1'b1; // Expected: {'sum': 20, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111101; b = 7'b0010110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 20, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b0010000; cin = 1'b1; // Expected: {'sum': 94, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b0010000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 94, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111001; b = 7'b0011100; cin = 1'b1; // Expected: {'sum': 86, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111001; b = 7'b0011100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 86, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010011; b = 7'b1100011; cin = 1'b0; // Expected: {'sum': 54, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010011; b = 7'b1100011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110010; b = 7'b0010101; cin = 1'b0; // Expected: {'sum': 7, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110010; b = 7'b0010101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101010; b = 7'b1000010; cin = 1'b1; // Expected: {'sum': 45, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101010; b = 7'b1000010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 45, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000001; b = 7'b0011000; cin = 1'b1; // Expected: {'sum': 26, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000001; b = 7'b0011000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 26, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101100; b = 7'b0000010; cin = 1'b0; // Expected: {'sum': 110, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101100; b = 7'b0000010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 110, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110111; b = 7'b0110100; cin = 1'b0; // Expected: {'sum': 43, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110111; b = 7'b0110100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 43, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110110; b = 7'b1001000; cin = 1'b0; // Expected: {'sum': 62, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110110; b = 7'b1001000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 62, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110010; b = 7'b1001011; cin = 1'b1; // Expected: {'sum': 126, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110010; b = 7'b1001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 126, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010101; b = 7'b0101110; cin = 1'b0; // Expected: {'sum': 67, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010101; b = 7'b0101110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011010; b = 7'b1010101; cin = 1'b1; // Expected: {'sum': 48, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011010; b = 7'b1010101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 48, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b0100111; cin = 1'b0; // Expected: {'sum': 78, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b0100111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 78, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111000; b = 7'b0001000; cin = 1'b0; // Expected: {'sum': 64, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111000; b = 7'b0001000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 64, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b0011000; cin = 1'b1; // Expected: {'sum': 101, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b0011000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 101, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
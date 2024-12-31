
`timescale 1ns / 1ps

module tb_N7_BLOCK_SIZE3_carry_skip_adder;

    // Parameters
    
    parameter N = 7;
    
    parameter BLOCK_SIZE = 3;
    
     
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
        
        a = 7'b0111101; b = 7'b0111001; cin = 1'b1; // Expected: {'sum': 119, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111101; b = 7'b0111001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 119, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010100; b = 7'b0000010; cin = 1'b1; // Expected: {'sum': 87, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010100; b = 7'b0000010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 87, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110010; b = 7'b1010001; cin = 1'b1; // Expected: {'sum': 68, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110010; b = 7'b1010001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 68, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100100; b = 7'b0001110; cin = 1'b1; // Expected: {'sum': 115, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100100; b = 7'b0001110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000011; b = 7'b0111010; cin = 1'b0; // Expected: {'sum': 61, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000011; b = 7'b0111010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 61, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101111; b = 7'b1000001; cin = 1'b0; // Expected: {'sum': 48, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101111; b = 7'b1000001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 48, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000100; b = 7'b0100010; cin = 1'b1; // Expected: {'sum': 39, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000100; b = 7'b0100010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 39, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b1000001; cin = 1'b0; // Expected: {'sum': 13, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b1000001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111001; b = 7'b1000100; cin = 1'b1; // Expected: {'sum': 126, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111001; b = 7'b1000100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 126, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111011; b = 7'b0100110; cin = 1'b0; // Expected: {'sum': 33, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111011; b = 7'b0100110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 33, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010101; b = 7'b0110101; cin = 1'b0; // Expected: {'sum': 74, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010101; b = 7'b0110101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 74, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010001; b = 7'b0110010; cin = 1'b1; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010001; b = 7'b0110010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b0111110; cin = 1'b0; // Expected: {'sum': 101, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b0111110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 101, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110010; b = 7'b1000111; cin = 1'b0; // Expected: {'sum': 121, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110010; b = 7'b1000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 121, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b0010001; cin = 1'b1; // Expected: {'sum': 18, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b0010001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011101; b = 7'b0110000; cin = 1'b1; // Expected: {'sum': 78, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011101; b = 7'b0110000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 78, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101100; b = 7'b0001011; cin = 1'b0; // Expected: {'sum': 119, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101100; b = 7'b0001011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 119, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000001; b = 7'b0011100; cin = 1'b0; // Expected: {'sum': 93, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000001; b = 7'b0011100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 93, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111111; b = 7'b1101011; cin = 1'b0; // Expected: {'sum': 106, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111111; b = 7'b1101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 106, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101011; b = 7'b0101111; cin = 1'b0; // Expected: {'sum': 90, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101011; b = 7'b0101111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 90, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001011; b = 7'b0101011; cin = 1'b1; // Expected: {'sum': 55, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001011; b = 7'b0101011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 55, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110000; b = 7'b1101111; cin = 1'b0; // Expected: {'sum': 31, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110000; b = 7'b1101111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 31, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010001; b = 7'b0111011; cin = 1'b1; // Expected: {'sum': 77, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010001; b = 7'b0111011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 77, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101110; b = 7'b1101111; cin = 1'b1; // Expected: {'sum': 30, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101110; b = 7'b1101111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101110; b = 7'b1010000; cin = 1'b0; // Expected: {'sum': 126, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101110; b = 7'b1010000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 126, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b0000000; cin = 1'b0; // Expected: {'sum': 92, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b0000000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 92, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b0010101; cin = 1'b0; // Expected: {'sum': 31, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b0010101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 31, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110001; b = 7'b0101100; cin = 1'b1; // Expected: {'sum': 30, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110001; b = 7'b0101100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100100; b = 7'b0000001; cin = 1'b0; // Expected: {'sum': 37, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100100; b = 7'b0000001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111110; b = 7'b1111101; cin = 1'b1; // Expected: {'sum': 60, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111110; b = 7'b1111101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 60, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b1011001; cin = 1'b1; // Expected: {'sum': 41, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b1011001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 41, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010111; b = 7'b0011100; cin = 1'b0; // Expected: {'sum': 51, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010111; b = 7'b0011100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 51, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000110; b = 7'b1001000; cin = 1'b1; // Expected: {'sum': 79, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000110; b = 7'b1001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
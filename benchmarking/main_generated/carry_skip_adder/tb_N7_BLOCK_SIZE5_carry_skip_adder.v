
`timescale 1ns / 1ps

module tb_N7_BLOCK_SIZE5_carry_skip_adder;

    // Parameters
    
    parameter N = 7;
    
    parameter BLOCK_SIZE = 5;
    
     
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
        
        a = 7'b0001110; b = 7'b0010111; cin = 1'b0; // Expected: {'sum': 37, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b0010111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010001; b = 7'b0100001; cin = 1'b0; // Expected: {'sum': 50, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010001; b = 7'b0100001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010100; b = 7'b0001111; cin = 1'b0; // Expected: {'sum': 99, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010100; b = 7'b0001111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 99, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110100; b = 7'b1000101; cin = 1'b1; // Expected: {'sum': 122, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110100; b = 7'b1000101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 122, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010011; b = 7'b1111110; cin = 1'b0; // Expected: {'sum': 81, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010011; b = 7'b1111110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 81, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011000; b = 7'b1111000; cin = 1'b0; // Expected: {'sum': 16, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011000; b = 7'b1111000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b1001001; cin = 1'b1; // Expected: {'sum': 23, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b1001001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b0101011; cin = 1'b1; // Expected: {'sum': 44, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b0101011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 44, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100011; b = 7'b1111011; cin = 1'b0; // Expected: {'sum': 30, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100011; b = 7'b1111011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110010; b = 7'b1101010; cin = 1'b1; // Expected: {'sum': 93, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110010; b = 7'b1101010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101011; b = 7'b0111011; cin = 1'b1; // Expected: {'sum': 39, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101011; b = 7'b0111011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 39, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b0100000; cin = 1'b0; // Expected: {'sum': 42, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b0100000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001001; b = 7'b0100100; cin = 1'b0; // Expected: {'sum': 109, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001001; b = 7'b0100100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 109, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110101; b = 7'b1010100; cin = 1'b1; // Expected: {'sum': 10, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110101; b = 7'b1010100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100101; b = 7'b0100100; cin = 1'b1; // Expected: {'sum': 74, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100101; b = 7'b0100100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 74, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110001; b = 7'b0010010; cin = 1'b0; // Expected: {'sum': 67, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110001; b = 7'b0010010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b1101001; cin = 1'b0; // Expected: {'sum': 28, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b1101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 28, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010101; b = 7'b1000111; cin = 1'b1; // Expected: {'sum': 29, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010101; b = 7'b1000111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010011; b = 7'b0010101; cin = 1'b1; // Expected: {'sum': 105, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010011; b = 7'b0010101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 105, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b0100000; cin = 1'b0; // Expected: {'sum': 71, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b0100000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 71, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b1011011; cin = 1'b1; // Expected: {'sum': 43, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b1011011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 43, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101010; b = 7'b0100001; cin = 1'b1; // Expected: {'sum': 76, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101010; b = 7'b0100001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 76, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000010; b = 7'b1111010; cin = 1'b0; // Expected: {'sum': 124, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000010; b = 7'b1111010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100110; b = 7'b0010010; cin = 1'b1; // Expected: {'sum': 57, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100110; b = 7'b0010010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100000; b = 7'b1100000; cin = 1'b1; // Expected: {'sum': 65, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100000; b = 7'b1100000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 65, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100000; b = 7'b0101010; cin = 1'b0; // Expected: {'sum': 74, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100000; b = 7'b0101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 74, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b1101011; cin = 1'b0; // Expected: {'sum': 56, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b1101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 56, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000011; b = 7'b1001011; cin = 1'b1; // Expected: {'sum': 15, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000011; b = 7'b1001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000001; b = 7'b0011111; cin = 1'b1; // Expected: {'sum': 97, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000001; b = 7'b0011111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001010; b = 7'b0110001; cin = 1'b1; // Expected: {'sum': 124, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001010; b = 7'b0110001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b1001001; cin = 1'b1; // Expected: {'sum': 22, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b1001001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 22, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011010; b = 7'b0011000; cin = 1'b1; // Expected: {'sum': 115, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011010; b = 7'b0011000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 115, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010111; b = 7'b0001110; cin = 1'b0; // Expected: {'sum': 37, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010111; b = 7'b0001110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
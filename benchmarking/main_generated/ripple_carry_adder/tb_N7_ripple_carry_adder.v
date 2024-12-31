
`timescale 1ns / 1ps

module tb_N7_ripple_carry_adder;

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
    ripple_carry_adder  #( N ) uut (
        
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
        
        a = 7'b0111001; b = 7'b1110001; cin = 1'b0; // Expected: {'sum': 42, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111001; b = 7'b1110001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 42, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110101; b = 7'b0000100; cin = 1'b0; // Expected: {'sum': 121, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110101; b = 7'b0000100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 121, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010011; b = 7'b1010010; cin = 1'b1; // Expected: {'sum': 102, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010011; b = 7'b1010010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 102, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100100; b = 7'b0101100; cin = 1'b0; // Expected: {'sum': 80, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100100; b = 7'b0101100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 80, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b0000101; cin = 1'b0; // Expected: {'sum': 97, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b0000101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 97, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011111; b = 7'b0001000; cin = 1'b1; // Expected: {'sum': 104, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011111; b = 7'b0001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 104, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110001; b = 7'b0101110; cin = 1'b1; // Expected: {'sum': 32, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110001; b = 7'b0101110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 32, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001000; b = 7'b1010110; cin = 1'b0; // Expected: {'sum': 30, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001000; b = 7'b1010110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011111; b = 7'b0000001; cin = 1'b0; // Expected: {'sum': 32, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011111; b = 7'b0000001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 32, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110100; b = 7'b0110101; cin = 1'b0; // Expected: {'sum': 105, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110100; b = 7'b0110101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 105, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101110; b = 7'b1011110; cin = 1'b0; // Expected: {'sum': 76, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101110; b = 7'b1011110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 76, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000010; b = 7'b0111001; cin = 1'b1; // Expected: {'sum': 124, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000010; b = 7'b0111001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 124, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b0000101; cin = 1'b0; // Expected: {'sum': 81, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b0000101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 81, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000110; b = 7'b0011110; cin = 1'b1; // Expected: {'sum': 37, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000110; b = 7'b0011110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011010; b = 7'b0101001; cin = 1'b0; // Expected: {'sum': 67, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011010; b = 7'b0101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 67, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001110; b = 7'b1001000; cin = 1'b0; // Expected: {'sum': 22, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001110; b = 7'b1001000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 22, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011010; b = 7'b0011010; cin = 1'b1; // Expected: {'sum': 117, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011010; b = 7'b0011010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 117, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000000; b = 7'b1000110; cin = 1'b0; // Expected: {'sum': 6, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000000; b = 7'b1000110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011110; b = 7'b1110111; cin = 1'b0; // Expected: {'sum': 85, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011110; b = 7'b1110111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 85, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011000; b = 7'b0110010; cin = 1'b1; // Expected: {'sum': 11, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011000; b = 7'b0110010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b0101111; cin = 1'b0; // Expected: {'sum': 11, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b0101111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111001; b = 7'b1111111; cin = 1'b1; // Expected: {'sum': 121, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111001; b = 7'b1111111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111000; b = 7'b0111011; cin = 1'b1; // Expected: {'sum': 52, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111000; b = 7'b0111011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 52, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000010; b = 7'b1000001; cin = 1'b1; // Expected: {'sum': 68, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000010; b = 7'b1000001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100101; b = 7'b0111011; cin = 1'b0; // Expected: {'sum': 32, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100101; b = 7'b0111011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 32, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101110; b = 7'b0100111; cin = 1'b1; // Expected: {'sum': 22, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101110; b = 7'b0100111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 22, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010111; b = 7'b1000001; cin = 1'b1; // Expected: {'sum': 25, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010111; b = 7'b1000001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b0101110; cin = 1'b1; // Expected: {'sum': 11, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b0101110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001100; b = 7'b0000011; cin = 1'b0; // Expected: {'sum': 15, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001100; b = 7'b0000011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001000; b = 7'b0100010; cin = 1'b0; // Expected: {'sum': 42, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001000; b = 7'b0100010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011100; b = 7'b1000011; cin = 1'b1; // Expected: {'sum': 96, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011100; b = 7'b1000011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 96, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001110; b = 7'b1001111; cin = 1'b1; // Expected: {'sum': 94, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001110; b = 7'b1001111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 94, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b1001000; cin = 1'b0; // Expected: {'sum': 111, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b1001000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 111, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110001; b = 7'b1001100; cin = 1'b0; // Expected: {'sum': 125, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110001; b = 7'b1001100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 33,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 125, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101110; b = 7'b1111111; cin = 1'b1; // Expected: {'sum': 110, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101110; b = 7'b1111111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 34,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 110, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule

`timescale 1ns / 1ps

module tb_carry_skip_adder;

// Inputs

reg  [7:0] a;

reg  [7:0] b;

reg   cin;


// Outputs

wire  [7:0] sum;

wire   cout;


// Instantiate the Unit Under Test (UUT)
carry_skip_adder uut #( 3,8 ) (
    
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
    
    a = 11010111; b = 10001001; cin = 1; // Expected: {'sum': 97, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11010111; b = 10001001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             97, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11000000; b = 01001111; cin = 0; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11000000; b = 01001111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10101101; b = 10110001; cin = 0; // Expected: {'sum': 94, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10101101; b = 10110001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             94, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10110110; b = 11011100; cin = 0; // Expected: {'sum': 146, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10110110; b = 11011100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             146, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10101110; b = 01000110; cin = 1; // Expected: {'sum': 245, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10101110; b = 01000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             245, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01100100; b = 10011101; cin = 0; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01100100; b = 10011101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111011; b = 11111000; cin = 1; // Expected: {'sum': 116, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01111011; b = 11111000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             116, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11000011; b = 00001001; cin = 0; // Expected: {'sum': 204, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 11000011; b = 00001001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             204, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111100; b = 10111010; cin = 0; // Expected: {'sum': 54, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01111100; b = 10111010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             54, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00000101; b = 01110000; cin = 0; // Expected: {'sum': 117, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00000101; b = 01110000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             117, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110011; b = 10011101; cin = 1; // Expected: {'sum': 17, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01110011; b = 10011101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             17, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00100110; b = 01111001; cin = 1; // Expected: {'sum': 160, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00100110; b = 01111001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             160, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11110000; b = 01101001; cin = 1; // Expected: {'sum': 90, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11110000; b = 01101001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             90, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111110; b = 00101100; cin = 0; // Expected: {'sum': 170, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01111110; b = 00101100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             170, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01010111; b = 00000100; cin = 0; // Expected: {'sum': 91, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01010111; b = 00000100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             91, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10010110; b = 00110100; cin = 0; // Expected: {'sum': 202, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10010110; b = 00110100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             202, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110001; b = 10001100; cin = 0; // Expected: {'sum': 253, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01110001; b = 10001100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             253, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10000001; b = 01101001; cin = 0; // Expected: {'sum': 234, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10000001; b = 01101001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             234, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10010010; b = 00111111; cin = 1; // Expected: {'sum': 210, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10010010; b = 00111111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             210, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001010; b = 11001001; cin = 0; // Expected: {'sum': 83, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10001010; b = 11001001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             83, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00000001; b = 01011010; cin = 1; // Expected: {'sum': 92, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00000001; b = 01011010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             92, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001001; b = 00011101; cin = 1; // Expected: {'sum': 167, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10001001; b = 00011101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             167, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10010000; b = 01010010; cin = 1; // Expected: {'sum': 227, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10010000; b = 01010010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             227, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01011011; b = 10110001; cin = 0; // Expected: {'sum': 12, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01011011; b = 10110001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             12, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10010000; b = 00101000; cin = 0; // Expected: {'sum': 184, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10010000; b = 00101000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             184, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11001100; b = 11101110; cin = 0; // Expected: {'sum': 186, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11001100; b = 11101110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             186, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00000000; b = 11010000; cin = 0; // Expected: {'sum': 208, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00000000; b = 11010000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             208, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011010; b = 10111001; cin = 1; // Expected: {'sum': 148, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11011010; b = 10111001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             148, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011010; b = 10100111; cin = 1; // Expected: {'sum': 194, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00011010; b = 10100111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             194, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000000; b = 00101100; cin = 1; // Expected: {'sum': 109, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01000000; b = 00101100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             109, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01011011; b = 00001011; cin = 1; // Expected: {'sum': 103, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01011011; b = 00001011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             103, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10101011; b = 11011110; cin = 0; // Expected: {'sum': 137, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10101011; b = 11011110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             137, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00010100; b = 10000110; cin = 0; // Expected: {'sum': 154, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00010100; b = 10000110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             154, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10011001; b = 00010101; cin = 1; // Expected: {'sum': 175, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10011001; b = 00010101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             175, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01011011; b = 10000000; cin = 0; // Expected: {'sum': 219, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01011011; b = 10000000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             219, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10000101; b = 00001100; cin = 0; // Expected: {'sum': 145, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10000101; b = 00001100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             145, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01101011; b = 01101000; cin = 0; // Expected: {'sum': 211, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01101011; b = 01101000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             211, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11000101; b = 10111001; cin = 0; // Expected: {'sum': 126, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11000101; b = 10111001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             126, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10111010; b = 10110110; cin = 1; // Expected: {'sum': 113, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10111010; b = 10110110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             113, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001010; b = 11010010; cin = 0; // Expected: {'sum': 92, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10001010; b = 11010010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             92, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000001; b = 11011011; cin = 1; // Expected: {'sum': 29, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01000001; b = 11011011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             29, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01101000; b = 00100100; cin = 0; // Expected: {'sum': 140, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01101000; b = 00100100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             140, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110010; b = 11101100; cin = 1; // Expected: {'sum': 95, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01110010; b = 11101100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             95, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01100110; b = 10111101; cin = 1; // Expected: {'sum': 36, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01100110; b = 10111101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             36, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00001101; b = 11101100; cin = 0; // Expected: {'sum': 249, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00001101; b = 11101100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             249, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01101000; b = 11010110; cin = 0; // Expected: {'sum': 62, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01101000; b = 11010110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             62, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01101000; b = 10000000; cin = 0; // Expected: {'sum': 232, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01101000; b = 10000000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             232, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01010101; b = 10011110; cin = 0; // Expected: {'sum': 243, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01010101; b = 10011110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             243, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000110; b = 01010011; cin = 0; // Expected: {'sum': 153, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01000110; b = 01010011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             153, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
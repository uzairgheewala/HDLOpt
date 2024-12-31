
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
carry_skip_adder uut #( 2,8 ) (
    
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
    
    a = 01111000; b = 00011111; cin = 0; // Expected: {'sum': 151, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01111000; b = 00011111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             151, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10110110; b = 00100001; cin = 1; // Expected: {'sum': 216, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10110110; b = 00100001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             216, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00110101; b = 01000111; cin = 1; // Expected: {'sum': 125, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00110101; b = 01000111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             125, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111010; b = 00001100; cin = 1; // Expected: {'sum': 135, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01111010; b = 00001100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             135, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111101; b = 00000010; cin = 0; // Expected: {'sum': 127, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01111101; b = 00000010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             127, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00100011; b = 10000011; cin = 0; // Expected: {'sum': 166, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00100011; b = 10000011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             166, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10000100; b = 00101010; cin = 0; // Expected: {'sum': 174, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10000100; b = 00101010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             174, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00100010; b = 11101111; cin = 1; // Expected: {'sum': 18, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 00100010; b = 11101111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             18, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11110101; b = 10100000; cin = 1; // Expected: {'sum': 150, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11110101; b = 10100000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             150, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10110110; b = 00001100; cin = 0; // Expected: {'sum': 194, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10110110; b = 00001100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             194, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00000000; b = 11000000; cin = 0; // Expected: {'sum': 192, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00000000; b = 11000000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             192, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01010000; b = 00000000; cin = 1; // Expected: {'sum': 81, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01010000; b = 00000000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             81, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00110110; b = 01010111; cin = 1; // Expected: {'sum': 142, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00110110; b = 01010111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             142, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01010101; b = 10110101; cin = 0; // Expected: {'sum': 10, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01010101; b = 10110101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             10, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10101111; b = 10011101; cin = 0; // Expected: {'sum': 76, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10101111; b = 10011101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             76, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10101100; b = 00101110; cin = 1; // Expected: {'sum': 219, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10101100; b = 00101110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             219, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000000; b = 00100011; cin = 0; // Expected: {'sum': 99, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01000000; b = 00100011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             99, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01100001; b = 11100100; cin = 1; // Expected: {'sum': 70, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01100001; b = 11100100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             70, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10011111; b = 01010011; cin = 0; // Expected: {'sum': 242, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10011111; b = 01010011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             242, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110111; b = 00110011; cin = 0; // Expected: {'sum': 170, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01110111; b = 00110011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             170, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11101011; b = 10111001; cin = 0; // Expected: {'sum': 164, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11101011; b = 10111001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             164, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11111101; b = 01000001; cin = 0; // Expected: {'sum': 62, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11111101; b = 01000001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             62, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11101101; b = 00100000; cin = 1; // Expected: {'sum': 14, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11101101; b = 00100000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             14, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01011000; b = 00001110; cin = 1; // Expected: {'sum': 103, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01011000; b = 00001110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             103, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00001111; b = 10001100; cin = 1; // Expected: {'sum': 156, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00001111; b = 10001100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             156, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00110010; b = 11100100; cin = 1; // Expected: {'sum': 23, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 00110010; b = 11100100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             23, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110011; b = 10000110; cin = 1; // Expected: {'sum': 250, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01110011; b = 10000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             250, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00111111; b = 11000111; cin = 1; // Expected: {'sum': 7, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 00111111; b = 11000111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             7, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00110110; b = 11101011; cin = 1; // Expected: {'sum': 34, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 00110110; b = 11101011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             34, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001001; b = 01101100; cin = 0; // Expected: {'sum': 245, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10001001; b = 01101100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             245, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011000; b = 10101100; cin = 0; // Expected: {'sum': 132, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11011000; b = 10101100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             132, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10011011; b = 00101010; cin = 0; // Expected: {'sum': 197, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10011011; b = 00101010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             197, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110110; b = 01000000; cin = 0; // Expected: {'sum': 182, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01110110; b = 01000000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             182, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00110011; b = 00101101; cin = 1; // Expected: {'sum': 97, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00110011; b = 00101101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             97, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01101011; b = 11001100; cin = 1; // Expected: {'sum': 56, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01101011; b = 11001100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             56, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01011101; b = 00001111; cin = 0; // Expected: {'sum': 108, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01011101; b = 00001111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             108, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011001; b = 01000101; cin = 1; // Expected: {'sum': 95, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00011001; b = 01000101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             95, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10110100; b = 00010010; cin = 0; // Expected: {'sum': 198, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10110100; b = 00010010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             198, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11100110; b = 01000100; cin = 0; // Expected: {'sum': 42, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11100110; b = 01000100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             42, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00110010; b = 11000010; cin = 0; // Expected: {'sum': 244, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00110010; b = 11000010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             244, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111100; b = 00010011; cin = 0; // Expected: {'sum': 143, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01111100; b = 00010011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             143, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001000; b = 00101011; cin = 0; // Expected: {'sum': 179, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10001000; b = 00101011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             179, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00101010; b = 11010110; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 00101010; b = 11010110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011001; b = 11001010; cin = 1; // Expected: {'sum': 164, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11011001; b = 11001010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             164, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10111110; b = 11000001; cin = 0; // Expected: {'sum': 127, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10111110; b = 11000001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             127, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00111111; b = 01001010; cin = 0; // Expected: {'sum': 137, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00111111; b = 01001010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             137, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11000000; b = 00100010; cin = 0; // Expected: {'sum': 226, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 11000000; b = 00100010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             226, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011010; b = 11100110; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 00011010; b = 11100110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00010010; b = 11100100; cin = 1; // Expected: {'sum': 247, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00010010; b = 11100100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             247, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule

`timescale 1ns / 1ps

module tb_carry_skip_adder;

// Inputs

reg  [5:0] a;

reg  [5:0] b;

reg   cin;


// Outputs

wire  [5:0] sum;

wire   cout;


// Instantiate the Unit Under Test (UUT)
carry_skip_adder uut #( 1,6 ) (
    
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
    
    a = 010001; b = 100110; cin = 0; // Expected: {'sum': 55, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010001; b = 100110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             55, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100000; b = 000100; cin = 0; // Expected: {'sum': 36, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100000; b = 000100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             36, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000010; b = 000101; cin = 0; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000010; b = 000101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100100; b = 001110; cin = 1; // Expected: {'sum': 51, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100100; b = 001110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             51, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100111; b = 011011; cin = 1; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100111; b = 011011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010101; b = 110110; cin = 1; // Expected: {'sum': 12, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010101; b = 110110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             12, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010100; b = 111011; cin = 1; // Expected: {'sum': 16, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010100; b = 111011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             16, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111100; b = 011110; cin = 1; // Expected: {'sum': 27, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111100; b = 011110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             27, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001010; b = 100011; cin = 0; // Expected: {'sum': 45, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001010; b = 100011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             45, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011011; b = 100010; cin = 1; // Expected: {'sum': 62, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011011; b = 100010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             62, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010010; b = 011011; cin = 1; // Expected: {'sum': 46, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010010; b = 011011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             46, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010111; b = 100011; cin = 0; // Expected: {'sum': 58, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010111; b = 100011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             58, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010111; b = 110011; cin = 0; // Expected: {'sum': 10, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010111; b = 110011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             10, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001011; b = 000101; cin = 1; // Expected: {'sum': 17, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001011; b = 000101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             17, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000010; b = 100011; cin = 1; // Expected: {'sum': 38, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000010; b = 100011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             38, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011001; b = 011001; cin = 0; // Expected: {'sum': 50, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011001; b = 011001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             50, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110000; b = 011101; cin = 0; // Expected: {'sum': 13, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110000; b = 011101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             13, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111000; b = 111100; cin = 0; // Expected: {'sum': 52, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111000; b = 111100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             52, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000100; b = 011010; cin = 1; // Expected: {'sum': 31, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000100; b = 011010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             31, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000100; b = 000001; cin = 1; // Expected: {'sum': 6, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000100; b = 000001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             6, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011111; b = 010111; cin = 0; // Expected: {'sum': 54, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011111; b = 010111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             54, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000001; b = 100110; cin = 0; // Expected: {'sum': 39, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000001; b = 100110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             39, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010001; b = 011100; cin = 1; // Expected: {'sum': 46, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010001; b = 011100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             46, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011100; b = 110110; cin = 0; // Expected: {'sum': 18, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 011100; b = 110110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             18, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000111; b = 011001; cin = 1; // Expected: {'sum': 33, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000111; b = 011001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             33, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100111; b = 010101; cin = 1; // Expected: {'sum': 61, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100111; b = 010101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             61, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111001; b = 101111; cin = 1; // Expected: {'sum': 41, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111001; b = 101111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             41, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100011; b = 111110; cin = 1; // Expected: {'sum': 34, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100011; b = 111110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             34, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101101; b = 110011; cin = 1; // Expected: {'sum': 33, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101101; b = 110011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             33, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100101; b = 010111; cin = 1; // Expected: {'sum': 61, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100101; b = 010111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             61, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000100; b = 111000; cin = 1; // Expected: {'sum': 61, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000100; b = 111000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             61, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001010; b = 010110; cin = 0; // Expected: {'sum': 32, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001010; b = 010110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             32, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011010; b = 011000; cin = 0; // Expected: {'sum': 50, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011010; b = 011000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             50, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111011; b = 110100; cin = 0; // Expected: {'sum': 47, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111011; b = 110100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             47, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111101; b = 010111; cin = 1; // Expected: {'sum': 21, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111101; b = 010111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             21, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101010; b = 101100; cin = 1; // Expected: {'sum': 23, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101010; b = 101100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             23, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010001; b = 001000; cin = 0; // Expected: {'sum': 25, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010001; b = 001000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             25, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100001; b = 110101; cin = 0; // Expected: {'sum': 22, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100001; b = 110101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             22, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110011; b = 110110; cin = 0; // Expected: {'sum': 41, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110011; b = 110110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             41, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011100; b = 100011; cin = 0; // Expected: {'sum': 63, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011100; b = 100011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             63, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101010; b = 011100; cin = 0; // Expected: {'sum': 6, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101010; b = 011100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             6, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011000; b = 001011; cin = 0; // Expected: {'sum': 35, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011000; b = 001011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             35, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001001; b = 010001; cin = 1; // Expected: {'sum': 27, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001001; b = 010001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             27, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110100; b = 011100; cin = 1; // Expected: {'sum': 17, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110100; b = 011100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             17, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101110; b = 110110; cin = 1; // Expected: {'sum': 37, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101110; b = 110110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             37, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110000; b = 110100; cin = 1; // Expected: {'sum': 37, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110000; b = 110100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             37, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010101; b = 100101; cin = 0; // Expected: {'sum': 58, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010101; b = 100101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             58, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110100; b = 001011; cin = 0; // Expected: {'sum': 63, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 110100; b = 001011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             63, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010001; b = 000011; cin = 1; // Expected: {'sum': 21, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010001; b = 000011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             21, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
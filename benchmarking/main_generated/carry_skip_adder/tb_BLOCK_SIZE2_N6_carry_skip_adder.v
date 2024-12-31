
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
carry_skip_adder uut #( 2,6 ) (
    
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
    
    a = 010010; b = 000010; cin = 1; // Expected: {'sum': 21, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010010; b = 000010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             21, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111110; b = 101010; cin = 1; // Expected: {'sum': 41, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111110; b = 101010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             41, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010100; b = 001111; cin = 0; // Expected: {'sum': 35, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010100; b = 001111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             35, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111111; b = 100011; cin = 1; // Expected: {'sum': 35, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111111; b = 100011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             35, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010000; b = 100100; cin = 0; // Expected: {'sum': 52, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010000; b = 100100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             52, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100011; b = 010110; cin = 1; // Expected: {'sum': 58, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100011; b = 010110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             58, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000111; b = 011100; cin = 0; // Expected: {'sum': 35, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000111; b = 011100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             35, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111111; b = 110010; cin = 1; // Expected: {'sum': 50, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111111; b = 110010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             50, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000100; b = 110000; cin = 1; // Expected: {'sum': 53, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000100; b = 110000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             53, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101001; b = 011010; cin = 1; // Expected: {'sum': 4, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101001; b = 011010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             4, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101001; b = 110011; cin = 0; // Expected: {'sum': 28, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101001; b = 110011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             28, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100111; b = 101000; cin = 0; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100111; b = 101000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010001; b = 001100; cin = 1; // Expected: {'sum': 30, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010001; b = 001100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             30, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001001; b = 000111; cin = 1; // Expected: {'sum': 17, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001001; b = 000111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             17, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101011; b = 011101; cin = 0; // Expected: {'sum': 8, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101011; b = 011101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             8, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101011; b = 100001; cin = 0; // Expected: {'sum': 12, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101011; b = 100001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             12, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111110; b = 011001; cin = 0; // Expected: {'sum': 23, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111110; b = 011001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             23, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101011; b = 101101; cin = 1; // Expected: {'sum': 25, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101011; b = 101101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             25, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111011; b = 011001; cin = 0; // Expected: {'sum': 20, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111011; b = 011001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             20, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011100; b = 010000; cin = 0; // Expected: {'sum': 44, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011100; b = 010000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             44, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110010; b = 100011; cin = 0; // Expected: {'sum': 21, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110010; b = 100011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             21, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011001; b = 001101; cin = 0; // Expected: {'sum': 38, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011001; b = 001101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             38, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110011; b = 100110; cin = 1; // Expected: {'sum': 26, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110011; b = 100110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             26, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110110; b = 000101; cin = 0; // Expected: {'sum': 59, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 110110; b = 000101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             59, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101101; b = 000000; cin = 1; // Expected: {'sum': 46, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101101; b = 000000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             46, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110101; b = 000111; cin = 0; // Expected: {'sum': 60, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 110101; b = 000111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             60, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111011; b = 100000; cin = 0; // Expected: {'sum': 27, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111011; b = 100000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             27, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010110; b = 011010; cin = 1; // Expected: {'sum': 49, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010110; b = 011010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             49, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100101; b = 111101; cin = 1; // Expected: {'sum': 35, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100101; b = 111101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             35, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010101; b = 111110; cin = 1; // Expected: {'sum': 20, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010101; b = 111110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             20, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101010; b = 000011; cin = 1; // Expected: {'sum': 46, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101010; b = 000011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             46, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100001; b = 111101; cin = 1; // Expected: {'sum': 31, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100001; b = 111101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             31, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101000; b = 101111; cin = 1; // Expected: {'sum': 24, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101000; b = 101111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             24, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110110; b = 000101; cin = 1; // Expected: {'sum': 60, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 110110; b = 000101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             60, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011011; b = 001010; cin = 0; // Expected: {'sum': 37, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011011; b = 001010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             37, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100110; b = 110110; cin = 0; // Expected: {'sum': 28, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100110; b = 110110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             28, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001110; b = 101011; cin = 1; // Expected: {'sum': 58, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001110; b = 101011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             58, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011001; b = 100010; cin = 1; // Expected: {'sum': 60, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011001; b = 100010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             60, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011101; b = 111010; cin = 0; // Expected: {'sum': 23, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 011101; b = 111010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             23, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011110; b = 010111; cin = 1; // Expected: {'sum': 54, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011110; b = 010111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             54, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010011; b = 000101; cin = 1; // Expected: {'sum': 25, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010011; b = 000101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             25, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100011; b = 100010; cin = 1; // Expected: {'sum': 6, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100011; b = 100010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             6, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001101; b = 110101; cin = 1; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 001101; b = 110101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010011; b = 110101; cin = 0; // Expected: {'sum': 8, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010011; b = 110101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             8, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100000; b = 111111; cin = 0; // Expected: {'sum': 31, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100000; b = 111111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             31, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001100; b = 010101; cin = 0; // Expected: {'sum': 33, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001100; b = 010101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             33, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000111; b = 001101; cin = 1; // Expected: {'sum': 21, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000111; b = 001101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             21, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100100; b = 010111; cin = 0; // Expected: {'sum': 59, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100100; b = 010111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             59, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111010; b = 000110; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111010; b = 000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
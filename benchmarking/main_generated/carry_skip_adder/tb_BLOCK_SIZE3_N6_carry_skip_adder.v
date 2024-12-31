
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
carry_skip_adder uut #( 3,6 ) (
    
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
    
    a = 101001; b = 110010; cin = 0; // Expected: {'sum': 27, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101001; b = 110010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             27, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110101; b = 010110; cin = 1; // Expected: {'sum': 12, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110101; b = 010110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             12, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101000; b = 001001; cin = 1; // Expected: {'sum': 50, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101000; b = 001001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             50, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100000; b = 010011; cin = 1; // Expected: {'sum': 52, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100000; b = 010011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             52, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100001; b = 010111; cin = 1; // Expected: {'sum': 57, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100001; b = 010111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             57, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011110; b = 111111; cin = 1; // Expected: {'sum': 30, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 011110; b = 111111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             30, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101111; b = 100110; cin = 0; // Expected: {'sum': 21, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101111; b = 100110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             21, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110101; b = 100000; cin = 0; // Expected: {'sum': 21, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110101; b = 100000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             21, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000110; b = 110101; cin = 0; // Expected: {'sum': 59, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000110; b = 110101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             59, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101111; b = 001111; cin = 0; // Expected: {'sum': 62, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101111; b = 001111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             62, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100100; b = 001001; cin = 0; // Expected: {'sum': 45, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100100; b = 001001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             45, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010000; b = 110111; cin = 0; // Expected: {'sum': 7, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010000; b = 110111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             7, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110010; b = 100101; cin = 1; // Expected: {'sum': 24, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110010; b = 100101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             24, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001110; b = 110101; cin = 1; // Expected: {'sum': 4, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 001110; b = 110101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             4, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000110; b = 111100; cin = 0; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 000110; b = 111100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000110; b = 100100; cin = 0; // Expected: {'sum': 42, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000110; b = 100100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             42, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010001; b = 000110; cin = 1; // Expected: {'sum': 24, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010001; b = 000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             24, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000110; b = 101110; cin = 1; // Expected: {'sum': 53, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000110; b = 101110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             53, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001010; b = 010110; cin = 0; // Expected: {'sum': 32, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001010; b = 010110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             32, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000001; b = 101000; cin = 1; // Expected: {'sum': 42, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000001; b = 101000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             42, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011001; b = 101110; cin = 0; // Expected: {'sum': 7, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 011001; b = 101110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             7, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110111; b = 000110; cin = 1; // Expected: {'sum': 62, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 110111; b = 000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             62, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100101; b = 101001; cin = 1; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100101; b = 101001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101011; b = 110110; cin = 0; // Expected: {'sum': 33, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101011; b = 110110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             33, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100101; b = 010001; cin = 1; // Expected: {'sum': 55, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100101; b = 010001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             55, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111011; b = 100100; cin = 1; // Expected: {'sum': 32, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111011; b = 100100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             32, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101101; b = 000110; cin = 1; // Expected: {'sum': 52, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101101; b = 000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             52, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111000; b = 111000; cin = 1; // Expected: {'sum': 49, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111000; b = 111000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             49, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110001; b = 000110; cin = 0; // Expected: {'sum': 55, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 110001; b = 000110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             55, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100110; b = 111100; cin = 0; // Expected: {'sum': 34, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100110; b = 111100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             34, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000011; b = 011000; cin = 1; // Expected: {'sum': 28, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000011; b = 011000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             28, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001100; b = 111001; cin = 1; // Expected: {'sum': 6, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 001100; b = 111001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             6, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111100; b = 100110; cin = 1; // Expected: {'sum': 35, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111100; b = 100110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             35, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000101; b = 111011; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 000101; b = 111011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011001; b = 011011; cin = 1; // Expected: {'sum': 53, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011001; b = 011011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             53, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101001; b = 001000; cin = 1; // Expected: {'sum': 50, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101001; b = 001000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             50, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010101; b = 010100; cin = 0; // Expected: {'sum': 41, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010101; b = 010100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             41, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110111; b = 110010; cin = 1; // Expected: {'sum': 42, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110111; b = 110010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             42, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010101; b = 010001; cin = 1; // Expected: {'sum': 39, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010101; b = 010001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             39, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100111; b = 011110; cin = 1; // Expected: {'sum': 6, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100111; b = 011110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             6, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010110; b = 101011; cin = 1; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010110; b = 101011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101101; b = 001000; cin = 1; // Expected: {'sum': 54, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101101; b = 001000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             54, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000110; b = 111000; cin = 1; // Expected: {'sum': 63, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000110; b = 111000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             63, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010101; b = 010111; cin = 0; // Expected: {'sum': 44, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010101; b = 010111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             44, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101101; b = 101111; cin = 1; // Expected: {'sum': 29, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101101; b = 101111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             29, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001011; b = 000011; cin = 0; // Expected: {'sum': 14, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001011; b = 000011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             14, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011011; b = 101010; cin = 1; // Expected: {'sum': 6, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 011011; b = 101010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             6, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010110; b = 001110; cin = 0; // Expected: {'sum': 36, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010110; b = 001110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             36, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110001; b = 101001; cin = 0; // Expected: {'sum': 26, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110001; b = 101001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             26, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule

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
carry_skip_adder uut #( 4,6 ) (
    
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
    
    a = 100000; b = 101011; cin = 0; // Expected: {'sum': 11, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100000; b = 101011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             11, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000000; b = 010111; cin = 0; // Expected: {'sum': 23, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000000; b = 010111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             23, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100001; b = 101011; cin = 0; // Expected: {'sum': 12, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100001; b = 101011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             12, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100100; b = 111111; cin = 0; // Expected: {'sum': 35, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100100; b = 111111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             35, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000110; b = 000001; cin = 0; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000110; b = 000001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010110; b = 101101; cin = 0; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010110; b = 101101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110011; b = 110001; cin = 1; // Expected: {'sum': 37, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110011; b = 110001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             37, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011000; b = 110000; cin = 0; // Expected: {'sum': 8, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 011000; b = 110000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             8, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101011; b = 011110; cin = 0; // Expected: {'sum': 9, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101011; b = 011110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             9, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110010; b = 100100; cin = 0; // Expected: {'sum': 22, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110010; b = 100100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             22, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111110; b = 111111; cin = 1; // Expected: {'sum': 62, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111110; b = 111111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             62, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000110; b = 101000; cin = 0; // Expected: {'sum': 46, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000110; b = 101000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             46, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100001; b = 010100; cin = 0; // Expected: {'sum': 53, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100001; b = 010100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             53, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110100; b = 010100; cin = 0; // Expected: {'sum': 8, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110100; b = 010100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             8, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000110; b = 010000; cin = 0; // Expected: {'sum': 22, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000110; b = 010000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             22, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110101; b = 011001; cin = 1; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110101; b = 011001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001100; b = 010111; cin = 0; // Expected: {'sum': 35, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001100; b = 010111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             35, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101010; b = 001100; cin = 0; // Expected: {'sum': 54, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101010; b = 001100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             54, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001001; b = 101110; cin = 1; // Expected: {'sum': 56, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001001; b = 101110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             56, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000100; b = 100001; cin = 0; // Expected: {'sum': 37, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000100; b = 100001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             37, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010010; b = 111010; cin = 1; // Expected: {'sum': 13, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010010; b = 111010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             13, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000011; b = 100100; cin = 0; // Expected: {'sum': 39, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000011; b = 100100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             39, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010000; b = 010001; cin = 1; // Expected: {'sum': 34, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010000; b = 010001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             34, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100100; b = 101010; cin = 1; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100100; b = 101010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001011; b = 011010; cin = 1; // Expected: {'sum': 38, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001011; b = 011010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             38, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001001; b = 011000; cin = 1; // Expected: {'sum': 34, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001001; b = 011000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             34, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011111; b = 110011; cin = 1; // Expected: {'sum': 19, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 011111; b = 110011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             19, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001000; b = 001000; cin = 1; // Expected: {'sum': 17, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001000; b = 001000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             17, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010101; b = 011001; cin = 1; // Expected: {'sum': 47, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010101; b = 011001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             47, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010001; b = 011110; cin = 1; // Expected: {'sum': 48, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010001; b = 011110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             48, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001110; b = 011001; cin = 0; // Expected: {'sum': 39, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001110; b = 011001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             39, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001111; b = 001110; cin = 1; // Expected: {'sum': 30, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001111; b = 001110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             30, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011100; b = 001011; cin = 0; // Expected: {'sum': 39, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011100; b = 001011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             39, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011010; b = 010001; cin = 1; // Expected: {'sum': 44, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011010; b = 010001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             44, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111100; b = 000111; cin = 1; // Expected: {'sum': 4, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111100; b = 000111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             4, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111110; b = 110101; cin = 1; // Expected: {'sum': 52, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111110; b = 110101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             52, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101001; b = 000100; cin = 0; // Expected: {'sum': 45, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101001; b = 000100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             45, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011101; b = 000010; cin = 1; // Expected: {'sum': 32, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011101; b = 000010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             32, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001101; b = 010101; cin = 0; // Expected: {'sum': 34, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001101; b = 010101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             34, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010001; b = 110001; cin = 1; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010001; b = 110001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100111; b = 111000; cin = 1; // Expected: {'sum': 32, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100111; b = 111000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             32, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010000; b = 001110; cin = 1; // Expected: {'sum': 31, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010000; b = 001110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             31, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001000; b = 001011; cin = 0; // Expected: {'sum': 19, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001000; b = 001011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             19, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101000; b = 010101; cin = 0; // Expected: {'sum': 61, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101000; b = 010101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             61, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000001; b = 011011; cin = 0; // Expected: {'sum': 28, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000001; b = 011011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             28, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000011; b = 101110; cin = 1; // Expected: {'sum': 50, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000011; b = 101110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             50, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101000; b = 111000; cin = 1; // Expected: {'sum': 33, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101000; b = 111000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             33, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011011; b = 001101; cin = 1; // Expected: {'sum': 41, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011011; b = 001101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             41, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111011; b = 001001; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111011; b = 001001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
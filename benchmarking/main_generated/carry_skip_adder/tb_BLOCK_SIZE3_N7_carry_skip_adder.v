
`timescale 1ns / 1ps

module tb_carry_skip_adder;

// Inputs

reg  [6:0] a;

reg  [6:0] b;

reg   cin;


// Outputs

wire  [6:0] sum;

wire   cout;


// Instantiate the Unit Under Test (UUT)
carry_skip_adder uut #( 3,7 ) (
    
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
    
    a = 0000100; b = 0100111; cin = 1; // Expected: {'sum': 44, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000100; b = 0100111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             44, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000000; b = 1000110; cin = 0; // Expected: {'sum': 6, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000000; b = 1000110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             6, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100110; b = 0101100; cin = 1; // Expected: {'sum': 83, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100110; b = 0101100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             83, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000100; b = 1110111; cin = 1; // Expected: {'sum': 124, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000100; b = 1110111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             124, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000111; b = 0011110; cin = 0; // Expected: {'sum': 101, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1000111; b = 0011110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             101, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000111; b = 1101100; cin = 0; // Expected: {'sum': 51, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000111; b = 1101100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             51, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000100; b = 0001011; cin = 1; // Expected: {'sum': 16, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000100; b = 0001011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             16, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100100; b = 1100000; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0100100; b = 1100000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110011; b = 0110101; cin = 1; // Expected: {'sum': 105, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0110011; b = 0110101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             105, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110111; b = 0010010; cin = 0; // Expected: {'sum': 9, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110111; b = 0010010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             9, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110101; b = 0110110; cin = 1; // Expected: {'sum': 108, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0110101; b = 0110110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             108, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001101; b = 1111011; cin = 0; // Expected: {'sum': 8, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0001101; b = 1111011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             8, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001111; b = 1010111; cin = 1; // Expected: {'sum': 103, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001111; b = 1010111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             103, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011001; b = 0110000; cin = 1; // Expected: {'sum': 10, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011001; b = 0110000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             10, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110101; b = 0011010; cin = 0; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110101; b = 0011010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010101; b = 0111001; cin = 0; // Expected: {'sum': 78, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010101; b = 0111001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             78, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111111; b = 0000001; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111111; b = 0000001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101111; b = 0111100; cin = 1; // Expected: {'sum': 108, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101111; b = 0111100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             108, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011000; b = 1011101; cin = 1; // Expected: {'sum': 54, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011000; b = 1011101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             54, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000110; b = 1010011; cin = 0; // Expected: {'sum': 89, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000110; b = 1010011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             89, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101010; b = 0000110; cin = 1; // Expected: {'sum': 49, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101010; b = 0000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             49, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000000; b = 1100100; cin = 1; // Expected: {'sum': 37, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000000; b = 1100100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             37, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100001; b = 1000100; cin = 1; // Expected: {'sum': 38, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100001; b = 1000100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             38, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010101; b = 1100000; cin = 0; // Expected: {'sum': 53, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1010101; b = 1100000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             53, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001011; b = 0101001; cin = 1; // Expected: {'sum': 117, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1001011; b = 0101001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             117, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110110; b = 1001100; cin = 0; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0110110; b = 1001100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110001; b = 1100010; cin = 1; // Expected: {'sum': 84, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110001; b = 1100010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             84, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010101; b = 0001000; cin = 0; // Expected: {'sum': 29, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010101; b = 0001000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             29, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101101; b = 1001001; cin = 0; // Expected: {'sum': 54, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1101101; b = 1001001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             54, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001111; b = 0010001; cin = 0; // Expected: {'sum': 32, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001111; b = 0010001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             32, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101010; b = 0110000; cin = 0; // Expected: {'sum': 26, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1101010; b = 0110000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             26, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010010; b = 1100100; cin = 0; // Expected: {'sum': 54, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1010010; b = 1100100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             54, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100010; b = 1001010; cin = 0; // Expected: {'sum': 44, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100010; b = 1001010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             44, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000101; b = 0110010; cin = 1; // Expected: {'sum': 120, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1000101; b = 0110010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             120, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010000; b = 0001010; cin = 1; // Expected: {'sum': 91, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1010000; b = 0001010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             91, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011101; b = 1011110; cin = 1; // Expected: {'sum': 60, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011101; b = 1011110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             60, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101011; b = 0101001; cin = 0; // Expected: {'sum': 20, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1101011; b = 0101001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             20, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000101; b = 1110010; cin = 1; // Expected: {'sum': 56, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000101; b = 1110010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             56, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101111; b = 1110010; cin = 0; // Expected: {'sum': 33, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0101111; b = 1110010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             33, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011011; b = 0111110; cin = 0; // Expected: {'sum': 25, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011011; b = 0111110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             25, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011000; b = 1111100; cin = 0; // Expected: {'sum': 84, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011000; b = 1111100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             84, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110101; b = 0010001; cin = 0; // Expected: {'sum': 6, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110101; b = 0010001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             6, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011000; b = 1111100; cin = 1; // Expected: {'sum': 85, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011000; b = 1111100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             85, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110101; b = 1001100; cin = 0; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0110101; b = 1001100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100000; b = 1101111; cin = 0; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0100000; b = 1101111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010100; b = 0110010; cin = 1; // Expected: {'sum': 71, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010100; b = 0110010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             71, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000010; b = 0101010; cin = 1; // Expected: {'sum': 109, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1000010; b = 0101010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             109, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101001; b = 1101101; cin = 1; // Expected: {'sum': 23, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0101001; b = 1101101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             23, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011011; b = 1111101; cin = 1; // Expected: {'sum': 89, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011011; b = 1111101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             89, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
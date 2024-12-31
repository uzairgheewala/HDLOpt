
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
carry_skip_adder uut #( 2,7 ) (
    
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
    
    a = 0011101; b = 1000101; cin = 0; // Expected: {'sum': 98, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011101; b = 1000101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             98, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111100; b = 1001101; cin = 1; // Expected: {'sum': 10, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0111100; b = 1001101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             10, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011110; b = 1101001; cin = 1; // Expected: {'sum': 72, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011110; b = 1101001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             72, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001111; b = 0000100; cin = 0; // Expected: {'sum': 19, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001111; b = 0000100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             19, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110110; b = 1100101; cin = 1; // Expected: {'sum': 92, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110110; b = 1100101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             92, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111110; b = 0011010; cin = 0; // Expected: {'sum': 88, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0111110; b = 0011010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             88, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010100; b = 0101000; cin = 1; // Expected: {'sum': 125, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1010100; b = 0101000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             125, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111111; b = 1101101; cin = 1; // Expected: {'sum': 45, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0111111; b = 1101101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             45, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011010; b = 1001101; cin = 1; // Expected: {'sum': 104, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011010; b = 1001101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             104, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100101; b = 1110000; cin = 1; // Expected: {'sum': 86, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100101; b = 1110000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             86, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000101; b = 1110101; cin = 0; // Expected: {'sum': 122, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000101; b = 1110101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             122, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000110; b = 1100001; cin = 0; // Expected: {'sum': 103, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000110; b = 1100001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             103, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110111; b = 0110100; cin = 0; // Expected: {'sum': 107, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0110111; b = 0110100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             107, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100000; b = 0001010; cin = 0; // Expected: {'sum': 42, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100000; b = 0001010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             42, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110110; b = 0000100; cin = 0; // Expected: {'sum': 58, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0110110; b = 0000100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             58, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000100; b = 1011100; cin = 1; // Expected: {'sum': 33, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000100; b = 1011100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             33, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101111; b = 0011111; cin = 0; // Expected: {'sum': 78, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101111; b = 0011111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             78, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011100; b = 1011011; cin = 0; // Expected: {'sum': 55, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011100; b = 1011011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             55, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000101; b = 0110011; cin = 1; // Expected: {'sum': 57, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000101; b = 0110011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             57, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101101; b = 0001010; cin = 1; // Expected: {'sum': 120, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1101101; b = 0001010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             120, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100010; b = 1101001; cin = 0; // Expected: {'sum': 11, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0100010; b = 1101001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             11, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000110; b = 1110011; cin = 1; // Expected: {'sum': 58, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000110; b = 1110011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             58, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101101; b = 0101010; cin = 0; // Expected: {'sum': 87, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101101; b = 0101010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             87, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011001; b = 0010010; cin = 1; // Expected: {'sum': 108, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1011001; b = 0010010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             108, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000110; b = 1000011; cin = 1; // Expected: {'sum': 10, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000110; b = 1000011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             10, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001010; b = 0000011; cin = 0; // Expected: {'sum': 77, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1001010; b = 0000011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             77, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010010; b = 0010100; cin = 0; // Expected: {'sum': 102, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1010010; b = 0010100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             102, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101110; b = 0010011; cin = 1; // Expected: {'sum': 66, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101110; b = 0010011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             66, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001000; b = 1000001; cin = 0; // Expected: {'sum': 73, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001000; b = 1000001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             73, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111001; b = 0100101; cin = 1; // Expected: {'sum': 31, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111001; b = 0100101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             31, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001111; b = 1011000; cin = 0; // Expected: {'sum': 39, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1001111; b = 1011000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             39, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001011; b = 0101111; cin = 1; // Expected: {'sum': 59, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001011; b = 0101111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             59, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101100; b = 1101111; cin = 0; // Expected: {'sum': 27, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0101100; b = 1101111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             27, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011011; b = 0000011; cin = 0; // Expected: {'sum': 30, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011011; b = 0000011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             30, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010011; b = 0000111; cin = 0; // Expected: {'sum': 26, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010011; b = 0000111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             26, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101001; b = 1100010; cin = 1; // Expected: {'sum': 12, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0101001; b = 1100010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             12, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011111; b = 1101001; cin = 1; // Expected: {'sum': 73, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011111; b = 1101001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             73, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111111; b = 1110110; cin = 1; // Expected: {'sum': 54, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0111111; b = 1110110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             54, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100010; b = 1010110; cin = 0; // Expected: {'sum': 56, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100010; b = 1010110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             56, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101110; b = 0001100; cin = 1; // Expected: {'sum': 59, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101110; b = 0001100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             59, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001111; b = 1010000; cin = 1; // Expected: {'sum': 32, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1001111; b = 1010000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             32, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100010; b = 1001001; cin = 1; // Expected: {'sum': 108, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100010; b = 1001001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             108, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111111; b = 0100011; cin = 0; // Expected: {'sum': 34, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111111; b = 0100011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             34, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010011; b = 0110111; cin = 0; // Expected: {'sum': 10, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1010011; b = 0110111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             10, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001111; b = 0000111; cin = 1; // Expected: {'sum': 23, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001111; b = 0000111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             23, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100001; b = 0110100; cin = 1; // Expected: {'sum': 22, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100001; b = 0110100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             22, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011011; b = 1001101; cin = 0; // Expected: {'sum': 104, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011011; b = 1001101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             104, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011110; b = 0110010; cin = 1; // Expected: {'sum': 17, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011110; b = 0110010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             17, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011011; b = 1001100; cin = 0; // Expected: {'sum': 103, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011011; b = 1001100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             103, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
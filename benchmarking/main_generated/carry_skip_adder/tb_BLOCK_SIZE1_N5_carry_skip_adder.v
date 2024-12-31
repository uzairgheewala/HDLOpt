
`timescale 1ns / 1ps

module tb_carry_skip_adder;

// Inputs

reg  [4:0] a;

reg  [4:0] b;

reg   cin;


// Outputs

wire  [4:0] sum;

wire   cout;


// Instantiate the Unit Under Test (UUT)
carry_skip_adder uut #( 1,5 ) (
    
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
    
    a = 10000; b = 01101; cin = 1; // Expected: {'sum': 30, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10000; b = 01101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             30, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00010; b = 01000; cin = 1; // Expected: {'sum': 11, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00010; b = 01000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             11, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01001; b = 11001; cin = 0; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01001; b = 11001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000; b = 01000; cin = 1; // Expected: {'sum': 17, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01000; b = 01000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             17, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00001; b = 10111; cin = 1; // Expected: {'sum': 25, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00001; b = 10111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             25, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00001; b = 00011; cin = 0; // Expected: {'sum': 4, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00001; b = 00011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             4, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00111; b = 11000; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 00111; b = 11000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10111; b = 01000; cin = 0; // Expected: {'sum': 31, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10111; b = 01000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             31, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10100; b = 11000; cin = 0; // Expected: {'sum': 12, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10100; b = 11000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             12, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11010; b = 11101; cin = 1; // Expected: {'sum': 24, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11010; b = 11101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             24, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00111; b = 00011; cin = 0; // Expected: {'sum': 10, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00111; b = 00011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             10, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11001; b = 11000; cin = 0; // Expected: {'sum': 17, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11001; b = 11000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             17, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00101; b = 10111; cin = 0; // Expected: {'sum': 28, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00101; b = 10111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             28, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11110; b = 11000; cin = 0; // Expected: {'sum': 22, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11110; b = 11000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             22, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01011; b = 10011; cin = 0; // Expected: {'sum': 30, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01011; b = 10011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             30, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01101; b = 01011; cin = 0; // Expected: {'sum': 24, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01101; b = 01011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             24, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01001; b = 01001; cin = 0; // Expected: {'sum': 18, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01001; b = 01001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             18, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11111; b = 00101; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11111; b = 00101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011; b = 01101; cin = 1; // Expected: {'sum': 17, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00011; b = 01101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             17, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011; b = 00101; cin = 1; // Expected: {'sum': 9, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00011; b = 00101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             9, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000; b = 00101; cin = 1; // Expected: {'sum': 14, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01000; b = 00101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             14, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11101; b = 00000; cin = 0; // Expected: {'sum': 29, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 11101; b = 00000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             29, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111; b = 01110; cin = 1; // Expected: {'sum': 30, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01111; b = 01110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             30, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00100; b = 01101; cin = 0; // Expected: {'sum': 17, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00100; b = 01101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             17, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011; b = 11101; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 00011; b = 11101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11000; b = 10110; cin = 0; // Expected: {'sum': 14, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11000; b = 10110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             14, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00100; b = 00101; cin = 0; // Expected: {'sum': 9, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00100; b = 00101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             9, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000; b = 00001; cin = 0; // Expected: {'sum': 9, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01000; b = 00001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             9, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10110; b = 01110; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10110; b = 01110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011; b = 01100; cin = 0; // Expected: {'sum': 7, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11011; b = 01100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             7, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10011; b = 11010; cin = 0; // Expected: {'sum': 13, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10011; b = 11010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             13, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10101; b = 00101; cin = 0; // Expected: {'sum': 26, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10101; b = 00101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             26, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10010; b = 11100; cin = 1; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10010; b = 11100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00110; b = 10101; cin = 1; // Expected: {'sum': 28, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00110; b = 10101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             28, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011; b = 00001; cin = 0; // Expected: {'sum': 28, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 11011; b = 00001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             28, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111; b = 01000; cin = 1; // Expected: {'sum': 24, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01111; b = 01000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             24, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11100; b = 00001; cin = 0; // Expected: {'sum': 29, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 11100; b = 00001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             29, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00001; b = 01110; cin = 1; // Expected: {'sum': 16, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00001; b = 01110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             16, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00001; b = 01111; cin = 0; // Expected: {'sum': 16, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00001; b = 01111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             16, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10011; b = 11001; cin = 1; // Expected: {'sum': 13, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10011; b = 11001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             13, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10000; b = 10001; cin = 1; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10000; b = 10001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011; b = 01111; cin = 1; // Expected: {'sum': 11, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11011; b = 01111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             11, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11101; b = 01001; cin = 1; // Expected: {'sum': 7, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11101; b = 01001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             7, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11110; b = 01101; cin = 1; // Expected: {'sum': 12, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11110; b = 01101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             12, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11111; b = 01000; cin = 0; // Expected: {'sum': 7, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11111; b = 01000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             7, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110; b = 00011; cin = 1; // Expected: {'sum': 18, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01110; b = 00011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             18, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00000; b = 01100; cin = 1; // Expected: {'sum': 13, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00000; b = 01100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             13, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11111; b = 01100; cin = 0; // Expected: {'sum': 11, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11111; b = 01100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             11, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01100; b = 01000; cin = 0; // Expected: {'sum': 20, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01100; b = 01000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             20, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
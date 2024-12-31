
`timescale 1ns / 1ps

module tb_carry_skip_adder;

// Inputs

reg  [3:0] a;

reg  [3:0] b;

reg   cin;


// Outputs

wire  [3:0] sum;

wire   cout;


// Instantiate the Unit Under Test (UUT)
carry_skip_adder uut #( 1,4 ) (
    
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
    
    a = 0111; b = 0001; cin = 0; // Expected: {'sum': 8, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0111; b = 0001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             8, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110; b = 0110; cin = 0; // Expected: {'sum': 12, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0110; b = 0110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             12, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100; b = 0110; cin = 1; // Expected: {'sum': 11, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100; b = 0110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             11, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100; b = 1001; cin = 0; // Expected: {'sum': 13, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100; b = 1001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             13, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101; b = 0000; cin = 1; // Expected: {'sum': 14, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1101; b = 0000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             14, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100; b = 0100; cin = 1; // Expected: {'sum': 9, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100; b = 0100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             9, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111; b = 1100; cin = 1; // Expected: {'sum': 4, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0111; b = 1100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             4, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000; b = 1011; cin = 1; // Expected: {'sum': 12, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000; b = 1011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             12, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111; b = 1110; cin = 1; // Expected: {'sum': 14, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111; b = 1110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             14, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111; b = 1010; cin = 1; // Expected: {'sum': 10, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111; b = 1010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             10, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010; b = 1101; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0010; b = 1101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010; b = 0100; cin = 1; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010; b = 0100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101; b = 1010; cin = 0; // Expected: {'sum': 15, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101; b = 1010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             15, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001; b = 1101; cin = 0; // Expected: {'sum': 14, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001; b = 1101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             14, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001; b = 0101; cin = 0; // Expected: {'sum': 6, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001; b = 0101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             6, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011; b = 0100; cin = 1; // Expected: {'sum': 8, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011; b = 0100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             8, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010; b = 1010; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1010; b = 1010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100; b = 1000; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100; b = 1000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010; b = 0111; cin = 1; // Expected: {'sum': 10, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010; b = 0111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             10, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110; b = 1101; cin = 0; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0110; b = 1101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101; b = 1000; cin = 0; // Expected: {'sum': 13, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101; b = 1000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             13, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001; b = 1001; cin = 1; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1001; b = 1001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011; b = 0100; cin = 0; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011; b = 0100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111; b = 1001; cin = 1; // Expected: {'sum': 9, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111; b = 1001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             9, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000; b = 0100; cin = 1; // Expected: {'sum': 13, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1000; b = 0100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             13, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000; b = 1101; cin = 1; // Expected: {'sum': 14, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000; b = 1101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             14, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101; b = 1011; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0101; b = 1011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000; b = 1111; cin = 0; // Expected: {'sum': 7, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000; b = 1111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             7, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010; b = 1110; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0010; b = 1110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010; b = 0000; cin = 1; // Expected: {'sum': 11, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1010; b = 0000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             11, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001; b = 0100; cin = 1; // Expected: {'sum': 6, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001; b = 0100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             6, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011; b = 0110; cin = 1; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011; b = 0110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000; b = 0001; cin = 0; // Expected: {'sum': 1, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000; b = 0001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             1, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001; b = 0101; cin = 0; // Expected: {'sum': 14, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1001; b = 0101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             14, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110; b = 0101; cin = 1; // Expected: {'sum': 4, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110; b = 0101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             4, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011; b = 0001; cin = 1; // Expected: {'sum': 5, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011; b = 0001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             5, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111; b = 1110; cin = 0; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0111; b = 1110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011; b = 1100; cin = 0; // Expected: {'sum': 7, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011; b = 1100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             7, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101; b = 0000; cin = 1; // Expected: {'sum': 6, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101; b = 0000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             6, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011; b = 1001; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011; b = 1001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100; b = 0010; cin = 0; // Expected: {'sum': 14, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1100; b = 0010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             14, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100; b = 1001; cin = 1; // Expected: {'sum': 14, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100; b = 1001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             14, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100; b = 0011; cin = 1; // Expected: {'sum': 8, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100; b = 0011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             8, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100; b = 0101; cin = 0; // Expected: {'sum': 9, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100; b = 0101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             9, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011; b = 1110; cin = 1; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0011; b = 1110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011; b = 1100; cin = 1; // Expected: {'sum': 8, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011; b = 1100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             8, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100; b = 1011; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0100; b = 1011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010; b = 1011; cin = 0; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1010; b = 1011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001; b = 1110; cin = 1; // Expected: {'sum': 8, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1001; b = 1110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             8, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
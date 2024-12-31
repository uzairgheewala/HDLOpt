
`timescale 1ns / 1ps

module tb_carry_skip_adder;

// Inputs

reg  [2:0] a;

reg  [2:0] b;

reg   cin;


// Outputs

wire  [2:0] sum;

wire   cout;


// Instantiate the Unit Under Test (UUT)
carry_skip_adder uut #( 4,3 ) (
    
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
    
    a = 111; b = 110; cin = 1; // Expected: {'sum': 6, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111; b = 110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             6, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010; b = 001; cin = 1; // Expected: {'sum': 4, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010; b = 001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             4, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100; b = 010; cin = 1; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100; b = 010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 011; cin = 0; // Expected: {'sum': 3, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             3, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 101; cin = 0; // Expected: {'sum': 5, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             5, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001; b = 011; cin = 1; // Expected: {'sum': 5, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001; b = 011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             5, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111; b = 001; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111; b = 001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 100; cin = 0; // Expected: {'sum': 4, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             4, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111; b = 000; cin = 0; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 111; b = 000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 110; cin = 1; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010; b = 100; cin = 0; // Expected: {'sum': 6, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010; b = 100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             6, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100; b = 100; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100; b = 100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010; b = 101; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 010; b = 101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001; b = 001; cin = 0; // Expected: {'sum': 2, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001; b = 001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             2, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111; b = 100; cin = 0; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111; b = 100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111; b = 101; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111; b = 101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110; b = 011; cin = 1; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110; b = 011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011; b = 011; cin = 1; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011; b = 011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110; b = 000; cin = 0; // Expected: {'sum': 6, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 110; b = 000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             6, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 000; cin = 0; // Expected: {'sum': 0, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             0, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111; b = 000; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111; b = 000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011; b = 100; cin = 0; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011; b = 100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101; b = 110; cin = 0; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101; b = 110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111; b = 101; cin = 0; // Expected: {'sum': 4, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111; b = 101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             4, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 000; cin = 1; // Expected: {'sum': 1, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             1, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010; b = 101; cin = 0; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010; b = 101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100; b = 010; cin = 0; // Expected: {'sum': 6, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100; b = 010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             6, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001; b = 000; cin = 1; // Expected: {'sum': 2, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001; b = 000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             2, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101; b = 010; cin = 0; // Expected: {'sum': 7, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 101; b = 010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             7, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 010; cin = 0; // Expected: {'sum': 2, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             2, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111; b = 011; cin = 1; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111; b = 011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100; b = 111; cin = 1; // Expected: {'sum': 4, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100; b = 111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             4, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001; b = 001; cin = 1; // Expected: {'sum': 3, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 001; b = 001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             3, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 110; cin = 0; // Expected: {'sum': 6, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             6, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110; b = 101; cin = 1; // Expected: {'sum': 4, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110; b = 101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             4, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011; b = 001; cin = 0; // Expected: {'sum': 4, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011; b = 001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             4, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100; b = 100; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100; b = 100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 111; b = 010; cin = 1; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 111; b = 010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 010; b = 010; cin = 0; // Expected: {'sum': 4, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 010; b = 010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             4, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011; b = 101; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 011; b = 101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100; b = 110; cin = 0; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 100; b = 110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 001; b = 111; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 001; b = 111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 100; b = 001; cin = 0; // Expected: {'sum': 5, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 100; b = 001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             5, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 101; cin = 1; // Expected: {'sum': 6, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             6, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 101; b = 100; cin = 1; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 101; b = 100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 110; b = 110; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 110; b = 110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011; b = 111; cin = 1; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 011; b = 111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 011; b = 010; cin = 0; // Expected: {'sum': 5, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 011; b = 010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             5, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 000; b = 001; cin = 0; // Expected: {'sum': 1, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 000; b = 001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             1, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
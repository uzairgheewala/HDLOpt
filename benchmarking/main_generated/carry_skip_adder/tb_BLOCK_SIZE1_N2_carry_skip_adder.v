
`timescale 1ns / 1ps

module tb_carry_skip_adder;

// Inputs

reg  [1:0] a;

reg  [1:0] b;

reg   cin;


// Outputs

wire  [1:0] sum;

wire   cout;


// Instantiate the Unit Under Test (UUT)
carry_skip_adder uut #( 1,2 ) (
    
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
    
    a = 00; b = 01; cin = 1; // Expected: {'sum': 2, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00; b = 01; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             2, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01; b = 01; cin = 1; // Expected: {'sum': 3, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01; b = 01; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             3, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01; b = 10; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01; b = 10; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10; b = 01; cin = 0; // Expected: {'sum': 3, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10; b = 01; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             3, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00; b = 11; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 00; b = 11; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01; b = 11; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01; b = 11; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10; b = 00; cin = 0; // Expected: {'sum': 2, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10; b = 00; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             2, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11; b = 11; cin = 1; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11; b = 11; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10; b = 10; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10; b = 10; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00; b = 00; cin = 0; // Expected: {'sum': 0, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00; b = 00; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             0, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01; b = 11; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01; b = 11; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11; b = 10; cin = 1; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11; b = 10; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11; b = 01; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11; b = 01; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10; b = 10; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10; b = 10; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01; b = 10; cin = 0; // Expected: {'sum': 3, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01; b = 10; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             3, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01; b = 00; cin = 1; // Expected: {'sum': 2, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01; b = 00; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             2, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10; b = 01; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10; b = 01; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10; b = 11; cin = 1; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10; b = 11; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01; b = 00; cin = 0; // Expected: {'sum': 1, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01; b = 00; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             1, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00; b = 10; cin = 0; // Expected: {'sum': 2, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00; b = 10; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             2, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00; b = 10; cin = 1; // Expected: {'sum': 3, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00; b = 10; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             3, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00; b = 00; cin = 1; // Expected: {'sum': 1, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00; b = 00; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             1, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11; b = 11; cin = 0; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11; b = 11; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10; b = 00; cin = 1; // Expected: {'sum': 3, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10; b = 00; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             3, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11; b = 00; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11; b = 00; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10; b = 11; cin = 0; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10; b = 11; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00; b = 01; cin = 0; // Expected: {'sum': 1, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00; b = 01; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             1, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01; b = 01; cin = 0; // Expected: {'sum': 2, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01; b = 01; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             2, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11; b = 01; cin = 0; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11; b = 01; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11; b = 10; cin = 0; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11; b = 10; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00; b = 11; cin = 0; // Expected: {'sum': 3, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00; b = 11; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             3, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11; b = 00; cin = 0; // Expected: {'sum': 3, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 11; b = 00; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             3, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
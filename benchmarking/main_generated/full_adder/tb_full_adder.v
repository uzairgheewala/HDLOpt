
`timescale 1ns / 1ps

module tb_full_adder;

// Inputs

reg   a;

reg   b;

reg   cin;


// Outputs

wire   sum;

wire   cout;


// Instantiate the Unit Under Test (UUT)
full_adder uut (
    
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

    // Add stimulus here
    
    a = 1; b = 1; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1; b = 1; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1; b = 0; cin = 0; // Expected: {'sum': 1, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1; b = 0; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             1, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0; b = 0; cin = 0; // Expected: {'sum': 0, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0; b = 0; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             0, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1; b = 1; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1; b = 1; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1; b = 1; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1; b = 1; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1; b = 0; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1; b = 0; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0; b = 1; cin = 0; // Expected: {'sum': 1, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0; b = 1; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             1, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0; b = 1; cin = 0; // Expected: {'sum': 1, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0; b = 1; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             1, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
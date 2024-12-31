
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
carry_skip_adder uut #( 4,7 ) (
    
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
    
    a = 0100001; b = 1101111; cin = 0; // Expected: {'sum': 16, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0100001; b = 1101111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             16, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111101; b = 1110101; cin = 0; // Expected: {'sum': 114, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111101; b = 1110101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             114, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000111; b = 0100001; cin = 1; // Expected: {'sum': 41, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000111; b = 0100001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             41, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000001; b = 1010110; cin = 0; // Expected: {'sum': 23, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000001; b = 1010110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             23, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111010; b = 1100110; cin = 0; // Expected: {'sum': 96, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111010; b = 1100110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             96, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110011; b = 0101110; cin = 1; // Expected: {'sum': 98, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0110011; b = 0101110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             98, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011001; b = 1010001; cin = 1; // Expected: {'sum': 107, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011001; b = 1010001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             107, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100011; b = 0111011; cin = 1; // Expected: {'sum': 31, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100011; b = 0111011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             31, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101001; b = 0000110; cin = 0; // Expected: {'sum': 111, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1101001; b = 0000110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             111, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011101; b = 0100010; cin = 1; // Expected: {'sum': 64, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011101; b = 0100010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             64, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000110; b = 0001100; cin = 0; // Expected: {'sum': 82, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1000110; b = 0001100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             82, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110111; b = 1101000; cin = 0; // Expected: {'sum': 31, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0110111; b = 1101000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             31, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111011; b = 1011001; cin = 1; // Expected: {'sum': 21, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0111011; b = 1011001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             21, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010010; b = 0000001; cin = 0; // Expected: {'sum': 19, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010010; b = 0000001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             19, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101111; b = 0010100; cin = 0; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1101111; b = 0010100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100010; b = 1100010; cin = 0; // Expected: {'sum': 68, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100010; b = 1100010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             68, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100101; b = 1110100; cin = 0; // Expected: {'sum': 25, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0100101; b = 1110100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             25, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000011; b = 1000000; cin = 0; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000011; b = 1000000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011101; b = 1100011; cin = 1; // Expected: {'sum': 1, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0011101; b = 1100011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             1, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111110; b = 0000000; cin = 0; // Expected: {'sum': 126, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1111110; b = 0000000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             126, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000011; b = 1010100; cin = 0; // Expected: {'sum': 87, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000011; b = 1010100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             87, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011110; b = 0000101; cin = 0; // Expected: {'sum': 35, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011110; b = 0000101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             35, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001000; b = 1011011; cin = 0; // Expected: {'sum': 35, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1001000; b = 1011011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             35, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101100; b = 0000101; cin = 0; // Expected: {'sum': 49, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101100; b = 0000101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             49, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111110; b = 1000111; cin = 0; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0111110; b = 1000111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001000; b = 0111110; cin = 1; // Expected: {'sum': 71, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001000; b = 0111110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             71, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010011; b = 1100000; cin = 0; // Expected: {'sum': 51, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1010011; b = 1100000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             51, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010001; b = 0100011; cin = 1; // Expected: {'sum': 117, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1010001; b = 0100011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             117, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011001; b = 0111100; cin = 0; // Expected: {'sum': 21, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011001; b = 0111100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             21, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101111; b = 0101101; cin = 0; // Expected: {'sum': 92, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101111; b = 0101101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             92, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101001; b = 0111001; cin = 1; // Expected: {'sum': 35, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1101001; b = 0111001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             35, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111000; b = 1000101; cin = 0; // Expected: {'sum': 125, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0111000; b = 1000101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             125, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001101; b = 1001110; cin = 0; // Expected: {'sum': 91, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001101; b = 1001110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             91, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100010; b = 0001010; cin = 1; // Expected: {'sum': 45, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100010; b = 0001010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             45, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100110; b = 1000110; cin = 1; // Expected: {'sum': 45, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100110; b = 1000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             45, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010111; b = 1101110; cin = 0; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0010111; b = 1101110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010000; b = 0101000; cin = 1; // Expected: {'sum': 57, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010000; b = 0101000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             57, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000110; b = 1011010; cin = 0; // Expected: {'sum': 96, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000110; b = 1011010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             96, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111111; b = 1001001; cin = 1; // Expected: {'sum': 73, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111111; b = 1001001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             73, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100100; b = 0111011; cin = 0; // Expected: {'sum': 95, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100100; b = 0111011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             95, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000000; b = 1001111; cin = 1; // Expected: {'sum': 80, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000000; b = 1001111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             80, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010010; b = 1101000; cin = 0; // Expected: {'sum': 58, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1010010; b = 1101000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             58, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111101; b = 0111000; cin = 0; // Expected: {'sum': 117, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0111101; b = 0111000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             117, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010110; b = 1100111; cin = 1; // Expected: {'sum': 126, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010110; b = 1100111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             126, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100001; b = 1100111; cin = 0; // Expected: {'sum': 8, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0100001; b = 1100111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             8, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111101; b = 1100010; cin = 1; // Expected: {'sum': 32, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0111101; b = 1100010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             32, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0010001; b = 1000010; cin = 1; // Expected: {'sum': 84, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0010001; b = 1000010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             84, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000000; b = 0010101; cin = 0; // Expected: {'sum': 21, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000000; b = 0010101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             21, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011001; b = 0000010; cin = 0; // Expected: {'sum': 91, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1011001; b = 0000010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             91, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
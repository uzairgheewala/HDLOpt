
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
carry_skip_adder uut #( 1,7 ) (
    
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
    
    a = 1000100; b = 0010001; cin = 1; // Expected: {'sum': 86, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1000100; b = 0010001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             86, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011111; b = 1111011; cin = 0; // Expected: {'sum': 26, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0011111; b = 1111011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             26, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001101; b = 1001110; cin = 1; // Expected: {'sum': 92, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001101; b = 1001110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             92, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011101; b = 1100111; cin = 1; // Expected: {'sum': 69, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011101; b = 1100111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             69, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101111; b = 1000110; cin = 0; // Expected: {'sum': 53, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1101111; b = 1000110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             53, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101000; b = 0011010; cin = 1; // Expected: {'sum': 67, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0101000; b = 0011010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             67, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001001; b = 0010111; cin = 1; // Expected: {'sum': 97, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1001001; b = 0010111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             97, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010001; b = 1000001; cin = 0; // Expected: {'sum': 18, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1010001; b = 1000001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             18, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001000; b = 0100010; cin = 0; // Expected: {'sum': 42, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001000; b = 0100010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             42, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110001; b = 1000100; cin = 1; // Expected: {'sum': 54, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110001; b = 1000100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             54, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110111; b = 0100111; cin = 0; // Expected: {'sum': 94, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0110111; b = 0100111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             94, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011110; b = 1101010; cin = 0; // Expected: {'sum': 72, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011110; b = 1101010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             72, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100100; b = 1001010; cin = 0; // Expected: {'sum': 46, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100100; b = 1001010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             46, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101010; b = 0001100; cin = 1; // Expected: {'sum': 119, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1101010; b = 0001100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             119, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101000; b = 1011100; cin = 0; // Expected: {'sum': 4, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0101000; b = 1011100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             4, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100010; b = 0000111; cin = 1; // Expected: {'sum': 106, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1100010; b = 0000111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             106, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011111; b = 1110000; cin = 0; // Expected: {'sum': 79, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011111; b = 1110000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             79, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001111; b = 1100010; cin = 1; // Expected: {'sum': 114, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001111; b = 1100010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             114, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110001; b = 0011000; cin = 1; // Expected: {'sum': 74, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0110001; b = 0011000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             74, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011110; b = 0000111; cin = 0; // Expected: {'sum': 37, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011110; b = 0000111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             37, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111110; b = 0101011; cin = 1; // Expected: {'sum': 42, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111110; b = 0101011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             42, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1100000; b = 1101011; cin = 1; // Expected: {'sum': 76, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1100000; b = 1101011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             76, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111100; b = 0011010; cin = 1; // Expected: {'sum': 87, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0111100; b = 0011010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             87, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101011; b = 0011111; cin = 1; // Expected: {'sum': 11, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1101011; b = 0011111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             11, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011111; b = 1101011; cin = 0; // Expected: {'sum': 10, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0011111; b = 1101011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             10, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0101010; b = 1011011; cin = 1; // Expected: {'sum': 6, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0101010; b = 1011011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             6, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110101; b = 1001010; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0110101; b = 1001010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100111; b = 0010011; cin = 1; // Expected: {'sum': 59, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100111; b = 0010011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             59, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0100110; b = 1011001; cin = 0; // Expected: {'sum': 127, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0100110; b = 1011001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             127, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1101000; b = 1100011; cin = 0; // Expected: {'sum': 75, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1101000; b = 1100011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             75, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1000101; b = 1110001; cin = 0; // Expected: {'sum': 54, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1000101; b = 1110001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             54, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110100; b = 0001011; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110100; b = 0001011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1001001; b = 0011010; cin = 0; // Expected: {'sum': 99, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1001001; b = 0011010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             99, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111101; b = 0000110; cin = 0; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111101; b = 0000110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011001; b = 0001100; cin = 0; // Expected: {'sum': 101, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1011001; b = 0001100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             101, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011101; b = 1000000; cin = 1; // Expected: {'sum': 30, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1011101; b = 1000000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             30, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011000; b = 1001010; cin = 0; // Expected: {'sum': 98, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011000; b = 1001010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             98, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1010001; b = 0111110; cin = 0; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1010001; b = 0111110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110100; b = 0110111; cin = 1; // Expected: {'sum': 44, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110100; b = 0110111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             44, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1011010; b = 0000100; cin = 1; // Expected: {'sum': 95, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 1011010; b = 0000100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             95, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000101; b = 1000110; cin = 0; // Expected: {'sum': 75, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000101; b = 1000110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             75, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0000000; b = 0110011; cin = 1; // Expected: {'sum': 52, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0000000; b = 0110011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             52, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0110111; b = 0111010; cin = 0; // Expected: {'sum': 113, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0110111; b = 0111010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             113, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011111; b = 0000110; cin = 1; // Expected: {'sum': 38, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011111; b = 0000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             38, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1110111; b = 0011001; cin = 1; // Expected: {'sum': 17, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1110111; b = 0011001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             17, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0111000; b = 1101100; cin = 1; // Expected: {'sum': 37, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 0111000; b = 1101100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             37, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 1111010; b = 1001011; cin = 0; // Expected: {'sum': 69, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 1111010; b = 1001011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             69, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0001000; b = 0010101; cin = 0; // Expected: {'sum': 29, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0001000; b = 0010101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             29, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 0011110; b = 0110000; cin = 1; // Expected: {'sum': 79, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 0011110; b = 0110000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             79, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
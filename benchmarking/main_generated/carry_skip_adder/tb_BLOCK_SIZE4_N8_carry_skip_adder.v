
`timescale 1ns / 1ps

module tb_carry_skip_adder;

// Inputs

reg  [7:0] a;

reg  [7:0] b;

reg   cin;


// Outputs

wire  [7:0] sum;

wire   cout;


// Instantiate the Unit Under Test (UUT)
carry_skip_adder uut #( 4,8 ) (
    
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
    
    a = 00000110; b = 10001001; cin = 1; // Expected: {'sum': 144, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00000110; b = 10001001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             144, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11001111; b = 01100011; cin = 1; // Expected: {'sum': 51, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11001111; b = 01100011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             51, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10110011; b = 01001000; cin = 1; // Expected: {'sum': 252, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10110011; b = 01001000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             252, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111001; b = 10010101; cin = 1; // Expected: {'sum': 15, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01111001; b = 10010101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             15, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10000010; b = 10110110; cin = 0; // Expected: {'sum': 56, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10000010; b = 10110110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             56, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10011110; b = 11101010; cin = 0; // Expected: {'sum': 136, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10011110; b = 11101010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             136, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00101000; b = 11001100; cin = 1; // Expected: {'sum': 245, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00101000; b = 11001100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             245, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011010; b = 00010010; cin = 1; // Expected: {'sum': 237, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 11011010; b = 00010010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             237, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001001; b = 11011111; cin = 0; // Expected: {'sum': 104, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10001001; b = 11011111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             104, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00101011; b = 00010010; cin = 1; // Expected: {'sum': 62, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00101011; b = 00010010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             62, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01100001; b = 01100010; cin = 1; // Expected: {'sum': 196, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01100001; b = 01100010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             196, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00111101; b = 10000011; cin = 0; // Expected: {'sum': 192, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00111101; b = 10000011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             192, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10000011; b = 01110011; cin = 0; // Expected: {'sum': 246, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10000011; b = 01110011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             246, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00111111; b = 10011101; cin = 0; // Expected: {'sum': 220, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00111111; b = 10011101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             220, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110111; b = 10011000; cin = 1; // Expected: {'sum': 16, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01110111; b = 10011000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             16, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00110000; b = 10000000; cin = 0; // Expected: {'sum': 176, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00110000; b = 10000000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             176, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00100010; b = 10101011; cin = 1; // Expected: {'sum': 206, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00100010; b = 10101011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             206, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11111010; b = 10010010; cin = 0; // Expected: {'sum': 140, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11111010; b = 10010010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             140, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11010000; b = 11001011; cin = 1; // Expected: {'sum': 156, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11010000; b = 11001011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             156, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11110100; b = 00000010; cin = 1; // Expected: {'sum': 247, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 11110100; b = 00000010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             247, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10101100; b = 11100110; cin = 1; // Expected: {'sum': 147, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10101100; b = 11100110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             147, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00000001; b = 00101101; cin = 0; // Expected: {'sum': 46, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00000001; b = 00101101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             46, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10011101; b = 01011011; cin = 0; // Expected: {'sum': 248, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10011101; b = 01011011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             248, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011001; b = 00101100; cin = 0; // Expected: {'sum': 69, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00011001; b = 00101100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             69, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011011; b = 01011011; cin = 1; // Expected: {'sum': 55, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11011011; b = 01011011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             55, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10000011; b = 01100110; cin = 0; // Expected: {'sum': 233, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10000011; b = 01100110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             233, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10100110; b = 10101100; cin = 1; // Expected: {'sum': 83, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10100110; b = 10101100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             83, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011010; b = 11011110; cin = 0; // Expected: {'sum': 248, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00011010; b = 11011110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             248, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01001001; b = 10111001; cin = 1; // Expected: {'sum': 3, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01001001; b = 10111001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             3, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11000000; b = 00001100; cin = 1; // Expected: {'sum': 205, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 11000000; b = 00001100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             205, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11101000; b = 00100000; cin = 1; // Expected: {'sum': 9, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11101000; b = 00100000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             9, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10010111; b = 00010010; cin = 1; // Expected: {'sum': 170, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10010111; b = 00010010; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             170, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10111100; b = 00110000; cin = 0; // Expected: {'sum': 236, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10111100; b = 00110000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             236, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00010000; b = 10110010; cin = 0; // Expected: {'sum': 194, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00010000; b = 10110010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             194, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00101100; b = 01111010; cin = 0; // Expected: {'sum': 166, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00101100; b = 01111010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             166, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01100100; b = 11010101; cin = 0; // Expected: {'sum': 57, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01100100; b = 11010101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             57, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00111001; b = 01010100; cin = 0; // Expected: {'sum': 141, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00111001; b = 01010100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             141, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11101110; b = 11110111; cin = 0; // Expected: {'sum': 229, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11101110; b = 11110111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             229, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11111010; b = 01110001; cin = 1; // Expected: {'sum': 108, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11111010; b = 01110001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             108, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011010; b = 10111001; cin = 1; // Expected: {'sum': 148, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11011010; b = 10111001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             148, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001100; b = 10001111; cin = 0; // Expected: {'sum': 27, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10001100; b = 10001111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             27, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00101101; b = 01101001; cin = 1; // Expected: {'sum': 151, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00101101; b = 01101001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             151, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110100; b = 00010111; cin = 0; // Expected: {'sum': 139, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01110100; b = 00010111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             139, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10100001; b = 01010000; cin = 0; // Expected: {'sum': 241, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10100001; b = 01010000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             241, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00101010; b = 10111110; cin = 0; // Expected: {'sum': 232, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00101010; b = 10111110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             232, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00010000; b = 01101111; cin = 1; // Expected: {'sum': 128, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00010000; b = 01101111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             128, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11001111; b = 01010110; cin = 1; // Expected: {'sum': 38, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11001111; b = 01010110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             38, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00111100; b = 00000101; cin = 0; // Expected: {'sum': 65, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00111100; b = 00000101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             65, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011101; b = 01100101; cin = 0; // Expected: {'sum': 130, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00011101; b = 01100101; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             130, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
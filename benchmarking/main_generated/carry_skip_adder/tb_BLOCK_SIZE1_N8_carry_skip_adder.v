
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
carry_skip_adder uut #( 1,8 ) (
    
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
    
    a = 01110001; b = 01100010; cin = 0; // Expected: {'sum': 211, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01110001; b = 01100010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             0,
             sum, cout, 
             211, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001001; b = 00111001; cin = 1; // Expected: {'sum': 195, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10001001; b = 00111001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             1,
             sum, cout, 
             195, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01011101; b = 01010111; cin = 1; // Expected: {'sum': 181, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01011101; b = 01010111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             2,
             sum, cout, 
             181, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000010; b = 11111001; cin = 0; // Expected: {'sum': 59, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01000010; b = 11111001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             3,
             sum, cout, 
             59, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10110000; b = 10101000; cin = 1; // Expected: {'sum': 89, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10110000; b = 10101000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             4,
             sum, cout, 
             89, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10000001; b = 11000111; cin = 0; // Expected: {'sum': 72, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10000001; b = 11000111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             5,
             sum, cout, 
             72, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01100101; b = 10101111; cin = 0; // Expected: {'sum': 20, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01100101; b = 10101111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             6,
             sum, cout, 
             20, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00011111; b = 01100111; cin = 1; // Expected: {'sum': 135, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00011111; b = 01100111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             7,
             sum, cout, 
             135, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00101110; b = 10111000; cin = 1; // Expected: {'sum': 231, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00101110; b = 10111000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             8,
             sum, cout, 
             231, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10100100; b = 10010000; cin = 1; // Expected: {'sum': 53, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10100100; b = 10010000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             9,
             sum, cout, 
             53, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000011; b = 11000001; cin = 1; // Expected: {'sum': 5, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01000011; b = 11000001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             10,
             sum, cout, 
             5, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000111; b = 00010110; cin = 0; // Expected: {'sum': 93, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01000111; b = 00010110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             11,
             sum, cout, 
             93, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001100; b = 00100000; cin = 0; // Expected: {'sum': 172, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10001100; b = 00100000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             12,
             sum, cout, 
             172, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01010100; b = 10100010; cin = 0; // Expected: {'sum': 246, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01010100; b = 10100010; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             13,
             sum, cout, 
             246, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00100110; b = 01011001; cin = 1; // Expected: {'sum': 128, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00100110; b = 01011001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             14,
             sum, cout, 
             128, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10010101; b = 00000110; cin = 1; // Expected: {'sum': 156, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10010101; b = 00000110; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             15,
             sum, cout, 
             156, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00100010; b = 00101000; cin = 1; // Expected: {'sum': 75, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00100010; b = 00101000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             16,
             sum, cout, 
             75, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00001000; b = 01100001; cin = 1; // Expected: {'sum': 106, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00001000; b = 01100001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             17,
             sum, cout, 
             106, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01110010; b = 10111000; cin = 0; // Expected: {'sum': 42, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01110010; b = 10111000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             18,
             sum, cout, 
             42, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11010000; b = 01010001; cin = 1; // Expected: {'sum': 34, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11010000; b = 01010001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             19,
             sum, cout, 
             34, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11110001; b = 11001001; cin = 1; // Expected: {'sum': 187, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11110001; b = 11001001; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             20,
             sum, cout, 
             187, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11110000; b = 00100101; cin = 1; // Expected: {'sum': 22, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11110000; b = 00100101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             21,
             sum, cout, 
             22, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10000111; b = 10010011; cin = 1; // Expected: {'sum': 27, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10000111; b = 10010011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             22,
             sum, cout, 
             27, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00111001; b = 01000000; cin = 1; // Expected: {'sum': 122, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00111001; b = 01000000; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             23,
             sum, cout, 
             122, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01100001; b = 10100101; cin = 1; // Expected: {'sum': 7, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01100001; b = 10100101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             24,
             sum, cout, 
             7, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01100001; b = 11100100; cin = 0; // Expected: {'sum': 69, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01100001; b = 11100100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             25,
             sum, cout, 
             69, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111111; b = 10111011; cin = 0; // Expected: {'sum': 58, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01111111; b = 10111011; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             26,
             sum, cout, 
             58, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11110010; b = 00101110; cin = 0; // Expected: {'sum': 32, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11110010; b = 00101110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             27,
             sum, cout, 
             32, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10011100; b = 00011111; cin = 1; // Expected: {'sum': 188, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10011100; b = 00011111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             28,
             sum, cout, 
             188, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11001010; b = 00111000; cin = 0; // Expected: {'sum': 2, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11001010; b = 00111000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             29,
             sum, cout, 
             2, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01011100; b = 11010100; cin = 1; // Expected: {'sum': 49, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 01011100; b = 11010100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             30,
             sum, cout, 
             49, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11011101; b = 11110110; cin = 0; // Expected: {'sum': 211, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11011101; b = 11110110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             31,
             sum, cout, 
             211, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11000111; b = 01100110; cin = 0; // Expected: {'sum': 45, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11000111; b = 01100110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             32,
             sum, cout, 
             45, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00001001; b = 00110100; cin = 0; // Expected: {'sum': 61, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00001001; b = 00110100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             33,
             sum, cout, 
             61, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00000000; b = 01011100; cin = 1; // Expected: {'sum': 93, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00000000; b = 01011100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             34,
             sum, cout, 
             93, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 00001111; b = 10001111; cin = 0; // Expected: {'sum': 158, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 00001111; b = 10001111; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             35,
             sum, cout, 
             158, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01000011; b = 10010011; cin = 1; // Expected: {'sum': 215, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01000011; b = 10010011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             36,
             sum, cout, 
             215, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10010010; b = 00100111; cin = 1; // Expected: {'sum': 186, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10010010; b = 00100111; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             37,
             sum, cout, 
             186, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11010100; b = 10000110; cin = 0; // Expected: {'sum': 90, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11010100; b = 10000110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             38,
             sum, cout, 
             90, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10111111; b = 10010001; cin = 0; // Expected: {'sum': 80, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10111111; b = 10010001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             39,
             sum, cout, 
             80, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001101; b = 11101101; cin = 1; // Expected: {'sum': 123, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10001101; b = 11101101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             40,
             sum, cout, 
             123, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10100011; b = 00101100; cin = 0; // Expected: {'sum': 207, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10100011; b = 00101100; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             41,
             sum, cout, 
             207, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 11001011; b = 01100110; cin = 0; // Expected: {'sum': 49, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 11001011; b = 01100110; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             42,
             sum, cout, 
             49, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10101011; b = 01010100; cin = 1; // Expected: {'sum': 0, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10101011; b = 01010100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             43,
             sum, cout, 
             0, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01001110; b = 00110000; cin = 0; // Expected: {'sum': 126, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01001110; b = 00110000; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             44,
             sum, cout, 
             126, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10110010; b = 11111100; cin = 1; // Expected: {'sum': 175, 'cout': 1}
    #10;
    $display("Test %0d: Inputs: a = 10110010; b = 11111100; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             45,
             sum, cout, 
             175, 1);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 10001100; b = 01100101; cin = 1; // Expected: {'sum': 242, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 10001100; b = 01100101; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             46,
             sum, cout, 
             242, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01011010; b = 10000011; cin = 1; // Expected: {'sum': 222, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01011010; b = 10000011; cin = 1; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             47,
             sum, cout, 
             222, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    a = 01111010; b = 01011001; cin = 0; // Expected: {'sum': 211, 'cout': 0}
    #10;
    $display("Test %0d: Inputs: a = 01111010; b = 01011001; cin = 0; | Outputs: sum=%b cout=%b | Expected: sum=%d cout=%d", 
             48,
             sum, cout, 
             211, 0);
    $timeformat(-9, 1, " ns", 6);
    $display("Simulation time: %t", $time);
    
    $finish;
end
  
endmodule
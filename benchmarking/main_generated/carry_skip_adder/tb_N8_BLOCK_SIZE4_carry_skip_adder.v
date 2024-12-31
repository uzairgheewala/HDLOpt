
`timescale 1ns / 1ps

module tb_N8_BLOCK_SIZE4_carry_skip_adder;

    // Parameters
    
    parameter N = 8;
    
    parameter BLOCK_SIZE = 4;
    
     
    // Inputs
    
    reg  [7:0] a;
    
    reg  [7:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [7:0] sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    carry_skip_adder  #( N,BLOCK_SIZE ) uut (
        
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
        
        a = 8'b01110001; b = 8'b11001110; cin = 1'b1; // Expected: {'sum': 64, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110001; b = 8'b11001110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 64, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011100; b = 8'b11111010; cin = 1'b0; // Expected: {'sum': 214, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011100; b = 8'b11111010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 214, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010010; b = 8'b00001011; cin = 1'b0; // Expected: {'sum': 157, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010010; b = 8'b00001011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 157, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100101; b = 8'b00101111; cin = 1'b0; // Expected: {'sum': 20, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100101; b = 8'b00101111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 20, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110011; b = 8'b01110010; cin = 1'b1; // Expected: {'sum': 166, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110011; b = 8'b01110010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 166, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111110; b = 8'b11110011; cin = 1'b0; // Expected: {'sum': 113, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111110; b = 8'b11110011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 113, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001010; b = 8'b10110110; cin = 1'b0; // Expected: {'sum': 64, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001010; b = 8'b10110110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 64, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100110; b = 8'b10100101; cin = 1'b1; // Expected: {'sum': 76, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100110; b = 8'b10100101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 76, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111000; b = 8'b10110001; cin = 1'b1; // Expected: {'sum': 170, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111000; b = 8'b10110001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 170, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100001; b = 8'b01110111; cin = 1'b1; // Expected: {'sum': 89, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100001; b = 8'b01110111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 89, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000110; b = 8'b11111110; cin = 1'b1; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000110; b = 8'b11111110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111111; b = 8'b01101101; cin = 1'b1; // Expected: {'sum': 237, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111111; b = 8'b01101101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 237, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011010; b = 8'b01111010; cin = 1'b1; // Expected: {'sum': 85, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011010; b = 8'b01111010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 85, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100001; b = 8'b01001110; cin = 1'b1; // Expected: {'sum': 240, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100001; b = 8'b01001110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 240, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001101; b = 8'b11110000; cin = 1'b1; // Expected: {'sum': 254, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001101; b = 8'b11110000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 254, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010110; b = 8'b10010011; cin = 1'b1; // Expected: {'sum': 234, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010110; b = 8'b10010011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 234, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011110; b = 8'b01011111; cin = 1'b0; // Expected: {'sum': 253, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011110; b = 8'b01011111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 253, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010010; b = 8'b00100010; cin = 1'b1; // Expected: {'sum': 245, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010010; b = 8'b00100010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 245, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101101; b = 8'b00010111; cin = 1'b0; // Expected: {'sum': 68, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101101; b = 8'b00010111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b00011110; cin = 1'b1; // Expected: {'sum': 153, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b00011110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 153, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100010; b = 8'b01101010; cin = 1'b1; // Expected: {'sum': 13, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100010; b = 8'b01101010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110011; b = 8'b10001010; cin = 1'b1; // Expected: {'sum': 254, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110011; b = 8'b10001010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 254, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110000; b = 8'b01110010; cin = 1'b1; // Expected: {'sum': 163, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110000; b = 8'b01110010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 163, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110000; b = 8'b10110110; cin = 1'b1; // Expected: {'sum': 39, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110000; b = 8'b10110110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 39, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100100; b = 8'b10100110; cin = 1'b0; // Expected: {'sum': 202, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100100; b = 8'b10100110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 202, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000011; b = 8'b01110010; cin = 1'b1; // Expected: {'sum': 118, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000011; b = 8'b01110010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 118, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011010; b = 8'b00010010; cin = 1'b0; // Expected: {'sum': 172, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011010; b = 8'b00010010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 172, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110011; b = 8'b01001011; cin = 1'b1; // Expected: {'sum': 127, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110011; b = 8'b01001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 127, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111111; b = 8'b00000011; cin = 1'b1; // Expected: {'sum': 195, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111111; b = 8'b00000011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 195, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100101; b = 8'b00101011; cin = 1'b1; // Expected: {'sum': 81, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100101; b = 8'b00101011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 81, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010110; b = 8'b01011000; cin = 1'b0; // Expected: {'sum': 110, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010110; b = 8'b01011000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 110, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011111; b = 8'b01101111; cin = 1'b1; // Expected: {'sum': 15, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011111; b = 8'b01101111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010010; b = 8'b11101101; cin = 1'b0; // Expected: {'sum': 63, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010010; b = 8'b11101101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 63, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110110; b = 8'b11101110; cin = 1'b1; // Expected: {'sum': 165, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110110; b = 8'b11101110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 33,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 165, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001011; b = 8'b00100011; cin = 1'b0; // Expected: {'sum': 46, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001011; b = 8'b00100011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 34,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111101; b = 8'b11101110; cin = 1'b0; // Expected: {'sum': 43, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111101; b = 8'b11101110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 35,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 43, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110100; b = 8'b01001100; cin = 1'b0; // Expected: {'sum': 192, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110100; b = 8'b01001100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 36,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 192, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000110; b = 8'b00010010; cin = 1'b0; // Expected: {'sum': 152, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000110; b = 8'b00010010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 37,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 152, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111010; b = 8'b11010011; cin = 1'b0; // Expected: {'sum': 141, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111010; b = 8'b11010011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 38,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 141, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011011; b = 8'b01000111; cin = 1'b0; // Expected: {'sum': 98, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011011; b = 8'b01000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 39,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 98, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000111; b = 8'b10101110; cin = 1'b1; // Expected: {'sum': 54, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000111; b = 8'b10101110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 40,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001011; b = 8'b10000111; cin = 1'b0; // Expected: {'sum': 210, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001011; b = 8'b10000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 41,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 210, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011010; b = 8'b11110110; cin = 1'b1; // Expected: {'sum': 17, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011010; b = 8'b11110110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 42,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 17, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001100; b = 8'b01100011; cin = 1'b0; // Expected: {'sum': 175, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001100; b = 8'b01100011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 43,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 175, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110000; b = 8'b01010011; cin = 1'b0; // Expected: {'sum': 195, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110000; b = 8'b01010011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 44,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 195, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010101; b = 8'b01111011; cin = 1'b0; // Expected: {'sum': 80, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010101; b = 8'b01111011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 45,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 80, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011111; b = 8'b10101011; cin = 1'b0; // Expected: {'sum': 202, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011111; b = 8'b10101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 46,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 202, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111101; b = 8'b00111000; cin = 1'b0; // Expected: {'sum': 53, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111101; b = 8'b00111000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 47,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 53, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000110; b = 8'b01101111; cin = 1'b1; // Expected: {'sum': 118, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000110; b = 8'b01101111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 48,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 118, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111101; b = 8'b10101111; cin = 1'b0; // Expected: {'sum': 108, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111101; b = 8'b10101111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 49,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 108, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111100; b = 8'b01101011; cin = 1'b0; // Expected: {'sum': 39, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111100; b = 8'b01101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 50,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 39, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101111; b = 8'b11101110; cin = 1'b1; // Expected: {'sum': 30, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101111; b = 8'b11101110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 51,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101101; b = 8'b10101100; cin = 1'b1; // Expected: {'sum': 154, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101101; b = 8'b10101100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 52,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 154, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101101; b = 8'b00111001; cin = 1'b0; // Expected: {'sum': 230, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101101; b = 8'b00111001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 53,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 230, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100110; b = 8'b00011110; cin = 1'b0; // Expected: {'sum': 68, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100110; b = 8'b00011110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 54,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 68, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001111; b = 8'b10100111; cin = 1'b1; // Expected: {'sum': 55, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001111; b = 8'b10100111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 55,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 55, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010001; b = 8'b01111011; cin = 1'b0; // Expected: {'sum': 76, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010001; b = 8'b01111011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 56,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 76, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011011; b = 8'b01110011; cin = 1'b0; // Expected: {'sum': 206, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011011; b = 8'b01110011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 57,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 206, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101101; b = 8'b01100011; cin = 1'b1; // Expected: {'sum': 17, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101101; b = 8'b01100011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 58,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 17, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101011; b = 8'b10001001; cin = 1'b0; // Expected: {'sum': 116, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101011; b = 8'b10001001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 59,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 116, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110111; b = 8'b10101000; cin = 1'b1; // Expected: {'sum': 96, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110111; b = 8'b10101000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 60,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 96, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100001; b = 8'b10000111; cin = 1'b0; // Expected: {'sum': 168, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100001; b = 8'b10000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 61,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 168, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011000; b = 8'b01001011; cin = 1'b0; // Expected: {'sum': 227, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011000; b = 8'b01001011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 62,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 227, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101110; b = 8'b00000001; cin = 1'b0; // Expected: {'sum': 47, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101110; b = 8'b00000001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 63,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001100; b = 8'b11000100; cin = 1'b1; // Expected: {'sum': 209, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001100; b = 8'b11000100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 64,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 209, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001111; b = 8'b01000100; cin = 1'b0; // Expected: {'sum': 83, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001111; b = 8'b01000100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 65,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 83, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000001; b = 8'b10001110; cin = 1'b1; // Expected: {'sum': 80, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000001; b = 8'b10001110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 66,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 80, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001111; b = 8'b10001111; cin = 1'b0; // Expected: {'sum': 158, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001111; b = 8'b10001111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 67,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 158, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111111; b = 8'b11110110; cin = 1'b0; // Expected: {'sum': 245, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111111; b = 8'b11110110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 68,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 245, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011110; b = 8'b00110110; cin = 1'b0; // Expected: {'sum': 84, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011110; b = 8'b00110110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 69,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 84, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100001; b = 8'b00100000; cin = 1'b0; // Expected: {'sum': 65, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100001; b = 8'b00100000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 70,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 65, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101101; b = 8'b11011111; cin = 1'b0; // Expected: {'sum': 204, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101101; b = 8'b11011111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 71,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 204, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111110; b = 8'b00010111; cin = 1'b0; // Expected: {'sum': 149, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111110; b = 8'b00010111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 72,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 149, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110110; b = 8'b11101001; cin = 1'b0; // Expected: {'sum': 223, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110110; b = 8'b11101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 73,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 223, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100000; b = 8'b10011001; cin = 1'b1; // Expected: {'sum': 122, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100000; b = 8'b10011001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 74,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 122, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110001; b = 8'b01001100; cin = 1'b1; // Expected: {'sum': 62, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110001; b = 8'b01001100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 75,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 62, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000000; b = 8'b01100100; cin = 1'b0; // Expected: {'sum': 164, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000000; b = 8'b01100100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 76,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 164, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011011; b = 8'b01010101; cin = 1'b1; // Expected: {'sum': 177, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011011; b = 8'b01010101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 77,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 177, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010111; b = 8'b01011111; cin = 1'b0; // Expected: {'sum': 54, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010111; b = 8'b01011111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 78,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010111; b = 8'b00110001; cin = 1'b0; // Expected: {'sum': 200, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010111; b = 8'b00110001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 79,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 200, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100100; b = 8'b00111111; cin = 1'b1; // Expected: {'sum': 228, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100100; b = 8'b00111111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 80,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 228, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110100; b = 8'b11101000; cin = 1'b0; // Expected: {'sum': 156, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110100; b = 8'b11101000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 81,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 156, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001011; b = 8'b00010001; cin = 1'b0; // Expected: {'sum': 28, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001011; b = 8'b00010001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 82,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 28, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101100; b = 8'b11001100; cin = 1'b0; // Expected: {'sum': 248, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101100; b = 8'b11001100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 83,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 248, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011101; b = 8'b01001011; cin = 1'b1; // Expected: {'sum': 169, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011101; b = 8'b01001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 84,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 169, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100010; b = 8'b00111010; cin = 1'b0; // Expected: {'sum': 220, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100010; b = 8'b00111010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 85,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011001; b = 8'b10111000; cin = 1'b0; // Expected: {'sum': 17, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011001; b = 8'b10111000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 86,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 17, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011000; b = 8'b00100000; cin = 1'b1; // Expected: {'sum': 121, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011000; b = 8'b00100000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 87,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 121, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011101; b = 8'b01000010; cin = 1'b0; // Expected: {'sum': 95, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011101; b = 8'b01000010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 88,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000011; b = 8'b10110110; cin = 1'b0; // Expected: {'sum': 185, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000011; b = 8'b10110110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 89,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 185, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010000; b = 8'b01100000; cin = 1'b0; // Expected: {'sum': 48, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010000; b = 8'b01100000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 90,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 48, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110001; b = 8'b01111111; cin = 1'b0; // Expected: {'sum': 112, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110001; b = 8'b01111111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 91,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 112, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110011; b = 8'b10000111; cin = 1'b0; // Expected: {'sum': 250, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110011; b = 8'b10000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 92,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 250, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101000; b = 8'b11100101; cin = 1'b1; // Expected: {'sum': 206, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101000; b = 8'b11100101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 93,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 206, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001000; b = 8'b11001110; cin = 1'b0; // Expected: {'sum': 150, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001000; b = 8'b11001110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 94,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 150, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101000; b = 8'b10010001; cin = 1'b1; // Expected: {'sum': 122, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101000; b = 8'b10010001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 95,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 122, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000111; b = 8'b10000001; cin = 1'b0; // Expected: {'sum': 136, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000111; b = 8'b10000001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 96,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 136, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001101; b = 8'b10101000; cin = 1'b0; // Expected: {'sum': 117, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001101; b = 8'b10101000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 97,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 117, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011111; b = 8'b00001111; cin = 1'b0; // Expected: {'sum': 46, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011111; b = 8'b00001111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 98,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011111; b = 8'b01111010; cin = 1'b0; // Expected: {'sum': 25, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011111; b = 8'b01111010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 99,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111101; b = 8'b01101011; cin = 1'b0; // Expected: {'sum': 232, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111101; b = 8'b01101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 100,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 232, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000101; b = 8'b11010101; cin = 1'b0; // Expected: {'sum': 218, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000101; b = 8'b11010101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 101,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 218, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b00011010; cin = 1'b0; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b00011010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 102,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010010; b = 8'b01000011; cin = 1'b1; // Expected: {'sum': 214, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010010; b = 8'b01000011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 103,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 214, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101110; b = 8'b00000101; cin = 1'b1; // Expected: {'sum': 116, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101110; b = 8'b00000101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 104,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 116, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001000; b = 8'b01010110; cin = 1'b0; // Expected: {'sum': 30, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001000; b = 8'b01010110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 105,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b01010110; cin = 1'b0; // Expected: {'sum': 63, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b01010110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 106,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 63, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011110; b = 8'b01000110; cin = 1'b0; // Expected: {'sum': 228, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011110; b = 8'b01000110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 107,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 228, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010000; b = 8'b10101101; cin = 1'b0; // Expected: {'sum': 189, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010000; b = 8'b10101101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 108,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 189, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111111; b = 8'b10100010; cin = 1'b1; // Expected: {'sum': 34, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111111; b = 8'b10100010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 109,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 34, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001101; b = 8'b00001011; cin = 1'b1; // Expected: {'sum': 25, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001101; b = 8'b00001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 110,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010111; b = 8'b01100111; cin = 1'b1; // Expected: {'sum': 255, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010111; b = 8'b01100111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 111,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 255, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100000; b = 8'b11100111; cin = 1'b1; // Expected: {'sum': 72, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100000; b = 8'b11100111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 112,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 72, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b11000011; cin = 1'b1; // Expected: {'sum': 62, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b11000011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 113,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 62, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100000; b = 8'b01111100; cin = 1'b0; // Expected: {'sum': 92, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100000; b = 8'b01111100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 114,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 92, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111000; b = 8'b01111100; cin = 1'b1; // Expected: {'sum': 53, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111000; b = 8'b01111100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 115,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 53, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000101; b = 8'b00101100; cin = 1'b0; // Expected: {'sum': 113, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000101; b = 8'b00101100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 116,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111001; b = 8'b01010001; cin = 1'b0; // Expected: {'sum': 138, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111001; b = 8'b01010001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 117,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 138, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001100; b = 8'b00000110; cin = 1'b1; // Expected: {'sum': 211, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001100; b = 8'b00000110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 118,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 211, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100110; b = 8'b10110101; cin = 1'b0; // Expected: {'sum': 91, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100110; b = 8'b10110101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 119,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 91, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b11001000; cin = 1'b0; // Expected: {'sum': 66, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b11001000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 120,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 66, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110111; b = 8'b10100111; cin = 1'b0; // Expected: {'sum': 94, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110111; b = 8'b10100111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 121,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 94, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000010; b = 8'b11000011; cin = 1'b1; // Expected: {'sum': 198, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000010; b = 8'b11000011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 122,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 198, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011101; b = 8'b11001110; cin = 1'b1; // Expected: {'sum': 44, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011101; b = 8'b11001110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 123,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 44, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000010; b = 8'b11010110; cin = 1'b1; // Expected: {'sum': 153, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000010; b = 8'b11010110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 124,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 153, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101110; b = 8'b00110000; cin = 1'b1; // Expected: {'sum': 223, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101110; b = 8'b00110000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 125,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 223, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b11000101; cin = 1'b1; // Expected: {'sum': 175, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b11000101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 126,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 175, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101110; b = 8'b11011011; cin = 1'b0; // Expected: {'sum': 9, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101110; b = 8'b11011011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 127,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010101; b = 8'b00001010; cin = 1'b0; // Expected: {'sum': 95, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010101; b = 8'b00001010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 128,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 95, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101100; b = 8'b00011001; cin = 1'b0; // Expected: {'sum': 69, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101100; b = 8'b00011001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 129,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 69, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000011; b = 8'b00000011; cin = 1'b0; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000011; b = 8'b00000011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 130,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111011; b = 8'b01100010; cin = 1'b0; // Expected: {'sum': 29, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111011; b = 8'b01100010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 131,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010000; b = 8'b10011011; cin = 1'b1; // Expected: {'sum': 44, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010000; b = 8'b10011011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 132,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 44, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000100; b = 8'b10000000; cin = 1'b0; // Expected: {'sum': 68, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000100; b = 8'b10000000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 133,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 68, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100011; b = 8'b00101101; cin = 1'b0; // Expected: {'sum': 16, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100011; b = 8'b00101101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 134,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111100; b = 8'b00100011; cin = 1'b1; // Expected: {'sum': 32, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111100; b = 8'b00100011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 135,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 32, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010100; b = 8'b01100111; cin = 1'b0; // Expected: {'sum': 187, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010100; b = 8'b01100111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 136,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 187, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001111; b = 8'b01011110; cin = 1'b1; // Expected: {'sum': 110, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001111; b = 8'b01011110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 137,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 110, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111001; b = 8'b00101001; cin = 1'b0; // Expected: {'sum': 226, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111001; b = 8'b00101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 138,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 226, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111100; b = 8'b10100111; cin = 1'b1; // Expected: {'sum': 164, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111100; b = 8'b10100111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 139,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 164, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101000; b = 8'b11101110; cin = 1'b0; // Expected: {'sum': 86, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101000; b = 8'b11101110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 140,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001011; b = 8'b10010001; cin = 1'b1; // Expected: {'sum': 93, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001011; b = 8'b10010001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 141,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 93, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110001; b = 8'b10111110; cin = 1'b0; // Expected: {'sum': 111, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110001; b = 8'b10111110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 142,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 111, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111110; b = 8'b01101010; cin = 1'b0; // Expected: {'sum': 232, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111110; b = 8'b01101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 143,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 232, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101000; b = 8'b10100110; cin = 1'b1; // Expected: {'sum': 207, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101000; b = 8'b10100110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 144,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 207, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111100; b = 8'b11100110; cin = 1'b1; // Expected: {'sum': 99, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111100; b = 8'b11100110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 145,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 99, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000111; b = 8'b11011011; cin = 1'b0; // Expected: {'sum': 34, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000111; b = 8'b11011011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 146,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 34, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100110; b = 8'b00011110; cin = 1'b0; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100110; b = 8'b00011110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 147,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101110; b = 8'b10000111; cin = 1'b1; // Expected: {'sum': 246, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101110; b = 8'b10000111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 148,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 246, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100111; b = 8'b00110110; cin = 1'b1; // Expected: {'sum': 222, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100111; b = 8'b00110110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 149,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 222, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101101; b = 8'b01000010; cin = 1'b1; // Expected: {'sum': 176, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101101; b = 8'b01000010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 150,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 176, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101000; b = 8'b11111111; cin = 1'b0; // Expected: {'sum': 167, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101000; b = 8'b11111111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 151,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 167, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111000; b = 8'b00001011; cin = 1'b0; // Expected: {'sum': 131, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111000; b = 8'b00001011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 152,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 131, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000001; b = 8'b01111000; cin = 1'b1; // Expected: {'sum': 58, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000001; b = 8'b01111000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 153,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 58, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000100; b = 8'b11000111; cin = 1'b0; // Expected: {'sum': 139, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000100; b = 8'b11000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 154,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 139, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110000; b = 8'b00110001; cin = 1'b0; // Expected: {'sum': 161, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110000; b = 8'b00110001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 155,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 161, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101100; b = 8'b10101110; cin = 1'b1; // Expected: {'sum': 91, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101100; b = 8'b10101110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 156,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 91, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010011; b = 8'b11100111; cin = 1'b0; // Expected: {'sum': 250, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010011; b = 8'b11100111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 157,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 250, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011110; b = 8'b00100000; cin = 1'b1; // Expected: {'sum': 191, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011110; b = 8'b00100000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 158,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 191, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110000; b = 8'b10110010; cin = 1'b0; // Expected: {'sum': 98, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110000; b = 8'b10110010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 159,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 98, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101111; b = 8'b11010110; cin = 1'b0; // Expected: {'sum': 133, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101111; b = 8'b11010110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 160,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 133, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000100; b = 8'b01111111; cin = 1'b0; // Expected: {'sum': 131, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000100; b = 8'b01111111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 161,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 131, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011000; b = 8'b11000110; cin = 1'b1; // Expected: {'sum': 223, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011000; b = 8'b11000110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 162,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 223, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001100; b = 8'b01010001; cin = 1'b0; // Expected: {'sum': 29, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001100; b = 8'b01010001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 163,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000001; b = 8'b00111010; cin = 1'b1; // Expected: {'sum': 188, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000001; b = 8'b00111010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 164,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 188, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010110; b = 8'b00000001; cin = 1'b0; // Expected: {'sum': 23, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010110; b = 8'b00000001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 165,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101010; b = 8'b10000100; cin = 1'b1; // Expected: {'sum': 47, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101010; b = 8'b10000100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 166,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 47, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100111; b = 8'b11011110; cin = 1'b0; // Expected: {'sum': 69, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100111; b = 8'b11011110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 167,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 69, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110010; b = 8'b10100111; cin = 1'b0; // Expected: {'sum': 153, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110010; b = 8'b10100111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 168,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 153, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010100; b = 8'b00100110; cin = 1'b1; // Expected: {'sum': 123, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010100; b = 8'b00100110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 169,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 123, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111010; b = 8'b11110011; cin = 1'b1; // Expected: {'sum': 174, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111010; b = 8'b11110011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 170,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 174, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010000; b = 8'b01101001; cin = 1'b0; // Expected: {'sum': 249, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010000; b = 8'b01101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 171,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 249, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110001; b = 8'b01000111; cin = 1'b0; // Expected: {'sum': 248, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110001; b = 8'b01000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 172,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 248, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101001; b = 8'b01101010; cin = 1'b1; // Expected: {'sum': 148, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101001; b = 8'b01101010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 173,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 148, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011111; b = 8'b00110111; cin = 1'b1; // Expected: {'sum': 215, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011111; b = 8'b00110111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 174,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 215, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111000; b = 8'b10111011; cin = 1'b1; // Expected: {'sum': 116, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111000; b = 8'b10111011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 175,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 116, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100101; b = 8'b01011001; cin = 1'b1; // Expected: {'sum': 63, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100101; b = 8'b01011001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 176,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 63, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000010; b = 8'b01000101; cin = 1'b0; // Expected: {'sum': 135, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000010; b = 8'b01000101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 177,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 135, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011100; b = 8'b10000011; cin = 1'b1; // Expected: {'sum': 160, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011100; b = 8'b10000011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 178,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 160, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110011; b = 8'b10101110; cin = 1'b0; // Expected: {'sum': 33, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110011; b = 8'b10101110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 179,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 33, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101101; b = 8'b11111100; cin = 1'b0; // Expected: {'sum': 105, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101101; b = 8'b11111100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 180,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 105, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111011; b = 8'b00010111; cin = 1'b0; // Expected: {'sum': 146, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111011; b = 8'b00010111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 181,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 146, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010011; b = 8'b00110111; cin = 1'b1; // Expected: {'sum': 203, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010011; b = 8'b00110111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 182,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 203, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111111; b = 8'b11010110; cin = 1'b0; // Expected: {'sum': 21, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111111; b = 8'b11010110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 183,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 21, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001011; b = 8'b11101000; cin = 1'b1; // Expected: {'sum': 52, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001011; b = 8'b11101000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 184,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 52, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010101; b = 8'b10001000; cin = 1'b1; // Expected: {'sum': 222, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010101; b = 8'b10001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 185,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 222, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100001; b = 8'b11101010; cin = 1'b1; // Expected: {'sum': 204, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100001; b = 8'b11101010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 186,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 204, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011101; b = 8'b11000111; cin = 1'b1; // Expected: {'sum': 37, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011101; b = 8'b11000111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 187,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000010; b = 8'b01101001; cin = 1'b0; // Expected: {'sum': 107, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000010; b = 8'b01101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 188,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 107, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110000; b = 8'b11100001; cin = 1'b0; // Expected: {'sum': 209, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110000; b = 8'b11100001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 189,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 209, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000101; b = 8'b11100000; cin = 1'b1; // Expected: {'sum': 102, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000101; b = 8'b11100000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 190,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 102, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100100; b = 8'b10000011; cin = 1'b1; // Expected: {'sum': 40, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100100; b = 8'b10000011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 191,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 40, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100001; b = 8'b00011100; cin = 1'b1; // Expected: {'sum': 62, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100001; b = 8'b00011100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 192,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010000; b = 8'b01000010; cin = 1'b0; // Expected: {'sum': 18, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010000; b = 8'b01000010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 193,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 18, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000000; b = 8'b00010011; cin = 1'b1; // Expected: {'sum': 84, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000000; b = 8'b00010011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 194,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 84, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111011; b = 8'b10101111; cin = 1'b0; // Expected: {'sum': 170, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111011; b = 8'b10101111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 195,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 170, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010001; b = 8'b10101000; cin = 1'b0; // Expected: {'sum': 121, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010001; b = 8'b10101000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 196,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 121, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111101; b = 8'b00011111; cin = 1'b1; // Expected: {'sum': 29, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111101; b = 8'b00011111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 197,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100011; b = 8'b10101011; cin = 1'b0; // Expected: {'sum': 206, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100011; b = 8'b10101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 198,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 206, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010110; b = 8'b00111111; cin = 1'b1; // Expected: {'sum': 214, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010110; b = 8'b00111111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 199,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 214, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100011; b = 8'b00110011; cin = 1'b1; // Expected: {'sum': 151, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100011; b = 8'b00110011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 200,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 151, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110101; b = 8'b00110011; cin = 1'b0; // Expected: {'sum': 232, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110101; b = 8'b00110011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 201,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 232, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011100; b = 8'b10000110; cin = 1'b1; // Expected: {'sum': 163, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011100; b = 8'b10000110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 202,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 163, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010010; b = 8'b10010011; cin = 1'b1; // Expected: {'sum': 38, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010010; b = 8'b10010011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 203,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 38, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011101; b = 8'b01011110; cin = 1'b0; // Expected: {'sum': 251, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011101; b = 8'b01011110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 204,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 251, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100111; b = 8'b11101011; cin = 1'b1; // Expected: {'sum': 147, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100111; b = 8'b11101011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 205,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 147, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111010; b = 8'b10100110; cin = 1'b0; // Expected: {'sum': 160, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111010; b = 8'b10100110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 206,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 160, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111100; b = 8'b10110010; cin = 1'b1; // Expected: {'sum': 175, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111100; b = 8'b10110010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 207,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 175, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110100; b = 8'b01011100; cin = 1'b0; // Expected: {'sum': 80, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110100; b = 8'b01011100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 208,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 80, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111100; b = 8'b01011010; cin = 1'b0; // Expected: {'sum': 86, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111100; b = 8'b01011010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 209,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 86, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111100; b = 8'b00011100; cin = 1'b0; // Expected: {'sum': 216, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111100; b = 8'b00011100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 210,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 216, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010010; b = 8'b11000011; cin = 1'b0; // Expected: {'sum': 149, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010010; b = 8'b11000011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 211,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 149, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100101; b = 8'b01001001; cin = 1'b1; // Expected: {'sum': 239, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100101; b = 8'b01001001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 212,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 239, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110101; b = 8'b10101111; cin = 1'b0; // Expected: {'sum': 36, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110101; b = 8'b10101111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 213,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 36, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001100; b = 8'b10001011; cin = 1'b1; // Expected: {'sum': 88, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001100; b = 8'b10001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 214,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 88, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010000; b = 8'b00001000; cin = 1'b1; // Expected: {'sum': 153, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010000; b = 8'b00001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 215,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 153, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101001; b = 8'b01100101; cin = 1'b1; // Expected: {'sum': 207, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101001; b = 8'b01100101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 216,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 207, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000111; b = 8'b10000000; cin = 1'b1; // Expected: {'sum': 136, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000111; b = 8'b10000000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 217,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 136, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
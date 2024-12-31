
`timescale 1ns / 1ps

module tb_N8_BLOCK_SIZE5_carry_skip_adder;

    // Parameters
    
    parameter N = 8;
    
    parameter BLOCK_SIZE = 5;
    
     
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
        
        a = 8'b10111111; b = 8'b10001001; cin = 1'b1; // Expected: {'sum': 73, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111111; b = 8'b10001001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 73, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110100; b = 8'b10001001; cin = 1'b0; // Expected: {'sum': 61, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110100; b = 8'b10001001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 61, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001011; b = 8'b11000000; cin = 1'b1; // Expected: {'sum': 140, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001011; b = 8'b11000000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 140, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100011; b = 8'b11001100; cin = 1'b1; // Expected: {'sum': 48, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100011; b = 8'b11001100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 48, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101101; b = 8'b10011001; cin = 1'b1; // Expected: {'sum': 199, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101101; b = 8'b10011001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 199, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101011; b = 8'b00010111; cin = 1'b1; // Expected: {'sum': 131, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101011; b = 8'b00010111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 131, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010010; b = 8'b00010011; cin = 1'b0; // Expected: {'sum': 37, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010010; b = 8'b00010011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 37, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101010; b = 8'b11001000; cin = 1'b1; // Expected: {'sum': 179, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101010; b = 8'b11001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 179, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011011; b = 8'b00111101; cin = 1'b1; // Expected: {'sum': 153, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011011; b = 8'b00111101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 153, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100110; b = 8'b00110000; cin = 1'b0; // Expected: {'sum': 22, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100110; b = 8'b00110000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 22, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100001; b = 8'b00001001; cin = 1'b0; // Expected: {'sum': 106, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100001; b = 8'b00001001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 106, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000010; b = 8'b10111011; cin = 1'b0; // Expected: {'sum': 125, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000010; b = 8'b10111011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 125, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000000; b = 8'b01110000; cin = 1'b0; // Expected: {'sum': 176, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000000; b = 8'b01110000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 176, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100110; b = 8'b00111001; cin = 1'b0; // Expected: {'sum': 223, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100110; b = 8'b00111001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 223, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111001; b = 8'b01111110; cin = 1'b0; // Expected: {'sum': 247, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111001; b = 8'b01111110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 247, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011101; b = 8'b11000111; cin = 1'b1; // Expected: {'sum': 165, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011101; b = 8'b11000111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 165, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011011; b = 8'b00011110; cin = 1'b0; // Expected: {'sum': 57, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011011; b = 8'b00011110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101010; b = 8'b00000111; cin = 1'b0; // Expected: {'sum': 113, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101010; b = 8'b00000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 113, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011010; b = 8'b10011001; cin = 1'b1; // Expected: {'sum': 244, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011010; b = 8'b10011001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 244, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011001; b = 8'b10011101; cin = 1'b0; // Expected: {'sum': 182, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011001; b = 8'b10011101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 182, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100101; b = 8'b00111011; cin = 1'b0; // Expected: {'sum': 96, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100101; b = 8'b00111011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 96, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001110; b = 8'b10111101; cin = 1'b0; // Expected: {'sum': 11, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001110; b = 8'b10111101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011110; b = 8'b00110110; cin = 1'b0; // Expected: {'sum': 212, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011110; b = 8'b00110110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 212, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111010; b = 8'b11000001; cin = 1'b0; // Expected: {'sum': 123, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111010; b = 8'b11000001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 123, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101100; b = 8'b01111110; cin = 1'b0; // Expected: {'sum': 106, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101100; b = 8'b01111110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 106, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101001; b = 8'b10111010; cin = 1'b0; // Expected: {'sum': 99, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101001; b = 8'b10111010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 99, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010100; b = 8'b11011010; cin = 1'b1; // Expected: {'sum': 239, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010100; b = 8'b11011010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 239, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010010; b = 8'b10110101; cin = 1'b1; // Expected: {'sum': 8, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010010; b = 8'b10110101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000111; b = 8'b01011110; cin = 1'b0; // Expected: {'sum': 101, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000111; b = 8'b01011110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 101, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000101; b = 8'b01110010; cin = 1'b1; // Expected: {'sum': 120, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000101; b = 8'b01110010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 120, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110111; b = 8'b00001000; cin = 1'b0; // Expected: {'sum': 191, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110111; b = 8'b00001000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 191, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011011; b = 8'b00010111; cin = 1'b1; // Expected: {'sum': 243, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011011; b = 8'b00010111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 243, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001110; b = 8'b11010100; cin = 1'b0; // Expected: {'sum': 226, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001110; b = 8'b11010100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 226, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
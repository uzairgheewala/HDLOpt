
`timescale 1ns / 1ps

module tb_N8_BLOCK_SIZE3_carry_skip_adder;

    // Parameters
    
    parameter N = 8;
    
    parameter BLOCK_SIZE = 3;
    
     
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
        
        a = 8'b00101010; b = 8'b01101000; cin = 1'b1; // Expected: {'sum': 147, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101010; b = 8'b01101000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 147, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011110; b = 8'b10110011; cin = 1'b0; // Expected: {'sum': 81, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011110; b = 8'b10110011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 81, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110011; b = 8'b10111110; cin = 1'b0; // Expected: {'sum': 113, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110011; b = 8'b10111110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 113, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100010; b = 8'b10000110; cin = 1'b1; // Expected: {'sum': 233, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100010; b = 8'b10000110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 233, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001110; b = 8'b01011110; cin = 1'b1; // Expected: {'sum': 109, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001110; b = 8'b01011110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 109, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010101; b = 8'b00001000; cin = 1'b1; // Expected: {'sum': 158, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010101; b = 8'b00001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 158, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001100; b = 8'b11100011; cin = 1'b0; // Expected: {'sum': 239, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001100; b = 8'b11100011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 239, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111110; b = 8'b01111001; cin = 1'b1; // Expected: {'sum': 184, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111110; b = 8'b01111001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 184, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000111; b = 8'b00100010; cin = 1'b0; // Expected: {'sum': 233, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000111; b = 8'b00100010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 233, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010001; b = 8'b01010101; cin = 1'b1; // Expected: {'sum': 103, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010001; b = 8'b01010101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 103, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110010; b = 8'b11011100; cin = 1'b1; // Expected: {'sum': 143, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110010; b = 8'b11011100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 143, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101011; b = 8'b10011001; cin = 1'b0; // Expected: {'sum': 196, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101011; b = 8'b10011001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 196, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101110; b = 8'b11101011; cin = 1'b1; // Expected: {'sum': 90, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101110; b = 8'b11101011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 90, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101001; b = 8'b11101001; cin = 1'b1; // Expected: {'sum': 211, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101001; b = 8'b11101001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 211, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111010; b = 8'b10000100; cin = 1'b0; // Expected: {'sum': 126, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111010; b = 8'b10000100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 126, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101110; b = 8'b01011011; cin = 1'b1; // Expected: {'sum': 202, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101110; b = 8'b01011011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 202, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111010; b = 8'b11100100; cin = 1'b1; // Expected: {'sum': 223, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111010; b = 8'b11100100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 223, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100110; b = 8'b10010001; cin = 1'b1; // Expected: {'sum': 56, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100110; b = 8'b10010001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 56, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101100; b = 8'b00000101; cin = 1'b0; // Expected: {'sum': 241, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101100; b = 8'b00000101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 241, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001110; b = 8'b01001000; cin = 1'b1; // Expected: {'sum': 215, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001110; b = 8'b01001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 215, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011101; b = 8'b10100011; cin = 1'b1; // Expected: {'sum': 65, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011101; b = 8'b10100011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 65, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001010; b = 8'b10000100; cin = 1'b1; // Expected: {'sum': 143, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001010; b = 8'b10000100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 143, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100010; b = 8'b10010010; cin = 1'b1; // Expected: {'sum': 181, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100010; b = 8'b10010010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 181, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110110; b = 8'b00011000; cin = 1'b1; // Expected: {'sum': 15, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110110; b = 8'b00011000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111100; b = 8'b01101011; cin = 1'b0; // Expected: {'sum': 167, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111100; b = 8'b01101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 167, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000111; b = 8'b00100110; cin = 1'b0; // Expected: {'sum': 109, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000111; b = 8'b00100110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 109, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110101; b = 8'b01110011; cin = 1'b0; // Expected: {'sum': 104, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110101; b = 8'b01110011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 104, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011001; b = 8'b00011000; cin = 1'b0; // Expected: {'sum': 177, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011001; b = 8'b00011000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 177, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100100; b = 8'b11110101; cin = 1'b1; // Expected: {'sum': 218, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100100; b = 8'b11110101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 218, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000011; b = 8'b00010110; cin = 1'b1; // Expected: {'sum': 26, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000011; b = 8'b00010110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 26, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110100; b = 8'b11100011; cin = 1'b1; // Expected: {'sum': 24, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110100; b = 8'b11100011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110001; b = 8'b11010111; cin = 1'b0; // Expected: {'sum': 200, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110001; b = 8'b11010111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 200, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011100; b = 8'b00000110; cin = 1'b0; // Expected: {'sum': 98, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011100; b = 8'b00000110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 98, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
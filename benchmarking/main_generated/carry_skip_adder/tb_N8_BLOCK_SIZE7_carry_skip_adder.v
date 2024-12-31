
`timescale 1ns / 1ps

module tb_N8_BLOCK_SIZE7_carry_skip_adder;

    // Parameters
    
    parameter N = 8;
    
    parameter BLOCK_SIZE = 7;
    
     
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
        
        a = 8'b00010010; b = 8'b00001001; cin = 1'b0; // Expected: {'sum': 27, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010010; b = 8'b00001001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 27, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001101; b = 8'b01101010; cin = 1'b1; // Expected: {'sum': 120, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001101; b = 8'b01101010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 120, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011101; b = 8'b10100001; cin = 1'b0; // Expected: {'sum': 126, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011101; b = 8'b10100001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 126, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010000; b = 8'b11111100; cin = 1'b1; // Expected: {'sum': 77, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010000; b = 8'b11111100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 77, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001001; b = 8'b11001101; cin = 1'b1; // Expected: {'sum': 23, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001001; b = 8'b11001101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110011; b = 8'b01100110; cin = 1'b0; // Expected: {'sum': 217, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110011; b = 8'b01100110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 217, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000100; b = 8'b00110110; cin = 1'b1; // Expected: {'sum': 59, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000100; b = 8'b00110110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 59, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111100; b = 8'b10100111; cin = 1'b0; // Expected: {'sum': 35, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111100; b = 8'b10100111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 35, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101100; b = 8'b11011101; cin = 1'b1; // Expected: {'sum': 10, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101100; b = 8'b11011101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011101; b = 8'b11001011; cin = 1'b0; // Expected: {'sum': 40, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011101; b = 8'b11001011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 40, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100100; b = 8'b00011000; cin = 1'b0; // Expected: {'sum': 252, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100100; b = 8'b00011000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 252, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011101; b = 8'b11001101; cin = 1'b1; // Expected: {'sum': 107, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011101; b = 8'b11001101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 107, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010111; b = 8'b01000100; cin = 1'b1; // Expected: {'sum': 92, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010111; b = 8'b01000100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 92, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101000; b = 8'b11010010; cin = 1'b0; // Expected: {'sum': 58, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101000; b = 8'b11010010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 58, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101111; b = 8'b10101100; cin = 1'b1; // Expected: {'sum': 220, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101111; b = 8'b10101100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 220, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100011; b = 8'b11001001; cin = 1'b1; // Expected: {'sum': 237, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100011; b = 8'b11001001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 237, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001101; b = 8'b01111001; cin = 1'b1; // Expected: {'sum': 135, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001101; b = 8'b01111001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 135, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100110; b = 8'b00011110; cin = 1'b1; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100110; b = 8'b00011110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000011; b = 8'b10111110; cin = 1'b1; // Expected: {'sum': 66, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000011; b = 8'b10111110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 66, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100111; b = 8'b10101010; cin = 1'b0; // Expected: {'sum': 17, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100111; b = 8'b10101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 17, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011001; b = 8'b11010111; cin = 1'b0; // Expected: {'sum': 112, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011001; b = 8'b11010111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 112, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100111; b = 8'b11000111; cin = 1'b0; // Expected: {'sum': 110, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100111; b = 8'b11000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 110, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001011; b = 8'b01101110; cin = 1'b0; // Expected: {'sum': 57, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001011; b = 8'b01101110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 57, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001110; b = 8'b00001000; cin = 1'b1; // Expected: {'sum': 23, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001110; b = 8'b00001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100100; b = 8'b00000001; cin = 1'b1; // Expected: {'sum': 230, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100100; b = 8'b00000001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 230, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100011; b = 8'b01001101; cin = 1'b1; // Expected: {'sum': 177, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100011; b = 8'b01001101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 177, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011011; b = 8'b11110011; cin = 1'b1; // Expected: {'sum': 15, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011011; b = 8'b11110011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001100; b = 8'b00011101; cin = 1'b0; // Expected: {'sum': 105, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001100; b = 8'b00011101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 105, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001011; b = 8'b10000111; cin = 1'b0; // Expected: {'sum': 82, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001011; b = 8'b10000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 82, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001001; b = 8'b11110100; cin = 1'b0; // Expected: {'sum': 253, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001001; b = 8'b11110100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 253, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100010; b = 8'b11010100; cin = 1'b1; // Expected: {'sum': 55, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100010; b = 8'b11010100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 55, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101110; b = 8'b10101000; cin = 1'b1; // Expected: {'sum': 151, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101110; b = 8'b10101000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 151, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11000001; b = 8'b11010000; cin = 1'b0; // Expected: {'sum': 145, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11000001; b = 8'b11010000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 145, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
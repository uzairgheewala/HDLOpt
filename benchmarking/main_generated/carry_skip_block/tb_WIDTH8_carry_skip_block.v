
`timescale 1ns / 1ps

module tb_WIDTH8_carry_skip_block;

    // Parameters
    
    parameter WIDTH = 8;
    
     
    // Inputs
    
    reg  [7:0] a;
    
    reg  [7:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [7:0] sum;
    
    wire   cout;
    
    wire   block_carry_out;
    
    
    // Instantiate the Unit Under Test (UUT)
    carry_skip_block  #( WIDTH ) uut (
        
        .a(a),
        
        .b(b),
        
        .cin(cin),
        
        
        .sum(sum),
        
        .cout(cout),
        
        .block_carry_out(block_carry_out)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        cin = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 8'b00111001; b = 8'b10110110; cin = 1'b1; // Expected: {'sum': 240, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111001; b = 8'b10110110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 0,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 240, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110010; b = 8'b00111010; cin = 1'b1; // Expected: {'sum': 45, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110010; b = 8'b00111010; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 1,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 45, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011110; b = 8'b11111111; cin = 1'b1; // Expected: {'sum': 158, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011110; b = 8'b11111111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 2,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 158, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001110; b = 8'b01110110; cin = 1'b1; // Expected: {'sum': 197, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001110; b = 8'b01110110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 3,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 197, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111011; b = 8'b10110110; cin = 1'b1; // Expected: {'sum': 114, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111011; b = 8'b10110110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 4,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 114, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001001; b = 8'b00001101; cin = 1'b0; // Expected: {'sum': 86, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001001; b = 8'b00001101; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 5,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 86, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100010; b = 8'b00001001; cin = 1'b1; // Expected: {'sum': 236, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100010; b = 8'b00001001; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 6,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 236, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011000; b = 8'b11010110; cin = 1'b0; // Expected: {'sum': 46, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011000; b = 8'b11010110; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 7,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 46, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000101; b = 8'b01010111; cin = 1'b0; // Expected: {'sum': 92, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000101; b = 8'b01010111; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 8,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 92, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111010; b = 8'b01011111; cin = 1'b1; // Expected: {'sum': 26, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111010; b = 8'b01011111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 9,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 26, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001000; b = 8'b10111111; cin = 1'b0; // Expected: {'sum': 7, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001000; b = 8'b10111111; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 10,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 7, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111110; b = 8'b11110110; cin = 1'b0; // Expected: {'sum': 244, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111110; b = 8'b11110110; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 11,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 244, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111101; b = 8'b10111000; cin = 1'b1; // Expected: {'sum': 118, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111101; b = 8'b10111000; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 12,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 118, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010000; b = 8'b10111010; cin = 1'b0; // Expected: {'sum': 138, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010000; b = 8'b10111010; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 13,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 138, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101011; b = 8'b11010010; cin = 1'b1; // Expected: {'sum': 62, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101011; b = 8'b11010010; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 14,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 62, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010011; b = 8'b10010110; cin = 1'b0; // Expected: {'sum': 41, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010011; b = 8'b10010110; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 15,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 41, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000110; b = 8'b00010110; cin = 1'b1; // Expected: {'sum': 29, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000110; b = 8'b00010110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 16,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 29, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010101; b = 8'b01111110; cin = 1'b0; // Expected: {'sum': 147, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010101; b = 8'b01111110; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 17,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 147, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011101; b = 8'b00100001; cin = 1'b1; // Expected: {'sum': 63, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011101; b = 8'b00100001; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 18,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 63, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100001; b = 8'b11011111; cin = 1'b1; // Expected: {'sum': 65, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100001; b = 8'b11011111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 19,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 65, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101001; b = 8'b11110000; cin = 1'b0; // Expected: {'sum': 25, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101001; b = 8'b11110000; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 20,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 25, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101001; b = 8'b01111111; cin = 1'b0; // Expected: {'sum': 168, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101001; b = 8'b01111111; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 21,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 168, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000001; b = 8'b00000100; cin = 1'b0; // Expected: {'sum': 133, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000001; b = 8'b00000100; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 22,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 133, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100001; b = 8'b01010101; cin = 1'b1; // Expected: {'sum': 119, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100001; b = 8'b01010101; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 23,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 119, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001100; b = 8'b01111001; cin = 1'b1; // Expected: {'sum': 198, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001100; b = 8'b01111001; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 24,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 198, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010000; b = 8'b01000100; cin = 1'b0; // Expected: {'sum': 148, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010000; b = 8'b01000100; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 25,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 148, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011011; b = 8'b01011000; cin = 1'b1; // Expected: {'sum': 52, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011011; b = 8'b01011000; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 26,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 52, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111111; b = 8'b01000101; cin = 1'b1; // Expected: {'sum': 69, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111111; b = 8'b01000101; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 27,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 69, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011000; b = 8'b00000101; cin = 1'b1; // Expected: {'sum': 158, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011000; b = 8'b00000101; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 28,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 158, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000100; b = 8'b11001101; cin = 1'b1; // Expected: {'sum': 82, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000100; b = 8'b11001101; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 29,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 82, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011101; b = 8'b11001110; cin = 1'b1; // Expected: {'sum': 44, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011101; b = 8'b11001110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 30,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 44, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010001; b = 8'b11111100; cin = 1'b1; // Expected: {'sum': 142, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010001; b = 8'b11111100; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 31,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 142, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001111; b = 8'b10110000; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001111; b = 8'b10110000; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 32,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 0, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100000; b = 8'b10001110; cin = 1'b0; // Expected: {'sum': 46, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100000; b = 8'b10001110; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 33,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 46, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100110; b = 8'b10110010; cin = 1'b1; // Expected: {'sum': 89, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100110; b = 8'b10110010; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 34,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 89, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
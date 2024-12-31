
`timescale 1ns / 1ps

module tb_N8_BLOCK_SIZE8_carry_skip_adder;

    // Parameters
    
    parameter N = 8;
    
    parameter BLOCK_SIZE = 8;
    
     
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
        
        a = 8'b10100000; b = 8'b10000011; cin = 1'b1; // Expected: {'sum': 36, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100000; b = 8'b10000011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 36, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011111; b = 8'b11111110; cin = 1'b1; // Expected: {'sum': 158, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011111; b = 8'b11111110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 158, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110011; b = 8'b00110100; cin = 1'b1; // Expected: {'sum': 40, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110011; b = 8'b00110100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 40, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001111; b = 8'b00111000; cin = 1'b1; // Expected: {'sum': 136, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001111; b = 8'b00111000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 136, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011101; b = 8'b01111110; cin = 1'b0; // Expected: {'sum': 27, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011101; b = 8'b01111110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 27, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001000; b = 8'b11011111; cin = 1'b0; // Expected: {'sum': 167, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001000; b = 8'b11011111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 167, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011001; b = 8'b00110001; cin = 1'b1; // Expected: {'sum': 139, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011001; b = 8'b00110001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 139, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110111; b = 8'b00011011; cin = 1'b1; // Expected: {'sum': 83, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110111; b = 8'b00011011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 83, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101011; b = 8'b01110000; cin = 1'b0; // Expected: {'sum': 155, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101011; b = 8'b01110000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 155, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010011; b = 8'b11111100; cin = 1'b0; // Expected: {'sum': 79, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010011; b = 8'b11111100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 79, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10011011; b = 8'b11110100; cin = 1'b1; // Expected: {'sum': 144, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10011011; b = 8'b11110100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 144, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101110; b = 8'b00110100; cin = 1'b1; // Expected: {'sum': 227, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101110; b = 8'b00110100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 227, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00011100; b = 8'b00000110; cin = 1'b0; // Expected: {'sum': 34, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00011100; b = 8'b00000110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 34, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001110; b = 8'b00100000; cin = 1'b1; // Expected: {'sum': 111, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001110; b = 8'b00100000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 111, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001110; b = 8'b00000001; cin = 1'b0; // Expected: {'sum': 143, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001110; b = 8'b00000001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 143, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001001; b = 8'b01111111; cin = 1'b1; // Expected: {'sum': 137, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001001; b = 8'b01111111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 137, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100101; b = 8'b01110011; cin = 1'b1; // Expected: {'sum': 217, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100101; b = 8'b01110011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 217, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010100; b = 8'b00001000; cin = 1'b0; // Expected: {'sum': 156, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010100; b = 8'b00001000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 156, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110111; b = 8'b10101011; cin = 1'b1; // Expected: {'sum': 163, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110111; b = 8'b10101011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 163, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100001; b = 8'b11011011; cin = 1'b0; // Expected: {'sum': 124, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100001; b = 8'b11011011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 124, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110100; b = 8'b01101101; cin = 1'b1; // Expected: {'sum': 34, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110100; b = 8'b01101101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 34, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011011; b = 8'b01010011; cin = 1'b1; // Expected: {'sum': 47, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011011; b = 8'b01010011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 47, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01000110; b = 8'b10101000; cin = 1'b0; // Expected: {'sum': 238, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01000110; b = 8'b10101000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 238, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101011; b = 8'b00000000; cin = 1'b1; // Expected: {'sum': 172, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101011; b = 8'b00000000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 172, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110110; b = 8'b11110111; cin = 1'b0; // Expected: {'sum': 109, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110110; b = 8'b11110111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 109, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101010; b = 8'b10111100; cin = 1'b0; // Expected: {'sum': 38, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101010; b = 8'b10111100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 38, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001101; b = 8'b11100110; cin = 1'b1; // Expected: {'sum': 52, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001101; b = 8'b11100110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 52, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010111; b = 8'b01000001; cin = 1'b1; // Expected: {'sum': 25, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010111; b = 8'b01000001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10010110; b = 8'b00100101; cin = 1'b0; // Expected: {'sum': 187, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10010110; b = 8'b00100101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 187, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101100; b = 8'b01100111; cin = 1'b1; // Expected: {'sum': 20, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101100; b = 8'b01100111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 20, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101100; b = 8'b11110001; cin = 1'b1; // Expected: {'sum': 158, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101100; b = 8'b11110001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 158, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100111; b = 8'b10100000; cin = 1'b0; // Expected: {'sum': 71, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100111; b = 8'b10100000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 71, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
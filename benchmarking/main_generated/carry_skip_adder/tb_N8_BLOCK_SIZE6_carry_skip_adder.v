
`timescale 1ns / 1ps

module tb_N8_BLOCK_SIZE6_carry_skip_adder;

    // Parameters
    
    parameter N = 8;
    
    parameter BLOCK_SIZE = 6;
    
     
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
        
        a = 8'b00100100; b = 8'b11000011; cin = 1'b1; // Expected: {'sum': 232, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100100; b = 8'b11000011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 232, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010011; b = 8'b11000111; cin = 1'b1; // Expected: {'sum': 219, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010011; b = 8'b11000111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 219, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100111; b = 8'b01001110; cin = 1'b1; // Expected: {'sum': 246, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100111; b = 8'b01001110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 246, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00101011; b = 8'b01101110; cin = 1'b0; // Expected: {'sum': 153, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00101011; b = 8'b01101110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 153, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111001; b = 8'b01010000; cin = 1'b0; // Expected: {'sum': 201, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111001; b = 8'b01010000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 201, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110000; b = 8'b00011011; cin = 1'b1; // Expected: {'sum': 204, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110000; b = 8'b00011011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 204, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100001; b = 8'b10001101; cin = 1'b0; // Expected: {'sum': 238, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100001; b = 8'b10001101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 238, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010101; b = 8'b01001010; cin = 1'b0; // Expected: {'sum': 159, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010101; b = 8'b01001010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 159, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00001010; b = 8'b01000101; cin = 1'b0; // Expected: {'sum': 79, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00001010; b = 8'b01000101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 79, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100101; b = 8'b11011100; cin = 1'b0; // Expected: {'sum': 193, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100101; b = 8'b11011100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 193, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010000; b = 8'b01000101; cin = 1'b0; // Expected: {'sum': 85, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010000; b = 8'b01000101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 85, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100000; b = 8'b11010010; cin = 1'b1; // Expected: {'sum': 243, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100000; b = 8'b11010010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 243, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010010; b = 8'b00011000; cin = 1'b0; // Expected: {'sum': 42, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010010; b = 8'b00011000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01101011; b = 8'b11111010; cin = 1'b0; // Expected: {'sum': 101, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01101011; b = 8'b11111010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 101, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111100; b = 8'b00011101; cin = 1'b0; // Expected: {'sum': 153, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111100; b = 8'b00011101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 153, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010110; b = 8'b00011011; cin = 1'b1; // Expected: {'sum': 242, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010110; b = 8'b00011011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 242, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100100; b = 8'b00101010; cin = 1'b0; // Expected: {'sum': 206, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100100; b = 8'b00101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 206, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01010001; b = 8'b11011001; cin = 1'b1; // Expected: {'sum': 43, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01010001; b = 8'b11011001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 43, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100100; b = 8'b10101011; cin = 1'b1; // Expected: {'sum': 16, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100100; b = 8'b10101011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10110111; b = 8'b11011111; cin = 1'b0; // Expected: {'sum': 150, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10110111; b = 8'b11011111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 150, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10101100; b = 8'b10100110; cin = 1'b1; // Expected: {'sum': 83, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10101100; b = 8'b10100110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 83, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111100; b = 8'b10000010; cin = 1'b1; // Expected: {'sum': 127, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111100; b = 8'b10000010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 127, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100111; b = 8'b11101111; cin = 1'b1; // Expected: {'sum': 23, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100111; b = 8'b11101111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010001; b = 8'b11010000; cin = 1'b0; // Expected: {'sum': 225, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010001; b = 8'b11010000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 225, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100011; b = 8'b00111010; cin = 1'b0; // Expected: {'sum': 157, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100011; b = 8'b00111010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 157, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110000; b = 8'b11100111; cin = 1'b0; // Expected: {'sum': 87, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110000; b = 8'b11100111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 87, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11001111; b = 8'b00101100; cin = 1'b1; // Expected: {'sum': 252, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11001111; b = 8'b00101100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 252, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011100; b = 8'b00110010; cin = 1'b1; // Expected: {'sum': 143, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011100; b = 8'b00110010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 143, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111100; b = 8'b11101011; cin = 1'b1; // Expected: {'sum': 104, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111100; b = 8'b11101011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 104, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001111; b = 8'b10101010; cin = 1'b0; // Expected: {'sum': 249, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001111; b = 8'b10101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 249, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101111; b = 8'b01110000; cin = 1'b1; // Expected: {'sum': 96, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101111; b = 8'b01110000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 96, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010011; b = 8'b01100100; cin = 1'b1; // Expected: {'sum': 120, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010011; b = 8'b01100100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 120, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000101; b = 8'b00001101; cin = 1'b0; // Expected: {'sum': 146, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000101; b = 8'b00001101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 146, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
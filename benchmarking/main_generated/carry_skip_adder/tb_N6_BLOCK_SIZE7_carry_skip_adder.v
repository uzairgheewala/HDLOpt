
`timescale 1ns / 1ps

module tb_N6_BLOCK_SIZE7_carry_skip_adder;

    // Parameters
    
    parameter N = 6;
    
    parameter BLOCK_SIZE = 7;
    
     
    // Inputs
    
    reg  [5:0] a;
    
    reg  [5:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [5:0] sum;
    
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
        
        a = 6'b110110; b = 6'b001000; cin = 1'b0; // Expected: {'sum': 62, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b110110; b = 6'b001000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011101; b = 6'b110101; cin = 1'b1; // Expected: {'sum': 19, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011101; b = 6'b110101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 19, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111100; b = 6'b101010; cin = 1'b0; // Expected: {'sum': 38, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111100; b = 6'b101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 38, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011100; b = 6'b000111; cin = 1'b1; // Expected: {'sum': 36, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011100; b = 6'b000111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 36, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101111; b = 6'b010000; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b101111; b = 6'b010000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101101; b = 6'b110101; cin = 1'b0; // Expected: {'sum': 34, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b101101; b = 6'b110101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 34, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001101; b = 6'b011100; cin = 1'b1; // Expected: {'sum': 42, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001101; b = 6'b011100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 42, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001010; b = 6'b010011; cin = 1'b0; // Expected: {'sum': 29, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001010; b = 6'b010011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011101; b = 6'b101010; cin = 1'b0; // Expected: {'sum': 7, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011101; b = 6'b101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110110; b = 6'b001111; cin = 1'b1; // Expected: {'sum': 6, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110110; b = 6'b001111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101100; b = 6'b010000; cin = 1'b1; // Expected: {'sum': 61, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b101100; b = 6'b010000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 61, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010001; b = 6'b011001; cin = 1'b1; // Expected: {'sum': 43, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b010001; b = 6'b011001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 43, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010011; b = 6'b101100; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b010011; b = 6'b101100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010110; b = 6'b111000; cin = 1'b0; // Expected: {'sum': 14, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b010110; b = 6'b111000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 14, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100010; b = 6'b101010; cin = 1'b1; // Expected: {'sum': 13, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100010; b = 6'b101010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011010; b = 6'b000101; cin = 1'b0; // Expected: {'sum': 31, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011010; b = 6'b000101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 31, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010011; b = 6'b111110; cin = 1'b0; // Expected: {'sum': 17, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b010011; b = 6'b111110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 17, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111001; b = 6'b011110; cin = 1'b1; // Expected: {'sum': 24, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111001; b = 6'b011110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101101; b = 6'b011000; cin = 1'b1; // Expected: {'sum': 6, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b101101; b = 6'b011000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101111; b = 6'b101010; cin = 1'b0; // Expected: {'sum': 25, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b101111; b = 6'b101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 25, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000001; b = 6'b010001; cin = 1'b0; // Expected: {'sum': 18, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000001; b = 6'b010001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 18, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100011; b = 6'b111111; cin = 1'b0; // Expected: {'sum': 34, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100011; b = 6'b111111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 34, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000000; b = 6'b001101; cin = 1'b0; // Expected: {'sum': 13, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000000; b = 6'b001101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100100; b = 6'b110011; cin = 1'b1; // Expected: {'sum': 24, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100100; b = 6'b110011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100000; b = 6'b010110; cin = 1'b0; // Expected: {'sum': 54, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b100000; b = 6'b010110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110110; b = 6'b001011; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110110; b = 6'b001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100110; b = 6'b011001; cin = 1'b0; // Expected: {'sum': 63, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b100110; b = 6'b011001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 63, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010110; b = 6'b010011; cin = 1'b0; // Expected: {'sum': 41, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b010110; b = 6'b010011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 41, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010100; b = 6'b011101; cin = 1'b1; // Expected: {'sum': 50, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b010100; b = 6'b011101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 50, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011101; b = 6'b100110; cin = 1'b1; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011101; b = 6'b100110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000100; b = 6'b110010; cin = 1'b0; // Expected: {'sum': 54, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000100; b = 6'b110010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111100; b = 6'b000100; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111100; b = 6'b000100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000010; b = 6'b110101; cin = 1'b0; // Expected: {'sum': 55, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000010; b = 6'b110101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 55, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111000; b = 6'b000000; cin = 1'b1; // Expected: {'sum': 57, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b111000; b = 6'b000000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 33,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule

`timescale 1ns / 1ps

module tb_N6_BLOCK_SIZE8_carry_skip_adder;

    // Parameters
    
    parameter N = 6;
    
    parameter BLOCK_SIZE = 8;
    
     
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
        
        a = 6'b101100; b = 6'b101001; cin = 1'b0; // Expected: {'sum': 21, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b101100; b = 6'b101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 21, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000000; b = 6'b000010; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000000; b = 6'b000010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101101; b = 6'b101010; cin = 1'b1; // Expected: {'sum': 24, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b101101; b = 6'b101010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000101; b = 6'b000010; cin = 1'b1; // Expected: {'sum': 8, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000101; b = 6'b000010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111110; b = 6'b101010; cin = 1'b1; // Expected: {'sum': 41, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111110; b = 6'b101010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 41, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010111; b = 6'b101011; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b010111; b = 6'b101011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111011; b = 6'b000101; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111011; b = 6'b000101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010110; b = 6'b000000; cin = 1'b0; // Expected: {'sum': 22, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b010110; b = 6'b000000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 22, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001111; b = 6'b100011; cin = 1'b1; // Expected: {'sum': 51, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001111; b = 6'b100011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 51, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011001; b = 6'b011101; cin = 1'b0; // Expected: {'sum': 54, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011001; b = 6'b011101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100111; b = 6'b100101; cin = 1'b0; // Expected: {'sum': 12, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100111; b = 6'b100101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101001; b = 6'b010101; cin = 1'b1; // Expected: {'sum': 63, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b101001; b = 6'b010101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 63, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011011; b = 6'b010011; cin = 1'b1; // Expected: {'sum': 47, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011011; b = 6'b010011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 47, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100001; b = 6'b010100; cin = 1'b0; // Expected: {'sum': 53, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b100001; b = 6'b010100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 53, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100001; b = 6'b010100; cin = 1'b1; // Expected: {'sum': 54, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b100001; b = 6'b010100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100011; b = 6'b110101; cin = 1'b0; // Expected: {'sum': 24, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100011; b = 6'b110101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000110; b = 6'b100111; cin = 1'b1; // Expected: {'sum': 46, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000110; b = 6'b100111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111111; b = 6'b011000; cin = 1'b0; // Expected: {'sum': 23, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111111; b = 6'b011000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110111; b = 6'b001101; cin = 1'b0; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110111; b = 6'b001101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000111; b = 6'b110001; cin = 1'b0; // Expected: {'sum': 56, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000111; b = 6'b110001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 56, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100011; b = 6'b111011; cin = 1'b0; // Expected: {'sum': 30, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100011; b = 6'b111011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010100; b = 6'b001110; cin = 1'b1; // Expected: {'sum': 35, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b010100; b = 6'b001110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 35, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011010; b = 6'b111110; cin = 1'b0; // Expected: {'sum': 24, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011010; b = 6'b111110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011100; b = 6'b011111; cin = 1'b1; // Expected: {'sum': 60, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011100; b = 6'b011111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 60, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101011; b = 6'b001111; cin = 1'b1; // Expected: {'sum': 59, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b101011; b = 6'b001111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 59, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111111; b = 6'b101111; cin = 1'b0; // Expected: {'sum': 46, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111111; b = 6'b101111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 46, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001111; b = 6'b011101; cin = 1'b0; // Expected: {'sum': 44, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001111; b = 6'b011101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 44, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111000; b = 6'b111011; cin = 1'b0; // Expected: {'sum': 51, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111000; b = 6'b111011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 51, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000000; b = 6'b101110; cin = 1'b0; // Expected: {'sum': 46, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000000; b = 6'b101110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110100; b = 6'b110100; cin = 1'b1; // Expected: {'sum': 41, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110100; b = 6'b110100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 41, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110111; b = 6'b011110; cin = 1'b1; // Expected: {'sum': 22, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110111; b = 6'b011110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 22, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011111; b = 6'b101111; cin = 1'b0; // Expected: {'sum': 14, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011111; b = 6'b101111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 14, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011111; b = 6'b001100; cin = 1'b1; // Expected: {'sum': 44, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011111; b = 6'b001100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 44, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001001; b = 6'b111111; cin = 1'b1; // Expected: {'sum': 9, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b001001; b = 6'b111111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 33,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 9, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule

`timescale 1ns / 1ps

module tb_N6_ripple_carry_adder;

    // Parameters
    
    parameter N = 6;
    
     
    // Inputs
    
    reg  [5:0] a;
    
    reg  [5:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [5:0] sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    ripple_carry_adder  #( N ) uut (
        
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
        
        a = 6'b011111; b = 6'b100110; cin = 1'b1; // Expected: {'sum': 6, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011111; b = 6'b100110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111001; b = 6'b101011; cin = 1'b0; // Expected: {'sum': 36, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111001; b = 6'b101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 36, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110010; b = 6'b110011; cin = 1'b1; // Expected: {'sum': 38, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110010; b = 6'b110011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 38, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101110; b = 6'b001011; cin = 1'b1; // Expected: {'sum': 58, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b101110; b = 6'b001011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 58, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001100; b = 6'b110001; cin = 1'b1; // Expected: {'sum': 62, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001100; b = 6'b110001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110001; b = 6'b001101; cin = 1'b0; // Expected: {'sum': 62, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b110001; b = 6'b001101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 62, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101100; b = 6'b101001; cin = 1'b0; // Expected: {'sum': 21, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b101100; b = 6'b101001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 21, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100101; b = 6'b000111; cin = 1'b1; // Expected: {'sum': 45, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b100101; b = 6'b000111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 45, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011001; b = 6'b110111; cin = 1'b0; // Expected: {'sum': 16, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011001; b = 6'b110111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 16, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111100; b = 6'b011010; cin = 1'b1; // Expected: {'sum': 23, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111100; b = 6'b011010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011000; b = 6'b111010; cin = 1'b1; // Expected: {'sum': 19, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011000; b = 6'b111010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 19, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100110; b = 6'b001000; cin = 1'b0; // Expected: {'sum': 46, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b100110; b = 6'b001000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 46, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011000; b = 6'b000111; cin = 1'b0; // Expected: {'sum': 31, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011000; b = 6'b000111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 31, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001110; b = 6'b001000; cin = 1'b1; // Expected: {'sum': 23, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001110; b = 6'b001000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 23, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011001; b = 6'b110001; cin = 1'b1; // Expected: {'sum': 11, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011001; b = 6'b110001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001111; b = 6'b111111; cin = 1'b1; // Expected: {'sum': 15, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b001111; b = 6'b111111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001001; b = 6'b100100; cin = 1'b0; // Expected: {'sum': 45, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001001; b = 6'b100100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 45, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011110; b = 6'b011010; cin = 1'b1; // Expected: {'sum': 57, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011110; b = 6'b011010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 57, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001001; b = 6'b111100; cin = 1'b0; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b001001; b = 6'b111100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111010; b = 6'b001010; cin = 1'b1; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111010; b = 6'b001010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111100; b = 6'b111011; cin = 1'b0; // Expected: {'sum': 55, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111100; b = 6'b111011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 55, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100101; b = 6'b011101; cin = 1'b0; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100101; b = 6'b011101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101101; b = 6'b101011; cin = 1'b0; // Expected: {'sum': 24, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b101101; b = 6'b101011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010000; b = 6'b100110; cin = 1'b0; // Expected: {'sum': 54, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b010000; b = 6'b100110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010100; b = 6'b111100; cin = 1'b1; // Expected: {'sum': 17, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b010100; b = 6'b111100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 17, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110010; b = 6'b000100; cin = 1'b0; // Expected: {'sum': 54, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b110010; b = 6'b000100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 54, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110110; b = 6'b010101; cin = 1'b0; // Expected: {'sum': 11, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110110; b = 6'b010101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111010; b = 6'b001100; cin = 1'b0; // Expected: {'sum': 6, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111010; b = 6'b001100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110111; b = 6'b010110; cin = 1'b0; // Expected: {'sum': 13, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110111; b = 6'b010110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010101; b = 6'b101010; cin = 1'b0; // Expected: {'sum': 63, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b010101; b = 6'b101010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 63, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011101; b = 6'b000001; cin = 1'b1; // Expected: {'sum': 31, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011101; b = 6'b000001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 31, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001000; b = 6'b001100; cin = 1'b0; // Expected: {'sum': 20, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001000; b = 6'b001100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 20, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100100; b = 6'b110000; cin = 1'b0; // Expected: {'sum': 20, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100100; b = 6'b110000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 20, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111111; b = 6'b110000; cin = 1'b1; // Expected: {'sum': 48, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111111; b = 6'b110000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 33,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 48, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110100; b = 6'b110010; cin = 1'b1; // Expected: {'sum': 39, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110100; b = 6'b110010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 34,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 39, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
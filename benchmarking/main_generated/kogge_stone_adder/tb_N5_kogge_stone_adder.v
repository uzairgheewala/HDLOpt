
`timescale 1ns / 1ps

module tb_N5_kogge_stone_adder;

    // Parameters
    
    parameter N = 5;
    
     
    // Inputs
    
    reg  [4:0] a;
    
    reg  [4:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [4:0] sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    kogge_stone_adder  #( N ) uut (
        
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
        
        a = 5'b10101; b = 5'b11110; cin = 1'b1; // Expected: {'sum': 20, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10101; b = 5'b11110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 20, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11000; b = 5'b11101; cin = 1'b1; // Expected: {'sum': 22, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11000; b = 5'b11101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 22, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11101; b = 5'b11011; cin = 1'b0; // Expected: {'sum': 24, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11101; b = 5'b11011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b00011; b = 5'b00001; cin = 1'b0; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b00011; b = 5'b00001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01011; b = 5'b11010; cin = 1'b0; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01011; b = 5'b11010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01011; b = 5'b01000; cin = 1'b0; // Expected: {'sum': 19, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b01011; b = 5'b01000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 19, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01011; b = 5'b01010; cin = 1'b0; // Expected: {'sum': 21, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b01011; b = 5'b01010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10000; b = 5'b11010; cin = 1'b1; // Expected: {'sum': 11, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10000; b = 5'b11010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 11, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10101; b = 5'b00111; cin = 1'b1; // Expected: {'sum': 29, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b10101; b = 5'b00111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 29, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01100; b = 5'b01000; cin = 1'b1; // Expected: {'sum': 21, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b01100; b = 5'b01000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 21, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10001; b = 5'b01010; cin = 1'b0; // Expected: {'sum': 27, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b10001; b = 5'b01010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 27, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11111; b = 5'b11111; cin = 1'b0; // Expected: {'sum': 30, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11111; b = 5'b11111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01111; b = 5'b10101; cin = 1'b1; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01111; b = 5'b10101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01011; b = 5'b11110; cin = 1'b1; // Expected: {'sum': 10, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01011; b = 5'b11110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01001; b = 5'b00011; cin = 1'b0; // Expected: {'sum': 12, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b01001; b = 5'b00011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10011; b = 5'b01011; cin = 1'b0; // Expected: {'sum': 30, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b10011; b = 5'b01011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11001; b = 5'b00100; cin = 1'b1; // Expected: {'sum': 30, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b11001; b = 5'b00100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 30, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11100; b = 5'b10111; cin = 1'b0; // Expected: {'sum': 19, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11100; b = 5'b10111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 19, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01001; b = 5'b11100; cin = 1'b0; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01001; b = 5'b11100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11100; b = 5'b00111; cin = 1'b1; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11100; b = 5'b00111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b00000; b = 5'b01001; cin = 1'b1; // Expected: {'sum': 10, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b00000; b = 5'b01001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01110; b = 5'b11101; cin = 1'b1; // Expected: {'sum': 12, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01110; b = 5'b11101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 12, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01001; b = 5'b01111; cin = 1'b0; // Expected: {'sum': 24, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b01001; b = 5'b01111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 24, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10110; b = 5'b01111; cin = 1'b0; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10110; b = 5'b01111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b00111; b = 5'b00101; cin = 1'b1; // Expected: {'sum': 13, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b00111; b = 5'b00101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11001; b = 5'b11000; cin = 1'b0; // Expected: {'sum': 17, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11001; b = 5'b11000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 17, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11001; b = 5'b01101; cin = 1'b1; // Expected: {'sum': 7, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11001; b = 5'b01101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11101; b = 5'b10101; cin = 1'b0; // Expected: {'sum': 18, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11101; b = 5'b10101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 18, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10101; b = 5'b01101; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10101; b = 5'b01101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10010; b = 5'b10111; cin = 1'b1; // Expected: {'sum': 10, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10010; b = 5'b10111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 10, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b00010; b = 5'b00001; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b00010; b = 5'b00001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01110; b = 5'b00001; cin = 1'b0; // Expected: {'sum': 15, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b01110; b = 5'b00001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 15, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11001; b = 5'b00111; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11001; b = 5'b00111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01110; b = 5'b11001; cin = 1'b1; // Expected: {'sum': 8, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01110; b = 5'b11001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 33,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10101; b = 5'b10011; cin = 1'b0; // Expected: {'sum': 8, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10101; b = 5'b10011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 34,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 8, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
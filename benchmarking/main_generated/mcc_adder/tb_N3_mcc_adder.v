
`timescale 1ns / 1ps

module tb_N3_mcc_adder;

    // Parameters
    
    parameter N = 3;
    
     
    // Inputs
    
    reg  [2:0] a;
    
    reg  [2:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [2:0] sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    mcc_adder  #( N ) uut (
        
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
        
        a = 3'b010; b = 3'b011; cin = 1'b0; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; cin = 1'b1; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; cin = 1'b0; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; cin = 1'b1; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; cin = 1'b0; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; cin = 1'b0; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; cin = 1'b1; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; cin = 1'b1; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; cin = 1'b1; // Expected: {'sum': 6, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; cin = 1'b1; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; cin = 1'b1; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; cin = 1'b0; // Expected: {'sum': 0, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; cin = 1'b0; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; cin = 1'b1; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; cin = 1'b0; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; cin = 1'b0; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; cin = 1'b1; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; cin = 1'b0; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; cin = 1'b0; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; cin = 1'b0; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; cin = 1'b0; // Expected: {'sum': 1, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; cin = 1'b1; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; cin = 1'b1; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; cin = 1'b0; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; cin = 1'b0; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 33,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; cin = 1'b0; // Expected: {'sum': 6, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 34,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 35,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 36,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; cin = 1'b1; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 37,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 38,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 39,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; cin = 1'b0; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 40,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 41,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; cin = 1'b0; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 42,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 43,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 44,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; cin = 1'b0; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 45,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; cin = 1'b0; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 46,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; cin = 1'b1; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 47,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 48,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; cin = 1'b1; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 49,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; cin = 1'b1; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 50,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 51,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; cin = 1'b0; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 52,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 53,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; cin = 1'b1; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 54,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; cin = 1'b0; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 55,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; cin = 1'b1; // Expected: {'sum': 6, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 56,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 57,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; cin = 1'b0; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 58,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; cin = 1'b0; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 59,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; cin = 1'b1; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 60,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; cin = 1'b1; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 61,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; cin = 1'b0; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 62,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; cin = 1'b0; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 63,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; cin = 1'b1; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 64,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; cin = 1'b0; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 65,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; cin = 1'b1; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 66,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; cin = 1'b0; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 67,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 68,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 69,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; cin = 1'b1; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 70,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; cin = 1'b1; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 71,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 72,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; cin = 1'b0; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 73,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; cin = 1'b0; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 74,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; cin = 1'b1; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 75,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; cin = 1'b0; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 76,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; cin = 1'b1; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 77,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 78,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 79,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 80,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; cin = 1'b1; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 81,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 82,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 83,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; cin = 1'b0; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 84,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 85,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; cin = 1'b1; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 86,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 87,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 88,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 89,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; cin = 1'b1; // Expected: {'sum': 4, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 90,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; cin = 1'b0; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 91,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; cin = 1'b1; // Expected: {'sum': 7, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 92,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; cin = 1'b1; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 93,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; cin = 1'b1; // Expected: {'sum': 1, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 94,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 95,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 96,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; cin = 1'b0; // Expected: {'sum': 1, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 97,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 98,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; cin = 1'b1; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 99,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 100,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 101,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; cin = 1'b0; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 102,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; cin = 1'b1; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 103,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 104,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; cin = 1'b1; // Expected: {'sum': 5, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 105,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; cin = 1'b0; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 106,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; cin = 1'b1; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 107,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; cin = 1'b0; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 108,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 109,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 110,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 111,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; cin = 1'b1; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 112,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 113,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; cin = 1'b0; // Expected: {'sum': 4, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 114,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; cin = 1'b0; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 115,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 116,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; cin = 1'b0; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 117,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 118,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; cin = 1'b1; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 119,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 120,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; cin = 1'b1; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 121,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; cin = 1'b0; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 122,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 123,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; cin = 1'b0; // Expected: {'sum': 7, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 124,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; cin = 1'b0; // Expected: {'sum': 5, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 125,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; cin = 1'b0; // Expected: {'sum': 6, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 126,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; cin = 1'b0; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 127,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule

`timescale 1ns / 1ps

module tb_N3_skip_logic;

    // Parameters
    
    parameter N = 3;
    
     
    // Inputs
    
    reg  [2:0] a;
    
    reg  [2:0] b;
    
    reg   cin;
    
    reg   cout;
    
    
    // Outputs
    
    wire   cin_next;
    
    
    // Instantiate the Unit Under Test (UUT)
    skip_logic  #( N ) uut (
        
        .a(a),
        
        .b(b),
        
        .cin(cin),
        
        .cout(cout),
        
        
        .cin_next(cin_next)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        cin = 0;
        
        cout = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 3'b011; b = 3'b101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 0,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 1,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 2,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 3,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 4,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 5,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 6,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 7,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 8,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 9,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 10,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 11,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 12,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 13,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 14,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 15,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 16,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 17,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 18,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 19,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 20,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 21,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 22,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 23,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 24,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 25,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 26,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 27,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 28,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 29,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 30,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 31,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 32,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 33,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 34,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 35,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 36,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 37,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 38,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 39,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 40,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 41,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 42,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 43,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 44,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 45,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 46,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 47,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 48,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 49,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 50,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 51,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 52,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 53,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 54,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 55,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 56,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 57,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 58,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 59,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 60,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 61,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 62,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 63,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 64,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 65,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 66,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 67,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 68,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 69,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 70,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 71,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 72,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 73,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 74,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 75,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 76,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 77,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 78,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 79,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 80,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 81,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 82,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 83,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 84,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 85,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 86,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 87,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 88,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 89,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 90,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 91,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 92,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 93,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 94,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 95,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 96,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 97,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 98,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 99,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 100,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 101,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 102,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 103,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 104,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 105,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 106,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 107,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 108,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 109,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 110,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 111,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 112,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 113,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 114,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 115,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 116,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 117,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 118,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 119,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 120,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 121,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 122,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 123,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 124,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 125,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 126,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 127,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 128,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 129,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 130,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 131,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 132,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 133,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 134,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 135,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 136,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 137,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 138,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 139,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 140,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 141,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 142,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 143,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 144,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 145,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 146,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 147,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 148,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 149,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b000; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b000; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 150,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 151,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 152,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 153,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 154,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 155,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 156,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 157,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 158,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 159,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 160,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 161,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 162,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 163,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 164,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 165,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 166,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 167,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 168,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 169,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 170,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 171,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 172,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 173,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 174,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 175,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 176,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 177,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 178,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 179,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 180,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b000; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b000; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 181,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 182,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 183,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 184,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 185,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 186,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 187,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 188,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 189,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 190,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b100; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b100; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 191,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 192,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 193,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 194,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 195,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 196,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 197,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 198,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 199,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 200,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 201,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 202,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 203,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 204,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b000; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b000; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 205,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 206,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 207,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 208,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 209,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 210,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 211,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 212,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 213,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 214,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 215,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 216,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 217,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b000; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b000; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 218,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 219,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b111; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b111; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 220,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 221,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 222,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 223,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 224,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 225,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 226,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 227,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 228,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 229,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 230,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 231,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 232,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b101; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b101; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 233,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 234,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 235,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b000; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b000; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 236,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 237,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 238,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 239,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 240,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 241,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b101; b = 3'b001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b101; b = 3'b001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 242,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b110; b = 3'b100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b110; b = 3'b100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 243,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 244,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 245,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 246,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 247,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 248,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b111; b = 3'b100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b111; b = 3'b100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 249,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b010; b = 3'b100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b010; b = 3'b100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 250,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b011; b = 3'b110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b011; b = 3'b110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 251,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 252,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b100; b = 3'b001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b100; b = 3'b001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 253,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b000; b = 3'b011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 3'b000; b = 3'b011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 254,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 3'b001; b = 3'b111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 3'b001; b = 3'b111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 255,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
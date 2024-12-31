
`timescale 1ns / 1ps

module tb_N2_skip_logic;

    // Parameters
    
    parameter N = 2;
    
     
    // Inputs
    
    reg  [1:0] a;
    
    reg  [1:0] b;
    
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
        
        a = 2'b10; b = 2'b10; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 0,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 1,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 2,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 3,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 4,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 5,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 6,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 7,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 8,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 9,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 10,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 11,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 12,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 13,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 14,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 15,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 16,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 17,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 18,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 19,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 20,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 21,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 22,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 23,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 24,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 25,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 26,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 27,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 28,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 29,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 30,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 31,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 32,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 33,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 34,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 35,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 36,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 37,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 38,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 39,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 40,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 41,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 42,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 43,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 44,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 45,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 46,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 47,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 48,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 49,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 50,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 51,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 52,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 53,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 54,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 55,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 56,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 57,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 58,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 59,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 60,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 61,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 62,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 63,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
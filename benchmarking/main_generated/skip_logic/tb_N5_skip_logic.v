
`timescale 1ns / 1ps

module tb_N5_skip_logic;

    // Parameters
    
    parameter N = 5;
    
     
    // Inputs
    
    reg  [4:0] a;
    
    reg  [4:0] b;
    
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
        
        a = 5'b11010; b = 5'b01011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11010; b = 5'b01011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 0,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11001; b = 5'b10111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11001; b = 5'b10111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 1,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10110; b = 5'b00010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10110; b = 5'b00010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 2,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10101; b = 5'b01000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10101; b = 5'b01000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 3,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11011; b = 5'b00100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11011; b = 5'b00100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 4,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11001; b = 5'b11111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11001; b = 5'b11111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 5,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10111; b = 5'b01110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10111; b = 5'b01110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 6,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01011; b = 5'b10101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01011; b = 5'b10101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 7,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11110; b = 5'b00101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b11110; b = 5'b00101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 8,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01110; b = 5'b10001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01110; b = 5'b10001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 9,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01101; b = 5'b00111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01101; b = 5'b00111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 10,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01010; b = 5'b10000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b01010; b = 5'b10000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 11,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11100; b = 5'b01010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11100; b = 5'b01010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 12,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b00101; b = 5'b01001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b00101; b = 5'b01001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 13,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b00001; b = 5'b01010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b00001; b = 5'b01010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 14,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b00011; b = 5'b01011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b00011; b = 5'b01011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 15,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b00000; b = 5'b10011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b00000; b = 5'b10011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 16,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01010; b = 5'b00110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b01010; b = 5'b00110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 17,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11101; b = 5'b00011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11101; b = 5'b00011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 18,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01000; b = 5'b00111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01000; b = 5'b00111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 19,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11011; b = 5'b10001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11011; b = 5'b10001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 20,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10011; b = 5'b10011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10011; b = 5'b10011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 21,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11101; b = 5'b00100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11101; b = 5'b00100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 22,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10110; b = 5'b11110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b10110; b = 5'b11110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 23,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10011; b = 5'b00010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b10011; b = 5'b00010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 24,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10101; b = 5'b11100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10101; b = 5'b11100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 25,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01101; b = 5'b00001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b01101; b = 5'b00001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 26,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b01001; b = 5'b00011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b01001; b = 5'b00011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 27,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10000; b = 5'b11100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10000; b = 5'b11100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 28,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b11111; b = 5'b00010; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b11111; b = 5'b00010; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 29,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10011; b = 5'b10101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10011; b = 5'b10101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 30,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10111; b = 5'b00110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 5'b10111; b = 5'b00110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 31,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 5'b10100; b = 5'b10000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 5'b10100; b = 5'b10000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 32,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
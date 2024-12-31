
`timescale 1ns / 1ps

module tb_N7_skip_logic;

    // Parameters
    
    parameter N = 7;
    
     
    // Inputs
    
    reg  [6:0] a;
    
    reg  [6:0] b;
    
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
        
        a = 7'b1001001; b = 7'b1000010; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001001; b = 7'b1000010; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 0,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000010; b = 7'b0111011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000010; b = 7'b0111011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 1,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100111; b = 7'b1000110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100111; b = 7'b1000110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 2,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000111; b = 7'b0001000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000111; b = 7'b0001000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 3,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b1100000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b1100000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 4,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110001; b = 7'b0110101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110001; b = 7'b0110101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 5,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001111; b = 7'b0111111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001111; b = 7'b0111111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 6,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010010; b = 7'b0110001; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010010; b = 7'b0110001; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 7,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101011; b = 7'b1011010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101011; b = 7'b1011010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 8,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100111; b = 7'b0111110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100111; b = 7'b0111110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 9,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111100; b = 7'b0010111; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111100; b = 7'b0010111; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 10,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110111; b = 7'b0100001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110111; b = 7'b0100001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 11,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010010; b = 7'b0011101; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010010; b = 7'b0011101; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 12,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001011; b = 7'b0000001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001011; b = 7'b0000001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 13,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100100; b = 7'b1010101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100100; b = 7'b1010101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 14,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110101; b = 7'b0110111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110101; b = 7'b0110111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 15,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010101; b = 7'b1110011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010101; b = 7'b1110011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 16,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011100; b = 7'b0001111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011100; b = 7'b0001111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 17,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100001; b = 7'b1001011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100001; b = 7'b1001011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 18,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b1110010; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b1110010; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 19,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010011; b = 7'b1011101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010011; b = 7'b1011101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 20,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b0010101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b0010101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 21,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101100; b = 7'b0010010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101100; b = 7'b0010010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 22,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100110; b = 7'b1101110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100110; b = 7'b1101110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 23,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100011; b = 7'b1101110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100011; b = 7'b1101110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 24,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000101; b = 7'b1011001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000101; b = 7'b1011001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 25,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000001; b = 7'b1111100; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000001; b = 7'b1111100; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 26,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b0101010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b0101010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 27,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b0111100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b0111100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 28,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111101; b = 7'b0110110; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111101; b = 7'b0110110; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 29,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1110001; b = 7'b1001000; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1110001; b = 7'b1001000; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 30,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111011; b = 7'b1011011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111011; b = 7'b1011011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 31,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110100; b = 7'b1101100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110100; b = 7'b1101100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 32,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
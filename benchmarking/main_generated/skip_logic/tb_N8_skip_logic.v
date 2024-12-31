
`timescale 1ns / 1ps

module tb_N8_skip_logic;

    // Parameters
    
    parameter N = 8;
    
     
    // Inputs
    
    reg  [7:0] a;
    
    reg  [7:0] b;
    
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
        
        a = 8'b00000010; b = 8'b10001100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000010; b = 8'b10001100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 0,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01110000; b = 8'b11011000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01110000; b = 8'b11011000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 1,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101101; b = 8'b10010110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101101; b = 8'b10010110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 2,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011111; b = 8'b11101011; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011111; b = 8'b11101011; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 3,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100000; b = 8'b01011001; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100000; b = 8'b01011001; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 4,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10001000; b = 8'b11010100; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10001000; b = 8'b11010100; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 5,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11010111; b = 8'b11101011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11010111; b = 8'b11101011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 6,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100101; b = 8'b11101110; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100101; b = 8'b11101110; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 7,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01001100; b = 8'b10110111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01001100; b = 8'b10110111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 8,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11100001; b = 8'b01010111; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11100001; b = 8'b01010111; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 9,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100111; b = 8'b00100011; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100111; b = 8'b00100011; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 10,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100001; b = 8'b00110111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100001; b = 8'b00110111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 11,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111010; b = 8'b10100011; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111010; b = 8'b10100011; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 12,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011100; b = 8'b10001001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011100; b = 8'b10001001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 13,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110000; b = 8'b00100111; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110000; b = 8'b00100111; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 14,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111111; b = 8'b00000010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111111; b = 8'b00000010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 15,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111001; b = 8'b10110101; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111001; b = 8'b10110101; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 16,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00111110; b = 8'b11010010; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00111110; b = 8'b11010010; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 17,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00010100; b = 8'b11010100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00010100; b = 8'b11010100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 18,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00100111; b = 8'b11011000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00100111; b = 8'b11011000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 19,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00000011; b = 8'b00110001; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b00000011; b = 8'b00110001; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 20,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110010; b = 8'b11110101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110010; b = 8'b11110101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 21,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10000000; b = 8'b00010110; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10000000; b = 8'b00010110; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 22,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11111011; b = 8'b01010100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11111011; b = 8'b01010100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 23,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11101010; b = 8'b01000101; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11101010; b = 8'b01000101; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 24,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11011110; b = 8'b11100000; cin = 1'b0; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11011110; b = 8'b11100000; cin = 1'b0; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 25,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01111110; b = 8'b00010111; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01111110; b = 8'b00010111; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 26,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10111111; b = 8'b11011101; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10111111; b = 8'b11011101; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 27,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b10100010; b = 8'b00110000; cin = 1'b1; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b10100010; b = 8'b00110000; cin = 1'b1; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 28,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01100010; b = 8'b01010001; cin = 1'b0; cout = 1'b0; // Expected: {'cin_next': 0}
        #10;
        $display("Test %0d: Inputs: a = 8'b01100010; b = 8'b01010001; cin = 1'b0; cout = 1'b0; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 29,
                 
                 cin_next
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b00110100; b = 8'b10001100; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b00110100; b = 8'b10001100; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 30,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b11110001; b = 8'b00101011; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b11110001; b = 8'b00101011; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
                 31,
                 
                 cin_next
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 8'b01011010; b = 8'b00111110; cin = 1'b1; cout = 1'b1; // Expected: {'cin_next': 1}
        #10;
        $display("Test %0d: Inputs: a = 8'b01011010; b = 8'b00111110; cin = 1'b1; cout = 1'b1; | Outputs: cin_next=%b | Expected: cin_next=%d",
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
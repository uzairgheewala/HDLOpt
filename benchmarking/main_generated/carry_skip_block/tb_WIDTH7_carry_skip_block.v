
`timescale 1ns / 1ps

module tb_WIDTH7_carry_skip_block;

    // Parameters
    
    parameter WIDTH = 7;
    
     
    // Inputs
    
    reg  [6:0] a;
    
    reg  [6:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [6:0] sum;
    
    wire   cout;
    
    wire   block_carry_out;
    
    
    // Instantiate the Unit Under Test (UUT)
    carry_skip_block  #( WIDTH ) uut (
        
        .a(a),
        
        .b(b),
        
        .cin(cin),
        
        
        .sum(sum),
        
        .cout(cout),
        
        .block_carry_out(block_carry_out)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        cin = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 7'b0001011; b = 7'b1001111; cin = 1'b1; // Expected: {'sum': 91, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001011; b = 7'b1001111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 0,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 91, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000011; b = 7'b0110000; cin = 1'b0; // Expected: {'sum': 115, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000011; b = 7'b0110000; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 1,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 115, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b0000011; cin = 1'b1; // Expected: {'sum': 4, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b0000011; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 2,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 4, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001001; b = 7'b1011110; cin = 1'b1; // Expected: {'sum': 104, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001001; b = 7'b1011110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 3,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 104, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001001; b = 7'b1101111; cin = 1'b1; // Expected: {'sum': 57, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001001; b = 7'b1101111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 4,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 57, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111011; b = 7'b0001001; cin = 1'b1; // Expected: {'sum': 5, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111011; b = 7'b0001001; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 5,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 5, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001100; b = 7'b0100111; cin = 1'b1; // Expected: {'sum': 116, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001100; b = 7'b0100111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 6,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 116, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000000; b = 7'b1000001; cin = 1'b0; // Expected: {'sum': 65, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000000; b = 7'b1000001; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 7,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 65, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000011; b = 7'b0101011; cin = 1'b0; // Expected: {'sum': 110, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000011; b = 7'b0101011; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 8,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 110, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011010; b = 7'b0000010; cin = 1'b1; // Expected: {'sum': 29, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011010; b = 7'b0000010; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 9,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 29, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000101; b = 7'b0011000; cin = 1'b1; // Expected: {'sum': 30, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000101; b = 7'b0011000; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 10,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 30, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111101; b = 7'b0000101; cin = 1'b1; // Expected: {'sum': 67, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111101; b = 7'b0000101; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 11,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 67, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101011; b = 7'b0100111; cin = 1'b1; // Expected: {'sum': 19, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101011; b = 7'b0100111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 12,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 19, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0011010; b = 7'b1111010; cin = 1'b0; // Expected: {'sum': 20, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0011010; b = 7'b1111010; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 13,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 20, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101010; b = 7'b1100011; cin = 1'b0; // Expected: {'sum': 13, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101010; b = 7'b1100011; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 14,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 13, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011101; b = 7'b1111111; cin = 1'b0; // Expected: {'sum': 92, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011101; b = 7'b1111111; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 15,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 92, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1100010; b = 7'b0000100; cin = 1'b1; // Expected: {'sum': 103, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1100010; b = 7'b0000100; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 16,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 103, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010101; b = 7'b0100001; cin = 1'b0; // Expected: {'sum': 118, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010101; b = 7'b0100001; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 17,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 118, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111110; b = 7'b0000101; cin = 1'b0; // Expected: {'sum': 3, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111110; b = 7'b0000101; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 18,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 3, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0101100; b = 7'b0111000; cin = 1'b1; // Expected: {'sum': 101, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0101100; b = 7'b0111000; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 19,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 101, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0000010; b = 7'b1101000; cin = 1'b0; // Expected: {'sum': 106, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0000010; b = 7'b1101000; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 20,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 106, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0100111; b = 7'b1001111; cin = 1'b1; // Expected: {'sum': 119, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0100111; b = 7'b1001111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 21,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 119, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0111011; b = 7'b0110011; cin = 1'b1; // Expected: {'sum': 111, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0111011; b = 7'b0110011; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 22,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 111, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1111001; b = 7'b1101111; cin = 1'b1; // Expected: {'sum': 105, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1111001; b = 7'b1101111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 23,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 105, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0010111; b = 7'b1100111; cin = 1'b0; // Expected: {'sum': 126, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0010111; b = 7'b1100111; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 24,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 126, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000011; b = 7'b1101110; cin = 1'b1; // Expected: {'sum': 50, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000011; b = 7'b1101110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 25,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 50, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0110011; b = 7'b1011111; cin = 1'b1; // Expected: {'sum': 19, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b0110011; b = 7'b1011111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 26,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 19, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b1010010; cin = 1'b1; // Expected: {'sum': 34, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b1010010; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 27,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 34, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001101; b = 7'b0001111; cin = 1'b0; // Expected: {'sum': 92, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001101; b = 7'b0001111; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 28,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 92, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1010110; b = 7'b0000001; cin = 1'b0; // Expected: {'sum': 87, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1010110; b = 7'b0000001; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 29,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 87, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b0001010; b = 7'b0110101; cin = 1'b0; // Expected: {'sum': 63, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b0001010; b = 7'b0110101; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 30,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 63, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1011001; b = 7'b1001111; cin = 1'b1; // Expected: {'sum': 41, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1011001; b = 7'b1001111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 31,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 41, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1000100; b = 7'b1010011; cin = 1'b1; // Expected: {'sum': 24, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1000100; b = 7'b1010011; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 32,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 24, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1001111; b = 7'b0010010; cin = 1'b1; // Expected: {'sum': 98, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 7'b1001111; b = 7'b0010010; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 33,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 98, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 7'b1101011; b = 7'b1010101; cin = 1'b0; // Expected: {'sum': 64, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 7'b1101011; b = 7'b1010101; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 34,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 64, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
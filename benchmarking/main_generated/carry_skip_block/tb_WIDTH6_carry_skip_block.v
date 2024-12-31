
`timescale 1ns / 1ps

module tb_WIDTH6_carry_skip_block;

    // Parameters
    
    parameter WIDTH = 6;
    
     
    // Inputs
    
    reg  [5:0] a;
    
    reg  [5:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [5:0] sum;
    
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
        
        a = 6'b100011; b = 6'b001110; cin = 1'b0; // Expected: {'sum': 49, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b100011; b = 6'b001110; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 0,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 49, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111011; b = 6'b000110; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111011; b = 6'b000110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 1,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 2, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010111; b = 6'b110010; cin = 1'b0; // Expected: {'sum': 9, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b010111; b = 6'b110010; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 2,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 9, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100011; b = 6'b101011; cin = 1'b0; // Expected: {'sum': 14, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100011; b = 6'b101011; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 3,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 14, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100101; b = 6'b100001; cin = 1'b1; // Expected: {'sum': 7, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100101; b = 6'b100001; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 4,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 7, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011010; b = 6'b010010; cin = 1'b0; // Expected: {'sum': 44, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011010; b = 6'b010010; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 5,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 44, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001101; b = 6'b011011; cin = 1'b0; // Expected: {'sum': 40, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001101; b = 6'b011011; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 6,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 40, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001010; b = 6'b111100; cin = 1'b0; // Expected: {'sum': 6, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b001010; b = 6'b111100; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 7,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 6, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001100; b = 6'b001011; cin = 1'b0; // Expected: {'sum': 23, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001100; b = 6'b001011; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 8,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 23, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100110; b = 6'b110001; cin = 1'b1; // Expected: {'sum': 24, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100110; b = 6'b110001; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 9,
                 
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
        
        a = 6'b110101; b = 6'b111111; cin = 1'b0; // Expected: {'sum': 52, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110101; b = 6'b111111; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 10,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 52, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001111; b = 6'b001111; cin = 1'b1; // Expected: {'sum': 31, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001111; b = 6'b001111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 11,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 31, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100100; b = 6'b010111; cin = 1'b1; // Expected: {'sum': 60, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b100100; b = 6'b010111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 12,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 60, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001101; b = 6'b011010; cin = 1'b0; // Expected: {'sum': 39, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001101; b = 6'b011010; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 13,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 39, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101100; b = 6'b110100; cin = 1'b1; // Expected: {'sum': 33, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b101100; b = 6'b110100; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 14,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 33, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111011; b = 6'b101001; cin = 1'b1; // Expected: {'sum': 37, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111011; b = 6'b101001; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 15,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 37, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b000001; b = 6'b011100; cin = 1'b1; // Expected: {'sum': 30, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000001; b = 6'b011100; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 16,
                 
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
        
        a = 6'b011001; b = 6'b100011; cin = 1'b0; // Expected: {'sum': 60, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b011001; b = 6'b100011; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 17,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 60, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b100011; b = 6'b101010; cin = 1'b0; // Expected: {'sum': 13, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100011; b = 6'b101010; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 18,
                 
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
        
        a = 6'b110111; b = 6'b010111; cin = 1'b1; // Expected: {'sum': 15, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110111; b = 6'b010111; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 19,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 15, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b101000; b = 6'b010100; cin = 1'b0; // Expected: {'sum': 60, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b101000; b = 6'b010100; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 20,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 60, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110011; b = 6'b001100; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110011; b = 6'b001100; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 21,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 0, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010110; b = 6'b111010; cin = 1'b0; // Expected: {'sum': 16, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b010110; b = 6'b111010; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 22,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 16, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010000; b = 6'b101110; cin = 1'b1; // Expected: {'sum': 63, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b010000; b = 6'b101110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 23,
                 
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
        
        a = 6'b111110; b = 6'b101001; cin = 1'b1; // Expected: {'sum': 40, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111110; b = 6'b101001; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 24,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 40, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110111; b = 6'b111011; cin = 1'b0; // Expected: {'sum': 50, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110111; b = 6'b111011; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
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
        
        a = 6'b001111; b = 6'b000110; cin = 1'b1; // Expected: {'sum': 22, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001111; b = 6'b000110; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 26,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 22, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b010011; b = 6'b101100; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b010011; b = 6'b101100; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 27,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 0, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001101; b = 6'b111001; cin = 1'b0; // Expected: {'sum': 6, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b001101; b = 6'b111001; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 28,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 6, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b011000; b = 6'b101010; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b011000; b = 6'b101010; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 29,
                 
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
        
        a = 6'b100110; b = 6'b110000; cin = 1'b1; // Expected: {'sum': 23, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b100110; b = 6'b110000; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 30,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 23, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b110011; b = 6'b101100; cin = 1'b1; // Expected: {'sum': 32, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b110011; b = 6'b101100; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 31,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 32, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b111010; b = 6'b100010; cin = 1'b0; // Expected: {'sum': 28, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 6'b111010; b = 6'b100010; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 32,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 28, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 6'b001110; b = 6'b001111; cin = 1'b0; // Expected: {'sum': 29, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b001110; b = 6'b001111; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 33,
                 
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
        
        a = 6'b000011; b = 6'b101001; cin = 1'b0; // Expected: {'sum': 44, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 6'b000011; b = 6'b101001; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 34,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 44, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
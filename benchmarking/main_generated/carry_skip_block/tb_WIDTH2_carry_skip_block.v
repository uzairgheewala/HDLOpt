
`timescale 1ns / 1ps

module tb_WIDTH2_carry_skip_block;

    // Parameters
    
    parameter WIDTH = 2;
    
     
    // Inputs
    
    reg  [1:0] a;
    
    reg  [1:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [1:0] sum;
    
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
        
        a = 2'b11; b = 2'b11; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 0,
                 
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
        
        a = 2'b10; b = 2'b10; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 1,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 1, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 2,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 2, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 3,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 3, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 4,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 3, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; cin = 1'b1; // Expected: {'sum': 2, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 5,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 2, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; cin = 1'b0; // Expected: {'sum': 2, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 6,
                 
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
        
        a = 2'b10; b = 2'b10; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 7,
                 
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
        
        a = 2'b11; b = 2'b01; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 8,
                 
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
        
        a = 2'b11; b = 2'b01; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 9,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 1, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 10,
                 
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
        
        a = 2'b00; b = 2'b00; cin = 1'b0; // Expected: {'sum': 0, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 11,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 0, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 12,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 1, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 13,
                 
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
        
        a = 2'b10; b = 2'b00; cin = 1'b1; // Expected: {'sum': 3, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 14,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 3, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 15,
                 
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
        
        a = 2'b10; b = 2'b00; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 16,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 2, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 17,
                 
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
        
        a = 2'b00; b = 2'b00; cin = 1'b1; // Expected: {'sum': 1, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 18,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 1, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; cin = 1'b1; // Expected: {'sum': 3, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 19,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 3, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 20,
                 
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
        
        a = 2'b01; b = 2'b00; cin = 1'b0; // Expected: {'sum': 1, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 21,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 1, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 22,
                 
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
        
        a = 2'b01; b = 2'b00; cin = 1'b1; // Expected: {'sum': 2, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 23,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 2, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 24,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 1, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; cin = 1'b0; // Expected: {'sum': 1, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 25,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 1, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 26,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 1, 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; cin = 1'b1; // Expected: {'sum': 3, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; cin = 1'b1; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 27,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 3, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 28,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 3, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1, 'block_carry_out': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 29,
                 
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
        
        a = 2'b00; b = 2'b11; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 30,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 3, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0, 'block_carry_out': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; cin = 1'b0; | Outputs: sum=%b, cout=%b, block_carry_out=%b | Expected: sum=%d, cout=%d, block_carry_out=%d",
                 31,
                 
                 sum, 
                 
                 cout, 
                 
                 block_carry_out
                 , 
                 
                 2, 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
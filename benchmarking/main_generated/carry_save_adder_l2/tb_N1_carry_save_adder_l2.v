
`timescale 1ns / 1ps

module tb_N1_carry_save_adder_l2;

    // Parameters
    
    parameter N = 1;
    
     
    // Inputs
    
    reg   a;
    
    reg   b;
    
    reg   c;
    
    
    // Outputs
    
    wire   sum;
    
    wire   carry;
    
    
    // Instantiate the Unit Under Test (UUT)
    carry_save_adder_l2  #( N ) uut (
        
        .a(a),
        
        .b(b),
        
        .c(c),
        
        
        .sum(sum),
        
        .carry(carry)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        c = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 1'b1; b = 1'b0; c = 1'b1; // Expected: {'sum': 0, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b0; c = 1'b1; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 0,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b1; c = 1'b1; // Expected: {'sum': 1, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b1; c = 1'b1; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 1,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b0; c = 1'b1; // Expected: {'sum': 1, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b0; c = 1'b1; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 2,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b1; c = 1'b1; // Expected: {'sum': 0, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b1; c = 1'b1; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 3,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b0; c = 1'b0; // Expected: {'sum': 0, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b0; c = 1'b0; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 4,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b0; c = 1'b0; // Expected: {'sum': 1, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b0; c = 1'b0; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 5,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b1; c = 1'b0; // Expected: {'sum': 0, 'carry': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b1; c = 1'b0; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 6,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b1; c = 1'b0; // Expected: {'sum': 1, 'carry': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b1; c = 1'b0; | Outputs: sum=%b, carry=%b | Expected: sum=%d, carry=%d",
                 7,
                 
                 sum, 
                 
                 carry
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
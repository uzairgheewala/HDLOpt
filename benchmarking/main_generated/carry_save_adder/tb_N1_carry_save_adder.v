
`timescale 1ns / 1ps

module tb_N1_carry_save_adder;

    // Parameters
    
    parameter N = 1;
    
     
    // Inputs
    
    reg   a;
    
    reg   b;
    
    reg   c;
    
    
    // Outputs
    
    wire  [1:0] result;
    
    
    // Instantiate the Unit Under Test (UUT)
    carry_save_adder  #( N ) uut (
        
        .a(a),
        
        .b(b),
        
        .c(c),
        
        
        .result(result)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        c = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 1'b0; b = 1'b1; c = 1'b1; // Expected: {'result': 2}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b1; c = 1'b1; | Outputs: result=%b | Expected: result=%d",
                 0,
                 
                 result
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b1; c = 1'b0; // Expected: {'result': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b1; c = 1'b0; | Outputs: result=%b | Expected: result=%d",
                 1,
                 
                 result
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b0; c = 1'b0; // Expected: {'result': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b0; c = 1'b0; | Outputs: result=%b | Expected: result=%d",
                 2,
                 
                 result
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b1; c = 1'b1; // Expected: {'result': 3}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b1; c = 1'b1; | Outputs: result=%b | Expected: result=%d",
                 3,
                 
                 result
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b0; c = 1'b1; // Expected: {'result': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b0; c = 1'b1; | Outputs: result=%b | Expected: result=%d",
                 4,
                 
                 result
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b0; c = 1'b0; // Expected: {'result': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b0; c = 1'b0; | Outputs: result=%b | Expected: result=%d",
                 5,
                 
                 result
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b0; c = 1'b1; // Expected: {'result': 2}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b0; c = 1'b1; | Outputs: result=%b | Expected: result=%d",
                 6,
                 
                 result
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b1; c = 1'b0; // Expected: {'result': 2}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b1; c = 1'b0; | Outputs: result=%b | Expected: result=%d",
                 7,
                 
                 result
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
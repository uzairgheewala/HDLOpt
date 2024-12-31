
`timescale 1ns / 1ps

module tb__xor2;

    // Parameters
    
     
    // Inputs
    
    reg   i0;
    
    reg   i1;
    
    
    // Outputs
    
    wire   o;
    
    
    // Instantiate the Unit Under Test (UUT)
    xor2  uut (
        
        .i0(i0),
        
        .i1(i1),
        
        
        .o(o)
        
    );
    
    initial begin
        // Initialize Inputs
        
        i0 = 0;
        
        i1 = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        i0 = 1'b1; i1 = 1'b1; // Expected: {'o': 0}
        #10;
        $display("Test %0d: Inputs: i0 = 1'b1; i1 = 1'b1; | Outputs: o=%b | Expected: o=%d",
                 0,
                 
                 o
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        i0 = 1'b1; i1 = 1'b0; // Expected: {'o': 1}
        #10;
        $display("Test %0d: Inputs: i0 = 1'b1; i1 = 1'b0; | Outputs: o=%b | Expected: o=%d",
                 1,
                 
                 o
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        i0 = 1'b0; i1 = 1'b1; // Expected: {'o': 1}
        #10;
        $display("Test %0d: Inputs: i0 = 1'b0; i1 = 1'b1; | Outputs: o=%b | Expected: o=%d",
                 2,
                 
                 o
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        i0 = 1'b0; i1 = 1'b0; // Expected: {'o': 0}
        #10;
        $display("Test %0d: Inputs: i0 = 1'b0; i1 = 1'b0; | Outputs: o=%b | Expected: o=%d",
                 3,
                 
                 o
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
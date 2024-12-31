
`timescale 1ns / 1ps

module tb__small_circle;

    // Parameters
    
     
    // Inputs
    
    reg   Gi;
    
    
    // Outputs
    
    wire   Ci;
    
    
    // Instantiate the Unit Under Test (UUT)
    small_circle  uut (
        
        .Gi(Gi),
        
        
        .Ci(Ci)
        
    );
    
    initial begin
        // Initialize Inputs
        
        Gi = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        Gi = 1'b1; // Expected: {'Ci': 1}
        #10;
        $display("Test %0d: Inputs: Gi = 1'b1; | Outputs: Ci=%b | Expected: Ci=%d",
                 0,
                 
                 Ci
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        Gi = 1'b0; // Expected: {'Ci': 0}
        #10;
        $display("Test %0d: Inputs: Gi = 1'b0; | Outputs: Ci=%b | Expected: Ci=%d",
                 1,
                 
                 Ci
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
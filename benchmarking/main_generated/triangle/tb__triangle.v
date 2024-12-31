
`timescale 1ns / 1ps

module tb__triangle;

    // Parameters
    
     
    // Inputs
    
    reg   Pi;
    
    reg   CiPrev;
    
    
    // Outputs
    
    wire   Si;
    
    
    // Instantiate the Unit Under Test (UUT)
    triangle  uut (
        
        .Pi(Pi),
        
        .CiPrev(CiPrev),
        
        
        .Si(Si)
        
    );
    
    initial begin
        // Initialize Inputs
        
        Pi = 0;
        
        CiPrev = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        Pi = 1'b0; CiPrev = 1'b1; // Expected: {'Si': 1}
        #10;
        $display("Test %0d: Inputs: Pi = 1'b0; CiPrev = 1'b1; | Outputs: Si=%b | Expected: Si=%d",
                 0,
                 
                 Si
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        Pi = 1'b1; CiPrev = 1'b1; // Expected: {'Si': 0}
        #10;
        $display("Test %0d: Inputs: Pi = 1'b1; CiPrev = 1'b1; | Outputs: Si=%b | Expected: Si=%d",
                 1,
                 
                 Si
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        Pi = 1'b1; CiPrev = 1'b0; // Expected: {'Si': 1}
        #10;
        $display("Test %0d: Inputs: Pi = 1'b1; CiPrev = 1'b0; | Outputs: Si=%b | Expected: Si=%d",
                 2,
                 
                 Si
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        Pi = 1'b0; CiPrev = 1'b0; // Expected: {'Si': 0}
        #10;
        $display("Test %0d: Inputs: Pi = 1'b0; CiPrev = 1'b0; | Outputs: Si=%b | Expected: Si=%d",
                 3,
                 
                 Si
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
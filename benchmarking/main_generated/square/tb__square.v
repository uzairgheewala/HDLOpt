
`timescale 1ns / 1ps

module tb__square;

    // Parameters
    
     
    // Inputs
    
    reg   Ai;
    
    reg   Bi;
    
    
    // Outputs
    
    wire   G;
    
    wire   P;
    
    
    // Instantiate the Unit Under Test (UUT)
    square  uut (
        
        .Ai(Ai),
        
        .Bi(Bi),
        
        
        .G(G),
        
        .P(P)
        
    );
    
    initial begin
        // Initialize Inputs
        
        Ai = 0;
        
        Bi = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        Ai = 1'b1; Bi = 1'b1; // Expected: {'G': 1, 'P': 0}
        #10;
        $display("Test %0d: Inputs: Ai = 1'b1; Bi = 1'b1; | Outputs: G=%b, P=%b | Expected: G=%d, P=%d",
                 0,
                 
                 G, 
                 
                 P
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        Ai = 1'b1; Bi = 1'b0; // Expected: {'G': 0, 'P': 1}
        #10;
        $display("Test %0d: Inputs: Ai = 1'b1; Bi = 1'b0; | Outputs: G=%b, P=%b | Expected: G=%d, P=%d",
                 1,
                 
                 G, 
                 
                 P
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        Ai = 1'b0; Bi = 1'b1; // Expected: {'G': 0, 'P': 1}
        #10;
        $display("Test %0d: Inputs: Ai = 1'b0; Bi = 1'b1; | Outputs: G=%b, P=%b | Expected: G=%d, P=%d",
                 2,
                 
                 G, 
                 
                 P
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        Ai = 1'b0; Bi = 1'b0; // Expected: {'G': 0, 'P': 0}
        #10;
        $display("Test %0d: Inputs: Ai = 1'b0; Bi = 1'b0; | Outputs: G=%b, P=%b | Expected: G=%d, P=%d",
                 3,
                 
                 G, 
                 
                 P
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
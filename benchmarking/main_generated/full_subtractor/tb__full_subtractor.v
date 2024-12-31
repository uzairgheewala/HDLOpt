
`timescale 1ns / 1ps

module tb__full_subtractor;

    // Parameters
    
     
    // Inputs
    
    reg   a;
    
    reg   b;
    
    reg   bin;
    
    
    // Outputs
    
    wire   diff;
    
    wire   bout;
    
    
    // Instantiate the Unit Under Test (UUT)
    full_subtractor  uut (
        
        .a(a),
        
        .b(b),
        
        .bin(bin),
        
        
        .diff(diff),
        
        .bout(bout)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        bin = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 1'b1; b = 1'b0; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b0; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b1; bin = 1'b1; // Expected: {'diff': 1, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b1; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b0; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b0; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b1; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b1; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b0; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b0; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b1; bin = 1'b1; // Expected: {'diff': 0, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b1; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b0; bin = 1'b1; // Expected: {'diff': 1, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b0; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b1; bin = 1'b0; // Expected: {'diff': 1, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b1; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
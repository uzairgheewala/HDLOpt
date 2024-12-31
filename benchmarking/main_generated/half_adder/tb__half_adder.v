
`timescale 1ns / 1ps

module tb__half_adder;

    // Parameters
    
     
    // Inputs
    
    reg   a;
    
    reg   b;
    
    
    // Outputs
    
    wire   sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    half_adder  uut (
        
        .a(a),
        
        .b(b),
        
        
        .sum(sum),
        
        .cout(cout)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 1'b0; b = 1'b0; // Expected: {'sum': 0, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b0; // Expected: {'sum': 1, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b1; b = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 1'b1; b = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 1'b0; b = 1'b1; // Expected: {'sum': 1, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 1'b0; b = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
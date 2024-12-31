
`timescale 1ns / 1ps

module tb__prefix_sum_logic;

    // Parameters
    
     
    // Inputs
    
    reg   p_i;
    
    reg   g_i;
    
    reg   p_j;
    
    reg   g_j;
    
    
    // Outputs
    
    wire   p_kj;
    
    wire   g_kj;
    
    
    // Instantiate the Unit Under Test (UUT)
    prefix_sum_logic  uut (
        
        .p_i(p_i),
        
        .g_i(g_i),
        
        .p_j(p_j),
        
        .g_j(g_j),
        
        
        .p_kj(p_kj),
        
        .g_kj(g_kj)
        
    );
    
    initial begin
        // Initialize Inputs
        
        p_i = 0;
        
        g_i = 0;
        
        p_j = 0;
        
        g_j = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        p_i = 1'b1; g_i = 1'b1; p_j = 1'b0; g_j = 1'b0; // Expected: {'p_kj': 0, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b1; g_i = 1'b1; p_j = 1'b0; g_j = 1'b0; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 0,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b0; g_i = 1'b0; p_j = 1'b0; g_j = 1'b1; // Expected: {'p_kj': 0, 'g_kj': 0}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b0; g_i = 1'b0; p_j = 1'b0; g_j = 1'b1; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 1,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b0; g_i = 1'b0; p_j = 1'b1; g_j = 1'b1; // Expected: {'p_kj': 0, 'g_kj': 0}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b0; g_i = 1'b0; p_j = 1'b1; g_j = 1'b1; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 2,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b1; g_i = 1'b0; p_j = 1'b0; g_j = 1'b0; // Expected: {'p_kj': 0, 'g_kj': 0}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b1; g_i = 1'b0; p_j = 1'b0; g_j = 1'b0; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 3,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b1; g_i = 1'b0; p_j = 1'b1; g_j = 1'b1; // Expected: {'p_kj': 1, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b1; g_i = 1'b0; p_j = 1'b1; g_j = 1'b1; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 4,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b1; g_i = 1'b1; p_j = 1'b0; g_j = 1'b1; // Expected: {'p_kj': 0, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b1; g_i = 1'b1; p_j = 1'b0; g_j = 1'b1; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 5,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b1; g_i = 1'b0; p_j = 1'b1; g_j = 1'b0; // Expected: {'p_kj': 1, 'g_kj': 0}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b1; g_i = 1'b0; p_j = 1'b1; g_j = 1'b0; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 6,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b0; g_i = 1'b0; p_j = 1'b1; g_j = 1'b0; // Expected: {'p_kj': 0, 'g_kj': 0}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b0; g_i = 1'b0; p_j = 1'b1; g_j = 1'b0; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 7,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b0; g_i = 1'b0; p_j = 1'b0; g_j = 1'b0; // Expected: {'p_kj': 0, 'g_kj': 0}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b0; g_i = 1'b0; p_j = 1'b0; g_j = 1'b0; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 8,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b0; g_i = 1'b1; p_j = 1'b1; g_j = 1'b0; // Expected: {'p_kj': 0, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b0; g_i = 1'b1; p_j = 1'b1; g_j = 1'b0; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 9,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b1; g_i = 1'b0; p_j = 1'b0; g_j = 1'b1; // Expected: {'p_kj': 0, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b1; g_i = 1'b0; p_j = 1'b0; g_j = 1'b1; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 10,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b1; g_i = 1'b1; p_j = 1'b1; g_j = 1'b0; // Expected: {'p_kj': 1, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b1; g_i = 1'b1; p_j = 1'b1; g_j = 1'b0; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 11,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b0; g_i = 1'b1; p_j = 1'b0; g_j = 1'b1; // Expected: {'p_kj': 0, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b0; g_i = 1'b1; p_j = 1'b0; g_j = 1'b1; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 12,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b0; g_i = 1'b1; p_j = 1'b1; g_j = 1'b1; // Expected: {'p_kj': 0, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b0; g_i = 1'b1; p_j = 1'b1; g_j = 1'b1; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 13,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b0; g_i = 1'b1; p_j = 1'b0; g_j = 1'b0; // Expected: {'p_kj': 0, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b0; g_i = 1'b1; p_j = 1'b0; g_j = 1'b0; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 14,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        p_i = 1'b1; g_i = 1'b1; p_j = 1'b1; g_j = 1'b1; // Expected: {'p_kj': 1, 'g_kj': 1}
        #10;
        $display("Test %0d: Inputs: p_i = 1'b1; g_i = 1'b1; p_j = 1'b1; g_j = 1'b1; | Outputs: p_kj=%b, g_kj=%b | Expected: p_kj=%d, g_kj=%d",
                 15,
                 
                 p_kj, 
                 
                 g_kj
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
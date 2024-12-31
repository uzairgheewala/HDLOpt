
`timescale 1ns / 1ps

module tb_N2_ripple_carry_subtractor;

    // Parameters
    
    parameter N = 2;
    
     
    // Inputs
    
    reg  [1:0] a;
    
    reg  [1:0] b;
    
    reg   bin;
    
    
    // Outputs
    
    wire  [1:0] diff;
    
    wire   bout;
    
    
    // Instantiate the Unit Under Test (UUT)
    ripple_carry_subtractor  #( N ) uut (
        
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
        
        a = 2'b10; b = 2'b10; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 0,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; bin = 1'b1; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 1,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 2,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; bin = 1'b1; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 3,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 4,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; bin = 1'b0; // Expected: {'diff': 3, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 5,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; bin = 1'b0; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 6,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 7,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; bin = 1'b1; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 8,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; bin = 1'b0; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 9,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 10,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; bin = 1'b1; // Expected: {'diff': 2, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 11,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; bin = 1'b1; // Expected: {'diff': 0, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 12,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; bin = 1'b1; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 13,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; bin = 1'b0; // Expected: {'diff': 1, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 14,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; bin = 1'b1; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 15,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; bin = 1'b1; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 16,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; bin = 1'b1; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 17,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; bin = 1'b1; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 18,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; bin = 1'b0; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 19,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 20,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; bin = 1'b1; // Expected: {'diff': 1, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 21,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 22,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; bin = 1'b1; // Expected: {'diff': 1, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 23,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 24,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 25,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; bin = 1'b0; // Expected: {'diff': 1, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 26,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; bin = 1'b0; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 27,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; bin = 1'b0; // Expected: {'diff': 3, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 28,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; bin = 1'b0; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 29,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; bin = 1'b1; // Expected: {'diff': 0, 'bout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; bin = 1'b1; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 30,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; bin = 1'b0; // Expected: {'diff': 2, 'bout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; bin = 1'b0; | Outputs: diff=%b, bout=%b | Expected: diff=%d, bout=%d",
                 31,
                 
                 diff, 
                 
                 bout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
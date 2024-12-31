
`timescale 1ns / 1ps

module tb_N2_restoring_divider;

    // Parameters
    
    parameter N = 2;
    
     
    // Inputs
    
    reg   clk;
    
    reg   rst;
    
    reg   start;
    
    reg  [1:0] X;
    
    reg  [1:0] Y;
    
    
    // Outputs
    
    wire  [1:0] quot;
    
    wire  [1:0] rem;
    
    wire   valid;
    
    
    // Instantiate the Unit Under Test (UUT)
    restoring_divider  #( N ) uut (
        
        .clk(clk),
        
        .rst(rst),
        
        .start(start),
        
        .X(X),
        
        .Y(Y),
        
        
        .quot(quot),
        
        .rem(rem),
        
        .valid(valid)
        
    );

    // Clock generation 
    
    
            always begin
                #5 clk = ~clk;
            end
            
    

    
    
            always begin
                #99 rst = 1'b1; 
            end
            
    
    
    initial begin
        // Initialize Inputs
        
        clk = 0;
        
        rst = 0;
        
        start = 0;
        
        X = 0;
        
        Y = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        #10 X = 2'b01; Y = 2'b11; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b01; Y = 2'b11; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 0,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b00; Y = 2'b10; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b00; Y = 2'b10; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 1,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b10; Y = 2'b10; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b10; Y = 2'b10; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 2,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b00; Y = 2'b11; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b00; Y = 2'b11; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 3,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b11; Y = 2'b01; // Expected: {'quot': 3, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b11; Y = 2'b01; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 4,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b01; Y = 2'b10; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b01; Y = 2'b10; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 5,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b10; Y = 2'b10; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b10; Y = 2'b10; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 6,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b10; Y = 2'b11; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b10; Y = 2'b11; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 7,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b11; Y = 2'b11; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b11; Y = 2'b11; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 8,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b00; Y = 2'b01; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b00; Y = 2'b01; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 9,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b01; Y = 2'b10; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b01; Y = 2'b10; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 10,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 2'b11; Y = 2'b01; // Expected: {'quot': 3, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 2'b11; Y = 2'b01; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 11,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
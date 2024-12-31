
`timescale 1ns / 1ps

module tb_N3_restoring_divider;

    // Parameters
    
    parameter N = 3;
    
     
    // Inputs
    
    reg   clk;
    
    reg   rst;
    
    reg   start;
    
    reg  [2:0] X;
    
    reg  [2:0] Y;
    
    
    // Outputs
    
    wire  [2:0] quot;
    
    wire  [2:0] rem;
    
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
        
        #10 X = 3'b010; Y = 3'b111; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b010; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 0,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b101; Y = 3'b001; // Expected: {'quot': 5, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b101; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 1,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b110; Y = 3'b100; // Expected: {'quot': 1, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b110; Y = 3'b100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 2,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b111; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 3,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b000; Y = 3'b001; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b000; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 4,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b101; Y = 3'b110; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b101; Y = 3'b110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 5,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b001; Y = 3'b110; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b001; Y = 3'b110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 6,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b000; Y = 3'b101; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b000; Y = 3'b101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 7,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b111; Y = 3'b010; // Expected: {'quot': 3, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b111; Y = 3'b010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 8,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b110; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 9,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b111; Y = 3'b110; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b111; Y = 3'b110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 10,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b001; // Expected: {'quot': 3, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
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
        
        #10 X = 3'b000; Y = 3'b001; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b000; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 12,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b110; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 13,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b000; Y = 3'b011; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b000; Y = 3'b011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 14,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b101; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 15,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b101; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 16,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b111; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 17,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b001; // Expected: {'quot': 4, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 18,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b010; Y = 3'b101; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b010; Y = 3'b101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 19,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b001; // Expected: {'quot': 4, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 20,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b010; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 21,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b010; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 22,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b001; Y = 3'b010; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b001; Y = 3'b010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 23,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b101; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 24,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b010; Y = 3'b100; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b010; Y = 3'b100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 25,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b111; Y = 3'b001; // Expected: {'quot': 7, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b111; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 26,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b011; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 27,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b001; // Expected: {'quot': 4, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 28,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b111; Y = 3'b011; // Expected: {'quot': 2, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b111; Y = 3'b011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 29,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b101; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 30,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b100; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 31,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b111; Y = 3'b110; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b111; Y = 3'b110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 32,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b000; Y = 3'b111; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b000; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 33,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b010; Y = 3'b110; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b010; Y = 3'b110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 34,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b101; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 35,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b001; Y = 3'b001; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b001; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 36,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b101; Y = 3'b010; // Expected: {'quot': 2, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b101; Y = 3'b010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 37,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b000; Y = 3'b111; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b000; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 38,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b010; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 39,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b111; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 40,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b011; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 41,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b110; Y = 3'b111; // Expected: {'quot': 0, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b110; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 42,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b101; Y = 3'b110; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b101; Y = 3'b110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 43,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b010; Y = 3'b111; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b010; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 44,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b110; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 45,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b000; Y = 3'b011; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b000; Y = 3'b011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 46,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b101; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 47,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b010; Y = 3'b001; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b010; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 48,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b101; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 49,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b011; Y = 3'b111; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b011; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 50,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b000; Y = 3'b001; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b000; Y = 3'b001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 51,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b100; Y = 3'b111; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b100; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 52,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b010; Y = 3'b011; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b010; Y = 3'b011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 53,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b111; Y = 3'b111; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b111; Y = 3'b111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 54,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 3'b010; Y = 3'b010; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 3'b010; Y = 3'b010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 55,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
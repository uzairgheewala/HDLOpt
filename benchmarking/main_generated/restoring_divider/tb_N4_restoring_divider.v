
`timescale 1ns / 1ps

module tb_N4_restoring_divider;

    // Parameters
    
    parameter N = 4;
    
     
    // Inputs
    
    reg   clk;
    
    reg   rst;
    
    reg   start;
    
    reg  [3:0] X;
    
    reg  [3:0] Y;
    
    
    // Outputs
    
    wire  [3:0] quot;
    
    wire  [3:0] rem;
    
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
        
        #10 X = 4'b1001; Y = 4'b1001; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 0,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b0001; // Expected: {'quot': 7, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 1,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b1000; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 2,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b0100; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 3,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b0100; // Expected: {'quot': 2, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 4,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b0001; // Expected: {'quot': 9, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 5,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 9, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b0110; // Expected: {'quot': 1, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 6,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b0011; // Expected: {'quot': 3, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 7,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0010; // Expected: {'quot': 7, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 8,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 7, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b1100; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 9,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b1000; // Expected: {'quot': 1, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 10,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b0010; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 11,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b1010; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 12,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1000; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 13,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b0100; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 14,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b0011; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 15,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 16,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 17,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b0110; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 18,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 19,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0111; // Expected: {'quot': 2, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 20,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 10}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 21,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b0001; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
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
        
        #10 X = 4'b0000; Y = 4'b0100; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 23,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b0100; // Expected: {'quot': 2, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 24,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1010; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
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
        
        #10 X = 4'b1000; Y = 4'b0001; // Expected: {'quot': 8, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 26,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 8, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b1011; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 27,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b0110; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 28,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b1100; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 29,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b0111; // Expected: {'quot': 1, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 30,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 12}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 31,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 9}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 32,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0100; // Expected: {'quot': 3, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 33,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b0011; // Expected: {'quot': 4, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 34,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 35,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b0010; // Expected: {'quot': 4, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 36,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 10}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 37,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b1010; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 38,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b0100; // Expected: {'quot': 1, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 39,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0001; // Expected: {'quot': 15, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 40,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 15, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 41,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b0100; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 42,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1001; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 43,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b1001; // Expected: {'quot': 0, 'rem': 8}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 44,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 45,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b0100; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 46,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b0011; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 47,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 8}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 48,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 49,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 50,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b0010; // Expected: {'quot': 6, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 51,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 6, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b0101; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
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
        
        #10 X = 4'b0100; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 53,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b1000; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 54,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b0010; // Expected: {'quot': 3, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 55,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b0101; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 56,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b0011; // Expected: {'quot': 4, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 57,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1111; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 58,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 59,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b0110; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 60,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 10}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 61,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b0100; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 62,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b0111; // Expected: {'quot': 0, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 63,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b1010; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 64,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 8}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 65,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 8}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 66,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1011; // Expected: {'quot': 1, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 67,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b0001; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 68,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b0010; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 69,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b1011; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 70,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b1010; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 71,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 72,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1000; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 73,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 74,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 9}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 75,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b0101; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 76,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 77,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 78,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b0001; // Expected: {'quot': 12, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 79,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 12, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b0110; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 80,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b1101; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 81,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 82,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 9}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 83,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b0001; // Expected: {'quot': 3, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 84,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 85,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b0101; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 86,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b0011; // Expected: {'quot': 4, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 87,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1100; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 88,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b0001; // Expected: {'quot': 4, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 89,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1101; // Expected: {'quot': 1, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 90,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b0100; // Expected: {'quot': 2, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 91,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b0100; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 92,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b0001; // Expected: {'quot': 3, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 93,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b0011; // Expected: {'quot': 2, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 94,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b0101; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 95,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b0011; // Expected: {'quot': 4, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 96,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b0010; // Expected: {'quot': 5, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 97,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 5, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1010; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 98,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 99,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b0010; // Expected: {'quot': 6, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 100,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 6, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b1011; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 101,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1010; // Expected: {'quot': 1, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 102,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b0111; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 103,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 104,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b1001; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 105,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b1001; // Expected: {'quot': 1, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 106,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b1000; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 107,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b0110; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 108,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 8}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 109,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 110,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 111,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1001; // Expected: {'quot': 1, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 112,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b1000; // Expected: {'quot': 0, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 113,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 114,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 10}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 115,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 12}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 116,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 12
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b1011; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 117,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b0111; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 118,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 119,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b0111; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 120,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b1100; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 121,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b1010; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 122,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0011; // Expected: {'quot': 5, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 123,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 10}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 124,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 125,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b1010; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 126,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 127,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 10}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 128,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b1010; // Expected: {'quot': 0, 'rem': 9}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 129,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 130,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b0100; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 131,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 132,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b1000; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 133,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 13}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 134,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 13
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b1001; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 135,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b0101; // Expected: {'quot': 2, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 136,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b0001; // Expected: {'quot': 13, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 137,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b0101; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 138,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b1011; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 139,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b0101; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 140,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b0001; // Expected: {'quot': 7, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 141,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b1001; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 142,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 143,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b0010; // Expected: {'quot': 3, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 144,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 11}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 145,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 11
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b1001; // Expected: {'quot': 0, 'rem': 8}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 146,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b1000; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 147,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b1001; // Expected: {'quot': 1, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 148,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b0100; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 149,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 150,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 9}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 151,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1001; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 152,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b1000; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 153,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1100; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 154,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 155,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b1001; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 156,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b0110; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 157,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 158,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 13}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 159,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 13
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b0111; // Expected: {'quot': 1, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 160,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b0100; // Expected: {'quot': 3, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 161,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 10}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 162,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 10
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 163,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 11}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 164,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 11
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b0011; // Expected: {'quot': 4, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 165,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b0010; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 166,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1100; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 167,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b0101; // Expected: {'quot': 2, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 168,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b0110; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 169,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b0001; // Expected: {'quot': 4, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 170,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 171,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b1001; // Expected: {'quot': 1, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 172,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 173,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b1011; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 174,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b0001; // Expected: {'quot': 13, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 175,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 13, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b0100; // Expected: {'quot': 2, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 176,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 177,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b1010; // Expected: {'quot': 0, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 178,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b0110; // Expected: {'quot': 1, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 179,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b0110; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 180,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b1011; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 181,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b0110; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 182,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b0011; // Expected: {'quot': 1, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 183,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b0101; // Expected: {'quot': 2, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 184,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0001; Y = 4'b0110; // Expected: {'quot': 0, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0001; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 185,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1001; // Expected: {'quot': 1, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 186,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0110; // Expected: {'quot': 2, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 187,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 188,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b0110; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 189,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b1001; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 190,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b1111; // Expected: {'quot': 0, 'rem': 13}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b1111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 191,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 13
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b0010; // Expected: {'quot': 7, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 192,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b0011; // Expected: {'quot': 1, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 193,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b0101; // Expected: {'quot': 1, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 194,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b0101; // Expected: {'quot': 2, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 195,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b0101; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 196,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 9}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 197,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 9}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 198,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 9
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b0011; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 199,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1110; Y = 4'b0010; // Expected: {'quot': 7, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1110; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 200,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 7, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1000; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 201,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0100; // Expected: {'quot': 3, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 202,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 203,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0100; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0100; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 204,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0110; // Expected: {'quot': 2, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 205,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1001; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 206,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b0111; // Expected: {'quot': 1, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 207,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b0111; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 208,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0011; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0011; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 209,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 6}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 210,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0110; // Expected: {'quot': 2, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 211,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b1001; // Expected: {'quot': 1, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 212,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b0101; // Expected: {'quot': 2, 'rem': 3}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 213,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1011; Y = 4'b1001; // Expected: {'quot': 1, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1011; Y = 4'b1001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 214,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b1110; // Expected: {'quot': 0, 'rem': 7}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b1110; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 215,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 7
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b1000; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 216,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b0010; // Expected: {'quot': 5, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 217,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 5, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1011; // Expected: {'quot': 1, 'rem': 4}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 218,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b0111; // Expected: {'quot': 1, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 219,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b0100; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 220,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b0111; // Expected: {'quot': 2, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 221,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1010; Y = 4'b0101; // Expected: {'quot': 2, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1010; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 222,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0110; Y = 4'b0101; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0110; Y = 4'b0101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 223,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b0011; // Expected: {'quot': 2, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 224,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1101; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 225,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b0111; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b0111; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 226,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0010; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0010; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 227,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b1000; // Expected: {'quot': 1, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b1000; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 228,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b0001; // Expected: {'quot': 12, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b0001; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 229,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 12, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0000; Y = 4'b1011; // Expected: {'quot': 0, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0000; Y = 4'b1011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 230,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b0100; // Expected: {'quot': 1, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 231,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0101; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 5}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0101; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 232,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 5
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1000; Y = 4'b1100; // Expected: {'quot': 0, 'rem': 8}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1000; Y = 4'b1100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 233,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 0, 
                 
                 8
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1101; Y = 4'b0100; // Expected: {'quot': 3, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1101; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 234,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b0111; Y = 4'b0011; // Expected: {'quot': 2, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b0111; Y = 4'b0011; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 235,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1001; Y = 4'b0010; // Expected: {'quot': 4, 'rem': 1}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1001; Y = 4'b0010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 236,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 4, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b1010; // Expected: {'quot': 1, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b1010; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 237,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1100; Y = 4'b0100; // Expected: {'quot': 3, 'rem': 0}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1100; Y = 4'b0100; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 238,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        #10 X = 4'b1111; Y = 4'b1101; // Expected: {'quot': 1, 'rem': 2}
        
        start = 1'b1;
        #10 start = 1'b0;
        
        
        wait(valid);
        
        
        $display("Test %0d: Inputs: X = 4'b1111; Y = 4'b1101; | Outputs: quot=%b, rem=%b, valid=%b | Expected: quot=%d, rem=%d",
                 239,
                 
                 quot, 
                 
                 rem, 
                 
                 valid
                 , 
                 
                 1, 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
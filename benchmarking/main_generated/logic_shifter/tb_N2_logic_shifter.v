
`timescale 1ns / 1ps

module tb_N2_logic_shifter;

    // Parameters
    
    parameter N = 2;
    
     
    // Inputs
    
    reg  [1:0] data_in;
    
    reg   shift_amount;
    
    reg   direction;
    
    
    // Outputs
    
    wire  [1:0] data_out;
    
    
    // Instantiate the Unit Under Test (UUT)
    logic_shifter  #( N ) uut (
        
        .data_in(data_in),
        
        .shift_amount(shift_amount),
        
        .direction(direction),
        
        
        .data_out(data_out)
        
    );
    
    initial begin
        // Initialize Inputs
        
        data_in = 0;
        
        shift_amount = 0;
        
        direction = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        data_in = 2'b00; shift_amount = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b00; shift_amount = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 0,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b01; shift_amount = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b01; shift_amount = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 1,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b11; shift_amount = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b11; shift_amount = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 2,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b10; shift_amount = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b10; shift_amount = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 3,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b10; shift_amount = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b10; shift_amount = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 4,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b11; shift_amount = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b11; shift_amount = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 5,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b10; shift_amount = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b10; shift_amount = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 6,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b10; shift_amount = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b10; shift_amount = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 7,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b01; shift_amount = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b01; shift_amount = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 8,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b00; shift_amount = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b00; shift_amount = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 9,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b00; shift_amount = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b00; shift_amount = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 10,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b01; shift_amount = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b01; shift_amount = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 11,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b11; shift_amount = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b11; shift_amount = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 12,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b00; shift_amount = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b00; shift_amount = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 13,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b11; shift_amount = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b11; shift_amount = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 14,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        data_in = 2'b01; shift_amount = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: data_in = 2'b01; shift_amount = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 15,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
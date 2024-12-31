
`timescale 1ns / 1ps

module tb_N2_conditional_shifter;

    // Parameters
    
    parameter N = 2;
    
     
    // Inputs
    
    reg signed [1:0] signed_data_in;
    
    reg  [1:0] unsigned_data_in;
    
    reg   shift_amount;
    
    reg   shifter_sel;
    
    reg   direction;
    
    
    // Outputs
    
    wire  [1:0] data_out;
    
    
    // Instantiate the Unit Under Test (UUT)
    conditional_shifter  #( N ) uut (
        
        .signed_data_in(signed_data_in),
        
        .unsigned_data_in(unsigned_data_in),
        
        .shift_amount(shift_amount),
        
        .shifter_sel(shifter_sel),
        
        .direction(direction),
        
        
        .data_out(data_out)
        
    );
    
    initial begin
        // Initialize Inputs
        
        signed_data_in = 0;
        
        unsigned_data_in = 0;
        
        shift_amount = 0;
        
        shifter_sel = 0;
        
        direction = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 0,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 1,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 2,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 3,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 4,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 5,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 6,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 7,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 8,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 9,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 10,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 11,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 12,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 13,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 14,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 15,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 16,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 17,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 18,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 19,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 20,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 21,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 22,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 23,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 24,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 25,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 26,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 27,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 28,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 29,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 30,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 31,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 32,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 33,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 34,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 35,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 36,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 37,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 38,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 39,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 40,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 41,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 42,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 43,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 44,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 45,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 46,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 47,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 48,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 49,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 50,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 51,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 52,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 53,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 54,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 55,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 56,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 57,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 58,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 59,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 60,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 61,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 62,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 63,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 64,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 65,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 66,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 67,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 68,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 69,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 70,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 71,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 72,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 73,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 74,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 75,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 76,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 77,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 78,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 79,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 80,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 81,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 82,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 83,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 84,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 85,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 86,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 87,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 88,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 89,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 90,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 91,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 92,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 93,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 94,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 95,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 96,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 97,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 98,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 99,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 100,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 101,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 102,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 103,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 104,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 105,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 106,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 107,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 108,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 109,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 6}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 110,
                 
                 data_out
                 , 
                 
                 6
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 111,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 112,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 113,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b10; unsigned_data_in = 2'b00; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 114,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 115,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 116,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 117,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 2}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b00; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 118,
                 
                 data_out
                 , 
                 
                 2
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 4}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 119,
                 
                 data_out
                 , 
                 
                 4
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 120,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 121,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b01; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 122,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 123,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b01; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 124,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; // Expected: {'data_out': 1}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b11; unsigned_data_in = 2'b10; shift_amount = 1'b1; shifter_sel = 1'b1; direction = 1'b1; | Outputs: data_out=%b | Expected: data_out=%d",
                 125,
                 
                 data_out
                 , 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; // Expected: {'data_out': 0}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b01; shift_amount = 1'b1; shifter_sel = 1'b0; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 126,
                 
                 data_out
                 , 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; // Expected: {'data_out': 3}
        #10;
        $display("Test %0d: Inputs: signed_data_in = 2'b00; unsigned_data_in = 2'b11; shift_amount = 1'b0; shifter_sel = 1'b1; direction = 1'b0; | Outputs: data_out=%b | Expected: data_out=%d",
                 127,
                 
                 data_out
                 , 
                 
                 3
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
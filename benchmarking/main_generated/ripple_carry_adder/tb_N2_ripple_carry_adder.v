
`timescale 1ns / 1ps

module tb_N2_ripple_carry_adder;

    // Parameters
    
    parameter N = 2;
    
     
    // Inputs
    
    reg  [1:0] a;
    
    reg  [1:0] b;
    
    reg   cin;
    
    
    // Outputs
    
    wire  [1:0] sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    ripple_carry_adder  #( N ) uut (
        
        .a(a),
        
        .b(b),
        
        .cin(cin),
        
        
        .sum(sum),
        
        .cout(cout)
        
    );
    
    initial begin
        // Initialize Inputs
        
        a = 0;
        
        b = 0;
        
        cin = 0;
        
    
        // Wait for global reset
        #100;
    
        // Stimuli
        
        a = 2'b01; b = 2'b01; cin = 1'b1; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; cin = 1'b1; // Expected: {'sum': 3, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b01; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b01; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; cin = 1'b0; // Expected: {'sum': 1, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b01; cin = 1'b1; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b01; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b00; cin = 1'b1; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b00; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; cin = 1'b1; // Expected: {'sum': 1, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b11; cin = 1'b0; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b11; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b00; cin = 1'b0; // Expected: {'sum': 0, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b00; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b10; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b10; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b01; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b01; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b11; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b11; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b00; cin = 1'b0; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b00; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; cin = 1'b0; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b11; cin = 1'b0; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b11; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; cin = 1'b0; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b10; cin = 1'b1; // Expected: {'sum': 1, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b10; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b01; cin = 1'b1; // Expected: {'sum': 0, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b01; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 0, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; cin = 1'b0; // Expected: {'sum': 1, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; cin = 1'b0; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b11; b = 2'b10; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b11; b = 2'b10; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b00; b = 2'b10; cin = 1'b1; // Expected: {'sum': 3, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b00; b = 2'b10; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 3, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b10; b = 2'b11; cin = 1'b1; // Expected: {'sum': 2, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 2'b10; b = 2'b11; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 2'b01; b = 2'b00; cin = 1'b1; // Expected: {'sum': 2, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 2'b01; b = 2'b00; cin = 1'b1; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
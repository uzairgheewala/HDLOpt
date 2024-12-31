
`timescale 1ns / 1ps

module tb_N21_kogge_stone_adder;

    // Parameters
    
    parameter N = 21;
    
     
    // Inputs
    
    reg  [20:0] a;
    
    reg  [20:0] b;
    
    
    // Outputs
    
    wire  [20:0] sum;
    
    wire   cout;
    
    
    // Instantiate the Unit Under Test (UUT)
    kogge_stone_adder  #( N ) uut (
        
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
        
        a = 21'b001011001000011011010; b = 21'b011110110111011100110; // Expected: {'sum': 1376192, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b001011001000011011010; b = 21'b011110110111011100110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 0,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1376192, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b111111010000101100000; b = 21'b011100000101000011000; // Expected: {'sum': 895864, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b111111010000101100000; b = 21'b011100000101000011000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 1,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 895864, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b000100100001001100010; b = 21'b101101110011110111110; // Expected: {'sum': 1649184, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b000100100001001100010; b = 21'b101101110011110111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 2,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1649184, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b110001001010110101010; b = 21'b010100101010101001000; // Expected: {'sum': 191218, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b110001001010110101010; b = 21'b010100101010101001000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 3,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 191218, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b111011110011110101100; b = 21'b101000000111000101110; // Expected: {'sum': 1177050, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b111011110011110101100; b = 21'b101000000111000101110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 4,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1177050, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b001001101111001000110; b = 21'b110110101100000111110; // Expected: {'sum': 13956, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b001001101111001000110; b = 21'b110110101100000111110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 5,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 13956, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b110011111100111011011; b = 21'b010011110010001000100; // Expected: {'sum': 253471, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b110011111100111011011; b = 21'b010011110010001000100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 6,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 253471, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b100110101011011001010; b = 21'b000010011011001111010; // Expected: {'sum': 1346884, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b100110101011011001010; b = 21'b000010011011001111010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 7,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1346884, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b010000110011010101011; b = 21'b011011000101011010010; // Expected: {'sum': 1438077, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b010000110011010101011; b = 21'b011011000101011010010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 8,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1438077, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b010011110010000100010; b = 21'b011010001010101010000; // Expected: {'sum': 1505650, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b010011110010000100010; b = 21'b011010001010101010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 9,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1505650, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b011110001010100110000; b = 21'b100111101000010100010; // Expected: {'sum': 189906, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b011110001010100110000; b = 21'b100111101000010100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 10,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 189906, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b000001100010101011111; b = 21'b101101110100111100010; // Expected: {'sum': 1552193, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b000001100010101011111; b = 21'b101101110100111100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 11,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1552193, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b000011001010111110111; b = 21'b010101001000111110000; // Expected: {'sum': 796647, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b000011001010111110111; b = 21'b010101001000111110000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 12,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 796647, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b000110111001110101111; b = 21'b011111011110110010000; // Expected: {'sum': 1257791, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b000110111001110101111; b = 21'b011111011110110010000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 13,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1257791, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b100101101111100001001; b = 21'b000001100111000011110; // Expected: {'sum': 1289511, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b100101101111100001001; b = 21'b000001100111000011110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 14,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1289511, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b111111010010010010111; b = 21'b101000100001000010100; // Expected: {'sum': 1304235, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b111111010010010010111; b = 21'b101000100001000010100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 15,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1304235, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b000001101011000001100; b = 21'b011111010011110001001; // Expected: {'sum': 1080725, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b000001101011000001100; b = 21'b011111010011110001001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 16,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1080725, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b011010010010110010100; b = 21'b001101111100010011001; // Expected: {'sum': 1318445, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b011010010010110010100; b = 21'b001101111100010011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 17,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1318445, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b001011110111111000010; b = 21'b111011000110100011111; // Expected: {'sum': 228577, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b001011110111111000010; b = 21'b111011000110100011111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 18,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 228577, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b110011010010010011101; b = 21'b111001101100100010110; // Expected: {'sum': 1473971, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b110011010010010011101; b = 21'b111001101100100010110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 19,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1473971, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b110010001000001100001; b = 21'b010001111010001011001; // Expected: {'sum': 132282, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b110010001000001100001; b = 21'b010001111010001011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 20,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 132282, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b011010000101100100101; b = 21'b110101111011110101000; // Expected: {'sum': 525005, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b011010000101100100101; b = 21'b110101111011110101000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 21,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 525005, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b011011111000001001100; b = 21'b000011011110100011001; // Expected: {'sum': 1027429, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b011011111000001001100; b = 21'b000011011110100011001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 22,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1027429, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b100000001000101101010; b = 21'b011101010101100101011; // Expected: {'sum': 2014357, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b100000001000101101010; b = 21'b011101010101100101011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 23,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2014357, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b100011010100000111000; b = 21'b011011111110101011111; // Expected: {'sum': 2074007, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b100011010100000111000; b = 21'b011011111110101011111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 24,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 2074007, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b001000011011100001000; b = 21'b010001101010011000000; // Expected: {'sum': 854984, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b001000011011100001000; b = 21'b010001101010011000000; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 25,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 854984, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b010100001011100010101; b = 21'b000100010110001100001; // Expected: {'sum': 803702, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b010100001011100010101; b = 21'b000100010110001100001; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 26,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 803702, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b111011001001001111110; b = 21'b010110010010110000110; // Expected: {'sum': 571396, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b111011001001001111110; b = 21'b010110010010110000110; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 27,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 571396, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b101111011000011010100; b = 21'b101111111111000011111; // Expected: {'sum': 1027827, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b101111011000011010100; b = 21'b101111111111000011111; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 28,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 1027827, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b110111110001101111100; b = 21'b010101111010100000100; // Expected: {'sum': 448640, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b110111110001101111100; b = 21'b010101111010100000100; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 29,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 448640, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b000111100001011011000; b = 21'b000100011110101010011; // Expected: {'sum': 393259, 'cout': 0}
        #10;
        $display("Test %0d: Inputs: a = 21'b000111100001011011000; b = 21'b000100011110101010011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 30,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 393259, 
                 
                 0
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b101010101101100011110; b = 21'b110001100100011011011; // Expected: {'sum': 926713, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b101010101101100011110; b = 21'b110001100100011011011; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 31,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 926713, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        a = 21'b110011100100000101110; b = 21'b010100001010010100010; // Expected: {'sum': 253136, 'cout': 1}
        #10;
        $display("Test %0d: Inputs: a = 21'b110011100100000101110; b = 21'b010100001010010100010; | Outputs: sum=%b, cout=%b | Expected: sum=%d, cout=%d",
                 32,
                 
                 sum, 
                 
                 cout
                 , 
                 
                 253136, 
                 
                 1
                 
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        
        $finish;
    end
  
endmodule
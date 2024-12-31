module square (
    input wire Ai, 
    input wire Bi,
    output wire G, 
    output wire P
);
  
  assign G = Ai & Bi;
  assign P = Ai ^ Bi;
  
endmodule
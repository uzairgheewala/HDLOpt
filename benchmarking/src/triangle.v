module triangle (
    input wire Pi, 
    input wire CiPrev,
    output wire Si
);
  
  assign Si = Pi ^ CiPrev;
  
endmodule
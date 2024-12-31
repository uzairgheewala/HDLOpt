module big_circle (
    input wire Gi, 
    input wire Pi, 
    input wire GiPrev, 
    input wire PiPrev,
    output wire G,
    output wire P
);
  
  assign G = (Pi & GiPrev) | Gi;
  assign P = Pi & PiPrev;
  
endmodule
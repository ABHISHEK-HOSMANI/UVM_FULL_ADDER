interface adder_interface;
  logic a,b,c,sum,carry;
  
  modport adder_mp(input a,b,c, output sum,carry);  
endinterface
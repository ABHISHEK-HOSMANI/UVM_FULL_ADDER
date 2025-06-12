module full_adder(adder_interface intf);
      assign intf.sum = intf.a ^ intf.b ^ intf.c;
      assign intf.carry = (intf.a & intf.b) | (intf.b & intf.c) | (intf.c & intf.a);
endmodule
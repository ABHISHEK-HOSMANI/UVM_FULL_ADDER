class adder_sequence_item extends uvm_sequence_item;
  rand bit a, b, c;
  bit sum, carry;
  `uvm_object_utils_begin(adder_sequence_item)
  	`uvm_field_int(a,	  UVM_ALL_ON)
  	`uvm_field_int(b, 	  UVM_ALL_ON)
  	`uvm_field_int(c, 	  UVM_ALL_ON)
  	`uvm_field_int(sum,	  UVM_ALL_ON)
  	`uvm_field_int(carry, UVM_ALL_ON)
  `uvm_object_utils_end
  
  
  function new(string name = "adder_sequence_item");
    super.new(name);
  endfunction
  
endclass : adder_sequence_item
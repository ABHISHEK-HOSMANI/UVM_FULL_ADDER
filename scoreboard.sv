class adder_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(adder_scoreboard)
  
  virtual adder_interface vif;
  adder_sequence_item item_h;
  bit expected_sum, expected_carry;
  
  uvm_blocking_put_imp #(adder_sequence_item, adder_scoreboard) mon_imp;
  
  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_imp = new("mon_imp", this);
  endfunction
  
  virtual function void put(adder_sequence_item t);
    item_h = t;
    expected_sum = item_h.a ^ item_h.b ^ item_h.c;
    expected_carry = (item_h.a & item_h.b) | (item_h.b & item_h.c) | (item_h.c & item_h.a);
    
    if(item_h.sum == expected_sum && item_h.carry == expected_carry) begin
      `uvm_info(get_type_name(), $sformatf("PASS Time = [%0t] SUM=%0b CARRY=%0b Expected_sum = %0b Expected_carry = %0b", $time, item_h.sum, item_h.carry, expected_sum, expected_carry), UVM_MEDIUM)

      `uvm_info(get_type_name(), $sformatf("Time = [%0t] A=%0b B=%0b C=%0b | SUM=%0b CARRY=%0b",$time, item_h.a, item_h.b, item_h.c, item_h.sum, item_h.carry),UVM_MEDIUM)
      
      `uvm_info(get_type_name(), $sformatf("--------------------------------------------------------------------------------------------------------------------------------"),UVM_MEDIUM)
    end
    else begin
    `uvm_error(get_type_name(), $sformatf("FAIL Time = [%0t] SUM=%0b CARRY=%0b Expected_sum = %0b Expected_carry = %0b", $time, item_h.sum, item_h.carry, expected_sum, expected_carry))

      `uvm_info(get_type_name(), $sformatf("Time = [%0t] A=%0b B=%0b C=%0b | SUM=%0b CARRY=%0b",$time, item_h.a, item_h.b, item_h.c, item_h.sum, item_h.carry),UVM_MEDIUM)
      
      `uvm_info(get_type_name(), $sformatf("--------------------------------------------------------------------------------------------------------------------------------"),UVM_MEDIUM)
      end
  endfunction
  
  
endclass : adder_scoreboard
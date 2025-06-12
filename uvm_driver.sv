class adder_driver extends uvm_driver#(adder_sequence_item);
  `uvm_component_utils(adder_driver)
  
  virtual adder_interface vif;
  adder_sequence_item item_h;
  
  function new(string name = "adder_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    if(!uvm_config_db#(virtual adder_interface) :: get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "Not set at top level");
  endfunction
  
  task run_phase (uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(item_h);
      vif.a <= item_h.a;
      vif.b <= item_h.b;
      vif.c <= item_h.c;
      `uvm_info(get_type_name(), $sformatf("Time = [%0t] A=%0b B=%0b C=%0b | SUM=%0b CARRY=%0b",$time, item_h.a, item_h.b, item_h.c, item_h.sum, item_h.carry),UVM_MEDIUM)
      seq_item_port.item_done();
    end
  endtask
endclass : adder_driver
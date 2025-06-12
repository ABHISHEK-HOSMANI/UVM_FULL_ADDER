class adder_monitor extends uvm_monitor;
  `uvm_component_utils(adder_monitor)
  
  virtual adder_interface vif;
  adder_sequence_item item_h;
  
  uvm_blocking_put_port #(adder_sequence_item) mon_port;
  
  function new(string name = "adder_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    mon_port = new ("mon_port", this);
    
    if(!uvm_config_db#(virtual adder_interface) :: get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "Not set at top level");
  endfunction
  
  task run_phase(uvm_phase phase);
    adder_sequence_item item_h;
    item_h = adder_sequence_item::type_id::create("item_h");
    forever begin
      #1;
      item_h.a	   = vif.a;
      item_h.b	   = vif.b;
      item_h.c	   = vif.c;
      item_h.sum   = vif.sum;
      item_h.carry = vif.carry;
      mon_port.put(item_h);
      `uvm_info(get_type_name(), $sformatf("Time = [%0t] A=%0b B=%0b C=%0b | SUM=%0b CARRY=%0b",$time, item_h.a, item_h.b, item_h.c, item_h.sum, item_h.carry),UVM_MEDIUM)
      
    end
  endtask
endclass : adder_monitor
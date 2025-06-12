class adder_agent extends uvm_agent;
  `uvm_component_utils(adder_agent)
  
  adder_sequencer seqr_h;
  adder_driver drv_h;
  adder_monitor mon_h;
  
  function new(string name = "adder_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "Agent Inside build_phase", UVM_MEDIUM)
    if(get_is_active() == UVM_ACTIVE) begin
      seqr_h = adder_sequencer::type_id::create("seqr_h",this);
      drv_h = adder_driver::type_id::create("drv_h",this);
    end
    mon_h = adder_monitor::type_id::create("mon_h",this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    if(get_is_active() == UVM_ACTIVE) begin
      drv_h.seq_item_port.connect(seqr_h.seq_item_export);
    end
    `uvm_info(get_type_name(), "Agent Inside connect_phase", UVM_MEDIUM)
  endfunction
endclass : adder_agent
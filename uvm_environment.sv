class adder_env extends uvm_env;
  `uvm_component_utils(adder_env)
  
  adder_agent agt_h;
  adder_scoreboard sco_h;
  
  function new(string name = "adder_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt_h = adder_agent::type_id::create("agt_h",this);
    sco_h = adder_scoreboard::type_id::create("sco_h",this);
    
    `uvm_info(get_type_name(), "ENV Inside build_phase", UVM_MEDIUM)
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    agt_h.mon_h.mon_port.connect(sco_h.mon_imp);
    
    `uvm_info(get_type_name(), "ENV Inside connect_phase", UVM_MEDIUM)
  endfunction
endclass : adder_env
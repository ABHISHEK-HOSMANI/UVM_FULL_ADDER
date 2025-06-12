class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  adder_env env_h;
  adder_sequence seq_h;
  
  function new(string name = "my_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = adder_env::type_id::create("env_h", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    `uvm_info("MY_TEST", "Strating run phase of my_test", UVM_MEDIUM)
    phase.raise_objection(this);
    seq_h = adder_sequence::type_id::create("seq_h");
    seq_h.start(env_h.agt_h.seqr_h);
    #1;

    phase.drop_objection(this);
    `uvm_info("MY_TEST", "End test", UVM_MEDIUM)
  endtask
endclass
`include "interface.sv"
`include "uvm_sequence_item.sv"
`include "uvm_sequence.sv"
`include "uvm_sequencer.sv"
`include "uvm_driver.sv"
`include "uvm_monitor.sv"
`include "uvm_agent.sv"
`include "scoreboard.sv"
`include "uvm_environment.sv"
`include "test.sv"
`include "uvm_macros.svh"
import uvm_pkg::*;

module top;
  adder_interface vif();
  
  full_adder dut(vif);
  
  initial begin
    // set interface in config_db
    uvm_config_db#(virtual adder_interface)::set(null, "*", "vif", vif);  //null is delcare as scope because module is a static entity
    run_test("my_test");
  end
  
  initial begin
    $dumpfile("adder.vcd");
    $dumpvars();
  end
endmodule
class adder_sequence extends uvm_sequence#(adder_sequence_item);
  `uvm_object_utils(adder_sequence)

  adder_sequence_item item_h;
  int count = 5;

  function new(string name = "adder_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(count) begin 
      item_h = adder_sequence_item::type_id::create("item_h");
      start_item(item_h);
      if (item_h.randomize()) begin
        `uvm_info(get_type_name(), $sformatf("Time = [%0t] A=%0b B=%0b C=%0b | SUM=%0b CARRY=%0b",$time, item_h.a, item_h.b, item_h.c, item_h.sum, item_h.carry),UVM_MEDIUM)
      end
      else begin
        `uvm_error("SEQUENCE", "Randomization failed!")
      end
      finish_item(item_h);
      #1;
    end
  endtask
endclass : adder_sequence
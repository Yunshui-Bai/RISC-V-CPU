`ifndef MY_TRANSACTION__SV
`define MY_TRANSACTION__SV
`include "instr_gen.sv"
class my_transaction extends uvm_sequence_item;

   rand int      weight[58];
   rand int      size;
   instr_gen ig;

   rand bit[31:0]       data[];
   rand bit[31:0]       pc[];
   rand bit[31:0]       addr[];
   rand bit[1:0]        rw[];
   
   

   constraint pload_cons{
      size >= 0;
      size <= 15000;
      data.size == size;
      pc.size == size;
      addr.size == size;
      rw.size == size;
   }
   constraint we{
    foreach(weight[i]){
        weight[i] ==1;
        //weight[i] <=1;
    }
   }
 
    function void post_randomize();
       ig = new(size,weight);
       assert(ig.randomize());
       pc = ig.pc;
    endfunction
    function void prints();
      $display("data\n");
      foreach(data[i]) $display("%b",data[i]);
      $display("pc\n");
      foreach(pc[i]) $display("%b",pc[i]);
      $display("addr\n");
      foreach(addr[i]) $display("%b",addr[i]);
      $display("rw\n");
      foreach(rw[i]) $display("%b",rw[i]);
    endfunction
   

   `uvm_object_utils_begin(my_transaction)//注册后可直接调用copy print
      `uvm_field_array_int(data, UVM_ALL_ON)
      `uvm_field_array_int(pc, UVM_ALL_ON)
      `uvm_field_array_int(addr, UVM_ALL_ON)
      `uvm_field_array_int(rw, UVM_ALL_ON)
      `uvm_field_int(size, UVM_ALL_ON)
   `uvm_object_utils_end

   function new(string name = "my_transaction");
      super.new();
      
   endfunction

endclass
`endif

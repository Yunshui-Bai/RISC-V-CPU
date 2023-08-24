`ifndef MY_MONITOR__SV
`define MY_MONITOR__SV
class my_monitor extends uvm_monitor;

   virtual my_if vif;

   uvm_analysis_port #(my_transaction)  ap;
   
   `uvm_component_utils(my_monitor)
   function new(string name = "my_monitor", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(!uvm_config_db#(virtual my_if)::get(this, "", "vif", vif))
         `uvm_fatal("my_monitor", "virtual interface must be set for vif!!!")
      ap = new("ap", this);
   endfunction

   extern task main_phase(uvm_phase phase);
   extern task collect_one_pkt(my_transaction tr);
endclass

task my_monitor::main_phase(uvm_phase phase);
   my_transaction tr;
   while(1) begin
      tr = new("tr");
      collect_one_pkt(tr);
      $display("mon tr");
      //tr.print();
      ap.write(tr);
   end
endtask

task my_monitor::collect_one_pkt(my_transaction tr);
   logic[31:0] m0_addr_i[$];
   logic[31:0] m1_addr_i[$];
   logic[31:0] m2_addr_i[$];
   logic[31:0] m3_addr_i[$];
   logic[31:0] m0_data_i[$];
   logic[31:0] m1_data_i[$];
   logic[31:0] m2_data_i[$];
   logic[31:0] m3_data_i[$];
   logic m0_req_i[$];
   logic m1_req_i[$];
   logic m2_req_i[$];
   logic m3_req_i[$];
   logic m0_we_i[$];
   logic m1_we_i[$];
   logic m2_we_i[$];
   logic m3_we_i[$];
   logic[31:0] s0_data_i[$];
   logic[31:0] s1_data_i[$];
   logic[31:0] s2_data_i[$];
   logic[31:0] s3_data_i[$];
   logic[31:0] s4_data_i[$];
   logic[31:0] s5_data_i[$];
   logic s0_we_o[$];
   logic s1_we_o[$];
   logic s2_we_o[$];
   logic s3_we_o[$];
   logic s4_we_o[$];
   logic s5_we_o[$];
   logic[31:0] s0_data_o[$];
   logic[31:0] s1_data_o[$];
   logic[31:0] s2_data_o[$];
   logic[31:0] s3_data_o[$];
   logic[31:0] s4_data_o[$];
   logic[31:0] s5_data_o[$];
   logic[31:0] s0_addr_o[$];
   logic[31:0] s1_addr_o[$];
   logic[31:0] s2_addr_o[$];
   logic[31:0] s3_addr_o[$];
   logic[31:0] s4_addr_o[$];
   logic[31:0] s5_addr_o[$];
   logic[31:0] m0_data_o[$];
   logic[31:0] m1_data_o[$];
   logic[31:0] m2_data_o[$];
   logic[31:0] m3_data_o[$];
   logic hold_flag_o[$];
   int data_size;
   
   while(1) begin
      @(posedge vif.clk);
      if(vif.flag) break;
   end
   `uvm_info("my_monitor", "begin to collect one pkt", UVM_LOW);
   while(vif.flag) begin
	  m0_addr_i.push_back(vif.m0_addr_i);
	  m1_addr_i.push_back(vif.m1_addr_i);
	  m2_addr_i.push_back(vif.m2_addr_i);
	  m3_addr_i.push_back(vif.m3_addr_i);
	  m0_data_i.push_back(vif.m0_data_i);
	  m1_data_i.push_back(vif.m1_data_i);
	  m2_data_i.push_back(vif.m2_data_i);
	  m3_data_i.push_back(vif.m3_data_i);
	  m0_req_i.push_back(vif.m0_req_i);
	  m1_req_i.push_back(vif.m1_req_i);
	  m2_req_i.push_back(vif.m2_req_i);
	  m3_req_i.push_back(vif.m3_req_i);
	  m0_we_i.push_back(vif.m0_we_i);
	  m1_we_i.push_back(vif.m1_we_i);
	  m2_we_i.push_back(vif.m2_we_i);
	  m3_we_i.push_back(vif.m3_we_i);
	  s0_data_i.push_back(vif.s0_data_i);
	  s1_data_i.push_back(vif.s1_data_i);
	  s2_data_i.push_back(vif.s2_data_i);
	  s3_data_i.push_back(vif.s3_data_i);
	  s4_data_i.push_back(vif.s4_data_i);
	  s5_data_i.push_back(vif.s5_data_i);
      s0_we_o.push_back(vif.s0_we_o);
	  s1_we_o.push_back(vif.s1_we_o);
	  s2_we_o.push_back(vif.s2_we_o);
	  s3_we_o.push_back(vif.s3_we_o);
	  s4_we_o.push_back(vif.s4_we_o);
	  s5_we_o.push_back(vif.s5_we_o);
	  s0_data_o.push_back(vif.s0_data_o);
	  s1_data_o.push_back(vif.s1_data_o);
	  s2_data_o.push_back(vif.s2_data_o);
	  s3_data_o.push_back(vif.s3_data_o);
	  s4_data_o.push_back(vif.s4_data_o);
	  s5_data_o.push_back(vif.s5_data_o);
	  s0_addr_o.push_back(vif.s0_addr_o);
	  s1_addr_o.push_back(vif.s1_addr_o);
	  s2_addr_o.push_back(vif.s2_addr_o);
	  s3_addr_o.push_back(vif.s3_addr_o);
	  s4_addr_o.push_back(vif.s4_addr_o);
	  s5_addr_o.push_back(vif.s5_addr_o);
	  m0_data_o.push_back(vif.m0_data_o);
	  m1_data_o.push_back(vif.m1_data_o);
	  m2_data_o.push_back(vif.m2_data_o);
	  m3_data_o.push_back(vif.m3_data_o);
	  hold_flag_o.push_back(vif.hold_flag_o);
      @(posedge vif.clk);
   end
   data_size  = m0_addr_i.size();   

   tr.m0_addr_i = new[data_size];
   tr.m1_addr_i = new[data_size];
   tr.m2_addr_i = new[data_size];
   tr.m3_addr_i = new[data_size];
   tr.m0_data_i = new[data_size];
   tr.m1_data_i = new[data_size];
   tr.m2_data_i = new[data_size];
   tr.m3_data_i = new[data_size];
   tr.m0_req_i = new[data_size];
   tr.m1_req_i = new[data_size];
   tr.m2_req_i = new[data_size];
   tr.m3_req_i = new[data_size];
   tr.m0_we_i = new[data_size];
   tr.m1_we_i = new[data_size];
   tr.m2_we_i = new[data_size];
   tr.m3_we_i = new[data_size];
   tr.s0_data_i = new[data_size];
   tr.s1_data_i = new[data_size];
   tr.s2_data_i = new[data_size];
   tr.s3_data_i = new[data_size];
   tr.s4_data_i = new[data_size];
   tr.s5_data_i = new[data_size];
   tr.m0_data_o = new[data_size];
   tr.m1_data_o = new[data_size];
   tr.m2_data_o = new[data_size];
   tr.m3_data_o = new[data_size];
   tr.s0_we_o = new[data_size];
   tr.s1_we_o = new[data_size];
   tr.s2_we_o = new[data_size];
   tr.s3_we_o = new[data_size];
   tr.s4_we_o = new[data_size];
   tr.s5_we_o = new[data_size];
   tr.s0_data_o = new[data_size];
   tr.s1_data_o = new[data_size];
   tr.s2_data_o = new[data_size];
   tr.s3_data_o = new[data_size];
   tr.s4_data_o = new[data_size];
   tr.s5_data_o = new[data_size];
   tr.s0_addr_o = new[data_size];
   tr.s1_addr_o = new[data_size];
   tr.s2_addr_o = new[data_size];
   tr.s3_addr_o = new[data_size];
   tr.s4_addr_o = new[data_size];
   tr.s5_addr_o = new[data_size];
   tr.hold_flag_o = new[data_size];
   for (int i = 0; i < data_size; i++) begin
      tr.m0_addr_i[i] = m0_addr_i[i];
	  tr.m1_addr_i[i] = m1_addr_i[i];
	  tr.m2_addr_i[i] = m2_addr_i[i];
	  tr.m3_addr_i[i] = m3_addr_i[i];
	  tr.m0_data_i[i] = m0_data_i[i];
	  tr.m1_data_i[i] = m1_data_i[i];
	  tr.m2_data_i[i] = m2_data_i[i];
	  tr.m3_data_i[i] = m3_data_i[i];
	  tr.m0_req_i[i] = m0_req_i[i];
	  tr.m1_req_i[i] = m1_req_i[i];
	  tr.m2_req_i[i] = m2_req_i[i];
	  tr.m3_req_i[i] = m3_req_i[i];
	  tr.m0_we_i[i]  = m0_we_i[i];
	  tr.m1_we_i[i]  = m1_we_i[i];
	  tr.m2_we_i[i]  = m2_we_i[i];
	  tr.m3_we_i[i]  = m3_we_i[i];
	  tr.s0_data_i[i] = s0_data_i[i];
	  tr.s1_data_i[i] = s1_data_i[i];
	  tr.s2_data_i[i] = s2_data_i[i];
	  tr.s3_data_i[i] = s3_data_i[i];
	  tr.s4_data_i[i] = s4_data_i[i];
	  tr.s5_data_i[i] = s5_data_i[i];
      tr.s0_we_o[i] = s0_we_o[i];
      tr.s1_we_o[i] = s1_we_o[i];
      tr.s2_we_o[i] = s2_we_o[i];
      tr.s3_we_o[i] = s3_we_o[i];
      tr.s4_we_o[i] = s4_we_o[i];
      tr.s5_we_o[i] = s5_we_o[i];
      tr.s0_data_o[i] = s0_data_o[i];
      tr.s1_data_o[i] = s1_data_o[i];
      tr.s2_data_o[i] = s2_data_o[i];
      tr.s3_data_o[i] = s3_data_o[i];
      tr.s4_data_o[i] = s4_data_o[i];
      tr.s5_data_o[i] = s5_data_o[i];
      tr.s0_addr_o[i] = s0_addr_o[i];
      tr.s1_addr_o[i] = s1_addr_o[i];
      tr.s2_addr_o[i] = s2_addr_o[i];
      tr.s3_addr_o[i] = s3_addr_o[i];
      tr.s4_addr_o[i] = s4_addr_o[i];
      tr.s5_addr_o[i] = s5_addr_o[i];
	  tr.m0_data_o[i] = m0_data_o[i];
	  tr.m1_data_o[i] = m1_data_o[i];
	  tr.m2_data_o[i] = m2_data_o[i];
	  tr.m3_data_o[i] = m3_data_o[i];
	  tr.hold_flag_o[i] = hold_flag_o[i];
   end
   `uvm_info("my_monitor", "end collect one pkt", UVM_LOW);
endtask


`endif

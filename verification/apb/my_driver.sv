
`ifndef MY_DRIVER__SV
`define MY_DRIVER__SV
class my_driver extends uvm_driver#(my_transaction);//参数化 添加参数选择驱动的transaction类型 则可使用req(获得的参数 此处为my_transaction)

   virtual my_if vif;
   //my_cov cov;

   `uvm_component_utils(my_driver)
   function new(string name = "my_driver", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      //cov = new();
      if(!uvm_config_db#(virtual my_if)::get(this, "", "vif", vif))
         `uvm_fatal("my_driver", "virtual interface must be set for vif!!!")
   endfunction
   

   extern task main_phase(uvm_phase phase);
   extern task drive_one_pkt(my_transaction tr);
endclass

task my_driver::main_phase(uvm_phase phase);
   /*vif.m0_addr_i <= 32'b0;
   vif.m1_addr_i <= 32'b0;
   vif.m2_addr_i <= 32'b0;
   vif.m3_addr_i <= 32'b0;
   vif.m0_data_i <= 32'b0;
   vif.m1_data_i <= 32'b0;
   vif.m2_data_i <= 32'b0;
   vif.m3_data_i <= 32'b0;
   vif.m0_req_i<= 1'b0;
   vif.m1_req_i<= 1'b0;
   vif.m2_req_i<= 1'b0;
   vif.m3_req_i<= 1'b0;
   vif.m0_we_i <= 1'b0;
   vif.m1_we_i <= 1'b0;
   vif.m2_we_i <= 1'b0;
   vif.m3_we_i <= 1'b0;
   vif.s0_data_i<= 32'b0;
   vif.s1_data_i<= 32'b0;
   vif.s2_data_i<= 32'b0;
   vif.s3_data_i<= 32'b0;
   vif.s4_data_i<= 32'b0;
   vif.s5_data_i<= 32'b0;*/
   while(!vif.rst_n)
      @(posedge vif.clk);
   while(1) begin
      //seq_item_port.get_next_item(req);//向sequencer阻塞申请新的transaction 还可以使用try_next_item 需要判断是否有内容
      seq_item_port.try_next_item(req);
      if(req==null)
        #1;//@(posedge vif.clk or negedge vif.clk);
      else begin
        `uvm_info("my_driver", "get a transaction", UVM_LOW);
        drive_one_pkt(req);
        seq_item_port.item_done();//通知sequencer已经完成驱动，sequencer会删除上一个transaction  {握手机制} sequence 结束uvm_do
        `uvm_info("my_driver", "done a transaction", UVM_LOW);
      end
   end
endtask

task my_driver::drive_one_pkt(my_transaction tr);
   logic[31:0]    m0_addr_i[];
   logic[31:0]    m1_addr_i[];
   logic[31:0]    m2_addr_i[];
   logic[31:0]    m3_addr_i[];
   logic[31:0]    m0_data_i[];
   logic[31:0]    m1_data_i[];
   logic[31:0]    m2_data_i[];
   logic[31:0]    m3_data_i[];
   logic          m0_req_i[];
   logic          m1_req_i[];
   logic          m2_req_i[];
   logic          m3_req_i[];
   logic          m0_we_i[];
   logic          m1_we_i[];
   logic          m2_we_i[];
   logic          m3_we_i[];
   logic[31:0]    s0_data_i[];
   logic[31:0]    s1_data_i[];
   logic[31:0]    s2_data_i[];
   logic[31:0]    s3_data_i[];
   logic[31:0]    s4_data_i[];
   logic[31:0]    s5_data_i[];
   int  data_size;
   
   data_size = tr.m0_addr_i.size; 

   m0_addr_i = new[data_size];
   m1_addr_i = new[data_size];
   m2_addr_i = new[data_size];
   m3_addr_i = new[data_size];
   m0_data_i = new[data_size];
   m1_data_i = new[data_size];
   m2_data_i = new[data_size];
   m3_data_i = new[data_size];
   m0_req_i = new[data_size];
   m1_req_i = new[data_size];
   m2_req_i = new[data_size];
   m3_req_i = new[data_size];
   m0_we_i = new[data_size];
   m1_we_i = new[data_size];
   m2_we_i = new[data_size];
   m3_we_i = new[data_size];
   s0_data_i = new[data_size];
   s1_data_i = new[data_size];
   s2_data_i = new[data_size];
   s3_data_i = new[data_size];
   s4_data_i = new[data_size];
   s5_data_i = new[data_size];
   

   m0_addr_i = tr.m0_addr_i;
   m1_addr_i = tr.m1_addr_i;
   m2_addr_i = tr.m2_addr_i;
   m3_addr_i = tr.m3_addr_i;
   m0_data_i = tr.m0_data_i;
   m1_data_i = tr.m1_data_i;
   m2_data_i = tr.m2_data_i;
   m3_data_i = tr.m3_data_i;
   m0_req_i  = tr.m0_req_i;
   m1_req_i  = tr.m1_req_i;
   m2_req_i  = tr.m2_req_i;
   m3_req_i  = tr.m3_req_i;
   m0_we_i   = tr.m0_we_i;
   m1_we_i   = tr.m1_we_i;
   m2_we_i   = tr.m2_we_i;
   m3_we_i   = tr.m3_we_i;
   s0_data_i = tr.s0_data_i;
   s1_data_i = tr.s1_data_i;
   s2_data_i = tr.s2_data_i;
   s3_data_i = tr.s3_data_i;
   s4_data_i = tr.s4_data_i;
   s5_data_i = tr.s5_data_i;
   
   `uvm_info("my_driver", "begin to drive one pkt", UVM_LOW);
   //repeat(1) @(posedge vif.clk);
   for ( int i = 0; i < data_size; i++ ) begin
      //@(posedge vif.clk);
      vif.flag <= 1'b1;
	  vif.m0_addr_i = m0_addr_i[i];
	  vif.m1_addr_i = m1_addr_i[i];
	  vif.m2_addr_i = m2_addr_i[i];
	  vif.m3_addr_i = m3_addr_i[i];
	  vif.m0_data_i = m0_data_i[i];
	  vif.m1_data_i = m1_data_i[i];
	  vif.m2_data_i = m2_data_i[i];
	  vif.m3_data_i = m3_data_i[i];
	  vif.m0_req_i  = m0_req_i[i];
	  vif.m1_req_i  = m1_req_i[i];
	  vif.m2_req_i  = m2_req_i[i];
	  vif.m3_req_i  = m3_req_i[i];
	  vif.m0_we_i   = m0_we_i[i];
	  vif.m1_we_i   = m1_we_i[i];
	  vif.m2_we_i   = m2_we_i[i];
	  vif.m3_we_i   = m3_we_i[i];
	  vif.s0_data_i = s0_data_i[i];
	  vif.s1_data_i = s1_data_i[i];
	  vif.s2_data_i = s2_data_i[i];
	  vif.s3_data_i = s3_data_i[i];
	  vif.s4_data_i = s4_data_i[i];
	  vif.s5_data_i = s5_data_i[i];
	  @(posedge vif.clk);
      //cov.sample(vif);
   end
   //@(posedge vif.clk);
   vif.flag <= 1'b0;
   @(posedge vif.clk);
   `uvm_info("my_driver", "end drive one pkt", UVM_LOW);
endtask


`endif

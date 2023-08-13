
`ifndef MY_DRIVER__SV
`define MY_DRIVER__SV
class my_driver extends uvm_driver#(my_transaction);//参数化 添加参数选择驱动的transaction类型 则可使用req(获得的参数 此处为my_transaction)

   virtual my_if vif;
   virtual my_if outvif;
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
      if(!uvm_config_db#(virtual my_if)::get(this, "", "outvif", outvif))
         `uvm_fatal("my_driver", "virtual interface must be set for out-vif!!!")
   endfunction
   

   extern task main_phase(uvm_phase phase);
   extern task drive_one_pkt(my_transaction tr);
endclass

task my_driver::main_phase(uvm_phase phase);
   vif.data <= 32'b0;
   vif.data2 <= 32'b0;
   vif.op <= 3'b0;
   vif.addr <= 5'b0;
   vif.sr <= 1'b0;
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
   logic [31:0]     data[];
   logic [31:0]     data2[];
   logic [4:0]      addr[];
   logic [2:0]      op[];
   logic            start[];
   
   int  data_size;
   
   data_size = tr.data.size; 
   data    = new[data_size];
   data2   = new[data_size];
   addr    = new[data_size];
   op      = new[data_size];
   start   = new[data_size];
   data    = tr.data;
   data2   = tr.data2;
   op      = tr.op;
   addr    = tr.addr;
   start   = tr.start;
   `uvm_info("my_driver", "begin to drive one pkt", UVM_LOW);
   //repeat(33) @(posedge vif.clk);
   for ( int i = 0; i < data_size; i++ ) begin
     repeat(33)@(posedge vif.clk);
     //repeat(2)@(posedge vif.clk);
     //wait(outvif.busy == 0)begin
     //repeat(2)@(posedge vif.clk);
      @(posedge vif.clk);
      vif.flag  <= 1'b1;
      vif.data  <= data[i];
      vif.data2 <= data2[i]; 
      vif.op    <= op[i];
      vif.data  <= data[i];
      //r= {$random} % 100;
      vif.addr  <= addr[i];
      vif.sr    <= start[i];
        @(posedge vif.clk);
        vif.flag <= 1'b0;
      //end
      //@(negedge outvif.busy);
      //@(posedge vif.clk);
      //@(posedge vif.clk);
      //cov.sample(vif);
   end
  /*@(posedge vif.clk);
   vif.flag <= 1'b0;*/
   //repeat(33)@(posedge vif.clk);
   `uvm_info("my_driver", "end drive one pkt", UVM_LOW);
endtask


`endif

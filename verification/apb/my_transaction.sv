`ifndef MY_TRANSACTION__SV
`define MY_TRANSACTION__SV

class my_transaction extends uvm_sequence_item;

   rand bit[31:0]    m0_addr_i[];
   rand bit[31:0]    m1_addr_i[];
   rand bit[31:0]    m2_addr_i[];
   rand bit[31:0]    m3_addr_i[];
   rand bit[31:0]    m0_data_i[];
   rand bit[31:0]    m1_data_i[];
   rand bit[31:0]    m2_data_i[];
   rand bit[31:0]    m3_data_i[];
   rand bit          m0_req_i[];
   rand bit          m1_req_i[];
   rand bit          m2_req_i[];
   rand bit          m3_req_i[];
   rand bit          m0_we_i[];
   rand bit          m1_we_i[];
   rand bit          m2_we_i[];
   rand bit          m3_we_i[];
   rand bit[31:0]    s0_data_i[];
   rand bit[31:0]    s1_data_i[];
   rand bit[31:0]    s2_data_i[];
   rand bit[31:0]    s3_data_i[];
   rand bit[31:0]    s4_data_i[];
   rand bit[31:0]    s5_data_i[];
   rand bit s0_we_o[];
   rand bit s1_we_o[];
   rand bit s2_we_o[];
   rand bit s3_we_o[];
   rand bit s4_we_o[];
   rand bit s5_we_o[];
   rand bit[31:0] s0_data_o[];
   rand bit[31:0] s1_data_o[];
   rand bit[31:0] s2_data_o[];
   rand bit[31:0] s3_data_o[];
   rand bit[31:0] s4_data_o[];
   rand bit[31:0] s5_data_o[];
   rand bit[31:0] s0_addr_o[];
   rand bit[31:0] s1_addr_o[];
   rand bit[31:0] s2_addr_o[];
   rand bit[31:0] s3_addr_o[];
   rand bit[31:0] s4_addr_o[];
   rand bit[31:0] s5_addr_o[];
   rand bit[31:0] m0_data_o[];
   rand bit[31:0] m1_data_o[];
   rand bit[31:0] m2_data_o[];
   rand bit[31:0] m3_data_o[];
   rand bit hold_flag_o[];
   
   //rand bit mode;
   

   constraint pload_cons{
	  m0_addr_i.size >= 1;
	  m0_addr_i.size <= 1500;
	  m1_addr_i.size == m0_addr_i.size;
	  m2_addr_i.size == m0_addr_i.size;
	  m3_addr_i.size == m0_addr_i.size;
	  m0_data_i.size == m0_addr_i.size;
	  m1_data_i.size == m0_addr_i.size;
	  m2_data_i.size == m0_addr_i.size;
	  m3_data_i.size == m0_addr_i.size;
	  m0_req_i.size == m0_addr_i.size;
	  m1_req_i.size == m0_addr_i.size;
	  m2_req_i.size == m0_addr_i.size;
	  m3_req_i.size == m0_addr_i.size;
	  m0_we_i.size == m0_addr_i.size;
	  m1_we_i.size == m0_addr_i.size;
	  m2_we_i.size == m0_addr_i.size;
	  m3_we_i.size == m0_addr_i.size;
	  s0_data_i.size == m0_addr_i.size;
	  s1_data_i.size == m0_addr_i.size;
	  s2_data_i.size == m0_addr_i.size;
	  s3_data_i.size == m0_addr_i.size;
	  s4_data_i.size == m0_addr_i.size;
	  s5_data_i.size == m0_addr_i.size;
      s0_we_o.size == m0_addr_i.size;
	  s1_we_o.size == m0_addr_i.size;
	  s2_we_o.size == m0_addr_i.size;
	  s3_we_o.size == m0_addr_i.size;
	  s4_we_o.size == m0_addr_i.size;
	  s5_we_o.size == m0_addr_i.size;
	  s0_data_o.size == m0_addr_i.size;
	  s1_data_o.size == m0_addr_i.size;
	  s2_data_o.size == m0_addr_i.size;
	  s3_data_o.size == m0_addr_i.size;
	  s4_data_o.size == m0_addr_i.size;
	  s5_data_o.size == m0_addr_i.size;
	  s0_addr_o.size == m0_addr_i.size;
	  s1_addr_o.size == m0_addr_i.size;
	  s2_addr_o.size == m0_addr_i.size;
	  s3_addr_o.size == m0_addr_i.size;
	  s4_addr_o.size == m0_addr_i.size;
	  s5_addr_o.size == m0_addr_i.size;
	  m0_data_o.size == m0_addr_i.size;
	  m1_data_o.size == m0_addr_i.size;
	  m2_data_o.size == m0_addr_i.size;
	  m3_data_o.size == m0_addr_i.size;
	  hold_flag_o.size == m0_addr_i.size;
   }

   

   `uvm_object_utils_begin(my_transaction)//注册后可直接调用copy print
      /*`uvm_field_array_int(m0_addr_i, UVM_ALL_ON)
	  `uvm_field_array_int(m1_addr_i, UVM_ALL_ON)
	  `uvm_field_array_int(m2_addr_i, UVM_ALL_ON)
	  `uvm_field_array_int(m3_addr_i, UVM_ALL_ON)
	  `uvm_field_array_int(m0_data_i, UVM_ALL_ON)
	  `uvm_field_array_int(m1_data_i, UVM_ALL_ON)
	  `uvm_field_array_int(m2_data_i, UVM_ALL_ON)
	  `uvm_field_array_int(m3_data_i, UVM_ALL_ON)
	  `uvm_field_array_int(m0_req_i, UVM_ALL_ON)
      `uvm_field_array_int(m1_req_i, UVM_ALL_ON)
      `uvm_field_array_int(m2_req_i, UVM_ALL_ON)
	  `uvm_field_array_int(m3_req_i, UVM_ALL_ON)
	  `uvm_field_array_int(m0_we_i, UVM_ALL_ON)
	  `uvm_field_array_int(m1_we_i, UVM_ALL_ON)
	  `uvm_field_array_int(m2_we_i, UVM_ALL_ON)
	  `uvm_field_array_int(m3_we_i, UVM_ALL_ON)
	  `uvm_field_array_int(s0_data_i, UVM_ALL_ON)
	  `uvm_field_array_int(s1_data_i, UVM_ALL_ON)
	  `uvm_field_array_int(s2_data_i, UVM_ALL_ON)
	  `uvm_field_array_int(s3_data_i, UVM_ALL_ON)
	  `uvm_field_array_int(s4_data_i, UVM_ALL_ON)
	  `uvm_field_array_int(s5_data_i, UVM_ALL_ON)*/
	  
	  `uvm_field_array_int(s0_we_o, UVM_ALL_ON)
	  `uvm_field_array_int(s1_we_o, UVM_ALL_ON)
	  `uvm_field_array_int(s2_we_o, UVM_ALL_ON)
	  `uvm_field_array_int(s3_we_o, UVM_ALL_ON)
	  `uvm_field_array_int(s4_we_o, UVM_ALL_ON)
	  `uvm_field_array_int(s5_we_o, UVM_ALL_ON)
	  `uvm_field_array_int(s0_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(s1_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(s2_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(s3_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(s4_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(s5_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(s0_addr_o, UVM_ALL_ON)
	  `uvm_field_array_int(s1_addr_o, UVM_ALL_ON)
	  `uvm_field_array_int(s2_addr_o, UVM_ALL_ON)
	  `uvm_field_array_int(s3_addr_o, UVM_ALL_ON)
	  `uvm_field_array_int(s4_addr_o, UVM_ALL_ON)
	  `uvm_field_array_int(s5_addr_o, UVM_ALL_ON)
	  `uvm_field_array_int(m0_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(m1_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(m2_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(m3_data_o, UVM_ALL_ON)
	  `uvm_field_array_int(hold_flag_o, UVM_ALL_ON)
      //`uvm_field_int(mode, UVM_ALL_ON)
   `uvm_object_utils_end

   function new(string name = "my_transaction");
      super.new();
      
   endfunction

endclass
`endif

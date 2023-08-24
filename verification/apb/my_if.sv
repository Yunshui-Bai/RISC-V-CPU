`ifndef MY_IF__SV
`define MY_IF__SV

interface my_if(input clk, input rst_n);

   logic [31:0] m0_addr_i;
   logic [31:0] m1_addr_i;
   logic [31:0] m2_addr_i;
   logic [31:0] m3_addr_i;
   logic [31:0] m0_data_i;
   logic [31:0] m1_data_i;
   logic [31:0] m2_data_i;
   logic [31:0] m3_data_i;
   logic [31:0] m0_data_o;
   logic [31:0] m1_data_o;
   logic [31:0] m2_data_o;
   logic [31:0] m3_data_o;
   logic m0_req_i;
   logic m1_req_i;
   logic m2_req_i;
   logic m3_req_i;
   logic [31:0] m0_we_i;
   logic [31:0] m1_we_i;
   logic [31:0] m2_we_i;
   logic [31:0] m3_we_i;
   logic s0_we_o;
   logic s1_we_o;
   logic s2_we_o;
   logic s3_we_o;
   logic s4_we_o;
   logic s5_we_o;
   logic [31:0] s0_data_o;
   logic [31:0] s1_data_o;
   logic [31:0] s2_data_o;
   logic [31:0] s3_data_o;
   logic [31:0] s4_data_o;
   logic [31:0] s5_data_o;
   logic [31:0] s0_addr_o;
   logic [31:0] s1_addr_o;
   logic [31:0] s2_addr_o;
   logic [31:0] s3_addr_o;
   logic [31:0] s4_addr_o;
   logic [31:0] s5_addr_o;
   logic [31:0] s0_data_i;
   logic [31:0] s1_data_i;
   logic [31:0] s2_data_i;
   logic [31:0] s3_data_i;
   logic [31:0] s4_data_i;
   logic [31:0] s5_data_i;
   logic hold_flag_o;
   logic flag;
endinterface

`endif

//`timescale 1ns/1ps
`include "uvm_macros.svh"

import uvm_pkg::*;
`include "rib.v"
`include "my_if.sv"
`include "my_transaction.sv"
`include "my_sequencer.sv"
`include "my_driver.sv"
`include "my_monitor.sv"
`include "my_agent.sv"
`include "my_model.sv"
`include "my_scoreboard.sv"
`include "my_sequence.sv"
`include "my_env.sv"
`include "base_test.sv"
`include "my_case0.sv"
`include "my_case1.sv"

module top_tb;

reg clk;
reg rst_n;



my_if input_if(clk, rst_n);
my_if output_if(clk, rst_n);


rib dut(.clk(clk),
		.rst(rst_n),
		.m0_addr_i(input_if.m0_addr_i),
        .m1_addr_i(input_if.m1_addr_i),
        .m2_addr_i(input_if.m2_addr_i),
        .m3_addr_i(input_if.m3_addr_i),
        .m0_data_i(input_if.m0_data_i),
        .m1_data_i(input_if.m1_data_i),
        .m2_data_i(input_if.m2_data_i),
        .m3_data_i(input_if.m3_data_i),
        .m0_data_o(output_if.m0_data_o),
        .m1_data_o(output_if.m1_data_o),
        .m2_data_o(output_if.m2_data_o),
        .m3_data_o(output_if.m3_data_o),
        .m0_req_i(input_if.m0_req_i),
        .m1_req_i(input_if.m1_req_i),
        .m2_req_i(input_if.m2_req_i),
        .m3_req_i(input_if.m3_req_i),
        .m0_we_i(input_if.m0_we_i),
        .m1_we_i(input_if.m1_we_i),
        .m2_we_i(input_if.m2_we_i),
        .m3_we_i(input_if.m3_we_i),
		.s0_we_o(output_if.s0_we_o),
		.s1_we_o(output_if.s1_we_o),
		.s2_we_o(output_if.s2_we_o),
		.s3_we_o(output_if.s3_we_o),
		.s4_we_o(output_if.s4_we_o),
		.s5_we_o(output_if.s5_we_o),
		.s0_data_o(output_if.s0_data_o),
		.s1_data_o(output_if.s1_data_o),
		.s2_data_o(output_if.s2_data_o),
		.s3_data_o(output_if.s3_data_o),
		.s4_data_o(output_if.s4_data_o),
		.s5_data_o(output_if.s5_data_o),
		.s0_addr_o(output_if.s0_addr_o),
		.s1_addr_o(output_if.s1_addr_o),
		.s2_addr_o(output_if.s2_addr_o),
		.s3_addr_o(output_if.s3_addr_o),
		.s4_addr_o(output_if.s4_addr_o),
		.s5_addr_o(output_if.s5_addr_o),
		.s0_data_i(input_if.s0_data_i),
		.s1_data_i(input_if.s1_data_i),
		.s2_data_i(input_if.s2_data_i),
		.s3_data_i(input_if.s3_data_i),
		.s4_data_i(input_if.s4_data_i),
		.s5_data_i(input_if.s5_data_i),
		.hold_flag_o(output_if.hold_flag_o)
	);

    
covergroup master_0 @(posedge clk);
	m0_we : coverpoint input_if.m0_we_i{
      bins even  = {0};
      bins odd   = {1};
    }
	m0_req : coverpoint input_if.m0_req_i{
      bins even  = {0};
      bins odd   = {1};
    }
	m0_addr : coverpoint input_if.m0_addr_i[31:28]{
	  bins slave_0 = {4'b0000};
	  bins slave_1 = {4'b0001};
	  bins slave_2 = {4'b0010};
	  bins slave_3 = {4'b0011};
	  bins slave_4 = {4'b0100};
	  bins slave_5 = {4'b0101};
	  }
	m0: cross m0_we, m0_req, m0_addr{
	ignore_bins zero = binsof(m0_req.even);
	}
  endgroup
  
covergroup master_1 @(posedge clk);
	m1_we : coverpoint input_if.m1_we_i{
      bins even  = {0};
      bins odd   = {1};
    }
	m1_req : coverpoint input_if.m1_req_i{
      bins even  = {0};
      bins odd   = {1};
    }
	m1_addr : coverpoint input_if.m1_addr_i[31:28]{
	  bins slave_0 = {4'b0000};
	  bins slave_1 = {4'b0001};
	  bins slave_2 = {4'b0010};
	  bins slave_3 = {4'b0011};
	  bins slave_4 = {4'b0100};
	  bins slave_5 = {4'b0101};
	  }
	m1: cross m1_we, m1_req, m1_addr{
	ignore_bins zero = binsof(m1_req.even);
	}
endgroup

covergroup master_2 @(posedge clk);
	m2_we : coverpoint input_if.m2_we_i{
      bins even  = {0};
      bins odd   = {1};
    }
	m2_req : coverpoint input_if.m2_req_i{
      bins even  = {0};
      bins odd   = {1};
    }
	m2_addr : coverpoint input_if.m2_addr_i[31:28]{
	  bins slave_0 = {4'b0000};
	  bins slave_1 = {4'b0001};
	  bins slave_2 = {4'b0010};
	  bins slave_3 = {4'b0011};
	  bins slave_4 = {4'b0100};
	  bins slave_5 = {4'b0101};
	  }
	m2: cross m2_we, m2_req, m2_addr{
	ignore_bins zero = binsof(m2_req.even);
	}
endgroup

covergroup master_3 @(posedge clk);
	m3_we : coverpoint input_if.m3_we_i{
      bins even  = {0};
      bins odd   = {1};
    }
	m3_req : coverpoint input_if.m3_req_i{
      bins even  = {0};
      bins odd   = {1};
    }
	m3_addr : coverpoint input_if.m3_addr_i[31:28]{
	  bins slave_0 = {4'b0000};
	  bins slave_1 = {4'b0001};
	  bins slave_2 = {4'b0010};
	  bins slave_3 = {4'b0011};
	  bins slave_4 = {4'b0100};
	  bins slave_5 = {4'b0101};
	  }
	m3: cross m3_we, m3_req, m3_addr{
	ignore_bins zero = binsof(m3_req.even);
	}
endgroup


	
    /*s0_we : coverpoint input_if.s0_we_o {
      bins all    = {32'b0,32'hffff_ffff};
      //bins high   = {13'b1_0000_0000_0000,13'b1_1111_1111_1111};
    }
    load : coverpoint  input_if.load {
      bins even  = {0};
      bins odd   = {1};
    }
    hold :coverpoint input_if.hold{
      bins not_hold = {3'b0};
      bins hold = {3'b001,3'b111};
    }
    rst  : coverpoint rst_n{
      bins one ={1};
      bins zero = {0};
    } */

  
//cov_counter cov_count = new();
master_0 cov_0 = new();
master_1 cov_1 = new();
master_2 cov_2 = new();
master_3 cov_3 = new();

initial begin
   clk = 0;
   forever begin
      #10 clk = ~clk;
   end
end
assign output_if.flag = input_if.flag;//tr 标志位
initial begin
   rst_n = 1'b0;
   #30 rst_n = 1'b1;
end

initial begin
   run_test("my_case1");
   //run_test("my_env");
end

initial begin
   uvm_config_db#(virtual my_if)::set(null, "uvm_test_top.env.i_agt.drv", "vif", input_if);
   uvm_config_db#(virtual my_if)::set(null, "uvm_test_top.env.i_agt.mon", "vif", input_if);
   uvm_config_db#(virtual my_if)::set(null, "uvm_test_top.env.o_agt.mon", "vif", output_if);
end

`ifdef FSDB
initial begin
	$fsdbDumpfile("top_tb.fsdb");  //产生波形的名字
	$fsdbDumpvars(0, top_tb);       //testbench的名字       
	$fsdbDumpSVA();
	$fsdbDumpMDA();  
end
`endif

endmodule

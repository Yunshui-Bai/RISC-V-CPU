`ifndef MY_MODEL__SV
`define MY_MODEL__SV

class my_model extends uvm_component;
   
   uvm_blocking_get_port #(my_transaction)  port;
   uvm_analysis_port #(my_transaction)  ap;

   extern function new(string name, uvm_component parent);
   extern function void build_phase(uvm_phase phase);
   extern virtual  task main_phase(uvm_phase phase);

   `uvm_component_utils(my_model)
endclass 

function my_model::new(string name, uvm_component parent);
   super.new(name, parent);
endfunction 

function void my_model::build_phase(uvm_phase phase);
   super.build_phase(phase);
   port = new("port", this);
   ap = new("ap", this);
endfunction

task my_model::main_phase(uvm_phase phase);
   my_transaction tr;
   my_transaction new_tr;
   /*logic hold = 1'b0;
   logic [31:0] s_addr_o = 32'b0;
   logic s_we_o  = 1'b0;
   logic [31:0] m_data_o = 32'b0;
   logic [31:0] s_data_o = 32'b0;*/
   logic s0_we_o = 1'b0;
   logic s1_we_o = 1'b0;
   logic s2_we_o = 1'b0;
   logic s3_we_o = 1'b0;
   logic s4_we_o = 1'b0;
   logic s5_we_o = 1'b0;
   logic[31:0] s0_data_o = 32'b0;
   logic[31:0] s1_data_o = 32'b0;
   logic[31:0] s2_data_o = 32'b0;
   logic[31:0] s3_data_o = 32'b0;
   logic[31:0] s4_data_o = 32'b0;
   logic[31:0] s5_data_o = 32'b0;
   logic[31:0] s0_addr_o = 32'b0;
   logic[31:0] s1_addr_o = 32'b0;
   logic[31:0] s2_addr_o = 32'b0;
   logic[31:0] s3_addr_o = 32'b0;
   logic[31:0] s4_addr_o = 32'b0;
   logic[31:0] s5_addr_o = 32'b0;
   logic[31:0] m0_data_o = 32'b0;
   logic[31:0] m1_data_o = 32'b1;
   logic[31:0] m2_data_o = 32'b0;
   logic[31:0] m3_data_o = 32'b0;
   logic hold_flag_o = 32'b0;
   
   logic [31:0] m0_addr_i = 32'b0;
   logic [31:0] m1_addr_i = 32'b0;
   logic [31:0] m2_addr_i = 32'b0;
   logic [31:0] m3_addr_i = 32'b0;
   logic [31:0] m0_data_i = 32'b0;
   logic [31:0] m1_data_i = 32'b0;
   logic [31:0] m2_data_i = 32'b0;
   logic [31:0] m3_data_i = 32'b0;
   logic m0_req_i= 1'b0;
   logic m1_req_i= 1'b0;
   logic m2_req_i= 1'b0;
   logic m3_req_i= 1'b0;
   logic m0_we_i = 1'b0;
   logic m1_we_i = 1'b0;
   logic m2_we_i = 1'b0;
   logic m3_we_i = 1'b0;
   logic [31:0] s0_data_i = 32'b0;
   logic [31:0] s1_data_i = 32'b0;
   logic [31:0] s2_data_i = 32'b0;
   logic [31:0] s3_data_i = 32'b0;
   logic [31:0] s4_data_i = 32'b0;
   logic [31:0] s5_data_i = 32'b0;
   int data_size;
   super.main_phase(phase);
   while(1) begin
      port.get(tr);
      new_tr = new("new_tr");
      data_size = tr.m0_addr_i.size;
      new_tr.m0_addr_i = new[data_size];
      new_tr.m1_addr_i = new[data_size];
      new_tr.m2_addr_i = new[data_size];
      new_tr.m3_addr_i = new[data_size];
      new_tr.m0_data_i = new[data_size];
      new_tr.m1_data_i = new[data_size];
      new_tr.m2_data_i = new[data_size];
      new_tr.m3_data_i = new[data_size];
      new_tr.m0_req_i = new[data_size];
      new_tr.m1_req_i = new[data_size];
      new_tr.m2_req_i = new[data_size];
      new_tr.m3_req_i = new[data_size];
      new_tr.m0_we_i = new[data_size];
      new_tr.m1_we_i = new[data_size];
      new_tr.m2_we_i = new[data_size];
      new_tr.m3_we_i = new[data_size];
      new_tr.s0_data_i = new[data_size];
      new_tr.s1_data_i = new[data_size];
      new_tr.s2_data_i = new[data_size];
      new_tr.s3_data_i = new[data_size];
      new_tr.s4_data_i = new[data_size];
      new_tr.s5_data_i = new[data_size];
      new_tr.s0_we_o = new[data_size];
      new_tr.s1_we_o = new[data_size];
      new_tr.s2_we_o = new[data_size];
      new_tr.s3_we_o = new[data_size];
      new_tr.s4_we_o = new[data_size];
      new_tr.s5_we_o = new[data_size];
      new_tr.s0_data_o = new[data_size];
      new_tr.s1_data_o = new[data_size];
      new_tr.s2_data_o = new[data_size];
      new_tr.s3_data_o = new[data_size];
      new_tr.s4_data_o = new[data_size];
      new_tr.s5_data_o = new[data_size];
      new_tr.s0_addr_o = new[data_size];
      new_tr.s1_addr_o = new[data_size];
      new_tr.s2_addr_o = new[data_size];
      new_tr.s3_addr_o = new[data_size];
      new_tr.s4_addr_o = new[data_size];
      new_tr.s5_addr_o = new[data_size];
      new_tr.hold_flag_o = new[data_size];
	  new_tr.m0_data_o = new[data_size];
	  new_tr.m1_data_o = new[data_size];
	  new_tr.m2_data_o = new[data_size];
	  new_tr.m3_data_o = new[data_size];

      for(int i=0;i<data_size;i++)begin
		new_tr.s0_we_o[i] = s0_we_o;
		new_tr.s1_we_o[i] = s1_we_o;
		new_tr.s2_we_o[i] = s2_we_o;
		new_tr.s3_we_o[i] = s3_we_o;
		new_tr.s4_we_o[i] = s4_we_o;
		new_tr.s5_we_o[i] = s5_we_o;
		new_tr.s0_data_o[i] = s0_data_o;
		new_tr.s1_data_o[i] = s1_data_o;
		new_tr.s2_data_o[i] = s2_data_o;
		new_tr.s3_data_o[i] = s3_data_o;
		new_tr.s4_data_o[i] = s4_data_o;
		new_tr.s5_data_o[i] = s5_data_o;
		new_tr.s0_addr_o[i] = s0_addr_o;
		new_tr.s1_addr_o[i] = s1_addr_o;
		new_tr.s2_addr_o[i] = s2_addr_o;
		new_tr.s3_addr_o[i] = s3_addr_o;
		new_tr.s4_addr_o[i] = s4_addr_o;
		new_tr.s5_addr_o[i] = s5_addr_o;
		new_tr.hold_flag_o[i] = hold_flag_o;
		new_tr.m0_data_o[i] = m0_data_o;
		new_tr.m1_data_o[i] = m1_data_o;
		new_tr.m2_data_o[i] = m2_data_o;
		new_tr.m3_data_o[i] = m3_data_o;
		
		m0_addr_i = tr.m0_addr_i[i];
		m1_addr_i = tr.m1_addr_i[i];
		m2_addr_i = tr.m2_addr_i[i];
		m3_addr_i = tr.m3_addr_i[i];
		m0_data_i = tr.m0_data_i[i];
		m1_data_i = tr.m1_data_i[i];
		m2_data_i = tr.m2_data_i[i];
		m3_data_i = tr.m3_data_i[i];
		m0_req_i  = tr.m0_req_i[i];
		m1_req_i  = tr.m1_req_i[i];
		m2_req_i  = tr.m2_req_i[i];
		m3_req_i  = tr.m3_req_i[i];
		m0_we_i   = tr.m0_we_i[i];
		m1_we_i   = tr.m1_we_i[i];
		m2_we_i   = tr.m2_we_i[i];
		m3_we_i   = tr.m3_we_i[i];
		s0_data_i = tr.s0_data_i[i];
		s1_data_i = tr.s1_data_i[i];
		s2_data_i = tr.s2_data_i[i];
		s3_data_i = tr.s3_data_i[i];
		s4_data_i = tr.s4_data_i[i];
		s5_data_i = tr.s5_data_i[i];
	    hold_flag_o = 1'b0;
		s0_data_o = 32'b0;
		s1_data_o = 32'b0;
		s2_data_o = 32'b0;
		s3_data_o = 32'b0;
		s4_data_o = 32'b0;
		s5_data_o = 32'b0;
		s0_addr_o = 32'b0;
		s1_addr_o = 32'b0;
		s2_addr_o = 32'b0;
		s3_addr_o = 32'b0;
		s4_addr_o = 32'b0;
		s5_addr_o = 32'b0;
		m0_data_o = 32'b0;
		m1_data_o = 32'b1;
		m2_data_o = 32'b0;
		m3_data_o = 32'b0;
	    if(m3_req_i)begin
		   hold_flag_o = 1'b1;
		   case(m3_addr_i[31:28])
			   4'b0000: begin
                   s0_we_o = m3_we_i;
                   s0_addr_o = {{4'h0}, {m3_addr_i[27:0]}};
                   s0_data_o = m3_data_i;
                   m3_data_o = s0_data_i;
               end
               4'b0001: begin
                   s1_we_o = m3_we_i;
                   s1_addr_o = {{4'h0}, {m3_addr_i[27:0]}};
                   s1_data_o = m3_data_i;
                   m3_data_o = s1_data_i;
               end
               4'b0010: begin
                   s2_we_o = m3_we_i;
                   s2_addr_o = {{4'h0}, {m3_addr_i[27:0]}};
                   s2_data_o = m3_data_i;
                   m3_data_o = s2_data_i;
               end
               4'b0011: begin
                   s3_we_o = m3_we_i;
                   s3_addr_o = {{4'h0}, {m3_addr_i[27:0]}};
                   s3_data_o = m3_data_i;
                   m3_data_o = s3_data_i;
               end
               4'b0100: begin
                   s4_we_o = m3_we_i;
                   s4_addr_o = {{4'h0}, {m3_addr_i[27:0]}};
                   s4_data_o = m3_data_i;
                   m3_data_o = s4_data_i;
               end
               4'b0101: begin
                   s5_we_o = m3_we_i;
                   s5_addr_o = {{4'h0}, {m3_addr_i[27:0]}};
                   s5_data_o = m3_data_i;
                   m3_data_o = s5_data_i;
               end
		  endcase
		end
        else if(m0_req_i) begin
				hold_flag_o = 1'b1;
				case(m0_addr_i[31:28])
		        4'b0000: begin
		      	    s0_we_o = m0_we_i;
                    s0_addr_o = {{4'h0}, {m0_addr_i[27:0]}};
                    s0_data_o = m0_data_i;
                    m0_data_o = s0_data_i;
                end
                4'b0001: begin
                    s1_we_o = m0_we_i;
                    s1_addr_o = {{4'h0}, {m0_addr_i[27:0]}};
                    s1_data_o = m0_data_i;
                    m0_data_o = s1_data_i;
                end
                4'b0010: begin
                    s2_we_o = m0_we_i;
                    s2_addr_o = {{4'h0}, {m0_addr_i[27:0]}};
                    s2_data_o = m0_data_i;
                    m0_data_o = s2_data_i;
                end
                4'b0011: begin
                    s3_we_o = m0_we_i;
                    s3_addr_o = {{4'h0}, {m0_addr_i[27:0]}};
                    s3_data_o = m0_data_i;
                    m0_data_o = s3_data_i;
                end
                4'b0100: begin
                    s4_we_o = m0_we_i;
                    s4_addr_o = {{4'h0}, {m0_addr_i[27:0]}};
                    s4_data_o = m0_data_i;
                    m0_data_o = s4_data_i;
                end
                4'b0101: begin
                    s5_we_o = m0_we_i;
                    s5_addr_o = {{4'h0}, {m0_addr_i[27:0]}};
                    s5_data_o = m0_data_i;
                    m0_data_o = s5_data_i;
                end
                
		       endcase
		end
		else if(m2_req_i) begin
				hold_flag_o = 1'b1;
				case(m2_addr_i[31:28])
		        4'b0000: begin
		      	    s0_we_o = m2_we_i;
                    s0_addr_o = {{4'h0}, {m2_addr_i[27:0]}};
                    s0_data_o = m2_data_i;
                    m2_data_o = s0_data_i;
                end
                4'b0001: begin
                    s1_we_o = m2_we_i;
                    s1_addr_o = {{4'h0}, {m2_addr_i[27:0]}};
                    s1_data_o = m2_data_i;
                    m2_data_o = s1_data_i;
                end
                4'b0010: begin
                    s2_we_o = m2_we_i;
                    s2_addr_o = {{4'h0}, {m2_addr_i[27:0]}};
                    s2_data_o = m2_data_i;
                    m2_data_o = s2_data_i;
                end
                4'b0011: begin
                    s3_we_o = m2_we_i;
                    s3_addr_o = {{4'h0}, {m2_addr_i[27:0]}};
                    s3_data_o = m2_data_i;
                    m2_data_o = s3_data_i;
                end
                4'b0100: begin
                    s4_we_o = m2_we_i;
                    s4_addr_o = {{4'h0}, {m2_addr_i[27:0]}};
                    s4_data_o = m2_data_i;
                    m2_data_o = s4_data_i;
                end
                4'b0101: begin
                    s5_we_o = m2_we_i;
                    s5_addr_o = {{4'h0}, {m2_addr_i[27:0]}};
                    s5_data_o = m2_data_i;
                    m2_data_o = s5_data_i;
                end
                
		       endcase
		end
		else begin
				hold_flag_o = 1'b0;
		        case(m1_addr_i[31:28])
		      	   4'b0000: begin
                       s0_we_o = m1_we_i;
                       s0_addr_o = {{4'h0}, {m1_addr_i[27:0]}};
                       s0_data_o = m1_data_i;
                       m1_data_o = s0_data_i;
                   end
                   4'b0001: begin
                       s1_we_o = m1_we_i;
                       s1_addr_o = {{4'h0}, {m1_addr_i[27:0]}};
                       s1_data_o = m1_data_i;
                       m1_data_o = s1_data_i;
                   end
                   4'b0010: begin
                       s2_we_o = m1_we_i;
                       s2_addr_o = {{4'h0}, {m1_addr_i[27:0]}};
                       s2_data_o = m1_data_i;
                       m1_data_o = s2_data_i;
                   end
                   4'b0011: begin
                       s3_we_o = m1_we_i;
                       s3_addr_o = {{4'h0}, {m1_addr_i[27:0]}};
                       s3_data_o = m1_data_i;
                       m1_data_o = s3_data_i;
                   end
                   4'b0100: begin
                       s4_we_o = m1_we_i;
                       s4_addr_o = {{4'h0}, {m1_addr_i[27:0]}};
                       s4_data_o = m1_data_i;
                       m1_data_o = s4_data_i;
                   end
                   4'b0101: begin
                       s5_we_o = m1_we_i;
                       s5_addr_o = {{4'h0}, {m1_addr_i[27:0]}};
                       s5_data_o = m1_data_i;
                       m1_data_o = s5_data_i;
                   end
		       endcase
		end

		new_tr.s0_we_o[i] = s0_we_o;
		new_tr.s1_we_o[i] = s1_we_o;
		new_tr.s2_we_o[i] = s2_we_o;
		new_tr.s3_we_o[i] = s3_we_o;
		new_tr.s4_we_o[i] = s4_we_o;
		new_tr.s5_we_o[i] = s5_we_o;
		new_tr.s0_data_o[i] = s0_data_o;
		new_tr.s1_data_o[i] = s1_data_o;
		new_tr.s2_data_o[i] = s2_data_o;
		new_tr.s3_data_o[i] = s3_data_o;
		new_tr.s4_data_o[i] = s4_data_o;
		new_tr.s5_data_o[i] = s5_data_o;
		new_tr.s0_addr_o[i] = s0_addr_o;
		new_tr.s1_addr_o[i] = s1_addr_o;
		new_tr.s2_addr_o[i] = s2_addr_o;
		new_tr.s3_addr_o[i] = s3_addr_o;
		new_tr.s4_addr_o[i] = s4_addr_o;
		new_tr.s5_addr_o[i] = s5_addr_o;
		new_tr.hold_flag_o[i] = hold_flag_o;
		new_tr.m0_data_o[i] = m0_data_o;
		new_tr.m1_data_o[i] = m1_data_o;
		new_tr.m2_data_o[i] = m2_data_o;
		new_tr.m3_data_o[i] = m3_data_o;
		
		m0_addr_i = tr.m0_addr_i[i];
		m1_addr_i = tr.m1_addr_i[i];
		m2_addr_i = tr.m2_addr_i[i];
		m3_addr_i = tr.m3_addr_i[i];
		m0_data_i = tr.m0_data_i[i];
		m1_data_i = tr.m1_data_i[i];
		m2_data_i = tr.m2_data_i[i];
		m3_data_i = tr.m3_data_i[i];
		m0_req_i  = tr.m0_req_i[i];
		m1_req_i  = tr.m1_req_i[i];
		m2_req_i  = tr.m2_req_i[i];
		m3_req_i  = tr.m3_req_i[i];
		m0_we_i   = tr.m0_we_i[i];
		m1_we_i   = tr.m1_we_i[i];
		m2_we_i   = tr.m2_we_i[i];
		m3_we_i   = tr.m3_we_i[i];
		s0_data_i = tr.s0_data_i[i];
		s1_data_i = tr.s1_data_i[i];
		s2_data_i = tr.s2_data_i[i];
		s3_data_i = tr.s3_data_i[i];
		s4_data_i = tr.s4_data_i[i];
		s5_data_i = tr.s5_data_i[i];
      end
      new_tr.m0_addr_i = tr.m0_addr_i;
	  new_tr.m1_addr_i = tr.m1_addr_i;
	  new_tr.m2_addr_i = tr.m2_addr_i;
	  new_tr.m3_addr_i = tr.m3_addr_i;
	  new_tr.m0_data_i = tr.m0_data_i;
	  new_tr.m1_data_i = tr.m1_data_i;
	  new_tr.m2_data_i = tr.m2_data_i;
	  new_tr.m3_data_i = tr.m3_data_i;
	  new_tr.m0_req_i  = tr.m0_req_i;
	  new_tr.m1_req_i  = tr.m1_req_i;
	  new_tr.m2_req_i  = tr.m2_req_i;
	  new_tr.m3_req_i  = tr.m3_req_i;
	  new_tr.m0_we_i   = tr.m0_we_i;
	  new_tr.m1_we_i   = tr.m1_we_i;
	  new_tr.m2_we_i   = tr.m2_we_i;
	  new_tr.m3_we_i   = tr.m3_we_i;
	  new_tr.s0_data_i = tr.s0_data_i;
	  new_tr.s1_data_i = tr.s1_data_i;
	  new_tr.s2_data_i = tr.s2_data_i;
	  new_tr.s3_data_i = tr.s3_data_i;
	  new_tr.s4_data_i = tr.s4_data_i;
	  new_tr.s5_data_i = tr.s5_data_i;
      `uvm_info("my_model", "get one transaction, copy and print it:", UVM_LOW)
      //new_tr.print();
      ap.write(new_tr);
      `uvm_info("my_model", "model has send a pakage", UVM_LOW)
   end
endtask
`endif

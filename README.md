# Project_rv: tiny_risc_v_cpu by [liangkangnan](https://gitee.com/liangkangnan/tinyriscv)
tinyriscv_soc_top.v 结构分析
```
//core核结构
![1](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/4e70b6bf-6ab7-46a7-bc35-2bc51020e965)
// tinyriscv soc顶层模块 - 内核连接外设
    // tinyriscv处理器核模块例化
    tinyriscv u_tinyriscv(.clk(clk),.rst(rst),.rib_ex_addr_o(m0_addr_i),.rib_ex_data_i(m0_data_o),.rib_ex_data_o(m0_data_i),.rib_ex_req_o(m0_req_i),.rib_ex_we_o(m0_we_i),.rib_pc_addr_o(m1_addr_i),.rib_pc_data_i(m1_data_o),.jtag_reg_addr_i(jtag_reg_addr_o),.jtag_reg_data_i(jtag_reg_data_o),.jtag_reg_we_i(jtag_reg_we_o),.jtag_reg_data_o(jtag_reg_data_i),.rib_hold_flag_i(rib_hold_flag_o),.jtag_halt_flag_i(jtag_halt_req_o),.jtag_reset_flag_i(jtag_reset_req_o),.int_i(int_flag));

    // rom模块例化
    rom u_rom(.clk(clk),.rst(rst),.we_i(s0_we_o),.addr_i(s0_addr_o),.data_i(s0_data_o),.data_o(s0_data_i));
    // ram模块例化
    ram u_ram(.clk(clk),.rst(rst),.we_i(s1_we_o),.addr_i(s1_addr_o),.data_i(s1_data_o),.data_o(s1_data_i));
    // timer模块例化
    timer timer_0(.clk(clk),.rst(rst),.data_i(s2_data_o),.addr_i(s2_addr_o),.we_i(s2_we_o),.data_o(s2_data_i),.int_sig_o(timer0_int));
    // uart模块例化
    uart uart_0(.clk(clk),.rst(rst),.we_i(s3_we_o),.addr_i(s3_addr_o),.data_i(s3_data_o),.data_o(s3_data_i),.tx_pin(uart_tx_pin),.rx_pin(uart_rx_pin));
    // io0
    assign gpio[0] = (gpio_ctrl[1:0] == 2'b01)? gpio_data[0]: 1'bz;
    assign io_in[0] = gpio[0];
    // io1
    assign gpio[1] = (gpio_ctrl[3:2] == 2'b01)? gpio_data[1]: 1'bz;
    assign io_in[1] = gpio[1];
    // gpio模块例化
    gpio gpio_0(.clk(clk),.rst(rst),.we_i(s4_we_o),.addr_i(s4_addr_o),.data_i(s4_data_o),.data_o(s4_data_i),.io_pin_i(io_in),.reg_ctrl(gpio_ctrl),.reg_data(gpio_data)
    );
    // spi模块例化
    spi spi_0(.clk(clk),.rst(rst),.data_i(s5_data_o),.addr_i(s5_addr_o),.we_i(s5_we_o),.data_o(s5_data_i),.spi_mosi(spi_mosi),.spi_miso(spi_miso),.spi_ss(spi_ss),.spi_clk(spi_clk));

    // RISC-V Internal Bus
    rib u_rib(.clk(clk),.rst(rst),

        // master 0 interface
        .m0_addr_i(m0_addr_i),.m0_data_i(m0_data_i),.m0_data_o(m0_data_o),.m0_req_i(m0_req_i),.m0_we_i(m0_we_i),
        // master 1 interface
        .m1_addr_i(m1_addr_i),.m1_data_i(`ZeroWord),.m1_data_o(m1_data_o),.m1_req_i(`RIB_REQ),.m1_we_i(`WriteDisable),
        // master 2 interface
        .m2_addr_i(m2_addr_i),.m2_data_i(m2_data_i),.m2_data_o(m2_data_o),.m2_req_i(m2_req_i),.m2_we_i(m2_we_i),
        // master 3 interface
        .m3_addr_i(m3_addr_i),.m3_data_i(m3_data_i),.m3_data_o(m3_data_o),.m3_req_i(m3_req_i),.m3_we_i(m3_we_i),
        // slave 0 interface
        .s0_addr_o(s0_addr_o),.s0_data_o(s0_data_o),.s0_data_i(s0_data_i),.s0_we_o(s0_we_o),
        // slave 1 interface
        .s1_addr_o(s1_addr_o),.s1_data_o(s1_data_o),.s1_data_i(s1_data_i),.s1_we_o(s1_we_o),
        // slave 2 interface
        .s2_addr_o(s2_addr_o),.s2_data_o(s2_data_o),.s2_data_i(s2_data_i),.s2_we_o(s2_we_o),
        // slave 3 interface
        .s3_addr_o(s3_addr_o),.s3_data_o(s3_data_o),.s3_data_i(s3_data_i),.s3_we_o(s3_we_o),
        // slave 4 interface
        .s4_addr_o(s4_addr_o),.s4_data_o(s4_data_o),.s4_data_i(s4_data_i),.s4_we_o(s4_we_o),
        // slave 5 interface
        .s5_addr_o(s5_addr_o),.s5_data_o(s5_data_o),.s5_data_i(s5_data_i),.s5_we_o(s5_we_o),
        .hold_flag_o(rib_hold_flag_o));
    // 串口下载模块例化
    uart_debug u_uart_debug(.clk(clk),.rst(rst),.debug_en_i(uart_debug_pin),.req_o(m3_req_i),.mem_we_o(m3_we_i),.mem_addr_o(m3_addr_i),.mem_wdata_o(m3_data_i),.mem_rdata_i(m3_data_o));

    // jtag模块例化
    jtag_top #(.DMI_ADDR_BITS(6),.DMI_DATA_BITS(32),.DMI_OP_BITS(2)) u_jtag_top(.clk(clk),.jtag_rst_n(rst),.jtag_pin_TCK(jtag_TCK),.jtag_pin_TMS(jtag_TMS),.jtag_pin_TDI(jtag_TDI),.jtag_pin_TDO(jtag_TDO),.reg_we_o(jtag_reg_we_o),.reg_addr_o(jtag_reg_addr_o),.reg_wdata_o(jtag_reg_data_o),.reg_rdata_i(jtag_reg_data_i),.mem_we_o(m2_we_i),.mem_addr_o(m2_addr_i),.mem_wdata_o(m2_data_i),.mem_rdata_i(m2_data_o),.op_req_o(m2_req_i),.halt_req_o(jtag_halt_req_o),.reset_req_o(jtag_reset_req_o));







```







### 验证部分
#### core部分
##### pc寄存器 
测试1500条指令，验证了暂停，跳转，和pc+4的功能   
编译指令：make comp  仿真： ./simv -gui 查看覆盖率：make cov
测试结果：` Compare SUCCESSFULLY`![pc_reg verdi](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/caf51375-3e60-4b11-bdac-3061459955b9)
代码覆盖率：![pc_reg coverage1](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/a9f026a6-bdd3-4eb9-a68b-e1901847841d)
条件覆盖率为2/3是一条|语句未完全判断   
功能覆盖率：![pc_reg coverage2](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/bf9dd63a-8b4e-4bff-a070-aa3cffbaa0d5)
rst，jump，hold，inst addr 均为100%；   
#### regs 通用寄存器
测试了优先级判断，寄存器读写（含零寄存器5'b0），jtag的寄存器读写操作     
结果比较方法：`result = (get_actual.jdata===tmp_tran.jdata)&&(get_actual.data===tmp_tran.data);//包含不定态，要用===`   
测试结果： ` Compare SUCCESSFULLY` ![regs verdi](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/cda34a22-c2f2-41e4-af91-71f07a5cbdfb)
代码覆盖率：![regs coverage1](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/6613e90e-d6a8-4010-b2c9-3ef6fad7feb2)
功能覆盖率：![regs coverage2](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/22485eb0-5561-4012-a31b-a7f54b923e1b)
#### div
测试了除法模块有符号除法，无符号除法，有符号求余数，无符号求余数四种运算
测试结果： ` Compare SUCCESSFULLY` ![div verdi](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/aabb122d-c2d6-4465-a246-07d241b07050)
代码覆盖率：![div coverage](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/67d62e09-44c7-41ed-bf1f-63415ca237c9)
功能覆盖率：![div coverage2](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/51b4f8cb-66d9-4195-b372-597ab842dc23)
###### tiny_cpu
只测试指令执行和pc跳转功能 有两种思路：    
1.在transaction中直接生成随机指令      
会生成大量非法指令，很难达到覆盖率要求，例如使用15000条随机指令，代码覆盖率仅有60%，状态机覆盖率更是只有35%，所以有必要开发一个随机指令合法生成平台    
![core coverage](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/0ae7f55c-9e55-4e95-b23e-aedb3945af1f)
2.搭建随机指令生成平台
使用instr_gen平台生成可配置的指令流，包括RV32im全部55条指令，可配置各种指令的占比。     
使用指令生成平台控制指令，仅产生1500条指令便可达到很高的覆盖率(各指令权重均为1)，图中clint覆盖率较低是因为未考虑各种中断，而非指令不全：    
![core coverage1](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/7cd039fc-7208-4d30-a6bd-498b97e5d138)
![core coverage2](https://github.com/Yunshui-Bai/Yunshui_Bai/assets/141251120/fd3f2fab-0e99-47b4-8630-e233b6e5ae90)
















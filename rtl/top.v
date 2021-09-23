module top #(parameter memWords = 100)
(
    input clk, 
    input rst
);

wire [31:0] instr_mem_addr;
wire instr_mem_read;
wire [31:0] instr_mem_data_r;

wire [31:0] data_mem_addr;
wire data_mem_read;
wire [3:0] data_mem_write;
wire [31:0] data_mem_data_r;
wire [31:0] data_mem_data_w;

CPU riscv (
    .clk        (clk),
    .rst        (rst),
    .instr_mem_addr (instr_mem_addr),
    .instr_mem_read (instr_mem_read),
    .instr_mem_data_r (instr_mem_data_r),
    .data_mem_addr (data_mem_addr),
    .data_mem_read (data_mem_read),
    .data_mem_write (data_mem_write),
    .data_mem_data_r (data_mem_data_r),
    .data_mem_data_w (data_mem_data_w)
);  

ram #(.words(memWords))IM(
    .clk        (clk),
    .addr       (instr_mem_addr),
    .read       (instr_mem_read),
    .write      (4'b0),
    .DATA_IN    (32'b0),
    .DATA_OUT   (instr_mem_data_r)
);
ram #(.words(memWords)) DM(
    .clk        (clk),
    .addr       (data_mem_addr),
    .read       (data_mem_read),
    .write      (data_mem_write),
    .DATA_IN    (data_mem_data_w),
    .DATA_OUT   (data_mem_data_r)
);


endmodule

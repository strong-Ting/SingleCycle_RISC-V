module top #(parameter memWords = 100)
(
    input clk, 
    input rst
);

wire        instr_read;
wire [31:0] instr_addr;
wire [31:0] instr_out;
wire        data_read;
wire [3:0]  data_write;
wire [31:0] data_addr;
wire [31:0] data_in;
wire [31:0] data_out;

CPU i_CPU(
    .clk        (clk),
    .rst        (rst),
    .instr_read (instr_read),
    .instr_addr (instr_addr),
    .instr_out  (instr_out),
    .data_read  (data_read),
    .data_write (data_write),
    .data_addr  (data_addr),
    .data_in    (data_in),
    .data_out   (data_out)
);

ram #(.words(memWords))IM(
    .clk        (clk),
    .addr       (instr_addr),
    .read       (instr_read),
    .write      (4'b0),
    .DATA_IN    (32'b0),
    .DATA_OUT   (instr_out)
);
ram #(.words(memWords)) DM(
    .clk        (clk),
    .addr       (data_addr),
    .read       (data_read),
    .write      (data_write),
    .DATA_IN    (data_in),
    .DATA_OUT   (data_out)
);


endmodule

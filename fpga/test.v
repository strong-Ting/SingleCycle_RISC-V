module test;

reg clk = 1'd0;
reg [31:0] data_a,data_b;
wire [31:0] q_a,q_b;
reg [15:0] address_a,address_b;

initial begin
    $fsdbDumpfile("./wave.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
end

initial begin
    data_a = 32'd0;
    data_b = 32'd0;
    address_a = 32'd0;
    address_b = 32'd1;
    #100 $display("data_a: %h",q_a);
        // $display("data_b: %h",q_b);
    address_a = 32'd2;
    address_b = 32'd3;
    #100 $display("data_a: %h",q_a);
        // $display("data_b: %h",q_b);
    address_a = 32'd4;
    address_b = 32'd5;
    #100 $display("data_a: %h",q_a);
        // $display("data_b: %h",q_b);
    #100 $finish;
end

always #10 clk = ~clk;

RAM_1PORT	RAM_1PORT_inst (
	.address ( address_a ),
	.clock ( clk ),
	.data ( data_a ),
	.wren ( 1'b0 ),
	.q ( q_a )
	);



/*
RAM_2PORT	RAM_2PORT_inst (
	.address_a ( address_a ),
	.address_b ( address_b ),
	.clock ( clk ),
	.data_a ( data_a ),
	.data_b ( data_b ),
	.wren_a ( 1'd0 ),
	.wren_b ( 1'd0 ),
	.q_a ( q_a ),
	.q_b ( q_b )
);*/

endmodule
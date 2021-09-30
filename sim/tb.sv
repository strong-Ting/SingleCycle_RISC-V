`timescale 1ps/1ps
`define CYCLE 10
`define END 1000
//`define instr "add"
`define HexPath {"./asm/",`instr,"/",`instr,".hex"} 
`define SigPath {"./asm/",`instr,"/",`instr,".sig.dat.hex"} 

module test #(parameter Path = "./asm/add/add.hex");

reg clk,rst;
reg [31:0] resultMem [0:255];
top #(.memWords(100)) dut(
    .clk(clk),
    .rst(rst)
);

int fd,resultLen=0,i=0,error=0;
initial begin
    $readmemh(`HexPath,dut.IM.mem);
    $readmemh(`HexPath,dut.DM.mem);
    fd = $fopen(`SigPath,"r");
   // $display("***%s***",`instr);
    do begin
        $fscanf(fd,"%h",resultMem[resultLen]);
        if(!$feof(fd)) resultLen = resultLen +1;
    end while (!$feof(fd));
end

always #(`CYCLE/2) clk = ~clk;

initial begin
    `ifdef iverilog
        $dumpfile("./test.vcd");
        $dumpvars;
    `else
        $fsdbDumpfile("./test.fsdb");
        $fsdbDumpvars;
        $fsdbDumpMDA;
    `endif 
    
    #(`END) 
    for(i=0;i<resultLen;i++) begin
        if(resultMem[i] == dut.DM.mem[32'h40+i]) begin
            $display("correc, %h",resultMem[i]);
        end
        else begin
            $display("error , %d %h != %h (expected)",i,dut.DM.mem[32'h40+i],resultMem[i]);
            error = error + 1;
        end
    end
    if(error == 0) begin
        $display("****************************************************************");
        $display("***************sucessfull !!!!!!!*******************************");
        $display("****************************************************************");

    end
    else begin
        $display("****************************************************************");
        $display("********************Fail  !!!!!!!*******************************");
        $display("****************************************************************");
    end
    $finish;
end


initial begin
    clk = 1'd1;
    rst = 1'd0;
    #(`CYCLE) rst = 1'd1;
    #(`CYCLE+1) rst = 1'd0;
    #(`CYCLE);
end



endmodule
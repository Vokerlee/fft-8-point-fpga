`timescale 1ns / 1ps

module test_div_sqrt_2 #(parameter N = 4);

    reg [15 : 0] a = 16'b1011011000011100;
    wire [15 : 0] result;

    reg clk = 1'b0;
    reg rst = 1'b0;

    always begin
        #1 clk = ~clk; // clk
    end

    div_sqrt_2 #(.N(N)) div_sqrt_2_test(.in(a), .clk(clk), .rst(rst), .out(result));

    initial begin
        $dumpfile("div_sqrt_2_tb.vcd");
        $dumpvars;
        #16 $finish;
    end

endmodule

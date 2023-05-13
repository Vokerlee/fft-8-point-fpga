`timescale 1ns / 1ps

module test_div_sqrt_2 #(parameter N = 3);

    reg [7 : 0] a = 8'b000101100;
    wire [7 : 0] result;

    div_sqrt_2 #(.N(N)) div_sqrt_2_test(.in(a), .out(result));

    initial begin
        $dumpfile("div_sqrt_2_tb.vcd");
        $dumpvars;
        #16 $finish;
    end

endmodule

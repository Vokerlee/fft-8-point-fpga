`timescale 1ns / 1ps

module test_adder;

    reg [15:0] a = 16'b1011011000011100;
    reg [15:0] b = 16'b0110011000100111;

    wire [15:0] result;

    wire add_mode = 1'b0;

    adder adder_test(.a(a), .b(b), .add_mode(add_mode), .result(result));

    initial begin
        $dumpvars;
        $display("Test started...");
        #16 $finish;
    end

endmodule

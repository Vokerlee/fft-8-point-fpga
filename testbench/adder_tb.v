`timescale 1ns / 1ps

module test_adder #(parameter N = 4);

    reg [15 : 0] s1 = 16'b1011011000011100;
    reg [15 : 0] s2 = 16'b0110011000100111;

    wire [15 : 0] result;

    wire add_mode = 1'b0;

    adder #(.N(N)) adder_test(add_mode, s1, s2, result);

    initial begin
        $dumpfile("adder_tb.vcd");
        $dumpvars;
        #16 $finish;
    end

endmodule

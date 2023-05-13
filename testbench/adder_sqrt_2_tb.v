`timescale 1ns / 1ps

module test_adder_sqrt_2 #(parameter N = 4);

    reg [15 : 0] s1 = 16'b0011011000011100;
    reg [15 : 0] s2 = 16'b0100011000100111;

    wire [15 : 0] add_res;
    wire [15 : 0] sub_res;

    adder_sqrt_2 #(.N(N)) adder_sqrt_2_test(.in_1(s1), .in_2(s2), .add_sqrt_2(add_res),
                                            .sub_sqrt_2(sub_res));

    initial begin
        $dumpfile("adder_sqrt_2_tb.vcd");
        $dumpvars;
        #16 $finish;
    end

endmodule

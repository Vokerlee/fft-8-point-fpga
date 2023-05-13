`timescale 1ns / 1ps

module test_fft_stage_1 #(parameter N = 4);

    reg [15 : 0] s1 = 16'b1011011000011100;
    reg [15 : 0] s2 = 16'b0100110001001111;

    wire [15 : 0] out_real;
    wire [15 : 0] out_image;
    reg clk = 1'b0;
    reg rst = 1'b0;

    always begin
        #1 clk = ~clk; // clk
    end

    butterfly_2 #(.N(N)) butterfly_2_test(
        .in_1(s1), .in_2(s2), .clk(clk), .rst(rst),
        .out_real(out_real), .out_image(out_image));

    initial begin
        $dumpfile("fft_stage_1_tb.vcd");
        $dumpvars;
        #16 $finish;
    end

endmodule

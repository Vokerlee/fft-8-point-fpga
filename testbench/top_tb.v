`timescale 1 ns / 100 ps

module top #(parameter N = 3);

    reg clk = 1'b0;
    reg rst = 1'b0;

    always begin
        #2 clk = ~clk; // clk
    end

    reg  [2 : 0] regime = 3'b011;
    wire [7 : 0] out;

    wire [7 : 0] x1_real, x1_image, x2_real, x2_image,
                 x3_real, x3_image, x4_real, x4_image,
                 x5_real, x5_image, x6_real, x6_image,
                 x7_real, x7_image, x8_real, x8_image;

    signal_gen signal(regime, clk,
                      x1_real,  x2_real,  x3_real,  x4_real,  x5_real,  x6_real,  x7_real,  x8_real,
                      x1_image, x2_image, x3_image, x4_image, x5_image, x6_image, x7_image, x8_image);

    wire [7 : 0] y1_real, y1_image, y2_real, y2_image,
                 y3_real, y3_image, y4_real, y4_image,
                 y5_real, y5_image, y6_real, y6_image,
                 y7_real, y7_image, y8_real, y8_image;

    fft_8 #(.N(N)) fft_8_module(x1_real,  x2_real,  x3_real,  x4_real,  x5_real,  x6_real,  x7_real,  x8_real,
                                x1_image, x2_image, x3_image, x4_image, x5_image, x6_image, x7_image, x8_image,
                                y1_real,  y2_real,  y3_real,  y4_real,  y5_real,  y6_real,  y7_real,  y8_real,
                                y1_image, y2_image, y3_image, y4_image, y5_image, y6_image, y7_image, y8_image);

    shift_reg shift_online(y1_real, y2_real, y3_real, y4_real, y5_real, y6_real, y7_real, y8_real, clk, rst, out);

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;
        #100 $finish;
    end

endmodule

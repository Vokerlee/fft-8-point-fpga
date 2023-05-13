`timescale 1 ns / 100 ps

module test_fft_8 #(parameter N = 3);

    reg [7 : 0] x1_real  = 8'b00111001;
    reg [7 : 0] x1_image = 8'b00000000;

    reg [7 : 0] x2_real  = 8'b01010111;
    reg [7 : 0] x2_image = 8'b00000000;

    reg [7 : 0] x3_real  = 8'b01010111;
    reg [7 : 0] x3_image = 8'b00000000;

    reg [7 : 0] x4_real  = 8'b00111001;
    reg [7 : 0] x4_image = 8'b00000000;

    reg [7 : 0] x5_real  = 8'b01010111;
    reg [7 : 0] x5_image = 8'b00000000;

    reg [7 : 0] x6_real  = 8'b01010111;
    reg [7 : 0] x6_image = 8'b00000000;

    reg [7 : 0] x7_real  = 8'b00111001;
    reg [7 : 0] x7_image = 8'b00000000;

    reg [7 : 0] x8_real  = 8'b01010111;
    reg [7 : 0] x8_image = 8'b00000000;

    wire [7 : 0] y1_real, y1_image, y2_real, y2_image,
                 y3_real, y3_image, y4_real, y4_image,
                 y5_real, y5_image, y6_real, y6_image,
                 y7_real, y7_image, y8_real, y8_image;

    fft_8 #(.N(N)) fft_8_test(x1_real,  x2_real,  x3_real,  x4_real,  x5_real,  x6_real,  x7_real,  x8_real,
                              x1_image, x2_image, x3_image, x4_image, x5_image, x6_image, x7_image, x8_image, clk, rst,
                              y1_real,  y2_real,  y3_real,  y4_real,  y5_real,  y6_real,  y7_real,  y8_real,
                              y1_image, y2_image, y3_image, y4_image, y5_image, y6_image, y7_image, y8_image);

    initial begin
        $dumpfile("fft_8_tb.vcd");
        $dumpvars;
        #100 $finish;
    end


endmodule

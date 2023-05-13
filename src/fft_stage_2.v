module fft_stage2 #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7,
    input clk, rst,
    output [(2 ** N) - 1 : 0] t0,
                              tr1, ti1,
                              t2,
                              tr3, ti3,
                              t4,
                              tr5, ti5,
                              t6,
                              tr7, ti7
);
    wire [(2 ** N) - 1 : 0] y0, y1, y2, y3, y4, yr5, yi5, y6, yr7, yi7;

    butterfly_1 #(.N(N)) bf1_1(in_0, in_1, clk, rst, y0, y2);
    butterfly_3 #(.N(N)) bf2_1(in_1, in_3, clk, rst, tr1, tr3, ti1, ti3);
    butterfly_1 #(.N(N)) bf1_2(in_4, in_5, clk, rst, y4, y6);
    butterfly_3 #(.N(N)) bf2_2(in_6, in_7, clk, rst, yr5, yr7, yi5, yi7);

    // Synchronize the operations
    delay #(.N(N)) d1(y0, clk, rst, t0);
    delay #(.N(N)) d2(y2, clk, rst, t2);
    delay #(.N(N)) d3(in_2, clk, rst, y1);
    delay #(.N(N)) d4(in_3, clk, rst, y3);

    delay #(.N(N)) d5(y4, clk, rst, t4);
    delay #(.N(N)) d6(y6, clk, rst, t6);

    butterfly_2 #(.N(N)) div1(yr5, yi5, clk, rst, tr5, ti5);
    butterfly_2 #(.N(N)) div2(yr7, yi7, clk, rst, tr7, ti7);

endmodule

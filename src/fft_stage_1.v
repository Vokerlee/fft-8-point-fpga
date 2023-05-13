module fft_stage1 #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7,
    input clk, rst,
    output [(2 ** N) - 1 : 0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7
);
    butterfly_1 #(.N(N)) bf_1(in_0, in_4, clk, rst, out_0, out_1);
    butterfly_1 #(.N(N)) bf_2(in_2, in_6, clk, rst, out_2, out_3);
    butterfly_1 #(.N(N)) bf_3(in_1, in_5, clk, rst, out_4, out_5);
    butterfly_1 #(.N(N)) bf_4(in_3, in_7, clk, rst, out_6, out_7);

endmodule

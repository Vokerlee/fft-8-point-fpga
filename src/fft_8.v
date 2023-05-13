module fft_8 #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] in_0_r, in_1_r, in_2_r, in_3_r, in_4_r, in_5_r, in_6_r, in_7_r,
                             in_0_i, in_1_i, in_2_i, in_3_i, in_4_i, in_5_i, in_6_i, in_7_i,
    input clk, rst,
    output [(2 ** N) - 1 : 0] out_0_r, out_1_r, out_2_r, out_3_r, out_4_r, out_5_r, out_6_r, out_7_r,
                              out_0_i, out_1_i, out_2_i, out_3_i, out_4_i, out_5_i, out_6_i, out_7_i
);
    wire [(2 ** N) - 1 : 0] fft1_0_r, fft1_1_r, fft1_2_r, fft1_3_r, fft1_4_r, fft1_5_r, fft1_6_r, fft1_7_r,
                            fft1_0_i, fft1_1_i, fft1_2_i, fft1_3_i, fft1_4_i, fft1_5_i, fft1_6_i, fft1_7_i;

    wire [(2 ** N) - 1 : 0] fft2_0_r, fft2_1_r, fft2_2_r, fft2_3_r, fft2_4_r, fft2_5_r, fft2_6_r, fft2_7_r,
                            fft2_0_i, fft2_1_i, fft2_2_i, fft2_3_i, fft2_4_i, fft2_5_i, fft2_6_i, fft2_7_i;

    fft_stage_1 #(.N(N)) fs_1(in_0_r, in_1_r, in_2_r, in_3_r, in_4_r, in_5_r, in_6_r, in_7_r,
                              in_0_i, in_1_i, in_2_i, in_3_i, in_4_i, in_5_i, in_6_i, in_7_i, clk, rst,
                              fft1_0_r, fft1_1_r, fft1_2_r, fft1_3_r, fft1_4_r, fft1_5_r, fft1_6_r, fft1_7_r,
                              fft1_0_i, fft1_1_i, fft1_2_i, fft1_3_i, fft1_4_i, fft1_5_i, fft1_6_i, fft1_7_i);

    fft_stage_2 #(.N(N)) fs_2(fft1_0_r, fft1_1_r, fft1_2_r, fft1_3_r, fft1_4_r, fft1_5_r, fft1_6_r, fft1_7_r,
                              fft1_0_i, fft1_1_i, fft1_2_i, fft1_3_i, fft1_4_i, fft1_5_i, fft1_6_i, fft1_7_i, clk, rst,
                              fft2_0_r, fft2_1_r, fft2_2_r, fft2_3_r, fft2_4_r, fft2_5_r, fft2_6_r, fft2_7_r,
                              fft2_0_i, fft2_1_i, fft2_2_i, fft2_3_i, fft2_4_i, fft2_5_i, fft2_6_i, fft2_7_i);

    fft_stage_3 #(.N(N)) fs_3(fft2_0_r, fft2_1_r, fft2_2_r, fft2_3_r, fft2_4_r, fft2_5_r, fft2_6_r, fft2_7_r,
                              fft2_0_i, fft2_1_i, fft2_2_i, fft2_3_i, fft2_4_i, fft2_5_i, fft2_6_i, fft2_7_i, clk, rst,
                              out_0_r, out_1_r, out_2_r, out_3_r, out_4_r, out_5_r, out_6_r, out_7_r,
                              out_0_i, out_1_i, out_2_i, out_3_i, out_4_i, out_5_i, out_6_i, out_7_i);

endmodule

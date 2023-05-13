module fft_stage_1 #(parameter N = 4)
(
    input [(2 ** N) - 1 : 0] in_0_r, in_1_r, in_2_r, in_3_r, in_4_r, in_5_r, in_6_r, in_7_r,
                             in_0_i, in_1_i, in_2_i, in_3_i, in_4_i, in_5_i, in_6_i, in_7_i
    input clk, rst,
    output [(2 ** N) - 1 : 0] out_0_r, out_1_r, out_2_r, out_3_r, out_4_r, out_5_r, out_6_r, out_7_r,
                              out_0_i, out_1_i, out_2_i, out_3_i, out_4_i, out_5_i, out_6_i, out_7_i
);
    butterfly_1 #(.N(N)) bf_1(in_0_r,  in_0_i,  in_4_r,  in_4_i, clk, rst, 
                              out_0_r, out_0_i, out_1_r, out_1_i);
    butterfly_1 #(.N(N)) bf_2(in_2_r,  in_2_i,  in_6_r,  in_6_i, clk, rst, 
                              out_2_r, out_2_i, out_3_r, out_3_i);
    butterfly_1 #(.N(N)) bf_3(in_1_r,  in_1_i,  in_5_r,  in_5_i, clk, rst, 
                              out_4_r, out_4_i, out_5_r, out_5_i);
    butterfly_1 #(.N(N)) bf_4(in_3_r,  in_3_i,  in_7_r,  in_7_i, clk, rst, 
                              out_6_r, out_6_i, out_7_r, out_7_i);

endmodule

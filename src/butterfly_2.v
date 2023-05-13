module butterfly_2 #(parameter N = 3)
(
    input [(2 ** N) - 1 : 0] in_1_r, in_1_i, in_2_r, in_2_i,
    input clk, rst,
    output [(2 ** N) - 1 : 0] out_1_r, out_1_i, out_2_r, out_2_i
);
    wire [(2 ** N) - 1 : 0] tmp_add, tmp_sub;
    adder_sqrt_2 #(.N(N)) add_sq_1(in_2_i, in_2_r, clk, rst, tmp_add, tmp_sub);

    // out_1 = in_1 + (1 - i) / sqrt(2) * in_2
    adder #(.N(N)) add_1(1'b1, in_1_r, tmp_add, out_1_r);
    adder #(.N(N)) sub_1(1'b1, in_1_i, tmp_sub, out_1_i);

    // out_2 = in_1 - (1 - i) / sqrt(2) * in_2
    adder #(.N(N)) add_2(1'b0, in_1_r, tmp_add, out_2_r);
    adder #(.N(N)) sub_2(1'b0, in_1_i, tmp_sub, out_2_i);

endmodule

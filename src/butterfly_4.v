module butterfly_4 #(parameter N = 4)
(
    input  [(2 ** N) - 1 : 0] in_1_r,  in_1_i,  in_2_r,  in_2_i,
    output [(2 ** N) - 1 : 0] out_1_r, out_1_i, out_2_r, out_2_i
);
    wire [(2 ** N) - 1 : 0] tmp_add, tmp_sub;
    adder_sqrt_2 #(.N(N)) add_sq_1(in_2_r, in_2_i, tmp_add, tmp_sub);

    wire [(2 ** N) - 1 : 0] add_1_shift;
    wire [(2 ** N) - 1 : 0] sub_1_shift;
    wire [(2 ** N) - 1 : 0] add_2_shift;
    wire [(2 ** N) - 1 : 0] sub_2_shift;

    // out_1 = in_1 - (1 + i) / sqrt(2) * in_2
    adder #(.N(N)) sub_1(1'b0, in_1_r, tmp_sub, sub_1_shift);
    adder #(.N(N)) sub_2(1'b0, in_1_i, tmp_add, sub_2_shift);

    sar_n #(.N(N), .SHFT(1)) sar_1(sub_1_shift, out_1_r);
    sar_n #(.N(N), .SHFT(1)) sar_2(sub_2_shift, out_1_i);

    // out_2 = in_1 + (1 + i) / sqrt(2) * in_2
    adder #(.N(N)) add_1(1'b1, in_1_r, tmp_sub, add_1_shift);
    adder #(.N(N)) add_2(1'b1, in_1_i, tmp_add, add_2_shift);

    sar_n #(.N(N), .SHFT(1)) sar_3(add_1_shift, out_2_r);
    sar_n #(.N(N), .SHFT(1)) sar_4(add_2_shift, out_2_i);

endmodule

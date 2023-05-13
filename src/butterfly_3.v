module butterfly_3 #(parameter N = 3)
(
    input  [(2 ** N) - 1 : 0] in_1_r,  in_1_i,  in_2_r,  in_2_i,
    output [(2 ** N) - 1 : 0] out_1_r, out_1_i, out_2_r, out_2_i
);
    // out_1 = in_1 - i * in_2
    adder #(.N(N)) add_1(1'b1, in_1_r, in_2_i, out_1_r);
    adder #(.N(N)) sub_1(1'b0, in_1_i, in_2_r, out_1_i);

    // out_2 = in_1 + i * in_2
    adder #(.N(N)) add_2(1'b0, in_1_r, in_2_i, out_2_r);
    adder #(.N(N)) sub_2(1'b1, in_1_i, in_2_r, out_2_i);

endmodule
